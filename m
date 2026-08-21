Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC6C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:57:12 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3511.1787302631075268039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tjyqRH5l;
 spf=pass (domain: est.tech, ip: 52.101.69.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fE8gABef3a/5AYnxl1LS9FBPp42SOtHpeXj1uRZuHs8lk/YsA54TGQ3bUMWP72+fddrKEaZWZz43+pco9EAsRkCujY9AkNE5DKNxwBvBjsJbt30A6owg8cH86nHqOIuLeBdTMCB5AKZ9ZQyIMyHUZ5vzR6wDCx80g5XwIHtt5bH38ZnYYitaJu9bip+gXA2ge3FBaspHJTfpnfjNmr5ydsPqGcpADsU11TKe2qCSPa4sNBunyi5Dk9FwNsTHUeHljIhK+0EdaRqFVQ5n/6z2o/BTK+nsja2hAurz9YWDR5Q/+DR/lHprV/9XwvIRJeM8nN3EuAiIh9RwI/EYcHTXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNV4R1ZeKMSkGkZoPwNUtJA+5lkQkENnOUInfevHbxY=;
 b=nNdMnTz8R3pLNm4Mse/BjzIEr8cuCeNwa5gcIpF11mNNcjefPgjDbErlESkVbDDhgjmT7jASlfG6r26Gc5DJvp2p/S7MMiAyEZYhSsRKaux/YjEKMCIDDs1czP66XdJSdBrHUaLOUrk8bIXf8wKK9frM569hPl0CqXS4Jvj5nPzugotPhsMBpYzj0HDltsJyXrweal9Gc+zSRXw0qADOcpzE1V07nPjsHEYtB2HmedMeBtVWQ78R7Jf3eGhPgNH7+Vr8Vgh4SyQbTBBgCX8/cuWxhF51OkeEH34FvN3xThVu1QMBianDwNbQAz2FVscoGW/JfOB5VRJG37ajpbC/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNV4R1ZeKMSkGkZoPwNUtJA+5lkQkENnOUInfevHbxY=;
 b=tjyqRH5l9OoeU7hZ8wnsCqt//2GJt0xLW8/rJ9tisenWfsv7OgxJTl8jI3F6pfvwoQEkNLy9mT7DkOuIXnDucCzFgGgaY09XbSkjAWpj0QZSVffAyyT+ULohp/Jio1evEQe/7FXcemIuR01mBPhjIWNOfwphdbSVo1U7vV/RocsEnjUrXjoGFKAnhn3hx8ZW+vRJ0GXNwLRBQVGgEvwfstvCsqFZpdUVV0OS+eTR2FEyALfDnRzJ3QeYAwzsmThBsTkDMBIH+HF8rCtHT5qdHEVV5KQ4v7xArIKsgSOt1UFFh2DaQxbShTAXMciadLBFUQmLRzseY4gVmFSwo4dMOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB2501.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.4; Fri, 21 Aug
 2026 08:57:05 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 08:57:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libevdev: upgrade 1.13.6 -> 1.13.7
Date: Fri, 21 Aug 2026 10:57:04 +0200
Message-ID: <20260821085704.77949-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB2501:EE_
X-MS-Office365-Filtering-Correlation-Id: 064941f5-c70e-478e-1920-08deff622ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pRJ5C/fdovevPpEpEPz3oh3ULhgv7dq1XmpWBV58pLjDiTizzqMyL4LxHMMjxxNgCyjQjqDOU7FceFh9D8ms3dkshkPQEP/XqFYl/T3sMKZrgvB1JiwWYBNc+waT25oixU8NVZF4jd+o8UmyZyIH5UOlrnePGckcT4jAIdQkuOulbVq5W6Hxyd/dx+fGFA9b1Pbn9K1+41fl5NCdE4ShiMP0S2XRR8H049e03wFgy0lkIrPQoMMA3DNXIXUwMEjt0Xa4WXp5YYndDt2fdYuOgNtmi1eOT7wI+u9aGmTd+UDh6qbRcqi7T/mfh0Sg2ukyAY0QmgQ9ASh2czmatS5DARRO8ETDcdTzC90vfOrEBBU7e3DlSGhI/Bx6OYe0aZmMfv6W4yrZJMZXdBgnII/ZWkCw0vQq+maY85/3Ep7YSIACSqku4BVXfNkbMG51rTJBb/WDNnMJvJPB2YzdQ8z9GEjPZ2ZY/d9oga4Y9agGEQIJNUQmI0QWXMWlbpWc+5e9rpuWmayFU4cmkGOEXupPRq0YIA+kP3eS6gJcNI7po5vSMdzp0qFDyAFFCYIwpdRcRTxWokWDtxpvMjQ1IX0Cd3KD1ddIcVpv1kzhh3VbYRRWDYRwFBOz283vSJA3ZZd9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JdQlT4ddkwiKcG5kAaUYbAYt52OfYcRqWN5tJPMLujtMdOS+cH/D1K0B59ny?=
 =?us-ascii?Q?PeiuAC9aHqYqs9SKyc48kaRtj/dCejI7d4O1NY2/RS7iuI53mVHdToRbd6Vi?=
 =?us-ascii?Q?GAdHze3NK+xjngrSdE4gGaCswi/Brqmx/Ym92NGK8WhfRmgE+rfddKLn2fwq?=
 =?us-ascii?Q?kKlrdHKvL0WMjyultduORUR+AQSESBHozum1HMtqbtoM5bQvYTjIQMistaZt?=
 =?us-ascii?Q?ZNnWdlcoXyD6r6s+0IpW9+Cpr0zkNQZWw+eYONpBGdS9z7SUFU20JXWwcsji?=
 =?us-ascii?Q?8148ue/ZEG0ZEkW4KDvZziRbOtGeUUrBcVePsW0tdXc5LIX+iWNJstmCR3F+?=
 =?us-ascii?Q?yGvKLBlVrvcKqOHWaAkZ9LVyyq97J+vTkATYAQ0Migj8EaS2+PxBCwNLrno4?=
 =?us-ascii?Q?eWFeS/IAkY2kU+wbqEV969jyh2L109DGwGpSBiMyk2OrGNhxptggc+LdyLlN?=
 =?us-ascii?Q?9fcxbHm+ha+LD+FmipItPZJDrceIhf9lNh2LZnfX4NaNkRatJ1gQK6rK43wR?=
 =?us-ascii?Q?LhX2Le9qtIv/j+AAsdBMRbQgDb06iDXNDLyclhiKIv35O0meXSZ/uyske87S?=
 =?us-ascii?Q?zDTgNvB3lxHsCZKEs0BVUc3m7/XfoeScO4ysy4hnLFA7MMznaPvsp1P2gMfZ?=
 =?us-ascii?Q?LbW+WuIhTHYR+tIvt1IrnYDuQogQ5s4YUFWNOTzMU3GF9FXLgwgPDVzBpgPx?=
 =?us-ascii?Q?pbpFfQCVJY/s9AeR2yLji3fGv3AYx/7F6fXI4OirimuWu1fUx6AD0IzdXvE5?=
 =?us-ascii?Q?ZxC2LsVUG+dg8iefDOtJbErhwu1hY+9kHAfg1CZj7AgIfs0hb0WZqtNZw3jz?=
 =?us-ascii?Q?9wC3gkqOyv7Du33ZVGCo4felD81zLSZvSZgniWzbFJm45Mm6q/ean+xfeKBq?=
 =?us-ascii?Q?Zfesh75qKukTDu8MeNz7N3l0UODtVIl0jCYCDSfnsHVU5/Akr2rzQYH+3L3j?=
 =?us-ascii?Q?XvVr/jNoch9T2xspIdP4qVqCnSJQD6EmNbzD9gdDDdS2RYhrd0POP1dPGi6o?=
 =?us-ascii?Q?/YByjNF8V5lIQJXhERTHXQUyxSyBRzW9HRUPaDGzG860+FgpFJz/U+Y/zjWT?=
 =?us-ascii?Q?SjxCE6E5HJQGazcIsc8BcBNpdqSOGvOggvcVLNEnJakylPUauWIctQ79fAjx?=
 =?us-ascii?Q?cLnADgVOuuiEJhaBMA8DHVsWTqIzwu92AAMXpE20Rgujbnh8MqIROAv60IIa?=
 =?us-ascii?Q?XPAxB8cqrIuTrho6xC6pzpuTay4WwQxKYXLFloGMVkrj334X376vHv/7qrXt?=
 =?us-ascii?Q?P53QlLEDQ1gnUFQag9pjeaBkdyj8ta0tpOoAgcu8tmGD1Wlqkc8fn1F2xTj4?=
 =?us-ascii?Q?l85ShQNaWHVLaal+pJl7beg9hL1f4NXcB14REKD08J9BRSNicl486aPk8Zb1?=
 =?us-ascii?Q?SHf/H8Foqyd8rpilBIAF5/BhrgNZ08BkrCUnkvEEbf8aomwZ6JYE8JusDOq2?=
 =?us-ascii?Q?Z8i6+73bmdfXz2i8sAYR7ZOM13s1KlGne8tD70FAjHYG5b04EL7BgHBbHA2x?=
 =?us-ascii?Q?hcrX5WQlevhv4dnZeyJlFEL5Y4O7I1vJLSzp//Zs6cStApzYaSFKMmn4no5k?=
 =?us-ascii?Q?z79blHPO4NHVUG67lwJBhk9eyLQVG/vGuSQRoRr3rFjj6Da89oWyAL1RjDfC?=
 =?us-ascii?Q?n/IojzLZcRkWpCi2WwNCaPLMgbDHQG9RCUyYuL+DwuzmiSY28o7xX4gGTSVS?=
 =?us-ascii?Q?1CKdUNqkXkfndjZuXEtgBMq3zF9pv/4XKp0LTrN6oimFEmlGLg4DIV4FkC0C?=
 =?us-ascii?Q?RnBqR8VWlr3vWTSROgxm6zjwNWl8rIg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 064941f5-c70e-478e-1920-08deff622ca9
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:57:05.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4zDOhaKp6w7W7i5rjQ30euuULOQdVDV2LhmHpL71Dv3WUpGymFYHZzYSWLuxNYOAfhNKSoLI+XuZ7NDL8+2xrrgUzpLeY327NpHXJtq/5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243904

compareLog: https://gitlab.freedesktop.org/libevdev/libevdev/-/compare/libe=
vdev-1.13.6...libevdev-1.13.7

git log --oneline libevdev-1.13.6...libevdev-1.13.7
a158f46 (HEAD -> master, tag: libevdev-1.13.7, origin/master, origin/HEAD) =
libevdev 1.13.7
96c70d4 Refuse devices with more than 256 slots
75717d3 Fix off-by-one in slot_value() bounds check
1668dd9 include: sync with kernel 7.0
ce52ae6 CI: replace b2c with virtme-ng
608e2f6 CI: explicitly install GNU tar on Alpine
9a0ffb6 CI: rename the qemu jobs to b2c
c0e27c9 CI: bump to Fedora 43 and Ubuntu 25.10
6ce9eb3 include: sync with kernel 6.19
be44b6e doc: fix typo

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libevdev/{libevdev_1.13.6.bb =3D> libevdev_1.13.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.6.bb =3D> libevdev_1.1=
3.7.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/recipe=
s-support/libevdev/libevdev_1.13.7.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.6.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.7.bb
index a4478b8df5..79e383c55b 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.7.bb
@@ -9,7 +9,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D80c550b3197bcb8da7d7557ebcc3fc4=
6"
=20
 SRC_URI =3D "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "73f215eccbd8233f414737ac06bca2687e67c44b97d2d75760=
91aa9718551110"
+SRC_URI[sha256sum] =3D "0caf824971108f15bb2ad356433bae198d7d3bf1e82d43f636=
26e069e060bfa6"
=20
 inherit meson pkgconfig
=20

