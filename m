Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B9AD660721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 13:51:09 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id z134so111036451lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0pMsaGSxGUgA5kDA3//HwBEhw0mEocMnCNx4FVoBVi4=;
	b=ybp/FPpUN/y/ITPf8Wlz4tdOuyejhNEijtizo+Kgs+avttuZN6zjdVxI3fp8sqXIMR
	TiwMDEXNto40wu76q/5iyMJ5EBNhCGTreg9iLhX4JJGyH/j/vjbiOxL0TOSVmrKfEm4R
	7S7E0e19sQ1IIAHRa/N2D8Pr8gDHceb+u83A2oJrLkeOp7oLkzFuTyIk4XhO8SNCQkXD
	P/xtV7H0MXvixKNuZBw5I5kD7capURz7jrThf1PG7c58nKU7K+psCj8takeImYha9/O5
	S6enuTFs19UmymsMeHUFeuJUM70TgRqatWrzIQv7IvFVTjQrjCjGSsoPUijM7m/d7a80
	dC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0pMsaGSxGUgA5kDA3//HwBEhw0mEocMnCNx4FVoBVi4=;
	b=kC4NzcGsIFDOvWUDogC1gGruGkWPWryt4XaRYeEcD93UCJLSJqfyushNPCdPIcJB69
	VVIz4SJjT0AF3JiMn7CdbjOOmBL17haOpkkMhWSFTSWi4q3AdlsruPVaZ+YADXYTxGHB
	ZlUWu+8LOyNdzdeSjNPkyos26hv70Fyc+bq2jq5MLZZznuoG1NcCRZxZeDqTe52F+FVz
	0NRikB32RzHtkmWXNRXL1zIrAWWkcqemOQfH0daEnYzWWcJhwjVZZhq0wg3F9ewMhz3Y
	V4yh8idnXOTfmn3L5jA6S4ulag2SSm4oD6Iue09EMC0RZ1ZPDRAC2szB0WG1cOEkfDDi
	NzzA==
X-Gm-Message-State: AIkVDXJYwhSg8+WxKhFG37Z6L3HB6tFG2Cxee7gzCYY8cjz/pnO2tApiQ1xhLxhTYd1Arw==
X-Received: by 10.25.22.96 with SMTP id m93mr11585883lfi.101.1485265869297;
	Tue, 24 Jan 2017 05:51:09 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h76sm7331982lfg.39.2017.01.24.05.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 05:51:08 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 14:50:17 +0100
Message-Id: <6e2081903352fbfbc818384ce44dc58c3da507e3.1485265775.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] staging: fix logic of guessing dependency manifest file in extend_recipe_sysroot
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
X-List-Received-Date: Tue, 24 Jan 2017 13:51:10 -0000

Recipe sysroots introduced a change where dependencies ending with "-cross" also
count as native tools and (see setscene_depvalid() for details).

The same logic was missing from extend_recipe_sysroot(), hence for depency named
`go-cross` the manifest file would default to
`manifest-allarch-go-cross.populate_sysroot`, while the correct name is
`manifest-x86_64_arm-go-cross.populate_sysroot`

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fc387eaf4bb52971e111ae7deac7d7d6fc389337..efea450e4f73661366d0929d5c39e42bfe9f8e8b 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -521,7 +521,7 @@ python extend_recipe_sysroot() {
             native = True
         elif c.startswith("nativesdk-"):
             manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
-        elif "-cross-" in c:
+        elif "-cross-" in c or c.endswith("-cross"):
             manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
             native = True
         elif "-crosssdk" in c:
-- 
2.5.5


