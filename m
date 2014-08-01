Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22BFE65FE5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:18:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s717IL35021899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 00:18:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 00:18:20 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 15:15:08 +0800
Message-ID: <26c2d48cccb6fb2dfe6dd00dbb4ab191b7bd2b4d.1406876955.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406876955.git.Chong.Lu@windriver.com>
References: <cover.1406876955.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oelint.bbclass: Check for ${PN} or ${P} usage
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
X-List-Received-Date: Fri, 01 Aug 2014 07:18:22 -0000
Content-Type: text/plain

Check for ${PN} or ${P} usage in SRC_URI or S.
We should use ${BPN} or ${BP} instead to avoid breaking multilib.

[YOCTO #5427]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/oelint.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index 0bed74a..685a88d 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -62,4 +62,24 @@ python do_lint() {
                     bb.warn("${PN}: %s doesn't have Signed-off-by" % item)
                 if findKey(path, "Upstream-Status"):
                     bb.warn("${PN}: %s doesn't have Upstream-Status" % item)
+
+
+    ##############################
+    # Check for ${PN} or ${P} usage in SRC_URI or S
+    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
+    #
+    s = d.getVar("SRC_URI").split()
+
+    for srcurl in s:
+        if not srcurl.startswith("file://"):
+            if not srcurl.find("{PN}") == -1:
+                bb.warn("${PN}: Should use BPN instead to PN in SRC_URI")
+            if not srcurl.find("{P}") == -1:
+                bb.warn("${PN}: Should use BP instead to P in SRC_URI")
+
+    srcpath = d.getVar("S")
+    if not srcpath.find("{PN}") == -1:
+        bb.warn("${PN}: Should use BPN instead to PN in S")
+    if not srcpath.find("{P}") == -1:
+        bb.warn("${PN}: Should use BP instead to P in S")
 }
-- 
1.9.1


