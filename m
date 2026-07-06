Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8DFC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:00:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155941.1783357193339076282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=iybUr724;
 spf=pass (domain: navimatix.de, ip: 52.101.69.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5Fnperr6L89pMd5V4drNda8nAYDt+jPsnlkqhR1/Tv2eB4Y9iCqnBALr6x57Bcrcqz9Kvp2pV2dH//oFZDXVPI27rx1MZa1ws8NkQ4zLOrYYQ5Z7NTpK4/Htrm8fhivuspV7WQHOqVuDQi4YwuxI2LTlES1w8e9ABk+rNelOCNGPNIv/pPN3bukr1jnigPYfo4w4+oQ11CEZ9uWsOWH85dMc4Cf4BK9F2rbkE8CiPFUxhYh9SP1kQV/IinPVBxCh2rBMnqaYwLQFTT+i9cM0wrCDBWyLxbMqJF1UynxS4DI0NE0TMOSePvMyjFQT1Ic7w5VG+I5n7a/9HrgSlzxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzyE1yhVR5t/H9fSP3H3vpyL3NGqCfrs2f8aSnq1L5Y=;
 b=FUORZqHf37bpGbT9Gwb2a2eTrm+IrMqZOS6FFZ7hXP7Y4dvFbMx18O+nx/5aMne7z9sidlRe3u03Jy35NtWX+mbD97GiPwMy4b5WPO1dlDK58xhOKeT6WBUTca2Lx6pmLdFIBTMptaaUR+rNxw14T0GLkPydnUBLQLgssFQgyph7MgQq0o7lZ7nUOnkUVDo51+bi83GCp1n/cmTijdgY0lB4m40zKdbcfGFFCbCDAOyuL1yXvl3w+wtdp5MFvLonPGqrIf1u1KiEWIHflLZNKUQcUkEYiut4+YB8JnXUe/3d15IY4LQHY5V9INLHEvLGGV9q462KFgmBZXdfKhD4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzyE1yhVR5t/H9fSP3H3vpyL3NGqCfrs2f8aSnq1L5Y=;
 b=iybUr724/PntdXiyDctjE8Sq0miUU6P1nZpdMtD7wVvgYkA3122r/8vIADuYVlg3sJT6si1AoQ5D6oNB6A3DB9Xsca3gxY2Agj5IFQONVqrevyepsshKs3SUBx/b536bU5lkQQd0a5N8kOdVmKqStEZnb5QDk6aGv+Ei/uEdjbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11651.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:719::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 16:59:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Mon, 6 Jul 2026 16:59:49 +0000
Date: Mon, 6 Jul 2026 18:59:48 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/4] systemd: Simplify code to handle resolv.conf with
 resolved
Message-ID: <fa22f8137bed27504223bc3ee58a2f88eec502dc.1783357184.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0292.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 289a9600-0f98-445f-9e47-08dedb7ffd85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HuArV13e/5JHrE75XSuK6CTKiXzi7RzkfKDaH4pvn1TZod25991PGh1WfKiNh7X2El8zOqkNzS7CJTcKGe8FSTZ3ubZp5bXqWjD47all8LMH84xJsv6dzGUqr0pau4XCuOuhJTyIOSLmeUuyZsLkFq6H4lrO66jmVrB/Kcd5yQikFe2ZLjN0hXMzqvsftNBoQs6eFf06bQm4Y801F4zUIJ6Zcz82ZwlLjNslgdeBx1WzLQa7bBLrS3d3ZwrNiS1x+vUJ+I233LtSqnQ+ZIee6TYGJnWR/oaQSSC/VuCl2guXLNL4fISqEGWBkYdAvpW/i9RmZgaGhIf8Lr1GeTmg1PuCyGhyUbpZ0TBE7X6BCQfU7YycKpBCPr1Nzo3nPXqY2xJhQ2ukDFrSI3TlalICz2CD4yezJ6aQzme3trowN6jGxxNXXbZ6hIMis3x8dWoDHOC0eBu6jgsZWefESt+5hrV4PZrpbFsEw/hWvuKRhyfy8eZNAYBt2NXc/cNVSKwzUmS2HgSuNdAjSb/fJSDiSCuZ18jatMaosdJGu5p5lnya+m1gSnGXc6aG7oxJ4BjwFHZfxwgcAhce9NEHc8cdKSJoCBm6GsV8k4U76v+0MPWuI8laNITcFfOlitkw45VL93S4LtzYoDOH4U16vFWlWeIvqh5AjMDBxlVK5ksWSvU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zn40uWlyEINiL3due/lexPPBqaBLtY5dT0gj1Ua0tCKD7HAdBvXH+fiOhzTg?=
 =?us-ascii?Q?TPOMLRwDR8JrFHDLg3KVGZaS95nuHwan55EoFnW/EWP8LFRDpdWdvfFKiUtU?=
 =?us-ascii?Q?+AmvnecFiJCZKpVk/TdjF/BVhrYkmIhikgswR06Vcd2YC3ifsbQpo9BWPC0W?=
 =?us-ascii?Q?jvgy+3gHofRsYFxkvZWtQe5h+5oC0Ep6WZ6hwYeUtozxtluJ+KXXy0z3VogI?=
 =?us-ascii?Q?15J38jFt1YDfjGsT/qC984DJxyCvepfDZfCZw8e7xBb0OcmWZvZT9unXmGQd?=
 =?us-ascii?Q?pmVovSnQTVjGHy8/QzMqZqea7ICGrmWDNhq6OsJLYDT7yFeSBzsskO+P4sdE?=
 =?us-ascii?Q?Qlf6pfKi/F0Ol0Cl5VnlgXl5izYsQE00yjs/ON59D3YyjwWNPINNCD7LNwKK?=
 =?us-ascii?Q?vQZaqlB16RyioZxCa4F0IZh1ndPoOofumwgptLJMFLDWotNO/sl85xpMqpoM?=
 =?us-ascii?Q?QlhGCfKlYquGW0Xhzv+wqNPT/8kT3f/qyGXDM4Ck9Wa07Uw5VIt2fqSCERip?=
 =?us-ascii?Q?aSkiCxMrCzgq31PNFgoLoj46ba50itK2GKq0g9Jt78w6ttqkpKW8INBZweXw?=
 =?us-ascii?Q?SdaSUM8a3cuPCZbMg+zvmOJpWTlseQilKVUM2abkyOKA78VAah4R9LNSO/x9?=
 =?us-ascii?Q?ECiS11xXWDVrk7X2b3flUOnotCGqoNcmy0RN6pdMLlcg1u0H0UBEROJwDQPl?=
 =?us-ascii?Q?uj2lD+ukx0UMcp+VZkE6E+31bxhv4GW3Eh+xqZ3xEMuUvf6ptZXQcG75Ftgb?=
 =?us-ascii?Q?AyrZEquDIod+kPrATAQDsfT8AN4qrUTwAqHiEBIfPIdOc61IREGwOGYxg1o9?=
 =?us-ascii?Q?+ZbkxfAObLE2amaS0fANd6U33pk+EWtE6y+VDKngRdb5joICcHO1SIZIGhi7?=
 =?us-ascii?Q?ywOh7v6E5gkuhZ8IgLh/n6qUT+24X4N/WjXBxA16ZKMVKUb9GSw3jAybvIn6?=
 =?us-ascii?Q?0RYLOcm2jk5NHcWDBXM3+hduImtljvf9rpbRXoOBqIyNdWGBqDgGOJIp7oim?=
 =?us-ascii?Q?vijLFH5FdonvO1q5n1KrXr2pRMhmxTpbSU7m7INxM+68VUF2a0cqoPkpIaYf?=
 =?us-ascii?Q?hr+KO+5wf+6UPBhmGF9NccArUTexMIGj1ezlzjq31IES7dPxHrwNmBAzQ4qS?=
 =?us-ascii?Q?2HFhf/+A2fCXbVREPVDeMiV4y+L2EjG4MVvFt4yMEYC7x245GXohkHAELF9t?=
 =?us-ascii?Q?zhL4dqDncIQG90a99SJt5RllBCQM3CZPG5GZ59H7JJJj2/XIrHFaINwCuYV3?=
 =?us-ascii?Q?8Fdr7wDDXXQCGznEBF4f4kmfE1CotpYAZ1SHAGUCwIordGbDztqD/bYTyNoA?=
 =?us-ascii?Q?4zRK3MgDYW04izK9EI7779Wj6t9nogMQ9SHnRb9p4log0Qtls/XtMXtPaTcP?=
 =?us-ascii?Q?Ab5MYpWRqRi7dj8McT/82/4Lwlr8UeeP8OWlBsE7YrxJiVpELlQz+I48RJET?=
 =?us-ascii?Q?6WswlYpp4rP6c0lbBErdi8D1zJ9PHLKHOme8o/MI9M5962q5pAy9Q/T61++s?=
 =?us-ascii?Q?PQiQS6JBVst95g2vSUBxC4adp5HIzL7OFCBtlU+XmkQQ/SwC2K6XO8IGH2Ix?=
 =?us-ascii?Q?W2WUdiXegYRfzaJ05R9A17yIsroCeNiSmZfKJPBhFwzBWoLF8kUllqy+f6hn?=
 =?us-ascii?Q?iyPn8hXzpp8HmRWqo79AfxNdawqfUorivJdd3iGRGGsDCIUZeBDzrKi56A5v?=
 =?us-ascii?Q?+bkb7kT1UeLmjXE/czFmhD2y4bBnFRPg4nvaWGpfo+WxXxFKXGcMswW5/lyA?=
 =?us-ascii?Q?Y2MdNUpSZ65MXUZGHfSvajME9NKFszc=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 289a9600-0f98-445f-9e47-08dedb7ffd85
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:59:49.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ff79p/mtj20IkxCo0g/No84BgPjVN1OJf1Bu4p8GtM4X1d2+/w/P5CaBAQ0Opo5Oc6n8tkU4okStRrHINUYUsD+hD4XACTKK4rT3w50VANc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240282

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index f3ec0edae7..0fbfcaba42 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -330,9 +330,9 @@ do_install() {
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_pr=
efix}/lib/tmpfiles.d/systemd.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
 	else
-		resolv_conf=3D"${@bb.utils.contains('RESOLV_CONF', 'stub-resolv', 'run/s=
ystemd/resolve/stub-resolv.conf', 'run/systemd/resolve/resolv.conf', d)}"
-		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../${re=
solv_conf}%g" ${D}${exec_prefix}/lib/tmpfiles.d/systemd-resolve.conf
-		ln -s ../${resolv_conf} ${D}${sysconfdir}/resolv-conf.systemd
+		rc=3D"../run/systemd/resolve/${@bb.utils.contains('RESOLV_CONF', 'stub-r=
esolv', 'stub-', '', d)}resolv.conf"
+		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - $rc%" $=
{D}${exec_prefix}/lib/tmpfiles.d/systemd-resolve.conf
+		ln -s $rc ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; t=
hen
 		rm ${D}${exec_prefix}/lib/tmpfiles.d/x11.conf
--=20
2.53.0


