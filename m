Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qnsov-0002Qd-2f
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:46:13 +0200
Received: by wwi18 with SMTP id 18so4766557wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 06:41:49 -0700 (PDT)
Received: by 10.216.159.211 with SMTP id s61mr725664wek.26.1312206109020;
	Mon, 01 Aug 2011 06:41:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m56sm3352111wed.11.2011.08.01.06.41.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 06:41:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 15:41:42 +0200
Message-Id: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Mon, 01 Aug 2011 13:46:13 -0000

Without this 'armv7a' is used as TUNE_ARCH but does *not* end up in PACKAGE_EXTRA_ARCHS:

arch all 1
arch any 6
arch noarch 11
arch arm 16
arch armv4 21
arch armv4t 26
arch armv5 31
arch armv5t 36
arch armv5-vfp 41
arch armv5t-vfp 46
arch armv5e 51
arch armv5te 56
arch armv5e-vfp 61
arch armv5te-vfp 66
arch armv6-vfp 71
arch armv6t-vfp 76
arch armv7-vfp 81
arch armv7t2-vfp 86
arch armv7a-vfp 91
arch armv7at2-vfp 96
arch armv7a-vfp-neon 101
arch armv7at2-vfp-neon 106
arch beagleboard 111

Which leads to a failing do_rootfs

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/arm/arch-armv7a.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index ce9cee5..704f86b 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -14,9 +14,9 @@ TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
 TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
 TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-- 
1.6.6.1



