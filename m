Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1557C5AE4A
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:55:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.5065.1700135707865706721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=g2ij1rVB;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP+MRo3iLM6WlHUrwYGJtu1aIbi/qDki6swIZk+s3zSKfBw+IeiBKjetYo8UlxQc4jyedPY4xXJtn6OvmrdFBpgQHtnS5tENnW1ScPiTYoFhBMyhDrt+XDCVBTZHhC/I51wNVfT6U4hE2iTzPQl7bY8lO/EVfi3pSSEzk7c5WfKUonXVJ9p+GF7GNAXjTy6KBLM6OUyTA2SE2ApUiICMrfDXboeHKGO8A+SwpycOhsxWyKMwjzNny0Wyrpjx2Mg2I5hk/rpp1TEkSTV8BNJCRMGQsjdr2FaKcYdvtEVQUWrsGNZdwXzqJFq0nrlZiGqt6r2NeEFg63AQG6JsaiG6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r9ErEIZtvw0NiEh0Fqj0ZnXJyowoPyBlfTl35ogs5w=;
 b=mR/vnkknpqT2vfCnH4CleKbe5cQNQ+0kB4THmgOid6QqTI0XfEHfngXu9BCy1b7linYanlTZbp+j+eN63ZDbrQWffPHV6WSYCyx10mEmIt5G02MW4lgls0cyfWICBhL43odMy0ubBlc7tf+2WR0Gl5vzSqXtSa2gafc4W/dE2LnLUpDfq4QtYgotD7uH3jkD8CrOrsSIgxVvsxdnc1Wifd2Nsbb2aluRcevH7F4BN9JX0W9qsGSqKUwRDGrNgAl3UppYgyLpOsfKOGze1vNgs0ticZAXIkroTEwb8sOQ2laswlv8wq7pswQ6Yaq8X1l3FMnxw/HxOfO9bQCo+EcUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r9ErEIZtvw0NiEh0Fqj0ZnXJyowoPyBlfTl35ogs5w=;
 b=g2ij1rVB5glHV7pjeiVz8mMA4Vi9iSHuJ0De2abhUpibE+U7plkfUcZc9yOYh7KUEoc62HV6Jrj/OMzcqUbLny1L+gXk4nXGN4fYsG5pOi2IdkYodLIKELjhzKkzE2djaKRpvxbbnH589UpEf091CbHBE0JD5CZaQSWBDjlbew4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10581.eurprd08.prod.outlook.com (2603:10a6:800:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 11:55:04 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 11:55:04 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	Malte Schmidt <malte.schmidt@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 2/4] pam: use nonarch libdir for tmpfiles.d
Date: Thu, 16 Nov 2023 12:54:55 +0100
Message-ID: <20231116115457.1462082-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
References: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdcdb3e-a835-45f0-48ab-08dbe69adee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TaGh0uG5Zw8EI8miGyKib9Q7Lb7GqtgPED10BmeNQkS43QOrt6oELsVEGYVt06fj6yLrsBvAhBRkmX5MgxQ4BGOb2RIsokqB7OoIi4y4oH75uu0LxzJc6+xRJJ6oCUI7/bf7YtE9vsbg13Zq8+xaOl6WW6Yr7a3CtGXI6T3YwEGG7UR2T4LoVY+HiIMFMtO4Szp5rD7CK1Y9YXjG+fD2WnpnPlAsigszBcw1auBXyWEb2bq6udE2hZXmHBMVAmPcqESLbbmB90NjD0L90dAruyKxq99de/IrmJPucS3pfrY6yPsPvuOi1Ehp0Z2eC1tstfqQCUlapPFI00MrZVxwVObEKF+HGwyMQc2NjIvJspYo3kuGnGWhgjQ3L/i90jLFxRjhsRtjBX+gYZBgeSKwx0+zDRwNU5UVKrYWB1iMhkRxgMN3+K/yiBCEjD3UOAIzpBUIKI1XqTRPmDtyWQyYhC7TstK0uXGeYUzu5Qbx7dvz4MSCCIsiYiMcJkFDFV04Z9CQyUTIzBdNQC5Whadpe5Q6fTPhGA5RHPDqC5z40OzWHl9XvLXvWMB08gWSRIRmvkKCrXC04+Czd0fRIZIog1rjbKzdDL4qaU9YLlw5cU4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(478600001)(6512007)(1076003)(9686003)(2616005)(6506007)(6486002)(107886003)(966005)(6666004)(26005)(316002)(54906003)(66946007)(41300700001)(4326008)(83380400001)(2906002)(5660300002)(66476007)(6916009)(8676002)(8936002)(38100700002)(36756003)(38350700005)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wJDg3uBnvlS5eDpIW63/8a8dkgImjlVlcI9t0si2EwISC5Qy2ylimP31lzn/?=
 =?us-ascii?Q?dMHkFo5jz/P21fVAFrsibqhexuQyGsXdAhkcL+O/sEp77R8NpmHUgnu5RHvj?=
 =?us-ascii?Q?DrFeBzgeNxj6u7BO56ctDG8JK+E21vudKm/FYidYqDMRKj9OemmMlRZQ7FDQ?=
 =?us-ascii?Q?Cfh13Gn7dQYWhKIiuvDxaQ7jR/fjf+OOGqrteYQtDr4BKty8d7vzx6U48kRy?=
 =?us-ascii?Q?PdZJ85hCxZra6kwiswjCnC9FGNLj2i5XXkrtc1ILeG8mGnhrOMjof7vrlVoc?=
 =?us-ascii?Q?HiADOC1o81ws1hKniEiWM5cFl9qboAbuFcHIC9H+7GbakgHAz8IKHe1BnHL6?=
 =?us-ascii?Q?giHGuWGmaB9atJU8MZ53OtwZC5YkiiM4fhnyGQSRNQjpUNJ87aopd/rg31Ee?=
 =?us-ascii?Q?kyTKioDHO5u87WLpAWEqazMrOKPWUzevhoxcP79sjVTNSYUCF3xkqPqxbqeW?=
 =?us-ascii?Q?nKoIWUe1YueHfyp5FDpPqg4NAnigiRe/HPha7zSwkBqXz+s7rvOoJchnKK7u?=
 =?us-ascii?Q?V3ac9vs2RWV6B9tigxiTMUAPlhrCHScIMrjHDiAMO6rBgt155kfUm5XcezvI?=
 =?us-ascii?Q?FDBh03Pci7xmmFSCKS8XgUvsC6ZogLW6W7vBbXBbucfee20rhD2tdtgo+9V0?=
 =?us-ascii?Q?boJbcbXffHq/RjEF2AqD+H1auA9ET4V3sahDGD20vd2Fatm9uTDSeGPMTJHp?=
 =?us-ascii?Q?VNIwQggJMygGOq2L/IDDiHP8x44tE9zfkixY9poIQa2Lrk11LkKeKoQHWTd5?=
 =?us-ascii?Q?nltwWBZbe8+68B8r6VZ0WCGaFV0OOCdPMc56/V2ROOBHEVt/ef2h96+N7POY?=
 =?us-ascii?Q?TfQ196E/DAyapfQeKw0h+frSBaMX2wKu3yozMJ1whomXGAa+fluXjvxCkey3?=
 =?us-ascii?Q?mIeHd60+OQEp96ouqhJnoF2J+RHFXX+U/9KnEMM3Ow40eZIF5hmvOp0Mqlc7?=
 =?us-ascii?Q?vXaq65TLWMD8eiZiESAvkkzD5nPUhPRf5lAUPxGhoSAz7TfQbMtLgNaWiIEI?=
 =?us-ascii?Q?ncsK4sXdKKT43/1hniz9eZgF+PnsHMjMRQNX/Q5gzOjSPaZ9VVZ2qDn89t4I?=
 =?us-ascii?Q?9R1q4pF81IRXGGcXtRpVLkBycldrJ4ou/S13OTN6w09VTVRv1sZ/ZBwblgnP?=
 =?us-ascii?Q?o7R1g5ekbly75LCamFy/suz601yTM3fOUbpvCAFcAb6BE0RIx61LBFvlS1Nx?=
 =?us-ascii?Q?usWrTe9C9b4AyD6+pH+jp4fnhhv0Gr8rnIU+epVwVb4jVWbMSAUgXG3ZWdVL?=
 =?us-ascii?Q?N+xycIPKvCJJaaDwuy1YA661iTNb7yoiC+o2PpGed+HYbwKpBayYz56MqEAu?=
 =?us-ascii?Q?EwZK15EZ+j5eLTbXg3eOxqH3QtHD8w6BixnPwc/AyOWJYykxIXQmFCPlxp9y?=
 =?us-ascii?Q?ckQcMLmdmRzSeYj3H2PqVNs4Xrp71V6ZeRGCIJcoAFZZoMLOT07sF7YL5LRH?=
 =?us-ascii?Q?BU8A4zvdKV78agZNZnUcfnPV2KR3HBeOOC/3DyzIx852wW9LBs7ztRjkPWHM?=
 =?us-ascii?Q?ROoddURquzM71LOaARpXyFGCM1eCPWhkUqKUG0Tz2W3h+A/z3f9b9MN47gVu?=
 =?us-ascii?Q?vXxDeTeVq25ON8L64rUrNoP+VL+OpGlFmjC3fvqCnZNucm8otSps/H9HiKGQ?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdcdb3e-a835-45f0-48ab-08dbe69adee2
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 11:55:04.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAvCbE9rzGJvcMZ34Pn+FOlH5uYJGKJ0z3uD0mny/lkXZSTcrC0npSVZXADdmW+9OV9FgDmJD2MG4AbsBfiE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190787

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
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


