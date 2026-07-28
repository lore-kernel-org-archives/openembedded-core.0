Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896EEC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 12:19:09 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10149.1785241147986346944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 05:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=i6zkWvCZ;
 spf=pass (domain: navimatix.de, ip: 52.101.72.142, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqiqyGA4ZUPhXruj/vTEOOWBEA0oKwF/R9fNrIqRFad25WwO+rpofFYQVG25vVjfB6covacc4u4SsJ9GychvlM4XCCBKN6mX2uRmK5R56LSZeooTRbi5ZZXdcUK0Z9J1OToff00ZYt7gOzDyyivLq1OFhzWwRWWRUe0deZKJeabu9/EPNrIYmF0OuuVPh+j1KouCMSvMojaYwcMnOl7j37YhushnmxrPG9sp8LE3jASApqqjheE/rYHDJsMff4IndkokvoCm0EWTfxIbn1c5LKAVMWtlIxhsVkE0HvQF5IHs2pYblL5ii/ZhdzP/togTG+nZ5QRf5IDbjMMPzfZl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9tERxsYh10dhbr7Fn9wGutQqkljbm8jMkBsziUkSwY=;
 b=c91vGlUkmzDjBaBRkqXN/yoMZp8JVyrrgmXJ53lcz0dndP5UBTnAcaiyCvHmQtQidcA89yCu/+BSCJaBnzPtGEZKGQIPnvpFB4Mj/CjPjgDPnJpIprFttIzfc/ku7lUyb85kAZs1QmBFFSg+HIbEylrjftL2w/9RC5tGohMMY6W9c6rFSyLo7oxzeMqW1c17lycpliu3m5+kBLZS0n3F0xpTE0WQ0SQXutnATy8sy0SUEaQ4fCYrTsG0g3HmmcElIgoIAMjWGPPI9KL2Ube/ZtbkeEOCrEBRbMaRPZc6Zmxzs3BftJ1dCSrDH8ZJKqFfvEGxoRf0gesCNEB5edvgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9tERxsYh10dhbr7Fn9wGutQqkljbm8jMkBsziUkSwY=;
 b=i6zkWvCZkGV5vKtee9bDpSgX6n/8OhWK9VDOrzrSE7qO8HGIvg9ELpCgy8UgONxZSrKahJt/zORaW83tUkic9eGvLLnBzeNStRKEKppog2kVzIo1EMOcwrEjrG11WXEKtbWRhKGXOOs0U4+QsDTGFe6Z1UH86f71j1vCgPrT/vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV2PPF887CBA961.eurprd01.prod.exchangelabs.com
 (2603:10a6:158:401::59e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 12:18:58 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.012; Tue, 28 Jul 2026 12:18:58 +0000
Date: Tue, 28 Jul 2026 14:18:56 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joerg.sommer@navimatix.de
CC: mathieu.dubois-briand@bootlin.com, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] tcf-agent: Pass sbindir to make install to handle binmerge
Message-ID: <aa27e8cf3b1429ea16ce5e2a6b0ec16768e278c6.1785241135.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0455.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::27) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV2PPF887CBA961:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2da021-7a33-4f37-9b1d-08deeca266a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	v5azH1PX4RG68PoPM7Zwr/arZKSr3z91RnQERNavr2hFOyojR2SXTs1zMZVOw16G122Qi1nJn0MBZT6zhqJ930j0JewwDQJJ6lvy2CAhLDM3IN+pgmb19DwFMAG+NnwNzEetOaGdjLBUIpb3Pp5sHq1lrn4LOzl3YZser/a19/p9w5eOVcNXC2LbAIfNjtRyWS74Ja6a6B5gWcr+2GUUiFOl5PqA2IcnLBfnJ8QoZwHpq1yx0+hPlUly9hbnqJpGZ0j60ArXNqvdRiNKuvx6w9a2ORMSfNmcmn5kvrXA46nHrKBihn41lURph1CYOdiuQvq3+UNy8US7kF7d33mhMAhhxQR3lR9mPob5NHjotjsGEExdVz0oanTxT688XKXV9l1yvcQ23Hrk4mcBnw52rmlcOgQUq9pLgwkcuaaD6fOplX7H/knQnPF7lTbZVW+TXdcjDn9pSG1gBkT04ZCzJLK/E2tt/TR9u3R41Kox7Ohu+QHijY8fkrkLhwq/CRW3IRpWDCjQLkmBvAR8UJfGd87zIzqmQcD8MYM2tEMpDIowSVqoa3BhxV4R+k8G5oxirpgHsE4ntJBAG0VyQ4bUcxTOjUr6ukXrjGTyLedMoHZ3EjFW7gc+V3L3X4ifBtEGExSqLbF5iV5qQc39q6Plw9D9lMrBuH8kuuSLdqsAlAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lAeSBvvDFb7yvbc7e499+OJwDPDOOGI5Q9XgUZDWD+AJRTxZufCLXX5AQGYR?=
 =?us-ascii?Q?j5m/AjBm5iKGHccUf1XHz1/vMFWQKEIc1vYsYQvtxOGtOuLsaU+znCJrAG7d?=
 =?us-ascii?Q?L0ghVLyeEGoaBgoUR9pQzp8tfdZ7RCTrZ2vSAPzeXyUoXOaqhxaJ0EpWEdxL?=
 =?us-ascii?Q?Ood2yHQMHJ5cgDfX6rVzS0AfV+98e2gRvRqhNTOnLrAE7b5KMEBxBj7YgeV+?=
 =?us-ascii?Q?cazqyWNlAWWtCaFr9H3/A1ox/f0ITtBi9QHEiv+7O+cvjmcgbxuRChHVywtx?=
 =?us-ascii?Q?80akq+YI7uXwLCbFDFNo/4pgM42Q46aKGRoxLCiTg6IsVwZD08LLLzskU/UY?=
 =?us-ascii?Q?p7XWroNv/y2G6PTMeFP8CBepfkXrSojPUoXIOYSLbn7r/UXwQuTu52LYwehm?=
 =?us-ascii?Q?DtEuoPh6ue9HITeCMs6Jv5yGhgcxbJjJq5Ml14W1RlD/Qyu5S/PXxMPRAZq1?=
 =?us-ascii?Q?v0GccNKAbNpVUYWUReflxew4ZOpLBR2A1CefofV4hfqysAeP1+5vB9PBFacK?=
 =?us-ascii?Q?t4zRBvOP8XDh19P8RzvvfIu+tdM76jHSCpioDrvh3DjXl1Y1UiWuYA+BLrHx?=
 =?us-ascii?Q?WU6HVyiiPObn9Ah9tcbAKecRce89wjOs/yaAUMWZzRE8d4yphb9iZHigbVOs?=
 =?us-ascii?Q?8v7vRvIP4Ztrld1SktpQbccyAVrZkqEiRqjoyf9oVo792bPyt3I3kF55b68n?=
 =?us-ascii?Q?FfcBqsb7W1UvvxEvaaootFGJrbH96spyKIVuGXqKYuYP751gpah5kWKF5wSw?=
 =?us-ascii?Q?UbK4Tmxu0AUqn7/p5JrQ22CycTuv+fAZU1xedC9kBb2jmpP/Nqs+kVj4BXor?=
 =?us-ascii?Q?JV+bBqiosV273pKDE3ePBcBL9VmJlKhjET6EVz0GLNsL5JMsQ1p1Y2AsPpsc?=
 =?us-ascii?Q?rzIjkZhsftKT6/O0CR9ppFTWm/SggOiVPV44e+kkSSSN+bvQQBzu24+OcBHp?=
 =?us-ascii?Q?q2k4ACKdczVCwe9/VvZWQ8wrZreF2JBv1d9I5ZhoCbriA9bQ3Esw2vO2srTj?=
 =?us-ascii?Q?zrdiiXZGn10xV3AB9dSBk+bbaja/k+2hVKpAbe1icjZGjeR4ogFFDwl+dWiv?=
 =?us-ascii?Q?bulmbljVEDC/uZPeuFj+s+P2yk+2Oynw+OAaY2Apkl3uj59Bcg61dCF0ZueU?=
 =?us-ascii?Q?AL4dwBYqRc+mwjOkGUQhLcdk2Z3E5qKOLTSLlDoL78d/v5Vbjvsv28NX9316?=
 =?us-ascii?Q?Ni4Xu0d66O27HQGTUYpt28U8NbH2mKkyiDjerhh8T7akEw08NGcHlI+Q8psc?=
 =?us-ascii?Q?e2XYeaPqh6kGNZUbrCEqXjxNQbmlTDx81a7zpDnlARoi5OiArg4j5QgUwjiC?=
 =?us-ascii?Q?xz29mmFoSOyQa7iUZKMac3R3vbVwuU+EPwApu1wZr1NuBmOHOAiLorLj5Zw9?=
 =?us-ascii?Q?tUUfHNtahK4mm8WN9U+Wra0fL7WvV5fJqYLTgqOCfiH7RozYfP1xjEBGxB71?=
 =?us-ascii?Q?5sIFg2FpxBcW/Z4psWHZaD3F+UNlwKKURsON/7VLYPiOafunm142g3bY2Kl/?=
 =?us-ascii?Q?MQviEEVXKPNr52QBajft2Q5bQwf9Fhs08bZuPywUp7a5Gg/sN+pOE7EqcVTG?=
 =?us-ascii?Q?4OoL7LidPRtMTg3kpU6ZXQZL4eh/cAojUOrV6uhOs9QfpS1OGF74wLVr3vTN?=
 =?us-ascii?Q?wDkGd7f5SjcwgXOZhEomo6WtIKsQGsYSS2fjI62fAgS4ImvoFgZ/h8V6JyBo?=
 =?us-ascii?Q?Si0zOdS4H+RJ+jg/fCjQ0curlgQBFoQgiyUGZ4B3gr9QRSNjEijAvvTfEhkM?=
 =?us-ascii?Q?vspjWet2ZGZ3U2hmRLi2WV/JNcn09Ik=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2da021-7a33-4f37-9b1d-08deeca266a1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:18:58.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtLBBqFHuUaMKRMFvxL7bJheawzpX+c6/nMUHln+i8O+OX8inwZiTAkajwpAO6qy41iSwjYU1ju+fiUcQyyTUZeQZRKnJ76zxafnlep40ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF887CBA961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 12:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242188

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

$sbindir is not /usr/sbin but $bindir with binmerge.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb b/meta/rec=
ipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
index b04c7aea06..01e4b7df49 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
@@ -56,7 +56,7 @@ CFLAGS:append:loongarch64 =3D " ${LCL_STOP_SERVICES}"
 RANLIB:append =3D " $@"
=20
 do_install() {
-	oe_runmake install INSTALLROOT=3D${D}
+	oe_runmake install INSTALLROOT=3D${D} SBIN=3D${sbindir}
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${UNPACKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-=
agent
 	install -d ${D}${systemd_system_unitdir}
--=20
2.53.0


