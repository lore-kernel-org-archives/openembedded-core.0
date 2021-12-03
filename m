Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A2DC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:39 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.15347.1638555699295334696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z51o1mrq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id v23so2933547pjr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y/z5QW80ogehnJCoTbnGvL/K5S8inCvVLAB5jHg9+qo=;
        b=z51o1mrqhZj33Jb2ByfY3oF87XZD1Qx8cvLVQJu3RstmqeYyLHszpI24jxQ2K9RpQd
         TfsWXolYm1MuMy7fB3I9PN27gEZbMwz3+eAC6VqrZvZnjf0zVUXZMzdILRqRrgPyaZVD
         /nzV8jxEVAXKk9Lm3TuYbXXUOLCrU0sSEQljdxmHlu+JyoBq5Xy7fL+WX8DaMIP7uSZL
         EjT4Z0DqeomE8Wd38cQ+72F5AgTSoaXiD4pEhT0EO3/ytdjt3ElSiuheUbgS7AAAdIhC
         8K47hm7F7awx7qGDtQyaH533DcPnlZd6EifHGrf/7K1AP8UZaPAU5Zm1VNx46ttQKs2r
         pOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/z5QW80ogehnJCoTbnGvL/K5S8inCvVLAB5jHg9+qo=;
        b=vxj6UIJLgGLm/U5OEi7gI0vMzgPHzsnEPxyBn/rZiGx2dd27KPsLIGiNjgHxcZgRBv
         UdCMf7QOZDVtwF3saYvYXIUB2MGGDtERf8k5pHc0PYRx/W4wIjpY+LY1uMyDV9LCL69Y
         Dr0U3XRgn5lredtfwBPSOutAGJUQvXjDzOFyJ8DNEZYvfYj0u2mmt02Po8hYCz5KtUzt
         U/j2IJE4oXyEqWRmYKrG35mcj0qXKMhnkJ9E80kbZw7wSbvLi/K72CAxpZT/GOsQNl0/
         rn3PQOSHWKpzHihdp254CAzNc5EyPfXfMCkygDOsZtTgyUDWGrharw7GAC2UJWFs3ZtY
         oD8A==
X-Gm-Message-State: AOAM531vkt6uOnrBhVrR0wrmhk7FGG76e31WxbxKoYkYepRR34sWEu3E
	hxNd62EMHY2EAZB0tDJCbHKrddYyUFyU17Raerw=
X-Google-Smtp-Source: 
 ABdhPJwlcYWKSntEbvEoSr3DFgvmbKsgYHA/tUFzycqLmeXKfQBsGrnxIOkGjCEqmhX7+uurjZQn/w==
X-Received: by 2002:a17:90b:4a52:: with SMTP id
 lb18mr15924101pjb.84.1638555698271;
        Fri, 03 Dec 2021 10:21:38 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] ncurses: Fix for CVE-2021-39537
Date: Fri,  3 Dec 2021 08:18:53 -1000
Message-Id: 
 <443d0e5403422862d52c5710772cde0b1a363741.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159133

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-39537
Link: http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/Attic/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


