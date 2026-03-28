Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2993910D1484
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:13:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.129])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18979.1774732390694335789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=jPrZHqbO;
 spf=pass (domain: navimatix.de, ip: 40.107.130.129, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt0Ihx7IfBbqFe1q7myQ3skoOjrSi0/54GqMJBWh1JSXvl0gQGe7YL50/BHTVcNmtZjihfT6Lua+do3KGhfRIB2aoMofgHzW/jARkq763d9i0NrAAvbfzyBrbKWt/e+rDTS4mu1zvKXWNqbVZreNFbkVv9kd87M5ZodU46Eug3AMXhjeu4fSeJKbr+rOs8+lWFJhTWNbc8aXBs+QXTEMrBMD4A3b14pG0jWr4F5ev5gOBTMH5yadIgFOgB5BvlKN0RVvpubly4h12+BHrvyFOgjaZQ0KBjluio/3mWQduqSP3F1mf/b68VT1sMxDKammU8KEORielDSf4XFe+Zak+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awEbZVtxSHSHa4HotigH0+PsGRKfz08isBZgzZqLlwk=;
 b=FtWUqYQp9SkqYC9AWpXnq+Uyy9JBVap8j4uujhPM5nSqn8zP//n0/tkJ18sI0ghERr0bQDQypMVw8H3r2G8V1vpfotY9PY71VjWDhhMfx0qmibhJ8OnrjcUBZ55G8ozJGKXh/oLpmeTkmC0BpDCUod0sucaUS4uzIkLN49PAcaqpBYSLhJ3QB2JPUv5mxRzHL096l2A9qAo8393oLnB5tuSLydQcrgiKcVVDEZugA+rdF5zMqBtcJJsWN3mijX0ivQYwCfrJbI16uuOyOckWnrUPzA0yvBGDVBd2TZklDGZWnAB8aGbpwi3vAr6huJKoy746SL4JlFOWVsECGmiCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awEbZVtxSHSHa4HotigH0+PsGRKfz08isBZgzZqLlwk=;
 b=jPrZHqbOPuvDQbeQWSIuZNV+dKj6siM41Nd9RiH2Fe7ALiqX7VgS7JbxTOem+G8/4S87Fzla2bkNr7fNzR2hGWkxcGqJq3Rra1EwrCPe2fbIyUO6E177WnjDUUaYOhEkRmur7mlG/cBDDWVFjOZweFq8WObxAQ9g127b42aa9Tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU2PR01MB8751.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Sat, 28 Mar
 2026 21:13:06 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.023; Sat, 28 Mar 2026 21:13:06 +0000
Date: Sat, 28 Mar 2026 22:13:05 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] rpcbind: Remove IPv6 listener, if ipv6 not in DISTRO_FEATURES
Message-ID: <e9812d801976eeb3dfe0571f08f6366e1c17214a.1774732383.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU2PR01MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 96def35a-75e0-42f0-4292-08de8d0ece43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QWJXuSjZQ/svCIXyClPKbafY6j97b6QzFrLAq9Bt9i7ksZZT4okzSYFHmxnT05U+h64ewzWwr3AaAVysBR/rcCAjSAgB0xuhBcyOdMalsUwlCTcGmWvpuUuL/19dPWgTywi5NMhkMXlhE81xjChBe1IoXsNpyJk4gX0gSRVPgP6lEx2mdhzn4c2DFN/HYdT7R/OfjVzcso4C/cQbKCbAIeheoMQlVSJM7vog/g4HoC122FoCRsGgDf2TLq+numxFO+TLzgwVJSr6jL+IesliQlVkcCR8Gi8O3PiU7IV8524Vod51ZdiiOERQvaePqFkkbgdafh1oOaeRUu2RdJPpqo0BEvYLWZGSgVKboJJ6ia79z6JxzzhWtA9m2Y9iTW2NVmRNmpM9f3CjTJBoCFgyZbTa1v+OjXMLT6MJFTS3C2fR+uWefX0B6S5DqGypa+IW2r3Cptpz60aXaZdxNN1WfIkKXFUqS8AbVTHN3uTlCBDV3o6kS5ses4SYXDpgZ4lgLlyXLqMIohNKq3pVficQnAM88iQweIPFGR+o2Ck8JzyZVUePZP43UgM2raINhGjbkz/I6BKqp1yGhOVdLWxYhlAyHpinGEoIhic4HIVVuhRLTCYbQIGlPvBq5QuYHKWYE4h5m8cr+w00GnEKKRj4UkB1Uk7BsUBpIMcTT9s+X/ZvN4nadVJQ9gjotOBcBQcVEPBz54NeVBVaTWmFPMOukC824+xqEf7gB431/iQa+r8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I3+qSJv+3F1ycmDiJHy2Vk9xShSKtOjRLLHAYPS+VggM2+NJeR4LFIgXucqv?=
 =?us-ascii?Q?DvoiH5kYRlNWTpM9QNniEZaKc3Cq4Wc2IknEmtpqN9cqnudpFYJMUf/6v9ec?=
 =?us-ascii?Q?mX0Hxu3ox/BjXQkkWzGAhYrZkYxYcsirBmGT2GmBwoupe1xBm2hlucPBHAbQ?=
 =?us-ascii?Q?gI3yYIFmoHDbX7rqctjVTK9RMAlIpsRN9lckyxyw4BefxoZLxFHwFhwSKdnZ?=
 =?us-ascii?Q?pe+Xc1BqA9u8zrjnvEaV7JskpXtgffTVnU6eJZ677gMjynsHsVGrfthVTeDF?=
 =?us-ascii?Q?891iEmW9y6gTc/QniasllLnbmwZBPr3MHBYAkrTLtB8VhqjEFxZ9F2dajh4s?=
 =?us-ascii?Q?yxHgDlBmByuykfwpzWwajxeFxhfd7DBg4sPdxhX61DICw3z+G1Ar7/GOfplT?=
 =?us-ascii?Q?0d0mH2LuoHg5draVa2uaQOc64uY/lqU8Ii08V7KVI5nMT9uPE/RkzD26j8v1?=
 =?us-ascii?Q?+RsPbkd1vexftmA1p/INZBZ8/7Dl7fjbAs2rQmDny7YHh3paZsMCfCq393Wt?=
 =?us-ascii?Q?sXd1/Hx2VDL372r3PC8Gh5UMs/hSiPNsnfeFiBargUD3y422rE0dGiF+22P1?=
 =?us-ascii?Q?Ul0dPFsgh1/IojczxFzmPXK6MahWWV3Lzpf93kb1rW+sqYbODxPBjcK4zTK0?=
 =?us-ascii?Q?T7Yy/CKfIxr3EtmwxWRrYOnZE0go9qDPcuZEMm4pn4cQ+E6MmQXBEV11Umrs?=
 =?us-ascii?Q?dWhRXsBjYz2QT/vsLUj2osiMfU2XsOvuPBJeVXZans8oIMXwFfD1aLvERzWd?=
 =?us-ascii?Q?Qpm9vkBcsa0PO8TgObetuEpA2gaS4f+ui3Ez6UKvwjZArhTFp/+HMJFVn1lE?=
 =?us-ascii?Q?YKc3gus1C4IYCC3bjYQGhjFYHDMupXKspGoHQHVvkG9W7A3c7nre2+tUVUCo?=
 =?us-ascii?Q?1S51ZC7j448I225T8UAgtjYs+v/WByylCJrhsoPd0CoWH2Uk93lkiSbD3y1S?=
 =?us-ascii?Q?eSzfbkHeTk3jh4uUINUZGA2zTW4y45K9CEBv8MwtxsoyxYLpHneLrKUHUx6K?=
 =?us-ascii?Q?xpTyg4duK/j2baEjr5wA31b96jd41c2CwljQGTQaTxtZuCeXo5WHZ7ayJtAw?=
 =?us-ascii?Q?kR0umqGSWHXpUE5OeRcvYXlZXxqME4V3cyn7Y7pzIC2MR4m/v5GbRy7ScVhG?=
 =?us-ascii?Q?TFXtH7fuvEWBRuk10oceecvYXgJlHB0WTOv0iDBsEQB7dO1rofilwdW/uql+?=
 =?us-ascii?Q?DDhq2PTHswiB160BT2+x0UGOQyBgVprLtlT8utlZOqgfQ6D8yNJZeJ2vM6+X?=
 =?us-ascii?Q?6Gi0RzfFKTPM8NFWMru9VeTtjZihKY1xDqUhrU8Q9/g7WvEK5Uv6wp3Kz6TM?=
 =?us-ascii?Q?8O/BhMIGrjPYWWPmyOQHS7pqKG8RbeAB5hVVXzPmRG08Wfrw2khZ4HxyB2Ph?=
 =?us-ascii?Q?wBQ8tkANpHas0Kb0Ry8M2tQ531VlEQledV7I3/lK0ekloZqK9DORpX3FRAHF?=
 =?us-ascii?Q?ffYqFOz7JWPqBZomfevn1bXUYXsAy/niyoQw4D7wRsTJdrqDp6bgrtnxvKJU?=
 =?us-ascii?Q?3acWLV9H2y45YJP2U2iSThaTPeuZY5Psb7BpVR8WNBeOVMiqWRJfUlbqOmxL?=
 =?us-ascii?Q?voYKUPvCFp4wjga7ydlhdiRQL1DxdtoFIobQ6ySg8Jqneb7twLZXl9TghY/H?=
 =?us-ascii?Q?BAUSjKUHgBA9r50GiQcPuLEz0rJoZ/y1oyl5eshPbakn7Tm+Df+jv5h7Px/Q?=
 =?us-ascii?Q?KwSPdQcFxTKSbG3ZNVVHMddbLsrXPKdtd5jK9PpppDxIfT8sZ6l9xKk7bDoL?=
 =?us-ascii?Q?PmXxpPYU4NvvKYaidxgkCxmy9GaT9Ao=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 96def35a-75e0-42f0-4292-08de8d0ece43
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 21:13:06.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF03p41QCeLP3zcj4op4MaoqjVT96APpTS5cpcyJ1SAlwF7PZ3R4HvyGP6i8EDY+NJLYGS5ZHk3YU0RFr3RBFiveokQAjByFca51tTDj8JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 21:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234134

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Remove in all systemd socket files all Listen on IPv6 addresses, if IPv6 is
not available. Otherwise systemd warns about "Binding to IPv6 address not
available since kernel does not support IPv6."

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.8.bb
index bcdadf4f10..bd8ba1e88a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -54,6 +54,11 @@ do_install:append () {
=20
 	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
 	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_unitdir=
}/rpcbind.service.d/rpcbind.conf
+
+	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}
+	then
+		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_unitdir}/*.soc=
ket
+	fi
 }
=20
 FILES:${PN} +=3D "${systemd_system_unitdir}/rpcbind.service.d/rpcbind.conf=
"
--=20
2.53.0


