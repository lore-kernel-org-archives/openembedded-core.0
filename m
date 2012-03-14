Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7pnW-0002II-LW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:07:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 07:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117629676"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2012 07:58:40 -0700
Message-ID: <4F60B1F4.4040705@linux.intel.com>
Date: Wed, 14 Mar 2012 07:57:56 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<78b7df910bf1d5d25f5cc637a15c8e867d7bd712.1331684953.git.scott.a.garman@intel.com>
In-Reply-To: <78b7df910bf1d5d25f5cc637a15c8e867d7bd712.1331684953.git.scott.a.garman@intel.com>
X-Enigmail-Version: 1.3.5
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/13/2012 05:31 PM, Scott Garman wrote:
> The recent move of some of the ncurses libraries to base_libdir
> does not work with our automatic library packaging, so this
> explicity creates packages for libncurses, libncursesw, and
> libtinfo.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc |   18 ++++++++++++++++--
>  1 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index e450868..155c0bd 100644
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
> @@ -220,6 +220,9 @@ pkg_prerm_ncurses-tools () {
>  BBCLASSEXTEND = "native nativesdk"
>  
>  PACKAGES += " \
> +  ${PN}-libncurses \
> +  ${PN}-libncursesw \

This one needs to be dependent on ENABLE_WIDEC

> +  ${PN}-libtinfo \
>    ${PN}-tools \
>    ${PN}-terminfo \
>    ${PN}-terminfo-base \
> @@ -231,7 +234,18 @@ FILES_${PN} = "\
>    ${bindir}/ncurses5-config \
>    ${bindir}/ncursesw5-config \
>    ${datadir}/tabset \
> -  ${base_libdir}/* \
> +"
> +
> +FILES_${PN}-libncurses = "\
> +  ${base_libdir}/libncurses.so.* \
> +"
> +
> +FILES_${PN}-libncursesw = "\
> +  ${base_libdir}/libncursesw.so.* \
> +"

This file doesn't exist if !ENABLE_WIDEC (which is the case with
poky-tiny for example).

> +
> +FILES_${PN}-libtinfo = "\
> +  ${base_libdir}/libtinfo.so.* \
>  "
>  
>  # This keeps only tput/tset in ncurses

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


