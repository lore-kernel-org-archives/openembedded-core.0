Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTX5-0007v8-H4
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:15:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2012 12:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186998867"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 12:04:03 -0700
Message-ID: <501194A3.6020506@linux.intel.com>
Date: Thu, 26 Jul 2012 12:04:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343218878-2088-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1343218878-2088-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] telepathy-glib: fix a build race
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
X-List-Received-Date: Thu, 26 Jul 2012 19:15:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 05:21 AM, Ross Burton wrote:
> [YOCTO #2462]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   ...Fix-a-race-in-_gen-reentrant-methods.list.patch |   42 ++++++++++++++++++++
>   .../telepathy/telepathy-glib_0.19.2.bb             |    5 ++-
>   2 files changed, 45 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
>
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch b/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
> new file mode 100644
> index 0000000..4f8ed2b
> --- /dev/null
> +++ b/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
> @@ -0,0 +1,42 @@
> +From 8ff62dc34961e997fb0224517aef0f12d455a82b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Wed, 25 Jul 2012 12:58:16 +0100
> +Subject: [PATCH] Fix a race in _gen/reentrant-methods.list
> +
> +Very occasionally, a parallel build will fail like this:
> +
> +| Making all in telepathy-glib
> +| make[2]: Entering directory `/buildarea1/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/telepathy-glib-0.19.2-r0/telepathy-glib-0.19.2/telepathy-glib'
> +| /bin/mkdir -p _gen
> +| ( cd . && cat versions/0.7.0.abi [...] versions/0.19.2.abi  ) | \
> +| 		/bin/grep '^tp_cli_.*_run_.*' > _gen/reentrant-methods.list.tmp
> +| /bin/sh: line 1: _gen/reentrant-methods.list.tmp: No such file or directory
> +| make[2]: *** [_gen/reentrant-methods.list] Error 1
> +
> +It's doing the mkdir and the subshell in parallel, when the mkdir should be done
> +first.  Add an explicit dependency on spec-stamp to reentrant-methods.list to
> +ensure the ordering.
> +
> +https://bugs.freedesktop.org/show_bug.cgi?id=52480
> +
> +Upstream-Status: Submitted
> +---
> + telepathy-glib/codegen.am |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/telepathy-glib/codegen.am b/telepathy-glib/codegen.am
> +index 26caaef..6ad3ec5 100644
> +--- a/telepathy-glib/codegen.am
> ++++ b/telepathy-glib/codegen.am
> +@@ -149,7 +149,7 @@ _gen/stable-spec.xml: stable-interfaces.xml _gen/stable-stamp $(tools_dir)/xincl
> + # Grab a list of re-entrant tp_cli_*_run_* methods we are committed to
> + # generating for backwards compatibility.
> + # grep --no-filename is not portable :-(
> +-_gen/reentrant-methods.list: $(ABI_LISTS) codegen.am
> ++_gen/reentrant-methods.list: _gen/spec-stamp $(ABI_LISTS) codegen.am
> + 	$(AM_V_GEN)( cd $(srcdir) && cat $(ABI_LISTS) ) | \
> + 		$(GREP) '^tp_cli_.*_run_.*' > $@.tmp
> + 	@mv $@.tmp $@
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
> index deba3bb..9dbc5be 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
> @@ -3,9 +3,10 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
>   HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
>   DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
>   LICENSE = "LGPLv2.1+"
> -PR = "r0"
> +PR = "r1"
>
> -SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
> +SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
> +           file://0001-Fix-a-race-in-_gen-reentrant-methods.list.patch"
>
>   SRC_URI[md5sum] = "af2b33c1215f189e637bd59cc9139255"
>   SRC_URI[sha256sum] = "7e3c313ed08e26339deb603a615cec62a370131075514439f79f473f92ab84c3"
>

Merged into OE-Core

Thanks	
	Sau!


