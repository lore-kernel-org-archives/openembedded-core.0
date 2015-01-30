Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E7E4560132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 10:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0UAPCe4031268; Fri, 30 Jan 2015 10:25:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dDU4lcpvN1Jx; Fri, 30 Jan 2015 10:25:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0UAOsQW031247
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Jan 2015 10:25:11 GMT
Message-ID: <1422613494.25715.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Wood <michael.g.wood@intel.com>
Date: Fri, 30 Jan 2015 10:24:54 +0000
In-Reply-To: <1422549369-23245-1-git-send-email-michael.g.wood@intel.com>
References: <1422549369-23245-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] report-error: Add a check for binary log file
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
X-List-Received-Date: Fri, 30 Jan 2015 10:25:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-01-29 at 16:36 +0000, Michael Wood wrote:
> Check to see if the log file is a binary. If it is do not try to submit
> it in our error-report.
> 
> [YOCTO #7263]
> 
> Signed-off-by: Michael Wood <michael.g.wood@intel.com>
> ---
>  meta/classes/report-error.bbclass | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 8b30422..101fe9b 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -24,6 +24,15 @@ def errorreport_savedata(e, newdata, file):
>          json.dump(newdata, f, indent=4, sort_keys=True)
>      return datafile
>  
> +def errorreport_testlogforbinary(data):
> +    for c in data:
> +      # If the data contains non visible character below 10 it's a binary
> +      if (ord(c) < 10):
> +        return True
> +
> +    return False
> +
> +
>  python errorreport_handler () {
>          import json
>  
> @@ -48,7 +57,13 @@ python errorreport_handler () {
>              taskdata['task'] = task
>              if log:
>                  logFile = open(log, 'r')
> -                taskdata['log'] = logFile.read()
> +                # Detect binary log output
> +                logdata = logFile.read()
> +                if  errorreport_testlogforbinary(logdata):
> +                    taskdata['log'] = "Log in binary format"
> +                else:
> +                    taskdata['log'] = logdata
> +
>                  logFile.close()
>              else:
>                  taskdata['log'] = "No Log"

I was thinking about this a bit more. How about we put a try/except
around the json code which sets taskdata['log'] = "Log in binary format"
if the original coding doesn't work for any reason? That way we should
catch any problem with the log?

Cheers,

Richard




