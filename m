Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE1A0760F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 20:48:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8SKm9wk015495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 13:48:09 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 13:48:09 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 15:48:07 -0500
Message-ID: <84cebe96ae387a312fce6779f5491969a5bfb37c.1443473220.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1443473220.git.peter.seebach@windriver.com>
References: <cover.1443473220.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cross-canadian.bbclass: big-endian ARM is also gnueabi.
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
X-List-Received-Date: Mon, 28 Sep 2015 20:48:10 -0000
Content-Type: text/plain

If building for a BE8 ARM target, arch is "armeb" rather than
"arm", but ABI should still be "gnueabi". Otherwise gcc won't
build.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index d30a168..ea17f09 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -67,7 +67,7 @@ python () {
         d.appendVar("CANADIANEXTRAOS", " linux-gnuspe linux-uclibcspe linux-muslspe")
     elif tarch == "mips64":
         d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
-    if tarch == "arm":
+    if tarch == "arm" or tarch == "armeb":
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
-- 
2.3.1


