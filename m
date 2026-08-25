Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597ADC61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32366.1787691012616248624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EpApcSRO;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so909675e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691011; x=1788295811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQm2kLRy6+Ecgrjh6nunNGprgv/l9I+1JTcVQIJND/8=;
        b=EpApcSROjO2VP8IQhypu6LyNOuFc4V7jm20X5lFvq/b5+kfJM+pBqPww+EihqTepM/
         5DCAz3jdrFTWq5YRqkqKSKBKlrDVZ94XYnxntum5MaAd341kS34b2KbSAhLN8O1KQ6gF
         xgdCj28BZUDhTMOIfGNBWSXNTEusnoecxbgNPv0pI/XF3cUH0uL4Uh4WS4SwbuZOojiU
         TTXQnoNSzDFnpkWZThh+8TgBqZhtE9CXhe8LZXYsZPRdWi6oBRzu5WnEUXt+OZ2LW6Gx
         1+Bb6ftt3KZXTLHUTMxC1TczDsFSKH45OjCZlYHqyjo6yzAAGkHZV+j95Mc2SwL0Wg1w
         UZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691011; x=1788295811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQm2kLRy6+Ecgrjh6nunNGprgv/l9I+1JTcVQIJND/8=;
        b=U+BkLzMNN+KjtJWfoBdw5XynrphOEkQfirj+cfh5QuY0WlEq9X5cqzBxljRrlJTC5g
         Z1SfdYWVsO/VyAK5ZUJTHjKG6XN9FsKxjB4IvsxzeN8DBjG+HgJhuu4EZh1nHhhgurTe
         8paaqopumnZyP3IU3AuP+pPxu7A+tn3xPL27J2ydiK81aQadzWlsBMCU/6jKFRt7rAD6
         BzQsbfZ5H9VtNM5X9qsMwd5wqxP4k1XS7rebQaBkaaZJMrXe5rJ19IB5DPYsEKPmy9GU
         C0qfsT72pVsZUvo+ZIocurIo7Tg0TO/NfhshpyhjIkOSIEgau60TLXSqSfvQz5DskAZe
         2ujA==
X-Gm-Message-State: AFuF++mp2dvgrAFtmMyGGuN+lXmMZa/i7tt6eTVu6JZ5C2q2+9cY4S/W
	j48DW8g64AorQhwTnZg1WjXrzILSFCFJLBb9PyZlRvlw4QJzbAvYzvG68c7KdnyekXA=
X-Gm-Gg: AR+sD100Q/zRFvVFZd3pkp8k+sl8qxzvOG6fDuq5O5JQU1GL9ZzKu/+IOHhcl8uUtdE
	bkCg2pxpE2C1irGVbwLy4bRCp+rX9/9KF2zm37kS6ZMuGGS8hjXLKJ6DnfM0I1IC+Ux1bMF2P3t
	2uQrvQCkcrnaVUako8Ktk9LBZmFH6ORWkWVZw1x4jBpSfe0Bl1SvQr/wZK7accOwnqYQfM2VuY5
	p4d1ecRKYG2O0IV4xpiFUhJo8kMGnVQQpsdkRxArIIjRZsKSIbT6j7Jv5HQQCrB+pzXXiyKywyJ
	Wj32yvnj7zc8QludDuWVlVfWwYCu+c2pQZTDAz4FejlUoVnPaQYbHi65PyEbB00pBVBs7w4RVNV
	bAjvNsRXcRpbPh+I08kUAsCfdVidUJqRz727qX4Ul4JJXXizARJwQspRH62extkijIMLvhmHMpt
	MxfwXuzDMtRNBtAW/jAJnb0HjDYqf44AdEsayeA8Pj42+n0DFrCxToZaiO9yN3XK/MgJpY/gl40
	rPlj2caVMYnOyQSVAeNLo8xp0wdqaO7AalQ0JeeoUyoCnr+TdR+RxxQhPqtS8chl0o7C4hwREuS
	t4liZ0qNIdXL
X-Received: by 2002:a05:600c:3f08:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-499dc6efdf9mr18090395e9.2.1787691010813;
        Tue, 25 Aug 2026 13:50:10 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.50.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:50:10 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v5 5/5] documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX variable
Date: Tue, 25 Aug 2026 22:49:30 +0200
Message-ID: <20260825204931.17628-6-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260825204931.17628-1-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244279

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 72513296e2..05945b9702 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -282,6 +282,7 @@ MAINTAINER[doc] = "The email address of the distribution maintainer."
 MIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
 MLPREFIX[doc] = "Specifies a prefix has been added to PN to create a special version of a recipe or package, such as a Multilib version."
 MODULE_TARBALL_DEPLOY[doc] = "Controls creation of the modules-*.tgz file. Set this variable to "0" to disable creation of this file, which contains all of the kernel modules resulting from a kernel build."
+KERNEL_MODULE_INSTALL_PREFIX[doc] = "When a recipe inherits the module class, this variable specifies the directory to which kernel modules are installed on target."
 MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that you can build for multiple target machines using the same output directories."
 
 #N
-- 
2.50.1 (Apple Git-155)


