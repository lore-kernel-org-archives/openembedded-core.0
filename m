Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA366E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:24:45 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so39566764pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 03:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3D6bvdFBapmVhAHgZHLjGBbj4Hpv/iwIiLMuO08xr3M=;
	b=h9fWKwi8VH5Vq0EiVpJUjMaH92gtkcj+WUxaqCQwGsWwzzddYthUkuh25GHrZkwtOV
	8BmPnguQHZF5d+mKJlPYALxQIe61VSc0zQvjrFJVrGCTClmiBb4BSxKoOSAzbtI42raI
	rwTHeu3xpNl2pM0da8BNYD9dBGWu7HPCz1NH+i6RHmAqa3JFDvArXQaaK3PQ+MVrRpjR
	L3dCOAS47g1H1gWQtDKiDEqWX2sv5IMd8oPA93oFMDHmkO75aXEF7BcaguhgZkxgZAwC
	F1ZfgEac8fTxApsP5I70MUTVMdtr268Xa+8vvdSyw9RZ0A4+CxfoFZ8K7VtcMJNBPK+j
	/k0A==
X-Gm-Message-State: ALoCoQkJ+TADeVrm5r20A8f0iel5l4Z5QV6t6+/jou0bdxCtT8H8vCc93t0M18f04/GXEU5Lu0gq
X-Received: by 10.66.144.165 with SMTP id sn5mr73848237pab.122.1441880685807; 
	Thu, 10 Sep 2015 03:24:45 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	by1sm11183915pab.6.2015.09.10.03.24.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 03:24:44 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 20:24:12 +1000
Message-Id: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH v2] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Thu, 10 Sep 2015 10:24:47 -0000

U-Boot will compile its own tools during the build, with specific
configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
enables the use of openssl-native as a dependency and also adds the
HOSTCC flags that U-Boot uses when compiling the host tools.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
* Changed from using an unconditional DEPEND +=, to using PACKAGECONFIG with
  the "openssl" config and defaulting PACKAGECONFIG to enable the "openssl"
  config.
* Reworded the commit message and comments.
---
 meta/recipes-bsp/u-boot/u-boot.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 990ddb1..3d00b14 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -15,6 +15,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit uboot-config deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
+EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+
+PACKAGECONFIG ??= "openssl"
+# u-boot will compile its own tools during the build, with specific
+# configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl is needed as
+# a host build dependency.
+PACKAGECONFIG[openssl] = ",,openssl-native"
 
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
-- 
2.5.1


