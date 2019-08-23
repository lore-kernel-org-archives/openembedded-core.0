Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E422C7F274
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FPBl5pDzz56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 16:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566571071;
	bh=aqHJw0pMiG9ZHXNuxpFZEWys4o/EKhk0zSIF1+YyGxs=;
	h=From:To:Subject:Date:From;
	b=HyV3qTAvNbjVxJQIluIYrpUXaC+F945st1U4Wi+Q9vqk6GVFuYpL4IxnefzJq3zc5
	IxLqB3Dxh61nvQSpsAC+b2q3hdWuF6WFEeOWkmGWcdgdeaezr/kE/9qr8MRGnJlHOh
	FVmPOe2NwauEZqJ3ahMIgSbz07FtME8mFVn3gooBRtHhyyzFJylH4fGVSqxeSuirzH
	cnRn2/7vf7D6QySC61uGOb6Vudb26vMtJZWCAn+OAmOTsuhEKZmv0HkoIwCeDRpIyl
	6bX0Sg0wPFfq10IFKa2NQCGesKgg5XNTplXeFNmgQzPB7ZjuFLAr+UF2Dnn0rrEibq
	yMTrVcOsfGPW54JUd6IQ8wIzxb1LLy3Fen9AN9Cd1EjIxJKfpYJs55s9SggjeNhcvk
	9UEr1Yq+gDOr2rsCvMLcjOFv6IC2lkJFla99cTFbSqtfcD6Enb2o19JsV52WaBAwg2
	NkqHVM/HD3+vZBlbsZSLHbRE6g4JBMy81R/Sz0T4oq0KCCYVMLtUaaTEaDhB1ecmuV
	1yhyR3kUrct4VN3BBNufSL/oQ1iIq6prG6ssh6JbLR1lVOSJpwRFnBGekKAKBjitKw
	ya458ELNso+ADpnbAtDtKQlQk2wWSP/Rs7z00NpJnLx9NvmU19EYlNkQLq64Pn10cP
	gR92SGJmqSY63X/jvC22C9C4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 17:37:49 +0300
Message-Id: <20190823143750.12232-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Print a buildtime warning about the status with musl
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
X-List-Received-Date: Fri, 23 Aug 2019 14:37:52 -0000

It is possible if a user really has to use it, but not recommended.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_242.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index ceee3aa0cb..6fbb854886 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -615,6 +615,12 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
+python do_warn_musl() {
+    if d.getVar('TCLIBC') == "musl":
+        bb.warn("Using systemd with musl is not recommended since it is not supported upstream and some patches are known to be problematic.")
+}
+addtask warn_musl before do_configure
+
 ALTERNATIVE_${PN} = "halt reboot shutdown poweroff runlevel resolv-conf"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
-- 
2.17.1


