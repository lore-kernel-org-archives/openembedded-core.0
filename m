Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 21F137823F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:25 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z96so9921282wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NQTYVuIRpju6VfJw7RRNsRuIx76TEOfdT+ymAxY8We4=;
	b=iNByKXs5zUTqBzQ9jq9saHTOeoiV/R2U5YCHlv+8E5jJZrAFlo/et1ngX85MT2RTH2
	eLL8s4ZgZ/wTK85Jc7IvAVXsDUV/eC6MPTTbWItfAYtWElhpsH4yKbTaHtrnrU1n0ZPd
	BUepaPkKj8XLGJ5l4cEHdDz5n0XE7XovDvissDTkBS7rC/SzHIZRxDm5uWKgqrU1kTee
	fUDC/NPVZ27VKVolj+xzc7ICU1v6svfOZlI6+Y7oFhHHTliUZ054fGZD+0xDHzqZudpH
	Y1v7mtNQCDKJYvvohfjj8QMcJA6ipee/TWyKm5NjL0Zj7WVOBja+4jNPBw2eoat207jU
	4kqA==
X-Gm-Message-State: AMCzsaVuD5aTpmYM3Lm54zs2gkP//l+XgEqbbrDD8zC5xDLpH4j95+5L
	xGB3qjsaks+eYqXHkXVN9dRkdpQV
X-Google-Smtp-Source: AOwi7QAcB1YF6T3vW2hXTKF//87PRCbA1BxMYd8rCh+7MGLM0e2MYSGxkCbmwtD1b2FXL0KGkXG2cA==
X-Received: by 10.223.129.41 with SMTP id 38mr2022941wrm.57.1507292006707;
	Fri, 06 Oct 2017 05:13:26 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:57 +0100
Message-Id: <20171006121259.5817-16-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 15/17] kernel-fitimage: support MIPS (compressed)
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

On MIPS, the compressed kernel image target is vmlinuz.bin

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 74d97569aa4e0f82e094a539dec302076103affa)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-fitimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5583b4472e..179185b6b2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,7 +7,9 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "x86":
+        if d.getVar("UBOOT_ARCH") == "mips":
+            replacementtype = "vmlinuz.bin"
+        elif d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.14.2


