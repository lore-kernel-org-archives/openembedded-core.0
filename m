Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 537C66108B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:28:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r7so232104wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lOrmFB281xHeDd+b5pP1XOb28o3odikjIH33kuDtOfk=;
	b=eq+BhS+nQM0+dbxWtTRbLNCkfUt0R9ZGvltwvK8HQMAtigSykmqCbn+qKQCajLQ/Cp
	y9h0fOmsxsjq+Il6PE8XbeWXMBx/qJqhEO/L8Ws6gnkSvRGPgPvFIEth6uykVmGeaC+j
	ea4DmHIM3gUPn869bDbf7LeK6mk6vqeekU2sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lOrmFB281xHeDd+b5pP1XOb28o3odikjIH33kuDtOfk=;
	b=CHzhDfCgVK3UplcAvYlrS9jHKC1kYJXVkX8FxwzAFT3QC2HTkKhJIuU7YU+lhqoRls
	u4/q8D0JZ4i/2vpSkqVUZOuSFtfakggS0Pw21AC/3V24Sht81EfZocR2baXkIANIhT/Y
	vtFgP2dozoXMFzYZer3XMjoUVmn+/kqqIJkFg/ypYpO0QysJW9HMzPYTrEHRM3f1lfcF
	fsRqGLcSP3gFu9KQtrZ0MOTOjYo6noJfZ9TACcaJQcVc79sXpMRVGaCXr3xv+cupHtTG
	hWNzk614C0BHkBrVoPOKrb3CMX3Gw+FpFYd0NaKSW6LKb2Ij1uxjnTDe+q7YHG+nAYFW
	WxoA==
X-Gm-Message-State: ANhLgQ0QgUnDA/Q1Vg5M5sb4rNJJUfnDU6iE1xBO+z5/AMS2H+44dApS
	G8ioMLOCDXbsLT2WLLEzEkHzb/thruE=
X-Google-Smtp-Source: ADFU+vutk08O+fL6uROzaX0Bxwh6l9PfP3xzgVu0PA4z5dj1dSvHXS2lMInndaf+skdPrCZuesq7ww==
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr252199wrs.294.1583882899530; 
	Tue, 10 Mar 2020 16:28:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c85sm6254460wmd.48.2020.03.10.16.28.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:28:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:28:13 +0000
Message-Id: <20200310232814.48572-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/6] glibc: Update nativesdk locale relocation patch
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
X-List-Received-Date: Tue, 10 Mar 2020 23:28:19 -0000
Content-Transfer-Encoding: 8bit

The locale binary reported incorrect locale lists in relocated toolchains
as some path references were not relocated by this patch. Fix this missing
relocations so the locale binary correctly reports the locales.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Make-relocatable-install-for-locales.patch | 62 ++++++++++++++-----
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index d9985c2fdc8..27cd17cdcdf 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -17,11 +17,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  locale/localeinfo.h  | 2 +-
  3 files changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 9cd3b71a6d..84272310e0 100644
---- a/locale/findlocale.c
-+++ b/locale/findlocale.c
-@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
+Index: git/locale/findlocale.c
+===================================================================
+--- git.orig/locale/findlocale.c
++++ git/locale/findlocale.c
+@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attr
     which are somehow addressed.  */
  struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
  
@@ -30,7 +30,7 @@ index 9cd3b71a6d..84272310e0 100644
  
  /* Checks if the name is actually present, that is, not NULL and not
     empty.  */
-@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
+@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path
  
        /* Nothing in the archive.  Set the default path to search below.  */
        locale_path = _nl_default_locale_path;
@@ -39,10 +39,10 @@ index 9cd3b71a6d..84272310e0 100644
      }
    else
      /* We really have to load some data.  First see whether the name is
-diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index ba0fe45648..9737fd4cda 100644
---- a/locale/loadarchive.c
-+++ b/locale/loadarchive.c
+Index: git/locale/loadarchive.c
+===================================================================
+--- git.orig/locale/loadarchive.c
++++ git/locale/loadarchive.c
 @@ -42,7 +42,7 @@
  
  
@@ -52,11 +52,11 @@ index ba0fe45648..9737fd4cda 100644
  
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
-diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 1bfe22aa7f..fdc283c69a 100644
---- a/locale/localeinfo.h
-+++ b/locale/localeinfo.h
-@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int category, int item)
+Index: git/locale/localeinfo.h
+===================================================================
+--- git.orig/locale/localeinfo.h
++++ git/locale/localeinfo.h
+@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int categor
  }
  
  /* Default search path if no LOCPATH environment variable.  */
@@ -65,3 +65,35 @@ index 1bfe22aa7f..fdc283c69a 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
+Index: git/locale/programs/locale.c
+===================================================================
+--- git.orig/locale/programs/locale.c
++++ git/locale/programs/locale.c
+@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b
+ 		  ((const struct nameent *) b)->name);
+ }
+ 
++static char _write_archive_locales_path[4096] attribute_hidden __attribute__ ((section (".gccrelocprefix"))) = ARCHIVE_NAME;
+ 
+ static int
+ write_archive_locales (void **all_datap, char *linebuf)
+@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap,
+   int fd, ret = 0;
+   uint32_t cnt;
+ 
+-  fd = open64 (ARCHIVE_NAME, O_RDONLY);
++  fd = open64 (_write_archive_locales_path, O_RDONLY);
+   if (fd < 0)
+     return 0;
+ 
+@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap,
+ 	  if (cnt)
+ 	    putchar_unlocked ('\n');
+ 
+-	  printf ("locale: %-15.15s archive: " ARCHIVE_NAME "\n%s\n",
+-		  names[cnt].name, linebuf);
++	  printf ("locale: %-15.15s archive: %s\n%s\n",
++		  names[cnt].name, _write_archive_locales_path, linebuf);
+ 
+ 	  locrec = (struct locrecent *) (addr + names[cnt].locrec_offset);
+ 
-- 
2.25.0


