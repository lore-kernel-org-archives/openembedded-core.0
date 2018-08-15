Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB32B78D29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:33:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v14-v6so1319814wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cF3sUovVSWjvXRhTMwUtP37SMp8vb88G0RPza02ld2g=;
	b=gU5ETBd8KUo3mSApC2vMUb30/RzvF7ae/lRoEoh42PTYW3SKHZh6IA2mmiBF2xdo8E
	jVsFg6ZYuD98ThOfU2D2SXmF+iPolV7QU/Gak4ilmzPox+upACevsOzX0mzPDeWh4Dmj
	+5G+BBrva4YiwRdKKDbeGhBPt/SUL6BkLrd2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cF3sUovVSWjvXRhTMwUtP37SMp8vb88G0RPza02ld2g=;
	b=FpWgGzHk5k8LnQtZTpqwP6VxhVlTYXJP5B6ivfDau0/Q3RopDJAf34hkhyydIaMbd3
	I15F2g/rthyd57NgaLO2qkHiDdWOX4B7cKTW9DtT0dwS6EjHOJqDtjyGGSNBDk28azxC
	clEnoSEj8C8mip/00P4qc27kWcgTTMR7q9NQyqBP/rpkTXMbir+S7ggnXlPxyo7lVuGB
	mxo2CawdxL/pbl0Oo9bRWaS4ePMs5QbURxhsRlU6q8mfMBL4IMrlLzF0UcOdA9vUuUZs
	8Xei8q//PfCGZJ+/aOV/VmTHQjY/EbJYOaYuDwKnagDzkD0tw2Bq3OA7RjlyOdlf2bD1
	LI9g==
X-Gm-Message-State: AOUpUlGQF+0IKs8SCmktTonJnX4ubhCByctXhf85IRnM9FtqpKmbAZuV
	KByVXCZ1vNSLvcTxmMvlbT+syMoG7Go=
X-Google-Smtp-Source: AA+uWPxHyPPEc0KBd5oV5gppkvHU9GNLRMarjUxlNquS40DWQt+T3zdbGu5uqXCUes/UHBpAkhjv6A==
X-Received: by 2002:adf:f485:: with SMTP id
	l5-v6mr17354986wro.259.1534343604221; 
	Wed, 15 Aug 2018 07:33:24 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y18-v6sm22403535wrh.85.2018.08.15.07.33.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 07:33:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 15:33:20 +0100
Message-Id: <20180815143321.21443-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [PATCH 1/2] sstate: Avoid indirect bison-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Wed, 15 Aug 2018 14:33:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Avoid adding bison-native to the sysroot without a specific
dependency in the recipe. This means indirect dependencies
(e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
dependency incidentally. This improves determinism and avoids build
failures when people switch to external toolchains.

Based on an idea by Richard Purdie:
    http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0a8f8ed9eb5..cc77d078a80 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -78,6 +78,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
 "
 
+# Avoid adding bison-native to the sysroot without a specific
+# dependency in the recipe. This means indirect dependencies
+# (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
+# dependency incidentally. This improves determinism and avoids build
+# failures when people switch to external toolchains.
+SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
 # Nothing needs to depend on libc-initial/gcc-cross-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
-- 
2.17.1


