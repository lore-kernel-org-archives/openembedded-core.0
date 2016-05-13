Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4282160667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:56:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so2044883wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 00:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ffZUAJolE9mkT3MVeh5pZpgZ9v4UPd9fS7RdsmErp9Y=;
	b=E5aFxjyv5lR3KlbQMG/YSowE7CC7m4b3RlnaYfuJquEjVhY5Jg+MTk1xzKRXbqCQzr
	Bh2F3FacLixTe4p3UpuN1Q7+isd7Ur4fQaszvyu3A9lHbrAzwfck9rhKgqjPYrW3RYDK
	fR3bAyCNi32Qg7mSdRuwaYPs2PaXEYxQJOzL0Pc7MavABrQirYHHtTwCSSb1VfNU0KKh
	qX5TOtJ005dVTnCoqAOOfVRz8ciXcGicEP3KrZf9WuMit90sfBA9qfXJSQ8tdQk97hkl
	qmDmx5pwUnJNvlLVy/4BwlRtHiGl2+YEfNd6ZgzDhq7DmCB+BpcGBr//9ueNROCkoSHz
	T4mw==
X-Gm-Message-State: AOPr4FU0L0CNhbYkxK3+XC4yJCV7UqLvFiVEYj+mBsOWh+8B5UC/IBxzR9C8Eiq0j+ZoZw==
X-Received: by 10.28.30.148 with SMTP id e142mr1985384wme.69.1463126195427;
	Fri, 13 May 2016 00:56:35 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	r123sm1886892wmg.20.2016.05.13.00.56.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 00:56:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 08:56:31 +0100
Message-Id: <1463126191-24272-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463066880-17505-1-git-send-email-git@andred.net>
References: <1463066880-17505-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3][krogoth] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Fri, 13 May 2016 07:56:37 -0000
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
index 4247255..9ef31e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-- 
2.8.1


