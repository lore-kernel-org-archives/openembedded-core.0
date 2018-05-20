Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 007E274CB9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 22:26:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2018 15:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,423,1520924400"; d="scan'208";a="40831043"
Received: from syadandx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.168.242])
	by fmsmga007.fm.intel.com with ESMTP; 20 May 2018 15:26:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
Date: Mon, 21 May 2018 10:26:19 +1200
Message-ID: <1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Sun, 20 May 2018 22:26:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Vignesh,

Thanks for the patch, a question below.

On Thursday, 17 May 2018 5:50:00 PM NZST Vignesh Rajendran wrote:
> The recipes which are using externalsrc method doesn't contain the
> debug sources in their -dbg packages.
> 
> Add a handling in copydebugsources function to copy the debugsources for
> externalsrc -dbg packages.
> 
> Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
> ---
>  meta/classes/externalsrc.bbclass |  3 +++
>  meta/classes/package.bbclass     | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index c9f5cf7..135670d 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -129,6 +129,9 @@ python () {
>              d.setVar('CONFIGURESTAMPFILE', configstamp)
>              d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
>              d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')
> +
> +	# set DEBUG_PREFIX_MAP to external source path
> +	d.appendVar("DEBUG_PREFIX_MAP", "-fdebug-prefix-map=${EXTERNALSRC}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")
>  }
>  
>  python externalsrc_configure_prefunc() {
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index edeffa9..f071a2e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
>          workdir = d.getVar("WORKDIR")
>          workparentdir = os.path.dirname(os.path.dirname(workdir))
>          workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
> +        externalsrc = d.getVar('EXTERNALSRC', True)
>  
>          # If build path exists in sourcefile, it means toolchain did not use
>          # -fdebug-prefix-map to compile
> @@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):
>          processdebugsrc += "fgrep -zw '%s' | "
>          # Remove prefix in the source paths
>          processdebugsrc += "sed 's#%s##g' | "
> -        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
> +        # handle external sources to provide sources in -dbg packages
> +        if externalsrc:
> +            localsrc_prefix = "/usr/src/debug/"
> +            processdebugsrc += "sed 's#%s/##g' | "
> +            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s/%s' 2>/dev/null)"
> +            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)
> +        else:
> +            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
> +            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
>  
> -        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
>          (retval, output) = oe.utils.getstatusoutput(cmd)
>          # Can "fail" if internal headers/transient sources are attempted
>          #if retval:
> 

Is there a way we can fix this without adding a reference to externalsrc in
package.bbclass?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



