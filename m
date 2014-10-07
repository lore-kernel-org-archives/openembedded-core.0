Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 389DB71186
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 12:07:37 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s97C7XBD006409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 14:07:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1412683657;
	bh=bM9MDI/Sga/ZsX5J4eSO0YooJO39cOh6opK4wrY6rnY=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=VUA7cWZ9RB5Qs48Z/vhy2A0Y7AZ5sIgCwuYGUk5cNLp/uAx43j4g9y97QbY3Fz7Qk
	v7OqJ8yaJQ4Qt8UfaYtO8LqhMMpj9bOAU/2Qo+XL3gmdy5QapsJMIUC8EKczVPeybP
	VRhGHgMNT+n1z/0n3KzwbPQ0X58Wuiow6a4e1y3c=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s97C7IeA022528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Oct 2014 14:07:20 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XbTXy-0007v0-IT; Tue, 07 Oct 2014 14:07:18 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 14:07:11 +0200
Message-Id: <1412683631-30406-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] boost: fix build when ${PARALLEL_MAKE} contains '-l'
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
X-List-Received-Date: Tue, 07 Oct 2014 12:07:46 -0000

The '-l' option which is valid for GNU make (--> limit by load) has a
different meaning in bjam (--> limit maximum execution time) and will
break very likely the build.

Keep only the the '-l' option when passing PARALLEL_MAKE options to
bjam.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-support/boost/boost.inc | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index ad1bc76..d34ca7c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -106,16 +106,24 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 def get_boost_parallel_make(bb, d):
     pm = d.getVar('PARALLEL_MAKE', True)
     if pm:
-        # people are usually using "-jN" or "-j N", but let it work with something else appended to it
-        import re
-        pm_prefix = re.search("\D+", pm)
-        pm_val = re.search("\d+", pm)
-        if pm_prefix is None or pm_val is None:
-            bb.error("Unable to analyse format of PARALLEL_MAKE variable: %s" % pm)
-        pm_nval = min(64, int(pm_val.group(0)))
-        return pm_prefix.group(0) + str(pm_nval) + pm[pm_val.end():]
-    else:
-        return ""
+        # look for '-j' and throw other options (e.g. '-l') away
+        # because they might have different meaning in bjam
+        pm = pm.split()
+        while pm:
+            v = None
+            opt = pm.pop(0)
+            if opt == '-j':
+                v = pm.pop(0)
+            elif opt.startswith('-j'):
+                v = opt[2:].strip()
+            else:
+                v = None
+
+            if v:
+                v = min(64, int(v))
+                return '-j' + str(v)
+
+    return ""
 
 BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(bb, d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
-- 
1.9.3


