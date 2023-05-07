Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013E6C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 08:09:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61822.1683446943721004167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 01:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jJEF7Idx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4491ccad2f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34781v2s017756
	for <openembedded-core@lists.openembedded.org>; Sun, 7 May 2023 01:09:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=m8U+Lj94Mb946Vf1Xc177aWwfNdbLN+ZPX6F1+gX6gE=;
 b=jJEF7Idx99RFwvEKtBvqFhgADvffbjuVHxOZS8MRyWodCMcrfdOtWZjDTKVvFIVYd8LF
 YGKjqy8ac9WFCI/E1kKRBAJAK27zn2NnyB45Z/wYhsPMU8K8OCS7zJOrun6hCow1sLcn
 N2teTBiMcpiSHqy83iyZVtWqGdOBBBRjLmzqF/syxshXj6zAzvVxtfGv/I22LqLQFq3M
 RHPK0vW+wgt2SNs2M0KsOnA2EaR55feGqxcWgOhFX4FxE9HponWwAkYC6JeAaOIQwVap
 kzPgxv/FOkPDdDAR8v70a9IOfz/Zc5k9x8yTfq67bFKiNvQvGIRAj1ToJ7RDeYfa6ZxX TQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdj65rnv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 01:09:02 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 01:09:00 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <archana.polampalli@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] git: fix CVE-2023-29007
Date: Sun, 7 May 2023 08:08:46 +0000
Message-ID: <20230507080846.2810388-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 6y5KRPboI40PFlfpTZzuinfrdwPkPRcQ
X-Proofpoint-ORIG-GUID: 6y5KRPboI40PFlfpTZzuinfrdwPkPRcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305070062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 08:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181001

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7, 2.33.8,
2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, a specially crafted
`.gitmodules` file with submodule URLs that are longer than 1024 characters can used
to exploit a bug in `config.c::git_config_copy_or_rename_section_in_file()`. This bug
can be used to inject arbitrary configuration into a user's `$GIT_DIR/config` when
attempting to remove the configuration section associated with that submodule. When the
attacker injects configuration values which specify executables to run (such as
`core.pager`, `core.editor`, `core.sshCommand`, etc.) this can lead to a remote code
execution. A fix A fix is available in versions 2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8,
2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1. As a workaround, avoid running
`git submodule deinit` on untrusted repositories or without prior inspection of any
submodule sections in `$GIT_DIR/config`.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29007

Upstream patches:
https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4
https://github.com/git/git/commit/29198213c9163c1d552ee2bdbf78d2b09ccc98b8
https://github.com/git/git/commit/a5bb10fd5e74101e7c07da93e7c32bbe60f6173a
https://github.com/git/git/commit/e91cfe6085c4a61372d1f800b473b73b8d225d0d
https://github.com/git/git/commit/3bb3d6bac5f2b496dfa2862dc1a84cbfa9b4449a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../git/git/CVE-2023-29007.patch              | 162 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-29007.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-29007.patch b/meta/recipes-devtools/git/git/CVE-2023-29007.patch
new file mode 100644
index 0000000000..472f4022b2
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-29007.patch
@@ -0,0 +1,162 @@
+From 057c07a7b1fae22fdeef26c243f4cfbe3afc90ce Mon Sep 17 00:00:00 2001
+From: Taylor Blau <me@ttaylorr.com>
+Date: Fri, 14 Apr 2023 11:46:59 -0400
+Subject: [PATCH] Merge branch 'tb/config-copy-or-rename-in-file-injection'
+
+Avoids issues with renaming or deleting sections with long lines, where
+configuration values may be interpreted as sections, leading to
+configuration injection. Addresses CVE-2023-29007.
+
+* tb/config-copy-or-rename-in-file-injection:
+  config.c: disallow overly-long lines in `copy_or_rename_section_in_file()`
+  config.c: avoid integer truncation in `copy_or_rename_section_in_file()`
+  config: avoid fixed-sized buffer when renaming/deleting a section
+  t1300: demonstrate failure when renaming sections with long lines
+
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+Upstream-Status: Backport
+CVE: CVE-2023-29007
+
+Reference to upstream patch:
+https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ config.c          | 36 +++++++++++++++++++++++++-----------
+ t/t1300-config.sh | 30 ++++++++++++++++++++++++++++++
+ 2 files changed, 55 insertions(+), 11 deletions(-)
+
+diff --git a/config.c b/config.c
+index 2bffa8d..6a01938 100644
+--- a/config.c
++++ b/config.c
+@@ -3192,9 +3192,10 @@ void git_config_set_multivar(const char *key, const char *value,
+					flags);
+ }
+
+-static int section_name_match (const char *buf, const char *name)
++static size_t section_name_match (const char *buf, const char *name)
+ {
+-	int i = 0, j = 0, dot = 0;
++	size_t i = 0, j = 0;
++	int dot = 0;
+	if (buf[i] != '[')
+		return 0;
+	for (i = 1; buf[i] && buf[i] != ']'; i++) {
+@@ -3247,6 +3248,8 @@ static int section_name_is_ok(const char *name)
+	return 1;
+ }
+
++#define GIT_CONFIG_MAX_LINE_LEN (512 * 1024)
++
+ /* if new_name == NULL, the section is removed instead */
+ static int git_config_copy_or_rename_section_in_file(const char *config_filename,
+				      const char *old_name,
+@@ -3256,11 +3259,12 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+	char *filename_buf = NULL;
+	struct lock_file lock = LOCK_INIT;
+	int out_fd;
+-	char buf[1024];
++	struct strbuf buf = STRBUF_INIT;
+	FILE *config_file = NULL;
+	struct stat st;
+	struct strbuf copystr = STRBUF_INIT;
+	struct config_store_data store;
++	uint32_t line_nr = 0;
+
+	memset(&store, 0, sizeof(store));
+
+@@ -3297,16 +3301,25 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+		goto out;
+	}
+
+-	while (fgets(buf, sizeof(buf), config_file)) {
+-		unsigned i;
+-		int length;
++	while (!strbuf_getwholeline(&buf, config_file, '\n')) {
++		size_t i, length;
+		int is_section = 0;
+-		char *output = buf;
+-		for (i = 0; buf[i] && isspace(buf[i]); i++)
++		char *output = buf.buf;
++
++		line_nr++;
++
++		if (buf.len >= GIT_CONFIG_MAX_LINE_LEN) {
++			ret = error(_("refusing to work with overly long line "
++				      "in '%s' on line %"PRIuMAX),
++				    config_filename, (uintmax_t)line_nr);
++			goto out;
++		}
++
++		for (i = 0; buf.buf[i] && isspace(buf.buf[i]); i++)
+			; /* do nothing */
+-		if (buf[i] == '[') {
++		if (buf.buf[i] == '[') {
+			/* it's a section */
+-			int offset;
++			size_t offset;
+			is_section = 1;
+
+			/*
+@@ -3323,7 +3336,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+				strbuf_reset(&copystr);
+			}
+
+-			offset = section_name_match(&buf[i], old_name);
++			offset = section_name_match(&buf.buf[i], old_name);
+			if (offset > 0) {
+				ret++;
+				if (new_name == NULL) {
+@@ -3398,6 +3411,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ out_no_rollback:
+	free(filename_buf);
+	config_store_data_clear(&store);
++	strbuf_release(&buf);
+	return ret;
+ }
+
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index 78359f1..b07feb1 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -617,6 +617,36 @@ test_expect_success 'renaming to bogus section is rejected' '
+	test_must_fail git config --rename-section branch.zwei "bogus name"
+ '
+
++test_expect_success 'renaming a section with a long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %1024s [a] e = f\\n" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	git config -f y --rename-section a xyz &&
++	test_must_fail git config -f y b.e
++'
++
++test_expect_success 'renaming an embedded section with a long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %1024s [a] [foo] e = f\\n" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	git config -f y --rename-section a xyz &&
++	test_must_fail git config -f y foo.e
++'
++
++test_expect_success 'renaming a section with an overly-long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %525000s e" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	test_must_fail git config -f y --rename-section a xyz 2>err &&
++	test_i18ngrep "refusing to work with overly long line in .y. on line 2" err
++'
++
+ cat >> .git/config << EOF
+   [branch "zwei"] a = 1 [branch "vier"]
+ EOF
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index faf0b67051..199ac950fa 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://CVE-2023-29007.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.40.0


