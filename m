Return-Path: <Tobias.Gassner.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D623C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:03:38 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.7168.1720508610720917710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=cAE00p3j;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: tobias.gassner.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4693ruEh022304
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jul 2024 07:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	S-DKIM-20210427; bh=MJua26jRB0fcLFccgnyXSYqEkptmOzbXorOlWSuR5PM=; b=
	cAE00p3jArQK1dfWbNKSQxslVC1nFVFZ2cgUOVhzdYp4KiVDxbEidaD8/fkgvtRd
	OzYLK9kFTAozuvwd3Y+9cto7fkjldheEk3suTPqi/tQqp5ugvWJ10T67WGlfXlr2
	2149fQaDeKTQVuE9vmK6Ijw6KTPftJkr6p/CWekw6IpgNFv8kNJuIJY/EYTe/O9d
	P9yNEb+hPO9yoA4mNLv5z8LfaP1GfPIDobqtDPcbpIQuVL/zzoSC3N91wzYUsrmZ
	Ddu95YPIIuYFYoGb3pK722Y1hT+RmFKF/Nz2A4OhWxQqpFL/6QV9OfzB9GNCStAn
	D9Rm2eg212Fl5vr+OapPqA==
Received: from eur03-am7-obe.outbound.protection.outlook.com (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 406wdcmkjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:03:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+FmNU0O0CCQU2/SO6jBKuWLhMcVfJxYD1Waat53XhOIGROUfR9MDgIMuOgx0Hdrm2m0H3SpjDHFhqkYomCECwRqzCZwvFoVp1Jmt3KDzomiHCCSCR3dhyEtv9VveDzMns26j/IcET/8BSD2qQSAlHfyXxlFfBBTgCAFAPqsmxjetUt5WsAZ9DdDDvQ9cPqB7iEEPc8P2pKhcad8WMsepTEGUbY8QbxUfpPdsOH2VXQtSU8h86Aqj7WVBTivtyb+lseA4EtnVxf3fdkfYnlG09bzGhOJod3EGu+aN58sTy+yJI40lXKkVJfTlBRsIhYYUQOhsAm5y8fDep5sdG7UqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJua26jRB0fcLFccgnyXSYqEkptmOzbXorOlWSuR5PM=;
 b=Q1aipdoGcX2ZCZvMtpNA+s2NaTZ1uZaKxL+zrcQhGm+9AtZ3XmuHmD4NNScALV5DFWIRQJwWJO0BcH6vclawApxAa8b7Z6Zi8RvfsunbF2BfplYyGkNS0XFRTqe6pQ/KC1kio2gPqixiBppoUh/C9WdfA2Idyk+NqANt19C/p6hER9N9BdIP9RWSVVre+GpFMOaBMRLEwmx9NO39OeaOg5fu2HW4OByAd6QzN7GtnEDSAK7wtk4FiUe6Vw4aUsHu2mOWPcjnvCTi1YK1Pbyhp1s5OA67TrCrpxVM8xC6msbr/ia1RKNrwHCLPe/NS/KCp2MtUKifOnQ/KQDiQs3A1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:27e::19) by PAXPR01MB9975.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 07:03:25 +0000
Received: from PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 ([fe80::25dd:b483:8f47:4413]) by PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 ([fe80::25dd:b483:8f47:4413%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 07:03:25 +0000
From: "Gassner, Tobias.ext" <Tobias.Gassner.ext@karlstorz.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs when
 read-only-rootfs-delayed-postinsts is set
Thread-Topic: [PATCH] execute pkg_postinst_ontarget task for read only rootfs
 when read-only-rootfs-delayed-postinsts is set
Thread-Index: AQHa0c3dSfYY3QbjekeMPqy5lAIJMw==
Date: Tue, 9 Jul 2024 07:03:25 +0000
Message-ID: 
 <PA4PR01MB935650793B965CC1A54FB63AD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR01MB9356:EE_|PAXPR01MB9975:EE_
x-ms-office365-filtering-correlation-id: 0a21511a-b26f-4f53-0820-08dc9fe53a85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?K2xai+5QYOF2VeKjz0ja4MtQJ/Z3WUMOYLZVoMd6vO1nmo3HAWpbHl/b/m?=
 =?iso-8859-1?Q?NUqngMdue0kiIoPl3fic8qtpm3DLynXtC8cZc5l46pvTms5AzgLsuOya5M?=
 =?iso-8859-1?Q?WbtC3009n1rOmHTZdt+4vJxoO25g09HZYkKTxDPVZnj+v+uyc7Nd1hjdWA?=
 =?iso-8859-1?Q?CyJcd3iNfQuxubjhxMkisS4EYereDMkfkr03jwQSenK/m1Bx6nxqwIWsUZ?=
 =?iso-8859-1?Q?DDM/TCu57gNVIee56MpZ6Bz+o1NODDJKCBUjWC61NTPYMbcZU8y/CdQoN3?=
 =?iso-8859-1?Q?70P94ai37dI0pvZCXeX7cFGvbqPd6btvMd/Rneu5YAH208LjXULim5gCd4?=
 =?iso-8859-1?Q?91pzXU9BuNu6BemPCvzalof+95oARtLSl84re0cX2y3CjifkqxreSp1RD7?=
 =?iso-8859-1?Q?QNSVNxs0eEVDBpxoJD0EKTaOZgbjfqDUhW3tlqxp+JS1MUSOR7cPdmxpNH?=
 =?iso-8859-1?Q?13+4F9hPYpK6w+/3ozFkh6pwShAuh1riQ/IwPjgabyhsPy4R0rsYnK1kmB?=
 =?iso-8859-1?Q?hJkLV3kySmC59jyS5GouF+xAgA9Zf7onoAoGJsvJ+v+yiQ91lqMIE5SiVl?=
 =?iso-8859-1?Q?WA4OQwINQY6zrsZL/F0QHJt/xrqpDsmtJ8rgT9QAjFMJEXaYXetpfjKMT9?=
 =?iso-8859-1?Q?FcY2HAJTTFDOCGF1Pu+946fcsW1YMJ5Ap6wqe8Z5sII2Bsxvl5DQ77CvDL?=
 =?iso-8859-1?Q?r0HPNBIi9EVjJ4BvAZ4Mj8XXOjdpRw/2KvF+1ydPuOcqJ0jip3GVkHnvbz?=
 =?iso-8859-1?Q?EjcugDJhyg92vlFSZ0X/XxAtPL0AfAaIlyPQp8wv/pTp03+4FTWSKVCPWZ?=
 =?iso-8859-1?Q?BHZonc3g7NwroUFmOI5jI9hz3VxprUvPrp+8cG9+JRvSE3RddtVnpK40xJ?=
 =?iso-8859-1?Q?a0/Wbu10W7n3WyfRXw+2HDYpVcbApEAiNg8MU+l1R+Kw0XDrICTOZQFcRs?=
 =?iso-8859-1?Q?ZeD5Yq8kXYunrUzTI7xFuLQj2jmlHgRB2u0xfOAnUXDTJlvda6wjtu2bC4?=
 =?iso-8859-1?Q?PB02xWdTB688/l+v3OuYXz545SpsB4R6zc6mXBXWrMDfiZqPLRUq4ieOqv?=
 =?iso-8859-1?Q?FcLyf6OX72fKJ3CshpEhMVKUBpAKZxXte83q5M6DtyrXXVBySWUXJFCXpv?=
 =?iso-8859-1?Q?VEkTxOjgNzhl744Cqm2LPHzSii/W6YdFYOOrZXGiuvupohoR/rR75fAXt1?=
 =?iso-8859-1?Q?GHlV6UpXdovx1oh2VLplcxZHvd5eMq+/OYopAK3PdKI19zJ2RRr4O9bR6R?=
 =?iso-8859-1?Q?LQJ9B67B6XFTniwB8NUPcC16E5bgk5JPYdGyD54mPY/yLxz2nD9Ausw65S?=
 =?iso-8859-1?Q?MKiIMGCsyMVT1L1IgI1TQFYUZflFfT8KenjPD7tt/j6TXcO3dJa2eVOsK8?=
 =?iso-8859-1?Q?PRZ9gIgMq+RjfZyJUj5mb99asrnfAnkz2ferdJCV3plrAtqxxgIGc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB9356.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0jB8OGT2ZJAsNwk6BAlQ6hhduz08OjCSrp3vLZaBr7thKl0OER7BZIsHEM?=
 =?iso-8859-1?Q?C5ds8yNIJbeIpprB226OSXl2YfPXQqKwhWDpTg0n6ssCYNpDLSRnWKFSyM?=
 =?iso-8859-1?Q?OiogsFPTsS4vZXgg8oYkAZ9WOOwjEsc9Nk2KAjnMuJlNRSEUzNMacrWNfl?=
 =?iso-8859-1?Q?cWZ1DxqiiDyeIwMmBElwq29R1BKtZNG+i/7SvLgiIXQOa+4/lK8KGKjSdt?=
 =?iso-8859-1?Q?JtrVxGFNSEGZA98iv5yFVZuMhrDu2B7CEjJUTgWieN+OlrpkMjdB+YyUyD?=
 =?iso-8859-1?Q?3ex66BN7XvnUc/CKNLNi/MrJJbFiNfkD+I1lScuXpW7i5aj031LOLIEXXT?=
 =?iso-8859-1?Q?KVHVWo8ejbGv0uKtEng7MBADk+g5/oXyYF3gGhmJsW/4XVxDITc8GWcdbl?=
 =?iso-8859-1?Q?iqG6Q9cjlcVw4zPL7jxb+8YlClXtTN3PF7jXvbTqOM2xWwLbxGKTsEM6rI?=
 =?iso-8859-1?Q?nUhQpOBSmM73FxPuPB30iuqGtZk8zWjvBGZDjMbd0GUKvqXq+9psEmzYK3?=
 =?iso-8859-1?Q?09z6O6xoR5WbfEnWeWNC96UNXxTk1TdK74clP6m+qbnzHvCjCUBhyrzmyC?=
 =?iso-8859-1?Q?j2LVjmame9wk7zE2/5RLeGto/r5N9JNDu91pWOtQowJ6EhXw7ZXxRzbKV4?=
 =?iso-8859-1?Q?j4xwDxWa74LAZfL/gvvPjg/ruQw1sSwGnw4RWkFL+g7aQJjBF9r9vrOG3E?=
 =?iso-8859-1?Q?+iihPMfyAr2OTVbxveYcAoBJDGzPQAhrQ0OQSIJYcgaSKCztTOr0GVzkYB?=
 =?iso-8859-1?Q?fq54DceNmbRrv5Z3WVKoh/uQCwCnBQ7XYUV68zU7Gbf5E9LSCJuoOmIyjl?=
 =?iso-8859-1?Q?HYiNbTYHbP3y/iR2db3khislH6z70sVvogog+jKI3J9OA0yL2/4DnHdqEK?=
 =?iso-8859-1?Q?QGWB71zim9kO5bUPfrhO8PDah4qA6UXZ85rBMBENvh1JqZhlMfughJe1nw?=
 =?iso-8859-1?Q?8xShsK6FWEvaUqFupxo1B/KlkVxatTVvZSgO4bGbvn3AdkrNuiO/owRVGe?=
 =?iso-8859-1?Q?lnQARS3gusZays64ThDHUO76lKXhpPf8Pt491LdV2uKDj+7DGNKSgERyJ6?=
 =?iso-8859-1?Q?4g900DLhCO2Oc7KdIX6G/HkUoKAPNbmNfeeWkP5TrWKzBacW5kWLb68epb?=
 =?iso-8859-1?Q?gheFAvBJMhaYjB3cBiZunvlryEITJnLTFmJJ4s0q3jDCN74xEZRY7kd5g4?=
 =?iso-8859-1?Q?vHiAZJhW96poyl36TGolL8h9CITGXdfl9k8slPY1ScQbIxkeEen3zAoduM?=
 =?iso-8859-1?Q?NTbntDlzYuKbjBrjkyTo8WydWeZllpq72toTuqIc2xpbVfw3BKAxOrIaTP?=
 =?iso-8859-1?Q?HcQ3SnvrQcVpWnnmXau8oRCisdpTtaOuLs91rCffvQrsmw291p93KrhcBu?=
 =?iso-8859-1?Q?yqXdJv0/qh8iW9k8inErCI9HZYUGI8nSPqDdPdv6fb4+9YGwEg3XANnrKK?=
 =?iso-8859-1?Q?eVXlNFKBNfTwcea21GCad9+tgtUQnUMgBZZi1N62tB0AuHQKytqohFFj2n?=
 =?iso-8859-1?Q?G5JPJO603cKF3wt+axARhqKMZqUVf7AuOJJMpIjf/LToC3T1e35iyXPsKs?=
 =?iso-8859-1?Q?qB/giNncTimH6BzP3P6/AaLGFqcaEZf/lhn30bZl0ROelSS0AZ+JNRi6Zj?=
 =?iso-8859-1?Q?CcwmhaaVaA/xstEHfU7gPYVLcmVWT74d+eysUGDDBurkeGsexV8UDLoxbI?=
 =?iso-8859-1?Q?M3qD91LPlg7QxFvDbVuT//93qLn7a0uxUhJRV2KIs3KW9u7PhcBNIbozUk?=
 =?iso-8859-1?Q?mUGA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR01MB935650793B965CC1A54FB63AD5DB2PA4PR01MB9356eurp_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB9356.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a21511a-b26f-4f53-0820-08dc9fe53a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 07:03:25.7341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qiWU2ZOP7Hj4lT6B7BFhUVw5Vo65AuhW2jAV68NH6tWvruBqEETbRIiyzNwxlOZA6RBkgPlzn2G2ZLmr6ZBA3LXwsMzzlcssNg2j30jyshF4H95g+4m3Kpvq2yjUg6QU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9975
X-Proofpoint-GUID: pVz5Dc6rTiH-6EEV-VoiBPUzb3DqSocO
X-Proofpoint-ORIG-GUID: pVz5Dc6rTiH-6EEV-VoiBPUzb3DqSocO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201643

--_000_PA4PR01MB935650793B965CC1A54FB63AD5DB2PA4PR01MB9356eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

this patch will ensure that pkg_postinst_ontarget task is executed for read=
 only rootfs when read-only-rootfs-delayed-postinsts is set as IMAGE_FEATUR=
ES. In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overlayf=
s.py testing the fix has been implemented.

See https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391 for the =
discussion of this patch; this patch consits of patches 608050984c5be67f506=
a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in that =
discussion.

Greetings
-Tobias


From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001
From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
Date: Tue, 9 Jul 2024 08:34:30 +0200
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs wh=
en
 read-only-rootfs-delayed-postinsts is set

Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
---
 meta/lib/oe/rootfs.py                     |  4 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..5abce4ad7d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -269,7 +269,11 @@ class Rootfs(object, metaclass=3DABCMeta):
                 self.pm.remove(["run-postinsts"])

         image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-roo=
tfs",
+                                        True, False, self.d) and \
+                      not bb.utils.contains("IMAGE_FEATURES",
+                                        "read-only-rootfs-delayed-postinst=
s",
                                         True, False, self.d)
+
         image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE')

         if image_rorfs or image_rorfs_force =3D=3D "1":
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py
index e31063567b..580fbdcb9c 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #

 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine

@@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D " overlayfs-user"
             line =3D getline_qemu(output, "Read-only file system")
             self.assertTrue(line, msg=3Doutput)

+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific current=
ly")
+    def test_postinst_on_target_for_read_only_rootfs(self):
+        """
+        Summary:  The purpose of this test case is to verify that post-ins=
tallation
+                  on target scripts are executed even if using read-only r=
ootfs when
+                  read-only-rootfs-delayed-postinsts is set
+        Expected: The test files are created on first boot
+        """
+
+        import oe.path
+
+        vars =3D get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-m=
inimal")
+        sysconfdir =3D vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        targettestdir =3D os.path.join(sysconfdir, "postinst-test")
+
+        config =3D self.get_working_config()
+
+        args =3D {
+            'OVERLAYFS_INIT_OPTION': "",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
+            'OVERLAYFS_ROOTFS_TYPE': "ext4",
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
+        }
+
+        # read-only-rootfs is already set in get_working_config()
+        config +=3D 'EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs-delayed-p=
ostinsts"\n'
+        config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D "postinst-delayed-b"\n'
+
+        self.write_config(config.format(**args))
+
+        res =3D bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype=3D'wic') as qemu:
+            for filename in ("rootfs", "delayed-a", "delayed-b"):
+                status, output =3D qemu.run_serial("test -f %s && echo fou=
nd" % os.path.join(targettestdir, filename))
+                self.assertIn("found", output, "%s was not present on boot=
" % filename)
+
     def get_working_config(self):
         return """
 # Use systemd as init manager
--
2.45.2




--_000_PA4PR01MB935650793B965CC1A54FB63AD5DB2PA4PR01MB9356eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
this patch will ensure that pkg_postinst_ontarget task is executed for read=
 only rootfs when&nbsp;read-only-rootfs-delayed-postinsts&nbsp;is set as IM=
AGE_FEATURES. In addition to the fix, a test in meta/lib/oeqa/selftest/case=
s/overlayfs.py testing the fix has been implemented.</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
See <a href=3D"https://lists.yoctoproject.org/g/poky/topic/106869018#msg133=
91" id=3D"OWA41ee8ac4-b1a6-2ca4-c0e5-84c94f841eab" class=3D"x_OWAAutoLink" =
rel=3D"noopener noreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0=
" style=3D"margin: 0px;">
https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391</a>&nbsp;for=
 the discussion of this patch; this patch consits of patches 608050984c5be6=
7f506a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in =
that discussion.</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Greetings</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
-Tobias</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
From: &quot;Gassner, Tobias.ext&quot; &lt;tobias.gassner.ext@karlstorz.com&=
gt;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
Date: Tue, 9 Jul 2024 08:34:30 +0200</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs wh=
en</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;read-only-rootfs-delayed-postinsts is set</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
Signed-off-by: Gassner, Tobias.ext &lt;tobias.gassner.ext@karlstorz.com&gt;=
</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
---</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;meta/lib/oe/rootfs.py &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; | &nbsp;4 +++</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++=
-</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;2 files changed, 44 insertions(+), 1 deletion(-)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
index 8cd48f9450..5abce4ad7d 100644</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
--- a/meta/lib/oe/rootfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+++ b/meta/lib/oe/rootfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
@@ -269,7 +269,11 @@&nbsp;class Rootfs(object, metaclass=3DABCMeta):</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.pm.remov=
e([&quot;run-postinsts&quot;])</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image_rorfs =3D bb.utils.contains(&quot;I=
MAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;True, Fal=
se, self.d) and \</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;not bb.utils.contains(&quot;IMAGE_FEATURES&quot;,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;rea=
d-only-rootfs-delayed-postinsts&quot;,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;True=
, False, self.d)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image_rorfs_force =3D self.d.getVar('FORC=
E_RO_REMOVE')</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if image_rorfs or image_rorfs_force =3D=
=3D &quot;1&quot;:</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
index e31063567b..580fbdcb9c 100644</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
@@ -5,7 +5,7 @@</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;#</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;from oeqa.selftest.case import OESelftestTestCase</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
-from oeqa.utils.commands import bitbake, runqemu</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;from oeqa.core.decorator import OETestTag</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;from oeqa.core.decorator.data import skipIfNotMachine</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
@@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D &quot; overlayfs-user&quot;</=
div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;line =3D getline_qemu(outpu=
t, &quot;Read-only file system&quot;)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(line, msg=
=3Doutput)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;@skipIfNotMachine(&quot;qemux86-64&quot;, &quot;tests are qe=
mux86-64 specific currently&quot;)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;def test_postinst_on_target_for_read_only_rootfs(self):</div=
>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;Summary: &nbsp;The purpose of this test case i=
s to verify that post-installation</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;on target s=
cripts are executed even if using read-only rootfs when</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read-only-r=
ootfs-delayed-postinsts is set</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;Expected: The test files are created on first =
boot</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;import oe.path</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;vars =3D get_bb_vars((&quot;IMAGE_ROOTFS&quot;=
, &quot;sysconfdir&quot;), &quot;core-image-minimal&quot;)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;sysconfdir =3D vars[&quot;sysconfdir&quot;]</d=
iv>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;self.assertIsNotNone(sysconfdir)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Need to use oe.path here as sysconfdir start=
s with /</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;targettestdir =3D os.path.join(sysconfdir, &qu=
ot;postinst-test&quot;)</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config =3D self.get_working_config()</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;args =3D {</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_INIT_OPTION': &quot;&=
quot;,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ETC_USE_ORIG_INIT_NAM=
E': 1,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ROOTFS_TYPE': &quot;e=
xt4&quot;,</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ETC_CREATE_MOUNT_DIRS=
': 1</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;# read-only-rootfs is already set in get_worki=
ng_config()</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config +=3D 'EXTRA_IMAGE_FEATURES +=3D &quot;r=
ead-only-rootfs-delayed-postinsts&quot;\n'</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D &quo=
t;postinst-delayed-b&quot;\n'</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;self.write_config(config.format(**args))</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;res =3D bitbake('core-image-minimal')</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;with runqemu('core-image-minimal', image_fstyp=
e=3D'wic') as qemu:</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for filename in (&quot;rootfs&qu=
ot;, &quot;delayed-a&quot;, &quot;delayed-b&quot;):</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;status, output =3D=
 qemu.run_serial(&quot;test -f %s &amp;&amp; echo found&quot; % os.path.joi=
n(targettestdir, filename))</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertIn(&quo=
t;found&quot;, output, &quot;%s was not present on boot&quot; % filename)</=
div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;def get_working_config(self):</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return &quot;&quot;&quot;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp;# Use systemd as init manager</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
--&nbsp;</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
2.45.2</div>
<div style=3D"margin: 0px; font-family: Consolas, Courier, monospace; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Consolas, Courier, monospace;"><br>
</span><br>
</div>
</body>
</html>

--_000_PA4PR01MB935650793B965CC1A54FB63AD5DB2PA4PR01MB9356eurp_--

