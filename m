Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4968C02192
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7731.1738205498418561836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jqdqHui4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216395e151bso3365935ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205498; x=1738810298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGF+tJNBjPpIRn/6drc4kak+dzYmCzWv1pBlyFX2VrQ=;
        b=jqdqHui4VC5u8sw9Mm17ZUlPkRZKRPCUhoFv1KnPs0MwgEGorIbiCn97hGwCy0JBZM
         bC7Xbc16ut8r6rpb63GCKcJC4Xklm+jad1k87ITZIf0fQFbUFMzCJJaKk+EJpPA2QSIK
         A4ay29aDrC/xG51bNH7+NgTu5u115yIuMZGE7ge+CnacYlsFvG3ksSCudko0VYvbmLzN
         j33STgaisbnFH0rgQu0FVAndl5caL83FM6HNADnJT/vRL8fXBJUvk1XE7kP2ujF745lm
         h/rnbBC0Kh/Wq//sqdAiGHp2sdk19yIAmfdgbDVHxVldxhXdPLm9TnH3EgeY/zLnY4Ho
         xFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205498; x=1738810298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGF+tJNBjPpIRn/6drc4kak+dzYmCzWv1pBlyFX2VrQ=;
        b=E8XXvke+finlHY5WsfXCYp07tQ455YKvwM5OVJyOHbwry7/jShPt18LGRxYpB3IwvA
         imzrvn4D7kiLfWOtA0mR8KRrnfpYSnvWcPtNoVI6+ayBGPdxB5fIZsRtModz+Y1j4Ssz
         utShlPHoR4dfOp0RF82t75Q46TlOcY12SNJfzQN+t5k02iKcgemEwWloYx+13Cb2ynaO
         1+l0OmBrPfc4GHg9X6+eXobTp0Znr69C8Xmi3xuuI5nrTvs+WX1CCJeO7M4REl2XXAjT
         ND57VLWLKT+oOekdUMnGNh6AdPzGmO2g9n+SoXwZ7RIdMNURJnzGWLLnhpXQyyqmZ9ia
         wxew==
X-Gm-Message-State: AOJu0YxcdhpbzDmrUkxYR3enRRM1BcJjqCuVQpTjcHGl5cjdxPdiDu42
	up3WGenoCFNcEwRaUwHR5RjkIKA9Dqrwrsqh4FitPwtqWIFNowPYYlFwgl57yEnBQCIYWFT/Hor
	YHZE=
X-Gm-Gg: ASbGncvJQwQwPrXTo7x+k1kGxIvGj9+/MQS5c78g+YTbUqRQZX5Xtys2gy0Lss/O5LG
	G2Yff4mPXekaPxbAcvG4ftd+L0wQRI10cjzbOrTTiZAk6Zgoq/2eWT9S7Vc6kwjDLNZMYOM/jvD
	FpRo0A6GvDR1rLAfRKn7eYgvVNSbMW7Rys2KV5eiB+vGeoyn5Zf8MhdnRDZ0PRJax1xPvKVkqfi
	9Lydp1Mu4hM0tlBL/NpRUxDoD6bbV8JGvm8cpD6rz3p0DX5wuIRKU4MQ0h+Qt6xHs5l73xVIDXc
	XWMU
X-Google-Smtp-Source: AGHT+IFQyKzaCtdm23EBXio61EnRgkHpIPrp877lPK5hy2K5gxLlXyfRwTzfD/4kB8jfp4QAZoDPpQ==
X-Received: by 2002:a17:903:41c3:b0:216:1079:82bb with SMTP id d9443c01a7336-21de195cd1emr22864205ad.19.1738205497705;
        Wed, 29 Jan 2025 18:51:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] oe-selftest: devtool ide-sdk use modify debug-build
Date: Wed, 29 Jan 2025 18:51:11 -0800
Message-ID: <1528d6aa060811402eaecb1a9fe16bfec0417c98.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210431

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index fc08906117..ee75687f01 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2493,7 +2493,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
-- 
2.43.0


