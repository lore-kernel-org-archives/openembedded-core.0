Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76649788B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id h21so13932891wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AhxYYiNyeFZiOPVmB0gxoChlbZGspdA5kYVkMEbqFho=;
	b=WauozOGKmngTF2H1SKNPc9+IyOc0c58KcUk6/Z5LvGYQgBl6MvXs82PWQHWj35/dGm
	PKGc2GqEBDRtnPt/MgOIPELV6hLmftNKTwDtNluMMly6cPOp0TvMaHFVAsVSPKOEA3ep
	03m/9YY8g3ao64hnmhQT9L4RM7U3xkyMDHPtzQQ4VYwO76Yd8DRftai7lWiCPJKE09JI
	o5DI8JwFDb8VBCj8bFpEebKWzSuJTOi3dZJQOIDcB0gDXLN+b+lkdQTo28njWtwUt6vo
	5xVP9jHZdmyK8mWw33D2Cgf6iBvmksG8wSAJar3FiiRnn1L7gAGzmwb6VHPpvd7VF6Fs
	olGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AhxYYiNyeFZiOPVmB0gxoChlbZGspdA5kYVkMEbqFho=;
	b=TvSQroXNWA1nG43DTISK3ZDQM00fwRzUw01UX0gePE3cL4PdBAXCtM5m8b2xj//lWi
	AgKNbmSe4OZmAoESp0rv/JM40Gy/MjsIF7nPe5ungWADNVgYiSTQxcBBWT36j5dycwG7
	4NdqHFmVR+pdtxKz6TL4lIiP5gysXLA29gqG3LK0YRbx3L+bEUOpSHhy87tJDXk6a7X8
	iWj1G6LU90NJOqJXDGxSoStvTuDzN1sxzfIhd+hG0XX247HVC5jFcV3yhKTGjDmI7KNZ
	HpSf0lcOEOX7ho9mMy3wIHICUT+EA44D0Jz+OQMGaR+VU3pDgemPdKkzpq93PEzGpVCR
	norQ==
X-Gm-Message-State: AElRT7FFlBPyU7JS0ZqMq74czi/5/YV52pl1nMonbjAfMW4s4vSCHkPJ
	4JT14ZYYr+SyXssBc4/xnOWym/lB
X-Google-Smtp-Source: AG47ELuDmzZwHmmXKXkCRuVP7f13Y7Vfur89i6XFOiKPb4Y5V9poA+N4H87OLu/ll9xSjMjhqArtOg==
X-Received: by 10.28.32.202 with SMTP id g193mr2329234wmg.99.1519928804904;
	Thu, 01 Mar 2018 10:26:44 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:27 +0000
Message-Id: <20180301182634.20502-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 04/11] glibc: relocate locale paths in nativesdk
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:44 -0000

nativesdk is built with a specific prefix but this will be different at install
time, however glibc hard-codes the path to locale files. Expand these strings to 4K and move them to a magic segment which we can relocate when the SDK is installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glibc/glibc/relocate-locales.patch             | 55 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/relocate-locales.patch

diff --git a/meta/recipes-core/glibc/glibc/relocate-locales.patch b/meta/recipes-core/glibc/glibc/relocate-locales.patch
new file mode 100644
index 00000000000..2aea37f5cad
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/relocate-locales.patch
@@ -0,0 +1,55 @@
+The glibc locale path is hard-coded to the install prefix, but in SDKs we need
+to be able to relocate the binaries.  Expand the strings to 4K and put them in a
+magic segment that we can relocate at install time.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/locale/findlocale.c b/locale/findlocale.c
+index 872cadb5..da14fa39 100644
+--- a/locale/findlocale.c
++++ b/locale/findlocale.c
+@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
+    which are somehow addressed.  */
+ struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
+ 
+-const char _nl_default_locale_path[] attribute_hidden = COMPLOCALEDIR;
++char _nl_default_locale_path[4096] attribute_hidden __attribute__ ((section (".gccrelocprefix"))) = COMPLOCALEDIR;
+ 
+ /* Checks if the name is actually present, that is, not NULL and not
+    empty.  */
+@@ -167,7 +167,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
+ 
+       /* Nothing in the archive.  Set the default path to search below.  */
+       locale_path = _nl_default_locale_path;
+-      locale_path_len = sizeof _nl_default_locale_path;
++      locale_path_len = strlen(locale_path) + 1;
+     }
+   else
+     /* We really have to load some data.  First see whether the name is
+diff --git a/locale/localeinfo.h b/locale/localeinfo.h
+index 68822a63..537bc351 100644
+--- a/locale/localeinfo.h
++++ b/locale/localeinfo.h
+@@ -325,7 +325,7 @@ _nl_lookup_word (locale_t l, int category, int item)
+ }
+ 
+ /* Default search path if no LOCPATH environment variable.  */
+-extern const char _nl_default_locale_path[] attribute_hidden;
++extern char _nl_default_locale_path[4096] attribute_hidden;
+ 
+ /* Load the locale data for CATEGORY from the file specified by *NAME.
+    If *NAME is "", use environment variables as specified by POSIX, and
+diff --git a/locale/loadarchive.c b/locale/loadarchive.c
+index 516d30d8..792b37fb 100644
+--- a/locale/loadarchive.c
++++ b/locale/loadarchive.c
+@@ -42,7 +43,7 @@
+ 
+ 
+ /* Name of the locale archive file.  */
+-static const char archfname[] = COMPLOCALEDIR "/locale-archive";
++static const char archfname[4096] __attribute__ ((section (".gccrelocprefix"))) = COMPLOCALEDIR "/locale-archive";
+ 
+ /* Size of initial mapping window, optimal if large enough to
+    cover the header plus the initial locale.  */
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index b6b66250224..2434c061056 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -50,6 +50,7 @@ NATIVESDKFIXES_class-nativesdk = "\
            file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
            file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
            file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
+           file://relocate-locales.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


