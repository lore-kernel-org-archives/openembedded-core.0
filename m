Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6478D78DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:19:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y2-v6so6936423wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HeZDBrLhdzPCZBNhhbfcobA5sf/QvkoGm+Z+HqUSwDg=;
	b=yWaUCNbOElvc4JKB8RUxcJtRGSl7WU98QFJV269sYfm03sc+a3a09HqhC063Bsky2j
	yndvQHE00ZxDWb8ysHAfQOgr8fUQyMP2BFMj3E92jT8x+fSMIyDPHHCMFtIcoW+RHnkU
	i34Duq6CpV/rRKo+sfmemZi+Ez+uwN0k8XuKTiqi8lfq3PPl851lpq8N/6yLw7iZTXTl
	Q6KpqyVgpr57YF8VVoFdWoSQPtYM/TrH3wljd6JYdduQPZzylkYkepJgxxyTFAdWszha
	SPqupOWCAS4UIc0MgeOWVJRugkWPa4luC1/bPDW6k/avlFmS/wVLL6ftFHgvOHd5cyaG
	X1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HeZDBrLhdzPCZBNhhbfcobA5sf/QvkoGm+Z+HqUSwDg=;
	b=mxa5jxnSXxB2iOcj8F7lxvzOs+KpDO/lM5ZtwTUCf/6EWb87INNt47EhwTnD+LsJWF
	rDDgRFANiBFoOxEx4Mv4yr/G9fGmR86aVl21DtDURZC10N3hF1UJvVj46xkSgN/tSGYu
	jY6xWrkn+XjkLoAUCSDqTrl4VohaHzDgOh+2/mlM4rWsONzRRTT7AL7CyJfbrvwcV7Jt
	0+13JmYgYfSYiGf1NHQOrFd9UbRTi3rZIr3SH7Qy5xwllSLmPeAjio2qQEOmPk6GJ8Y9
	kLdcsCPJTapO60MGmLmHSNJjCMjqu9i1ATgFTpNZSB0enicIPjOGHMVghTaOI3n5yyiQ
	b1TQ==
X-Gm-Message-State: APzg51A9Dze3m4pzx2NIZAZ1+k7u80acTREC3fy/mTOlTg88K/yGZDb1
	9IlxDQhxAFematt7EgFYDCFM6xVFOYM=
X-Google-Smtp-Source: ANB0VdaaDbQV+y39OgfQr/D5X84fi5yUO5o2/BM4M1kcBvqeuqhf+eBOtTJgWd+/rPIVP/7jkumXMg==
X-Received: by 2002:a1c:3c85:: with SMTP id
	j127-v6mr21310171wma.124.1537373978439; 
	Wed, 19 Sep 2018 09:19:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e13-v6sm18181946wrt.76.2018.09.19.09.19.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 09:19:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 17:19:35 +0100
Message-Id: <20180919161935.2396-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gnupg: patch gnupg-native to allow path relocation
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
X-List-Received-Date: Wed, 19 Sep 2018 16:19:38 -0000

GnuPG hard-codes $bindir etc and uses them to find the helper binaries, such as
gpg-agent.  This breaks if gnupg-native is reused from sstate for a different
build directory and GPG signing of packages is required.

Patch in getenv() checks for gnupg-native when returning the hardcoded paths,
and create a wrapper script which overrides GNUPG_BINDIR. There are more paths
that can be overridden, but this one is sufficient to make GnuPG work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnupg/gnupg/relocate.patch | 81 +++++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.9.bb       |  7 ++-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/relocate.patch

diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
new file mode 100644
index 00000000000..87ec409ca31
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -0,0 +1,81 @@
+Allow the environment to override where gnupg looks for its own files. Useful in native builds.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/common/homedir.c b/common/homedir.c
+index e9e75d01e..19140aa0d 100644
+--- a/common/homedir.c
++++ b/common/homedir.c
+@@ -760,7 +760,7 @@ gnupg_socketdir (void)
+   if (!name)
+     {
+       unsigned int dummy;
+-      name = _gnupg_socketdir_internal (0, &dummy);
++      name = getenv("GNUPG_SOCKETDIR") ?: _gnupg_socketdir_internal (0, &dummy);
+     }
+ 
+   return name;
+@@ -786,7 +786,7 @@ gnupg_sysconfdir (void)
+     }
+   return name;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_SYSCONFDIR;
++  return getenv("GNUPG_SYSCONFDIR") ?: GNUPG_SYSCONFDIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -815,7 +815,7 @@ gnupg_bindir (void)
+   else
+     return rdir;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_BINDIR;
++  return getenv("GNUPG_BINDIR") ?: GNUPG_BINDIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -828,7 +828,7 @@ gnupg_libexecdir (void)
+ #ifdef HAVE_W32_SYSTEM
+   return gnupg_bindir ();
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_LIBEXECDIR;
++  return getenv("GNUPG_LIBEXECDIR") ?: GNUPG_LIBEXECDIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -842,7 +842,7 @@ gnupg_libdir (void)
+     name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
+   return name;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_LIBDIR;
++  return getenv("GNUPG_LIBDIR") ?: GNUPG_LIBDIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -856,7 +856,7 @@ gnupg_datadir (void)
+     name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
+   return name;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_DATADIR;
++  return getenv("GNUPG_DATADIR") ?: GNUPG_DATADIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -872,7 +872,7 @@ gnupg_localedir (void)
+                        NULL);
+   return name;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return LOCALEDIR;
++  return getenv("LOCALEDIR") ?: LOCALEDIR;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
+@@ -940,7 +940,7 @@ gnupg_cachedir (void)
+     }
+   return dir;
+ #else /*!HAVE_W32_SYSTEM*/
+-  return GNUPG_LOCALSTATEDIR "/cache/" PACKAGE_NAME;
++  return getenv("GNUPG_LOCALSTATEDIR") ?: GNUPG_LOCALSTATEDIR "/cache/" PACKAGE_NAME;
+ #endif /*!HAVE_W32_SYSTEM*/
+ }
+ 
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.9.bb b/meta/recipes-support/gnupg/gnupg_2.2.9.bb
index 4f815dff20d..b7d23b8d39f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.9.bb
@@ -15,7 +15,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
           "
-SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
+SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
+                                file://relocate.patch"
 
 
 SRC_URI[md5sum] = "52c895a81f514a65e08923736c38654a"
@@ -43,6 +44,10 @@ do_install_append() {
 	ln -sf gpgv2 ${D}${bindir}/gpgv
 }
 
+do_install_append_class-native() {
+	create_wrapper ${D}${bindir}/gpg2 GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
+}
+
 PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
-- 
2.11.0


