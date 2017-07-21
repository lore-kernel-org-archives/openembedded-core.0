Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id B508477E9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:25:22 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id p188so44693263oia.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lGuRfioMNsoVLoRE4XUzmsm6ah7+InZyuKu7lorZPx0=;
	b=i+EuxQw+RLJXtBMkLhFm7PDGdYnXQdxL3JdKf6RDX2NCGRSpGwANk1kOPnwaLsreak
	sbETqi0cT4z+zlKVaEppJ3tQWgb/WQcbR3cE8oNQqjpxqauDBBXsUvn5klRIzVJgaxS5
	7C3eBsDPCvP0o9L9D8T5JJeGa8WPR3d6HfntfSA8jX/GgOxHNy0gi4aZcNaSiVDTPxBk
	LNpoHBRU3jxRQzP8yPSm7UoyFAM643vWu6rjM/sEI8pHwRocTvTlyw0UFbp0QCu3LRpo
	cXs8fe8vOZYTvG/Kt9opvgLq5OaBMLUHp8kxnHQ8iWVPOU9OZckmiaSWAW735CKSHJ0Y
	J9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lGuRfioMNsoVLoRE4XUzmsm6ah7+InZyuKu7lorZPx0=;
	b=NlyLoDXE3CdDJf6FhLFRAJVJskbHq0zeylnJF4hxgZ57hGcpWergC8i04QIZHrJIU8
	+cO8TkPVHfUwGchKxocAjWPPB91V8zqziwPnLI0/7EI0HPAKHR5XCUzRD+J3IMBb7XJu
	9x+qgf/aWgLtBHxwrGshWwhQADr0zoPxVTNs4sN7JuZc6bU5V1DvFXYg2Fgsmb8jZGiw
	hJa9Ezlm86dpODKbzinloF+IPt7aqjGF4Hnwds9hqsQdhCqTGRg+1atJoYmU+/48J4YR
	5cVQrFitGaY4Gax6cvYQziVqyJ+E/0oXU67+3xPB+trtfmpTy49T9G2QnHgY26G7tJjX
	NCFg==
X-Gm-Message-State: AIVw1130oxohztUjsB+Amd95gyX2Fate1Gz+3UC3lsJknO8mDVoeT1+l
	oVm3i/PgnNBXoK1s9LE=
X-Received: by 10.202.172.75 with SMTP id v72mr1199909oie.1.1500618323594;
	Thu, 20 Jul 2017 23:25:23 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE14.dip0.t-ipconnect.de.
	[93.232.254.20]) by smtp.gmail.com with ESMTPSA id
	s186sm1417023oia.6.2017.07.20.23.25.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 23:25:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 08:25:13 +0200
Message-Id: <6ec30f4afea1c6aa5e7c0cdf42852176aef6cb87.1500618300.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ovmf-shell-image.bb: simplify dependencies
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
X-List-Received-Date: Fri, 21 Jul 2017 06:25:22 -0000

The image consists only of the EFI system partition, therefore
we can avoid depending on the default wic tools.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf-shell-image.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 029547b..0d2b8bf 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,10 +1,13 @@
 DESCRIPTION = "boot image with UEFI shell and tools"
 
 # For this image recipe, only the wic format with a
-# single vfat partition makes sense.
+# single vfat partition makes sense. Because we have no
+# boot loader and no rootfs partition, not additional
+# tools are needed for this .wks file.
 IMAGE_FSTYPES_forcevariable = 'wic'
-
 WKS_FILE = "ovmf/ovmf-shell-image.wks"
+WKS_FILE_DEPENDS = ""
+
 inherit image
 
 # We want a minimal image with just ovmf-shell-efi unpacked in it. We

base-commit: c4c2fb3732dbb290b7f0ca43af2e8662f99e4582
-- 
git-series 0.9.1

