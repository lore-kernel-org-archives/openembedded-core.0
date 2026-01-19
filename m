Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EC1D4A5EB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:09:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29976.1768802968631228182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cU+1C47d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5479224d0e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J5ov4j534382;
	Mon, 19 Jan 2026 06:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=N+NRz80jLW9ietXUsG74UqdUKNbymXykDl10QTZQF/Q=; b=
	cU+1C47dCXttYNoGqZUCUva7xoduE5qIzilBPwbSm30a6XYJFxymjlDVFX/6uawg
	l4SgCU3HZ5vgVky7ck2YeeU1mBJSEspBh/Glcw30WZSQahx6d7IsTlkxCzL4SoKN
	qglXJdsaXKQDYZLwA8TUr9H9ForGv9al7mA9J9REilQyPB3Io3Bh35AqyP0BPky+
	u+kce1VTpptQTYvi3u5678OTE3V17rFzFRcIuBYJ/F9vE+34jmlox4UKsJY2S6Dl
	6VP6sdeUbosFDJzJO4/sT4gfON4IfsPboenxWQMOvd0Jo6dyHROaqW1KoG283cwy
	6ZTBboqbgj8q46bSL6eIPQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymuhhf8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 19 Jan 2026 06:09:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 18 Jan 2026 22:09:25 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 18 Jan 2026 22:09:25 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v2 1/2] createrepo-c: Backport a patch to build with rpm 6.0.1
Date: Sun, 18 Jan 2026 22:09:24 -0800
Message-ID: <d1f3eb2a937bcbfd3d4bb1200cb2ab79018cb8b3.1768802844.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1768802844.git.liezhi.yang@windriver.com>
References: <cover.1768802844.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696dca97 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=C_JV50TGAR3syT1G5F8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5qY9ObjROnaB-zn5Eb1jypuOCYK9FoCF
X-Proofpoint-ORIG-GUID: 5qY9ObjROnaB-zn5Eb1jypuOCYK9FoCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA0OCBTYWx0ZWRfX8I1FsjMh4L/l
 d4R9MDxbXcWtZIESaUscCSlWEMQhaihc2ZPh2bKUnZDEQlSUfYzDObpT7fWoPgF8PNfDahVvrhz
 9K2c88rCBQqxvAe7EEfyhGGwOZhqymp95LoCOJtWjZqXm+R5n2taolBpeqe1jSLzprLLVF8lT3z
 biWbSWK3D+wOflyKBhjj/g4jqCFcxWTS+LQ5gFEOKrzwApgEj3bQ3l24Rc6MERiDbx3P/VRH6U8
 ri/V09ngGEFbJLVzEBeo0eTmO8+Ykkr3Fu3lgLv7MTc877NegJIpR36xpKDvh5s9nR1dr/6rqJE
 e2jVQ+HYWEF6wskbeetF8VLSbJKP65mG9cjYJ5NwAtWkXxjwGBx1AbhB63npIuRm5bq6h/NrZ2Y
 VSKl2l82pO38CyBqlUmeuxgBWq/liDSQQ76zVEQsayWm7zBaU/SgmHX9w1aYrsTzbUtPlcTA7HV
 yFf2ffd3BZDk3HJaoIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60J5ov4j534382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229590

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
createrepo_c/src/parsehdr.c:669:71: error: =E2=80=98RPMTAG_HDRID=E2=80=99=
 undeclared (first use in this function)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...G_SHA1HEADER-instead-of-RPMTAG_HDRID.patch | 50 +++++++++++++++++++
 .../createrepo-c/createrepo-c_1.2.1.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-=
Use-RPMTAG_SHA1HEADER-instead-of-RPMTAG_HDRID.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-RPM=
TAG_SHA1HEADER-instead-of-RPMTAG_HDRID.patch b/meta/recipes-devtools/crea=
terepo-c/createrepo-c/0001-Use-RPMTAG_SHA1HEADER-instead-of-RPMTAG_HDRID.=
patch
new file mode 100644
index 0000000000..5a217f39ab
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-RPMTAG_SHA=
1HEADER-instead-of-RPMTAG_HDRID.patch
@@ -0,0 +1,50 @@
+From 4e37bc582b1673ff767dbd0b570ef1c8871d3e8c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.co=
m>
+Date: Tue, 22 Jul 2025 15:10:40 +0200
+Subject: [PATCH] Use RPMTAG_SHA1HEADER instead of RPMTAG_HDRID
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Building against rpm-5.99.91 failed:
+
+    /home/test/createrepo_c/src/parsehdr.c: In function =E2=80=98cr_pack=
age_from_header=E2=80=99:
+    /home/test/createrepo_c/src/parsehdr.c:669:71: error: =E2=80=98RPMTA=
G_HDRID=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98RPMTAG_CVSID=E2=80=99?
+      669 |                                                  headerGetSt=
ring(hdr, RPMTAG_HDRID));
+	  |                                                                    =
   ^~~~~~~~~~~~
+	  |                                                                    =
   RPMTAG_CVSID
+
+RPM intentionally removed RPMTAG_HDRID tag alias in commit
+79ba4a3c41702e46edd5a4ce7e17a1f3361eb0e7 ("Drop irrepairable pkgid and
+hdrid tag aliases, rename SOURCEPKGID to go").
+
+This patch fixes building against RPMv6 by using RPMTAG_SHA1HEADER
+which RPMTAG_HDRID was aliased to. RPMTAG_SHA1HEADER has existed in
+RPM since the year 2001. RPMTAG_HDRID was an alias to
+RPMTAG_SHA1HEADER all the time RPMTAG_HDRID existed.
+
+In the features we should look for another digest header RPMv6
+packages will use.
+
+Upstream-Status: Backport [4e37bc582b1673ff767dbd0b570ef1c8871d3e8c]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/parsehdr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/parsehdr.c b/src/parsehdr.c
+index 2b75e99..180e4ae 100644
+--- a/src/parsehdr.c
++++ b/src/parsehdr.c
+@@ -666,7 +666,7 @@ cr_package_from_header(Header hdr,
+=20
+     if (hdrrflags & CR_HDRR_LOADHDRID)
+         pkg->hdrid =3D cr_safe_string_chunk_insert(pkg->chunk,
+-                                                 headerGetString(hdr, R=
PMTAG_HDRID));
++                                                 headerGetString(hdr, R=
PMTAG_SHA1HEADER));
+=20
+     if (hdrrflags & CR_HDRR_LOADSIGNATURES) {
+         rpmtd gpgtd =3D rpmtdNew();
+--=20
+2.49.0
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb b/m=
eta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
index ecd43b0c0b..a103475a87 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/c=
reaterepo_c;branch=3Dmaster;p
            file://0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.pa=
tch \
            file://0003-Don-t-try-to-use-imported-targets-of-turned-off-d=
epe.patch \
            file://0004-cmake-Allow-builds-without-Doxygen-being-present-=
wit.patch \
+           file://0001-Use-RPMTAG_SHA1HEADER-instead-of-RPMTAG_HDRID.pat=
ch \
            "
=20
 SRCREV =3D "8c6e6f88df86d1e34ca26d3835d77a2816326414"
--=20
2.49.0


