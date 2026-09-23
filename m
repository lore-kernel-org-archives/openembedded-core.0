Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5515EC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 12:59:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6434.1790168384860909089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=StrqL1DG;
 spf=pass (domain: est.tech, ip: 40.107.159.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWa9uPfmsPJcaA/uCRE0vCtHgmbxk/bwA2Nr6UeunXiPzFdpO0Es8VABFHCpvN9FbEppG0f6TRHSl7V2qpVKzq9byrqHrZLTrYxbxo/0jj+Zc4UN+RA1ANU0dnVV4/OoCGJYYFxum2OVbur4NjEVKa0Xdb3i0kMt3XpsZlmYl5xezYHYct2nj3JezGUfnWiyxYOxnQ9DsAziuWgoQ0FN1BAM6M2dhanY4uaGG6GTjoFFmqsfkknTTjVcqCz1CXXw/+xL0TzlguyJX6AQWkg5mjZsb31uXthXX8vL0jDbGWGkHVlzMMUj5hJUtrZ8JV8I1jhDwiUOotOOJwQSKnYTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlur9Lih6rZC3Iw7A1YKFkGhp7JjG54f1pgA7z5vUZw=;
 b=U610yC8n/MaKaLKW5KjLVdjIxcQ7seqQfcGMvDPS5CajBebdIrMAF/htnfqgZ0TPWDbTCRmFeyOCRmZJNNQRNzisDBIvw2J7BKdPJ1Q3wObMOs+pLW9fIZ6HCB4WYSmX0SeA3AzoGbdCKPZjjCJtPVtIQq0oHxf/RNNmTMeabOKDkZDk1pQJEU13EvVvtVUidQxKjqkeoUbZgN6rbrdwKaBP0iYh2hrkL56ExQi+FmvKdjj9WZgLoNNc/PlUS526U42r2s07v+ghR6ELW4CHuLGPptNWI1Aoj/oIjih4pNlS8fh1JArbdygqQrYFubnW9QrZD3DblBqosDknQ1V6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlur9Lih6rZC3Iw7A1YKFkGhp7JjG54f1pgA7z5vUZw=;
 b=StrqL1DGMITWbjVWymNj9Z7pxRi/c79Z1QLR3vl0VI7d92cjrxE/0VOkmxxjGbMMONbMaA4QoKsuBesiY9HIoSuUxV3m+LxyfC4FypewA6T9gcGynOUGRIzXSnXrphmdnuWQuYEOL/VTnGU2oE12RAW10qh9QnnPP96M4tnzYkIXb/47g481hcAw/2LpW/mmi8UMLDvuacqtSiawEHz/sMYXLbUPwAaLylG/am5FYa5ERTFQYNOoPo/tCxCh7YuZLaVn2IYTrKu+F4FvAZZEnooK64YuevQg8skTMDm6fW1F4HNDahu7Uy+L/iBE2QPfTt2LNAQZ+cML3HB6mYWRfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3115.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 12:59:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:59:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com
Subject: [PATCH] libinput: Upgrade 1.31.3 -> 1.32.0
Date: Wed, 23 Sep 2026 14:59:33 +0200
Message-ID: <20260923125933.37607-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3115:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e971cd1-8dd0-48d7-0229-08df1972850d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10070799003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	0+XeoUTkGAzfWhy1iqE/iIUgtXRSyUWvYzmpXbDhxddtLJwSwHlHss3bd0nOo8bERFP3obwOCQ0/6q9qdZTju64bqqeoEQUqQgjrzktFFkMZua4jj6ULO2+CUkaKYWwoc09PKaGXLPUYXxWY9ut49GJuVd0OAtiTf/zNLVg39O7bWA6MGkN90Z0VMhDS9tsUQIBLQTfBkxv4ia9LQ3ae7NJjpMJEE1WbqUWyw7YBXQLvM/r1Pdhry8Hb0gVTutara6NeC+qI36fV+p7jha4ofLHtyf/zKjXRf2hlJuwIUF33Ur/UH3sm5TMFnnI3ZONR8o56fy0t+P6q56eTnE8NbdHcRLiYszGPsClzMHHBXVJgTpLNHyLpfw2LoSC/Mj9cDWCKKjAu0RFGsDYe8doppyoVmD7RF9anrM3guOhCmk6YdIwn8+U7k/BH0MG89GMDpzHZH3XyICi7y7P2Xv63VpX/a72/iWgOKgfalQNtACpBwsWaOzC+ZQZan5K07c9txyQgStDYz+EnO/G0Ks3zVzzYqJ4bdfeYGNypOtr67zUT2QK5XiyxF39saapcvZOQWRqnv/Arjp2fb/S4qphim0WLHSYKgwc2I1JakvLNR8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q+tHKGZlAG/Oh/YhzNMqrctyJKHIcbjwTiZsi6Wz4ynaaEdM++TLuzZbmoV8?=
 =?us-ascii?Q?AYd2C/QI+LsNuEQlqiroJfLhL1OeWIPW8XWatER+WQEe60eCW6OeRYZspVcj?=
 =?us-ascii?Q?he7Mi2cuu9iipYBohrtTy1v/QsoI2BsL80vs7JO+n6wbhjGrxhwiEMPrdMba?=
 =?us-ascii?Q?161QnBWYzEBbdDfQb8LICl6SvfVNcVlOjl9R0WqxCrN5wlqkk+duyxODOH7F?=
 =?us-ascii?Q?Azq+d72BkSL0cgGfnlisotUgtnDZBomFXI/D5dp0PRoz9Fd4XkVz5Bno+ZJ9?=
 =?us-ascii?Q?rEvaah4HkxyhwxpuHFVIzwHlC+ybhGtGPqbRKmpk9eyqZ68PpvgYDLPdK9sv?=
 =?us-ascii?Q?GKoqeqziBb/Vp2/128/Fezqr6lh2abkBkfaIOA39cJwW3WnqzWbQ8Lg6Sv+l?=
 =?us-ascii?Q?+fBL/oSzRc7TRnSzozvCXoUQ4RKFmmxSgrXdRQODi//aCFTR+0nH/bWs5FaN?=
 =?us-ascii?Q?0ZZI+DYWjQXFu3DFCCn4yX/mkG3b0BFXvyqaSyHdeT/iR1JfQ3/EaYG4J1/3?=
 =?us-ascii?Q?vNDB03pgQcqoF9zr5ld0u2lZDDbeVO0eZBTv8BNqvVOu5kmJtk61QqF39Y/O?=
 =?us-ascii?Q?4bCLIj7G/Sw+0sVdftLjM27w8SAc5qjTxS9+rRT7ntrXP2/qshV9q4ho5ef9?=
 =?us-ascii?Q?UMNv30ZDbjAgas3yn43sjJ4WMP7dRXnC43lT0rLKxvfDADIilcapHXPOEV8G?=
 =?us-ascii?Q?aSkusqLPxa3fotstdnrP8kfTLAN7gAsEmJFy3wEXylVFyRHaw1CFN1bmW+Je?=
 =?us-ascii?Q?wKTm4R9mnIjU8Azy5X99bd6LZKDRULuRg7MB4c2ugs68hZym6EWcM82nTyZc?=
 =?us-ascii?Q?GYTWFpBnKhXEWm0WtKPUNZrmgD+5KJjm7c7lelZptay/BavDvoAfyVnVat7q?=
 =?us-ascii?Q?qFj61LAAxtYOKBKYo96157EcgE+n8VCLyAajXz43fRIDTVk7FZ5+H8m5rkqm?=
 =?us-ascii?Q?cVF+eqJjA4593bqjD/wcaUp1j5lU/bX9AZcQpUYxo6DV0DekKbx4B9FYY//U?=
 =?us-ascii?Q?NhW6FNX4PDfqD9YSUKbU1puCla84jUs0HuiGtNGwcI2kffJ7UgRDelOFnJDm?=
 =?us-ascii?Q?t4yM5O2Mmrw9uI/C+OPpwFkEzu+rhxJa7KAvbXDJf3Mx7PS1FBY3ksvSQUPF?=
 =?us-ascii?Q?ps8stjhJl9sIgdOy0y3QYlxz14FcxJTFRrWbXZgV4FL8ve5pzwxk3N5kIhDT?=
 =?us-ascii?Q?wRAidgMk/Y1MX7BDik8O8LgWxvl8R8ALimgrEd3233nl741oRe/Na45f/wMP?=
 =?us-ascii?Q?kQAm5hlCQGOz5vekKBDkV5rqddk6PP0LR+r6dJK342gjUxUy2Gdx6ZqEBZ6I?=
 =?us-ascii?Q?d0bPH8F7OOqGwe0aTC+qQd8Q7NISoYt7XJiPFD043EefFRquE4o+poKPfWN+?=
 =?us-ascii?Q?+e5h7Va4c//sMWB6U5ow8S7GBRKnD3piHgBirLitkVeYoVYwix09adDIK49L?=
 =?us-ascii?Q?dPltZtUrxn8Pa0n0/5XvXIxXTbzIkUp0Ac+fBrTOFbASnGZucVrR+Ju0jwBy?=
 =?us-ascii?Q?wbYREiu9WqCFHKCW6T2xXxLBnUgPJvfO2K2/gjGIb+8AiI0slheuZ+ji4cBG?=
 =?us-ascii?Q?Xcg1ktHbweVRanm9/7mcPxbGXCkRIaL2x/tSmot2l+4QBng1j9nfbr1feQU/?=
 =?us-ascii?Q?z0PzQ0qt//ZGPtDvktYcPnr2BF4q9o6mYLKfs0oROJv4ccHVsXXlRvNVZK/z?=
 =?us-ascii?Q?2VMhg6yay8dbD404iATtmIvbpMxSCyiciqNvnDjp9gBngmS5B7WsQvTGStQJ?=
 =?us-ascii?Q?wtrS7U71mj0HE+3G6vqzCUzdLRXmqSOCcmMgXdYCEHwbFWI1fIgT5wjOoHeN?=
X-MS-Exchange-AntiSpam-MessageData-1: hyenya8ud/Aaag==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e971cd1-8dd0-48d7-0229-08df1972850d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:59:36.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vkA718W6uugWncj4FysT8ofq9ipPdwcuLHqIiZfNnbkK8ZrPqUrJHccITJwxr5H6aYr5o31paNFsQcwRreRmFIU/EpqrFFbw7j/4WoYTl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246513

Release Notes: https://gitlab.freedesktop.org/libinput/libinput/-/releases/=
1.32.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../wayland/{libinput_1.31.3.bb =3D> libinput_1.32.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.31.3.bb =3D> libinput_1.3=
2.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.31.3.bb b/meta/recipe=
s-graphics/wayland/libinput_1.32.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.31.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.32.0.bb
index 11341af63f7..daac1e5a20f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.31.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.32.0.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1c1=
0bc0fb037dc76c46ef8a"
=20
 DEPENDS =3D "libevdev udev"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.31-branch;tag=3D${PV} \
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3Dmain;tag=3D${PV} \
            file://run-ptest \
            "
-SRCREV =3D "26191d396d74d505541d6311f0b4ae68d791b890"
+SRCREV =3D "5cf833b572f5a33663888da321dce0ba1abd82a2"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20

