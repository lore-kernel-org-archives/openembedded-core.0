Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBE6CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15258.1762154838863992680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=vFWFJTdV;
 spf=pass (domain: navimatix.de, ip: 40.107.130.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMOUkmDGou7ohC+u4WB2vMQat2x2eWL3Xs1hCY4EUTTtizpcOjVnHkDhrL1JIYT2RlCN3oaN/BlRKNtG2J6Un5DDYPcw5I71g6b9lPWSNGZcsb2Z3qKzSfHgyVLjc3xKsPmCSH636pHMH56EnPDvsf6lkG7dba6anGzmsZ1fs+satO4l5e9C9sHA4xOEUbU95Xm2ubF/6MmmEyF+BEQMF0dmXvCG+GLUTTpkilLF/MbjNRs8rjnYzkU8w/SNotTBWuQjow1xQkniv68YRSyVXwAxhKD9kZgRNH3eRcuupIVtcEM/oy1blTyTE7XnqqB2OWt754Sxpy9uLO/BaeDS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqByspPBcgNGT1VLPFB091QS1vrN2svBjCabTkQidp0=;
 b=PYVYL2joDs9wqvx6IIguALD2E5QCwPiAHUae+XL4HHxPZIhcGRnVViXXIXR2mWYWdU9SP9f8+cV+A0avbDjluH4WbDjOFaAWHDEj6q5dX7TZ9PaDqxhfsNDenvQAgdGz8vyNlYnIjYQjxo30BBfj+Aap8DbfI7aQfZxKl6Wlt3Jc+p+eoWF7UZRlx0MMNWHGgKSRXo3yxq4GkIphcgVw3UvUTMJZB52LXaHlS4p7ub/GKJ1CJ68ctu0046a3KyBBOmFn5fAfJ4qJDZ1EgTDelLVqF1DDMllEbs75gANnsGpWPsfEup82rwhJn2heQcHG+aUjUNtZG95KytoYlwEPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqByspPBcgNGT1VLPFB091QS1vrN2svBjCabTkQidp0=;
 b=vFWFJTdVtSorBnhaBuqKv1jzwWIfpNXIiUxKmyvGSw/347gWdzG+4iZUJEMRG3TyrTmOaWuZTufa0oQmAJMMbRzPm9vkY47oB+62rUqOqaLUn7sp/qNF6/eiMn6yv+nm9FT/K3A1NaVOWnRAM13JS2l8ljjlsExgQPkk6ZFvVJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:17 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:17 +0000
Date: Mon, 3 Nov 2025 08:27:16 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 14/18] gobject-introspection: Upgrade 1.84.0 -> 1.86.0
Message-ID: <7f7f1809e84ede70be60a2addf13ee22c618b8b4.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR4P281CA0397.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 237dd969-a7ac-4fb8-1d93-08de1aaa6b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V48Mfiyf3WMYnRKKu6ksvHJH5fwC6jI1ItChlKQkbEv1yU+ST98jFwN+fWad?=
 =?us-ascii?Q?zK8yM8PzluFWnQIqFn6+bCexN8caf+HHoZsY0lFsNlNskYVc74Nojy4KFtsO?=
 =?us-ascii?Q?zEmsUBuPru2Js2C96HFd3QnppJvH660cmARJANoD3+h4MH6KgWf+6eSmaye8?=
 =?us-ascii?Q?ed6DzHmZN/b01yBOnKlEw5sxjjdB4rHAqxBkJjpf83QGV7dxYfoMdA5mM+XC?=
 =?us-ascii?Q?lB9l1088Qo5XPDFPij2V0HEpG0HgSoCdJtFwVamYxdNhjJK2LGJoUKr+JSdf?=
 =?us-ascii?Q?W+B+eQqaYZThHL4chuzwL1V91OKM/6aL8vDdfObp1Sbuh5vcT9ZF1XiRdLjD?=
 =?us-ascii?Q?OD6q/5Mm6Zh50iFYlL129d0m6bHCpolEv4wykQ/h+8WSSYn/eWDU+BG5ndkG?=
 =?us-ascii?Q?N2dqGRazTLwCfwZKIZI45IoE1SJs7oiAKdEQlfO6R/5HPECaXTv8H+1bPp55?=
 =?us-ascii?Q?FebWYlKAQBq0OeceoRWA33fQ28fKVV6pIVEtsO68nodmXNO7RzY4NSd/KJzt?=
 =?us-ascii?Q?d/istdkXg/HLMKbO17RzPRLVoFuMIbtR4GtbCorNiFFyfN6qL7cJHEkai2E5?=
 =?us-ascii?Q?vj13EcOX+yg9IH80/XxmJTyvWCd04NlX7TIvOD+KP9Frm0a4VAxD7R9nWHdz?=
 =?us-ascii?Q?cqUyOGXLxYJZGRzmSbRUCVo30qf+514HvjNzWqRYTdXYKkkGRnDHg3stFN2j?=
 =?us-ascii?Q?tHB/KdLU+QXh4UT5G1yhMgglL6UWLncd+vHMNER2kRMZBKRxPgTiwhXEyYew?=
 =?us-ascii?Q?iMVa7hsM/K/X8kEdmkW9EuWn8x/UUmzlR37yOIV1JocUDe4fQ1y7vdOZcHbR?=
 =?us-ascii?Q?hayw2IrjrDRg4/iEu0CiPriYJ5gHppxiMQMi79p02yGt0sNsJXtxLP26gp4p?=
 =?us-ascii?Q?we69qXfUl8qupYrz2MlraPUq8JtJJenoTH4oTEYxrJVldbVENOMfNyZJox/s?=
 =?us-ascii?Q?ikoJXRMrtazvSzLVpcB52ynWcLS+zQmoKfxvqOJf7Cm/wPB1o584OtKWc01C?=
 =?us-ascii?Q?z7CEAWPhNBVL29DRo27U/sWHDRLyRlO6bkqHnQv+07BKv5uN+KWcVVBLMtlM?=
 =?us-ascii?Q?7hHlapdq+Sr7j8MEBDDapR0n0jO7NOzJ8LQe6ZC7tKKZR0Lke9VZNM7pSg1T?=
 =?us-ascii?Q?Ojv/DnLC6MlBGkkIGTWEWdf473WVp5S9//DkCxJ1Vwt5L0X735sM+MCFqyyA?=
 =?us-ascii?Q?ZhXLBlZUiaxv78ng07B5ufTfr45lRjkIw3ix2FdWiIGDmae0zq3novS47YjL?=
 =?us-ascii?Q?4LHkmXy0lzR8SQO9sTS7cJcypQ5Wmhgyptt2jN307m1l68qvK6GM+5nqqKj8?=
 =?us-ascii?Q?VM+7VeAdltQzuaKOphK7lrPGR5MonBThY23BoIfaUPtEvR1XcS/JYaJ4GGra?=
 =?us-ascii?Q?+KMrAUZpyJUFhUJFekdkH4K7ipWan0HBIyRpcwM3mKOJq0UiNTO5UWI1wQ85?=
 =?us-ascii?Q?tTVBP07L/Nw+ME83eKHV5zklXhYM/AfY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pprPOR2Hu4QYpcOAbFK9VzXx3lm4WgPvUFYDcflDTSgd9cjUuO66LR9qpdSc?=
 =?us-ascii?Q?zor2h8TBSuLkhg9apjVyTqe4qpOVuQrvs1qNCnTmMF4ckxdSD3kosns4fl5F?=
 =?us-ascii?Q?CeNdO3LTt9TmmTKBBZHWwJbTYNKvkKaqS+lsjypgT2Vsbro6qIDn/4OJRLVr?=
 =?us-ascii?Q?RjvqnWCS/hjr0nQ+yRoHDyUCb1mJBE2LXpN3C+VA2A7W3eSmVfZzf/vLdHW6?=
 =?us-ascii?Q?YX7kYuPz9u2JcolwxVsWfJTez6kIGLKWq27V92qWDQfB57Et2h1B4pVnTH5g?=
 =?us-ascii?Q?ouVWUUi5zoFu04zB3D+Kz3F0Tl7yd6MoLuJ7NJHXSmVsD9A9g+BdfO/+9hHR?=
 =?us-ascii?Q?6tKzVkYhy/WvZwqwRPuFsUs/1rZLqkODEC9/ix7eNW7cM8NppBIVHrdjzY+G?=
 =?us-ascii?Q?54X4e2Xe1QdyredfU76WNJWHgQuBdHwWOAztTbS8eLePgRONJeF5iPZ4rY4T?=
 =?us-ascii?Q?2xmwrxfTso5EdFUnsAiaaAMoXI/824PZhB8+rA5BeVzAzWKUBmmoFBbYMs2E?=
 =?us-ascii?Q?9+h5cCSYKrShNYE3P4mAKS2+vIFb52YsgYZ7asVkcN12N+1CkoW3quwCJYeu?=
 =?us-ascii?Q?7BH4rne5uByDsFO2VALgUvt177+IXPGqkuKmxwDaQNhfNG4eGWkrTIg6Jwpp?=
 =?us-ascii?Q?6XnWEZnR9bTatRUHSkkIkBD/VB3rtw0iocJJowQ+yDbJYKcVO/Yucr7YTa4R?=
 =?us-ascii?Q?KdhdSJ20oY2tKe+T/xnww3F01dtgB3Fn0GC+kDQUhlESpNTtIvpztWvgyOEd?=
 =?us-ascii?Q?CyZ/WAR6btKqyMEpGptm0UYck6VBwDeP9AqsjxeLyl4CkagVx86lO3tH1hUV?=
 =?us-ascii?Q?cxMnjOP66mNV5I0WW5gMXOaHMVvez3aFlPBI36XQ0z4Y1mrPALoveI2g3Ndj?=
 =?us-ascii?Q?DvF+x47hbVc+8jvLfZmKgECY/bs97vBfnBlLfmUMKnFmZ7teE4J2ZqlDaM6W?=
 =?us-ascii?Q?SdkfuytJ8399mlLLIgy4OoswQjj4Tp/0L2i2R5af9LaRrSP434kImmFeQnf0?=
 =?us-ascii?Q?4vBmpKz1XP4Rm+rLH2CvxL0bLAQNdS+P52VywalxkI4F/Z4tQSw+artL5Sjv?=
 =?us-ascii?Q?V6VHr34bnAmW1+BCj8jyzbUPvvjLJSv51PiUXYM+R6OQuQHrU7KwCO5tt/DB?=
 =?us-ascii?Q?snabRCNeq4gGYdLMwXgab3W/OGhUi6cEzm5LwIi19T1dV6MRaKicuYOlujyK?=
 =?us-ascii?Q?nnYwrNtVJ220reWQ/sxoedNp4JVjTvpXvXh/c7l9eSBLJZjARHHozUzcyDfj?=
 =?us-ascii?Q?yeWCYCwvxE5TUaIvt/YykWl71PrEtPfbtmJUytBP4scWA46nB4j8GYhPMoi+?=
 =?us-ascii?Q?eJrxZ8IwIc69cS0OsT3qs8DyAexGBegnTeN1dZCfuWH84uPSQ9hz9cr8rBH2?=
 =?us-ascii?Q?4tOf7PTCnyQ7uYA9iByvsxMbRXc4WL/lHDJEJWyTBBVyNGop4my9/TXIDXlb?=
 =?us-ascii?Q?iSWfZVnih9sVKo4vFxq/Kiv75SzZi6L4Wo2ceiljU3IGdrh3ZyYpI2NXpnhG?=
 =?us-ascii?Q?FzZxCTEKVaGO0ypivkYPOfq6y+5JRWeUGT8EpL51UhC5LYqof0V+lzhMfAex?=
 =?us-ascii?Q?jLSyEIoaNiliAoKxfWhtIS5TgKb1MUI/hF3U/m22g71RWPUa/nqtSs93sSdW?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 237dd969-a7ac-4fb8-1d93-08de1aaa6b0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:17.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMlvwTn3Bdglv6tPShYgbJMXIqPijg7KIkPNGV+rUHJAbsf6cvmMAKpgTMSOEhghqgCY0ylHsmUhuGblE2sqSIyfj/BfOy8lZxAWowl7aLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225605

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

1.86.0 - 2025-09-13
-------------------
- giscanner: Added ability to add wrapper script arguments [!530]
- g-ir-tools: Support reading @rspfiles for arguments [!532]
- Update gobject-introspection-tests [!536]
- giscanner: support alignof expressions [!538]
- dumper: Fix introspection binaries missing rpaths for uninstalled ELF shl=
ibs [!540]
- meson: Fix fs.copyfile semantics breaking GIR build with Ninja 1.12+ [!53=
4]
- giscanner: Deduplicate arguments and use response files for MSVC [!535]
- scanner: Prefer some getters over others [!473]
- girepository: Initialize the async functions parameters [!544]

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...-introspection_1.84.0.bb =3D> gobject-introspection_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.8=
4.0.bb =3D> gobject-introspection_1.86.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.86.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_=
1.84.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.=
86.0.bb
index dfdb1eaa03..f8eab2797f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0=
.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0=
.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68be=
dd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=3D2=
1;md5=3D661847611ae6979465415f31a759ba27 \
                     "
=20
-SRC_URI[archive.sha256sum] =3D "945b57da7ec262e5c266b89e091d14be800cc42427=
7d82a02872b7d794a84779"
+SRC_URI[archive.sha256sum] =3D "920d1a3fcedeadc32acff95c2e203b319039dd4b4a=
08dd1a2dfd283d19c0b9ae"
=20
 SRC_URI:append:class-native =3D " file://0001-Relocate-the-repository-dire=
ctory-for-native-builds.patch"
=20
--=20
2.51.0


