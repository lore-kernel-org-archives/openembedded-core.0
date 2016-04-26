Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1C060119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:28:04 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id n3so28622720wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HYL5Rg+ZIMMRnvBPuoIfHHPrae3dupJwuOdywLWbYzw=;
	b=c95tbMCE1XxMl6YBavLI2wThreiUy9JmekgIrfhayePCWiEkrNn5LKCKuIBxqxiz5N
	L91kmTPdacSLUJIZ2KYhNhc8iIdBkurjMaiF7VyToK/Wc8v9PxMB4ai611hgstnnCmPC
	j16jt+z4K6sOo3cPj0meH0GmTJbISH4t3wBCRLJeFUewMdWkGQ0H+uy8sIDWgFbmHSZ0
	a9WhRFlZuFh84zaQTQj68tynC8p62juf5jgehYDadM6ivwVqTafb+UcfVtdwCVtzFios
	wQxCQwtdD8RibYrahS7rSFz3cIid9VoQ8DLaksoP3nCKhLzmiYc0PI+8DhKFy2yDss2X
	vJeQ==
X-Gm-Message-State: AOPr4FVhn6DEDjfiVCXjoq2e7tLJDDmQx/MYq3ocaYh+LVKkXlf25QPG1bpWFhZyF3fA+w==
X-Received: by 10.28.153.129 with SMTP id b123mr2571743wme.1.1461662885133;
	Tue, 26 Apr 2016 02:28:05 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	c85sm27035365wmd.0.2016.04.26.02.28.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 02:28:04 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 10:27:59 +0100
Message-Id: <1461662879-21557-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Tue, 26 Apr 2016 09:28:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 6661718 (feature-arm-{neon,vfp}.inc: refactor and fix issues)
effectively changed the gcc -mfpu= option from -mfpu=vfpv3-d16 to
-mfpu=vfpv3d16, which gcc doesn't understand.

Restore the original value.

After doing that, we also need to adjust ARMPKGSFX_FPU which should
contain the same value without dash '-' as it is used that way
throughout.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index 50d9175..b34af8e 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -8,7 +8,7 @@ TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' neon', '', d)}"
 
 TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
-TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' vfpv3d16', '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' vfpv3-d16', '', d)}"
 
 TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' vfpv3', '' , d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 4247255..bd366a1 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-- 
2.8.1


