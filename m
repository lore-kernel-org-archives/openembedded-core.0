Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A55CC4321E
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.34457.1638006855189573990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=brfORvTr;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso8336496wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nTid/ic9NvR8Qdd5e4hLUGeVzcxumpU1xiQB9PqR3Oo=;
        b=brfORvTrelbLMLIA4ZQTA+IjR80nTpqdf+XOij+ml7AJzSR6MoP8bBpF3BvpVYaw4q
         KqAH7uroZE5s6OxKmYpGm7wdgjGVVOmKRp8MbK6FVBQgjyFuBrVlrrg5MiBeuASlJeSA
         yZzg6BAr5/lE2wba80F0+HoXneSGxTQlBWnS1ADAGVandoCebLI7FeaNHSc71I98369g
         /NHgiKCju4IsuJTJkkelGUpQuxre5IrlmzQz4/MKyBpsw0/fuESx+zw92qbCTvpnv5/e
         mdOMRakDlnjPzsvcGO5ghdBEgLLWkosBtVBuFhFj2fOfzz3urUf0fzX8jJHGoEyBFlhR
         W/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nTid/ic9NvR8Qdd5e4hLUGeVzcxumpU1xiQB9PqR3Oo=;
        b=qW4BYiLu13MHzJ+qT3cunnHRjuZ78RQX+eKVKH6yIlhKoWaOrTM1qRpBzwTxYSHVDt
         DOf9jXRAHMqTbADnFekmPDUo+IgeersvFvgBY5rtmUQHlFYUdKGyrDbZvJpT/yclqjFJ
         YOSQWFkSC268mpIBQxjZ9adNfHfv/wXv6kyL/aWI7LJlB5NeojgL5QBvIurqS0Z+0YCB
         lSzzpGG98QRTcfYTH0S/Wa3lD9GJPwYrCPspEHAKJzXXNm6hVUdKVF49pJ2yDo7pVMVs
         EJ9SV8rAfUQpFWniB22soYqE4mjQ65j/uNUNrulqUrqxelzMO3UmzYT0Du7iKmR+VLZM
         j5KA==
X-Gm-Message-State: AOAM531IKgi6XGWwtrb8vMPiWW45e+9qVGHJqVmkF4VuLNOLNLwq+w7H
	fHh8tghFsqr5Z79uWICwU4NCP8uZ6sQXwA==
X-Google-Smtp-Source: 
 ABdhPJwAxh7/IZ5Wkr6/yntv3NIyqDAoyxiELXNYlnSvjwKk8G3iAnAYLOSk1UTM77/k3AHz+l4N7w==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr20963390wmd.103.1638006853773;
        Sat, 27 Nov 2021 01:54:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] testimage.bbclass: request the use of kvm by default
Date: Sat, 27 Nov 2021 10:53:53 +0100
Message-Id: <20211127095357.1748429-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158858

In almost all cases there is no need to explicitly ask for it via local.conf
or similar custom config:
it is enabled in qemu_use_kvm() if target_arch == build_arch or both of them are x86 archs,
and QEMU_USE_KVM is set.

If that heuristic doesn't work, QEMU_USE_KVM = "" will do the disabling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/testimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 9980b3f626..e606de25fc 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -36,6 +36,7 @@ TESTIMAGE_AUTO ??= "0"
 # TEST_OVERALL_TIMEOUT can be used to set the maximum time in seconds the tests will be allowed to run (defaults to no limit).
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
 # TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
+# QEMU_USE_KVM can be set to "" to disable the use of kvm (by default it is enabled if target_arch == build_arch or both of them are x86 archs)
 
 # TESTIMAGE_BOOT_PATTERNS can be used to override certain patterns used to communicate with the target when booting,
 # if a pattern is not specifically present on this variable a default will be used when booting the target.
@@ -75,6 +76,7 @@ DEFAULT_TEST_SUITES:remove:qemumips64 = "${MIPSREMOVE}"
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
+QEMU_USE_KVM ?= "1"
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_OVERALL_TIMEOUT ?= ""
 TEST_TARGET ?= "qemu"
-- 
2.20.1


