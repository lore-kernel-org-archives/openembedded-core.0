Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnBT5-0004xd-QG
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 17:28:47 +0200
Received: by wyg30 with SMTP id 30so823999wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 08:24:30 -0700 (PDT)
Received: by 10.227.72.203 with SMTP id n11mr3823007wbj.16.1312039469823;
	Sat, 30 Jul 2011 08:24:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm2637714wbh.57.2011.07.30.08.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Jul 2011 08:24:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jul 2011 17:24:25 +0200
Message-Id: <1312039465-29540-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Sat, 30 Jul 2011 15:28:47 -0000

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

The fix might look like it's in the wrong line, but it's only place in the .inc where it works.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/arm/arch-armv7a.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index ce9cee5..6ac2950 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -17,7 +17,7 @@ TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
 AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
@@ -39,7 +39,7 @@ TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendia
 PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon armv7at2b-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab armv7ab-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + VFP
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
-- 
1.6.6.1



