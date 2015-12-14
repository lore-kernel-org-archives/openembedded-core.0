Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF576E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:47:51 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p66so55553986wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=G/pgg4HAEdnKkvKbfaCBRjaCHVwWzgWnYbgr3t4qcrI=;
	b=HgNBu0fG0+HtXBLdT1JDwElhbUu1oE9LnEyfzsF7LOR7NFd7N5Su6UUMyhKC4oTnBK
	YEZ2ThsSjr07l/SocRGst0CCV0QeCrF+mECvHdGj6dRu0nXsWALb+v+EJP1rNdbKUkDX
	NNkB0ZrJRPY1n5AD2AcuJ1jN0Toba8CBhClwvGPCmUErHJ5ihrq7OBb81qhd0IZv5iq3
	9q0FHsVHGHYZYnMxnOGxIAjG3QdWMYdnbwoG4YmjFTDtbO7m7HAmejwgL3JDHP+X5u6+
	ais7lYpnXap2ipeQsFQSDUAcAvEdUeaD0kWmwBIITIWcSS80SNBJO9tlLkQZHw+KQlyG
	sW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=G/pgg4HAEdnKkvKbfaCBRjaCHVwWzgWnYbgr3t4qcrI=;
	b=PHnSYE0/fibZO3kPmCs6evnba/W7agUMfah626STDPJhz4pM1Pw9nI1Z45t2XMwRul
	iWYxM7BsjBfh9ZMmK+6cGu0XPIBs0/fLA14MZ+EYhakao2xRSD0Wkp5WtZ2ElgjyEHJV
	A25K1rbN5n98sYEcn2UZ6QiYsvFexRT+yabMoeYNae0h4s9CmsdPTQIzMxOr6yjNJhNi
	i7GPfIqjUD8S5ANTyvUDOxR2aoWQ7anfhK5i+uZbcE5fMzU6A8uKzTgsNdLRQvI3Iv8A
	Z95a5giVXqnYLg75yPtKmZTGtlFS59KdM+v+s4y6goPXfeC6LGSD/V9rHzmOVa4h5fqr
	xQkg==
X-Gm-Message-State: ALoCoQnEe7Je7isvsNRbc3oBdeWjyum46eSfPOvgpkx/cd6940Tb0ppC0fX3zJ7M1pRX07PP6uYrp6I5Pfjcfew80hQffA9PFA==
X-Received: by 10.28.132.146 with SMTP id g140mr11346220wmd.70.1450115271416; 
	Mon, 14 Dec 2015 09:47:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w203sm17045714wmg.15.2015.12.14.09.47.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 09:47:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:47:47 +0000
Message-Id: <1450115267-23620-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] webkit: fix libdir/libexecdir confusion
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
X-List-Received-Date: Mon, 14 Dec 2015 17:47:51 -0000

Files didn't get installed to $libdir/webkitgtk, they got installed to
$libexecdir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 221ba17..421920a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -69,7 +69,7 @@ EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
-FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
+FILES_${PN}-dbg += "${libexecdir}/webkit2gtk-4.0/.debug/*"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET = "arm"
-- 
2.1.4


