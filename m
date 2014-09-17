Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 470C865D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:08:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8H88oJO018089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 01:08:50 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 01:08:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Sep 2014 16:08:30 +0800
Message-ID: <4974ccfdd59cd584893c3026595e0045e9be3cd6.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410939794.git.hongxu.jia@windriver.com>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] sstate_lockedsig.bbclass: add event handler to dump lockedsigs at recipe building time
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
X-List-Received-Date: Wed, 17 Sep 2014 08:08:53 -0000
Content-Type: text/plain

While the class in use, it adds a event handler at 'bb.event.BuildCompleted',
so after the build completed, it will dump the lockedsigs files.

Use SIGGEN_LOCKEDSIGS_CONFIG variable controls where to dump the lockedsigs file,
the default is placed into ${SSTATE_DIR}/locked-sigs.inc.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate_lockedsig.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/classes/sstate_lockedsig.bbclass

diff --git a/meta/classes/sstate_lockedsig.bbclass b/meta/classes/sstate_lockedsig.bbclass
new file mode 100644
index 0000000..ea88260
--- /dev/null
+++ b/meta/classes/sstate_lockedsig.bbclass
@@ -0,0 +1,12 @@
+SIGGEN_LOCKEDSIGS_CONFIG ?= "${SSTATE_DIR}/locked-sigs.inc"
+addhandler sstate_dump_lockedsig
+sstate_dump_lockedsig[eventmask] = "bb.event.BuildCompleted"
+python sstate_dump_lockedsig() {
+    d = e.data
+    if e.getFailures():
+        return
+
+    if hasattr(bb.parse.siggen, "dump_lockedsigs"):
+        lockedsigs = d.getVar('SIGGEN_LOCKEDSIGS_CONFIG', True)
+        bb.parse.siggen.dump_lockedsigs(lockedsigs)
+}
-- 
1.9.1


