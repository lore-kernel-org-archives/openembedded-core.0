Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2394160F28
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:22:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 10:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="404151004"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 10:21:39 -0700
Message-ID: <1379352098.1285.146.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:21:38 -0700
In-Reply-To: <1379117343-29877-3-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-3-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 2/7] cdrtools-native: Update from 3.00 to 3.01a17
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
X-List-Received-Date: Mon, 16 Sep 2013 17:22:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 19:08 -0500, Jason Wessel wrote:
> The update is needed to support generation of EFI boot images that
> work with optical media.  Specifically the "-eltorito-platform efi"
> capability for mkisofs is needed.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  ...s-native_3.00.bb => cdrtools-native_3.01a17.bb} |   22 +++++++-------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>  rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.00.bb => cdrtools-native_3.01a17.bb} (47%)
> 
> diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> similarity index 47%
> rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
> rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> index 7e4c381..2ae3f4a 100644
> --- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
> +++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> @@ -5,26 +5,20 @@ SUMMARY = "A set of tools for CD recording, including cdrecord"
>  DESCRIPTION = "A set of tools for CD recording, including cdrecord"
>  HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
>  SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8d16123ffd39e649a5e4a6bc1de60e6d"
> -PR = "r0"
> +LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
>  
> -SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
> -           file://no_usr_src.patch"
> +SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
>  
> -SRC_URI[md5sum] = "f9fbab08fbd458b0d2312976d8c5f558"
> -SRC_URI[sha256sum] = "7f9cb64820055573b880f77b2f16662a512518336ba95ab49228a1617973423d"
> +SRC_URI[md5sum] = "4cef9db0cf15a770c52d65b00bbee2db"
> +SRC_URI[sha256sum] = "3d613965b213ad83e4be0ba2535e784901839ea4d11a20a2beb6765f0eb76dfa"
>  
> -inherit native
> +S = "${WORKDIR}/cdrtools-3.01"
>  
> -STAGE_TEMP = "${WORKDIR}/image-temp"
> +inherit native
>  
>  FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
>  
>  do_install() {
> -	install -d ${STAGE_TEMP}
> -	make install INS_BASE=${STAGE_TEMP}
> -
> -	install -d ${D}${bindir}/
> -	install ${STAGE_TEMP}/bin/* ${D}${bindir}/
> +	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
>  }

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



