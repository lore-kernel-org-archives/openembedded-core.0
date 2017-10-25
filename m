Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA6A771F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:03:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z3so3564456wme.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/m/Gm8SSg4viIN78PhdnglwLgt1WvbEXo0znlnf1NXE=;
	b=ebmcYVzL6GlQKom0WGW1keYvyNWB1NDqURykL4iuf4F3f1U0yKB2x5T2NR1AzO4MoE
	HGHlXDhG39VKq71WYlwA7ulpQSNt84vdXbZZ843GZisac7b5HRngI4JerSqApPVo1m5r
	mAn9XLsfhjmkeSmIjSLAShdAGJM0QI/f2ZGs62SOoPAkbW9/8P85g3cMkIa5WL6hxqPs
	bog28EzY2K5iD/D3fbTLI19V7l+7XakcWSICNCvR9y2LeYGz5SQcFbBVMrjmVLz5hiCe
	hWH+iv869nnxRhshAdGV8ce8PzhWDouBlg18LRRXnwHMVBf1GUToDdBll2iG4LajM2VK
	4XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/m/Gm8SSg4viIN78PhdnglwLgt1WvbEXo0znlnf1NXE=;
	b=MH7rXi+39h3Xip1fKJv9CxvvBsJKGXEMWX1u7dewclTgL3JWjiU52QCnKFxghbTXvx
	Im75pSJlyPxk0Ji5D7ki1l8ZveqoYhYOmSe5Gji2TWEVXY9+sImkEtgimINYxu14+cTK
	trIF4KXa/5bDGaARkAAJ64lREPhZUUbvBmWj5rQZQEK+1TtjipDMmOYVFsiWKEQQArsT
	YD5w5rjxYBVZotV/WBtIW5xTkW0dMLM5BR9QfizoSIgLCvVOrvcreiPmA0wfyV0V9rhJ
	/9SdINCGyKzjHVZ9oyEhJne0RQRp2H1t+5uLsp4ewdIem6nB8IH7SCmLxTDjQ3Y0XZVA
	dQMw==
X-Gm-Message-State: AMCzsaWIr5KbPemLTrGPDyWavhsMRT4w9BdhbFKhZo/f9+k3DOX9I/9n
	q5W/zjq2D6TjCH8u41zeC6J7b3Wj
X-Google-Smtp-Source: ABhQp+S4VEcbnsFZcLiPbnsR5hmq7SRRNbzdesD87d1CDs61D1tYnQp8tWZAh/cuFRRC2zkWKgVMcA==
X-Received: by 10.28.37.195 with SMTP id l186mr2756945wml.144.1508954597466;
	Wed, 25 Oct 2017 11:03:17 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	b190sm3243487wma.22.2017.10.25.11.03.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 11:03:16 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 20:03:10 +0200
Message-Id: <20171025180312.10308-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][PATCH 1/3] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 18:03:17 -0000

Bad image type replacement for aarch64

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b6b2..9baf399f2e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,9 +7,12 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "mips":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "arm64":
+            replacementtype = "Image"
+        elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
-        elif d.getVar("UBOOT_ARCH") == "x86":
+        elif uarch == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.13.6


