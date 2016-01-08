Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id D28F675D4B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:38 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id r67so1591933qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4w5CMvu3fvkBXyr8XAfxH41yKi0+G+1/x7omTObkgW0=;
	b=S7kCTkXWzRbEdGpSgeenzExVvo7+WtsJWcBtVM3Gsli0ky97VVSMLK265Xgy1mXejv
	zYUi37wXBGYnO/L9OrU9LFJyti8bO2ITJRZD5T1dPBOTzjBC3bl3qBW31mOxFaJiuPsl
	Zu3duXTIXlijD8+c9LjwZ3whpwwaGYGwsAezXKKb7UoqlvWMsn+PmOka2IhH1lNv9/lH
	M/Jx5YP1QIyu6rXTVRrEK+ENHfsLYM0Z684kfReO1ajWxxv+YsBXg0EHnm81NRyrf6j3
	3AdzfNNYjlT9FZAdf0CzyvzdDH30frDIszf28EDJH2xWamcR5KvrxAyuFTaTQVrRAeUJ
	yAdQ==
X-Received: by 10.55.72.146 with SMTP id v140mr142805720qka.63.1452248379629; 
	Fri, 08 Jan 2016 02:19:39 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:46 +0000
Message-Id: <13c8be8e8556032889783afc0c642a61cda3db6e.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 18/53] guile: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../guile/files/remove_strcase_l_funcs.patch       | 38 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch

diff --git a/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch b/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
new file mode 100644
index 0000000..e7a06fe
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
@@ -0,0 +1,38 @@
+These unused functions cause build failures with uclibc since they reference __uclibc_locale_struct
+and this is exposed by uclibc API headers only if C locales are built, but for OE we build full locale
+support
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: guile-2.0.11/libguile/i18n.c
+===================================================================
+--- guile-2.0.11.orig/libguile/i18n.c
++++ guile-2.0.11/libguile/i18n.c
+@@ -851,27 +851,6 @@ str_downcase (register char *dst, regist
+   *dst = '\0';
+ }
+ 
+-#ifdef USE_GNU_LOCALE_API
+-static inline void
+-str_upcase_l (register char *dst, register const char *src,
+-	      scm_t_locale locale)
+-{
+-  for (; *src != '\0'; src++, dst++)
+-    *dst = toupper_l (*src, locale);
+-  *dst = '\0';
+-}
+-
+-static inline void
+-str_downcase_l (register char *dst, register const char *src,
+-		scm_t_locale locale)
+-{
+-  for (; *src != '\0'; src++, dst++)
+-    *dst = tolower_l (*src, locale);
+-  *dst = '\0';
+-}
+-#endif
+-
+-
+ SCM_DEFINE (scm_string_locale_lt, "string-locale<?", 2, 1, 0,
+ 	    (SCM s1, SCM s2, SCM locale),
+ 	    "Compare strings @var{s1} and @var{s2} in a locale-dependent way."
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index fa45008..413c81d 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://workaround-ice-ssa-corruption.patch \
            file://libguile-Makefile.am-hook.patch \
            file://libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch \
+           file://remove_strcase_l_funcs.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
@@ -50,7 +51,7 @@ EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix --without
 EXTRA_OECONF_append_class-target = " --with-libunistring-prefix=${STAGING_LIBDIR} \
                                      --with-libgmp-prefix=${STAGING_LIBDIR} \
                                      --with-libltdl-prefix=${STAGING_LIBDIR}"
-
+EXTRA_OECONF_append_libc-uclibc = " guile_cv_use_csqrt=no "
 do_configure_prepend() {
 	mkdir -p po
 }
-- 
2.7.0


