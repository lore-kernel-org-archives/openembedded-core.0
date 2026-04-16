Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E0F8DFFB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28577.1776378798848277604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0WBdNToq;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so603635e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378797; x=1776983597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxhVmaE7zOkp6+PRpkOk7YIy8FhadmSy8TPi6WlO+KI=;
        b=0WBdNToqsRg3EsY5sk09Wk+uwH95DMNdUWlNhu0JFysQ1qSQ2uAiSSjXaLOs0gPwl6
         ojkS9gwq5OPSlp9tATYD26SoNk4GMCvTJsn1QES4aP9tXy5toCzDlfojHgtPZvm5/pcN
         fPIGXMRAOG+vcDNlDVzHLLvwHsX4zJnfG0JMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378797; x=1776983597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxhVmaE7zOkp6+PRpkOk7YIy8FhadmSy8TPi6WlO+KI=;
        b=mHp/HGz5v9p7Kbxgu5eiBwclbR3WJbEYFNkGj+TopsJ8mHXXLs4k+f/p1pEkqEcRO3
         4J2eCTubKSKqBPlUoAVHsWHo/SxH3gDiiGGfK2D2/I/0XpMOhZLqE7NKCpr0AwY36mDY
         6HavlhxkHVpc7P5L4QIGjiVx7ohXoghYr0menNjD2oMhHe8WteCHn3quA3fEiLKVyINe
         6ReAYgpAZwyE7KgAk1uvaqU2yvjtWs6Tb+z1sVvc1mdbNZwExvzrNXBybK8+Ic88Am8O
         oN9SdIs+HgtixZ8GHwQEAintsLnt2MEc8mdIxW0VWRHlL72XQnOLyNyR5CIWMchdl6Nd
         2akQ==
X-Gm-Message-State: AOJu0YxDeT3RAzIyMxYiea37kJax1rTv4CPcxgVpSkCg+HsXPJsaYJmQ
	C7C/GeeHxIImi+qbvzgDdKpnFq34I00VwqVITNy5UNN31G+nN3Q2TwMm61UaDcMVoVUC6sVnTAq
	ENSUpAUBnEw==
X-Gm-Gg: AeBDieszjmFZk21l4Yz1VmgCQ9ytfBYA7zdBRUQ3yA2xxE0kp3UNNbmQu+RX4lRjCaR
	4dHtnTeJl6silzDQE/x+UVFJR7PI0mPVpxG2qXn4H4Vs6uQVPdvhOegFmEsvGd3o7Py3C2bMj36
	ONWx06/EMdXR00hEQ7C8npo4+v4X4NNTOF4SNhtKq1k9sj3uIcYb6t/udfOv4mphhBtYQexSs5y
	+VyUJMhjxbY1YbS0gJ/oHxc+gcBBszh2EJ0VZLp/a9yPizaHamsguunPMmJI8QPTZSzo3Punlbb
	d0gyebWiUamEu+lxFdD1jmBAVadDOPEblWepIa7vRluSnBcEHxbWj6dnCgq/IFYu7sdotj/IziR
	vfklh2DN4bx+/A+d53e3UV+NXe9P5FihYZj0Qz+hKnemkpxx8+hDPHSqciKd7dCL4cwwRO1p3pH
	0dwkGj6pMMPwTNUBfxVlfX8P6b1dj1losCUDJD2adzlBT9j9P0vdx9n9f0ceDfwmB3/VBi4DBAQ
	xEOWQ5YL55NOXWFYO/AMqQkNMfhM2dGqR+uJg==
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr3909435e9.18.1776378796903;
        Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 28/51] libxcrypt: Use configure knob to disable warnings as errors
Date: Fri, 17 Apr 2026 00:30:11 +0200
Message-ID: <87b9e62a9e2d984d957ed89c773f349559185c1b.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235457

From: Khem Raj <raj.khem@gmail.com>

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25f26861ddc8d71af5381d1acc883ad948bddace)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index d84cbc9db39..25cb7f6178c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -18,9 +18,9 @@ SRCBRANCH ?= "master"
 PROVIDES = "virtual/crypt"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

