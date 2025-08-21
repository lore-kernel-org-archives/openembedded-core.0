Return-Path: <r.gruenert@pironex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2620FCA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 13:10:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.140])
 by mx.groups.io with SMTP id smtpd.web10.8998.1755781820117663061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 06:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pironexGmbH.onmicrosoft.com header.s=selector2-pironexGmbH-onmicrosoft-com header.b=lKQMFbZJ;
 spf=pass (domain: pironex.com, ip: 52.101.66.140, mailfrom: r.gruenert@pironex.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5CRchg4Zp2hIJ6uQnIONl7R8VcvXVlCmP1kUOdTS0bs4bgYizq7TyvismSZx111kIcauNhTF/YDgWcKfIfBky/KH1n1cvUuHKv9oP6T1hIkTRofXQzchru9BZ6iLgIknOH0Zf4QCCwcUGKL2oehjCgMMg/1wPK9hJmeRnNDu9EjKSVbvG82N29reT3bkb7ryC9RJJt/UUVl/LK5gJcrjC4R4grcm63jJuSaphtob8JOemGLJFELO5Q+9M0mUBcIeNURrdmV0H6rGasBKEegzY1fh0VuHVfkVScRAgacZZpXHPtQoT1mtrpUh8u+Pl1X2eA7eWDcq2rLon59xDRKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gnK1hy/l1XCnkKl7wsW6Gqek+XxC918YhYEyXoOwzk=;
 b=bND0/C/I7ZQSp1AbQ9rHEX10ZmvdisWyjjkxCPNC2A17zWLsb7Hu3n5qqznI0TQ3d+2RzxTilYaUv8MdTlMu/G35WnmWFRxwZxcsJL22bitQPAKkX5IJSRCQszDOYhsq56AiVKGFlb3lyeBT6MA4rlEBwiQqQdgk7To+DavuPpvEurV6KJOjCTwmH7JUnMH+0EtnhvYfcNxp3Rtz0MAe99NeIjPrJsl03W9fE23xRl63qYcaeeEUTI6sjqzg00kcVwwtZy8/UmMr1WLSEq+HYr+hHXSZZ58Rb4TIcnOMhEyFxH2vaFwCQDC2e4qSRYktFesEcPIF5Y+L9uZKMh6FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pironex.com; dmarc=pass action=none header.from=pironex.com;
 dkim=pass header.d=pironex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pironexGmbH.onmicrosoft.com; s=selector2-pironexGmbH-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gnK1hy/l1XCnkKl7wsW6Gqek+XxC918YhYEyXoOwzk=;
 b=lKQMFbZJDX5JSjd0q9MBfd84n4QWjT2oiYx5DyNd4PUVVoAqa1JyGQqyQJouGoujdTLs6JkJ8NyExWAbVVQwOISYfy6vGriQqwQcV72jHOLRZWVxj2IhyPMyHcYBJxGzb9vK2c3btI65fQm+ibBE02MibdSu9URw/Xa4HJDMzcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pironex.com;
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:415::15)
 by GVXPR10MB5862.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 13:10:14 +0000
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b]) by DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 13:10:14 +0000
From: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3] scripts/runqemu: raise an error when bitbake was not found
Date: Thu, 21 Aug 2025 15:10:06 +0200
Message-ID: <20250821131006.831214-1-r.gruenert@pironex.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0111.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::28) To DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:415::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6954:EE_|GVXPR10MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efde77a-625c-4961-1362-08dde0b4113f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KUrAq1Jkym7XfEGqkug6zWm55k1Ww0uIFS0STZWsIrhmKG08+VbPUrBaCueL?=
 =?us-ascii?Q?XG/HfgvZuxrY6JFD/YkfwuD6123y+vOTkAZgkQCbP0oTyZs6UXObZgzIF8bS?=
 =?us-ascii?Q?T4fyUPdXxQ3/5VquOMjokDGbpevURn8KavFLBrzQQuTxRdNCY7FwguRdPQIM?=
 =?us-ascii?Q?TaNo+SnFXgn6MFGRi45i9aWvrUvGSw/kYSgCzeEA3XVZVaz2hxwH2Gc5WylH?=
 =?us-ascii?Q?2VDcHF/RlOdrmrcX3tc2/1Ex4hsepBure12D8qhagOIeIPbm0vpsaIGN/rUW?=
 =?us-ascii?Q?5EXTIpG/hDBnU4eO2wDlF1CpWoZ9jIMFLvDAM+5wqrTLQJam0+V/gr0GnjgS?=
 =?us-ascii?Q?DvpfOtCJqIodSmwzCqL9x7dWqFA3KCr/EO5vmWEbYsd/EgLYjnYOq2cG0bHl?=
 =?us-ascii?Q?6Vc2MrPaSlc6jhD/LbV4nfq/Z+znPhYs3bqrlrN0KDOJIJstGlvlAjOghbuZ?=
 =?us-ascii?Q?QoU5/BhCy2+45v/6THGkb2MLsaq31ZE389rGZfRlJiyOa+7M0kZZbxHmEuvs?=
 =?us-ascii?Q?ZClZn3skH4H8Qf8WM42hDu4aEWALR+QoXEULP9UF0bXBY2wsblyqrGweCxMz?=
 =?us-ascii?Q?RGgPwzZSN8AhoRfSEkQpdHSJF7T7FrINbne90/rwcKjkGdZp9sS53+/GdE8D?=
 =?us-ascii?Q?CDTzkJ5zdLOGIOeefW3RvOS3WNMAz38qTn94ezIHEdup0B0Dwj5xOHKyCg1H?=
 =?us-ascii?Q?uM+Myl88l58vb77y4+zHQPZyBzJOoowTpkR6nVw8JkWXzYfOIiDAeAtYuCS7?=
 =?us-ascii?Q?2MU9jYn83uaABOUc3Sq2yaL9WgV0Dfe2h7hCAf+2xh18nbP/tkmrFhI/AtUy?=
 =?us-ascii?Q?utcxHBZJm/MYfWYNI0yR2UGsJzgerHmIt3zvcxE159FjaFoZlCElcnbHk+N+?=
 =?us-ascii?Q?tJDlHxaP9lu+4L+cpXgcpbRDr++m0LL2P0kIkit4LPBy81ReEvIUfvjTPRHv?=
 =?us-ascii?Q?VDl+txMZ3A0411s0U6FAjw8p0u9vLSKOqQhJnwut8FwBOP0WWrF7Bq1F5/cm?=
 =?us-ascii?Q?rUisAcTUDNiJrmN9lp9Yt75vmcESUAD/lFH64o9B16H/3V7ljl0yzfIb9mxz?=
 =?us-ascii?Q?j2QoETGMXTTDcYD2j70oQ74+hzS2LvImZPgXSHEMGJ8IIXKGpgNLqAgMB95m?=
 =?us-ascii?Q?yMAJed7qvJhhNo9N7B7vqOE6IAmP+XeygmzWWF7xQw8jnR84fhszOnPaNR+7?=
 =?us-ascii?Q?6fyGZF8xQ1PaXgSG9PeErLsF7FXYu7V1b7fkiibBmh9rfq3NrBAP45BuVkSB?=
 =?us-ascii?Q?UknMqNvs1ZkPJfMyyxXC2i+o2AeRfaTLsxt7VOk50cf/ITcEFLHUa9pCBZum?=
 =?us-ascii?Q?8eEkPpTc5aXf/7VxfFRyQsL2g6VcyZ03wYkUon/cpxadJcNQpEzl6X61EG0F?=
 =?us-ascii?Q?8oLzsWxqTi7IFz3f/iNPOpbiU73EOUPsBdBQk+0WTOqXYoWP1Xhb24pB1ytV?=
 =?us-ascii?Q?c9GlxLGAcrg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FgQhJWM6emEzsbxki3UND5T2fVhksZyiPr4jImKDcPmKMtvmgsdwSTdsqhTy?=
 =?us-ascii?Q?LPPDerSzHY5PTy9vu1VRjUaHkhFHPQ3arT+qWMTB6k1lOvx+cknKGIl+mP91?=
 =?us-ascii?Q?9S3wYiTr96y3LispcKlq5jQ+RddiRjedbhKvyoCdUxhbkigsH4TiwczihxS3?=
 =?us-ascii?Q?mvsqob1mqDUj3SV0XjyJUcl8sRWr/K6aglSLS4TU6gD/KPNetTAny0XLEALp?=
 =?us-ascii?Q?hQsN3ix/XNugFMdvtoIAAtGRv9ieix/KaXJPZUE06LWTCjV91bF8s1iADUAP?=
 =?us-ascii?Q?dIB92LyPFcbwqvEXdVzQ7aucK8DpDnO/ruXE/J3otepIKPJV/f06ri03OHSI?=
 =?us-ascii?Q?GpaRCdal+c/OgkKnwGy05dgLMar/Gc6oZFd75yKpTdzl2P82I7yHg02SXBLe?=
 =?us-ascii?Q?uingzo2hFdLk6/IRxiRgXL6g4Fmi1lqYnoZVXXbhUXU6Htk6JgRIenKqpFVq?=
 =?us-ascii?Q?15W/cibPVJ1PN81lJXhYUeLmXo11fiytjNtRil/Y1G7WOX0A2D4H5BrMKIdK?=
 =?us-ascii?Q?xEBWybxp88dqhiHhhwi32Df28p01SjPrPLiAIBmAVW2FHLoofx0nDggAY0L5?=
 =?us-ascii?Q?W8Co2AZXUvVumP9gMIjp4lsG/TUlIWOugNUsG9wlzKrUFIbEdfWlbxBBR+lZ?=
 =?us-ascii?Q?wfMShXFb+ylynckcg93bdj2GutZvnPsPygLyUilydotUETQ0ARL4LIEn841r?=
 =?us-ascii?Q?Ih1eAslZTy31p1uqdwVBq3DqG2MVmC42tzrtdyhJdo67FtM25DKOkv2+VsyH?=
 =?us-ascii?Q?bZ1NDsXjiLHXhoafl2+WDUnJ630YzA3CNdwYws5TkQqB+hyMEBV1y0YGXWhE?=
 =?us-ascii?Q?DAaV5Rjn9gDsVjDxtIPqTlxgk3O7kssXP/LLyX29NHSwBZuC6VdwYNNqOefL?=
 =?us-ascii?Q?iM+M47A+EZqDHm2bTNP3t0a83XlKlAB22NycKcjN0pZN68IDTpGFhCLeCw6O?=
 =?us-ascii?Q?Q+MoYwwP8ijnCUXvNjSSb4DlMXhuhcf4W7okklnlsrEgUCKJ4sAVEm+4Qkbi?=
 =?us-ascii?Q?tWeiddbiwZ1B7Y6mweKprUtj1yhM9U0NWfvkXzuLs4zAPiaDeprsOXbdqWvP?=
 =?us-ascii?Q?9UAG37Fiicrnyybpi9zDZMjMKePrIVvz/Qw1auG6w6KeVDn87Vk7vkrYOIdO?=
 =?us-ascii?Q?IiKrlqZO2H3kYrkhUKSZeBHcoM8hL2/KU/lCzNuywjS1TbXhjMD2DzWj5MvB?=
 =?us-ascii?Q?QGIkM7wFtC1RERNEbJS9vXr/ybSaVEjzKm8qq+bJATNPcaeGx7PMofiLGdcD?=
 =?us-ascii?Q?OtCa/Wa4ZpjcfXx8uVWquSnb+J2vIF1Yub4U07alq70tFQO9E7EuLqq/t2MD?=
 =?us-ascii?Q?NEnCkbm1MdqtOE7GegyONrctRj2LIJbBRdhIloJnkd0k0+o4u6w5NZmgRguW?=
 =?us-ascii?Q?/lkRY/cNxr0WRX+l0TLSSHocZvGlxQ++zG/e266oGWMoS4Sy2mXeHIzgo557?=
 =?us-ascii?Q?pcNOQPf2duJuyOrHzrfUJ5gevJuGIhZR3riDbftDWpnDSPEz7wEM/51X5fk2?=
 =?us-ascii?Q?YJm5Lcs6tac1V7p4MU0NbSWS2D8s/og3oS1Ohhf/33QOSW+89IjUsl34ftKo?=
 =?us-ascii?Q?JOrpy26emyLw9WxGyYqbhI8lQI9t6/EUQYxk2F+VutvEOP5EKkEMLheMBLG1?=
 =?us-ascii?Q?T5SccyKNb7+NzPXdzTLSxYzvpBIec/SnkNv02f3hOgyD?=
X-OriginatorOrg: pironex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efde77a-625c-4961-1362-08dde0b4113f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:10:14.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00aa8e52-eebe-489a-8263-3195e0a468ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mDaI6h94c9wb98MNMIwjjampUb5QWcYg1wkbfcswq0A7+hblo1A9Wu2ES473jFlvcCxNQqynHCWJH/Ga2OvWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 13:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222237

I am new to Yocto/OpenEmbedded and compiled poky by following the Yocto
"Quick Build" guide. I later tried to call runqemu
from a terminal different to the one I ran the compilation in
and runqemu was not found.
Wondering why it was not found, I ran it directly as `./scripts/runqemu`,
which was a misconception I had because you are supposed to have
`oe-init-build-env` sourced. However, there was no error that told me
this when running runqemu like I did. So I thought it would be
good to add this error message to notify the user that bitbake
was not found. At least it would have helped me and saved me
some minutes of head scratching.

CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin =
<alex.kanavin@gmail.com>

Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
---
changes in v3:
Messed up the CC tag :)

changes in v2:
Changed the position according to suggestion by Alexander Kanavin.
I also changed the error to OEPathError as this seems to be made for
this exact situation.
---
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c24528eac8..5dbeb518c6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1713,9 +1713,6 @@ to your build configuration.
         self.cleaned =3D True
=20
     def run_bitbake_env(self, mach=3DNone, target=3D''):
-        bitbake =3D shutil.which('bitbake')
-        if not bitbake:
-            return
=20
         if not mach:
             mach =3D self.get('MACHINE')
@@ -1732,6 +1729,10 @@ to your build configuration.
         else:
             cmd =3D 'bitbake -e %s %s' % (multiconfig, target)
=20
+        bitbake =3D shutil.which('bitbake')
+        if not bitbake:
+            raise OEPathError("bitbake could not be found")
+
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=3DTrue).decode('utf-=
8')

