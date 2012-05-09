Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SSGam-0002yR-PR
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:46:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2012 16:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138854776"
Received: from unknown (HELO envy.home) ([10.255.13.57])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2012 16:36:54 -0700
Message-ID: <4FAAFF78.1040500@linux.intel.com>
Date: Wed, 09 May 2012 16:36:24 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336598125.git.nitin.a.kamble@intel.com>
	<43db6eddb847eef615f636bddf9be966fefe1a94.1336598125.git.nitin.a.kamble@intel.com>
In-Reply-To: <43db6eddb847eef615f636bddf9be966fefe1a94.1336598125.git.nitin.a.kamble@intel.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 1/1] eglibc: fix build with poky-tiny distro
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 23:46:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Nitin,

On 05/09/2012 02:20 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This fixes bug [YOCTO #2443]

Awesome!

Please include something about what the problem is and how the
backported patch addresses it. The bugzilla reference is required, but
it isn't sufficient. People need to be able to understand the problem
and the approach of the solution from the commit log.

Tested building an image for qemu with DISTRO="poky-tiny" I assume?

Thanks,

Darren

> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../eglibc_fix_findidx_parameters.patch            |   38 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    3 +-
>  2 files changed, 40 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch b/meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch
> new file mode 100644
> index 0000000..bbf4605
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch
> @@ -0,0 +1,38 @@
> +Upstream-Status: backport
> +
> +Imported patch from: http://www.eglibc.org/archives/patches/msg01124.html
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/05/09
> +
> +Index: libc/posix/xregex.c
> +===================================================================
> +--- libc.orig/posix/xregex.c
> ++++ libc/posix/xregex.c
> +@@ -2943,7 +2943,7 @@ PREFIX(regex_compile) (const char *ARG_P
> + 				  _NL_CURRENT (LC_COLLATE,
> + 					       _NL_COLLATE_INDIRECTWC);
> + 
> +-				idx = findidx ((const wint_t**)&cp);
> ++				idx = findidx ((const wint_t**)&cp, -1);
> + 				if (idx == 0 || cp < (wint_t*) str + c1)
> + 				  /* This is no valid character.  */
> + 				  FREE_STACK_RETURN (REG_ECOLLATE);
> +@@ -3392,7 +3392,7 @@ PREFIX(regex_compile) (const char *ARG_P
> + 			    indirect = (const int32_t *)
> + 			      _NL_CURRENT (LC_COLLATE, _NL_COLLATE_INDIRECTMB);
> + 
> +-			    idx = findidx (&cp);
> ++			    idx = findidx (&cp, -1);
> + 			    if (idx == 0 || cp < str + c1)
> + 			      /* This is no valid character.  */
> + 			      FREE_STACK_RETURN (REG_ECOLLATE);
> +@@ -6363,7 +6363,7 @@ byte_re_match_2_internal (struct re_patt
> + 		      }
> + 		    str_buf[i] = TRANSLATE(*(d+i));
> + 		    str_buf[i+1] = '\0'; /* sentinel */
> +-		    idx2 = findidx ((const wint_t**)&cp);
> ++		    idx2 = findidx ((const wint_t**)&cp, -1);
> + 		  }
> + 
> + 		/* Update d, however d will be incremented at
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
> index e61816d..6b6b55c 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV = "17386"
>  
>  DEPENDS += "gperf-native"
> -PR = "r8"
> +PR = "r9"
>  PR_append = "+svnr${SRCPV}"
>  
>  EGLIBC_BRANCH="eglibc-2_15"
> @@ -24,6 +24,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>             file://GLRO_dl_debug_mask.patch \
>             file://initgroups_keys.patch \
>             file://add-prefix-to-var.patch \
> +           file://eglibc_fix_findidx_parameters.patch \
>            "
>  LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


