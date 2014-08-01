Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46A937085C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:06:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7196oVK023066
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 02:06:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 02:06:50 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 17:03:38 +0800
Message-ID: <0fdb514ba5f34fbd679717a1b4ebc475eee9d3a2.1406883469.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406883469.git.Chong.Lu@windriver.com>
References: <cover.1406883469.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][V2] oelint.bbclass: Check for ${PN} or ${P} usage
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
X-List-Received-Date: Fri, 01 Aug 2014 09:06:52 -0000
Content-Type: text/plain

Check for ${PN} or ${P} usage in SRC_URI or S.
We should use ${BPN} or ${BP} instead to avoid breaking multilib.

[YOCTO #5427]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/oelint.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index 07a7ed9..d00f468 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -64,4 +64,22 @@ python do_lint() {
                     bb.warn("%s: %s doesn't have Signed-off-by" % (pkgname, item))
                 if findKey(path, "Upstream-Status"):
                     bb.warn("%s: %s doesn't have Upstream-Status" % (pkgname, item))
+
+
+    ##############################
+    # Check for ${PN} or ${P} usage in SRC_URI or S
+    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
+    #
+    for s in srcuri:
+        if not s.startswith("file://"):
+            if not s.find("{PN}") == -1:
+                bb.warn("%s: should use BPN instead of PN in SRC_URI" % pkgname)
+            if not s.find("{P}") == -1:
+                bb.warn("%s: should use BP instead of P in SRC_URI" % pkgname)
+
+    srcpath = d.getVar("S")
+    if not srcpath.find("{PN}") == -1:
+        bb.warn("%s: should use BPN instead of PN in S" % pkgname)
+    if not srcpath.find("{P}") == -1:
+        bb.warn("%s: should use BP instead of P in S" % pkgname)
 }
-- 
1.9.1


