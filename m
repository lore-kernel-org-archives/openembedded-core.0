Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8B43A7E25E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 20:39:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45CTNT054Bz4H
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 22:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558989561;
	bh=kP/7V5BqtRegwCexG+y+O+/uhwxxZHpO10SBjvr05Cc=;
	h=From:To:Subject:Date:From;
	b=BqL1H0P9UNlc37cqPmncxWCwcS0Xoobt+BqKswdUGK6FNXnRcg54Gdg7Pn12Inkve
	HOo/JQPvNbMXe9p4UsUe9G7QAE37QlCwu2JdF0HqfIMG3foGOwXe1GJ79qiFILf3fc
	bnxz9XAGemlQWpxHyraJYTiFEOfhTkC9YD+aB8aapE3LkgmlDCBU7xWVK/V3bXOgvF
	TK701PIF79KOoWwmWQTlgywjvt6K8Cxx+rAD0Lk5gVUFItBdbf1PI269IiQwcgRS80
	A9RHQsIUOx8OydZeNob698MM84ix+AJpcWp0ZyQOKZWvnWtVU98jbUMNYCv2fjnsEU
	n5EqeYkMZUKsM/OJn/uiJEw5M2XYJoK/Xo+3+GmLJjbIQw133CI+8eWyVxi7u5vz0/
	M1Ly0lnkZ0Kb7vH8UW40ffutIfpBhTRJ+lHoiAd6sUbxRzkfCekWZ0x9xd8zBd2Kln
	Gd0Rl+XGHz87HeCvYWK7zap93BnD59PbnDJsxjOCO5SwdbEFMrMYw//XCYYY++oSIG
	cxaaU1D/GvTTaHVLg5kYTORCBBznGh5sHWwYAt52O3TNs18Dkmk1N2aUS/x2lkP1gw
	CyWbxKRxXxL3ceyAkBtAanfmIVHWPKXM/AOB3afYUXOUOuwJkysVIdqJI+M618wOlR
	xtOguSyHLbqk3gj5FtTUtNv4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 23:39:19 +0300
Message-Id: <20190527203919.26326-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] go: Remove INSANE_SKIP_* textrel that are now handled in go.bbclass
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
X-List-Received-Date: Mon, 27 May 2019 20:39:20 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/go/go-dep_0.5.0.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-devtools/go/go-dep_0.5.0.bb
index cfc2186b31..a4d631f8ea 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
@@ -19,16 +19,6 @@ RDEPENDS_${PN}-dev += "bash"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# for x86 ends with textrel in ${PN}
-# http://errors.yoctoproject.org/Errors/Details/185630/
-# ERROR: QA Issue: ELF binary '/work/i586-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep' has relocations in .text [textrel]
-INSANE_SKIP_${PN} += "textrel"
-
-# for aarch64 ends with textrel in ${PN}-ptest
-# http://errors.yoctoproject.org/Errors/Details/185632/
-# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test' has relocations in .text [textrel]  
-INSANE_SKIP_${PN}-ptest += "textrel"
-
 # For compiling ptest on mips and mips64, the current go-dep version fails with the go 1.11 toolchain.
 # error message: vet config not found
 PTEST_ENABLED_mips = "0"
-- 
2.17.1


