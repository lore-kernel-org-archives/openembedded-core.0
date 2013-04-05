Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UOAPG-0002qO-Q4
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:26:30 +0200
Received: by mail-we0-f174.google.com with SMTP id u12so2966463wey.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 10:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=OVEuu9IGlgDnGbVjhIbpu7gJPkN/6l/5KPp6EkIxXWA=;
	b=bVCRJpXqLy/aTdwZxrtnh5JNHO5Dwfje3u9GJ6jWVsuAa6U4XfDdXRq+6int26YcWR
	aA24fIAcex3GG98BJZc1oPV5R+uVuvO7ITnkrhnLRBO1BTRGRViGORngHE05KNikk3OL
	vejxKf06hHSLVVUdR9pzoIjEtaiQLebdTVy/+BfE6AXN4MjT3JqBmcR+H8QMf6dl7OjI
	K1iB9KtqC2UN/O4MWboIS/X9JrcfSFF+oqysBitWZAYSDPOKuE8NNgFQRaYGsJQrwYor
	4Cog8WUDgxRt8cShTL8bLv2eD4sZJs2BlU975YfXHPK/NcOm3LokyeSxCT1Loea2CgBz
	oJ+g==
X-Received: by 10.180.87.170 with SMTP id az10mr83787wib.3.1365181756115;
	Fri, 05 Apr 2013 10:09:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bo1sm5558192wib.0.2013.04.05.10.09.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 10:09:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 18:06:31 +0100
Message-Id: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnXIz3nmdS5IfuYJiexuF6vO6G8FuK+2O/DXaUZg/tVpp7mJZ0iKw8AEsyDgfIgLc57k6eb
Subject: [PATCH] linux-firmware: make the main package depend on all sub-packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 17:26:31 -0000

Whilst splitting out specific large firmware blobs is a good move for space
saving, it makes installing "all the firmware" tricky.

Make linux-firmware depend on all of the separated packages so that installing
that pulls in all of the sub-packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5ee3b73..ef036cf 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -162,3 +162,9 @@ ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334.bin"
 
 FILES_${PN} += "/lib/firmware/*"
+
+# Make linux-firmware depend on all of the split-out packages.
+python populate_packages_prepend () {
+    firmware_pkgs = oe.utils.packages_filter_out_system(d)
+    d.appendVar('RDEPENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
+}
-- 
1.7.10.4



