Return-Path: <saul.wold@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BFBA97725D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 23:30:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 22 Feb 2016 15:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,486,1449561600"; d="scan'208";a="657423261"
Received: from jrwood-mobl1.amr.corp.intel.com ([10.252.197.13])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 15:30:01 -0800
Message-ID: <1456183794.19577.5.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Cristina Agurida <cristina-danielax.agurida@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 15:29:54 -0800
In-Reply-To: <1454588030-26081-1-git-send-email-cristina-danielax.agurida@intel.com>
References: <1454588030-26081-1-git-send-email-cristina-danielax.agurida@intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] oeqa/parselogs: Updated whitelist
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
X-List-Received-Date: Mon, 22 Feb 2016 23:30:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Ping, this does not appear to be in -next or ross/mut, any issues?

Sau!

On Thu, 2016-02-04 at 14:13 +0200, Cristina Agurida wrote:
> Moved an error to common, and whitelisted the BAR errors
> and ati module. Also the uvesafb related errors will be
> ignored in LSB images which do not have graphic interface.
> 
> Fix for [YOCTO #8387]
> Fix for [YOCTO #8590]
> Fix for [YOCTO #6820]
> Fix for [YOCTO #7897]
> 
> Signed-off-by: Lucian Musat <george.l.musat at intel.com>
> Signed-off-by: Cristina Agurida <cristina-danielax.agurida@intel.com>
> ---
>  meta/lib/oeqa/runtime/parselogs.py | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/parselogs.py
> b/meta/lib/oeqa/runtime/parselogs.py
> index 5a2d50f..44834ce 100644
> --- a/meta/lib/oeqa/runtime/parselogs.py
> +++ b/meta/lib/oeqa/runtime/parselogs.py
> @@ -38,8 +38,17 @@ common_errors = [
>      'Online check failed for',
>      'netlink init failed',
>      'Fast TSC calibration',
> +    "BAR 0-9",
> +    "Failed to load module \"ati\"",
> +    "controller can't do DEVSLP, turning off",
> +    "stmmac_dvr_probe: warning: cannot get CSR clock",
> +    "error: couldn\'t mount because of unsupported optional
> features",
>      ]
>  
> +video_related = [
> +    "uvesafb",
> +]
> +
>  x86_common = [
>      '[drm:psb_do_init] *ERROR* Debug is',
>      'wrong ELF class',
> @@ -99,11 +108,7 @@ ignore_errors = {
>          '(EE) Failed to load module psbdrv',
>          '(EE) open /dev/fb0: No such file or directory',
>          '(EE) AIGLX: reverting to software rendering',
> -        "controller can't do DEVSLP, turning off",
>          ] + x86_common,
> -    'intel-corei7-64' : [
> -        "controller can't do DEVSLP, turning off",
> -        ] + common_errors,
>      'crownbay' : x86_common,
>      'genericx86' : x86_common,
>      'genericx86-64' : x86_common,
> @@ -126,6 +131,10 @@ class ParseLogsTest(oeRuntimeTest):
>          self.ignore_errors = ignore_errors
>          self.log_locations = log_locations
>          self.msg = ""
> +        (is_lsb, location) = oeRuntimeTest.tc.target.run("which
> LSB_Test.sh")
> +        if is_lsb == 0:
> +            for machine in self.ignore_errors:
> +                self.ignore_errors[machine] =
> self.ignore_errors[machine] + video_related
>  
>      def getMachine(self):
>          return oeRuntimeTest.tc.d.getVar("MACHINE", True)
> @@ -200,6 +209,7 @@ class ParseLogsTest(oeRuntimeTest):
>              ignore_error = ignore_error.replace("[", "\[")
>              ignore_error = ignore_error.replace("]", "\]")
>              ignore_error = ignore_error.replace("*", "\*")
> +            ignore_error = ignore_error.replace("0-9", "[0-9]")
>              grepcmd += ignore_error+"|"
>          grepcmd = grepcmd[:-1]
>          grepcmd += "\'"
> -- 
> 2.1.4
> 

