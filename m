Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEtC-0002Rb-FU
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:40:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 11:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97531328"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 11:32:35 -0800
Message-ID: <4F15CCD3.3010209@linux.intel.com>
Date: Tue, 17 Jan 2012 11:32:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Tue, 17 Jan 2012 19:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 11:51 AM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> For target, both base_libdir and libdir in sysroot can be used, as we pass
> --sysroot to the toolchain. For native, we don't do this, and we also only add
> -L<sysroot>/${libdir}, not -L<sysroot>/${base_libdir}, resulting in other
> native recipes (like readline-native) failing to find the ncurses libraries.
>
> readline-native only built successfully on hosts where it could fall back to
> their ncurses/termcap rather than the one in the sysroot.
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 8321d7b..43303b7 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
>   SECTION = "libs"
>   DEPENDS = "ncurses-native"
>   DEPENDS_virtclass-native = ""
> -INC_PR = "r3"
> +INC_PR = "r4"
>
>   inherit autotools binconfig multilib_header
>
> @@ -26,8 +26,8 @@ ENABLE_WIDEC ?= "true"
>   # builds.
>   BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>
> -# tic from the -native build cannot run without setting this explicitly
> -BUILD_LDFLAGS_virtclass-native += "-Wl,-rpath,${base_libdir}"
> +# natives don't generally look in base_libdir
> +base_libdir_virtclass-native = "${libdir}"
>
>   # Helper function for do_configure to allow multiple configurations
>   # $1 the directory to run configure in
Merged into OE-Core along with Enrico's Patch.

Thanks
	Sau!


