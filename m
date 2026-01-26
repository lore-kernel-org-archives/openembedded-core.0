Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB5D13C36
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22094.1769441045412250945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJG09nvq;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c655e0ee70so587279685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441044; x=1770045844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhmK2ryI7Yquj9Dh0sDVeRuSnqsBQdUIyevqjlCuZZg=;
        b=VJG09nvqBO8+BSejx2Sx5V59icNGU71jZMv3gcXNdTj/ZTLg6DenkwPoTRzve9tKpH
         pZ5FOap2kWJsrljiH3xHmd0QbIT1vIdTnELl2+9pK/xFZv7XXXWCvplYLZT4NzA7TOAm
         GA5w8MpWjbIMRHBdQRxyGTIBZK3JmbbXYUdjB/vpL0RoioGE7euKgNWeCECu4HmxCG4E
         Czu+OhhQsejfubpcEOQrmWRPQ9q6WkciueqjYaz62gnxm99OyiXT4x+AKEsLwixm33o2
         P9XPVGoUGqLV30ZU0iXMlTelYpBhP3Ni0/TTqtqjl3/1lARrN4HkOeQYnZtVurROJqH/
         I6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441044; x=1770045844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XhmK2ryI7Yquj9Dh0sDVeRuSnqsBQdUIyevqjlCuZZg=;
        b=Xo/mlizHmgSLgNMoIn3AIwZFR+5ogw3ygdqIJ/9eLYXDBK+TJMl2zSJa7bpM/kYWl/
         YgpAjbD1gxlQHUEonp6v1VzU1y2o5inwc787Nf+1U5sDZLfFUtc4mly1JKovmKsEjZOu
         3BiZtuqw2LWgmqseKKq3/16igZ7z7AaIBGO1BlMIFRQb8tfZRip7rYR6l9E36o+xsakQ
         Nc2MILkaNTnZ6jEBc7Oo4Dq5Fz+EwNKYJf/7+vWC6SBSKByO53gAnAC6nWGdH6icfoM3
         JcCE42IBSznBBK3yMGxOSxswYBdQTfZDGD5de+I6LgKoIGKjZGwNM9w4nO52oJ2/Lb5j
         NY+g==
X-Gm-Message-State: AOJu0YwlNq9ACYgT7YmT2GDMLHq5wXVb40jqJBLuRS3rP9X/0qwdJpcb
	fwIodvSFJoa0IxdJxOMWDIYpAZHeO8nFPNM6WXUP1SkVplBw/5xT47aEWlQyqTNqfYI=
X-Gm-Gg: AZuq6aKIjNk2YqhcplZ+KR551EOBXEpgZC+DXQCBSUc21t7M++lrZ4ga9uXL+9cPx0n
	uxZIZsNonBYRu13UjBcfBwn1Xt5SSlDMlm51koJp9aBIgQFBs7lx7Ozwjf/4e1EfHbGf1/0njXN
	MWPKlcblHjZyPDV+BvkNdCmX3/5nvslSqUpUjdOEF2hwyshwzEHpV3Cq9JLa6FO6tWDe2AyheoY
	feMcfk9rItImaVAqhwkIYQP7OOSVGyZGsBD0ZGKo8dA2cgu1hJeHbkLOFZ40D75TUM/FP+j2kbu
	Gh/VMsNcvlqMtPIFu7bH6ZBS7c8Az6tygMaTwH216b2+fyuJA+pQc1WEvw7qaphDt8LWyEMLoRM
	VnDeCvJtZWfQ3JWdm2MfIQcvSTp+QtjvtgtVcQk2v9olwRDFOb+tqKvtm17fNhrwHLJuUlmYH47
	XCZSSHSgGNptllcwqVnw/uK9KH3dFE9Mc8lcDjlAsNHgGPhD0KcqwHlgoEn760RyBWGGHaBRFXU
	xhU7NMbzr9Xzcg=
X-Received: by 2002:a05:620a:4620:b0:8b1:728f:952e with SMTP id af79cd13be357-8c6f95fdbefmr555246585a.31.1769441044374;
        Mon, 26 Jan 2026 07:24:04 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:24:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/07] linux-yocto-dev: update to 6.19
Date: Mon, 26 Jan 2026 10:23:53 -0500
Message-ID: <20260126152353.2328046-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230018

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the -dev kernel to 6.19. Boot and tests have been run
on all major architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fb4e0864d2..2ca7777a5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.18/standard/base"
+KBRANCH = "v6.19/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.18"
+LINUX_VERSION ?= "6.19"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


