Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 922A0719B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:48:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t79so61182095wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iEd1dbxbzXf97T3r4qrfz0QoNrKX+BM9N8FOQ9j2Xwo=;
	b=SXCUPZTNwk/w77LCTG71nVRtBmblQakcIxo0BE7RwWhigdQ87Uhtd6VuBvx59Nqc1M
	c59KINuV1sFnpeZixspbiTQ8vMdPp0W8/vNWLupy8OvEhzY9a81AzGtUpmTF3kRU1++d
	W5Z3VXVHeuZwEli+/DriTj50jA26CPvfkFxt6aOc82Te0yTz8hRaaBBayi/gWfCScLir
	EW3Fwq53ESxzwR5gJn+T5JySjgdXn3r8Efx3/HPSmFMXXz/jqm4VC6kx2RizGEuMXy44
	tsEATX0a7a2RURwHiFpMulewId/sxSb60hf2xei58rO26O/yMMULjyUkX5rei2kFJQQG
	eTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iEd1dbxbzXf97T3r4qrfz0QoNrKX+BM9N8FOQ9j2Xwo=;
	b=MUQOx/lkck2Z4ZuULM++xIbgTsMa1D0tLhHLdIWZbL5xIYzELO6Ngz+hqYr9HqwUGM
	gR/aKKxe48fjyiK3Ux1vLYDyl1gFDYAHFgKuNas+w8hFtv8hlJSGFeCrbK34hgowjO9d
	uRhFwVDXrqe+5ZWd646obvvJAmxobbjVkKJ22l+t3somU/WSRsuhVoHWExt4tM+eFHsa
	gCqKKUgbuij6ivKza1RSLEefWGDFIGHfte+pJ8utTLcHfydj2Z8PZ2hRhpUl6hOh5Jv4
	9k/YNyvDPNZdQ5nnuj7S/kzsEcaQqzavdUvNe2F6sK8vlVRb6zLnbrY4kl+zyl36gDBi
	AIOw==
X-Gm-Message-State: ABUngvd7JU+G6q6NdjBufuT/UPDmn224ANloSgmcw3wj7r/fE9mHUbWGdqdGRZP1VktUFq1B
X-Received: by 10.28.94.139 with SMTP id s133mr12642700wmb.1.1477932499960;
	Mon, 31 Oct 2016 09:48:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	18sm25667499wmp.24.2016.10.31.09.48.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 09:48:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:48:15 +0000
Message-Id: <1477932495-21204-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1477932495-21204-1-git-send-email-ross.burton@intel.com>
References: <1477932495-21204-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] slang: clean up options and dependencies
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
X-List-Received-Date: Mon, 31 Oct 2016 16:48:20 -0000

The AC_PATH_XTRA check for X11 headers is never actually used, so patch that out
and remove the options in EXTRA_OECONF.

Move pcre/png/zlib toggles to PACKAGECONFIG, retaining the behaviour that only
PCRE is enabled by default.

Add missing libiconv dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/slang/slang/no-x.patch | 14 ++++++++++++++
 meta/recipes-extended/slang/slang_2.3.0.bb   | 15 ++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/slang/slang/no-x.patch

diff --git a/meta/recipes-extended/slang/slang/no-x.patch b/meta/recipes-extended/slang/slang/no-x.patch
new file mode 100644
index 0000000..d7666bf
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/no-x.patch
@@ -0,0 +1,14 @@
+There's no need to check for the X libraries as the socket module doesn't use
+anything from X.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/autoconf/configure.ac b/autoconf/configure.ac
+index b61e974..a3e5db2 100644
+--- a/autoconf/configure.ac
++++ b/autoconf/configure.ac
+@@ -72,3 +71,0 @@ AC_SUBST(LIB_READLINE)
+-# For the socket module
+-AC_PATH_XTRA
+-
diff --git a/meta/recipes-extended/slang/slang_2.3.0.bb b/meta/recipes-extended/slang/slang_2.3.0.bb
index ce7b16a..52b2a63 100644
--- a/meta/recipes-extended/slang/slang_2.3.0.bb
+++ b/meta/recipes-extended/slang/slang_2.3.0.bb
@@ -9,7 +9,7 @@ to recode S-Lang procedures in C if you need to."
 
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
-DEPENDS = "pcre ncurses"
+DEPENDS = "ncurses virtual/libiconv"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
@@ -20,18 +20,23 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://fix-check-pcre.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
            file://0001-Fix-error-conflicting-types-for-posix_close.patch \
+           file://no-x.patch \
           "
+SRC_URI[md5sum] = "3bcc790460d52db1316c20395b7ac2f1"
+SRC_URI[sha256sum] = "f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129"
+
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
 
 inherit autotools-brokensep
-
 CLEANBROKEN = "1"
 
-SRC_URI[md5sum] = "3bcc790460d52db1316c20395b7ac2f1"
-SRC_URI[sha256sum] = "f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129"
+EXTRA_OECONF = "--without-onig"
 
-EXTRA_OECONF += " --without-z --without-png --without-onig --x-includes=${STAGING_DIR_HOST}/usr/include/X11 --x-libraries=${STAGING_DIR_HOST}/usr/lib"
+PACKAGECONFIG ??= "pcre"
+PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,pcre"
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
+PACKAGECONFIG[zlib] = "--with-z,--without-z,zlib"
 
 do_configure_prepend() {
     # slang keeps configure.ac and rest of autoconf files in autoconf/ directory
-- 
2.8.1


