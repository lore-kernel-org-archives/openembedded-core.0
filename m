Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 761AC731C3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:14 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id uo6so404039212pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4w5CMvu3fvkBXyr8XAfxH41yKi0+G+1/x7omTObkgW0=;
	b=GgJ5qzpaPCF+HS5up0UD7UR4k5bAS0mWnRKf4CAEc1BhTH+ipw0iO+y4lTUJet1Rcr
	otufg98Wh6In4rJY50y0BemDGUfW3rhln/jsgdRH0dVeORng5uXuqto3TILyH+Zakrm3
	8C3Qv84hAjDRROmr653G+sv//Cb7XXtt+inNkVpzQpQyfJWqMCsUybbobAN+mbOqXOBO
	bVQzAeYg/J88N3bhrFZYuRi22PxmLB2rLBomkrmxXhXqb0+Ws70kmi3rS8ttt/72ebRE
	EYIcAUPKmH61KvcLjEExwOTP2nAKb3jgabvIM+IyLMEz3SGIR+Ld368mICcASZBBzNsy
	woUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4w5CMvu3fvkBXyr8XAfxH41yKi0+G+1/x7omTObkgW0=;
	b=VXHs32Cjjz6aZAyuZ/iPVzG6mXF01qYOsxvPddGEuGPYbaPRM3mrEPf+pDvy6TPaV0
	EAuPrWDEujxnsLz9naA9rDlEuQBb5hKj8DnxhwEyXitmVK1mE7JkvKiTVyQyfWs7ccjC
	81Py6Mb3AaMo3XfdG7wx362DDl71G9w2AvoIy4PyDgw+qP3fivRY/H0Y4o3OUQm3wwb0
	wbT6c1ktLygwk+Iq748OuTHeSggYRIZproqT5qwFO55TQI5BSXmw6DtFoIsPp9E7V+2j
	ysUSfYOsgYi64Zgu0zPUQ8qlkJzT/A9Hd8AJkJLXoj0Z8vmZKLgSybmurayuG4SNjsY3
	3qVw==
X-Gm-Message-State: ALoCoQkqP7/OzGsp04Ix2IEZLQf0CXCkhYBDLAZbUrKt043jNeUaiclF3gDbji1S7uUGpIWiOuDXQK0HZepg4zgSs0dPGVD65A==
X-Received: by 10.66.190.66 with SMTP id go2mr28997629pac.114.1453030635843;
	Sun, 17 Jan 2016 03:37:15 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:50 -0800
Message-Id: <05a283742405196fdad5797b994b01bacc2a4477.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 17/73] guile: Fix build with uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:15 -0000

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


