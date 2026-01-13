Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EC2D2F32D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:23:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73012.1768346578298803597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 15:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hgqb8p4N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so1819305e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768346576; x=1768951376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSJqqb/2iNUSn63pb3q7E+CJpSDw2foP4IlyrA0tWQE=;
        b=Hgqb8p4NRMlolPYeVKUrFmasEyinNIwrGvhdhILNmGcNyllTrkXCK/yVB9+jVwAwPp
         u9FezhIq/i3iLqrLkaUWCknU4ELEt9ZKJ9WjCKoIQORO9T2TGDwwL1x3HKF3Y8rpyY7K
         FH31fTEA41CSkzL//db0oBc1k7DhE0JD6oL+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768346576; x=1768951376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSJqqb/2iNUSn63pb3q7E+CJpSDw2foP4IlyrA0tWQE=;
        b=sfR/EzH09U30ChD28BiNxd/vGXUiGQheIo2LjB1/VgRRgk5RhyA8NJXt2fCo/YaYY+
         92+XB0dHp6LXmV/eIzk7n2/JQmATNp3CdHz6R3MpCvx85s6SsoeDNvSz9heo/YRvdclR
         U0kfw7stIASx5MkcaLFIKr726+WMtNUps+C3CMc8HQu/PaJEpMWLbtywu9Ry6vbrqCu9
         iV+0g72mGFdq1MX9xuMsZqGsX+34uaFiZY/Z9RlqfKZ/ds7z4ZcfEQQrwKCfm39O+BCE
         7vhXZS/Y6Rw4GtnlbuBWlJySeDwt+FnRqlz7wGXjp+reT0wSxJsRJL8cDAMuV+H4+ZcG
         i6FQ==
X-Gm-Message-State: AOJu0Yw1TIcPsBXh6zY0ErOt/UFrQ5Hh4o1xFXiICClY661N0RtBR0AK
	exSechWvb1Jcubhn+bz0pVaIkgifW6NkKNpdIBHoPiP1SASlX+XJkih6/JBsemvJwWiU4Wz7dGw
	6/LR+QAs=
X-Gm-Gg: AY/fxX6uF0Lg53brB4Nwx6XFgZh+g/9qRLfvHx8GgEzz38i7PpcsSOM8kX0wFyaGqRX
	3K/hqTcrq+2r+wUrrZSI2zBICT9OMt8DITUOmyuyQ/ohx0jqlK8vAZZ+jXnclvrU3OmnUer/6Oe
	Ev4BKOGGOnPoY0KIuOm2ZR3Ik1PQmdaUlxeGeMTlzWR5swi/q9jzTFs4KO82NZkJmB/5FgbSRNK
	x9KvOXKSmL3Lux2Rbu8IMKwcnTpcOu777bwer1wf3pEAY7yXndCO7LocgFWQN6eVGLviHgIC6bu
	vtdiDjJMJvL8XhLNDAck1rK0mozhACR/yAT/xRkNpL8EXGXNLbt0ZodIxcJGVLEkdh5VlJXyOH2
	I708AJApGYAEHx0Tq6/0z7vCTejvsasye72OoQ6/NNHOSSTofe6sXJi5vtMQ+iAdE4JpZmVy9MO
	WlvLGvvfe8W74H4fhULLYebN8iZCqERLPwMGt2swoZb/w13y3H
X-Received: by 2002:a05:600c:1e2a:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-47ee37ab7e5mr7271565e9.14.1768346576107;
        Tue, 13 Jan 2026 15:22:56 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:143:ebd4:ccef:c4b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm422606225e9.9.2026.01.13.15.22.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 15:22:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to pull in openat2 and efault return code changes
Date: Tue, 13 Jan 2026 23:22:54 +0000
Message-ID: <20260113232254.2700364-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 23:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229294

Pulls in the following fixes:

 * makewrappers: Enable a new efault option
 * ports/linux/openat2: Add dummy wrapper
 * test-syscall: Add a syscall test
 * ports/linux/pseudo_wrappers: Avoid openat2 usage via syscall

which should fix issues with the tar CVE fix on Centos/Alma/Rocky 9 distros
that uses openat2 as well as the efault issue breaking rust based uutils.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c18318bd538..a1a00d1a95c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
+SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
 PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

