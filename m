Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B356C60621
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 18:23:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2016 11:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; d="scan'208";a="1047469115"
Received: from bitbang.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2016 11:23:54 -0700
To: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>,
	openembedded-core@lists.openembedded.org
References: <20160908092601.7588-1-pidge@toganlabs.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <55a75835-a8ab-a020-1c7e-2cbd5231fa2f@linux.intel.com>
Date: Thu, 8 Sep 2016 11:23:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160908092601.7588-1-pidge@toganlabs.com>
Subject: Re: [RFC][PATCH] report-error.bbclass: Add support for autosending
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
X-List-Received-Date: Thu, 08 Sep 2016 18:23:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2016 02:26 AM, Elizabeth 'pidge' Flanagan wrote:
> This commit pulls and extends the functionality of .oe-error-report into
> local.conf. It maintains the functionality of .oe-error-report.
>
> It also enables report-error to automatically send error reports to a
> specified error report server. This patch enables infrastructure ppl to
> set development teams up so that we can gather error metrics automatically.
>
> This relies on a new set of variables:
>
> REPORTERROR[autosend]="yes|no|ask"
> REPORTERROR[user]=username
> REPORTERROR[email]=email
> REPORTERROR[server]=error-report-web instance
>
> For autosend yes and no are pretty self explainatory. ask does not pass
> the -y flag to send-error-report, thus enabling the end user to review
> the report prior to submission.
>
> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
>  meta/classes/report-error.bbclass | 41 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 82b5bcd..909adf0 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -85,10 +85,47 @@ python errorreport_handler () {
>              bb.utils.unlockfile(lock)
>              failures = jsondata['failures']
>              if(len(failures) > 0):
> +
>                  filename = "error_report_" + e.data.getVar("BUILDNAME", True)+".txt"
>                  datafile = errorreport_savedata(e, jsondata, filename)
> -                bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
> -                bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
> +
> +                cmd_s = "send-error-report %s" % datafile
> +                response_s = "The errors for this build are stored in %s\n" % datafile
> +                sendit = False
> +
> +                autosend = e.data.getVarFlag("REPORTERROR","autosend")
> +                user = e.data.getVarFlag("REPORTERROR","user")
> +                email = e.data.getVarFlag("REPORTERROR","email")
> +                server = e.data.getVarFlag("REPORTERROR","server")
> +
> +                if user is not None:
> +                    cmd_s += " -n %s" % user
> +                if email is not None:
> +                    cmd_s += " -e %s" % email
> +                if server is not None:
> +                    cmd_s += " -s %s" % server
> +
> +                if autosend is not None:
> +                    if autosend == "yes":
> +                        response_s += "The errors for this build are set to automatically be sent.\n"
> +                        cmd_s += " -y"
> +                        sendit = True
> +                    elif autosend == "ask":
> +                        response_s += "The errors for this build are set to automatically be sent.\n"
> +                        sendit = True
> +                elif autosend is None:
> +                        response_s += "You can send the errors to a reports server by running:\n  %s\n" % cmd_s
> +                elif e.data.getVarFlags('REPORTERROR') is None:

The last elif will never be executed.

> +                        response_s += "You can send the errors to a reports server by running:\n  %s [-s server]\n" % cmd_s
> +                        response_s += "The contents of these logs will be posted in public if you use the above command with the default server.\n \
> +                             Please ensure you remove any identifying or proprietary information when prompted before sending.\n"
> +
> +                bb.note(response_s)
> +
> +                if sendit == True:
> +                    import shlex, subprocess
> +                    args = shlex.split(cmd_s)
> +                    subprocess.call(args)
>  }
>
>  addhandler errorreport_handler
>


