Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC7F758FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:08:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B98iXn010587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:08:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:08:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:08:41 -0700
Message-ID: <36f39e2c2edf08ab582347c3e1aeb3b9eb82824b.1434013682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013682.git.liezhi.yang@windriver.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] base.class: warn for invalid PACKAGECONFIG
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
X-List-Received-Date: Thu, 11 Jun 2015 09:08:44 -0000
Content-Type: text/plain

There may be typos or out of date values in PACKAGECONFIG, check and
warn them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8637f9f..46762d9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -341,6 +341,11 @@ python () {
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
         pn = d.getVar("PN", True)
+
+        for pconfig in pkgconfig:
+            if pconfig not in pkgconfigflags:
+                bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
+
         mlprefix = d.getVar("MLPREFIX", True)
 
         def expandFilter(appends, extension, prefix):
-- 
1.7.9.5


