Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AB6C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:19:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.6459.1638440341773476603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pMTVz9+v;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id k4so19872119plx.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Z1WXtOyR5O9oCo5nQJgJW27Ug2vOfpA+Ct5yEO5Fug=;
        b=pMTVz9+vQ8rbjDJ4qlHw7GputCyrR5nQYn2CJ/6ezo+q7Yn09HHmNQrJHVsG0K71hk
         g2V52BZuAM7Ah2gUICVM68HGfVTNUOKalJTn8sFiDcbUeNTKlFcgmFYis6N4gZezyx6F
         uGa/YgovvIi98s5zp74M6xPeBRZJtrtprPYtkBXoDL46qpAffDkEZARw8gQ42cYsgTmr
         Jjn3cts8EOv71jNLwWzARpxuJY/w/d2wDH9LNX6WVFF1DalCcz7fi0davzwIKWpxaxnc
         /LRqbQAbr+ZVW1TYk2bz0IY1Il0/sEsLIMZG48IxONxBS5COe9J3lg/+F404ub6av5Ha
         Ua2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Z1WXtOyR5O9oCo5nQJgJW27Ug2vOfpA+Ct5yEO5Fug=;
        b=5JfJTapmlOIc3CML+IMhVRbMdT8Wex+N25/WWnkU2fi3F7V9p+LmsGO8ayaVVUICIG
         vos8s2l0Q4QndGJStayjy2Vez9v5KGh139tHjMz/Inpxk6+ps9/fn6HEzrbNTVEtTn78
         HItu7VqvZfvCoaAwdhStu3vy+FJ6FhavE7xUVtVlMB96aVT2bgPfvZatAqEMe/vC47HO
         LalfIXNHdxrw9ssfUudno9lCaf7z9DBN6FHpjy7IGEKPX313YKcI22d3S/Nz87nBV2as
         Rwa5NpC6xJGaj+EniNHm7fHk26fMhOOhJbAXg1YTYj7VUZWmLk4irKPI+6+FKeVTzw7N
         TFkA==
X-Gm-Message-State: AOAM533hIBhycW/9xN9qKxyQTWdUFZlRNNtfEDIY8r+y0m3IDEuoZkLM
	VaAR8z/ePpgajCnASo/mXov2879eVtQ=
X-Google-Smtp-Source: 
 ABdhPJwMO8mSz8lCXf8ZqxJqeg+yB/BOiRLARiyy0atA9X/5le2WIs/tTfb1Hyh6D/4VAt/U/Ygb7w==
X-Received: by 2002:a17:902:b60b:b0:144:e601:de5 with SMTP id
 b11-20020a170902b60b00b00144e6010de5mr14594905pls.36.1638440341081;
        Thu, 02 Dec 2021 02:19:01 -0800 (PST)
Received: from localhost.localdomain ([103.81.94.54])
        by smtp.gmail.com with ESMTPSA id
 186sm2137258pgf.94.2021.12.02.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 02:19:00 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH 2/3] ncurses: Fix for CVE-2021-39537
Date: Thu,  2 Dec 2021 15:48:03 +0530
Message-Id: <20211202101804.4697-2-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211202101804.4697-1-ranjitsinhrathod1991@gmail.com>
References: <20211202101804.4697-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 10:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159080

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-39537
Link: http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/Attic/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../ncurses/files/CVE-2021-39537.patch        | 30 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2021-39537.patch b/meta/recipes-core/ncurses/files/CVE-2021-39537.patch
new file mode 100644
index 0000000000..7655200350
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2021-39537.patch
@@ -0,0 +1,30 @@
+$NetBSD: patch-ncurses_tinfo_captoinfo.c,v 1.1 2021/10/09 07:52:36 wiz Exp $
+
+Fix for CVE-2021-39537 from upstream:
+https://github.com/ThomasDickey/ncurses-snapshots/commit/63ca9e061f4644795d6f3f559557f3e1ed8c738b#diff-7e95c7bc5f213e9be438e69a9d5d0f261a14952bcbd692f7b9014217b8047340
+
+CVE: CVE-2021-39537
+Upstream-Status: Backport [http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/Attic/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/ncurses/tinfo/captoinfo.c 2020-02-02 23:34:34.000000000 +0000
++++ b/ncurses/tinfo/captoinfo.c
+@@ -216,12 +216,15 @@ cvtchar(register const char *sp)
+ 	}
+ 	break;
+     case '^':
++	len = 2;
+ 	c = UChar(*++sp);
+-	if (c == '?')
++        if (c == '?') {
+ 	    c = 127;
+-	else
++        } else if (c == '\0') {
++            len = 1;
++        } else {
+ 	    c &= 0x1f;
+-	len = 2;
++	}
+ 	break;
+     default:
+ 	c = UChar(*sp);
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 76f0cf97f4..700464f70b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
+           file://CVE-2021-39537.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.17.1


