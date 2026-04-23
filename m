Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAACF589B0
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:39:45 +0000 (UTC)
Received: from mx-relay31-hz12-if1.hornetsecurity.com (mx-relay31-hz12-if1.hornetsecurity.com [94.100.139.231])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18355.1776947976243655370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Aw29+07z;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.231, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate31-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.72.109, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WI6fy0ms9Nw8jI8nXWBzQmi4fOVTDeTExcORrHEQe24=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1776947973;
 b=iYJsRUrKkga9v9dJgpgcrarX1sT/G3wlStAH9OrJFIliJEgDuJeT/EqtRvw7aVIybMkFR5Xb
 0VPiIVzPDTE1ENMvpniwe/7Rr32z1mVCW/0uKv6FlDW0UbJq0bugSQIfi/BowEM60RrgGICcVk8
 rQ7Wf29iDjgpGRR/c8ZbBqlYxZCbRxlI8iyFcupAekM75o3VFHRWGE++XS2dT1Y1ihba66LWYzs
 8WIwj3UrZPIzoZHqwY63PMwGZQN9u8pYQ06smAGGPI/UD9Ydri9PgI3SogV9BYUa5uhN4T5AfqC
 6n6D4l6Za+jFCK2hzEnzMDZuRLLPrmocJrXblr8aAQAiw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1776947973;
 b=IOeWk1KU+9ImLCPgqXhUTq7iGKEFvqtGwWRfGK2klV98Mv6098SQIcmvHpysYLgOYqUBiow7
 6Mp+vdD24YRzJO0flKhoM0wMFFU7IrQeV3hGTlFVjnBxnz9cbCockkg0/U1IwzzcfNB18srvRR9
 yolLmR2+BnpiVdQX0r9IzW72hVg4E7KpaT+N2Gq99b2D1f9DYaqVgyQiD8wMwP8gih9DkQAhCsu
 uNpNWMee/NYNfQZfHchpWmaQHAU09cjRuItcimytvtYYk9zBM5ObfZ/Nuwjiu0dto6DN9eSU4OO
 ETaiqa9/52tYz2Mf0551zEytCw1MS2AgWFaDGq8drQFHw==
Received: from mail-westeuropeazon11023109.outbound.protection.outlook.com ([52.101.72.109]) by mx-gate31-hz12;
 Thu, 23 Apr 2026 14:39:33 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1JpZ4v+nw432zIBKq6w5twW5uI6Tx0/1m1rbD0jAkWloNnxyD7THf24zuIaXmXTIKdTrL0WizsLv+++krcRHaDYG8ONTPBiT9yV7a4XZqCXqQGqlhwMipxGPoq95GW1lKQgK6MmX6kv3Ba2R+i+bfl+UAIbfL1JQb3lZNFSzJ9dHqpWWw/BV1QghNm0Ns6CyMKzJ7UC+ZRCDuxgftpTLYIygBssWCJ+0MBch9DochkN+geJdGUfOvz/yhaYTeqgyVQ3ye6+9BgxkqpZHhcpRoc0bM8Vu+CNDuThkVXH2Zi9wpUPBAWf2Qr2fXHoFAsgaBJpc/sUNxt4vVcHbXYXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI6fy0ms9Nw8jI8nXWBzQmi4fOVTDeTExcORrHEQe24=;
 b=cnOrfTApfqe4HIcISoE/CuIpBjv1jE4F6ie6fyyvMj/Z5DcUWkuL1AyxvOT4OAQKWxeBbT9eJxhUjOnlxofR7bezSOpl26yX1BBhgDHxyr4UgDq+G1RbHNPB4+5ryloyOYQj/OX0SPpx3dJ/ojDWEKug20H8/oGNjG3JhwpIk5fq72Vp/lHrdR0Z2OThNBE+xFVC57XRvo5Dyre318BcRa+zyYs2ZyhwHfnMMug2T2e+ZzdABgtT5d3KR8L5H5ns+rPDcsTPugOJBUM8layQAhXy3pq0DtCp4CEYh5mJvsA+8Zg7OEPbkRxMtXzMe0JWZVhVRVpYc90l8qmSeBdBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI6fy0ms9Nw8jI8nXWBzQmi4fOVTDeTExcORrHEQe24=;
 b=Aw29+07zwFpKLIdu9WCbAeTfmenZ2vfNYRwr7VOFGnURH4m0hYrrO0lBWc/tDcuJX6dYyklA7z6nV1vrSJzAlaq7HcxZ+SmOghWS0b5uDU4QeSOISxPzXohZpPZZvE1Tw7ekM8u2P/8JJhX429Ev2KuJIEA9+V5E2W8MX1MMdTz0q/opdkzSDXG3Zvc+B0+mZIyuOgQSYZuVgeb8Rs8n92790s4nvU1UQk9cZkk6+lTmfq+LgqXbrrUfIeGvIvTe2WgiQqsGuFmWUOnXW1f2his6hecrOZaGj6Im+rSxsw19CLvNNwFmdlFL9izCiYwY5sm5JHTq9EZXfi+ALXJCxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB9P192MB1563.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:33b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18; Thu, 23 Apr 2026 12:39:25 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9818.032; Thu, 23 Apr 2026
 12:39:25 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 1/3] expat: patch CVE-2026-32776
Date: Thu, 23 Apr 2026 14:37:05 +0200
Message-ID: <20260423123854.388088-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB9P192MB1563:EE_
X-MS-Office365-Filtering-Correlation-Id: b96e5647-4a74-43d6-d920-08dea1355a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|10070799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BkWTEB27etXnlvs1BMIaLSAt0cVxwHXypsNg1MrJAW9dU9tBOwR54czRTAY2ImvaM8VuKthothuTYTxLZ6Nt7LvUILRyayneh0sgahJQGFDznF3ruhiZ62YMvZ5orR3DTQMVx5d8Z0jy0aV6ZZvvEZS7Oxf524u6Ntvt/1aogv9l3DAzro2U5GvUzWzHfLkk/E3hgLxeh2ufHEp1dRg7+x0NVL35cVMkxLisdw4VDpwxjKiZD52DRTsNlVOlW4VhVe9ebl/MNHuqfqhBORHNhn6C3TiAVnVImsZPGa0+OKJBQklUXHb4WR6FCn1QMbPtQ+O3dj576QMUDmraK3k3q4KwYn6wkcdi9yDKEQCFWvf+1ZhVFIZDV7NYA47d0MxoUH3s0LMoVz0MI9xX3eQ8H3rr3/B7p5WFHU3a9gDIT9lqrTM5g8AdCh75GSCsTYeFGumQnbpgYLl0xAuYpje7Yhj6LFgm2XdIngE+e4doemoy8Vxdi8dthlTDoAotnGydUMTnzP1Uez07aYcrljMFmp4hIQykcEHShU1mvxX6t/QTNMi8ETxDZ+7ZYtegSP6+OjnTmhQxeHjc4TFGV0R6GoOiWEZMdeRbl0a1mW8F8ok4ZMbChKMnlf8QkmMc5qTt78qcun1abXXjayKAmJ+UeRZkYso5oQr1MkFCG2TBrCzfyIAOAZaf/K/Wpl5i3iwt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(10070799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kt4nzpYviBVOImZX9GrgYfajYYKvgzwZnpVffqicvqXA7d1CNoUdWXHqHpwU?=
 =?us-ascii?Q?AcSw5R6W3IfivUdVpJYEyLsS/5mJBYKqXMEhejz2LpuaCkl8fBigodOtAEej?=
 =?us-ascii?Q?ZOWEnfFmMPX/ClL7/TmcvaDPbnY4JYxQMG5zXLPQ+qmMy107LxnZB3vMMSKn?=
 =?us-ascii?Q?Vy8oqA7G8ndmfwzmHmTW326OLgC2yCQ3ukbQnf5WpJ9xfSMaLZROwkR2JcFB?=
 =?us-ascii?Q?rbFbaxk1YwTk10hX0BzXI8+/xto+tI80ISrJsOtyNXtqSyXOUC4Y40u8Z6+6?=
 =?us-ascii?Q?k3Fvhgi1WIblAh1EYhWE8arVRKorcsKrHkt48YX0AeDufFythc7oMZn3nsWh?=
 =?us-ascii?Q?gAcrXFPcVcVPHGEq6bO9n01LnmB+E0gOPiQZ1rglirCPZMHMhQB4vxN+SCbY?=
 =?us-ascii?Q?fc09mL7heoRQw2OFOM/9ifp5nkbaScIb6zOOMJp4TIDgD4imtUtIMWKk9va9?=
 =?us-ascii?Q?B2/j0p1LX7juv0Pcs+sSLYRoxCKxgiHMAfN4BDdCpooRca/55V4KULMfiRFK?=
 =?us-ascii?Q?SWhCy+hEOagkhuyW9oTJE0iYL6yW3vL8tArlLsZhe4gGkLlHPM4v8DYMPAfw?=
 =?us-ascii?Q?KJfjWwBr3f9MW65PERiNKozjdKOYnVZuMNUj1rZmQsBjRiLi8AnFZTQxWs7k?=
 =?us-ascii?Q?xV9LejwgGcHlo2dmsVwzx+U+dtD4PvU+I7qY59x/Cz9HuTkcyKBOGQoJU8+R?=
 =?us-ascii?Q?zJEUsuQSJA/9BYxyRC0eSuXmjTB+N/+ZqeXhG2ocbKvueOPw+zCJOca7feaf?=
 =?us-ascii?Q?6eROR+A3Ybp8ZxACBJD8tFNncAqROYL2T1Ae4Vxh4fYWHvY4uA0dUw1Ofl61?=
 =?us-ascii?Q?NW4DlmnMhTGHCwusS7Rnv5QNyT/sOs5Nf5YS/mA/oJDJrrqoAf0ZE4HpEnza?=
 =?us-ascii?Q?FkAFsgZQv39gJ+HHuJiYdX4HaFMeyH6koOUKjwFuCu938qf+c1Ipk4gC4yb0?=
 =?us-ascii?Q?U2cE9+S7fW8cZdiUcJc9rJ0y/4kkpYE+xOJ6QftHe75SgetmkvbCl8bbHQz9?=
 =?us-ascii?Q?x/RilaAym7GevQ6GONFqkTwunDp+Ro8UZIhMSrJgPfwLhWlh6l88MoJSpNUf?=
 =?us-ascii?Q?jyXEcSDod5GtI1zKqWLhLezQzebqTQzBXn5rPcm4H/L9BAt2JxaIhexOZLyi?=
 =?us-ascii?Q?uoaPL4vkUXzfysGXlFjy26Jq/Hidcf3GV6l3cYq0wqlHV7vdoYDCxiy5tqC/?=
 =?us-ascii?Q?pRWYGmyx6OKgCDwWHlvragoKwITwvI22nIhntoSV1QIUbqDu5VA7ESxFEp4h?=
 =?us-ascii?Q?K0c3BQOcOU236TYsjqPliExTsXg2Wo8am2CnJxuAjOTRCgNCkmDgcQd6ccTy?=
 =?us-ascii?Q?q2zVO8Si0krF/WNkQW7CYUnC8nCrN90AmCo6egwk+257aS9qTnB1Jem6E6GX?=
 =?us-ascii?Q?vV+GbhbLoOVek5ksSdt6frtB87hUDc8nQYYqBjWhtQ+LQf4bNKaO1eRSSxcl?=
 =?us-ascii?Q?4V8kiHYuaT0jFMtdWHU2EB8l5aGcMLNLE5QZBdu5Ami1HgTFgHSmXm6GRAhb?=
 =?us-ascii?Q?tUOAs5ZYKvYn3V+O+zMXgQOMhlfyFTJaO/BmefnH/RRVZTP15ioagXawf1bB?=
 =?us-ascii?Q?mhBjobDGos4O7n9q27ykF7xrmW7csxTmHC9wOzmlGzHuB+55rK6X4uc8O0aY?=
 =?us-ascii?Q?H321VG9lAs0USFWmRo+9YnLS96cq84pl7y3F32alpYYa38PoLVJ53KnjO6yA?=
 =?us-ascii?Q?5xv4bdUEt4gZsbAFTHk4FRNhGJe5j55pudYVxewsGv4yYjAiqhUo9h/zNXKh?=
 =?us-ascii?Q?2Huh3pucGjIzRFlZ0YMfAAKln8/eB6nhmDgSpAH33no/QzkC/o1eo4wQNIY0?=
X-MS-Exchange-AntiSpam-MessageData-1: TG7/52lXGod50Q==
X-Exchange-RoutingPolicyChecked: 
	JvmgtRM7sCt4igBUp3zyeiVAAAY0ew0p35T0aFFDt/1NAwAM65BzFWqV+OUhmZ/crwf73yh86/8VBvp/4yVZ5uK3VNFAZuY4H/5xaSqWFPO6HVnNuztCkTGBHGHU49GUHI073TsBQhNEsvwXCca1tWbHXaUNTefth51nD9LEEFA/rZByrByRv6TkGmSnZGNF9c8tAlCxp+g01nVGi5KhNZ1RqPUcS+yH6CDQXE0frpWnchYnLPISeMy36rmSjqBOP6v0rs4tTm6XT+jt17KO+CxT5zqRsxPP+St+Wv4/7K3o1NM6oOTTvLXNtl5FI2qnaGT1ebB4rCmTAVsTfJIqEg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yuXuEKpD5HbLxFlzayuukWGUMA+1xdNMbHv0BBawFnr050XFJwuB0OI8RGn89aHCTCoV8Y2RqSfg28Lk+ak7gAxC4NaKP3T0SneN2poTN4KnR/OlLkPr9cpgmmYggkVp/2kuRvpXt8sPawx/8yuzN34W0NYcKEvWW+w9aBVHjSMqu1RBsyg0JDS88rAYK3TXDphxLkVrAtAKLIRboYvmEd1MeAESGx/KRBQev1OSbfk/JRGrBPoqzkTAwpPiOrZWFk/80q7uesIny1/9PrGqdYW9UD7gGGUCx6y/PszbaQJhPoNurg7C/jKSWfC7aZG8eRzhsOWWdSPD99KiKwFgRkLyJyM2kk1/aGnvQQfxpDPK4yE1Uc6ysOf+ubudqOJJFQynRYEhOHkdg/QJaRYpGdF+wqCkhiOZPHhnPQOjSCQdxXB3K3dMvCjtBfXxxMz0Kq7LgNlgnjynJr2LoQjFpS0369aMDAk2rtbDaSzB/I3tSwkPfmgMg5lXXS7MTj+fI2ZUNMdNKjXmQ0s+UD/FP4PBDe+Zr/CTh6fvGBaSaDYdho8vtyE0K10vocjxsrlyrP+d9hhBDNjl8qkQW7OTa/YdA4A19w8JtAQhWBp1MI3C/ZqSdJ9vslrw/6XhUlRB
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96e5647-4a74-43d6-d920-08dea1355a3c
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:39:25.3779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKdSfdqkkphmHqRCd2ZIeGXUT/0N4vIhN1RE87yr9vnh9efwtDRwE4fY8FpVhm+IrecPjozOzgfV1+uM4clxdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1563
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate31-hz12 with 4g1bJK2YdNz2TWxh
X-cloud-security-connect: mail-westeuropeazon11023109.outbound.protection.outlook.com[52.101.72.109], TLS=1, IP=52.101.72.109
X-cloud-security-Digest: b498b17ca388eeee1db3f33ca5e631df
X-cloud-security: scantime:1.461
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235763

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1158
[2] https://security-tracker.debian.org/tracker/CVE-2026-32776

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-32776.patch          | 91 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32776.patch b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
new file mode 100644
index 0000000000..96a869a7c8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
@@ -0,0 +1,91 @@
+From 3340f971f2f92e499adf03156024105bb9bb7ed9 Mon Sep 17 00:00:00 2001
+From: Francesco Bertolaccini <francesco.bertolaccini@trailofbits.com>
+Date: Tue, 3 Mar 2026 16:41:43 +0100
+Subject: [PATCH] Fix NULL function-pointer dereference for empty external
+ parameter entities
+
+When an external parameter entity with empty text is referenced inside
+an entity declaration value, the sub-parser created to handle it receives
+0 bytes of input.  Processing enters entityValueInitProcessor which calls
+storeEntityValue() with the parser's encoding; since no bytes were ever
+processed, encoding detection has not yet occurred and the encoding is
+still the initial probing encoding set up by XmlInitEncoding().  That
+encoding only populates scanners[] (for prolog and content), not
+literalScanners[].  XmlEntityValueTok() calls through
+literalScanners[XML_ENTITY_VALUE_LITERAL] which is NULL, causing a
+SEGV.
+
+Skip the tokenization loop entirely when entityTextPtr >= entityTextEnd,
+and initialize the `next` pointer before the early exit so that callers
+(callStoreEntityValue) receive a valid value through nextPtr.
+
+CVE: CVE-2026-32776
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c]
+
+(cherry picked from commit 5be25657583ea91b09025c858b4785834c20f59c)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/xmlparse.c      |  9 ++++++++-
+ tests/basic_tests.c | 19 +++++++++++++++++++
+ 2 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index aa5e91e4..56faf2eb 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6777,7 +6777,14 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+       return XML_ERROR_NO_MEMORY;
+   }
+ 
+-  const char *next;
++  const char *next = entityTextPtr;
++
++  /* Nothing to tokenize. */
++  if (entityTextPtr >= entityTextEnd) {
++    result = XML_ERROR_NONE;
++    goto endEntityValue;
++  }
++
+   for (;;) {
+     next
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 2a5e43d6..023d9ce4 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -6210,6 +6210,24 @@ START_TEST(test_varying_buffer_fills) {
+ }
+ END_TEST
+ 
++START_TEST(test_empty_ext_param_entity_in_value) {
++  const char *text = "<!DOCTYPE r SYSTEM \"ext.dtd\"><r/>";
++  ExtOption options[] = {
++      {XCS("ext.dtd"), "<!ENTITY % pe SYSTEM \"empty\">"
++                       "<!ENTITY ge \"%pe;\">"},
++      {XCS("empty"), ""},
++      {NULL, NULL},
++  };
++
++  XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(g_parser, external_entity_optioner);
++  XML_SetUserData(g_parser, options);
++  if (_XML_Parse_SINGLE_BYTES(g_parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(g_parser);
++}
++END_TEST
++
+ void
+ make_basic_test_case(Suite *s) {
+   TCase *tc_basic = tcase_create("basic tests");
+@@ -6456,6 +6474,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_element_abort);
+   tcase_add_test__ifdef_xml_dtd(tc_basic,
+                                 test_pool_integrity_with_unfinished_attr);
++  tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_ext_param_entity_in_value);
+   tcase_add_test__if_xml_ge(tc_basic, test_entity_ref_no_elements);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_entity);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_attribute_entity);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 048093f010..631aebe6ca 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-25210-01.patch \
            file://CVE-2026-25210-02.patch \
            file://CVE-2026-25210-03.patch \
+           file://CVE-2026-32776.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


