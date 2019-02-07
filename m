Return-Path: <prvs=39412d319b=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0FF7C41D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 15:58:01 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x17FuG0d017708 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:03 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2qgn8x0hbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:58:03 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x17Fw1Xv006172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:01 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Feb 2019 09:58:01 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Feb 2019 09:58:01 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2019 09:57:58 -0600
Message-ID: <20190207155759.6082-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
References: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-07_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 2/3] libsolv: fix segfault when using SOLVER_DISFAVOR
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
X-List-Received-Date: Thu, 07 Feb 2019 15:58:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Opkg --add-ignore-recommends use the flag SOLVER_DISFAVOR. If a package
is set to be ignored as a recommendee, but there are not other
recommends on the package graph, libsolv segfaults.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...y-disfavor-recommends-if-there-are-a.patch | 33 +++++++++++++++++++
 .../recipes-extended/libsolv/libsolv_0.7.3.bb |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch b/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch
new file mode 100644
index 0000000000..139613a0ad
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch
@@ -0,0 +1,33 @@
+From 19d7cc87adba92d31d5fafdf7db00920d24a96a6 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Wed, 6 Feb 2019 13:24:04 -0600
+Subject: [PATCH] solver_solve: only disfavor recommends if there are any
+
+In a repo that have pkg 'a' and 'b' available, and 'b' is disfavored,
+but 'a' doesn't recommend 'b', libsolv segfaults on
+solver_addrecommendsrules, since solv->recommendsruleq is null. Only
+call solver_addrecommendsrules if there are recommends rules.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ src/solver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/solver.c b/src/solver.c
+index a80090d19..ad78327a8 100644
+--- a/src/solver.c
++++ b/src/solver.c
+@@ -3920,7 +3920,7 @@ solver_solve(Solver *solv, Queue *job)
+   else
+     solv->yumobsrules = solv->yumobsrules_end = solv->nrules;
+ 
+-  if (solv->havedisfavored && solv->strongrecommends)
++  if (solv->havedisfavored && solv->strongrecommends && solv->recommendsruleq)
+     solver_addrecommendsrules(solv);
+   else
+     solv->recommendsrules = solv->recommendsrules_end = solv->nrules;
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
index 44757ac54f..3fe6f2c20a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git"
+SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch \
+"
 
 SRCREV = "dc7d0f1c3113f2c8217563166906bef3eb5d1ee1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.20.1


