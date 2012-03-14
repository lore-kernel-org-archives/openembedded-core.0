Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7pif-000275-MW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:02:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 07:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128914256"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 07:53:43 -0700
Message-ID: <4F60B0CB.3090504@linux.intel.com>
Date: Wed, 14 Mar 2012 07:52:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<22f0c46dcba251287bcc3848c1537ad943c53788.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <22f0c46dcba251287bcc3848c1537ad943c53788.1331685330.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.3.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 5/6] ncurses: fix build when ENABLE_WIDEC is not set
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
X-List-Received-Date: Wed, 14 Mar 2012 15:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/13/2012 05:36 PM, Paul Eggleton wrote:
> If wide character support is disabled (as it is with poky-tiny, for
> example) then we won't have libncursesw.so.*, so skip moving these files
> in that case. (Fixes a regression introduced in OE-Core revision
> ccd370ab147b78de7a5bd74818f755f4d3ca6d81).
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Perfect, thanks Paul. Poky-tiny is now on the Yocto autobuilder which
should help catch when things like this creep in going forward.

--
Darren

> ---
>  meta/recipes-core/ncurses/ncurses.inc |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index e450868..fe2c3e4 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
>  SECTION = "libs"
>  DEPENDS = "ncurses-native"
>  DEPENDS_virtclass-native = ""
> -INC_PR = "r5"
> +INC_PR = "r6"
>  
>  inherit autotools binconfig multilib_header
>  
> @@ -185,7 +185,8 @@ shell_do_install() {
>              # case will skip this code
>              mkdir ${D}${base_libdir}
>              mv ${D}${libdir}/libncurses.so.* ${D}${base_libdir}
> -            mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
> +            ! ${ENABLE_WIDEC} || \
> +                mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
>  
>              mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
>              rm ${D}${libdir}/libtinfo.so

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


