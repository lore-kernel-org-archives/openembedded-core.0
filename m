Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B790C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:20:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12151.1750846833253672429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8271525806=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9K1nu011839
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:20:32 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqam7aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:20:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnpK8H0BiXb0ycQdKOwZr4abyOVKIouFnvfHtlbptBjiwyaGgyu8Wpz3YYkHT/MxC4MvryqBa06+cq+2uMxgFyPi/40lxn4KFhQcr63I+kJ5OUMhYPDQsZzcrrCLqLVpdiOR61PYqQOObirL+BLfz9aXMkXzaWeh/TKD0izCxanwK4gpxufEU4+u1G987LeCnEbx46W+Hyq/et3RcRdzKZomUs81Ip1Gfxb851R0xR5zu4yG+NM/qCnSkwuyGjBi/z/WsjxH6UosLmTAcfV1IqctmexIDAuvxjvjFNmuGTkuV//aKOJQiFIDGV03x7MghClxNU1zh94wWCn4qtZSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44vXIUPEyRTITE7D+jIKO8uf6tyA9RBSXgVO/KfaqeA=;
 b=nGTx2mt55Mu96GwqUAjaSW8hGrpudLKFJxFsQcqeMKZmTpq3qFOEIbeG2clTCt4U6fHza4TWpJHurC+Gzv12zFN5jYCraURkzuzYUu7v2cywGB8IoAG/f1cJyz3DuMNI6cBvG0in2UbMntpPZWrIMI/VJlKd4juTCYYTGbCs2NNYoQ+O5sY38JHKG38jN07MscmTXZyFZiDk2IEo12i755hqDEP9U4/aWRA2rW9xPLCO7TiZrYa3aavb85F1aO5aBgqVbEc2trPr0mhnM653i86m2s6hFC3pPWikJmWSri/PaMUtCSR2I5x3o69RzKkqUIFfHrLd80+2neZ1bNRFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 10:20:30 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 10:20:29 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] rust: Drop obsolete rust-lld and extended tools dependencies
Date: Wed, 25 Jun 2025 03:20:12 -0700
Message-ID: <20250625102014.1199159-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: c05cbd7b-5ed5-4cf7-e277-08ddb3d1e933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p1hpaA82aoGVlvz4q2R/daFrryiWlCBU6Kx5bOXG+4iIZO7lYoeBJox7kcUp?=
 =?us-ascii?Q?z6sWk5S8yMoTDPBO03SsvZE5HQsFHIFY2BRBXIUtYVkcfYtZej013Bmy7dzu?=
 =?us-ascii?Q?onMzBzCwNJe4YcFc4fynUnS4W2Bsy2WmWNXInXgiinMLJBJoWCmE42lRBcTb?=
 =?us-ascii?Q?71L2+i74H3mPvNCrPqtdiOf/cwiOJpJ8QWygIBrJlh7C8v9TDHyZudDtBEql?=
 =?us-ascii?Q?tTTRLB8y3iZINuCJQQvQHBcOUJUoEN/AMHNShePxm8Sxurs3KsvVwtsw9u+i?=
 =?us-ascii?Q?bp2k4Rjh1ATy0ATMsz1g7Su09fl8c2gibZ86OvWIuPKcvM4RTmhGlUVPyzPa?=
 =?us-ascii?Q?Dor/kH7gA0fBmvM045EkgBIq1yF+9VmFA2FmpSdiZMHSK2bSnuC9+kG4Y8we?=
 =?us-ascii?Q?08Wi03fL/7wDUGSZbtVNA8RbL96m9uM9cd4fIvwAoqoeZJTJbbyXDZxVMgOz?=
 =?us-ascii?Q?RBrQ5Gy0M3fjz5FiC53F3h4tIVrRX0pcdAcVwn/RjNFa0ETkbV+arqnJgVWo?=
 =?us-ascii?Q?ZEETlMElTV4b7HPXvxX7K5oS+wUw/d8MfY51E3N3dKftElVEuJ6KLUmYZX9u?=
 =?us-ascii?Q?DhLlA7nq+sjn0nXk8ll3LKk/rAPDdlRJLD75R+rhXcz6xagBItzAaV3IG76T?=
 =?us-ascii?Q?CXadBxDjEjuJivdPy96yo/mJS9NITXD9Y7ht0gozzYlru4EW6vZiPRVwHxCF?=
 =?us-ascii?Q?u1HKnZTG7k930AoSKj/cBVeRTQqFiyntJjsKztaxyVD+g9ahiDLK6sCczBzY?=
 =?us-ascii?Q?4eRKG+jiHRUaAk8J+rFUGiU7SlS6QL8zy0DQF3s20GrlCbnn0hNY0XIBqwLI?=
 =?us-ascii?Q?B1zqoHi+TTnHYCw1ObD3+ViXgCBd44xtAJUUToVARbxPAXp80bZWchnpiee9?=
 =?us-ascii?Q?z2wkuo4HxeVH3B1fPjlJ5YRJ3o0B2P/K8377ldU9h/oH+irCOFm4RKlQvkXK?=
 =?us-ascii?Q?NHaub18wpYYQ7nSMtL2hLtNZFILeNF0p5zhKqZnFhTJRqJV+nnjLwp7yQy5O?=
 =?us-ascii?Q?hY/PO6RTUvIbCjByLotYjv7h+HzBfX6YCCngCdWYiIi1zK1LCCDfAVWFxpOB?=
 =?us-ascii?Q?S42EqLS8y5TjisJ+VnE281A54zsfXmyMP2rg9b41e8mCsmQ9nO6Wg59Ifw+B?=
 =?us-ascii?Q?EPl+Qy7fearik2w6p98k/MtMdyVUFzPguMpuaHeg9x87fxa13jaW4q2XTDks?=
 =?us-ascii?Q?SEaMiewUVd3yhVu5u8hNmAKFoXCa+z4q4VWLR/Zok+6hoN16HS/DVmwuvLDU?=
 =?us-ascii?Q?tc4rmCSSwGBjyyI7Mb3WpClqZR1WQEQJLO/4OxLYrlFuhhBygJRUFFWOj+bx?=
 =?us-ascii?Q?8joz9xgepgcl3NS+iV2UMzKpg0Kzu0OdwZtk6NrdRgiLYZqQb3wTGvokBN2m?=
 =?us-ascii?Q?wtAQVh4x7S/KZCJxhpsmhcwAmpEJWuQLY3qKoAhWxPW/IcGZUXo78W39RLF3?=
 =?us-ascii?Q?YYtim9rsbTUtbZoD9kyjV67WtjS9ZQ1xGnTscwNIkWHLOmlo8auCSKszpwaQ?=
 =?us-ascii?Q?29W863FU10WTwnk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uS3tZAXGY6bgYZXwisAvxMUn898KQvubQpik2sRFSgAM+VjfTrj1I8JzGsLH?=
 =?us-ascii?Q?bo0Ft56OJ2fTVNBCPABXMM9WCLU1KpHs4uPJ8RE9ctnX15b/uN4H++2Rq2Gk?=
 =?us-ascii?Q?lxNXzUbgVnl3DSvfhX7+YCgpmscQSEtd9/nKzPU+4VAl8xM76VRDlaF2Z6Xw?=
 =?us-ascii?Q?u4W2bkKi+51STDYDTtK7FaxyYR0juAtO5SCihPYRGlyKxQTVYgu8MOIst1lL?=
 =?us-ascii?Q?EULmBUz1PxioVWGZHExYctY/FL19tQwFuaMUDB4FISaVOwaeTVgutvhmKExL?=
 =?us-ascii?Q?EGRd0j+WiUwj3+tcsrLdEXOIu/mFxJTF+sVQhM3hqJQQUt59exVqPoqsAVue?=
 =?us-ascii?Q?L0y2GjVZuWeWGxuLJQwaMJ+4ziYrypcq1e+h19GlgWaRBISnnXHRxpmV9q+q?=
 =?us-ascii?Q?cI4hRn3BQZvEB/du9AxYftMVRXGbMfZSPYU8uCPeV2WsM6ybD+kRPLWNKvcb?=
 =?us-ascii?Q?o8WVWGWbx3WhvQBljmTbNwmQrBUFdB6LDjFr69DK/dTmY0IJp709G21M2Uzf?=
 =?us-ascii?Q?d29MfE75U0BWjrkrctdBaNiMgaKS+8Nce/2F3+DfxMtHMUhoyy+1Eyc2zSY2?=
 =?us-ascii?Q?cXSC5Q7/vNM09dGL4Yqq5bdZJ+HrNi5e3Dk9T0bT/0+gT0E+1pWgxhJGdDpE?=
 =?us-ascii?Q?widLF38u9V+3S1MgxjpcImwSXvi1vQlGCNtvASQkhurtzKm6mRad7LvD8o57?=
 =?us-ascii?Q?xTVvFIs667AQXGBBbhJdYopLoKRntArpOi6ctfhhL0oOjODEcZC7PwQsxqrF?=
 =?us-ascii?Q?Zyt9cWUmWqySPP3y7I1EBCTLrXQK+g3bzOhq1WB35EMxlUiacoA4vbD7QhoP?=
 =?us-ascii?Q?yzuUrISWYuOpbdf6sq9E9w82ni1kYRr7FxoMFvCbc5GzkR9JhfuulG06TaQo?=
 =?us-ascii?Q?Q8ClubxJXiec639fSteWAvC/bKr824gb0BeBi4WNzTHwTRH8raFlhgBoFK51?=
 =?us-ascii?Q?Znm4kDOSWIvYYHAxvVQ8Cw3NrXogzCkmTZ5YFUq9RXLMaoEg65CvPRdqhhk0?=
 =?us-ascii?Q?e3WRSMytC9EPHZRbJ8fy2z4V6aHsWNWNb2kp2HLOkisJLfBqmTvsI/0LHGq3?=
 =?us-ascii?Q?Yeg//6SirbHucg5x7HEVR8MYFeNvHfDKv56F8cBrYpKMhgjtdBAgYuFciYLL?=
 =?us-ascii?Q?Mfz3EKJzGrLFHJF8xLPRGO/eXwliK6WBzLVXpSSglKJkKpPHofviwq2VBwXm?=
 =?us-ascii?Q?tkEbCotbAaAtrDa/7B7aWmKwA8vkGVaMfMnjvITswtaCnhSgOdSzfARJOuvE?=
 =?us-ascii?Q?oFic5KtGCEeVZ1E+H9RgHpdmy9sc2q+WLWyHVNi0sclBHm/G/QgqDjvPYCi3?=
 =?us-ascii?Q?Clj7HU5zBHVX4/m37GObb7uedEA2ILwSCWwvJl1qvAOAgyC3l+k+Y//AuA8S?=
 =?us-ascii?Q?9+PBNVqu6MKS/fx4hdyoG1Iij3NDUFwgbG+7Roa/HzXX3X75Tv2pcbf4SYrK?=
 =?us-ascii?Q?OxoI608GF219vU9xm2PlXpp4yMejCxmSS0kaw/HFJIGJIBy4trQQQrzWguth?=
 =?us-ascii?Q?VGXgQs70K1NfMpsU7ACCORJ6vcAjYaky2LdctJ5aWhxnysmr2vnYhEFK1pA/?=
 =?us-ascii?Q?9WaMIsODiqIjm5PVBIaM/cYXHDh2NXP4upMR4vVS7Z334G8Jqh45naLoiqiM?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05cbd7b-5ed5-4cf7-e277-08ddb3d1e933
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:20:29.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mcb2Zy3UisVa1p3E0kkY8qgIgj+sM30WpkwJfSi/z2z+/Ui/P87jUSPl+pIwXKzqrKe7odZ+67G4wchRq5Y4z+xWGARJSIrUEj0B/qzYDxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
X-Proofpoint-ORIG-GUID: zAWaAhzyTdEwN2bA9eRFXx9shXbTU4PY
X-Proofpoint-GUID: zAWaAhzyTdEwN2bA9eRFXx9shXbTU4PY
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685bcd70 cx=c_pps a=3MeEpWpF8D3yshkpZm6E0g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=w4T9-zdeUMYHahEURgYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NyBTYWx0ZWRfX7xE78aHhU+Fk 8IsVegpsqUvEZ9Gdm4ZDDjp/ukiZx41d75eGA48XSyS9mbzAiG4v8gMNKuu7xJfeueyEKHi7sqL 7xyqwMGzG5NG789aFiprMornKcehcbVM25YdLYYx2FrnyB/t2Kv2CISO9Vd/EqQvLpgWieLPDjA
 iGyLhHfT26ISkCtibEM956c0VBBb+NMPQQbWOlB0YqiMsuJTpmGd7oxd9q5GzSWP8C003qhf18w vOnX1mlYLQQBc9Vi3DvE8beScA/EY/itH0nPRGRBllxu6Hmyb/nqlY9fMW0JpUppmtmMh9DPDKJ +i+0ECQZ99tqo1p0EqMZL1lxjP63bxI4nGEQt0+aRplUH+ucahn8Cf//UtYSFvN/lD4Y9QJekTU
 F6PU6nCFq/P5w8wWb2r9UERcTqLtvj7DJLZprq4J769EENZ4YQGflHNsYsgZo2LGfv4/qDKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=356 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219309

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


