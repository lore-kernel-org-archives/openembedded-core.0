Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id C3A6A7DC62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:10:10 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>) id 1hLRK9-000488-4h
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2019 13:53:25 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>) id 1hLRK8-0007Df-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2019 13:53:24 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 13:53:23 +0200
Message-Id: <20190430115323.25661-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430115323.25661-1-m.felsch@pengutronix.de>
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Tue, 30 Apr 2019 12:10:11 -0000
Content-Transfer-Encoding: 8bit

Most the time we are compiling for embedded targets which have dedicated
hardware combinations. Setting swrast default on isn't a good solution
for such devices because if the hardware render node have an issue or
don't support a special format/request mesa will fallback to the software
renderer. This will make it harder to debug performace issues.

A better way is to let the user deciced if a software renderer is
needed e.g. if the system has no hardware renderer or to have such a
fallback device. This way the user knows that the software renderer is
enabled.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3339dce33..55733585af 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -88,8 +88,10 @@ PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[kmsro] = ""
+PACKAGECONFIG[swrast] = ""
 
-GALLIUMDRIVERS = "swrast"
+GALLIUMDRIVERS = ""
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'swrast', ',swrast', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 
-- 
2.20.1


