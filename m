Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ABDC072A2
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:00:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web10.10162.1699959629235343840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Cse9rzr8;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.76, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTKp8XSG5Sww6Y5tSEUVWifz63ih+xCIP1u6BNzT3mCpkoRn+O5Tk6VFkfHApJuHrQk5NZuREzEKrvuVwux/0bQrg9vICd6sKvek5ks6jDq4VPowKiEmNTx4pcEl/0GrJ4+Svs91ubkwqieEOxP0vshry86RTHOWatOTiXeKzQjuMEjGqTX/keO1IP33SUHW0lU8QnGFGAO9ZtHRgLxrm0wxHNa6KRVMsgyvyuM3clgLGbPkX7Orh/sLej9l2yWnOg2x+DTQOiKl/7B9VJxWaFfGwKpFCps6XV/D3iv1nvcC6Z1l2p9FJ5V4oJCZGit6vJoBuRnz8HvkNU4CyEW2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCd8HAfuhjada07SIEqWpohMzbVWi6M9NNRaQ0u0iT4=;
 b=aGGg9FO1XB1CTbLUHTtsinSTBA9iEZWqJ5cE6vyzNcyolrHsX7NK1Bh+lugHXo0Cq40Ivr+WZhuvqlkAZdviU8WvdwMqqCuGoBt+5XXBVBGUtCBxb6NOR/zJyOLt/6F03srNMMAzItBhga74TsseWiYQTKEeEgivxNc6dSZuPshi1L+WKLIjKiQEcGiJzQMuOuGghG8nHISh/mX/m1zJoQwppGkB1+ftgN0lmPPMDbcyU13oG5R/GScD/dc1q6MKPRWKvI0//hgOI7nP1DUY1WbzG4VrguBuwiQSWhMcxLnWfsbAittUIG3cSbjKirqh6O8KVStd0yKu0yJikBcR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCd8HAfuhjada07SIEqWpohMzbVWi6M9NNRaQ0u0iT4=;
 b=Cse9rzr8YsnFe0uVq0dxj4KyZnMsMjYboKDKlze8tj21QL51ZgzpdlSrDuZcKrMetkFZYi/oi26h4CaGm3VAgHMC4xS58R4V5/brK/p3L37JQFjG3lGUzOtftCFP1cL3XOcJSzSoqRCJcW6x01WvWK9e5MJNC2muTK4P/ebczaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:00:26 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 11:00:26 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Malte Schmidt <malte.schmidt@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 2/4] pam: use nonarch libdir for tmpfiles.d
Date: Tue, 14 Nov 2023 12:00:16 +0100
Message-ID: <d89820cadc9c88d3c6a1ad52812cdf3c37923c22.1699958492.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1699958492.git.lukas.funke@weidmueller.com>
References: <cover.1699958492.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: f43e426c-dc30-4d49-5d48-08dbe500e7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jz5+rYvEgu3zEyiPevrxzr3/6xZTZ0jJWOXHpv/1fP5upckwu9sgtxoONh2XDg6Kmv+DoY8WZ++2Y3GHwhipl+w5rpwIaW6yb/gl/iv3m4LMP0dfPn0EtCyHhUtktebHq+OMUs7TyI26Ca7HZS+dR6zWlERrmXx3oXE6VhMdATrhwq52F9ez4D3fPFDebxIMZXVsv9MgRjGLrxTsGGP2urjpSoqCEC5FGU5s5S/9fr0D8uuxbPcPaMCKNSgQasuU0yf0T8pamPrbPBOh2ZsOg4MtvON6ZNy7SIdzHp2QXzBEmfcftag6bzECC02fuKDYDInAwEH28Cr0MEeB2vsjPwvaD1DDskvHMTgIqM9D2KeGaCSxq4MH64ZUwRqRiPGN/XvQsGmn8+TxVjMVbRIxRnoSzG9v2ni3uJnZ2UiJ3Hm8Xx9sIA41Kk+BcKqUHy2i1JTKf9Ey5fL2EmUaHch043cufe14t36mzlUVpCZIVQFkx7y4c1/XyrXo48GJLsQ/iqZMe9nXtfxbuMuatqfy+3juuvVYDT+COvM/RZgns9m5do24sc5R7IngNY9bTFYn9oW8dk7rZn3huxcbxPeIFmLDeUaRjLvSLD+ekoys4Ls=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(83380400001)(38350700005)(26005)(107886003)(2616005)(38100700002)(6666004)(5660300002)(86362001)(4326008)(8936002)(8676002)(966005)(6486002)(478600001)(41300700001)(66476007)(52116002)(66556008)(66946007)(6916009)(6512007)(9686003)(54906003)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jkBBcJmzqlluBJGHMElHe3XV2LOfrAiYJs5J3zoE/pTCD0veJ+q3EtBDNaVu?=
 =?us-ascii?Q?NOltP1aRAneUXXOPRGEqqfNFKErAgiwJW9N/vjm+vZ5vlrrFj356fwPI/wKS?=
 =?us-ascii?Q?RTuIFLmBp2ELcq4MASmawlTOvMM/HeUPeEN1OT+58e7eOYZZjE49Oo2XLn0V?=
 =?us-ascii?Q?4KZV5i2XNtWwFQTXyPOts/b8kl7IweF83GFcwCApXQMn9dW4gs7lrAVzs3pn?=
 =?us-ascii?Q?DZ+ItD6mJkRWy9r1Lbeq9APCpNwaDVyJZSME9Yx78aJrx7kmBhI9aYmfubgF?=
 =?us-ascii?Q?65NCHsVlyhP/WvB2K5tuoa3OZfZ2Dx4wpgMbLSRtmLkZ2Z52HB4TJ1ecgA1w?=
 =?us-ascii?Q?vU5yENsWum+UtTZ8aiXqt+qHLC8CN+Xoml5IJ6GUlJl6D7ptvTn0PphiKPXm?=
 =?us-ascii?Q?MK+1SdOMjeXSVBFjQnKYtjXIQyauyvUVGrWtv/fp48FTqGn8XZt8Ryi48loZ?=
 =?us-ascii?Q?+GdT5nfYt0x59va+TGpDQnAevwZ9d89mIm46DLEjAEMzq5VXn6fCyNT6gqV9?=
 =?us-ascii?Q?UJEsjWdGBMXrWEPDhff1GrK1wzcLhsfbVJY+7CY5pAeQ74HdPliXvmZGbzLj?=
 =?us-ascii?Q?4J4a9ocwntLAFnLaJO9dbByWFTxjDUrJWLJVIYNiPCBykYCz9ac6cfNhgldr?=
 =?us-ascii?Q?Rmfi544e4XXsxGnCwwFuVTRxjsrxbnDJ5cI8eILcyMKi9pX//9jD69xRwMv1?=
 =?us-ascii?Q?wTD1620SL800xGkKgQQGsC+lyYCLmOwjo9KFARSasDOMAFl5pU8JNYjeXrF9?=
 =?us-ascii?Q?rnC8zlKxIaIN5Ba+WSkUWuH3zOVywFCVrccGeiXtnwA6SixZY0CmhBKH8DmQ?=
 =?us-ascii?Q?8oBsDaE+TmClJohgnSHwsDm3EPCQ7LLlRvZPsC7NKrWTkenxetSdpybutj6u?=
 =?us-ascii?Q?+5xL+9RIpqfOL3UThEbW78cGG4O+lj9BkJOtrrIL6vqjmvFE6CB/zhayQgWX?=
 =?us-ascii?Q?/F5atS9pLDLKK0BDy+KuSCFMA41D1ICk3zBNl58uNm+xehJ+wb3/BHTbfWjS?=
 =?us-ascii?Q?XqS7SuSg76AhULMZTBIezenmQETcAHPP+yRkTSVQiu9RkIUr7BBeSax9CE7g?=
 =?us-ascii?Q?C3QfA1MddP0biQVGF1UpAEdY68pE3LgiFCgkeOtsQWJz97vAS6jKL2tcMKce?=
 =?us-ascii?Q?G3GP8Pon7PLdBSNDGtQt10TS+P1gne6OMAjUeaB6oFTNKT/fhC2c6faRS9ZN?=
 =?us-ascii?Q?dWeD5QIDbg9d2n7h6nKyZbnqWVvL2q2yx2idFzz/sivA7+BwjExerRwh4Pb9?=
 =?us-ascii?Q?F2KINgn2Wt/VND6mYXO0KF81BpZMJ2IR3ldZByC6p8f0EGQknrmcqcM0HdPU?=
 =?us-ascii?Q?WfkcHviPL2HlonVxwJaiZ/HTCZz40uvJMKeXyJoq0SHwc912wwI1Yxtwviex?=
 =?us-ascii?Q?KJk3dAQ39uQ8UyIqwjY/85F/cFlbZk6mV8hfGyLtOBvGI6qqo/v9R+BcwIVn?=
 =?us-ascii?Q?tn0UhI6qIqVGTfMBsznNBlXabEtQwgNB9YrqdurEo92nqY/gvLgb8J/44ivl?=
 =?us-ascii?Q?S4LJTFKev5sQRRQhCXbaRQXI4kJTHTIzNZV5KPecfZgG3xe99ja5XscnO61Q?=
 =?us-ascii?Q?Ab8McdO16VQ5di1P6koSVz+5McHrwRJKxaAxmSE1OT1qSToLUC7VH2EIxOFZ?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43e426c-dc30-4d49-5d48-08dbe500e7fc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:00:25.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WA2pTCxr1fBQJIH+mguKGVZagkpOtTIDhkc1vVFomKQYOrbGFClyHUiYNt4sp8uDXMfGijzLZ1KtinyDF8+jnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190494

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-exten=
ded/pam/libpam_1.5.3.bb
index 1aa307af4d..7af3ea99d1 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -49,7 +49,10 @@ PACKAGECONFIG[audit] =3D "--enable-audit,--disable-audit=
,audit,"
 PACKAGECONFIG[userdb] =3D "--enable-db=3Ddb,--enable-db=3Dno,db,"
=20
 PACKAGES +=3D "${PN}-runtime ${PN}-xtests"
-FILES:${PN} =3D "${base_libdir}/lib*${SOLIBS}"
+FILES:${PN} =3D " \
+    ${base_libdir}/lib*${SOLIBS} \
+    ${nonarch_libdir}/tmpfiles.d/*.conf \
+"
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${base_libdir}/*.la ${b=
ase_libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-runtime =3D "${sysconfdir} ${sbindir} ${systemd_system_unitdir=
}"
 FILES:${PN}-xtests =3D "${datadir}/Linux-PAM/xtests"
@@ -130,9 +133,9 @@ do_install() {
         if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true=
',d)}; then
             rm -rf ${D}${sysconfdir}/init.d/
             rm -rf ${D}${sysconfdir}/rc*
-            install -d ${D}${sysconfdir}/tmpfiles.d
+            install -d ${D}${nonarch_libdir}/tmpfiles.d
             install -m 0644 ${WORKDIR}/pam-volatiles.conf \
-                    ${D}${sysconfdir}/tmpfiles.d/pam.conf
+                    ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
         else
             install -d ${D}${sysconfdir}/default/volatiles
             install -m 0644 ${WORKDIR}/99_pam \
--=20
2.30.2


