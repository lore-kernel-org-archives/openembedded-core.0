Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.117])
 by mx.groups.io with SMTP id smtpd.web10.5089.1587993232033839283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 06:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qt.io header.s=selector2 header.b=fAxNr3pL;
 spf=pass (domain: qt.io, ip: 40.107.3.117, mailfrom: samuli.piippo@qt.io)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4mUwKzCxS8dnPkb7jxG8hUoBr5jw+92v7wRw6LJJ+jcYZ0ZULpkXpGuuUwS9zbOdtQLaH0K3uNrTeGkXOohRfhjcpzFixUxAcB63nkwdurD5iXS7T4I7F5C2X+DpijDbFmKhNDCjJKCgbLCiBviOZKrgksqgcmWE///CkDzza+Joz/lgVU4WdX/nqdcKFeBxH44SLrtv9e+WfKM6zj05msbCm5ctKLpNmccSNi/7qEITRXfhuj7hz+wKu7pr7a9MiHvIgbcFpTrjhFYjJf0ob1+U+z1tj5IeX60O6/UWTxXof/onQ/ud5B90UCWbta4/btVpTRXAwoEW/RGNQDmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/gI5WIQpaiGxz5gE1tBnAeVkZquGHuXHw3ST4YCQFA=;
 b=VJ6Ts31txi5Uxw6Viu1Iyru64rTTvPa/vtREnibbah6UPfb7ETS71WEZcfOa6JOhTLg10msRR1Cim3f/ppUeLQltZ6x9eANei2rkzPHDt1TCUVowuN640g9Br+Nhm9vhs2VGwN8dh7pCEPrbY9dYIniz0dh3bYB8eiDJrRo3eCnYbGxUAOcHvx1kFeFd9Cs7xZ6KART/h3pHE0BS6lsIfnUUtY+0Q7mOwiP+WCONYmCi2V1E9TnfayYE7aq65/eHelfIrpGFtXIIbM0/q/34y2Py5QQE7PzI/OhxKoocf29XOBk/0XyaTG8DsHltOa0Rl87X+SGcwyCFuxp0FSEQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
 header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/gI5WIQpaiGxz5gE1tBnAeVkZquGHuXHw3ST4YCQFA=;
 b=fAxNr3pL9OfkApwgMKhdid06oCEM0XJYl0JCBl06jQAnCzLEo25rNXr0HwC9l1ztwJA1q1m8j6kK4rvNkw9Bh4Um9e90ZH4g7b3laW0gdUr76w+VMFsvRG9aLV2RQtCDcoHR6oV+8goGW7+nAtx0LnGEGABozk+BpXMUzdcbzoo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=samuli.piippo@qt.io; 
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com (2603:10a6:8:d::29)
 by DB3PR0202MB3451.eurprd02.prod.outlook.com (2603:10a6:8:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 13:13:49 +0000
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::5d16:de0e:8356:3d4f]) by DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::5d16:de0e:8356:3d4f%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 13:13:48 +0000
From: "Samuli Piippo" <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
Date: Mon, 27 Apr 2020 16:13:28 +0300
Message-Id: <20200427131328.12044-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HE1P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::24)
 To DB3PR0202MB3449.eurprd02.prod.outlook.com (2603:10a6:8:d::29)
Return-Path: samuli.piippo@qt.io
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from munkone.intra.qt.io (192.89.120.62) by HE1P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Mon, 27 Apr 2020 13:13:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [192.89.120.62]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a79d49-a824-4144-c3b3-08d7eaacd2a0
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3451:
X-Microsoft-Antispam-PRVS: 
	<DB3PR0202MB3451C1BC77AFB7CC372CEABDE9AF0@DB3PR0202MB3451.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0202MB3449.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(366004)(346002)(376002)(66946007)(478600001)(6916009)(66556008)(66476007)(52116002)(44832011)(7696005)(2616005)(26005)(6666004)(6486002)(956004)(316002)(36756003)(8936002)(186003)(8676002)(1076003)(81156014)(86362001)(2906002)(5660300002)(16526019);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
 sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pFB53jIMVj9atGe3qrWER8eUTzfzuwHEQv2QlbUythz8LTAYSGAtfSldSTA751BAszRMOaHolmVbEDT5Nei6GJmlraDQb2UiGTg0PNOT4GzSSKEdU4xTyvdO+iAnklqU5fzGJK+Hpya7ap3aLD/OR4Mo0DM5v/Bh/iMZO1WZqR57CPNpNaGgeC1O14jEGwRl5AvfJEDsTjxxFmKIv0ii7LukcDLG8sPwTGvdf5Azc21vHgUPz8OjGx/6vX6fJ1YCyrlqAbpVQo9U1YyFoXNvS2gvQnrIgT+i+BiufPXRv5Kd46mSOSLeOEUJPBg6AmaYnFIHRwbY2Ckz1Iqu6tIE99bqn5ZQWsWZdcJr/e48jADii1kEK2T4h0SQFwYghjsPcd/4P1kudSyCo/O117GrkaIFImznAKqbdS8baJJzqL+uhNXCgd5hBlMNgvinuSkm
X-MS-Exchange-AntiSpam-MessageData: 
	b7l6TYbr0gGHECPk3eCqqIZb+CmngIw9BQjLnYu80MPwHZVfMl6HmRZlpc7vmOEHNbuNJz4Drgm+l0myEJJP5BqiZYbbBN4qYFaixOTVI2HpQYDYHuKjfXka+Qdak7ewUtOBsaSkxPGpCYLmSGcpeR8Bp8TOjgtjOv02iK5j17F1YWBt13ZFs74NPaFHcirv24SFXfpd6AOdpq9t1ybGv1mE4tTNkUyppTlEDobIP95tjUPPcu4XlfrNuHSKgKhpzQD47rnY6ROX/PCIqz8nUk88Z5BSWCa9s/on2yV8FEsaPDNtJa9peKE8xMEQbdPbwbmxVk4Ot3VUXQ3+F6O4jJmrkzyLCqAwWyNxT/2C6wsQaeZhOsKa/1CnnpQw1DF1JJWgXQltEVrXDwxBe2UTLtLEFRia0eY8wzHQVguhlIZdXA8oEgwnhYDIDmS95epu1czNPdKyO/P0E/LpXNyq4kFUb6J/piS/k8HeQPvuYyNDNpxf6S8qT3NkfZU8RCZv90khCdyJQ/+94ZAAqz3xa/TNjsnr2mD6g0JdhZnxc3iz/ts3jvRNl1UUC32T+ogx+QjjI7LpSWoze4HBTGVVd3LTKQraff3Zc1znCSOGRbR1o6IHGxlgEnbkvH0fqEcVfdJHcSMt//mRRquGLorsatNrz2MgcHnjiu31cHTU0A56iC7Dna1eOAsAjde44SYGV9DvIndWvGnU9J2VY+Kp02hMd6MB4xDSSX4hgY6zLdMMwroVhjhUTuuAQyd+fU2Q96+Mx5APDwKY4J9+UuD103trWmhrgl9DcOZ9XsLfwiE=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a79d49-a824-4144-c3b3-08d7eaacd2a0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 13:13:48.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pPk6j7l0RtAOWL5SBafrD4FXGbN5YoTKI2MK/Br/z96jiEBIurvvljOIWrOfq2bHPAW603D5DX+fYXpjVHeHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3451
Content-Type: text/plain

meta-mingw is using Mingw-w64 but the host triplet does not match
the expected pattern. config/os/mingw32-w64 enables more features
that were not working with mingw32.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
 ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index b0411078d3..4c8275bf2a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
new file mode 100644
index 0000000000..5a167f252c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
@@ -0,0 +1,36 @@
+From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Fri, 23 Aug 2019 10:10:43 +0300
+Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
+
+Make sure we use the w64 version of the configs, since that's what
+meta-mingw is using.
+
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ libstdc++-v3/configure.host | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
+index 155a3cdea..adbda8784 100644
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
+@@ -277,16 +277,8 @@ case "${host_os}" in
+     os_include_dir="os/hpux"
+     ;;
+   mingw32*)
+-    case "$host" in
+-      *-w64-*)
+-        os_include_dir="os/mingw32-w64"
+-        error_constants_dir="os/mingw32-w64"
+-        ;;
+-      *)
+-        os_include_dir="os/mingw32"
+-        error_constants_dir="os/mingw32"
+-        ;;
+-    esac
++    os_include_dir="os/mingw32-w64"
++    error_constants_dir="os/mingw32-w64"
+     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"
+     ;;
+   netbsd*)
-- 
2.17.1

