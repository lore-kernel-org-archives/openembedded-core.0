Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AF6C982F6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:45:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46445.1789987530237440297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=voXhc1WR;
 spf=pass (domain: est.tech, ip: 40.107.130.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xc3A5GonhxKLcJK3JX0e2/6azrk3TjVASShGCXpYwCON4TFQp7GOCB0WSiMJvh56YoXWLWGRsmpMXQspZsZefipmel6fwRLmjg9dnK0NRYJ/kkGNPu20t3+ej5kA6IkTrsoypyKRoUoDPBcOsVg0Fkbt8kYip4bgrvStEzAiY4PUUXlEEF/wpNm5B1OsqgJG3BpLcpbFGee88ED/rJOZWME7nFZ5AtrvdqxwWQD1wwxx7Xnqz5WLESwSnfOtJAbVHMAagJG9QdUJTlZzdiD32Fo7YEn6t2T1qRbAiAG3KyQ0abZerq7AmRYPAbxhd4u8x/wX+AosM87N/ZGT5yW2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfmYM0wHkSIk3txbAAFbYuYIWQBpltxfD6BSjzfPZAY=;
 b=mGevg9ZAGg61yy2mo9I4eYGqG0wfTb+JuxL2PUXVzL4fEF7u9CoBJPgWQN8M1mRHAxDoaVu2zzO89n8u2AvEhz2uaUpKbCU2540OnTDgVDd8F+EkDRk4VtVEEXJI/W394nAbavIB2Pwu5FeZAJ3X9wxJB2rQela4x8z7sr+DukZupYvkVyTqHKbaLgF3v0HVZZ3fmsZskNgVaNsW4imAzIZATShd4uT/H6u6wRv05tLkiZPEbOyU0KC8dkWelcwNkTK/KolGAw6ur0Fc6+9iUj4Dbry3uKFtOT5jnlDhyAjZlu5kVxhhutkNl1vqDC63/r03MHR1JxGcxLusNS3EKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfmYM0wHkSIk3txbAAFbYuYIWQBpltxfD6BSjzfPZAY=;
 b=voXhc1WR9N23MoNNj0miMhns4J0j7KH94ifB33hS4GVqMse7D3mMLSyrAWffa2EL1IYN/LId/SlOVhVQX4eJl4k60xC6o1RKVgq757axjmJjwUFGiX29EIPIuErB7vY0Fe6QnRgT+0qF8PMEZUxMxgzKmYW1c+AihgsrdtV2MZWHl6TSRmChHybUaHHNH8v2kEa2vr1CKEYFDbBaOom1CNslayWgqrQIPJKs/xMVlDx4rx93YaFCbsfSre2og/zpuK6Efh24OsCwe2GVfkZXbbYPkTXCMkkz6N15iMphH8OxYtEF6dg/hzrR4wqwhK5ZM/SglZyeB24wC2criQn80g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3532.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:45:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 10:45:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemd: dlopen-deps: only warn for missing required providers
Date: Mon, 21 Sep 2026 12:45:19 +0200
Message-ID: <20260921104520.47933-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBB9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6f3) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8c01b1-39e8-47df-3dab-08df17cd71ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Nu8PNXM5qaeOOYM7lDeS16QKXoT41ZvCmPBNLyKX4E3Z56ytelRd3ZsjhcEcTguvFh98QPmaPPq7padkf7Tx+RRhkjGVeeq5dvpNtKlh58bHtASJc8Dml7IP3UA4bDwiEOMdL4zd8064hw5ztpPhSOUMa5wu432JNyCJknhhkqVnLzJOCqrjErGDHVu9/sljUNKfEIwvMRnX/+SiLblVz51NI7uBdF/a0i4YPz7ppXOTRaKEk9eQ5ANXlSGf0rwZymr5t8vupSRCrMuUAs75102DZWljvnpn2GpEv4Z0LZtoxc63k81id6nm7QqqOme3SV4Ahq6BXCM8Da/xE4UeJngZtUBBkfgdsf1Nmi+Hk21IeGRgbwtjKn395xseX4IC2rzvXvpfh8B25EtqMhF/SqVHJsQKtcPcyw310ZiBWQiTVeMRLEFhe7SzvVGhbvKSna88+uqzuyy/rIf/4951n73EBN9DlQxKuH0l0n2vMoGIKq8T5G/9yIkRAqPPFf0LnkKuhHvr+XRALQJHqXOOaijFi9v9EkW5Q/QMiAbru7uFaCVHjT/XTAH5jvqAY4FUlByDWy1pS86c1VY3VWNqh/Ur2Litdf+OaU90n/0HWzEIe0RJ6Ngs0UWE0fSqusDYjpc8SxwZwaKmq+5AfYsOH4ZlrAnY8KnkxWlKD2gfF7c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7ePnnB2//P0DSkVkWRKmbaGStHLIfWCC9wwZ9O3q3oKtek/ZmIdtYzKnV7Cq?=
 =?us-ascii?Q?7RgyRJC2YJgmoV12ZqQ5xoR+7rzVP5qnSgMvdIPkS2AipbrHuDlRWkP3aBbg?=
 =?us-ascii?Q?Ey3PexiFwdjGoEx1Fbr5sHTHSq39dIsC+pO8AYsU1XweAJOMbFWx0GZCHQB9?=
 =?us-ascii?Q?nwBY5FUd+X25wGVUJctMTFOGkttXmtm7re8PVHNvN7RW7A9qcwYhMuiFyz+e?=
 =?us-ascii?Q?LIOO0lkoxlJaVOyHnZhPcQI+MWYb56kJmYUl88Fcw21VFhLCRVVWz4jehKH2?=
 =?us-ascii?Q?/4PWKZFd3L3lipHKU0Wnea+3nmfzfepqKWKu+q8uE6n2zk8Er4uxJQ46Mwhc?=
 =?us-ascii?Q?fekdvcxq0yCN37vh8yH1en2P0a5fgM9I9NFWEdAvqfRJpKqdGy3oA+c02res?=
 =?us-ascii?Q?mzwi7xed47ZNR3aR6EIs7PtqDBa7FPr6R9mviP8l4+gw/0K+1V08+daUVjIp?=
 =?us-ascii?Q?Vb3RBnEXT7Dciu3CgJhX0anbSmylrFCRVKQIXHuQ9lh8NA6FRO34ODNEcEbT?=
 =?us-ascii?Q?AByKaMFIqCdt4yAJUYqpIumPduxB57Gjfzs6FKG/4Mzj/HPWVANWxNmC+yH5?=
 =?us-ascii?Q?zC9bL2ezlC4MnsuFTuE0KNBW5SzE6l/hK2iG2nXTcD74PtWM+/jHvFpbmR60?=
 =?us-ascii?Q?2OMD4gA2yb1Y0kFjCNos9NsFRVRQ9Nn/HTZJ0/viNKTnP2Q+MQmsSR1tt2ke?=
 =?us-ascii?Q?EH+YjGvPrIJM2wb6sjKDckZTv2ibzV1h2VDomd7rggmI1JGwz7GlPQRZN5Rp?=
 =?us-ascii?Q?3jp9rEFi/IYpP2Z4wuInxV5Ax39a3UhdH+qkS5o+z8uYX5D6xsalJ/F3KvJw?=
 =?us-ascii?Q?m543hj2jdDZSRH9KfySmWuFWhaaWmwpl24Qw+FI3TzRXFzTSl1uJtn1v2dHn?=
 =?us-ascii?Q?xsJImXugEisI1Biq0YTvL+p3M+m4vn8YG1lHpVZUEX2Vo5eo/PeVlkM5TfE9?=
 =?us-ascii?Q?0VVe0pLLNf0GpAiDDWrxf2THf2fWxDMWb1knK36Gl1bhV7TGMMnE0ET5emDA?=
 =?us-ascii?Q?HoYdCsFY9EcLQ/SnndAbrNAc5k3k8imjs8UcZ0y0PqyM0iRlKSvnbP048OA4?=
 =?us-ascii?Q?ij27A1tXNTB/2gqlMFsOpcja4h9C6Ph3+20Whe23DshjPTMus1g5b0Pz71XE?=
 =?us-ascii?Q?8rsnyOpKQBzK9IuDgvcUn1NE0wJus0D1RlVv7DwfPxVgVAiT+25xWntSHtM2?=
 =?us-ascii?Q?QelpPinKWpiPrIDu1X6BOlGPid9B2o13ay0p0J82g7E58AsObifHccTytQFo?=
 =?us-ascii?Q?FNclswZ0AdjRn8cI+7UmSWBh8s4G6u/xHyMkQgkuI0yhLLorTOfNjdNJEI4L?=
 =?us-ascii?Q?JK3N8zs7sWpDphwTcX19jMjx8uzpdBgcnXwRC8ocwtRw5O/d2Pp32ltFcF0c?=
 =?us-ascii?Q?CddVMlUkvf+dVtIaSouYDWHk6rgvOyU/u2RAoTG88TmR84vHGcMTP9mWoB3L?=
 =?us-ascii?Q?RK1C7R00Io5i8J6DVGNIIJDrk2vr2IVRl7PPCDYkous+aY89DuvHqpB3CbS2?=
 =?us-ascii?Q?EdAiiH2eKMInysX0TFMdKKo8iU2Fxqn7i4j7TDjudkzzjnmmTwm5PKjKOBlc?=
 =?us-ascii?Q?TzC1q6oBnzZ7a0OHExSQlsBYj7DdYRqXgeauXOcn50481lDudTqcLY1o1Glz?=
 =?us-ascii?Q?LLt4mv7mMrNoIPW/amrL6EUMH30+S0LKZmwrywIni+aUErj6lHGRktWgfsF7?=
 =?us-ascii?Q?Nw9Bxztg+bINtCgUcH8ERxY+bpEoao5b1G9yj7aDesR5ILUSXX5nFo4oR61g?=
 =?us-ascii?Q?vww7NWvX1g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8c01b1-39e8-47df-3dab-08df17cd71ba
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:45:25.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9QMY80AdjClwUJWdwPfabsB9sE1l/h7R9uhP0S6DuAW9dUXuiNpiHu4wOuHorFG5UYIo7tMfQhnOKHvD27OktfqhtJibDcWWCvaCI95Q8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246322

package_generate_dlopen_deps() warns whenever it cannot find a provider for
a soname listed in a .note.dlopen segment, regardless of the dependency's
priority. "recommended" and "suggested" entries are optional (they map to
RRECOMMENDS) and legitimately have no provider in some configurations - for
example systemd suggests libintl.so.8, which does not exist on musl, where
the gettext symbols live in libc. This produces spurious warnings on every
musl build.

Only warn for "required" dlopen dependencies; downgrade the missing-provide=
r
message for optional ones to a note.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/=
systemd/dlopen-deps.inc
index 2d43f2dcb8e..15f811de126 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -77,7 +77,17 @@ python package_generate_dlopen_deps() {
                                 found =3D True
                                 break
                         if not found:
-                            bb.warn(f"cannot find any provider for dlopen =
dependency: {dep['soname']}")
+                            # A missing provider only matters for "require=
d" dlopen
+                            # dependencies. "recommended"/"suggested" ones=
 are optional
+                            # (they map to RRECOMMENDS) and legitimately h=
ave no provider
+                            # on some configurations - e.g. systemd sugges=
ts libintl.so.8,
+                            # which does not exist on musl where the gette=
xt symbols live
+                            # in libc. Only warn for required deps; note t=
he rest.
+                            msg =3D f"cannot find any provider for dlopen =
dependency: {dep['soname']}"
+                            if dep["priority"] =3D=3D "required":
+                                bb.warn(msg)
+                            else:
+                                bb.note(msg)
                 except oe.qa.NotELFFileError as e:
                     bb.note(f"Cannot extract ELF notes: {e}")
                     pass

