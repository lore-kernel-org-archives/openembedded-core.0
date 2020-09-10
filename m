Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.20768.1599740693986259295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iOrDLtX3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id e16so6510651wrm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qRQ9ocgcnReZZ3CdMglg8bGJ0FRfNm1Ri/p1j5NGNGk=;
        b=iOrDLtX3iiIj0o/7oiV0PJM+wvMoiPPBYgGk1QeBe8WJxXyle714+mAos7w0nM5EMM
         sq1XupBc0LBP0e17WHkMEqvA2ViwZNQb8e/2KNSIeb0rwzzhd/ubwnz7lTjwvYVu+ZZs
         l31m3zVdr1f34/2N8nJX/8kSiDoS8b0UqNHQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRQ9ocgcnReZZ3CdMglg8bGJ0FRfNm1Ri/p1j5NGNGk=;
        b=dA4C7tPnNpEYOnnjFxTB5VQBmQp2XoF72DEVWc+JFXU2X2aaDHujVgafhgEbfWoQYT
         +gscgr6wPvrBDlhz8DN2LhEdZ+N8GXN43ceoX01KH+ywM9FNhvLoqJFrUsfXVyj6S6SM
         +877VY0Kw2SMc2WBvct/I2gobcT27H0/SxnaC0PEScO/TmOub3+2J6H2vChnLzLWngbq
         MJlXVzS1AqCIuzXojO6xV+De6mkY+LtDUJcMxRwZQMVbcPbfSdnatVtHtkNnHAAabd17
         GlE1YHkdzd8IRln9f0TXngEQK/kDAOhjPnhhajqb0lH4x0TMkj9BNkmufqNZGQxe52jc
         fA5g==
X-Gm-Message-State: AOAM533SgBg9qW8BjAH18483wd9ITD2br2pIct30MiPUrlFha+I/Ge9D
	AyZ7hZlraPPWMU3w4kwWnPWCDx/tHtYZeg==
X-Google-Smtp-Source: ABdhPJwwVyeEoD04YU5rEGO2TUFtcssI6Aiyc5rO+OdpzcNpyIlnEPd096Sh/r/SM93Y19TIOrT4Ew==
X-Received: by 2002:adf:f984:: with SMTP id f4mr8814165wrr.102.1599740692178;
        Thu, 10 Sep 2020 05:24:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 19/29] glibc: Update nativesdk locale relocation patch
Date: Thu, 10 Sep 2020 13:24:23 +0100
Message-Id: <20200910122433.2040293-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The locale binary reported incorrect locale lists in relocated toolchains
as some path references were not relocated by this patch. Fix this missing
relocations so the locale binary correctly reports the locales.

(From OE-Core rev: f7a6a72880009380ae81bc7fc863921a26811c8c)

(From OE-Core rev: e4c4337e642f565e9988a4a2c50a995090d1f49e)

(From OE-Core rev: c9e8b7a40b2628331c7cb564aa3f3d9e1822fe36)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Make-relocatable-install-for-locales.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index b53f2ef2e27..a5c2992f2e4 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -65,3 +65,36 @@ index 68822a6319..537bc35149 100644
  
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
+
-- 
2.25.1

