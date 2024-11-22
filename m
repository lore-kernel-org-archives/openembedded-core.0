Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85325D75E5A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 14:39:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.90])
 by mx.groups.io with SMTP id smtpd.web11.25941.1732286373840914753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 06:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=cg9ipYkc;
 spf=pass (domain: navimatix.de, ip: 40.107.21.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4NwHMy+Bq366xnkl23cdVPpsSMc27kD0NOtTAWGaM38EPpcNLEFJjMXQmn0g8W0wXXg652qMFlbjzXu1D8rIRH9kiHJaa0aaGYVHiiNT9EXV+aMyKxToqrvDCNxrj2fM4cECnbin5kpsh6CQSKNYIrIAoJHkmk/UNu0fUVwraxk2Et0zSViGo/VwnxC4UPlUO0IykN+1cDN1X8WdwXGsNZfaIyZcM554mXMSNIT1qRwuvgOSrg/mYYzi51VTWzsMKVG/tm3PUHw+z9Q6FieQiZkuG1vsS8w51iHnE5LSQsT7DhTEknZirdMBediEfakxFbDfDZ76X8j6tJBqZ5RVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJVoXVvnBmScdWQnJmgXHTW/9GIYxkA4Nug/reZKmTg=;
 b=qMjSIs5TSQLRc1ZFxGWS3RtJ2OPkPwsu7Xy6iRKCNkD1H+Jtl/y88LDAMq658MvaipntNthcJI+HFdTulqBQYCOGc34kvYSfGFgI6dpRTl+hYNYslcGCofMpSWb6DIV2V0jvkUYZww/szPAf+IYSOlPqxcRDI8XLy0s8A/KmCWHzQRUeshU3d8IhxJdu/9DG9dA8f6OQsT0paD2e1N/MT3VQTjIawWhpyMMLL7d7PgnEr/oWLHw8qOA1fH8VWBJJZIcDREz2A3O6idKFc7Ebw3Q2yvot4fwnaU3GFItsKE7+EHD8A0K/WqEgxs3+brw3fT2zAYdQtWYa0319YyBkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJVoXVvnBmScdWQnJmgXHTW/9GIYxkA4Nug/reZKmTg=;
 b=cg9ipYkc30jlShJuPm3YSb1kO8n+gBQP3BFIMXrVJwswBLUEGfECYojtgzV76qLaHhbIEvFSVtK1Nj2EMzMz42Xow+xiJYL+WSFvmFLEeQPPBpKbk3bV3TbtpZPYttPyDKXcFZnBGJsVsYozFHPoaF1jWCXquv33G88fDycW1X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU5PR01MB10556.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:524::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 14:39:29 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 14:39:29 +0000
Date: Fri, 22 Nov 2024 15:39:27 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] python3-ctypes: depend on ldconfig only if distro-feature set
Message-ID: <11ada3e2ff22324b5da965bb2ca1fcae017a8463.1732286366.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0405.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::14) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU5PR01MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cdf910-f261-48d1-ca31-08dd0b037849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Q9jopmM9pafDQWyoqpSzhUzxpwBcZiyFNwVJI/SB7Vrb0hf8YwrkMwQgCYm?=
 =?us-ascii?Q?hYvvQy33t1MBHjIwTpC9Hcay23L+GDMzTBKbvh5MyL5Oc/LXN1nY6a0KOY1Y?=
 =?us-ascii?Q?zqLqPrgz5hLXWFxLH4ygwgnHVS1gMRhNloObh1Zwz+DNulSBYQVPHFqXLKTb?=
 =?us-ascii?Q?IGZZFd56z6ODgRJRK7SkrtUXN7XHAsBQrEDs+4DVmCYpSumRGpq3IFivtg+c?=
 =?us-ascii?Q?3DAPJ6IDfdFxsbLn+18wdC5KfZj47rB7GBUVpfpWdRHf9frMa1b7WKcDXdeF?=
 =?us-ascii?Q?S1raV9m3cOvvaUfGCCNxGk57HNWva0YDy9v82tHSgjfYGEyBH0bW3P54b/8Y?=
 =?us-ascii?Q?Oei20O4/x/v/PBjiU+swOHQnEB3o9JC02m6qHF1SpSfXBs7ymiUOlIyvv1Ga?=
 =?us-ascii?Q?o6tjDb4Jx8teTNWY0qYpqeziRQQgGuYOuSg8Rbi1P0JaxEPLT4tpne2cPLMq?=
 =?us-ascii?Q?i5hB8S4Uf8i8y6LFzE2sRhTP8Xl3IxvAc/aSHL6uLptevTDeD4kS7VHNff9Q?=
 =?us-ascii?Q?MS0YJ8NnDWCar38hGq2iSZb9BGsZGFxhuYV4DRhkhcFhqXyDpIAELYiM2pkj?=
 =?us-ascii?Q?0Fd29Rjksh5dlwIJ8B7MWVbfaE++4BjxPFH/bqu+CdTuBOTadKxatQpyxbT/?=
 =?us-ascii?Q?cuNBrjIEakpqdQrYURbYFpXiyO5x5o9ViMg9PfFr0QB9r3jx3Yxw1Gj9JYrU?=
 =?us-ascii?Q?3byXBfeZAecY8XOIIM+rprlZqOq3BipVCKJKQ6g6LH2/IARC5EPelC1sJZ9r?=
 =?us-ascii?Q?R+o83q6Mpgqa2vi5OWKMPk4e9ugXfWkF1Cbl8/41pbhoykNsA5BqTZJn+ICR?=
 =?us-ascii?Q?ZC6uBeHwd2e0QhaiYHgDRnEYCMYV77R4kifxCuwVsmIrCJ3hlRWk8efTUrTA?=
 =?us-ascii?Q?z+QWn2eoVC+selfH4zNhSrv2+xZ4wp4JglGLZ7aVpee4N2A2Q4EAbCn/8C+7?=
 =?us-ascii?Q?ptBZdikkbKy5bpOWzzBkIMCFA3hfqvz8VyOfgl9+oJ3nDdEQuDDcy6w2S+ur?=
 =?us-ascii?Q?AQcdx8pKa4SRmPGTBgDgbJH7eH8vCkqggeKEH0RZZOytoLaX0cj3SeEq1WSY?=
 =?us-ascii?Q?44Omov6WgZ1/ejvhr2xnCFDp8VUthZyJxFvc5eZJpjh/zZKu3MoPVu0dS5Ps?=
 =?us-ascii?Q?nUQYiz0tQFdMYyoPs4n3BNwHuS2U8nzaglJMujtky1kCYpc9BCYcs8JZ2XUT?=
 =?us-ascii?Q?SVrgrJQKQ7b/+sisORv/m8QRryxZB6CfSRIWGImDwENMcP04cvkw6j+NwcJZ?=
 =?us-ascii?Q?pw7StAGc+5Y8sy/ftk1s?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?goF14HqlxTRT2QOBPEdhzupym56WB+li1wL5/s7H1wNfdrCJZtgqSlD9pVWF?=
 =?us-ascii?Q?rNCCjhPHxL1R/MVG+nk0ppcwIrb1qrUNoIOw/vcuT162kL8qhxElNdIE675n?=
 =?us-ascii?Q?dLQHe0q+RFrgMfLb72JTLtyownjaVjCZk1R3NQjQMXiEsBrthancp7Aiybxv?=
 =?us-ascii?Q?YleDX+xg1aNsGTVPWTkLwa14luYnBemyHsKjwUfZgv9CK97sXvDQFsbdd47T?=
 =?us-ascii?Q?5Rm+L0wfmaLmdsKH9UwdEEqoRQXh3kQpsrARxmCAAQTOtKUTrYrLfVeWKHBt?=
 =?us-ascii?Q?y0f+Logp3Uhh6tDE5voIPHQCOWVsQp5pbMkKSoWnYWMCCN7lxKV1ekuCrtnF?=
 =?us-ascii?Q?JrtMtJe/TP0B514n8L0CNxeCtzbJcrBouGqAvlGZp2fobMogbECyWrznQ/ld?=
 =?us-ascii?Q?1xBsXxc7vankMdOqvs7beTvjKnflUFksCQbqYhb6DnfGQacagC/pMsbi537P?=
 =?us-ascii?Q?KBuRUfnoBZwoItGt7dQYYhGoRejwOiDTH8rv3QVsCyb1o+9G/ewMrdeIh1QB?=
 =?us-ascii?Q?tVL/180lWT3ljE7yK/ZM4VbmoMs795sIAW6ujpEYHefhXFaeRCngGWaPwkJO?=
 =?us-ascii?Q?IyB8CRi/NiMQwcNumaDCoaORqjSIIfYGnFgepn6tGvIvUFDIIrkpU8yt15rK?=
 =?us-ascii?Q?N6q5Ahj5YPjwYUXO4mQquFRT74WecWhjhZvL7IZtlTkuEBQ1ms1pZwXbBCDq?=
 =?us-ascii?Q?n6hydgjdGp+3TFiJNmg4evfatcD3Efqz3V4gyGwndfe8SIMBNPfwmzV+OzpM?=
 =?us-ascii?Q?38Npp8RYll/h8bEUMbrG1XKEiFdy6auVZgBOn6gzXLavMVeTFcEPBoPpj9d9?=
 =?us-ascii?Q?jYfik3U/7pykQvStXwPRDJLGyModg2na9APPEpTdlgMo/izmuEh34/LQwKNn?=
 =?us-ascii?Q?7RRWQnAjr4q0pRLxm6wFXCIW7E+5ssXYEbUMjzGeUHXZIAW+EnaYc54UCwrM?=
 =?us-ascii?Q?m9JhpY8yc1efpZAxyH4GSLYFzRsaef3goOsse5aNKexm7YeE4Fs+DSJT6odI?=
 =?us-ascii?Q?FbXgvfLi1jLeAg5udgNs5MNArXBb9qKoi2an8yNuU13hXHwQ7wlUgnhdxu1F?=
 =?us-ascii?Q?5iqjCoT45Q69TfZWRLI6KZfioPfpGVdwHMXamkMWK/nCFWhefTiCz73ISQvR?=
 =?us-ascii?Q?eL8zKbwntMPGAjUNLYuuGc0GS8vPHD0JHeMrEhw/y+oRiiWZ8uCjjDeDWISp?=
 =?us-ascii?Q?+eOTp9F1KYxyBflV8NmoWubcmh6J+02ylkxF/O34Kp2e/Yr1dtkCSJWoJuQk?=
 =?us-ascii?Q?jXYryIzOHe16v/Jn9z5xDpiDPEs+WwpBMAP+VcrMltz+aFfkNYg5iS0azkKz?=
 =?us-ascii?Q?XD8l3xMYwuIqMROjpM5ASU0/8ohB5qZju0jYueJtKMpvb1BPPoCbBfT50JG+?=
 =?us-ascii?Q?paeAC57adnbmLoUQcAPhQUdwQVhP36wqC6722SAZCbNVUyc7kSSDdY307zC7?=
 =?us-ascii?Q?PYbGlfENTFcBUQsqc4Itj/VDQWSEBUjk+xrHQCX6cjBS+4+XtFHLppM89+XU?=
 =?us-ascii?Q?8JuklKg3OHs0iLQtBMHe7aSu/3f3V05COfPPd9ulaGtFquoA/jXhZmrXe37b?=
 =?us-ascii?Q?OXSpUXh6g2moYu4shBXDc7Fk/Mth4rCoQhSOacSXxvZELuFOfPcR2qnRHaV7?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cdf910-f261-48d1-ca31-08dd0b037849
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:39:28.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ9IItZTs6YDsF4lGiYT75ZLRDHtVo2M6o7Pamt7ZLdl64lmF9845CZz6unNp3QU0A+VKVWOHKBTYqQicu+wkpyuhw/LELy+2jaOCTFbWl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR01MB10556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 14:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207622

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

In the source code is only usage of ldconfig (for Linux) in
Lib/ctypes/util.py:301. This is wrapped in try-execpt which causes
_findSoname_ldconfig return Nothing. This is handled properly in
find_library and other methods to find the library a tried.

So, the code can handle the case of a missing /sbin/ldconfig (BTW:
hard-coded path). When DISTRO_FEATURES does not contain ldconfig some other
services (Systemd) to setup and maintain the ldconfig.cache are not
installed. Hence, this ldconfig pulled in by the ctype dependency is of no
use.

Therefore, do not set the dependency on ldconfig, if the distro-feature is
not set.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-=
devtools/python/python3_3.13.0.bb
index 54742f5257..8db5b81373 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -461,7 +461,9 @@ FILES:${PN}-man =3D "${datadir}/man"
=20
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue=
37395
 RDEPENDS:libpython3:append:libc-glibc =3D " libgcc"
-RDEPENDS:${PN}-ctypes:append:libc-glibc =3D " ${MLPREFIX}ldconfig"
+RDEPENDS:${PN}-ctypes:append:libc-glibc =3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconf=
ig', '', d)} \
+"
 RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipapp=
 unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
                         locale-base-fr-fr locale-base-en-us locale-base-de=
-de"
 RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-tr-tr"
--=20
2.45.2


