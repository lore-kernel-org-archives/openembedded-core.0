Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 978066A941
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 19:41:59 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 142so7951095ykq.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=8WWeQxBDTYdXNWWh3zVHUNs3kf+RZW5tLUOkDyDWdjs=;
	b=0BKIQN5zynkxZln7n0FlNvrl0IrOr6ZqIP4W+akh6LRn9aJetK59ol5FUNrOKMeJVC
	Udmql0PtFMK3CQSjYmY5cMeWewKeIp3ClHe8oVvdZ3guxibVkGzSFv8LNXRKyErWxUJh
	U0ZmWxuqoczSODhmwNNT/qJfV68cCJy+627VrXMijxe/68ZsS83b4XWSxOT5R1ITf9nB
	vv7J+PnMJ++zkemuacBAQ9XpCrnGPMbbJzKD8TlRP/nLhVCxlL2gUyu9A1f4S8rzfBXX
	Aton9hgUAFJ+Xk5bN8Vb2atW1glw2ospsn+PMYhFd/niAur1GVFIc08hdHrfinyQooiH
	DMPg==
X-Received: by 10.236.109.35 with SMTP id r23mr25236109yhg.33.1410032520513;
	Sat, 06 Sep 2014 12:42:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id r77sm2391971yhr.28.2014.09.06.12.41.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Sep 2014 12:41:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 534681C4C0F4F; Sat,  6 Sep 2014 16:41:56 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  6 Sep 2014 16:41:55 -0300
Message-Id: <1410032515-4718-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] packagegroup.bbclass: Use immediate expanded PACKAGE_ARCH value
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
X-List-Received-Date: Sat, 06 Sep 2014 19:42:01 -0000

When the PACKAGE_ARCH is dependant of a override, the expanding is
done too late triggering the false-positive error of wrong inclusion
order.

To fix this we use immediate expansion operator to evaluate the
PACKAGE_ARCH value in order to choose to load 'allarch' class or not.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/packagegroup.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index a79d5b0..56cfead 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -9,8 +9,12 @@ PACKAGES = "${PN}"
 # By default, packagegroup packages do not depend on a certain architecture.
 # Only if dependencies are modified by MACHINE_FEATURES, packages
 # need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
-PACKAGE_ARCH ??= "all"
-inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH', True) == 'all', 'allarch', '')}
+PACKAGE_ARCH ?= "all"
+
+# Fully expanded - so it applies the overrides as well
+PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
+
+inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) == 'all', 'allarch', '')}
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
-- 
2.1.0


