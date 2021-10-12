X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <87a1664b-9997-9294-0bd8-0b803f9797fe@pr.hu>
Date: Tue, 12 Oct 2021 12:13:44 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 22/26] libpam: update 1.5.1 -> 1.5.2
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
 <20210908180125.103473-22-alex.kanavin@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <20210908180125.103473-22-alex.kanavin@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

On 2021. 09. 08. 20:01, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> Drop patches: issues fixed upstream.
> 
> Move .pc files to correct place as libpam is instructed to install them in /lib via
> --libdir.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../0001-Makefile.am-support-usrmage.patch    | 28 -------------------
>   ...space-Makefile.am-correctly-install-.patch | 28 -------------------
>   .../pam/{libpam_1.5.1.bb => libpam_1.5.2.bb}  |  7 +++--
>   3 files changed, 4 insertions(+), 59 deletions(-)
>   delete mode 100644 meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
>   delete mode 100644 meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
>   rename meta/recipes-extended/pam/{libpam_1.5.1.bb => libpam_1.5.2.bb} (96%)
> 
> diff --git a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
> deleted file mode 100644
> index 5c6bc92705..0000000000
> --- a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From c09e012590c1ec2d3b622b64f1bfc10a2286c9ea Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Wed, 6 Jan 2021 12:08:20 +0800
> -Subject: [PATCH] Makefile.am: support usrmage
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - modules/pam_namespace/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
> -index ddd5fc0..a1f1bec 100644
> ---- a/modules/pam_namespace/Makefile.am
> -+++ b/modules/pam_namespace/Makefile.am
> -@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
> - securelibdir = $(SECUREDIR)
> - secureconfdir = $(SCONFIGDIR)
> - namespaceddir = $(SCONFIGDIR)/namespace.d
> --servicedir = /lib/systemd/system
> -+servicedir = $(systemd_system_unitdir)
> -
> - AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
> -         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch b/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
> deleted file mode 100644
> index b41d1e5962..0000000000
> --- a/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From e2db4082f6b988f1d5803028e9e47aee5f3519ac Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Sun, 27 Dec 2020 00:30:45 +0100
> -Subject: [PATCH] modules/pam_namespace/Makefile.am: correctly install systemd
> - unit file
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - modules/pam_namespace/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
> -index 21e1b33..ddd5fc0 100644
> ---- a/modules/pam_namespace/Makefile.am
> -+++ b/modules/pam_namespace/Makefile.am
> -@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
> - securelibdir = $(SECUREDIR)
> - secureconfdir = $(SCONFIGDIR)
> - namespaceddir = $(SCONFIGDIR)/namespace.d
> --servicedir = $(prefix)/lib/systemd/system
> -+servicedir = /lib/systemd/system
> -
> - AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
> -         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
> ---
> -2.24.0
> -
> diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
> similarity index 96%
> rename from meta/recipes-extended/pam/libpam_1.5.1.bb
> rename to meta/recipes-extended/pam/libpam_1.5.2.bb
> index efcd27137f..a3c4a50cb3 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -21,18 +21,17 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
>              file://pam.d/common-session-noninteractive \
>              file://pam.d/other \
>              file://libpam-xtests.patch \
> -           file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
> -           file://0001-Makefile.am-support-usrmage.patch \
>              file://run-ptest \
>              file://pam-volatiles.conf \
>              "
>   
> -SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
> +SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
>   
>   DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
>   
>   EXTRA_OECONF = "--includedir=${includedir}/security \
>                   --libdir=${base_libdir} \
> +                --with-systemdunitdir=${systemd_system_unitdir} \
>                   --disable-nis \
>                   --disable-regenerate-docu \
>                   --disable-doc \
> @@ -148,6 +147,8 @@ do_install() {
>   	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>   		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
>   	fi
> +        install -d ${D}/${libdir}/
> +	mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/

This is broken with DISTRO_FEATURES "usrmerge".
mv complains that the src and dest are the same files.

Best regards,
Zoltán Böszörményi

>   }
>   
>   do_install_ptest() {
> 
> 
> 
> 
> 

