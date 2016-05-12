Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D2AA26FF25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 16:19:55 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y84so8274828lfc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kPPVZqQVAsUGQn4D7fkqpJiUPufxSPUzShqi51Lm8U8=;
	b=ZQ/w38CouUyhKrdViYpCBIe5HZ61tUEcb5R+CJDWg0gKjsCZ725EtGkT7rqUzny+3q
	fQFdm/OLC3T6KC6+iKW4PZJMreNlM/qx49cypXki/hKFgH4Ft8BG7Dg1nnfcUFzmcLZ/
	f0fWCxbr38ycvjbeBJ6z2f2G++2Sa4c693QQaAicRADlGcTAC6s5vvU3HrsnEyhjfUuH
	5q+ojmdTYWFrcjDeGGBEFPWM/L1yWF9gS8xuPoDjyQ+GX/81Tts80iWa/KAJVDAm/ujS
	0Uz7l4IDuU3FQvGOmjR+buN9meqP0KXSFkbXfFTduCV8R8Z78gZi4+lrBMAsnU39aBxn
	UIyQ==
X-Gm-Message-State: AOPr4FUmKL/0Ex/zweTQeIdpO1sq6bBo7KPCHQrCKBRfcQUrzOjfRyY82dd9IOvqP+myTA==
X-Received: by 10.194.100.129 with SMTP id ey1mr10690524wjb.26.1463066886114; 
	Thu, 12 May 2016 08:28:06 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	wb10sm13987583wjc.8.2016.05.12.08.28.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 08:28:05 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:28:00 +0100
Message-Id: <1463066880-17505-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461662967-22851-1-git-send-email-git@andred.net>
References: <1461662967-22851-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2][krogoth] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Thu, 12 May 2016 16:19:57 -0000
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

(cherry picked from commit c7f139a0538515356b27367a753882abd6c4534d)
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


