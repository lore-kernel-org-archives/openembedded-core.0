Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rqe9W-0007g1-OO
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 06:15:10 +0100
Received: by pbaa13 with SMTP id a13so1115385pba.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 21:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YOTQQ+9wuYQIrE5N8JD9Op7O7KiT2Yf8CGOom2CB3Ss=;
	b=CbW1cBiO7eBsL0DkKa7o2tZVz1bX7Zec4rKbSJV/Ub+jwgqZzgo+54as+1na4+h4T8
	VxGGMgbHXuyFfdPkMa+3Zo/U94m8zPAQoz4D7o2JCcQv9Gxw50Qj5vhbe6lkelyu0AFu
	BmMy2qxEDvnuvAnB8gqbcg6q8BJ9BEhvozygo=
Received: by 10.68.240.235 with SMTP id wd11mr11409695pbc.119.1327639190555;
	Thu, 26 Jan 2012 20:39:50 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x8sm16846627pbr.11.2012.01.26.20.39.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 20:39:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 20:39:30 -0800
Message-Id: <e229b17cf6ba547d0f9064025450937b063c04f9.1327638861.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327638861.git.raj.khem@gmail.com>
References: <cover.1327638861.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
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
X-List-Received-Date: Fri, 27 Jan 2012 05:15:11 -0000

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
1.7.8.3



