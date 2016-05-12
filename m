Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5D662134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 15:35:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w143so16563343wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BvnVKEWy43PqFl0LblS06KwNqwLIPVTM2fW3yq2Uv5o=;
	b=d/qgAMOBvg0glq0ALmzF9QDWbjGjBnpnmjzYnStOhhDADh2yCTb8Ezylqw32vekGml
	KkxgV5Sr5Wz5Tsw4H+shI2ZGsrt8TXk+jLD/6yMEW9G2pRN3I2rrHTzATU3nr9qWEtuW
	nIebuvuq74GgxEMWkioUXfR/CtXdlwF52fCaU4AHhpW2989+lFTe09s+dsyTAhEFadDP
	9j0QDrFFrf1voEMYN3m/lKTrlg6UZtxzjurcaxgLe4vmhE2eECF40MTaUGkeMNQXQFOH
	E7DaJIS1Ed9G+m+OmTmAe8hHmOdKZOM8xJ94VCAN5aKH/k1FFuwXJILwnM5+vjWXYOIn
	L/cg==
X-Gm-Message-State: AOPr4FWElYp4ADqF0JKCYz9D5iOmiEWOBhmYlSObSMccZXnPgyNjqpB+rZ16dEJbByMsow==
X-Received: by 10.194.240.230 with SMTP id wd6mr10012249wjc.86.1463066274435; 
	Thu, 12 May 2016 08:17:54 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	xt9sm13914034wjb.17.2016.05.12.08.17.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 08:17:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:17:51 +0100
Message-Id: <1463066271-16234-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] feature-arm-vfp.inc: fix overzealous ARMPKGSFX_FPU modification
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
X-List-Received-Date: Thu, 12 May 2016 15:35:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 972b4fc (feature-arm-neon.inc: restore vfpv3-d16 support)
we're replacing _all_ dashes (-) in ARMPKGSFX_FPU, which is causing
problems for all legitimate uses of the dash as TUNE_PKGARCH doesn't
have the right value anymore:

E.g. on raspberrypi2:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp armv5thf-vfp
armv5ehf-vfp armv5tehf-vfp armv6hf-vfp armv6thf-vfp armv7ahf-vfp
armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp armv7vehf-neon armv7vet2hf-neon
armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon
cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon
cortexa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE (cortexa7thf-neon-vfpv4)
does not contain TUNE_PKGARCH (cortexa7hf-neonvfpv4).

Fix this by being more explicit about what we're modifying.

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index bd366a1..9ef31e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-- 
2.8.1


