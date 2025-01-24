Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFABC0218F
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.15738.1737734228007073150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WjfEIwAS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3226889a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734227; x=1738339027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SuvnAr+inhi2dz8u8VmsqqSE9ahlC10DYyIfQgRswg=;
        b=WjfEIwASIzGv2OlG4Wkj+d5bpGjLe4nkid8eSlxbFTE/Cfd3pXXtO9Xdt3SeL9M/5U
         8ZrTNsjdJ0KBU3tJf57bCIuBg9Vf7MesOSi0PtWKtI7WuHLRE2lcd0cXq9eP9Jk50RFY
         lsWKv17sWE7GRV0XDjedOlAn/o+2vsnwCzyNL0eJWzzxqJbT++1qYx8Z2qnyjwoY66t7
         0LguJRBEaZGXCzdzo/4RqwACotkN6muxCzgjYLJSHKBTVARqfGNnPg+3wauHNrpzj3SE
         m4ji5nCR/UCoxzep8KR63wQMpmjlOUnaZS3IggSQOOOv59e53OArxqVpHJghRnlnfzbe
         fzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734227; x=1738339027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SuvnAr+inhi2dz8u8VmsqqSE9ahlC10DYyIfQgRswg=;
        b=etC2sEk0NThOoEnwrcXYngVM7utny/J9roVghdhYZ6KNj2fXxd2W8AqKDxz6C2RkMb
         LlISYbEJ6c/4CK/Ki4HzFzjOBX+nJy/LzhV6tnf+yZnmBHNHW2Yxrit2A/rHNiFM1LSq
         1lWthgZMfQZcLS+c5YhRkz81q5bm0ViNAFGQiTz79U5jukv6yJItMLv7HNVG9DBkJ5bx
         bQSJD6nOJeu6A0brkin87ff6xDobZXXMi9HNIBvr+JO0XjtwwSPpHWzC6AmLFwspSwCJ
         +rySgFGqsQ4Uz1bKPt50s9JAc/bUgTzJz6s9ffGHN5UKDqfNEfyK6w0THiOAE1FlF8c0
         tWwQ==
X-Gm-Message-State: AOJu0YwB86M1OFq2rt66FoCE0xsmtTRJOEJ/AvXwRWLH2drOJTIGr/fT
	HHzqTP1FV+o/2rJJJvHBRTNVYpGljpwaZIaF4WzBVnfBtEA1AtihR2ExBit+vuWC4N2uX8yldwh
	s1p4=
X-Gm-Gg: ASbGncsIv+H+7P3FxB8aW6UWGxc3wm0p9mw5k2KGkM8Tcw8bgQEY+g6DeDW/BKTCKQj
	h+5F54Duft9uAZcat2issHNAOsJfJaIQLEnK0dq3346m8AA7gbrYc/08kZq702wrS3oZohGLGeF
	ibvHkaJhSckG/U2CKc6qoH0Kwr4PJHQjUQOQ2FzqGsTMX9ZyMY/lxEfUaGW6nIGH/4zIACmWjmW
	ohF5At/OTwKLu4zG005uANeGSkgG7Ejq+f3hou2zPa3saySl+lR3mzMrnKaCac4TOvWTA==
X-Google-Smtp-Source: AGHT+IFAxa45ZQygEiN8dDgZER2sJQU40P3Eys6L3cxKlVDNXYhUzy/blMeoLBe8Y5B9GNzzJ5MrVw==
X-Received: by 2002:a17:90a:7187:b0:2f7:e201:a8cc with SMTP id 98e67ed59e1d1-2f7e201ab8fmr22202388a91.18.1737734227267;
        Fri, 24 Jan 2025 07:57:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 2/6] classes/nativesdk: also override TUNE_PKGARCH
Date: Fri, 24 Jan 2025 07:56:50 -0800
Message-ID: <9c64247b206efa72a52460a0b94734f7afc832e1.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210229

From: Ross Burton <ross.burton@arm.com>

The nativesdk class overrides PACKAGE_ARCH and unsets TUNE_FEATURES, but
as recipes might want to look at TUNE_PKGARCH too (for example, when
setting QEMU_EXTRAOPTIONS) we should also override that variable.

Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,
which leads to errors (eg passing mips arguments to an arm qemu).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05322beb290e1db30bef49b4364f8a8e6e9f7408)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index b0634de582..4e57349aa0 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -32,6 +32,7 @@ RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
+TUNE_PKGARCH = "${SDK_ARCH}"
 
 #
 # We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
-- 
2.43.0


