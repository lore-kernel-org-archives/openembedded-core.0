Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id C137E65CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:02:41 +0000 (UTC)
Received: by lagh6 with SMTP id h6so41370390lag.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bOYdzosS2tJ1Ny8kmUmjMtBmb+nfXkA6J+/U/Zme168=;
	b=TqPzbvYfA4ad+kvEK9kuf3cTSimscRdttzn4yyqsmHsoMBoxBjHzC345UkGxuIo1EE
	EFNFTeLGV97GpKEOuWeAMBCC3EQYwaylJRYSZGBJwbFx0yqPjV58AsYoGBuBLshkhkr7
	dcV63+QYyVsB68XQ2yPp1N7FuSMaUke1OazAtCmUUD59RFxAYq8zeAr9vwIVNd1FSyCv
	ChEfL417E40sTGTh4kjPf+X7Fmmdo7UIgkkBP2NGsCbbXoupmtNh6jrgteift7OuXkBV
	VweTCYhva5KsUTOVZSTOQvvdlnOGQIRiqmO6dTN796UrK33CzRZ0J9om748DVy/guJV/
	Kg1Q==
X-Received: by 10.152.20.228 with SMTP id q4mr26064183lae.12.1435759360411;
	Wed, 01 Jul 2015 07:02:40 -0700 (PDT)
Received: from anuminas.office.auriga.msk ([37.153.55.32])
	by mx.google.com with ESMTPSA id du2sm533722lbc.44.2015.07.01.07.02.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 07:02:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:02:19 +0300
Message-Id: <1435759342-5312-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 1/4] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Wed, 01 Jul 2015 14:02:43 -0000

Currently MIPS64 N32 is broken. There is internal disagreement
between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
encoded into the TARGET_OS. ARM tunes in the same situation override
neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
this override.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index c41fa5e..02626d3 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -100,7 +100,3 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
-
-# On mips we need to redefine this to include the ABIEXTENSION
-# we can avoid the python bit as there are no _ or - to translate
-TRANSLATED_TARGET_ARCH = "${TARGET_ARCH}${ABIEXTENSION}"
-- 
1.9.1


