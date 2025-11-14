Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80862CE8D4D
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 16:00:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1716.1763136040011857737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 08:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=hvWpY80H;
 spf=pass (domain: witekio.com, ip: 52.101.83.73, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txB9DY7PPamssrEwuCWAZUBJu75V1KL6o3HjTgp3vsETmeiqP8DYryxwQPPcjzYq7hkEi39PLsunmcatXX7PhWM4xqDfjhlzGBt0jBc/iTRgmf3Yj+sYkyhDnEqhi6JBOI8pCv5SENapEWTsgM48z8ljyNuUWNnxhkBB7za0J4wybcZ+D0RNbDGnbcf6KYlG8967nXLTiqIeh2oX148HdZiEEYOLvYehAnWHE3s4U3WJkMsaaP9CIfhEHfxl3OmXbHi5CtPe9s7Rh3RYiILShp7fH8Duhwd3L1o2AawhXOBHjSzLHQQ2CPIWx+Rsq1SoaPN7UshA0QbpiFq3DCfhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kmPPkYF3gRoZtdIzVD9lH9MaunFgYkM1Cm3JHh5ZbA=;
 b=rXigHQd0yY3jJ2U9IKCePfHAlcucErNUTLFZfi+XgPly+UDG6ikLamd50RBTWompS03fySS+5rd5tbBW6GJEhmS02TFTKNIUX0MfMqS8cVe6xkuraA2fMme3wSiJmap8JraYfuUv7UoQE34Tn6J9j3uXj+NnXqDE/r7GjUWBPGl7Dv5JVOnrrgzxNN2RxbuC3br5lFIlogyr1bUTHu/I8K7vxLT8+yGGq+/qbMk6qOXDTjfINX7UuoqR7TJLwfxpXkJnaQUXUCPnWa6QvLWZHZ77ONb7/fjq68XKXeH4HiPE3/hZNDuHHSUJFyA28GAUc4aU48jxc/SxiHqi8d0a4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kmPPkYF3gRoZtdIzVD9lH9MaunFgYkM1Cm3JHh5ZbA=;
 b=hvWpY80HKx77eQ4/hof6BgnrLAvtmrWHZ/lLwYSugqETHRLiOSdBDT31kS9uIVjStr3lYG54d0Tg3x8oSQt2Y+i4X6ktpsMsK0dJikq4JwwCpX5YBxDg7o6e/6VixbBLcEB4ta8veuIlpwZBqiryZSMv5+22iClXi9Z0LScwkGdoV+xtpbS9d3SLSoWHSg8yGf7CtqQrf7bwqKkUtBxQ0BJwRDaBI2UrnJnX/9ePa4gJl+5hwKulKj3of4vjfNM5lVrXzVFPtiB22lrMgp3PNq0X9ad62gphxZfGJ/8CfBKmkzNNHn1ga/DEwaNOjTy6XpDH2DLQQR6w95LCFkYI9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:b::27) by
 VE1P192MB0704.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 16:00:34 +0000
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40]) by DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:00:34 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] sqlite3: patch CVE-2025-7709
Date: Fri, 14 Nov 2025 17:00:07 +0100
Message-ID: <20251114160007.838947-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0678.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::18) To DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:5:b::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7P192MB0330:EE_|VE1P192MB0704:EE_
X-MS-Office365-Filtering-Correlation-Id: c494d9ff-d00c-4be2-a6cf-08de2396f1fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|10070799003|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0NpNmBVyI58dF0q5v8r/DQZPHdc+T7fmE7KSmssgjesE1/+ZuopUwO45WzLq?=
 =?us-ascii?Q?shHzNXXwEze1oKyTGZUGz1ykUf4w+aXS97xqqLO7R9n2JjtGTzwHfp7vWJTC?=
 =?us-ascii?Q?k/d6jPbogN4Fk612jSNonEPtFZUtU35IM8w/a4KKqpgMDT/vIjchJaY6SvLH?=
 =?us-ascii?Q?T99px4e4NmhJ0rBUzfla28Ov3IUfCrWt7Y7CKZw3zpmbRRWb2SHloPri30EL?=
 =?us-ascii?Q?azjnVD5Ptl+lJNNKxHLq3m2IcTaV5Lrq7+r9oTz0L1D3Ckr8GlL2ZuSOLSnd?=
 =?us-ascii?Q?6ZqMajn8BxuiMAnCJlQ6NDzbXLkKCtTrCkFbFUXLiNPAm33RtP8iyaLwdXNU?=
 =?us-ascii?Q?2UMeeaFN461WJANavhqy0Uzx4zdCg4ClNLqCV5WycTe5f8FvdzuMfqaavMXE?=
 =?us-ascii?Q?GN8Fk89YBWdJq596/i45+llyw7A/M78wUnx2z4Hcn3EFtkeDVuKaVl44nDO8?=
 =?us-ascii?Q?Q0zZylsAxtzApY2M7RbZs0riJei5g1RZ+tnjjFDimjJUtBaK2wtc7kZ4cE6J?=
 =?us-ascii?Q?2Wi358IN4+Oyy8barYant2K2gQdt4/IbzOPTa7K9SSJR+iyQ1eLwUl/y1PH8?=
 =?us-ascii?Q?cs7wayDJnSm+0MWA5ePljxnqO0eT9nS8w59/tX+INpasriKxEi3/6e0RbIUW?=
 =?us-ascii?Q?1edRJX6GX8daNpuWUBwlV4q4C8bAhIDK6pQtuFHUnyggk0DJBEhf8Xjgddyp?=
 =?us-ascii?Q?pTxRV4dycn5q/RDzcFVZsSGzy/hs6x/dm2Pdtf8RbHiMDMIg6q/25DlIezur?=
 =?us-ascii?Q?Qipt1hYyt1nWIYFZg89XNKe5BFVdR1OCg1uZ2z4fNCBcf7fr8GY+cuprey1V?=
 =?us-ascii?Q?kQIDb79/6BDwfrK8DinN/i5liUNO8WfMQQpt9bXQ1DnbclWNQ76GI3k4q64Q?=
 =?us-ascii?Q?TzFLSY++EeSZZm7vng7uJp4bjxePIXT8CwrqPcC/u/Y9uSbr+iLiuj2zwBrS?=
 =?us-ascii?Q?lnhRK6uRuErmoZg1ee+7K3EwUXFwQLOmXMy6ISuTy99ldh46BLXZ6nMsFo96?=
 =?us-ascii?Q?DGHBFgvYvowIJ6FgpYBYjC9MOXSkXyC2E+7HUNef6xAX1cljBxnP05I81s3v?=
 =?us-ascii?Q?hTBPx2yWiVlAom148E9j9XhtPGmHQMNZy1ORJoFkm8xDKlzdH16pfytTuG0F?=
 =?us-ascii?Q?2M+HqTBnouTEXMP7cpHERPqcmkyT0/wWFaSjkIcIowjPKG/Js5rhgwc4zDld?=
 =?us-ascii?Q?VL51WgoTv4C3h9z/m1FjN39fYBqWFcE25rpZx4NRFLMJzRnjS9TiV02j3BxM?=
 =?us-ascii?Q?c0XiUB5r0rnzd6bhQkfvcr8QMKOv9eZFNpx+M+ssPlcEiP8tgGJm4dpUZJkZ?=
 =?us-ascii?Q?kKi7Sgkp3pkKE3Ar132qVKETJ3EkL4iIdMCInh/bEQwvviEvacux25ty8Knr?=
 =?us-ascii?Q?CpAjTp8YKsDBCQWB9I31aUzTEQV1IhPgzpvRqXzG+XUxanr1Pw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7P192MB0330.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(10070799003)(366016)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z30GA8ZuHFUVC1D0roEFIjp4ADg13XaUIZfFOaVFgbj+C0vIQAACAk6IgN6v?=
 =?us-ascii?Q?32dpHg/LX1dXR10h1LJXpVbNhfx9vwVhAyRJem7u5QMqW+q09YqCqXqznnwa?=
 =?us-ascii?Q?KpzE32YEUFPNew0tfe+cucoZKipXfQ1oEq9g6nZOogVwhFabKGoADNm8CctX?=
 =?us-ascii?Q?5W3M3I6mDHCUfoPk9mzrCXsBB7v2HNIqOmn15/S2JSOywh/beYnM2k6yGEuz?=
 =?us-ascii?Q?enIoWaZWmd4WdIiDgJ+/J+4fyjTQsLJRvqjL/bg/DLsg/TTRsIVq5XMyd5WM?=
 =?us-ascii?Q?b/XCHNVRR4Ro9QBxILPazrdIGLK+dgZzXlRcDX41wVZv4GigBcpMoJqbIn63?=
 =?us-ascii?Q?TymAog6ZVSMYJc+snegUIdCIZf2bF1aYIKL2h7a7T6q808Qz92Yx47rpgwms?=
 =?us-ascii?Q?Z103s4n3M4TxPJO0ZrPIETIdGUt65e0WS4hLvX8CKjT639qRexJaL2KF57dK?=
 =?us-ascii?Q?YCC8DxBJGMwIzdheC9mOr6ktn9BWCoFOyhEh2Dwi4FWtO4GBsDbjq+tkWSLl?=
 =?us-ascii?Q?wIBKIFwocaBVS9t9hR0R2KbzxDF0EKQ4AaBpAqRMBda/cFOi07DZcdGLNN34?=
 =?us-ascii?Q?A+W3M5RCRgPjHJx15fyTiVWKbkvzuSTrrbOyFGhgJkDKZwG8OYZOv5bGkrXT?=
 =?us-ascii?Q?dODf7TtGaMTNQe7KZau23x41KGw7YIv+H7Fbs8BdL4xg501754kV+7/Y/BGe?=
 =?us-ascii?Q?cGuO3KXvPwkTBMPSBTUKZ2dzCzktzc0QSTKKMQBCajT6Vae90PCcIGFvQ249?=
 =?us-ascii?Q?XowOV8SbMDNSDGmANIDO7pzbKvYGdbb0nHC1IevQfnW8Lqf7UAGZmb/xboKt?=
 =?us-ascii?Q?kWV4M04GnczunzKC8CAFImPFNLv4R3oHY2/uv0nWUdakX1Uzu3m0xIVUChCp?=
 =?us-ascii?Q?O90X9CtIIrhhKrUJrP/5EbqkJDob7YuXd5Enk7l+C6v9O7wN43Bun/R1iIAJ?=
 =?us-ascii?Q?rm2PZKqJrx6pNQSk09Yn+Kt57UGVzr2bCRVF5njBhXPEKmx6kEUdZP6d+Ls6?=
 =?us-ascii?Q?M7vD2hkcuNFX0Loh3zIk7PsQWM5So/TLMPjFcpgewDoUtqW6HfpSZPoao24W?=
 =?us-ascii?Q?Gy+Qs0c41FbVlVFqkV51+PLj9KG0XvBpWCf4hizeNwxf05dYPE+8/0DNtOHl?=
 =?us-ascii?Q?zwHU43LxFHzKeBRV4zOiKacrKnKn+j4IYVOmfvN8SpK0QpwM2NAOjOy7aXQs?=
 =?us-ascii?Q?mqBVMlteB9CONsFZ6ir0YvcV6RPbsMo0FDqZmzeh4MzHCvGdeaMk77s04ETo?=
 =?us-ascii?Q?UtEu5Ns7lYulsVHsHDOYWnP5+mpDVTx0KMU8R2udqhAP5So8Pqd7rrChIKpk?=
 =?us-ascii?Q?b2NwVrAOIOu1ni0D1mqWVtjsm6b6hHpMe7/xwKBF2sHuur0FDqfArqvpNIPv?=
 =?us-ascii?Q?jlwSPMSS4/6kdB99UgOSAUgzQkPhzYPlxUs9AeeD/k5gFg5uhRINhoiAKhYZ?=
 =?us-ascii?Q?1AZzUfPgYgm2QdIduFHiWtLEeRlmkJf/+2jXJTj/X/98uJ2BTiXT042+g6uf?=
 =?us-ascii?Q?X2oF866pdQUa1OJEXbtGgv2lzD7Nh1qG6OEfbSr/kbbf1Cw/eG/a+MzeIRK5?=
 =?us-ascii?Q?bZWb7GU0jUlQCuTLmOCMR1y/peDwtBum1HFIPGdp7glgkbZIC+BotjNrcNlv?=
 =?us-ascii?Q?8NSPjGCnbQR8m1mdvmVp5FjXmIL/34GPsZlEZvg6SGyt43NNZhTS61w7Jsod?=
 =?us-ascii?Q?rTd54g=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c494d9ff-d00c-4be2-a6cf-08de2396f1fe
X-MS-Exchange-CrossTenant-AuthSource: DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:00:34.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYJDwwniffJn9tem45EKaluH5eOAZWG80Ldh46BmXrou184WY8svkMhmYhzIM/UytdtjqVNtfg1OWk9vHhbkzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226299

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick commit used in debian patch https://git.launchpad.net/ubuntu/+source/s=
qlite3/commit/?id=3D9a309a50fa99e3b69623894bfd7d1f84d9fab33c
Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/192d0ff8=
ccf0bf55776a5930cdc64e25f87299d6]

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../sqlite/sqlite3/CVE-2025-7709.patch        | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch b/meta=
/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch
new file mode 100644
index 0000000000..820262881f
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch
@@ -0,0 +1,33 @@
+From a7ed2fcba8ef1df4bcd846d895469ca72542be07 Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+Date: Fri, 14 Nov 2025 15:31:17 +0100
+Subject: [PATCH] Optimize allocation of large tombstone arrays in fts5.
+
+FossilOrigin-Name: 0fcc3cbdfa21adf97aed01fa76991cccf9380e2755b0182a9e2c94e=
3c8fb38d7
+
+CVE: CVE-2025-7709
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/192d0ff=
8ccf0bf55776a5930cdc64e25f87299d6]
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ sqlite3.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1ee8de4..43f59e2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -240724,9 +240724,9 @@ static void fts5SegIterSetNext(Fts5Index *p, Fts=
5SegIter *pIter){
+ ** leave an error in the Fts5Index object.
+ */
+ static void fts5SegIterAllocTombstone(Fts5Index *p, Fts5SegIter *pIter){
+-  const int nTomb =3D pIter->pSeg->nPgTombstone;
++  const i64 nTomb =3D (i64)pIter->pSeg->nPgTombstone;
+   if( nTomb>0 ){
+-    int nByte =3D nTomb * sizeof(Fts5Data*) + sizeof(Fts5TombstoneArray);
++    i64 nByte =3D nTomb * sizeof(Fts5Data*) + sizeof(Fts5TombstoneArray);
+     Fts5TombstoneArray *pNew;
+     pNew =3D (Fts5TombstoneArray*)sqlite3Fts5MallocZero(&p->rc, nByte);
+     if( pNew ){
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
index 60a8f1449b..05bfaac1af 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -7,6 +7,7 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-${S=
QLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-7709.patch \
           "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"
=20
--=20
2.43.0


