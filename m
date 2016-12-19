Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E205B77331
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 17:19:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b1so9011044pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bIxT3c8tOfQ+IjGiqXmQJHkHdbPwLbw4/KudeAbd39Q=;
	b=Zhn2mQZ97SOpuqbBb6WSGvZrCU16tyP+lJUQ8T/OceVt4FpBcZvc0i+ptP+av11+L7
	VVMl/zSh6pKmFKfSYHFVTZEDmjoL7emJTOsFCoXZqqvZmI+g75aUQK8x/LuaAXQttAOh
	/en8vpx42ytl7aBw7cih8mMYpyExELPX0rgQUJLNAStV99jkv+xryBLeotpVOSvFZQUz
	YArVdhKei3ll4dAsnKHgDJmqxlUWQQXS+96MppEgrQjGfxwGZCiehCFiJbTQ3F5DDRZV
	cSl8x/dCi7nmPRDHS0VWBMTQN5E0OG0KxHktDKFCpRlsqlP8/fejvMzCCaBxZYD13uJF
	+Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bIxT3c8tOfQ+IjGiqXmQJHkHdbPwLbw4/KudeAbd39Q=;
	b=g0K1s3L8rfIkamdcG8TdSBMUOKdXikCeXnPd+vot2lH9ldstITtYCjynXUca7Fdk4E
	X7Iv1rLAHR2zGDGHVqSkdwostlGTm07fNFKrg4uX0e4BHznOM74PKTbje7fC1i34c1ri
	Yo1We88TTJvuUBCV14Knfd8NFT6Z1jSsCyN9+y5IUYcaJ08RUKNlMQI6xS/yJ0JF6jQZ
	z+1WKXSzeFvuBHgLkA82bTi/AbLmui9ZdH4V3Mi04NmUge0aDtjvrOtVsLTiDCpeFIZL
	K2LUQ+HmzIAchIx70gdEpWHuNHR/dAOBlBXcwnQWR3Phj1DkAi09dqo8jpo9kKUYXyT8
	90ag==
X-Gm-Message-State: AKaTC00i3cpSbd1s1hZCfaU2BdVo3bPZ8tElp3mdr9jLmo4XCgxgmkyX8H7TB2hg/n3EUA==
X-Received: by 10.84.179.165 with SMTP id b34mr36664091plc.162.1482167963439; 
	Mon, 19 Dec 2016 09:19:23 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	f132sm32846180pfa.72.2016.12.19.09.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 09:19:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 09:19:14 -0800
Message-Id: <20161219171915.10651-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [V3 07/10] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 17:19:23 -0000

Disable asm to fix

| You specified a pre-MSA CPU in your CFLAGS.
| If you really want to run on such a CPU, configure with --disable-asm.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index e790681ad3..1dafdd53ae 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -24,6 +24,7 @@ X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
 X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
+X264_DISABLE_ASM_mipsarch = "${@bb.utils.contains("TUNE_FEATURES", "r6", "", "--disable-asm", d)}"
 
 EXTRA_OECONF = '--prefix=${prefix} \
                 --host=${HOST_SYS} \
-- 
2.11.0


