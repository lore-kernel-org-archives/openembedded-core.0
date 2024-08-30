Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3082ACA0FF1
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 13:21:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.88])
 by mx.groups.io with SMTP id smtpd.web11.14591.1725024094261705239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 06:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=S4Dj28CF;
 spf=pass (domain: navimatix.de, ip: 52.101.66.88, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ny9pN1h+fKz8fFPoXf/8fH/H4HuDcP/yI++2Bx6BORpT99LsYvEn8ydzgAjwc+frG7MaQD1BA3CdXxLhWFIOALj1CfVDGnmvRneZSfBIIk5iGf9eP3n+zRIk3e4Mt9GicfNELXOTl2OTBW63pvoV4/fT3Swjk/7lwRsoErm4At1l4aqzdogYTM8TKjKZQkHds4qIXppxeuSrTqtOoKVfvVFV6WYbz5uvrJe9MiseS5NJQehd4x30j9iM25M+LrMMlKKWYzGnz29ZPdk3VgW+GoZ1LKTid9zX93XB09vrRocDulDmW8EC93WEHve/vd8VbjjcJClR2QJhIN/Srygp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvv2HMfOxS7LMGeTHc6X1oJrxOoWZH37SxNZnEX48bI=;
 b=Gj3ag2Iko3xcIu0/8KDlHjlylhbq7fLVovOzWqs1jXF58So2lXoWO+cp/v9ZHAgNZx3t/T/zuQOz7A8ujMFTD2KjlpGqun1gnrfgiN3OGOssSpd/IncE6XyhQo2cdJu5/F7FNFYMyUCKqJi6Bqw7Cu9V14SRaMg4QDnYk9bv88VjIGIc//RHYhhaO3z8KJvYYZf3nKT/uFI0YiKL5/lnwLzYiZyRx72LUQldtWepCEKKiHu8rcb726oZ8phHksyeARaefPQSu+I7i7HLkUsqExKUWbn2q/lzn5K5mykuZ1wgpjVS6rS19b1mq3T5ZsHudW1q1r8R9RuRPaiYzMKPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvv2HMfOxS7LMGeTHc6X1oJrxOoWZH37SxNZnEX48bI=;
 b=S4Dj28CF4cmANwjfhNIbx2AjbkJX6OOM3+xNhx9ziGRxVEIjEI6hw/zKlVDg9rFhrOzfu7Q6rBc33GXP/0xMUGTaMMUFjre5ZbfexJpgPseOEaFEVolfh82wI0P1qGm3cjrCPyNavWM3f13b5vYolSZUQee7yJ1BujcK8KfzrH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS1PR01MB9059.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 13:21:30 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 13:21:29 +0000
Date: Fri, 30 Aug 2024 15:21:28 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] systemd: Remove permission/owner changes of
 /u/s/polkit-1/rules.d
Message-ID: <585c1f3ec08294dda665cb130d63e6ae4f8a84ce.1725024087.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS1PR01MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: c577defa-9ef2-4abe-ec06-08dcc8f6a8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VqqodWn96pMdIPED3P30EK8eC6SzIvMh0sbj257WQsv7zhRlsDKOGBe3HsFS?=
 =?us-ascii?Q?liTCn1lYydrZb2mDIU8MIEq8Hd6PLWnfj4Tj9CCxoq7B1kNQcTvvqgAsI10/?=
 =?us-ascii?Q?RLIx7gQtQHjBI3oBNXGlmh6NChYXEUGT8Moo3BQp9f/vgMsBsF0XWRUUhP62?=
 =?us-ascii?Q?cM+wRE39wy5RKrLfaJAcohWc9f6oN/bb9QMvoL+/5u6+UKIyOJW6PzcF/6yB?=
 =?us-ascii?Q?G17SyQPN1n2CAQFHrEHqkoMWTHgCzJFVmX7V8VZfUV3S+lU+e7Bk9N5R2Ol6?=
 =?us-ascii?Q?z4NmdIBUJlMqgYqrLiWA162ACb8Cimvu6JhtffoCzP94JpLYyRX93T6FKPzz?=
 =?us-ascii?Q?b3p5iJJb58L8nkAhGTnFrIrdUL0d5FUCe2SRMTFcWvr6orc9uNpMcHalG992?=
 =?us-ascii?Q?+45M68dWMd38Gdyw/lcsDO0tHZbW5MkhzHd5VZ101b5+WCq/qhy95DE3cKMo?=
 =?us-ascii?Q?MuA2Juvn5MPQQ57k5J7oyfSm7Nee+XVgdtPd7k6H3OF2FVJVa6SUUB1mcPJ3?=
 =?us-ascii?Q?ftENXGWYMo4Ep3OKnWZEh1Fi/u7noQROSANmRcsN6cKVeqrMz9r/MCMaXl27?=
 =?us-ascii?Q?ZI+N7WzfnJ5ppikSk2qIJbXgjlBDYVpkI8brYL0WeK4Trqrsaa7Uv1+3aJuw?=
 =?us-ascii?Q?D+QfehZOqgrkZGuUa2eTxja5LhkSvDip3lQwhlY3KbjkyRUM9HtMMHK8jr2B?=
 =?us-ascii?Q?VWpxnVwA/UK05fl7bk3PPQFWLgOS75v0gD5yRdsUd2lv4DaD/d4rq++nojHq?=
 =?us-ascii?Q?8sFMLsqGo1K63nrI9GSBM1k34zVEZX7N4ra5dGSgObnOXJiC/7E4//yE29O7?=
 =?us-ascii?Q?0vRhDW6mXQqvYhaisjgLt7HTHK/82WswEoeYRB/uKuY+esJ9VjMnnbAw2OLk?=
 =?us-ascii?Q?5IBOhltxaOJyr/VXIiX5kglcBVYz1OT2S1gZw5/UrZPLR/SOzhdpWKjfO98u?=
 =?us-ascii?Q?yX8v07hpdJ0Da5NuNDFnYhcrAxH6ikzuXBBOGUcRVt+QQn+SVjL02TKC+kOT?=
 =?us-ascii?Q?0Q4AIo/fdQrl01/zaRe9KGWnjlh2tL8uaEXvFyoQtRf5vmUHdpxGIXg/HFPZ?=
 =?us-ascii?Q?eeWytJaawu2FPQoqLP5pm4XtXL9FaPt6gVn+j6HvpWeogSF07kua9HdIUODx?=
 =?us-ascii?Q?dgdrIS4ETxps/aFTm3Y0pKJ6pITjT2SRZF1NWSOtpV51Kl4XBChLGqYBB/MW?=
 =?us-ascii?Q?FzxVu0+HwOQ8o/3goOVSlYm5eCBodsz4zfUv3o6VFyzT+7j76mfT9+sAAUn+?=
 =?us-ascii?Q?/KSyrTYIfn5b7f+fBve2Vc9pSZx89guh3yRfxtSjMXmy8fuEbjkb4Dz31ZzI?=
 =?us-ascii?Q?AnCwDVga2UV26HKx17wdnaBLpKKS9rcXtkj8m3KnMHiO8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K5ACquQBSEntZ9dG9yX298WPxiSlLWNMOhi9HinLFKOGzUbnB2c9ZssPYZMX?=
 =?us-ascii?Q?7/aY1SYyAYqZxIYnvbZB1GY1ubo2qJ+UrnKRuoCjCUL7WysPrMlWwtI9NROV?=
 =?us-ascii?Q?/KPXOE8sEOmyDWC0WGun75nhhyDAIBImqUqO9E+0+fwmG9sGadiA/+uK9WIh?=
 =?us-ascii?Q?qvhEw4kQx32r0Uu2SWZON/6HaYwMFlCPxhtDGD0IiqJodrWL63rhGtyVSzz6?=
 =?us-ascii?Q?pRrMYu56Jn8yyx74hIZ1RI2FkCe/dqhaIyEPXStL+NKzw4ULhdglo9WelncK?=
 =?us-ascii?Q?/7zx+MMKEwe/6PF7olq15htjVXADgWcFsaT4kQShto6uBqMa0yh4H4mjH24h?=
 =?us-ascii?Q?a0K674ReMZdBKBIDjXn/v6mLszmctqqiuKSQFE7Kp9iEwm2ETyBW4jNlJT28?=
 =?us-ascii?Q?QTfF/A7bUUr90joDaUTMLuNhlf0zwlqhh8DIZco2K3PixT5oYxnl3DuDYRcT?=
 =?us-ascii?Q?yxzpiWAhxKitBXTD7X/WrIU5sCV7KVp9UpFNDG26w/cH3BGWZk/DoXSDMNoS?=
 =?us-ascii?Q?MVkklHuHvc4Ty8MHliDaMoM4XQYC/h1RqpTmrRvE4QodV1Qq5fa86PLuaa5e?=
 =?us-ascii?Q?HuGsdoIoCvv4KSpE0VsPy2ImdHfiUSHMRQ9yX9uA8XdNFw32fQNoehl9TtY7?=
 =?us-ascii?Q?zGMtCsa8uPk6T0PIQQESfX7ItuRz3ertZvh8bfjNutc7n6iCb4DEK3VjoTcD?=
 =?us-ascii?Q?sMyWfkRxBYqCYjyaZLTtBwQM5HMwrfGXmd5bbUQm9tX/VKSjrAE0sYSFW6cc?=
 =?us-ascii?Q?H7JVT4ccsg2MAQZxzMjVB+E5+ByMwO86ghG+uRga6ZKyESGxC83b3VN+0HyW?=
 =?us-ascii?Q?i2cBaqXBvW51l+GL742SGAy0MCRVnglO7PvHp5i5KjwunzieFcIsWQifieHG?=
 =?us-ascii?Q?DSkamjmJFYfJbNAoktmPXVcQQIEHs347TMrPakWQ/0bYxuG4Qx0X7f8ecOHV?=
 =?us-ascii?Q?UlDbPESbW+LC8h9dBpll5d3iTvvllPSshekCfiasGGr2VKgdJnnnVfNS0Eqp?=
 =?us-ascii?Q?7IbFP4uUmMX0n9s4jzFL52eNXh1exVW0KXndCu7LFHBSFuTSVdpFv6GiQQ0t?=
 =?us-ascii?Q?/0ZYRNtFTUG8jAU6kEJErm06D2IOB/RzmUkex2S+BBY2yE/cIpE4R1Ri7Cu4?=
 =?us-ascii?Q?a72olcgVyu3I0GPdPARAm5YqmGcfi98Xqv9SD9/DH21aPcpLmKJKB8s6I34k?=
 =?us-ascii?Q?AWFCJJNYyE0jUm77t/xwgl48Nhzcq2VaVGnZVg5RkWnFcSCGARB9bYIUtm/g?=
 =?us-ascii?Q?pscGbO/JaOL1UR4S3DzBo4yOvWmIN/RsfeVbNJqIqe9i9jn6i4c5XIewg0Sn?=
 =?us-ascii?Q?arWoacgj4/uG1M61ebVj9oUqlXaiIaFMFIQHrRaoZnAIZnGHjsslmtdB9ChV?=
 =?us-ascii?Q?WPGuAC6AH6sQrO6ZEh1mqCcvojrRw8eDZcB5x3jDKpFz225t2IOP3cApQXcM?=
 =?us-ascii?Q?LlD92TsT974+K2t/onBOkbzEyev8Y/NKkce7YqllOtDb2yAH5cMMoyZmMFvW?=
 =?us-ascii?Q?gMKwsE3FRMjnMP0ADJr4dq+hcfDU0MrW0fUpt2zlsnGguXz9qjfIHvVPmvp8?=
 =?us-ascii?Q?Jt3SykFRN865UgvSe7m3s61ELsBf4uzzyLIRwOGATXTpqrlq5AyeMdknLqaG?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c577defa-9ef2-4abe-ec06-08dcc8f6a8b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 13:21:29.8977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNOU+dtYm05taVa6fcL7MkgkW/Lp/n4T2bankvqNoc3rFDnB7Rx6triZgkS37DChLufblFjRFs7H816xiSTC4OfxFd3VT0jMHU3MtpNb+oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 13:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203967

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This reverts "systemd: Fix rootfs transaction error when PACKAGECONFIG has
polkit" [1], because the opposite situation came true. When building with

```
INIT_MANAGER =3D "systemd"
DISTRO_FEATURES:append =3D " polkit usrmerge"
IMAGE_INSTALL:append =3D " polkit"
```

the build fails with

```
Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of =
polkit-125-r0.core2_64 and systemd-1:256.5-r0.core2_64
```

Looking at the rpms you can see the mismatch:

```
% rpm2archive - <build/tmp/deploy/rpm/core2_64/systemd-256.5-r0.core2_64.rp=
m |tar vtz ./usr/share/polkit-1/rules.d
drwx------ polkitd/root      0 2024-08-15 22:46 ./usr/share/polkit-1/rules.=
d/
-rw-r--r-- root/root       527 2024-08-15 22:46 ./usr/share/polkit-1/rules.=
d/systemd-networkd.rules
% rpm2archive - <build/tmp/deploy/rpm/core2_64/polkit-125-r0.core2_64.rpm |=
tar vtz ./usr/share/polkit-1/rules.d
drwxr-xr-x root/root         0 2024-08-08 15:12 ./usr/share/polkit-1/rules.=
d/
-rw-r--r-- root/root       326 2024-08-08 15:12 ./usr/share/polkit-1/rules.=
d/50-default.rules
```

[1] 086ef2e5959ba3b6032a0c704e079f7eeadd1f25.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core=
/systemd/systemd_256.5.bb
index 1485614c71..9d2b06472c 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -368,14 +368,6 @@ do_install() {
 		rm -r ${D}${sysconfdir}/X11
 	fi
=20
-	# If polkit is setup fixup permissions and ownership
-	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; =
then
-		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-			chmod 700 ${D}${datadir}/polkit-1/rules.d
-			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-		fi
-	fi
-
 	# If polkit is not available and a fallback was requested, install a drop=
-in that allows networkd to
 	# request hostname changes via DBUS without elevating its privileges
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'tr=
ue', 'false', d)}; then
--=20
2.34.1


