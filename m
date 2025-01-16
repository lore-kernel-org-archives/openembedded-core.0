Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1433CC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:15:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.51420.1737040521796570372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCvHtH020527
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv15rsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:15:19 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:15:18 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 5/6] rsync: fix CVE-2024-12088
Date: Thu, 16 Jan 2025 15:15:08 +0000
Message-ID: <20250116151509.1939178-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116151509.1939178-1-archana.polampalli@windriver.com>
References: <20250116151509.1939178-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: x0B4F6Gtw8MVIWu3LKp11D4DmKU1VRM7
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67892289 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=oq-7gxcSAAAA:8 a=SOKLBCYioB9Sy_gQbKYA:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-ORIG-GUID: x0B4F6Gtw8MVIWu3LKp11D4DmKU1VRM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501160115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209957

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. When using the `--safe-links` option, rsync fails to
properly verify if a symbolic link destination contains another symbolic link within it.
This results in a path traversal vulnerability, which may lead to arbitrary file write
outside the desired directory.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12088.patch          | 141 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
new file mode 100644
index 0000000000..b2a3a86e1a
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
@@ -0,0 +1,141 @@
+From 407c71c7ce562137230e8ba19149c81ccc47c387 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Nov 2024 15:15:53 +1100
+Subject: [PATCH] make --safe-links stricter
+
+when --safe-links is used also reject links where a '../' component is
+included in the destination as other than the leading part of the
+filename
+
+CVE: CVE-2024-12088
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=407c71c7ce562137230e8ba19149c81ccc47c387]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ testsuite/safe-links.test    | 55 ++++++++++++++++++++++++++++++++++++
+ testsuite/unsafe-byname.test |  2 +-
+ util1.c                      | 26 ++++++++++++++++-
+ 3 files changed, 81 insertions(+), 2 deletions(-)
+ create mode 100644 testsuite/safe-links.test
+
+diff --git a/testsuite/safe-links.test b/testsuite/safe-links.test
+new file mode 100644
+index 00000000..6e95a4b9
+--- /dev/null
++++ b/testsuite/safe-links.test
+@@ -0,0 +1,55 @@
++#!/bin/sh
++
++. "$suitedir/rsync.fns"
++
++test_symlink() {
++	is_a_link "$1" || test_fail "File $1 is not a symlink"
++}
++
++test_regular() {
++	if [ ! -f "$1" ]; then
++		test_fail "File $1 is not regular file or not exists"
++	fi
++}
++
++test_notexist() {
++        if [ -e "$1" ]; then
++                test_fail "File $1 exists"
++	fi
++        if [ -h "$1" ]; then
++                test_fail "File $1 exists as a symlink"
++	fi
++}
++
++cd "$tmpdir"
++
++mkdir from
++
++mkdir "from/safe"
++mkdir "from/unsafe"
++
++mkdir "from/safe/files"
++mkdir "from/safe/links"
++
++touch "from/safe/files/file1"
++touch "from/safe/files/file2"
++touch "from/unsafe/unsafefile"
++
++ln -s ../files/file1 "from/safe/links/"
++ln -s ../files/file2 "from/safe/links/"
++ln -s ../../unsafe/unsafefile "from/safe/links/"
++ln -s a/a/a/../../../unsafe2 "from/safe/links/"
++
++#echo "LISTING FROM"
++#ls -lR from
++
++echo "rsync with relative path and just -a"
++$RSYNC -avv --safe-links from/safe/ to
++
++#echo "LISTING TO"
++#ls -lR to
++
++test_symlink to/links/file1
++test_symlink to/links/file2
++test_notexist to/links/unsafefile
++test_notexist to/links/unsafe2
+diff --git a/testsuite/unsafe-byname.test b/testsuite/unsafe-byname.test
+index 75e72014..d2e318ef 100644
+--- a/testsuite/unsafe-byname.test
++++ b/testsuite/unsafe-byname.test
+@@ -40,7 +40,7 @@ test_unsafe ..//../dest 		from/dir			unsafe
+ test_unsafe ..				from/file			safe
+ test_unsafe ../..			from/file			unsafe
+ test_unsafe ..//..			from//file			unsafe
+-test_unsafe dir/..			from				safe
++test_unsafe dir/..			from				unsafe
+ test_unsafe dir/../..			from				unsafe
+ test_unsafe dir/..//..			from				unsafe
+
+diff --git a/util1.c b/util1.c
+index da50ff1e..f260d398 100644
+--- a/util1.c
++++ b/util1.c
+@@ -1318,7 +1318,14 @@ int handle_partial_dir(const char *fname, int create)
+  *
+  * "src" is the top source directory currently applicable at the level
+  * of the referenced symlink.  This is usually the symlink's full path
+- * (including its name), as referenced from the root of the transfer. */
++ * (including its name), as referenced from the root of the transfer.
++ *
++ * NOTE: this also rejects dest names with a .. component in other
++ * than the first component of the name ie. it rejects names such as
++ * a/b/../x/y. This needs to be done as the leading subpaths 'a' or
++ * 'b' could later be replaced with symlinks such as a link to '.'
++ * resulting in the link being transferred now becoming unsafe
++ */
+ int unsafe_symlink(const char *dest, const char *src)
+ {
+	const char *name, *slash;
+@@ -1328,6 +1335,23 @@ int unsafe_symlink(const char *dest, const char *src)
+	if (!dest || !*dest || *dest == '/')
+		return 1;
+
++	// reject destinations with /../ in the name other than at the start of the name
++	const char *dest2 = dest;
++	while (strncmp(dest2, "../", 3) == 0) {
++	    dest2 += 3;
++	    while (*dest2 == '/') {
++		// allow for ..//..///../foo
++		dest2++;
++	    }
++	}
++	if (strstr(dest2, "/../"))
++	    return 1;
++
++	// reject if the destination ends in /..
++	const size_t dlen = strlen(dest);
++	if (dlen > 3 && strcmp(&dest[dlen-3], "/..") == 0)
++	    return 1;
++
+	/* find out what our safety margin is */
+	for (name = src; (slash = strchr(name, '/')) != 0; name = slash+1) {
+		/* ".." segment starts the count over.  "." segment is ignored. */
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index d6942dc595..169650fe91 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0001.patch \
            file://CVE-2024-12087-0002.patch \
            file://CVE-2024-12087-0003.patch \
+           file://CVE-2024-12088.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.40.0


