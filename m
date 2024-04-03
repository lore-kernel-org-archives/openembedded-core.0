Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFF9CD11C2
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.2731.1712113924638635487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nu1v3GLz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so392604b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113924; x=1712718724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNe71cMmGsyscBrafGAdi/BCLM0VSHlr0LfcOPE8iPQ=;
        b=nu1v3GLzeg7iADa4pJYiHWywQ3SBDI5YKmQgu+6IZcxzkvJJ3lo1GZQ/KF57KkI98X
         5GlaOwVPK3QnJLoXcWuTkGsBUDvbCr1GpURARdroecxjUV86/6e7niSLFpt0ddFL7hdL
         SlQwOnkqfd+q1VL3MeHPrDzfxVcTfKCNK/e1TfaT6QsMmHe0ERovqusYf+SzF/LH0774
         wsRQWgKECmxEcNf6tJ5KAsOVx4R25+sQz5zZ0rg7VqIWbzrHpKfNimJlNmrQ3Zfvc7vr
         08r4oUdxDILx9+bP6Gpldf1peDUWnyGIczA4GbxhfL40URn2YO1UWJPxfJiZa/hQGwRE
         h5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113924; x=1712718724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNe71cMmGsyscBrafGAdi/BCLM0VSHlr0LfcOPE8iPQ=;
        b=PDFDzl42Db4v9nWLluwPOs1q/9D2IcurVPVDKBssy986Bkocy0AhOAjHa3sjjtFe24
         5vU9qocMXkGVRJBwZla5sCf+0PawFui2cORppAORQuLK00kuvZWb+tn/rQ6yWRrgTVrL
         qvww+ufnIgh2nJRswxCsiqdG/RRS0447t5IZ8+EdY+HXqhbk54J426PuzCE+K9b3vMXZ
         uMPF+Fv8ntW+wXWdAjBHhmGiJusbj7Zy3UlKbx85tJvHWHKyK04AnaDfURH8ppUys1mO
         Am7r8tB1aTl6DuylIkG42xWZYY6If7j+QLSnHhU3Dd1dDiStTjgbVeGGoa+x4F9pTI+h
         NCOg==
X-Gm-Message-State: AOJu0YxYVIASHTmg764RRKcXfTgXDT+FEf9ibT39N9oD2uCirWFtf4L+
	PbLLuskuMka08bbzp9Tk7tp4ZzroHWr4fVeZI8XvtEBBnbTqI1RrjYd1H9qBQ7xPbd4hwMxeSNM
	6p1g=
X-Google-Smtp-Source: AGHT+IHfAcOBAdGpvPTw/alR0OdJr0w0dw6PxDgHvlHC0A6pzZa+l4Dq3trF6iixW33FHiS8jlXgiw==
X-Received: by 2002:a05:6a20:7d8d:b0:1a3:7091:2b65 with SMTP id v13-20020a056a207d8d00b001a370912b65mr1874245pzj.5.1712113923953;
        Tue, 02 Apr 2024 20:12:03 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] tar: Fix for CVE-2023-39804
Date: Tue,  2 Apr 2024 17:11:48 -1000
Message-Id: <082c31db387957963952c485a436dc38a64498d0.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197888

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../tar/tar/CVE-2023-39804.patch              | 64 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2023-39804.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2023-39804.patch b/meta/recipes-extended/tar/tar/CVE-2023-39804.patch
new file mode 100644
index 0000000000..f550928540
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2023-39804.patch
@@ -0,0 +1,64 @@
+From a339f05cd269013fa133d2f148d73f6f7d4247e4 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 28 Aug 2021 16:02:12 +0300
+Subject: Fix handling of extended header prefixes
+
+* src/xheader.c (locate_handler): Recognize prefix keywords only
+when followed by a dot.
+(xattr_decoder): Use xmalloc/xstrdup instead of alloc
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4]
+CVE: CVE-2023-39804
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/xheader.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/src/xheader.c b/src/xheader.c
+index 4f8b2b2..3cd694d 100644
+--- a/src/xheader.c
++++ b/src/xheader.c
+@@ -637,11 +637,11 @@ static struct xhdr_tab const *
+ locate_handler (char const *keyword)
+ {
+   struct xhdr_tab const *p;
+-
+   for (p = xhdr_tab; p->keyword; p++)
+     if (p->prefix)
+       {
+-        if (strncmp (p->keyword, keyword, strlen(p->keyword)) == 0)
++	size_t kwlen = strlen (p->keyword);
++        if (keyword[kwlen] == '.' && strncmp (p->keyword, keyword, kwlen) == 0)
+           return p;
+       }
+     else
+@@ -1716,19 +1716,20 @@ xattr_decoder (struct tar_stat_info *st,
+                char const *keyword, char const *arg, size_t size)
+ {
+   char *xstr, *xkey;
+-
++  
+   /* copy keyword */
+-  size_t klen_raw = strlen (keyword);
+-  xkey = alloca (klen_raw + 1);
+-  memcpy (xkey, keyword, klen_raw + 1) /* including null-terminating */;
++  xkey = xstrdup (keyword);
+ 
+   /* copy value */
+-  xstr = alloca (size + 1);
++  xstr = xmalloc (size + 1);
+   memcpy (xstr, arg, size + 1); /* separator included, for GNU tar '\n' */;
+ 
+   xattr_decode_keyword (xkey);
+ 
+-  xheader_xattr_add (st, xkey + strlen("SCHILY.xattr."), xstr, size);
++  xheader_xattr_add (st, xkey + strlen ("SCHILY.xattr."), xstr, size);
++
++  free (xkey);
++  free (xstr);
+ }
+ 
+ static void
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 1246f01256..c560741599 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
            file://CVE-2021-20193.patch \
            file://CVE-2022-48303.patch \
+           file://CVE-2023-39804.patch \
 "
 
 SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
-- 
2.34.1


