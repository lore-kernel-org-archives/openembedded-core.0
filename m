Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOY-0004D6-Al
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:49:46 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so1809173dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pdsCXtCwR06zRJUFR7PTIyfTTMavEEdOz4erv5ChMrE=;
	b=ki3qmYJ+N6jlILmo3svbNgmt2A704XLJAPaEgEThjbjuqLq9ee9GxOuTf49+fIWzF0
	4TmB7bxnx1y+YYS4d3yrijjQbsMnnx8DsRmUlE/+Z3fe5abMIk9TKydh8XUh0YBYetJh
	oGDI9wtRHvicuoUCT9vY+Jae8OM8Tzt6NGN88=
Received: by 10.68.74.167 with SMTP id u7mr44839999pbv.103.1328510507572;
	Sun, 05 Feb 2012 22:41:47 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.41.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:41:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:29 -0800
Message-Id: <79776c1c9e7f3704ccd36cf506908fa0228f5921.1328510188.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 03/20] arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 06:49:46 -0000

Add no-thumb-interwork to TUNE_FEATURES for angstrom

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |    2 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index b7d6061..da29102 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -21,6 +21,6 @@ ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ],
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
-OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
+OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "", ":thumb-interwork", d)}"
 
 TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 66bab8e..8bd5be7 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -6,7 +6,5 @@ TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=strongarm1100", "", d)}"
 
 AVAILTUNES += "strongarm"
-TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
+TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm no-thumb-interwork"
 PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4}"
-
-
-- 
1.7.5.4



