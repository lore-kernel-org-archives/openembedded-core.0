Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 065D9601DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:13:27 +0000 (UTC)
Received: by lbbvz5 with SMTP id vz5so3896615lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aFoTst8SPJ0Dxosv1KucH1vUCUuWNOyEW/jk6hcSa1E=;
	b=JoTr7Rb8EgXbmOQpZmc2HuluDShcjzhOUSqhpTIlqmvmYoDBordYrRsY8dFTnElhXn
	SHM9dciwCwvg3lxGExrSU+/PINmxpxEiPL+OnVQWJcsVVSphY0zpLP0kCxWCuoTIeRAF
	ew2mRqhb0opXh0+122FqLMo442sFHYpOAdt3YayQHMV2NK1Jc2h0TnT1mzA7iFv6IGZd
	cFSDlEP/35LZ/37B6y+OXpcEvb/dAExW/nhsYozGZvU9awN3MHaa+9MbFjBTO18zn/SL
	kmrhYfUgrJD/8z/fKsjteLrse7nn8V+DmF/plkh/+bpW83FNy89NwGXgv6NspnNHPG1V
	7A0Q==
X-Received: by 10.112.163.35 with SMTP id yf3mr12668480lbb.107.1434633208541; 
	Thu, 18 Jun 2015 06:13:28 -0700 (PDT)
Received: from anuminas.rup.mentorg.com
	(ppp89-110-12-206.pppoe.avangarddsl.ru. [89.110.12.206])
	by mx.google.com with ESMTPSA id ja1sm1770636lbc.38.2015.06.18.06.13.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 06:13:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 16:13:07 +0300
Message-Id: <1434633188-3434-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/3] packagegroups-cross-canadian: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Thu, 18 Jun 2015 13:13:28 -0000

There is no point in overriding TRANSLATED_TARGET_ARCH in
packagegroups-cross-canadian recipe. The cross-canadian class sets the
PACKAGE_ARCH variable, thus allarch class (inherited through
packagegroup class) doesn't change variables.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index e3b1c18..34e6e2b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -2,9 +2,6 @@ SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
 LICENSE = "MIT"
 
-# Save TRANSLATED_TARGET_ARCH before allarch tramples it
-TRANSLATED_TARGET_ARCH = "${@d.getVar('TUNE_ARCH', True).replace('_', '-')}"
-
 inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-- 
2.1.4


