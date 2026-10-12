Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5A2CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13141.1791811218138366613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mW8gECzv;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhGbWn+mRqCP8O6tgPDDrJewTRsqM6sc3GSCyoRC7Iqrdq2y/lMZGBfFFCANuaa2brYjGkHZ3YyI78lvTc/O2pV9b+umQwqcVBKrh5QRHNiy/8rzC0qse0c9irihgwe1oefPjVDm5mAbmdOzFIXRp0VUr5vP49/DTeEvjFA9WHvto2Aq/UjyNyfZmO5Mn+O+OpnyHWR7uoWtU9mn+7L0BM7vsP7fKEbqmCmFjyMgBqgIo9MSMXNPEJ54DfDaqiA35CuJ+2y51h3LXutuNYw9P+gK4KQX1qVdpNVwzfWol+mfgFkFL+W8Ou1OnsR8LvwLR2jCQWutJic8Z8mJRCb55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOKhwhpghjdZpTfiH515b1/pdmDrrkyJ8R77tsnSZ34=;
 b=l+MMvksALGsmeSfJg+6rRBsWViQu4LmSdwwKF8MG36q1x3kZil6bjYkd1dAVbeD2xZFUYTAci3h4YtjproyQ4Oxk7ahe5MrCBSxGP5cqbNZChuRqxmzWpMcZjQ++xQjiwH17TBSGlx4B+zluWoRzshM0u/uQ+RDl+OSBDeajkugiVDX8aeqsPZLrTcmGKm6e99+6TPExVzlZGvAYoSjR7ZcmHJGqnl171MsVXSmSlp4F3tor66s6Cchl+0PRt3kXa94OCBl9p4bsMPfOcpJJSp0LFvZ7mYN5+IDDuoIcOWrBkNweoQQNJ9Qm8gH9dzk7zRSkjHlRz8wVWl0g4dDZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOKhwhpghjdZpTfiH515b1/pdmDrrkyJ8R77tsnSZ34=;
 b=mW8gECzvlBAYJakeiiy4o72L3G7rwLI+H2+ynhCKx75fXh8pqwkiY/oPR5g3592K8NZg2g+CSE6DFX76ZU2tVtGdzntBX5Iv7lq/YKwsWoPkZ3fsOoaxRnlM1g/vXqSV7ksTQW5uaxid0Z50lOzt7xQqwm9sEvv752LSKvbRAxlby6bpFoG8Pc3JbV6NLKSErZOPapJrmNM30+hZ5r2syRO76ZXtOOgWLzn8ABYtqYEYEsQNS7/oEr9TU3/aZoCGsF9f3gKrubCMZH3fzitDqtG4kpaTRwsChmehFOYADLTowwltrS2cOSNZfvRel1UMaAm4giUpRCkFqPEu0d6cNg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:18 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/18] gst-devtools: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 15:19:54 +0200
Message-ID: <20261012132005.23909-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 1234a6c5-b71f-4b14-5fff-08df28638f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|11063799006|6133799003|12006099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	TcUvpFAL385EShlEX4TWkrYPiaXEQY6R/DiYkIpiIlmkbWE8YptWZMEtlPtobkGD11H0jYEvA0pY7uM3YJ4xlJZtNOwtJPSwN7ESfH7+BWAUWZMGwjxk1g0yAxaB7yJYYUnDMI4/1ujIyWNJzICZ7w3YLYuAhBIHCaYwCe8dKTYEWj6sHvJZTJsVxr+6o/+nq7optT7Z45SoEbHoiUpbT357bMZM4nQrnuZJGk0nRb5hNZ3CaeqUZo772mC6Dp9QIZZX93+C2AyQOMnyKVbyGTUP1hES65mHQ7gHiB0YRcl3xg8K4PC46nsmWGvulxMgOd9p6m9E99rl0zn6je1B+gP7Sflz72orsY0SnMxRDIN1rP0424rhSaLEKPNLvRtLC7nMC5fWYT7K76Lbm5chVCygnee16ZzR8YwLHPy/IWxZfQ2jNTMaas1wq/s78+tpCQvRidhCGOdoGbXMeZpAdYwYuJf0HX/GMtWXaePjtA5jN1hMOgUsesXhO9sauA1+jtVWhal94aLkvHIp4HMq6MzptQHqY7DmgWN8h3E6AFFNKybTLdWOlPtYCvLP/MAEfRby5k23ruLjvFBPH8VAXFpwpARmGJeuo67qiqCwLPQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(11063799006)(6133799003)(12006099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VWuH6us11fuG+kCQnSXppUOA9103mhiFZETUtOeCe2S4um8BCvhIZtZQKCGO?=
 =?us-ascii?Q?lHsWxwfMHju1OcAeULcJnjzvGpSybU8ItJyfUzyRKJWOHVa4blc9pmhO0sb1?=
 =?us-ascii?Q?EhMAoAdo6kSpl9n/rvfORrEFfdZk/sUtYLUDasjV1lt+fziSqblsdEYSWpth?=
 =?us-ascii?Q?ncsLrrDa1TQ7PH0cJ2iXun8Df04bHODyYfXLXMIZ1ZFOF15UfNdN1i9xcC3e?=
 =?us-ascii?Q?tu2PtuQAifKWxX/nnHI26vozdNvjyrtlkRNZGvhgX8szSO14ZhpGX8jL+Dgh?=
 =?us-ascii?Q?zpFPavAexZrK3gp959MPL/cjdjibzNJubkBgLkthUN9nKU2qHh5RBQxNwLte?=
 =?us-ascii?Q?1G/w+nvYUuLiZonwj8+96qiD0gL4YiTeh2yGxQZbhWyCAwKE4Zua2PZfEf9k?=
 =?us-ascii?Q?aXbQwjGxR3p/LGShm4tIE0ssRRIxZGwI49sY9tysI/i/DPp8ZkwceG8LCeJm?=
 =?us-ascii?Q?ua/CNZWDCdvowB/yumnN20WyR+j43xbdRBz6GmoFJ+rc8Fcs1/Bp8LIipGEp?=
 =?us-ascii?Q?vPYSO2/Uu5/CXqCxzNny5sKrAsURQZNKinuykfkFheAMj0XeNDXkS2Wfu6IV?=
 =?us-ascii?Q?0HO8C7Q7+w883rV1MaZfgUhnv6kDOEtgAsco3nEMQihWmfpCeLldK0QGlYwp?=
 =?us-ascii?Q?Zs+Xxv6p1/ntaRL7LCZjvX9IG4bCp1d+WX10xUwQf0jxtA72eW/LqpfrGlxu?=
 =?us-ascii?Q?dUlhYSej1Q9Q4RiVMvCu0eLwBwZySZiffZqgPgHm/N37E1a4mxCXXH5bwCEV?=
 =?us-ascii?Q?z1PhAffDIDFkIueDM2YQkPH53rwfDsMGIgcDjM1rgk7n1wpkuQBMF69VATel?=
 =?us-ascii?Q?TyzaE4Q1Jf93BmSGIPiLkz3tryp9OC+Qsb8ER7t2MA8bOZitkP8GYV3pvC/K?=
 =?us-ascii?Q?n0XmL2mFvt6cDiP9VYygHPLZ+7q6OHciIAi2EXHvc4MyMcD3/coZjCgG5pOm?=
 =?us-ascii?Q?536TlSLb2zwSdkwzQMi4M+6sWFbiGuhFuMaFfvD22gHtf5WT/5MlA/ZfcSB4?=
 =?us-ascii?Q?hboi/sQfLRbJH9+msct4tjv8C6IaFhbF3u9AZh9j8VLR5RbMHLJP8dYkZIHF?=
 =?us-ascii?Q?5RbR6mBXUc6A1N9N6sQl5pXGln9IwxlvTo91zA8IwUNyTpfj3BI000ROZHar?=
 =?us-ascii?Q?4X45+FroIUxvDah81tSpH7UEj5uC4MyViq3W38MJ94wIZPZvjS+zy2f+Tx0U?=
 =?us-ascii?Q?AdUXXeGa7KhrVaouL80yp4HafRZlIaIsykrACsqbT5HtJVvACkS2FmdnzKhk?=
 =?us-ascii?Q?jL76QtHv9M49T8Nv945Qk3HkpMeoeVevjB9dLXvDCvFbkWcoJoPDZeCYI85K?=
 =?us-ascii?Q?D9uNJG7DboECozwCSu0NIu9QieULxiQVU+Ct5IHe68tVFT1qXZsfbozkjyLP?=
 =?us-ascii?Q?pbtkWjbaqKWuQa/RFEBJKoLkzDQP+tz4g9u/J+P9EWXa+9Dw1nKJrN163jZB?=
 =?us-ascii?Q?ugYHnPSM6ZwnMmAWpO1DfBwq9H4qXd7YN4LgdGYFFzjtgyqbfEh7p8Cj+dN+?=
 =?us-ascii?Q?xstxyDu8JSmTXNOS0GneKL/JYJDw84gRUnCKAgkEwN93ozsT0lGBVESI3Rsk?=
 =?us-ascii?Q?q0yMQxE7BWj2k/7B8s4AFjPQUoSKdSbC956hgVpKLUvG0YH+go470anWGljW?=
 =?us-ascii?Q?XjQn4BuH/BI88OrPGfOHKtSLpIj+hgPSSIFkHhMQbe3BYK88Shzw7vdnGWjh?=
 =?us-ascii?Q?0GW3dXbkzZVzpaLgVoUsoCw0VZcSQG3hJXMO6xJmezZKFioNUzXr8arSaGit?=
 =?us-ascii?Q?2BheNsGpww=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1234a6c5-b71f-4b14-5fff-08df28638f74
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:18.4757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6K/DThr1pUZzD4i+5msKCpPNDgQgcsunHVqiOyez6KQr7YoSa0gMiUvoyR+Pz6FoYll9+KAVlWE+gGiKSJL0b+H4c/435W7djF+fyx4rAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247651

 ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

    - Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.7.bb =3D> gst-devtools_1.28.8.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.7.bb =3D> gst-=
devtools_1.28.8.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-ha=
s-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/g=
st-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 3f07a429e0..f10b0e2e6a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 80ad3bf3c51cf013480777db355504c4308d9030 Mon Sep 17 00:00:00 2001
+From c02d717c6796b797b6da66f022b6a6604d03e510 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb b/met=
a/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
index ec07499f67..ac46adc36a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-de=
vtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "9f3a389d6a7efa5a18d7564724a7f3b1c3faecffcb8fd1351e=
d0e811d1873ad5"
+SRC_URI[sha256sum] =3D "a85275f91e421ae55c8ec08779459a3f93f620d2acc25b6e67=
23ef43573c6ba5"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-=
plugins-base"
 RRECOMMENDS:${PN} =3D "git"

