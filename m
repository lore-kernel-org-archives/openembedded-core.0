Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEld-0000vk-Pe
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:13 +0100
Received: by pbbb4 with SMTP id b4so2433706pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pdsCXtCwR06zRJUFR7PTIyfTTMavEEdOz4erv5ChMrE=;
	b=DMjKR0WH9EZFTjI57nQK3ViCxDgJ/iuv6HclP6wMB34mvtMk/elIE49cy/imYQo3p6
	f6rNN6nYM/cw1GylvDdZYLgOrlkhIUOlX20xgXrNMrkqyldJaXD2sQQYvgagwSu476JK
	ksghFdbABAGhlLXmfq7QHUaIqX3Jod1GpBYSw=
Received: by 10.68.240.235 with SMTP id wd11mr16004578pbc.119.1328258236038;
	Fri, 03 Feb 2012 00:37:16 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:08 -0800
Message-Id: <ee370d1d031a4da25e032f6dc6d6b3ed64dcfba4.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 03/14] arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:14 -0000

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



