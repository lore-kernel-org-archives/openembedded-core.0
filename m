Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B35D60112
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 18:37:15 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so292664523wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VJ1L64jIYkMFBzdgTtnT35qxX4IYxwFWTlLNymx2buc=;
	b=CEq5V0RDMh2iidsNIiL1DtlwqyCldvkbTNSTR4XpQi8DP229HQnfGZwKStsNesnTqg
	0qUndJo4vP7gbdVNb+VH31SuID0z+zR43BpeovIdpMdMe0prTM6fPMM3+XIBY/cnw6P6
	lGIFJL7n/2ziy3pErAnx409mkRQF8v8EeY5dPvZLKmaSNN3wgEHb3vDf4r3wRk/FTUIY
	SFb1F4ASTdSG8rqfK2pIQ+ca4BjG5Gah0ChEC51/F90yURJZ1NBHU6iB/Dua+PC5SnnZ
	GzEhfVMvpyKD2oudL/WoWOABLyXknfE+6q8xybff7Eux1drMaKVjRP8noNFL8TwND3FF
	w2Gg==
X-Received: by 10.28.12.3 with SMTP id 3mr11465923wmm.84.1447871835762;
	Wed, 18 Nov 2015 10:37:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kj3sm4124948wjb.19.2015.11.18.10.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 10:37:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 19:37:21 +0100
Message-Id: <1447871842-30347-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3 5/6] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARMPKGSFX_EABI
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
X-List-Received-Date: Wed, 18 Nov 2015 18:37:15 -0000

* without this change it wasn't possible to use call-convention hard
  together with vfpv4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index e23d377..75c05fb 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -13,5 +13,8 @@ TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
 ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp', 'vfpv3d16', 'vfpv3', 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
 ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv3d16' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv3' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
-- 
2.6.3


