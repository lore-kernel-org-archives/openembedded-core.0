Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 51553607A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:43:07 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 11so3688178qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=QO36ptig8UBsgMWmdYij5CzGBfNo1D6f1lkMyWVXJE8=;
	b=Um5KHl97GXoO38Z9E87W5VGaV3yujD0M+0j2DkiEyjNzb1hCJw6YT/RETkHBd5XUqo
	DQrh5fmMte9IN0HwhOlYP4mJ9OOXo9/HkPf1VhFT5DBUrR5Up+CUXR77xTL0vrQqFEyw
	0xvq6ow4U3Qk8KR/Ul3+aL6QpoiYbsSvrmPrtM4Ctd6BFt2LmZUvByXkuNKpTIm7n7c0
	fYnwQheF8tpU86R7H16lEXz8EDIwWsTAdFbVX1jNcP3RZpPD0tTSw9FH9JXVdrKcT/uW
	/QQGPUYe7X2gJDcgmmKQ8Lft32MR5YGUPzQHrnjIgW8bWUFUQycyg/fuFlssTRYted4p
	GxZw==
X-Gm-Message-State: AA6/9Rker/6RXOUnWbe2EUvKsiSKVYkGHcv2xOCqs5HJHc75O5FR1dlwMWhXDxvj5K9bUw==
X-Received: by 10.237.60.44 with SMTP id t41mr8822192qte.102.1474648989309;
	Fri, 23 Sep 2016 09:43:09 -0700 (PDT)
Received: from localhost ([179.105.252.78]) by smtp.gmail.com with ESMTPSA id
	m201sm4245818qke.46.2016.09.23.09.43.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 09:43:08 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 23 Sep 2016 13:43:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 13:42:59 -0300
Message-Id: <20160923164301.560-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] qemu.bbclass: Allow use different QEMU binary depending of target
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
X-List-Received-Date: Fri, 23 Sep 2016 16:43:08 -0000

There are architectures which support running in 32 and 64 bit
flavours however the simulation is provided in a specific QEMU
setting, requiring us to use a different binary. This patch allow this
to be done using, for example:

QEMU_TARGET_BINARY_ppce5500 = "qemu-ppc64abi32"

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/qemu.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 75739db..f2d4d1c 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -4,6 +4,11 @@
 #
 
 def qemu_target_binary(data):
+    package_arch = data.getVar("PACKAGE_ARCH", True)
+    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch, True) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
     target_arch = data.getVar("TARGET_ARCH", True)
     if target_arch in ("i486", "i586", "i686"):
         target_arch = "i386"
-- 
2.10.0


