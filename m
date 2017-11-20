Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4B87869B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:11:23 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o14so9224159wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wH+1tLeU68vI62JU+tj350PoYpJ7Yh5Pbomp63c69BA=;
	b=NqhhtIczwtR4QczLoWKwCMOpJUb5O3KztQdF4d6/17IhrqNEkIlPdD97XoxGMBtf2D
	oA3lq2XlPVJAoowXHEphTCJFaok1x751AH9MXAub6v+BIf+VllFyaZte36I6tiszUeqD
	9+D+w0rZhXyK0BtsZnOUr3rvS+VQ/qZfC5+KXT8RxHPS0F6pBsyIpQNwL3U6ZQO8yOku
	a0mbI5U5VkrueEQsoAEQ9qzzEyatWnYqdvXUndlRAVW2dOfxDK56u6WYhYk7oGxe2NfY
	0oAaaVV8S9M3ahg0r7dXXp4wqb9KQDplEFXSNYN8M6quZ4Ev9+wtMl75UCCTech9GV2b
	/sHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wH+1tLeU68vI62JU+tj350PoYpJ7Yh5Pbomp63c69BA=;
	b=Vg190QJVOZvoK5iyZQnCLvWuE7BCf9wHneEEPKez5KiYjJGY9YwXXvin60ww0+PEus
	bUF/z4cjLCy04+VdyabtimyOGJTwy2CBxyvQe7BLIEpy/JeYOWdSq46v8n+fc1pPMm1u
	dlZYCEA/WAGfy5EU1g507jpnGu7c3YellxOXfgNedMpezFA32cy5s8LGef5BkZ9IbRFO
	hbOf4tTFCnZSjVsDN3Ty60q4kUQW50hA6I7I4g2P87nh/VB9A91GzukyQDitW1qTabEJ
	WgHi+Sbv0c/Ua8KEfG18zyTdx85BjBaOQxGqqfKdBNGdBXIpHqDq6qxPWjFm/2asor7Y
	fndw==
X-Gm-Message-State: AJaThX5V/vwqgJOPx3aaZa9TT1EFg9MgNFnYhM4vMvg7JYJ6Hb1GHa1F
	eRuPOhn8qPTx+JCBglEyD203Qg==
X-Google-Smtp-Source: AGs4zMZc+XSA4wSjrKyk8mc0BLSlFBG2nLeiTL0kyqDOhANLdIZhWQBryKjAMXDVVBbDRGw+RqWeJQ==
X-Received: by 10.223.162.196 with SMTP id t4mr12478413wra.42.1511208684276;
	Mon, 20 Nov 2017 12:11:24 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a5sm8186538wra.87.2017.11.20.12.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:11:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:02 +0000
Message-Id: <c8c3efe629810a10cdffc966965938eb36ef20e8.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 3/5] kernel-devicetree.bbclass: build DTBs with make dtbs
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
X-List-Received-Date: Mon, 20 Nov 2017 20:11:23 -0000

* migrate meta-raspberrypi change from Khem Raj:
  https://github.com/agherzan/meta-raspberrypi/commit/6c4de0b5fe44b8e661f1391ee8540a7f04d75315#diff-9b732ab86ef3483bb0e54684c28fd84b
  to be applied for all MACHINEs
* as a bonus, the raspberrypi3-64 won't be built twice

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index de12f26..1a1aa69 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -50,10 +50,8 @@ do_configure_append() {
 }
 
 do_compile_append() {
-	for dtbf in ${KERNEL_DEVICETREE}; do
-		dtb=`normalize_dtb "$dtbf"`
-		oe_runmake $dtb
-	done
+	cc_extra=$(get_cc_option)
+	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 }
 
 do_install_append() {
-- 
2.7.4


