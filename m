Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A836C3064D
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 13:46:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.37])
 by mx.groups.io with SMTP id smtpd.web11.25382.1719755159509094232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 06:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=ecKGaqGP;
 spf=pass (domain: outlook.com, ip: 40.92.89.37, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qco0j28fCc2LmjBH0S5fKJz/luGXgkNwgPNYJCji46T5+xCSSSCnJgrdzh9gNtDXZLoHIlvPCJ7n1VSrPlTFcyTnE2rTTv03+zeGhXvK/wfyyqXwEuMF1kP1zJa0slB2LOR7QhR8hrlZ04JbmFqmjP51qHT5lWCKwc6JMsARsBQFayO2eU8H+O+N7X7gKTjYYrSp8VVUB8rFifCQillq1VOXCrNizYKKPUuzUus31drl6+NOA2Kczh9vi5rfDlQJjeqTZ1l0JEx3Itdfj1biA1mB3c759Z3+M4T4y5A9VA6ZmnWm6fwwzbSvdYBfIh/+J6zt4IVTEKeE50bYxKPOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvwULLceojqAvAvTod5Vyck87nPP1BWuRWCn9u/8sBc=;
 b=gSdMW47H2QNoImlouwPl6dT9AuBZgE15leRU7KikgroXNcNTcuneg1x1a8Lcn25O7CUYQ9+Y/zvNaYdE7PakWR24eEAcLtjZxsGLr0v4OXwNpX7t3ullGeoZyCLt3wF5Lsi3SZHLrGh7gZz/RiXZLs2+9NZ+GgVUTE55qmn54P3MC+/10fgoR2yMEzuIZJFikSP5LpQPtCFxdyEGlizsJFWfDcoPdt6Wd8A5Xj9CFhwyVCt7wyDkQh8Jibe7UKCwI39PG1+RjuSueTVf5k7HiLZsh0J4QuUPpwqIoFevnm+Amyd651lqE6lpX8b18/7CUD68ifE2H62Q+Wh7rZAkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvwULLceojqAvAvTod5Vyck87nPP1BWuRWCn9u/8sBc=;
 b=ecKGaqGPdVz3tMDTonDG1iNq2apC7o9SXzyafaY448jK/PxDgPn6qZY2qEaSsh5FGwfF9/eyTBGzoB9UlSuw36qiRb/5yHTKoXBa5lRHjKxVvau8cyex2eqXqPp/8I5HvO4Dn5LPwU8IZaL254hwI5KgR51UGUZ7c21Ad+g9QRmrQjdpiaKOzUi5GdC+E9iOi+vI8kzd6syU8JPb9quu1b+txzB9UPLs5YFRm5BT1mooq/GCXiO86/C6CwvbzzC6Of/MHrxFDWitTtvCAkkBSQRKFOIcBD+TwLiD8h64oPJrZ8AdbZv54vsXij0pG4+14B0omSzvznJWVRGbI1ZAng==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by PR3PR07MB6892.eurprd07.prod.outlook.com (2603:10a6:102:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Sun, 30 Jun
 2024 13:45:56 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7741.017; Sun, 30 Jun 2024
 13:45:56 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] testimage: fallback for empty IMAGE_LINK_NAME
Date: Sun, 30 Jun 2024 13:45:45 +0000
Message-ID: <GV1PR07MB91207A72F4893DF2DC27B236A8D22@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [55vMcItn6TUv1ZVB0HgjvradxxrTGCd07bsmqdn7VD7xeHvsRbo96XcJB07JLCHn]
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240630134545.10672-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|PR3PR07MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 216c69d0-f584-447f-b8b9-08dc990af75c
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	Vfshj0rt7oeq6/xDuis7DzkgDZODm438ZwooDH9eEDMn3xEpH2x6SNRYTyP3lhB/ys/KDExHHnjgiFZf+GgeWyUCSWD+OUGBZYkFbPVNZ8owfYdcLgDVuqnlkNyVmkC/wGb1otBDOmxmxtWxwghKSJh3SK0GDxOFYRp0588f3ak9C7pMP0gUEBIc/AhWWqq1LFm1qS2mcQFQOFAMbkoH7zWPRDo28aDdUCL++iwBwD8LLlOshUykXRZR6KibJvxxBl0305FRl0dTxn0C82N7ApM7rqy6slHUpBlkhlY5Bw+fLkuMfh3nmyvn9+/z2CvvuiOA+KXt2SMqtAwImo1YborGhuYyHZBru6RvPMmhUT7RgSZ6NmeBkRLa7hvcy/xDBSvHzdyn6v+sbuV+Kdhj7tuhxgXa9vEfFCNRFiFrh10bz7UtMx43cW+pgJ1vJdKR2eTTtvt11i4lnSKB34i2QMz1V/BZYpSkVqLM01DnAUnNvRYq6qn/T/wMdFDDvc3C8ONhh1LKKyAtY0WXluGNuZxSA8CBtBr5wzW4Ab+m42ySWr53/Y2vQGuLN7Qh4K/mhlMIhjVyu9mMUI5n9ToUYHslcc6BnaFH4uQc8CigGstUjO97Sd2jWkqhHzSthrAuyG5cyhKLIUlZZ3lQX9GcQQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KrL+R2bFIRStYDPMJnREMViEDjt7X+gHuTaSw0HKMhllkd7EI2c+CjTYIhO9?=
 =?us-ascii?Q?cdj80npwroOwt1v/JBzkaj5BVTdhQoniUgADe654C20OUw0wjK4xL77QYPE7?=
 =?us-ascii?Q?1yMELXi84q6mD6wH8mlcZYzR6UYkV0YhZVFzfmDyHsT7N6JQcxWHyRVpw0ko?=
 =?us-ascii?Q?UZ2JyKMiaP7tWSdHxJ49G7bVXhogD2lx/CacUh4hybqVCCq9V/Zti6D6Z+pB?=
 =?us-ascii?Q?XFo+8ZE8IeV1sl8zTOz6eGykuQLRDPIne2qF/l8m5ZDvph4jr6GFa90uAqij?=
 =?us-ascii?Q?XW/mS7fGg7T3FcKaqdJAUCsGmEghKmJa6K4x/nsV/EULKP067QBEKP7WP9Io?=
 =?us-ascii?Q?dNOTUc+0pUcqaiumQ0/xSwypZXVb57xZMYpdZXaa9W2/RWCQQfGxPZPndIeG?=
 =?us-ascii?Q?QCrayPrEFwIsUFuDEOEM/UApduvo00AnSLBDP7bDUgPOWxfvc62H7RIkNRHX?=
 =?us-ascii?Q?bckj/t9dycvNIu4JUuVLLUeMDizwflusAvvan5kxZTLz5q6xvDcPUgYfjrLE?=
 =?us-ascii?Q?Omqm6Skn+3goxhbdPqbv4Hx9EgEptoOeFx7I6SyLnC6Yxn/BJtzr/68iDuwa?=
 =?us-ascii?Q?GJLehTZsjkO6De4NMEp84Tam0cSel1HC6e9f6fva76vAHRNqB971+N5wll5P?=
 =?us-ascii?Q?fY/xg3oNJcWtWA3kvD+xGiB4ZC20vVVZB5/wftBRwd97tQ0FukPs38rELmqc?=
 =?us-ascii?Q?0l79XKhbt3YWzsUUycRfyDPTAEdcw/fc0FCRDBt0jT4G1/JEnsrDH+lJ+poX?=
 =?us-ascii?Q?fx6g8HZJD+dzheVhgXGDFL0wF7gRszTa9Yy2zyVvy0DZJpSYf53w0HukY9Lj?=
 =?us-ascii?Q?bBRK06RTysGS5a5zfr4oRWCGyoDoF2kUJxJ/kVXbwr4ajEmEGrTCOXuF8oMw?=
 =?us-ascii?Q?J/dhwBaw6jzC6eV19hwqv87t9EDYO/Yt6QVeF15YqANT8o5VC71lkM0tUtsE?=
 =?us-ascii?Q?hFgqQqV4WxAdb3AjVKynnPN1CrWr5Ieaq0don8RekHAO/9Lyh9B/67d6yyjY?=
 =?us-ascii?Q?k6V1ndhVGexIEJLtA97a3g2BIRku1fv/mZnrsBVsMFBOdzUKOqxw/XrGXyp7?=
 =?us-ascii?Q?3IHxgPDHk/H8Rx3VxDq0o1vt0r2rR+70SHg9heiL7LrJFIaoTYNP7U+LxDNa?=
 =?us-ascii?Q?G7EQnXULveaWyaw5UeaaDNOe1DiLeQmo2hujdmNIe9YMoZfItTH1dl8N0iIl?=
 =?us-ascii?Q?nVrI2z/yNdd7u+NkNFJx4GbwJIz09mHg4cApX71r2FbcpEcQOa9/EK7SDVH9?=
 =?us-ascii?Q?xCrCyEprGOU5w08a6NY/baNYkgF4TP3siRE0xyCueg+vc0oGcP2W+mJE9Ukr?=
 =?us-ascii?Q?gRQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216c69d0-f584-447f-b8b9-08dc990af75c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 13:45:56.0547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201235

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testimage fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-recipe/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/te=
stimage.bbclass
index ed0d87b7a7..72282ac362 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -110,7 +110,7 @@ TESTIMAGELOCK:qemuall =3D ""
=20
 TESTIMAGE_DUMP_DIR ?=3D "${LOG_DIR}/runtime-hostdump/"
=20
-TESTIMAGE_UPDATE_VARS ?=3D "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAM=
E"
+TESTIMAGE_UPDATE_VARS ?=3D "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAM=
E IMAGE_NAME"
=20
 testimage_dump_monitor () {
     query-status
@@ -208,7 +208,7 @@ def testimage_main(d):
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
=20
     image_name =3D ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAG=
E_NAME')))
=20
     tdname =3D "%s.testdata.json" % image_name
     try:
--=20
2.34.1


