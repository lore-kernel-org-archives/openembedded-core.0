Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC139FCD0AE
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:16:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.118])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7433.1773811011485053902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=hHWnAWv1;
 spf=pass (domain: navimatix.de, ip: 40.107.159.118, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwbilhxcfYePMq+MOQzOgtP5yt3xwFG/CbgilCjDzgC1vQSXoTPYvOpomukt9rJK+wPtfMwrKpsyrK66Uajm6lXBH+yGKw4Bd27iya9fFNhCGwfcUM0pZjNo8K+CRR84Q8kliHhw3hrhYdwyIWwRtXy6nCi2LlK50pHHYSPQimfA4pft8hZHg61oIx54AJ3mwwgEkN/rLVrj9y4Ant2b1pEpgdvWBEEgLKQkkeIPyuDvEm7YRvV9vC5LbyXrbZJNJ5KvQ3NoS9nlXWhkv/x2W60pzixcrOIU/H4cckKucZUoGG6GbjQzJgUnUnQcJCtVN561LamD5oADqr8IA6BENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKV90+D7rhyd0FfcxFCf23cVznFrbT0upyIbYlLv6EQ=;
 b=SqTFUFKSF74BhHTNPQ609s8M8cC82d0Lnl5a70g7OPQgx+kuZMGSK2RaMfREdSvCUXu1DjdaO9wMapV5WyLCWylS1K1NFsXGNdbHeFniON+Rm8VjGYMS4N8sOX/uWv7theHOmtpnGnKbST2yFxylIX8QY67rqoX1P6TIU85IBmjipQfiNh+OUnuJbeTu+UG+gOaQ/ruWub3omZTlZLsQ9y11SYL5qZC5luLn9aE9IpdUjLyWLs5tdvf7oL5yvZv20dVN0M9KEFJwIFG7/VVtgcNqcV/2WG2d9uGQ+58d2XJV5xXUu3Ph+xdg+g9NYo5lOi+vZCLYkdVhcgBNLci41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKV90+D7rhyd0FfcxFCf23cVznFrbT0upyIbYlLv6EQ=;
 b=hHWnAWv1g0BCqrF7EvMAWWXhl9LqNPksxVHUqeEtVtq4N/I3kT1f8WnJqZUTx0L53EufFuqMWDuRqmedzMBoBkjGTpNceKFpwYUuFgrc1lA6cqoR1q+yvt5zx3RwYLhYVckJjkeMHg9liQu1+8i50F80+wpVmPY2Lr+TfBvZqmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB10247.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:47e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 05:16:46 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Wed, 18 Mar 2026 05:16:46 +0000
Date: Wed, 18 Mar 2026 06:16:44 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] systemd: Populate udev-bash-completion before bash-completion
Message-ID: <de1882c9707fc37289f2dce772fb2df0cde60e43.1773810932.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: ea46847c-27de-4b74-9901-08de84ad8ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gElE5VUl0sNZi6TrjIizE5NUQkzDcLvHD1BPnmfDmkRIAZKRlUbaHJ64Q+358zEqtPptiXkWg+5X6ub2Ntc6ztdB/D66cGNQIVn4ruZtsVEDtqH0W5+8NIxqMMPX7ywqJvI7xPSWhrmu5WThQtWJ+Z8L8wCHHt0lCiCtr0n6g+0KGVNjfGkfKbG6puekpx3dsSePJscZpLQ01nyAzq9Pq6xNbGsLACeWfitTQvL40iWpylWe2lXYaNKoAkdHZs6FKZIA7PVUaGAo8n6RHBUHzUrZvbT6VgxpyS4zlOiavrrPoR637LlHt9hntrDxIX+z5igLAwEbtuvugD/pYW+wyP+7+fPJyqk5RuUZxe9qxx8r+PL3FbIOA+IOsY+I4xLGcUt0+ULZtU1sfIKr5K+FcA2f4PGoTQqg834U8RCVjOCBsYO7ccJkeAhudrpMuvUERmjGEJszER3klvUj/o3zhz6IZ/8L/4kJOnmXtxTyjRwjFjvHR93o6NR1nZtRiG6MOUiboGcepBS1czNeH6slkkjz3JrONTmFY9SEqxxi1rRBgoipimNR311bmXiaRR2/M1ESAoqThg7IDzcoLu02/pF4TXUFpwcsECGW3cqPKLvyMgV06diWVmiiJlq3dC51l5kB4fhKkGm0S/ayHK9LrKKhMQqlgY0d4JiJ7+K0QR02JdAEVKz/k43tG5Ymp1u4XA9KTxI8kHNKT9zvfnVFOuL3C9u60Fi+2CGrmqXMVA0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fHUiEiprfpv/gQlPXTSaXdHRu3naHsEqRhXwM0tH0UUKAnVbFRHdQ6LZ2JD/?=
 =?us-ascii?Q?CSjKWP32kHWrpSLmBkP/gbJOQDh0Yg5kjk584+abzAya/MaDlBtN619F0u4F?=
 =?us-ascii?Q?R+pQLHtOU6rfBeaojJs/5rkmCKACq3QoTY19jh+b67bJOn2u4ERvaOkXCJaU?=
 =?us-ascii?Q?Bwgp5WFBTExbfu+hrkZKAv6RBcVWM4NSeMOHjzZTJMBcGQu4RaIHwj0yxtjw?=
 =?us-ascii?Q?l2iSsdmtaIFerLbVGmB9eb+roiXowDWNkvImP2aeIics1ZNuQsrPyeUHRezs?=
 =?us-ascii?Q?trm5EWE8E42vdmZciaNa9fEKNY6CTAfhfrsVpnNzq57wYaEMmzAol6r5aMZP?=
 =?us-ascii?Q?d9fqwgadWNSsMfbWlAIwf2B0jE9WoxdUj/6q7QsDxiBVUYw6khLlS4hbQzFl?=
 =?us-ascii?Q?fgJCE8uorHUzXZ+QFwxAh1pyZanE5RY9rVV1z6+Kmzq/k65/wACqr8miArH9?=
 =?us-ascii?Q?a2pkqbtisay8mwi3NOwVz4geJ0i3pY56qKAXscEIm7ytLbObkv1BeydaXGVq?=
 =?us-ascii?Q?HhrVP0oqdYwWUNG6jPGrfipoztyZk89IYmn17xiS/3dLXbIqzd6bIssq60Ar?=
 =?us-ascii?Q?qe4VGwIdSSGjOlcwEtAEHrk26ikp4M/BJSOzAgiFX2A9XOR5HjZ2CIQReZx6?=
 =?us-ascii?Q?f5qMpuWWhx4Vsh+iBTH3hDPIBlOv5VAWdb/qgiRagIn9GbiNO1tsKEMwGiK9?=
 =?us-ascii?Q?0vvL6F1c1oFlQK+OIona+wncgCq8Ac37D304R69OXEX/g6v0F1tHUiOHFKHY?=
 =?us-ascii?Q?WX7K1NaihDnmwo3O/oeLoFBnn2uCQ+XEOHIKg79dcWxUYMnfopMp68ts8M64?=
 =?us-ascii?Q?OZ06Yd6PbIlRRmW52hOYHguvfl0MhFQCeXGOlHmkgum94t1kT7fe1QgvpKxb?=
 =?us-ascii?Q?Jvhe8dvieMj70uKFm0wuPpONRYPceYKIpMMExVOQi0bxwwUCS0tU0HZlotLj?=
 =?us-ascii?Q?oOyYaQuNgcWopc1QXqu5s+zhLCeIGwXRSy0WbA7/EtBoANE/2n0q20ck4GJR?=
 =?us-ascii?Q?Ly0tFubaJTIyRT0bh1hV4XtoyCM464AmUJgtatKupwHuTCDkwAiJgfpO37px?=
 =?us-ascii?Q?qimwwclulhO+7+NF6V123BAqSjLc3t2xjymgnEFU+f5RB8wYmgIa7OCht3R4?=
 =?us-ascii?Q?gURL7mhXmQIBhpL8eSN2xHM3tNlOdsG908rDZrrLs7U709Msr+ElEsnCCloI?=
 =?us-ascii?Q?yr0Vk61rtzKimQMVh8qF3CcQXu4JRW6UuSXUVcGRZzGXmXse8uUJYQINboiH?=
 =?us-ascii?Q?yauzdYug8O6polTNMFMuY7fPJmdAIHvos1Y9p+ZQsHxdWDxoOppXPLveEzEn?=
 =?us-ascii?Q?d9PjyBevZ5NBW4lwZiPkRUPhwcyfftbVSCmcKaFkjLiE/Uw/ucqETljSrjww?=
 =?us-ascii?Q?jcjHjRBkTFq0p4jZSY8mJpgMVDWEjNiKHH19MQX55/rC5WPMYhY0+NfepK/6?=
 =?us-ascii?Q?6t58kYbviIzUAgtZbWD2Q704e1iwtbrYoBcb0ODxypGxiGqlzhBaVfimw+kH?=
 =?us-ascii?Q?VrpDhKoYO4SF+wpyrsUM5q6HmoMx1aKVR6HSjwUft57K/Otd3+3Jw7mEf/b9?=
 =?us-ascii?Q?tjNaR7lZzDweTsKVkO2mpcBXhJYw4d6/w8+lD8kxVf0orbm+1bvtMEYpUJTq?=
 =?us-ascii?Q?rHisNybMMchFsLhrZ3ZvgA2MQiSHSPPzsFTuUhMrOb6RI8y8TbL+y+V/Qy2N?=
 =?us-ascii?Q?EFO+GlWbcdJ87LhmA+mEh0VZlRNaZwFXmFOgWECsD4muYqi4/K7L20Ck7sLD?=
 =?us-ascii?Q?cS4wvl2/yV46gGTlVfsNKv9ZXesoWDk=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea46847c-27de-4b74-9901-08de84ad8ccb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 05:16:46.1569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgEmwalVj8mTKrfLRQ63WlH1iHWfeuMtc4OStf3V6h7fjcctsPD7/ig0LC2JT1ypeZbfpfmdMWmF+vtCWU1+LoJSo2m8OPO/mjgDz0Zlob4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB10247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233357

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The `inherit bash-completion` places its package at the front of
PACKAGE_BEFORE_PN. So this picks up the udevadm file before
udev-bash-completion is populated. Therefore, u-b-c has to go to the front
of PACKAGE_BEFORE_PN.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---

An alternative solution would be to use PACKAGE_BEFORE_PN:append in bash-co=
mpletion.bbclass.

 meta/recipes-core/systemd/systemd_259.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core=
/systemd/systemd_259.3.bb
index bcb8fe3d9c..4663753476 100644
--- a/meta/recipes-core/systemd/systemd_259.3.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -387,10 +387,14 @@ PACKAGE_BEFORE_PN +=3D "\
     ${PN}-zsh-completion \
     libsystemd-shared \
     udev \
-    udev-bash-completion \
     udev-hwdb \
 "
=20
+# pick the files before bash-completion.bbclass
+PACKAGE_BEFORE_PN =3D+ "\
+    udev-bash-completion \
+"
+
 SUMMARY:${PN}-container =3D "Tools for containers and VMs"
 DESCRIPTION:${PN}-container =3D "Systemd tools to spawn and manage contain=
ers and virtual machines."
=20
--=20
2.53.0


