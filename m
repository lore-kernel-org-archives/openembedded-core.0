Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA11C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 13:04:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31679.1683637444435966845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 06:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Tf19GWcq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4493ca4c5f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349CS3Rl031947
	for <openembedded-core@lists.openembedded.org>; Tue, 9 May 2023 06:04:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ppxiT+lFVMNWBaynuJ7WBHXLwdo1RZioweh3dlNzlcY=;
 b=Tf19GWcqbjX74xyA/UBMJWgnfyJI50pOjcP3EzsPx1uZFW3W16Yldy1RpGql/WB3WSxz
 KeCNlMy3INcgRYzOn/gLfzOX7bNj7rvPLD6IkholmofbqM2Y9oZXXMIDF9p4aCotRpVY
 y9D1vAUr1EUctfK8rtbIzwcd+T8psmRR5eqT4M3vhBOyn/C+QJO5DR3DbquCp8SgWz6h
 Vv7AzDax2wh338r7TeuCPYC0uUVdlSC2SVZ5xikbLkP4hNbSU85e32ca1tIhvnCFRCK9
 +IpAtu0lUoXneaRL4FPKDztPNrJ9GBucA6Nr91JQSAM7gSGCWX7Wn7F5vzmwL0jX2Pq4 oA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7ucrmnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 06:04:03 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 06:04:01 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <archana.polampalli@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-25652
Date: Tue, 9 May 2023 13:03:48 +0000
Message-ID: <20230509130348.2936858-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2l5hlYR4mRq2UupOjDe7AWsfiOGnmwEv
X-Proofpoint-ORIG-GUID: 2l5hlYR4mRq2UupOjDe7AWsfiOGnmwEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181040

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7,
2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by feeding
specially crafted input to `git apply --reject`, a path outside the working
tree can be overwritten with partially controlled contents (corresponding to
the rejected hunk(s) from the given patch). A fix is available in versions
2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3,
and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when applying
patches from an untrusted source. Use `git apply --stat` to inspect a patch before
applying; avoid applying one that create a conflict where a link corresponding to
the `*.rej` file exists.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-25652

Upstream patches:
https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../git/git/CVE-2023-25652.patch              | 94 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.39.2.bb       |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-25652.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-25652.patch b/meta/recipes-devtools/git/git/CVE-2023-25652.patch
new file mode 100644
index 0000000000..e8cedfcf27
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-25652.patch
@@ -0,0 +1,94 @@
+From 9db05711c98efc14f414d4c87135a34c13586e0b  Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <Johannes.Schindelin@gmx.de>
+Date: Thu Mar 9 16:02:54 2023 +0100
+Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it
+ exists
+
+    The `git apply --reject` is expected to write out `.rej` files in case
+    one or more hunks fail to apply cleanly. Historically, the command
+    overwrites any existing `.rej` files. The idea being that
+    apply/reject/edit cycles are relatively common, and the generated `.rej`
+    files are not considered precious.
+
+    But the command does not overwrite existing `.rej` symbolic links, and
+    instead follows them. This is unsafe because the same patch could
+    potentially create such a symbolic link and point at arbitrary paths
+    outside the current worktree, and `git apply` would write the contents
+    of the `.rej` file into that location.
+
+    Therefore, let's make sure that any existing `.rej` file or symbolic
+    link is removed before writing it.
+
+    Reported-by: RyotaK <ryotak.mail@gmail.com>
+    Helped-by: Taylor Blau <me@ttaylorr.com>
+    Helped-by: Junio C Hamano <gitster@pobox.com>
+    Helped-by: Linus Torvalds <torvalds@linuxfoundation.org>
+    Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2023-25652
+Upstream-Status: Backport [https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ apply.c                  | 14 ++++++++++++--
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index eec2da2..442cf28 100644
+--- a/apply.c
++++ b/apply.c
+@@ -4576,7 +4576,7 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+	FILE *rej;
+	char namebuf[PATH_MAX];
+	struct fragment *frag;
+-	int cnt = 0;
++	int fd, cnt = 0;
+	struct strbuf sb = STRBUF_INIT;
+
+	for (cnt = 0, frag = patch->fragments; frag; frag = frag->next) {
+@@ -4616,7 +4616,17 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+	memcpy(namebuf, patch->new_name, cnt);
+	memcpy(namebuf + cnt, ".rej", 5);
+
+-	rej = fopen(namebuf, "w");
++	fd = open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++	if (fd < 0) {
++		if (errno != EEXIST)
++			return error_errno(_("cannot open %s"), namebuf);
++		if (unlink(namebuf))
++			return error_errno(_("cannot unlink '%s'"), namebuf);
++		fd = open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++		if (fd < 0)
++			return error_errno(_("cannot open %s"), namebuf);
++	}
++	rej = fdopen(fd, "w");
+	if (!rej)
+		return error_errno(_("cannot open %s"), namebuf);
+
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
+index 65ac7df..e95e6d4 100755
+--- a/t/t4115-apply-symlink.sh
++++ b/t/t4115-apply-symlink.sh
+@@ -126,4 +126,19 @@ test_expect_success SYMLINKS 'symlink escape when deleting file' '
+	test_path_is_file .git/delete-me
+ '
+
++test_expect_success SYMLINKS '--reject removes .rej symlink if it exists' '
++	test_when_finished "git reset --hard && git clean -dfx" &&
++
++	test_commit file &&
++	echo modified >file.t &&
++	git diff -- file.t >patch &&
++	echo modified-again >file.t &&
++
++	ln -s foo file.t.rej &&
++	test_must_fail git apply patch --reject 2>err &&
++	test_i18ngrep "Rejected hunk" err &&
++	test_path_is_missing foo &&
++	test_path_is_file file.t.rej
++'
++
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.2.bb
index 222e545f60..5865efada0 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://CVE-2023-25652.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.40.0


