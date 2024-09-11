Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAD8EE57E5
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.35223.1726097015757071945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IkFjWMzh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso355600a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097015; x=1726701815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbI8LGXI8SYErK0LNhxbGCubiEFlaFIWi8mLamV+qo0=;
        b=IkFjWMzhUJrNnPSVDkKv8LEQOfzw/R5rMNXKFhqw8438t70rjcYTQsPwhEB9hBiGM6
         dIgf+BBmd16dr8Q967M1ZTeKVktRgS3Z1X2WWyS7wZdwrglAc/OLp+y093WTmA3AOUnH
         Wgo3QkfM9bObGBlHoApV5rmp7HkAYF+pXjdXxV8CVQY8H6+Th6CQzVhnQqQjKi6utKH1
         y6XkCch37KckZ2JQ+ZF7SFPGc9qrA91iB42XurIOvRH13V3WEWfL/1Am2D1Zql0320Cw
         td47AHYt0M0j9LCOypKpOuaSIal8HwQUQYI10yvZwoSthJ9ATm6SJIYwjZAajqoo0kAF
         UYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097015; x=1726701815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbI8LGXI8SYErK0LNhxbGCubiEFlaFIWi8mLamV+qo0=;
        b=GJP5UGuUkj0DO8rXMzyFLZ81jEjOpSuoy2+qf1/RB0mM61ibusONGckKnva9BAi2ka
         84gb9x7GL5+uz9TgPaq5MGIQe+Ak56sB+hBTsbLvqq4dPt7F5ZUMwT6xyAG69wrcBdMI
         /FCCdYja8nchzDk98Sd4LAbl9agbr7Z82HPi6X8lxt4V83s1A3UlikPt8wMo2mdH7qJX
         2HMXCoyN6zREuoFzwReWrM3kscH/gV3pjMahmS5rxNYOel9/IGUlnK8GJPsUnlqI59rH
         qWeTGXgMBmYufJldRMrz09YzZuIKtyMPXLHfxgqxlOE/7DYZ6RFTR4hM4r/n8jEg14sv
         58VA==
X-Gm-Message-State: AOJu0Yx7ihttCNrzB2e4layb5fln4AcqLWfkw2W3OX5O3uwjjlDUXb3w
	H+u8GnKN/VxJpU3G0f1XP1m+oMHLHP9XnndZZpJYNE6pZep/J1Br2Xdrxn+DqvJGoxizwfNCmQT
	N
X-Google-Smtp-Source: AGHT+IFCi4mH7J6m9QY9KZN1BozuTcZw41qn6+p9L1i2YFxCPZ0+ZJ/mRv9m2F4jMOyivytUqEVJRQ==
X-Received: by 2002:a05:6a21:58d:b0:1cf:5370:3b0 with SMTP id adf61e73a8af0-1cf75f00300mr1327566637.12.1726097014930;
        Wed, 11 Sep 2024 16:23:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/22] expat: fix CVE-2024-45491
Date: Wed, 11 Sep 2024 16:23:02 -0700
Message-Id: <fb5ca8b9dcb00ff579ee70295b68aecdb3084b38.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204399

From: Archana Polampalli <archana.polampalli@windriver.com>

An issue was discovered in libexpat before 2.6.3. dtdCopy in xmlparse.c can have an
integer overflow for nDefaultAtts on 32-bit platforms (where UINT_MAX equals SIZE_MAX).

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2024-45491.patch          | 39 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45491.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-45491.patch b/meta/recipes-core/expat/expat/CVE-2024-45491.patch
new file mode 100644
index 0000000000..2231722f12
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45491.patch
@@ -0,0 +1,39 @@
+From 17e29cb8ff58a8356ad8ea363c169e227e93e444 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Aug 2024 22:34:13 +0200
+Subject: [PATCH] lib: Detect integer overflow in dtdCopy
+
+Reported by TaiYou
+
+CVE: CVE-2024-45491
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/891/commits/8e439a9947e9dc80]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/xmlparse.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 6f0440b..adb27e3 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6913,6 +6913,16 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+     if (! newE)
+       return 0;
+     if (oldE->nDefaultAtts) {
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if ((size_t)oldE->nDefaultAtts
++          > ((size_t)(-1) / sizeof(DEFAULT_ATTRIBUTE))) {
++        return 0;
++      }
++#endif
+       newE->defaultAtts
+           = ms->malloc_fcn(oldE->nDefaultAtts * sizeof(DEFAULT_ATTRIBUTE));
+       if (! newE->defaultAtts) {
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 24d5c85d74..f670f94685 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-45490-0002.patch \
 	   file://CVE-2024-45490-0003.patch \
 	   file://CVE-2024-45490-0004.patch \
+	   file://CVE-2024-45491.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


