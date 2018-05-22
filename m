Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 124D6749CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:25:56 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l1-v6so33103422wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+kRyCvFloyUOphMyJ5Jn0nH1g8FBB2cmEcOwCbPC84g=;
	b=pvjkRqVjBqxuJdUOjwBv521f/ms3mCL9WqEK2OLNNw3EHELRjJuFXmznT8KZPNCjpf
	WaipPwDGrwenPHRsBN4X4mrk9aHNxIeQT8mNVKdjWFYB9nd+4OQXU8IaOGovG05r/ZJP
	TQkBRHJ0tG3l+I0Qkki3lshTuSrcE1h1smalCSaOWXRTpPL25AzfsZAPP8gF98fWjOUH
	pnGC22B6b078UVjesAsgt5H2H6/sntTAsyj5RvS8qZHVm+J6T/Nk8Fa1Mj4mvQ/E2Bok
	gQwXbAzeWIG7LcOTVDS+n2h6cfx/FfDc4LbABx9UK1U8YOy1vY+uJl4bB7nWfvB6WTSx
	lPJA==
X-Gm-Message-State: ALKqPwf/vh+9mnYWGvzKWe8v2fyFomSxxj5jjD0vloU57LMw7a58EFqK
	i2JNadaT87VregKGbWF3c3Umworv
X-Google-Smtp-Source: AB8JxZo5uT8PrWSINV0F3JyLKokAVMS6IBMPDQpKPWGvFrMePunhqWrTwEQXcOuyl+/x4grZ+AK7ZQ==
X-Received: by 2002:a50:b042:: with SMTP id
	i60-v6mr2060888edd.68.1526991957271; 
	Tue, 22 May 2018 05:25:57 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm8752163edd.39.2018.05.22.05.25.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 05:25:56 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:25:53 +0100
Message-Id: <20180522122553.29109-4-git@andred.net>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] sstate: avoid indirect bison/flex-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Tue, 22 May 2018 12:25:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Avoid adding flex-native or bison-native to the sysroot without a specific
dependency in the recipe. This means indirect dependencies
(e.g. X -> Y -> binutils-cross -> flex-native) no longer meet the
dependency incidentally. This improves determinism and avoids build
failures when people switch to external toolchains.

Based on an idea by Richard Purdie:
    http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0a8f8ed9eb..106f9900dd 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -78,6 +78,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
 "
 
+# Avoid adding flex-native or bison-native to the sysroot without a specific
+# dependency in the recipe. This means indirect dependencies
+# (e.g. X -> Y -> binutils-cross -> flex-native) no longer meet the
+# dependency incidentally. This improves determinism and avoids build
+# failures when people switch to external toolchains.
+SSTATE_EXCLUDEDEPS_SYSROOT += ".*->(flex|bison)-native"
 # Nothing needs to depend on libc-initial/gcc-cross-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
-- 
2.17.0


