Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A021CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 07:28:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45562.1756711737428957120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 00:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z+rCCtTF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13394766c3=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5815Qfmw3184371
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 07:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TwXOJnd/zCmexQJJNXyq
	Bxh424JnJ2s89GM3H4ogpYc=; b=Z+rCCtTFk6OZu2XpqzZK0+NVznI+NXKg7aMg
	iL5F6sehw885bXDhQwsBOQS5VeQNHrhlUhwcTRwZKG3A1pMb6/07Azfle1WCJpo9
	DY06GNtpnpmH8OLtgb1F3aJbPS6mk2dNSOEIdCz8MTEeWGE6tENWvlFpbepP0rH9
	F45mkdtYWNuM92USy8lj75Ew3eL8dfgQPla2VdUd+APEyTwvuMdHrJf+LWiqImXc
	YyjoRYzkDCgX3Vq15uZH/KsPjsHjGX/Q2PH3WZ4LQI2LF6KdbNF5lvLh/grkaVfT
	rq1jxxynYT5CyIk095WISEDIAsWGM2iA0OaY+JvicGRKlXAAiA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgyhem9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 07:28:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 1 Sep 2025 00:28:54 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 1 Sep 2025 00:28:52 -0700
From: pkumar7 <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] git: fix CVE-2025-48384
Date: Mon, 1 Sep 2025 12:58:38 +0530
Message-ID: <20250901072838.3284183-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDA3OSBTYWx0ZWRfX6yRwAVpTM/vD
 jq3K/jGa82f2pqPfH4rYuIg6L+iwOQ6jvS8dkl8nbimzarZeSFI5xSjrIG95nYxwu1BLOjnRM3N
 WJypaUfJ7mLoDxPY7NjeHkijZzV0zHz+F0D4OD166I80gB2VRKQa09IvlCnJohzJIQRuWlrwduY
 fdMbdqALGj6BuXef7NIg7Oi0lpPto8mtLpzrP6CrhgRLVrqIKOE4Q2DJZ8PB6FGBwk2j2CDTI19
 fTyKEzJZumlbsvkLKT1yXiVSc4XT/dP5kvOBZNQDvQlb/Ju2eEfarAH7RDgcQh0jr6R5rjlsuQh
 jPwvfsoYouhBolpnP9tajE3zB/O4rKKV1QfDJQgx1jdrMRuumnFrP1D4nkwo24=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b54b38 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=3nsOOYR-AAAA:8 a=SkADoanYLwH-W29r7doA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=X8_4EP2Luv2hi8NvPz5g:22
X-Proofpoint-GUID: JcuvkQc4-KMo_W1qqzjEdMAGtPoq1L9P
X-Proofpoint-ORIG-GUID: JcuvkQc4-KMo_W1qqzjEdMAGtPoq1L9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 07:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222641

From: Praveen Kumar <praveen.kumar@windriver.com>

Git is a fast, scalable, distributed revision control system with an
unusually rich command set that provides both high-level operations
and full access to internals. When reading a config value, Git strips
any trailing carriage return and line feed (CRLF). When writing a
config entry, values with a trailing CR are not quoted, causing the CR
to be lost when the config is later read. When initializing a
submodule, if the submodule path contains a trailing CR, the altered
path is read resulting in the submodule being checked out to an
incorrect location. If a symlink exists that points the altered path
to the submodule hooks directory, and the submodule contains an
executable post-checkout hook, the script may be unintentionally
executed after checkout. This vulnerability is fixed in v2.43.7,
v2.44.4, v2.45.4, v2.46.4, v2.47.3, v2.48.2, v2.49.1, and v2.50.1.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-48384

Upstream-patch:
https://github.com/git/git/commit/05e9cd64ee23bbadcea6bcffd6660ed02b8eab89

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../git/git/CVE-2025-48384.patch              | 85 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-48384.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2025-48384.patch b/meta/recipes-devtools/git/git/CVE-2025-48384.patch
new file mode 100644
index 0000000000..6c21a3c352
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2025-48384.patch
@@ -0,0 +1,85 @@
+From 05e9cd64ee23bbadcea6bcffd6660ed02b8eab89 Mon Sep 17 00:00:00 2001
+From: Justin Tobler <jltobler@gmail.com>
+Date: Mon, 19 May 2025 21:26:04 -0500
+Subject: [PATCH] config: quote values containing CR character
+
+When reading the config, values that contain a trailing CRLF are
+stripped. If the value itself has a trailing CR, the normal LF that
+follows results in the CR being unintentionally stripped. This may lead
+to unintended behavior due to the config value written being different
+when it gets read.
+
+One such issue involves a repository with a submodule path containing a
+trailing CR. When the submodule gets initialized, the submodule is
+cloned without being checked out and has "core.worktree" set to the
+submodule path. The git-checkout(1) that gets spawned later reads the
+"core.worktree" config value, but without the trailing CR, and
+consequently attempts to checkout to a different path than intended.
+
+If the repository contains a matching path that is a symlink, it is
+possible for the submodule repository to be checked out in arbitrary
+locations. This is extra bad when the symlink points to the submodule
+hooks directory and the submodule repository contains an executable
+"post-checkout" hook. Once the submodule repository checkout completes,
+the "post-checkout" hook immediately executes.
+
+To prevent mismatched config state due to misinterpreting a trailing CR,
+wrap config values containing CR in double quotes when writing the
+entry. This ensures a trailing CR is always separated for an LF and thus
+prevented from getting stripped.
+
+Note that this problem cannot be addressed by just quoting each CR with
+"\r". The reading side of the config interprets only a few backslash
+escapes, and "\r" is not among them. This fix is sufficient though
+because it only affects the CR at the end of a line and any literal CR
+in the interior is already preserved.
+
+Co-authored-by: David Leadbeater <dgl@dgl.cx>
+Signed-off-by: Justin Tobler <jltobler@gmail.com>
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+CVE: CVE-2025-48384
+
+Upstream-Status: Backport [https://github.com/git/git/commit/05e9cd64ee23bbadcea6bcffd6660ed02b8eab89]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ config.c          |  2 +-
+ t/t1300-config.sh | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/config.c b/config.c
+index 6a01938..4fbff51 100644
+--- a/config.c
++++ b/config.c
+@@ -2756,7 +2756,7 @@ static ssize_t write_pair(int fd, const char *key, const char *value,
+	if (value[0] == ' ')
+		quote = "\"";
+	for (i = 0; value[i]; i++)
+-		if (value[i] == ';' || value[i] == '#')
++		if (value[i] == ';' || value[i] == '#' || value[i] == '\r')
+			quote = "\"";
+	if (i && value[i - 1] == ' ')
+		quote = "\"";
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index b07feb1..49f4971 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -2417,5 +2417,15 @@ test_expect_success '--get and --get-all with --fixed-value' '
+	git config --file=config --get-regexp --fixed-value fixed+ "$META" &&
+	test_must_fail git config --file=config --get-regexp --fixed-value fixed+ non-existent
+ '
++test_expect_success 'writing value with trailing CR not stripped on read' '
++       test_when_finished "rm -rf cr-test" &&
++
++       printf "bar\r\n" >expect &&
++       git init cr-test &&
++       git -C cr-test config set core.foo $(printf "bar\r") &&
++       git -C cr-test config get core.foo >actual &&
++
++       test_cmp expect actual
++'
+
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 3520b4db90..2079c3ddc8 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2024-50349-0002.patch \
            file://CVE-2024-52006.patch \
            file://CVE-2025-27614-CVE-2025-27613-CVE-2025-46334-CVE-2025-46835.patch \
+           file://CVE-2025-48384.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.40.0


