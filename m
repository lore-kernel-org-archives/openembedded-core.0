Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D04FF8856
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32601.1777064224947350925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3l2PlX+J;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483487335c2so80858375e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064223; x=1777669023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnzTJjR/z9HpitiLNA2+tE8q63oivhD6zaeE1P/svVY=;
        b=3l2PlX+JbuwrpeZZx8aZyzezlcHRUNCNLDKS/zdO9n7M5ajWy4QOwtVF21bN4VwYnh
         VQY0cRAHWMnubet5ddIRaxkSFNS/6j2Lzrf4ViaEbAhGcg7avGMCeOglBT/vnoiV+6Fi
         7tPD/5dx3wciXVxph9bJMzkQVcKJM9IRtsCks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064223; x=1777669023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QnzTJjR/z9HpitiLNA2+tE8q63oivhD6zaeE1P/svVY=;
        b=Np9jT0Yk6ahIsg4bcy60T2lvvD5ca9KqNNc++jiuBOoY1Y0h7FdKtY6rKbZzWI3cIk
         IPDl+Etungn1QO2HPiPEKsuZ1rvbfc7KBNss8C53DRq+GH7ImOeieNGWckGFsI3URzmk
         vs2iA+8ksB+Cjr+61dhcn8DcgBwSlQIVeF6/Z4s+60j5UOffel4qyDuJISSzXNzjFG05
         HNXrlQdm/lb86kxKJx3lWY4r5GsvBGcCK8M3SbdLnzDg7+O7HoOpIVOnoP4bGW+neb5R
         98ytXeT5r0nFo/hS0JQXlNhdwGQ0AJ3Y5R2mxN4rgPwgCuV05MpkXqMuUyFD0x4ufdaf
         xGog==
X-Gm-Message-State: AOJu0Yw38LJ5tofpG8iaMqw2DMlQUbYLLOYU9+1nk4OWwQO8m8l5zrI7
	qg1oDitvdu3pdkEkXGS05uu+NUF5UcWFOymhK7vUmgrIu3UG+sJ7GLg/RWqk06MQU6eIMYtJfHk
	a72WCnjC9+pCR
X-Gm-Gg: AeBDietLSJpCtO6ZN15QDlNF6yKa2+FM+02W5bNuIhn6pqncuDjmXfniV4bSijvjF/I
	XgXgni0b17ImdaKtZJcCZrlBQrP/pR02o3lQKEbRXRnUoOCZ5ozCVhOJcMKXGhek7wXiEwN6Rgy
	JXND3ADUvnNt7hxaZV69WeJxs1ZiZXTqo2hEwS1AMQDUOZwGR0TKW2eQnIhhmxDwBgGEUok0vKM
	UrP47SA0p9IPWKaXZzi3JPDYe63Y7Kt1Lfhkjj2qRjXjYFLjXk2U+IxuXZq4QFB5byg+mhajDNs
	+JtNtno4kUFMB1bvcEw4IejKJpot5Xh2HlTQEk3ZuB6eXUa1K5Jd38GCHqDg+SZzemPdLkkPoZQ
	xWKtI8KZQFL6YqbyOCJjxot1cJSBCXkOZAQpCkB8EVFJSZ0GoYX8fuvx381OuAbaghtG2+cjvbM
	RGtcY+GhGBbNSYMWP7H6r8+0GOSxj48mk+FSRAuePSxZq3VBgm71vwT5UrvaDYtwiZGOoXJyYU1
	/XajZ/GwARcWQxXBqNdH1aIPNtLoAR4mdjH/Q==
X-Received: by 2002:a05:600c:8b38:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-488fb796fa0mr461031435e9.25.1777064222969;
        Fri, 24 Apr 2026 13:57:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 44/66] oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
Date: Fri, 24 Apr 2026 22:55:43 +0200
Message-ID: <d839f4908ae6fb54c85bea5b658c23bfa9dc34da.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235917

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Use ";protocol=https" for the parent git submodule and, also, update the
SRCREV to point to a commit where submodules are reference through a
https:// URL instead of a git:// one.

Update the expected output of the archiver test.

(cherry picked from commit 5c78db972f1b97ce67c8c461a2d389b9248793db)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-test/git-submodule-test/git-submodule-test.bb     | 4 ++--
 meta/lib/oeqa/selftest/cases/archiver.py                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 90d9b66b2c8..16d042cb04e 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -7,8 +7,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
-SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
+SRCREV = "f280847494763cdcf71197557a81ba7d8a6bce42"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 3cb888c5067..4fc1bf4b303 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -335,8 +335,8 @@ class Archiver(OESelftestTestCase):
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
         for target_file_name in [
-            'gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.tar.gz',
-            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar.gz',
             'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'

