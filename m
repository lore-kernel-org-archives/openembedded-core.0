Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10334C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 07:43:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6728.1707464613700569185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 23:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ln9PFFjQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2769c299df=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4197Ladt031771
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Feb 2024 07:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=LAiq9
	zTx/0fQMK7UrMsmEBabkc6GRJE3vGKUEqXXbOI=; b=ln9PFFjQjzWD+22tJq0gC
	nK1MFXC4M19q0efVgNGmrc2xMLcO1+v5qPDj0RD/cWUZRT2uWmMYsBxlzM5iQxm5
	8IGIiA1wuMVblJIBY8cufo8X3nGRkSkXlwekITAU4e6Dg+O0ykLh6kDRktgul3Lw
	olHE07tZKN+rijEjNAj/yyWcxrJ8w7UnQYFT2Q52q44JsC2qxGZpxzMvI8Qd1FPc
	r8NOK6wttCwPEfyrutgnJC35MDPXdXt8elq83ED67oXfOUAA8T0rf1dcl6QgZsiM
	CZ0ugLWhgsrVNcdITV18V+pKSMaJuB9rNzWlnjHMADhBtthWFw/pDZIbxIn/O/kv
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs7dyn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 07:43:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 23:43:30 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libgit2: Fix CVE-2024-24575 and CVE-2024-24577
Date: Fri, 9 Feb 2024 07:43:02 +0000
Message-ID: <20240209074302.430638-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: hYftsZOJ96_7mfxD_DmeVkZXrcUY3drH
X-Proofpoint-GUID: hYftsZOJ96_7mfxD_DmeVkZXrcUY3drH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_05,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402090053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 07:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195191

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2024-24575:
libgit2 is a portable C implementation of the Git core methods provided
as a linkable library with a solid API, allowing to build Git functionality
into your application. Using well-crafted inputs to `git_revparse_single`
can cause the function to enter an infinite loop, potentially causing a
Denial of Service attack in the calling application. The revparse function
in `src/libgit2/revparse.c` uses a loop to parse the user-provided spec
string. There is an edge-case during parsing that allows a bad actor to
force the loop conditions to access arbitrary memory. Potentially, this
could also leak memory if the extracted rev spec is reflected back to the
attacker. As such, libgit2 versions before 1.4.0 are not affected. Users
should upgrade to version 1.6.5 or 1.7.2.

CVE-2024-24577:
libgit2 is a portable C implementation of the Git core methods provided
as a linkable library with a solid API, allowing to build Git functionality
into your application. Using well-crafted inputs to `git_index_add` can
cause heap corruption that could be leveraged for arbitrary code execution.
There is an issue in the `has_dir_name` function in `src/libgit2/index.c`,
which frees an entry that should not be freed. The freed entry is later
used and overwritten with potentially bad actor-controlled data leading to
controlled heap corruption. Depending on the application that uses libgit2,
this could lead to arbitrary code execution. This issue has been patched
in version 1.6.5 and 1.7.2.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-24575
https://security-tracker.debian.org/tracker/CVE-2024-24575
https://nvd.nist.gov/vuln/detail/CVE-2024-24577
https://security-tracker.debian.org/tracker/CVE-2024-24577

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../libgit2/libgit2/CVE-2024-24575.patch      | 56 +++++++++++++++++++
 .../libgit2/libgit2/CVE-2024-24577.patch      | 52 +++++++++++++++++
 meta/recipes-support/libgit2/libgit2_1.4.5.bb |  5 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch

diff --git a/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch b/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
new file mode 100644
index 0000000000..d3957ac5d0
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
@@ -0,0 +1,56 @@
+From c9d31b711e8906cf248566f43142f20b03e20cbf Mon Sep 17 00:00:00 2001
+From: Edward Thomson <ethomson@edwardthomson.com>
+Date: Fri, 17 Nov 2023 16:54:47 +0000
+Subject: [PATCH] revparse: fix parsing bug for trailing `@`
+
+When parsing a revspec that ends with a trailing `@`, explicitly stop
+parsing. Introduce a sentinel variable to explicitly stop parsing.
+
+Prior to this, we would set `spec` to `HEAD`, but were looping on the
+value of `spec[pos]`, so we would continue walking the (new) `spec`
+at offset `pos`, looking for a NUL. This is obviously an out-of-bounds
+read.
+
+Credit to Michael Rodler (@f0rki) and Amazon AWS Security.
+
+CVE: CVE-2024-24575
+
+Upstream-Status: Backport [https://github.com/libgit2/libgit2/commit/c9d31b711e8906cf248566f43142f20b03e20cbf]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/revparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/revparse.c b/src/revparse.c
+index 9bc28e9fc..d3bbe840b 100644
+--- a/src/revparse.c
++++ b/src/revparse.c
+@@ -685,6 +685,7 @@ static int revparse(
+	git_object *base_rev = NULL;
+
+	bool should_return_reference = true;
++	bool parsed = false;
+
+	GIT_ASSERT_ARG(object_out);
+	GIT_ASSERT_ARG(reference_out);
+@@ -694,7 +695,7 @@ static int revparse(
+	*object_out = NULL;
+	*reference_out = NULL;
+
+-	while (spec[pos]) {
++	while (!parsed && spec[pos]) {
+		switch (spec[pos]) {
+		case '^':
+			should_return_reference = false;
+@@ -801,6 +802,8 @@ static int revparse(
+				break;
+			} else if (spec[pos+1] == '\0') {
+				spec = "HEAD";
++				identifier_len = 4;
++				parsed = true;
+				break;
+			}
+			/* fall through */
+--
+2.40.0
diff --git a/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch b/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch
new file mode 100644
index 0000000000..3469f9d099
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch
@@ -0,0 +1,52 @@
+From eb4c1716cd92bf56f2770653a915d5fc01eab8f3 Mon Sep 17 00:00:00 2001
+From: Edward Thomson <ethomson@edwardthomson.com>
+Date: Sat, 16 Dec 2023 11:19:07 +0000
+Subject: [PATCH] index: correct index has_dir_name check
+
+`has_dir_name` is used to check for directory/file collisions,
+and attempts to determine whether the index contains a file with
+a directory name that is a proper subset of the new index entry
+that we're trying to add.
+
+To determine directory name, the function would walk the path string
+backwards to identify a `/`, stopping at the end of the string. However,
+the function assumed that the strings did not start with a `/`. If the
+paths contain only a single `/` at the beginning of the string, then the
+function would continue the loop, erroneously, when they should have
+stopped at the first character.
+
+Correct the order of the tests to terminate properly.
+
+Credit to Michael Rodler (@f0rki) and Amazon AWS Security.
+
+CVE: CVE-2024-24577
+
+Upstream-Status: Backport [https://github.com/libgit2/libgit2/commit/eb4c1716cd92bf56f2770653a915d5fc01eab8f3]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/index.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/index.c b/src/index.c
+index aa97c6421..e8ff82e1a 100644
+--- a/src/index.c
++++ b/src/index.c
+@@ -1148,10 +1148,13 @@ static int has_dir_name(git_index *index,
+		size_t len, pos;
+
+		for (;;) {
+-			if (*--slash == '/')
+-				break;
++			slash--;
++
+			if (slash <= entry->path)
+				return 0;
++
++			if (*slash == '/')
++				break;
+		}
+		len = slash - name;
+
+--
+2.40.0
diff --git a/meta/recipes-support/libgit2/libgit2_1.4.5.bb b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
index aadfe4ad02..ad8b9a536a 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.5.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https \
+           file://CVE-2024-24575.patch \
+           file://CVE-2024-24577.patch \
+           "
 SRCREV = "cd6f679af401eda1f172402006ef8265f8bd58ea"
 
 S = "${WORKDIR}/git"
-- 
2.40.0


