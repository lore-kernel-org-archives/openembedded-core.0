Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A39EEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:14:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7010.1694002436317904526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O1NXUKXw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7613987da9=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 386Aj2I0022301
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 12:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YLkbS
	H11lBAUKODxOAM5vCCBaLkNN6fRcCRGc+7YzMo=; b=O1NXUKXwyncTlTLHles2O
	SlDJR2qDpju0qAZ1vW926cvj+jr3O4WZCvLQMLL12GW2lqNJxcQhUXIx0vecYHhV
	x+EqX05Qy/PhBX8Tf1BY/8npPJtyqM2LyVlvLKehE8DH4MO1wNsHwSIqaS+QMT84
	rVIDUCVqwlQfCVXyO/DeD2pWP80HRJgU3i/5/v9nuSR/5Vzu/cW4u6zBsFfN4bmM
	tfBU4q8vL6RHux8YK0y3hGzzAzrod7ccb/hzgbIhoj0mOKVvvDOQ3XfWiYyvJkzv
	lKPbR0VqowYYfZD59K0fktys9L0LWx5GdhMCPh+Lr39fCd5TMuXmaOl4RUggZeZq
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15ugpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:13:55 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 05:13:52 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-pygments: Fix CVE-2022-40896
Date: Wed, 6 Sep 2023 12:13:32 +0000
Message-ID: <20230906121332.3051416-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: D5AVAaOovvHFzSGBv-zRYDpbvstoosU-
X-Proofpoint-GUID: D5AVAaOovvHFzSGBv-zRYDpbvstoosU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_05,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187293

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2022-40896:
A ReDoS issue was discovered in pygments/lexers/smithy.py in pygments
through 2.15.0 via SmithyLexer.

The CVE issue is fixed by 3 different commits between the releases 2.14.0
(for Smithy lexer), 2.15.0 (for SQL+Jinja lexers) and 2.15.1 (for Java
properties) as per: https://pyup.io/posts/pyup-discovers-redos-vulnerabilities-in-top-python-packages-part-2/

1. Smithy lexer commit from 2.14.0 release applies successfully on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/dd52102c38ebe78cd57748e09f38929fd283ad04
Hence, backported the patch as CVE-2022-40896.patch.

2. SQL+Jinja lexers commit from 2.15.0 release doesn't apply on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/97eb3d5ec7c1b3ea4fcf9dee30a2309cf92bd194
Actually, this code doesn't exist in 2.11.2 version and it has been introduce by
python3-pygments 2.13.0 version. Hence, this is not vulnerable for 2.11.2 version.
SQL+Jinja lexers is introduced by: https://github.com/pygments/pygments/commit/0bdbd5992baca32d18e01f0ec65337e06abf9456

3. Java properties commit from 2.15.1 release also doesn't apply on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/fdf182a7af85b1deeeb637ca970d31935e7c9d52
Actually, this code also doesn't exist in 2.11.2 version as the code has been modified
in python3-pygments 2.14.0 by: https://github.com/pygments/pygments/commit/a38cb38e93c9635240b3ae89d78d38cf182745da
Hence, this is also not vulnerable for 2.11.2 version.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-pygments/CVE-2022-40896.patch     | 124 ++++++++++++++++++
 .../python/python3-pygments_2.11.2.bb         |   2 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch

diff --git a/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch
new file mode 100644
index 0000000000..9848072a94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch
@@ -0,0 +1,124 @@
+From ed61747f328ff6aa343881b269600308ab8eac93 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 6 Sep 2023 10:32:38 +0000
+Subject: [PATCH] Improve the Smithy metadata matcher.
+
+Previously, metadata foo bar baz = 23 was accepted, but according to
+the definition https://smithy.io/2.0/spec/idl.html#grammar-token-smithy-MetadataSection
+it should be "metadata"<whitespace>Identifier/String<optional whitespace>.
+
+CVE: CVE-2022-40896
+
+Upstream-Status: Backport [https://github.com/pygments/pygments/commit/dd52102c38ebe78cd57748e09f38929fd283ad04]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ pygments/lexers/smithy.py                    |  5 +-
+ tests/examplefiles/smithy/test.smithy        | 12 +++++
+ tests/examplefiles/smithy/test.smithy.output | 52 ++++++++++++++++++++
+ 3 files changed, 67 insertions(+), 2 deletions(-)
+
+diff --git a/pygments/lexers/smithy.py b/pygments/lexers/smithy.py
+index 0f0a912..c5e25cd 100644
+--- a/pygments/lexers/smithy.py
++++ b/pygments/lexers/smithy.py
+@@ -58,8 +58,9 @@ class SmithyLexer(RegexLexer):
+             (words(aggregate_shapes,
+                    prefix=r'^', suffix=r'(\s+' + identifier + r')'),
+                 bygroups(Keyword.Declaration, Name.Class)),
+-            (r'^(metadata)(\s+.+)(\s*)(=)',
+-                bygroups(Keyword.Declaration, Name.Class, Whitespace, Name.Decorator)),
++            (r'^(metadata)(\s+)((?:\S+)|(?:\"[^"]+\"))(\s*)(=)',
++                bygroups(Keyword.Declaration, Whitespace, Name.Class,
++                         Whitespace, Name.Decorator)),
+             (r"(true|false|null)", Keyword.Constant),
+             (r"(-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?)", Number),
+             (identifier + ":", Name.Label),
+diff --git a/tests/examplefiles/smithy/test.smithy b/tests/examplefiles/smithy/test.smithy
+index 3d20f06..9317fee 100644
+--- a/tests/examplefiles/smithy/test.smithy
++++ b/tests/examplefiles/smithy/test.smithy
+@@ -2,6 +2,18 @@ $version: "1.0"
+
+ namespace test
+
++metadata "foo" = ["bar", "baz"]
++metadata validators = [
++    {
++        name: "ValidatorName"
++        id: "ValidatorId"
++        message: "Some string"
++        configuration: {
++            selector: "operation"
++        }
++    }
++]
++
+ /// Define how an HTTP request is serialized given a specific protocol,
+ /// authentication scheme, and set of input parameters.
+ @trait(selector: "operation")
+diff --git a/tests/examplefiles/smithy/test.smithy.output b/tests/examplefiles/smithy/test.smithy.output
+index 1f22489..db44a38 100644
+--- a/tests/examplefiles/smithy/test.smithy.output
++++ b/tests/examplefiles/smithy/test.smithy.output
+@@ -7,6 +7,58 @@
+ ' test'       Name.Class
+ '\n\n'        Text.Whitespace
+
++'metadata'    Keyword.Declaration
++' '           Text.Whitespace
++'"foo"'       Name.Class
++' '           Text.Whitespace
++'='           Name.Decorator
++' '           Text.Whitespace
++'['           Text
++'"bar"'       Literal.String.Double
++','           Punctuation
++' '           Text.Whitespace
++'"baz"'       Literal.String.Double
++']'           Text
++'\n'          Text.Whitespace
++
++'metadata'    Keyword.Declaration
++' '           Text.Whitespace
++'validators'  Name.Class
++' '           Text.Whitespace
++'='           Name.Decorator
++' '           Text.Whitespace
++'['           Text
++'\n    '      Text.Whitespace
++'{'           Text
++'\n        '  Text.Whitespace
++'name:'       Name.Label
++' '           Text.Whitespace
++'"ValidatorName"' Literal.String.Double
++'\n        '  Text.Whitespace
++'id:'         Name.Label
++' '           Text.Whitespace
++'"ValidatorId"' Literal.String.Double
++'\n        '  Text.Whitespace
++'message:'    Name.Label
++' '           Text.Whitespace
++'"Some string"' Literal.String.Double
++'\n        '  Text.Whitespace
++'configuration:' Name.Label
++' '           Text.Whitespace
++'{'           Text
++'\n            ' Text.Whitespace
++'selector:'   Name.Label
++' '           Text.Whitespace
++'"operation"' Literal.String.Double
++'\n        '  Text.Whitespace
++'}'           Text
++'\n    '      Text.Whitespace
++'}'           Text
++'\n'          Text.Whitespace
++
++']'           Text
++'\n\n'        Text.Whitespace
++
+ '/// Define how an HTTP request is serialized given a specific protocol,' Comment.Multiline
+ '\n'          Text.Whitespace
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
index 35d288c89e..6e787f23d2 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 inherit setuptools3
 SRC_URI[sha256sum] = "4e426f72023d88d03b2fa258de560726ce890ff3b630f88c21cbb8b2503b8c6a"
 
+SRC_URI += "file://CVE-2022-40896.patch"
+
 DEPENDS += "\
             ${PYTHON_PN} \
             "
-- 
2.40.0


