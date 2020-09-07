Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.6541.1599512014398408928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OLN+LSJx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t10so17004170wrv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HQha8kV0Xv+L/DMvOCIxautxlAWP5X+VjQkaeu1gPZM=;
        b=OLN+LSJxUF4DKOoC4im4beChtYD3V6gzMES/aZMvDC61pX6ND6mOB9aoC09SrnHUqW
         PWWJb80m+Wyw87w+q5k0WnvJtbP4WHyvVUKZSWyW/TEFY2pXF8t3vKN+MdYuzg/VY6om
         zZLlJ7uEQZPOy4/2Udx2nr91I9HXNoW8cNefs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQha8kV0Xv+L/DMvOCIxautxlAWP5X+VjQkaeu1gPZM=;
        b=c4mGAedIQS7T7o61GWsKNziU+C9NbIdAXOMoA7AoobLM9tmcCyShXh1AamIlwhzisQ
         zcXj+RIpnv+9JA1RaB3NoAwJJvYjpvoNGXHEW4TYuLl4TemevVizcTzIHkQ2U5GEk4VI
         kH6LAxyArf/P6SpbqwnS/BElJ1X81hbk+rXE7YZ4+LeYg2qkEmpV/jG/NIEy5dMsV3zK
         fnlZ4dqgZ0mNY5CneGl6MYUC9k2/x2IfBfuavZVtL+sUH0/g6IMaAgynuK7SsTzxIevR
         zW+t9AFL69bcl1B+30uU++PEOQVOorxb2br81R9Gh98uHzjXSlDzWjRefinNH222AXUx
         QWjg==
X-Gm-Message-State: AOAM530GnguYWtKM2zR/nWcyXJF0u7UncoZmsoJVyJ0tFouzOP5WxYN2
	QKiom9k27tM5SEV7Cl7s2NoD8HZP9xF/FA==
X-Google-Smtp-Source: ABdhPJy2RL15mUFSt6OH0+rATlW0ucgu+JxUIB3iggENqli4SYuYIOa0kdp2g47Imy8kXlpgB+Y15w==
X-Received: by 2002:adf:f852:: with SMTP id d18mr23381706wrq.245.1599512012689;
        Mon, 07 Sep 2020 13:53:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 12/19] glibc: Update nativesdk locale relocation patch
Date: Mon,  7 Sep 2020 21:53:14 +0100
Message-Id: <20200907205321.1941682-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The locale binary reported incorrect locale lists in relocated toolchains
as some path references were not relocated by this patch. Fix this missing
relocations so the locale binary correctly reports the locales.

(From OE-Core rev: f7a6a72880009380ae81bc7fc863921a26811c8c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Make-relocatable-install-for-locales.patch | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 3aad603ada9..5cd235f6ac9 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -65,6 +65,35 @@ index 7c1cc3eecb..53cb8bfc59 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
--- 
-2.22.0
-
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
2.25.1

