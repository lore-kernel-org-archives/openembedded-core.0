Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D133C5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:19:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4575.1700133585425547564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RMUzA4we;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9684df30ff=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AG683J5008331
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 03:19:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=grtQ1nGGRgd+vRvTwk
	OT4LbhcPAXtMZif498xVHo2fU=; b=RMUzA4weFsclPmPT0m8PUGTZo95Q6t4Zqt
	jj5WCTSqp7w25XQxouBjkfq4vYXIhIPUTFxZLobsyP6ZnsSJ5220wm56AEehehED
	M6j/XRjeKlbVTSesqvbcsMzmz+2ubTBhiTOishno0jgbyn+CNUGeqSuD1EnD367u
	F96ymZ2iE1Vf0ItA6pr6YjepGhy6MWoh8X0mNQE4GVLK0CYYMEUf/3/brTzEhqql
	3FAs3xv/oWOcKuRm1zYAMSo0f5V0aDm0BB1s00SXAZA7rXJqwmBJd/CLLzJAQGzd
	H7ly+IDYOZFgERonroLhWS+sfnY29ktb2Na5rWqHZxW/eGu/RgRA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kmkn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 03:19:44 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 03:19:48 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 5/5] avahi: fix CVE-2023-38473
Date: Thu, 16 Nov 2023 11:19:25 +0000
Message-ID: <20231116111925.781606-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: OMxDTSLfj4hCyb3-Lc6oGv8pl4_fngw8
X-Proofpoint-GUID: OMxDTSLfj4hCyb3-Lc6oGv8pl4_fngw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311160090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AG683J5008331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190781

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the avahi_alternative_host_name() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2023-38473.patch          | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.=
patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 84eb1c554d..910da3c9cc 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
            file://CVE-2023-38470.patch \
            file://CVE-2023-38471.patch \
            file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
new file mode 100644
index 0000000000..707acb60fe
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
@@ -0,0 +1,110 @@
+From 88cbbc48d5efff9726694557ca6c3f698f3affe4 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 11 Oct 2023 17:45:44 +0200
+Subject: [PATCH] avahi: common: derive alternative host name from its
+ unescaped version
+
+Normalization of input makes sure we don't have to deal with special
+cases like unescaped dot at the end of label.
+
+Fixes #451 #487
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b448c=
9f771bada14ae8de175695a9729f8646797]
+CVE: CVE-2023-38473
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-=
test.c
+index 9255435..681fc15 100644
+--- a/avahi-common/alternative-test.c
++++ b/avahi-common/alternative-test.c
+@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED c=
har *argv[]) {
+     const char* const test_strings[] =3D {
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
X",
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=BC=C3=
=BC=C3=BC=C3=BC=C3=BC=C3=BC",
++        ").",
++        "\\.",
++        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\=
\\",
+         "gurke",
+         "-",
+         " #",
+diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
+index b3d39f0..a094e6d 100644
+--- a/avahi-common/alternative.c
++++ b/avahi-common/alternative.c
+@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
+ }
+
+ char *avahi_alternative_host_name(const char *s) {
++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
++    char *alt, *r, *ret;
+     const char *e;
+-    char *r;
++    size_t len;
+
+     assert(s);
+
+     if (!avahi_is_valid_host_name(s))
+         return NULL;
+
+-    if ((e =3D strrchr(s, '-'))) {
++    if (!avahi_unescape_label(&s, label, sizeof(label)))
++        return NULL;
++
++    if ((e =3D strrchr(label, '-'))) {
+         const char *p;
+
+         e++;
+@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {
+
+     if (e) {
+         char *c, *m;
+-        size_t l;
+         int n;
+
+         n =3D atoi(e)+1;
+         if (!(m =3D avahi_strdup_printf("%i", n)))
+             return NULL;
+
+-        l =3D e-s-1;
++        len =3D e-label-1;
+
+-        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
+-            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
++        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
++            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
+
+-        if (!(c =3D avahi_strndup(s, l))) {
++        if (!(c =3D avahi_strndup(label, len))) {
+             avahi_free(m);
+             return NULL;
+         }
+@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {
+     } else {
+         char *c;
+
+-        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
++        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
+             return NULL;
+
+         drop_incomplete_utf8(c);
+@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {
+         avahi_free(c);
+     }
+
++    alt =3D alternative;
++    len =3D sizeof(alternative);
++    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
++
++    avahi_free(r);
++    r =3D avahi_strdup(ret);
++
+     assert(avahi_is_valid_host_name(r));
+
+     return r;
+--
+2.40.0
--=20
2.40.0


