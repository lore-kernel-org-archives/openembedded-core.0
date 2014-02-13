Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFA06BA1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 23:37:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DNbJWN021960; Thu, 13 Feb 2014 23:37:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sx_sZa01IbTS; Thu, 13 Feb 2014 23:37:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DNbCeb021952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 23:37:13 GMT
Message-ID: <1392334626.14081.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreea Proca <andreea.b.proca@intel.com>
Date: Thu, 13 Feb 2014 23:37:06 +0000
In-Reply-To: <a4ffa9d1c2f040a1b78b5cbfa92ee7ad9e3402e0.1392303990.git.andreea.b.proca@intel.com>
References: <cover.1392303990.git.andreea.b.proca@intel.com>
	<a4ffa9d1c2f040a1b78b5cbfa92ee7ad9e3402e0.1392303990.git.andreea.b.proca@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] report-error.bbclass: new class to save build information when errors occur
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 23:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-13 at 17:28 +0200, Andreea Proca wrote:
> Class is used to save data about errors after every task that failed.
> Debug data is saved in json files in ERROR_REPORT_DIR (defaults to tmp/log/error-report).
> To use this class one has to add INHERIT += "report-error" to local.conf.
> 
> scripts/send-error-report is a simple script that sends the json file
> to a HTTP server that collects data (git://git.yoctoproject.org/error-report-web
> is a Django web interface that can be used to receive and visualize
> the error reports). The script will give you an URL where you can
> find your report.
> 
> Signed-off-by: Andreea Proca <andreea.b.proca@intel.com>
> ---
>  meta/classes/report-error.bbclass |   67 +++++++++++++++++++++++++++++++
>  scripts/send-error-report         |   78 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 meta/classes/report-error.bbclass
>  create mode 100755 scripts/send-error-report
> 
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> new file mode 100644
> index 0000000..149b36c
> --- /dev/null
> +++ b/meta/classes/report-error.bbclass
> @@ -0,0 +1,67 @@
> +#
> +# Collects debug information in order to create error report files.
> +#
> +# Copyright (C) 2013 Intel Corporation
> +# Author: Andreea Brandusa Proca <andreea.b.proca@intel.com>
> +#
> +# Licensed under the MIT license, see COPYING.MIT for details
> +
> +ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
> +
> +def getdata(e):
> +    logpath = e.data.getVar('ERR_REPORT_DIR', True)
> +    datafile = os.path.join(logpath, "error-report.txt")
> +    f = open(datafile, "r")
> +    data = f.read()
> +    f.close()
> +    return data
> +
> +def savedata(e, newdata, file):
> +    import json
> +    logpath = e.data.getVar('ERR_REPORT_DIR', True)
> +    bb.utils.mkdirhier(logpath)
> +    datafile = os.path.join(logpath, file)
> +    f = open(datafile, "w")
> +    json.dump(newdata, f, indent=4, sort_keys=True)
> +    f.close()
> +    return datafile

Since these functions will end up in the main namespace, could we prefix
them so something like errorreport_getdata and errorreport_savedata?
This makes it clearer when you look at the names out of context of this
class.


> +python report () {
> +        import os, re, sys, json
> +
> +        if isinstance(e, bb.event.BuildStarted):
> +            data = {}
> +            machine = e.data.getVar("MACHINE")
> +            data['machine'] = machine
> +            data['build_sys'] = e.data.getVar("BUILD_SYS", True)
> +            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING")
> +            data['distro'] = e.data.getVar("DISTRO")
> +            data['target_sys'] = e.data.getVar("TARGET_SYS", True)
> +            data['failures'] = []
> +            data['component'] = e.getPkgs()[0]
> +            data['branch_commit'] = base_detect_branch(e.data) + ": " + base_detect_revision(e.data)
> +            savedata(e, data, "error-report.txt")
> +
> +        elif isinstance(e, bb.build.TaskFailed):
> +            task = e.task
> +            taskdata={}
> +            log = e.data.getVar('BB_LOGFILE', True)
> +            logFile = open(log, 'r')
> +            taskdata['package'] = e.data.expand("${PF}")
> +            taskdata['task'] = task
> +            taskdata['log'] = logFile.read()
> +            logFile.close()
> +            jsondata = json.loads(getdata(e))
> +            jsondata['failures'].append(taskdata)
> +            savedata(e, jsondata, "error-report.txt")
> +
> +        elif isinstance(e, bb.event.BuildCompleted):
> +            jsondata = json.loads(getdata(e))
> +            failures = jsondata['failures']
> +            if(len(failures) > 0):
> +                filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
> +                datafile = savedata(e, jsondata, filename)
> +                bb.note("The errors of this build are stored in: %s. You can send the errors to an upstream server by running: send-error-report %s [server]" % (datafile, datafile))
> +}
> +
> +addhandler report

Could you name this something like errorreport_handler for the same
reason as the functions and add an eventmask:

errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed"

which means that handler only gets the events it is interested in. I
suspect this syntax was added after you started work on this code but it
would be nice to add.

I'm really looking forward to seeing this in action!

Cheers,

Richard

> diff --git a/scripts/send-error-report b/scripts/send-error-report
> new file mode 100755
> index 0000000..0d85776
> --- /dev/null
> +++ b/scripts/send-error-report
> @@ -0,0 +1,78 @@
> +#!/usr/bin/env python
> +
> +# Sends an error report (if the report-error class was enabled) to a remote server.
> +#
> +# Copyright (C) 2013 Intel Corporation
> +# Author: Andreea Proca <andreea.b.proca@intel.com>
> +
> +
> +
> +import httplib, urllib, os, sys, json
> +
> +
> +def sendData(json_file, server):
> +
> +    if os.path.isfile(json_file):
> +
> +        home = os.path.expanduser("~")
> +        userfile = os.path.join(home, ".oe-send-error")
> +        if os.path.isfile(userfile):
> +            with open(userfile) as g:
> +                username = g.readline()
> +                email = g.readline()
> +        else:
> +            print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
> +            username = raw_input("Name: ")
> +            email = raw_input("E-mail (not required): ")
> +            if len(username) > 0 and len(username) < 50:
> +                with open(userfile, "w") as g:
> +                    g.write(username + "\n")
> +                    g.write(email + "\n")
> +            else:
> +                print("Invalid inputs, try again.")
> +                return
> +
> +        with open(json_file) as f:
> +            data = f.read()
> +
> +        try:
> +            jsondata = json.loads(data)
> +            jsondata['username'] = username.strip()
> +            jsondata['email'] = email.strip()
> +            data = json.dumps(jsondata, indent=4, sort_keys=True)
> +        except:
> +            print("Invalid json data")
> +            return
> +
> +        try:
> +            params = urllib.urlencode({'data': data})
> +            headers = {"Content-type": "application/json"}
> +            conn = httplib.HTTPConnection(server)
> +            conn.request("POST", "/ClientPost/", params, headers)
> +            response = conn.getresponse()
> +            print response.status, response.reason
> +            res = response.read()
> +            if response.status == 200:
> +                print res
> +            else:
> +                print("There was a problem submiting your data")
> +            conn.close()
> +        except:
> +                print("Server connection failed")
> +
> +    else:
> +        print("No data file found.")
> +
> +
> +if __name__ == '__main__':
> +    print ("\nSends an error report (if the report-error class was enabled) to a remote server.")
> +    if len(sys.argv) < 2:
> +        print("\nThis scripts sends the contents of a file to an upstream server.")
> +        print("\nUsage: send-error-report <error_fileName> [server]")
> +        print("\nIf this is the first when sending a report you'll be asked for your name and optionally your email address.")
> +        print("They will be associated with your report.\n")
> +
> +    elif len(sys.argv) == 3:
> +        sendData(sys.argv[1], sys.argv[2])
> +    else:
> +        sendData(sys.argv[1], "localhost:8000")



