Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA6CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:10:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.70891.1756793403337808783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 23:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+/bMW3Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24af8cd99ddso10781505ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 23:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756793402; x=1757398202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoXj632oQvX2c4q4wAyJfprtkBo2n6PBrR2cBxFP7mw=;
        b=L+/bMW3ZDFhjjzHUFMr3LysUR7/rx95a6RXolDDueY2xuWvtQRFDihhX/O2HFTX3Le
         8lIKX5apbJmTKQM400lfN7fP+MIHJOfiJq3+dtJVxDIwYeGp3FQCbCFplDQzvSanAdnx
         HKM9h6uOVELbBnTQl1MUveusSEcLnUDdNTmu59EO19Jzyw+nFfrundZ1bnC2GJ3+9W8r
         iHOLAYnVVgboGyflBYmwHNBWqgadBkhr92vvq8zVxekIjeybhPA9kyx7Pfm4RJUxyZ8W
         MU6tYm+sYby5pheVsip9LdNGzVupmb48G/Qb4d1F/H4C6NCBcMdXt+YShQxTqdlQ5pxA
         8ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793402; x=1757398202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoXj632oQvX2c4q4wAyJfprtkBo2n6PBrR2cBxFP7mw=;
        b=ZFzSVw0vKwc6i6p/9+i04afX0ewlwCLGwqG8H38l4g8bZKkRB6oy5OF3+g8yZ2gGgf
         0GCQlDYLpSWtzvGfYMTAruB37/LpYDy3TNWLvvUXQ5sYg/5SGqKkZHv4V3F0t6Yu1OJl
         ksiDR9jDU0QioJZhZBrYxiNFi6kBBgnbVA1/SinuhkrKA2BNQJd/e7BnVd1NiP9Qr3vc
         hziHtv5HlKWK85f2YJMnwsxb40AIWbRcXcBnoLbQ7a74Xw1AUd89ExFGL2wF0fU/rShq
         6F8uyah5Y3LkWwA1OVjM0tgHeyi6riQsohlHbmlBrFnGld3f7pcI7wsX6N52h6m17xGr
         HUUQ==
X-Gm-Message-State: AOJu0YwjCkN04o/l5EXIlWCgPkBV9CjD1FKqbgEJ1N7YQDx3fq0zdklF
	gZ6v6d4HnirbvKgfquZqvABQ/OVd5X2jiMizsNKYtvCRlvTSF7jtAGhGvDFqzw==
X-Gm-Gg: ASbGnctFr9YpV3GBHdXOgIP8xIPUOwwPPWmj1gCfuSv2ttzmKHVbWbTlK8S8ju0HW9w
	sosDSH0NOVZVE+OqVBg/AREVpbzHR/rCJzc6u1VsXuexIjjHQl6m6syLL30i1xKTOvj6s+IYbbf
	nO+QrbwWPYUenWkGuUVYHBpEfkJ6IiE/Wd+GYOcfLZya3xjFRTSDTHZqaZq1VdBPmnaj7efZ1gt
	JbbxSbMlwEsC0qOHGH8raX+gYwqYSY01iLqgi1BT9eUgnb+cd5Z1/dw4Cz8nMR9LnWWVKaB15Py
	p3SwuamqUWROiJmBn9zVzqAisKEzlR4vgQe2JlJbs73IDO/k3QmFH94KKdO8AktmnoEARjPaTu2
	Eaw8Cl9uacn4=
X-Google-Smtp-Source: AGHT+IHcqVsLPI+51JosDHpXkGEs6pwEyMBhfQy242VvLJCZQHEGYu8rHXRwD4dMUIQCOCO9SHAoIQ==
X-Received: by 2002:a17:902:e892:b0:246:461b:d455 with SMTP id d9443c01a7336-24944b799ffmr149772645ad.57.1756793402203;
        Mon, 01 Sep 2025 23:10:02 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da1b35sm122060935ad.84.2025.09.01.23.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:10:01 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [kirkstone][PATCH] pulseaudio: Add audio group explicitly
Date: Tue,  2 Sep 2025 15:09:56 +0900
Message-Id: <20250902060956.1690567-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 06:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222708

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index cbec6f1377..1744da6aad 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -25,3 +25,4 @@ weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
+audio:x:529:
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 61d5bb00ba..7b9d245c07 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

