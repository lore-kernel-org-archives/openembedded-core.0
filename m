Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C15860110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:25:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r10so18709900wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NUKsme7m6gMYiwof7VKo0B8jyMOYS1qZlh20yii+8fo=;
	b=XsL3a+GItVRgn1k/FdB78FHQvYJfD5LORfa8I6JOjxNCSMiGf3mLLJ6DuHQIyozu1O
	2Mbpz5vbxE0y/EMIdY9ivdcpHpW0xWAF7YDFoNS+fqw0hLYJ0ifBMD+4NWcGDEU4L8SS
	Ne4yiSbgRflUCEB3NDWqpCVTmRUuIhkpugR0fcnfAjJXRRy4M19zKXvEGZx6PIZcbdQp
	Dkqo2AYTdOIABpTsLqgzStvBYvX7/cIWrZtkx07KzGRv6VWkIU8uvQJkDAKqpZOGLAq0
	RBDjjPac3HW6F7zFmVr3lOOxmRlGjqlJaImd8DqgOzo9quLB90Q07oyQUp2amCMcdYVO
	Y/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NUKsme7m6gMYiwof7VKo0B8jyMOYS1qZlh20yii+8fo=;
	b=njwi021koCWHF/REdDQBUNoQLYbG7P3lXXTeXVMICgIap5HwLFZAzPgls5X0cnBS5Q
	VFPARL2L4LM0B9z28fSahstcqEzMbhw7vfheXYQmEsMfU+4KkOazLYfv6Vx9EZIVle/D
	W0T/psRrxKjpLfcuHg+YaeeU/Z8V8V0NEVZhD+ytYSatrzT428b9vIfXkoD21G1K0P/f
	bpUAY0rANGYpoAaeTVzqdPahnEgraesKv+xlbMlpUuuxZBwZAS2aHFcJr2+XCnCb2KMC
	VaKkCV+XqLE4gpV2jZIqGbSOeMgZxBotzbZLD8/6UtEwzs0+vu3r/PWLgjMf8fQ//l/1
	kAkA==
X-Gm-Message-State: AJcUukcT7uPve2CwryPTwm5zKyNxTek4u78RxzVjVIwkCyMVJjjMz7BW
	gwEb9igsjCJTSPgejdllNc+zz/ZR9rE=
X-Google-Smtp-Source: ALg8bN4DqRxWRRWBqXjmpWYuT1rjU7Yrib3bWK1hQifp0J4PM79vRQVP2PrtzZHzNOwMxnG/rtCzeQ==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr24022561wrx.149.1548692732891; 
	Mon, 28 Jan 2019 08:25:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d16sm94557969wru.52.2019.01.28.08.25.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:25:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 16:25:28 +0000
Message-Id: <20190128162528.3009-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190128162528.3009-1-ross.burton@intel.com>
References: <20190128162528.3009-1-ross.burton@intel.com>
Subject: [PATCH 2/2] linux-firmware: split out liquidio firmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 16:25:32 -0000

Part of this firmware is a pre-built Linux kernel, so it's both huge (25MB) and
triggers binary security scanners as the kernel is 3.10.87.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2e5d0f3e945..d337d07a533 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -300,6 +300,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
+             ${PN}-liquidio \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
@@ -860,6 +861,8 @@ RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 
+FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
-- 
2.11.0


