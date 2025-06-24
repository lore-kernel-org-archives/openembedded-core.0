Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3562AC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:14:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4148.1750756463877841019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 02:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8270fd7385=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5vccs029118
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:14:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2jwjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:14:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9Yz82bl0+6ANiMtFy+cv3Mgc8r0IHHW1qsscxOIn5MXGVJaVC22XEBAWg/77z0oxIvLdCcB08wZkztB6l88u4jyYQABUzdQs24yDKMHrS1IIG5Baz0v98geB1TUXPvzF0AhvBSCMeErN70R+q9paPGBQZUpsQSz66frQucfnUJFxe6w5bs0UVKryFZb1zu1eYDvjr8bS+Ehm7AMP+DoZCApl+Ron0jfDMgsVkJgdpeKwMTgzdqKt/Z6s6EMh+DvY5R1/kcAa04DQtqShlcxX/y7glYTlUGMIrQfFxnskUSmnqRwEFOH5GyS/+XEg7eyYdRicARiNqv7iqFJKZC5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44vXIUPEyRTITE7D+jIKO8uf6tyA9RBSXgVO/KfaqeA=;
 b=SK3uqjrPMLl6eRIp3wdaj9Je023n+GmxGRQG3UBgxx89q0JEglfztO8En/Bg2acixy0+LeuYdgTOSOXdyTgHcjRdYCyhYe9PwV+ESwKdPNlyRvESxdRslWJpVg8731UhiMYDMEY6byvhg7LI96PWFLtOViiuuN1M3qeQnXSrATx/ylxE/BS4oiYKFloc9HhbZapquiwPSTJkHnZobWb9EWpwUkrnZseezhPUrg1CrLh8VbZ30C8Ulp2MWFWYrH3EyPRevH+DEiCD6xKocb17Y1kmROsscGBm71Z8WRMCGopUbUFXXek+dCScb2HLty6ZVdcqIi7c3Rw9wGV73J4Xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 09:14:19 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 09:14:19 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 1/3] rust: Drop obsolete rust-lld and extended tools dependencies
Date: Tue, 24 Jun 2025 02:14:00 -0700
Message-ID: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a66afae-6084-4dfa-95a1-08ddb2ff8031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LzPe0JLaFxUwH3u1s09l9CDjK2O5VEVSnKObIcguI/rmcsJ4YrGbmUdze+sf?=
 =?us-ascii?Q?UPaI9iANo8xg1ok45waQ0bMGhWlpbfcltq732GhYURjC+c3hJj5m+D+R6+Ad?=
 =?us-ascii?Q?IQ2cJW4/6eJDhI0F+yJpDJjDrOO4HwQ6TRSqM/IzvWSEG/jkJz1nCr2ujl04?=
 =?us-ascii?Q?B5h5ORRlT2wgf7WNQKFPGy6PyMfawT/lg1N3I7/Pvucbdm7u+jSh+aSqo3DL?=
 =?us-ascii?Q?NBrANckeVR2COQ1yRXwTCm6h7a+rEypd657mkz+F972TJZ+WJMahH1Qxwet6?=
 =?us-ascii?Q?KNo+DWaAWJVKC1KvGpOp0KN9wu6K0K7yGGZbNuwyiOXvToCywIiOrtHTdqta?=
 =?us-ascii?Q?PdWI9jPPQIVDSEVw3HNllaIluIbdVlGbkFbxVVhuDaNf0H+UI1EuhfLbz3MM?=
 =?us-ascii?Q?EEpL6Ryo/PxRXSZ0tay2mSl+UJLfabydikyrN45zYvcEwscPV/dIgNSrJYNL?=
 =?us-ascii?Q?DsoE4WV6DQmxmTb3vZVh1ZzsZ3vW2clBnPAmiONrE6YL7ChdSnH9aS013deR?=
 =?us-ascii?Q?D1bKYRobIhAi9jIXTtb6jeIZaM6UGbNRKqfmKoxdcjO+osUAS6D7qcVybN/E?=
 =?us-ascii?Q?xhdFbD/WLsHQFJrZze3bZ/GsQo+yA67D7FZTesGWJYG10voCApDZN75Z20d8?=
 =?us-ascii?Q?J/oTbTwAUwxbEbGYJLsCabs4Se8A4liERLJoCmY1l8lPP88a86U/eeScSkum?=
 =?us-ascii?Q?aF4HJFWFPJJCn4ITiLV9YHxot7wkTZGTbzhoWh271sXZqx1tM5hNl09pCwim?=
 =?us-ascii?Q?nb/hxOWp5ELbyoo4B1PWHarybayJ179AAi5EUcEAeW5wx4jYZ1tpgx7V3HU4?=
 =?us-ascii?Q?twm5Vb8MSdpBJMIMBi2HE/OQo7Vk08pJ8PbMeuyL2p6S5FG77qtS2ksNtetV?=
 =?us-ascii?Q?ttpTYgOdYN8r+K+b1xnYJLhXatnEIsHzUyHp3CtmlsOvzQd8VKpVNZlbh2aj?=
 =?us-ascii?Q?4aJsHKMNWVhKmQi+rCG8Ak8HkrEGpjUO0Udb1GjD0evCzftwTW2oQ6/98Ddb?=
 =?us-ascii?Q?2xiG4kCtiY2YFK7ho+B67tcEB5zEX5secNbMBEwn6fNaFWyGWbPhxdaGyr2V?=
 =?us-ascii?Q?AqVaLD7VA16trGZOJMrjaM8JaFavqikU/iERVOm9LooQeVUGbOqDRAjq3owH?=
 =?us-ascii?Q?fetJnbYNhz7PFbWZ71eRHYqGfe00OkWbJtm9f39d8yuemk1+AJ9iuiffSGhO?=
 =?us-ascii?Q?eCUUXVRm2ayX8EfCyBR3WnvksF+GeJ/hervWJ9h4F0axU2Er0uOz/FcSg6UN?=
 =?us-ascii?Q?U3ZS+mQHeO978iOBrTVGv83Ijoba3kaFFuuhikJh3rQdk9Tire5bjVwRE83X?=
 =?us-ascii?Q?6y7modIn+YNho994dRalNaZtnZ5u9SKF/V2lRVoW85kl/YQwEjyKraVyz+5Q?=
 =?us-ascii?Q?9TNc/QYHGidd9QXtDVHdUUmkBd4JNKyvLpc6Br+cW3jZXz90DSVkybrgujkG?=
 =?us-ascii?Q?OYSxdxtPn7gX2TrepltXWsDg2A3BfkabZbSidGQwo8mXbew0kpNURg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dnewBNrfQ1cKrHX686TZPDg3WuauTuX/neumZaGmUIs9sUQtPUkTsntAWrsz?=
 =?us-ascii?Q?9CjdU+KF2y8hg4iSR06r6aMyTfMEPshR68QWwiV7dlcUSJEVzXNjF26yGczY?=
 =?us-ascii?Q?p+0+pYQFTgUve+Ro2WkIbbkKnuGjTyNu1tqxR/9xRuZU1sDUTAbyrtLlP5HY?=
 =?us-ascii?Q?DpknvnR9M/PV2mXdpULnoFnZ1hLi7JaqtzruvO3zJDm3rP2gjuf1nHDJtn9B?=
 =?us-ascii?Q?+WvE4JT75NbwYUfSinAVSLhkEQ8GvPPHdILt+Oe2JPz/ZdVQbPMjkw+wIFxD?=
 =?us-ascii?Q?U8Y13P48edB2pMMW2EMX9JJHHlAChavfKG8Z5lCBPishq7sm2elo8iQJ+h95?=
 =?us-ascii?Q?Dx8cEf7iC1Y/Sriqlf2YwDMnuNkCnrI4Dv0UqVjMAqgBXaq/+upg47gFK4Fh?=
 =?us-ascii?Q?2hYhUGc2WQaUUhMPpdiJCWg4dnUwn6HKGtStMvB5JJ2pDR5kxE/lByAjLbuC?=
 =?us-ascii?Q?uWKxOGQGvVIdfM3Pc9o8uheFYYGA9r0BwF4MhBMoW8ssRQBDmJThMgps1FiL?=
 =?us-ascii?Q?SV/KkGNu7DdInDeK3dy1aexGcaEtYMk4On2fAhyySbUeoo2MXB/JSQJsvcGs?=
 =?us-ascii?Q?kV+HVpqDnT+6iAk43yeNKUmJPNe5dX8i0cX999mxklXW178eahCtxWExYRMv?=
 =?us-ascii?Q?3n5TIYWodtsCkPHLE/qpm5CONHUYPXnOWeJlMqgWOEtut2v/cBtLvZCNmo9X?=
 =?us-ascii?Q?rU8VAGajbT/UYzLa1UbaRNVjTrFk3TTtVvPpBs6j7dQJqy4pg/iY9yCfDsEu?=
 =?us-ascii?Q?eJLkAlounmQhmk6ftsYJcuCjAcGPaTFjY6Z/2OjwugK/r0CVwWlgopfvn/3q?=
 =?us-ascii?Q?2kgHzQAfO3knBrCFTfOVKA6fsUNskPN/64X5KWQ/vN0N0v7HwEmHlwGT7u8B?=
 =?us-ascii?Q?UCexUNSjbB7FbiLlrzy6OpY/TW21bxiDlpfN5+Y2nt5ShsixSSiGOI02s6Rd?=
 =?us-ascii?Q?qI1eoPY7ctTJgPjLGBLoHRrMyjmXyVk6LtgsB+fteY2dwsCVFyksPPDB1E2u?=
 =?us-ascii?Q?3EEjXVgJ+mpfjz0O5GyJ+AwpJaeJnliey+BhXy9lw2lRdsUZGU/osPE+xg/7?=
 =?us-ascii?Q?HSHO5TLOLn89+1Ljnqv0n6SdTYIVpiSZJBZFE9QrIRCaXvcmGWIoSrT+qmAe?=
 =?us-ascii?Q?jp6c02VbrAU3I6A8wiHzJtuyUA15HjQblPKq7EQZslO+PDQIG/6V0OMlq1bc?=
 =?us-ascii?Q?ody3Yrl91h7uA35sGLc8tVeKcwLnlFYwW2imd05hAEYsO3xykOIc3AlxhiQ0?=
 =?us-ascii?Q?t7mXDkf2w8MW0v5QaQH+vLMVAIwUW4uGZkee5P00m+1ABAFG0plW1scU/Z6m?=
 =?us-ascii?Q?Jm6lncFqLljRZl9XKH+yFALIPS6+bJUnjs+y86/64qDreqfTknAaUtp3S00y?=
 =?us-ascii?Q?TRmGcIgiNbflssYEEOWzscvKebuXn9lAOUfeJdtwBf5NjxTpS9ajycc/BOr+?=
 =?us-ascii?Q?G0Q6IhMILjnQMMbuI0x2i1C/Yz8Dbr1rNiXv/0Iz7jVTNQ0wp06ggg2RxMY8?=
 =?us-ascii?Q?lg+LGzY2kvv83vvnWCAIulnjIyTSHGl7XkbkDDpm164/U18GtS3g80atSwck?=
 =?us-ascii?Q?6aUpnGZo3lNQ56f3sMRgV41IdF++Um94MtC/Pf03KN0w2yeJUmcduo6NTSCj?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a66afae-6084-4dfa-95a1-08ddb2ff8031
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:14:19.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdgjHWA5KzSeOWOErLxQ/njW47gXtS/Ix5sHFj3i5kpC/tFJL+m49AHi/iYbWXyX6GsRDS/NWcRSzs4joDYC5Xhb1Qh+tRYSEYMxuVwZ2vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3OCBTYWx0ZWRfX0vCNEDGiSKlO IgQWnEW1jd57uofgTgaFFnZY68RNWTXIipT98CXdTtgXtfIfyIK5NxT3o0xp0DYsyDgwGGGEjxz 9TRImamBE0dBJq/Q+MPxK1KBmcue0W0E/kcY+vW1MWQ3PiVHN+TtfwtqclZ+3P2oeivB8Pn66rC
 vFP4yoPmhva03cYGhwI3FOnCxJiyThLuKUJHzTJqmlD8n3Vg8IoCRZuV/UCL36Htp9ertz5d+XS 9vw8YWz3TWP4uTCdscUi38BRa/Q3CLc8X+sV3d/ODx47cMOGioGEQQGSrCuqh6XXM4oW60HZj/D VBBR++SM9Ihe2Ce0d/u/OdKyvtOEWQHTzUpFl37mP1XQOWYeFq+4/9SIIBnh8fmKAin+y90zrfW
 Tl2CB53bwO+CKVwrVFTRJbY2k78D6iPnEXuMdsHkPQSNUFP7GqeJ93a3+N39bgaVQEWSSGpT
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685a6c6e cx=c_pps a=YUS4zuHJQkVrgTdUfwMyaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=w4T9-zdeUMYHahEURgYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DQmODr93YwtLhXwYnuficGwRX-0fEQu5
X-Proofpoint-GUID: DQmODr93YwtLhXwYnuficGwRX-0fEQu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=357 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219235

From: Yash Shinde <Yash.Shinde@windriver.com>

Some dependencies introduced during the v1.86 upgrade
were needed only for rust-lld and certain LLVM extended tools,
not for the Rust compiler itself.

Since rust-lld and the extended tools are now disabled, these
dependencies have become obsolete. Additionally, related tasks
such as packaging zsh files and removing cargo binaries are no longer relevant.
They can be re-enabled later if needed.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.86.0.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-devtools/rust/rust_1.86.0.bb
index c2443fbb15..b13ec116be 100644
--- a/meta/recipes-devtools/rust/rust_1.86.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
 
-DEPENDS += "rust-llvm pkgconfig-native openssl ninja-native"
+DEPENDS += "rust-llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
 DEPENDS:append:class-nativesdk = " cargo-native rust-native"
 
-RDEPENDS:${PN}:append:class-target = " gcc g++ binutils bash"
+RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
 
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
@@ -237,11 +237,10 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-zsh-completion"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
-FILES:${PN}-zsh-completion = "${datadir}/zsh"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -258,10 +257,6 @@ rust_do_install() {
     rust_runx install
 }
 
-rust_do_install:append:class-native () {
-    rm -f ${D}${bindir}/cargo
-}
-
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
-- 
2.49.0


