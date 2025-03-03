Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C3C282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:35:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.56184.1741016118819285136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51574f6b04=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AuqMt001627
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 15:35:18 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s78a90j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB0uSNyHv7nmTCtguYx/eNdNtx/y6e7cDSU0EJ7nPxUWyQYDH9LQ+yVvE89LJZd+lzrhKEnK2RwPTtezVIZZqJ/9D4HkcfeNtOcQYxp/sRMhabLzvqkgwlSrWlcGhWZ/ECDetKL5VBImi0U88CL0pcueMeta1iqjZMWshDAiub/zk63IQPN96SFR+BaBw2fj2EGRBmexdxPgWqug+r867PzwVLr0Vu7wqw3zNV0P7WKiLosxNzasLCR+X5gkcNYmB4yQGhf1SBd/sLaRZPw8vvFREnlqbxh986yHw5B5r3RMygfAAQ28d0SYgaWZxa5zwGoQ7IDC09fSn1nWnVxg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSJ3yJHX2pY2lU8TmDPj1PTl7XsrvhM1rKrxp922Bsw=;
 b=yCZNKNq81S7bVNDb18vhcjWfA9eDt515/0NT0rp+YaXB3Ni6y5euNnveUduQO/Jg9otTIFzE07AzrbexfkCqCnxqLI6Z2QbCGwKsiKxq0NjZWOVSAjvWaEIauaxKnsMXDoptmFbNw74vCyUSrtmikOQSo0S4ZfHYwHyEYa3fsRRfbWt9kEcTflr8bYkuQgiLtqzAae+t72d/EuJdrQ3r+IeKL0nPv0uJIj84RLfwiStGIxNimPLkTVPKaYgO3dqAgQQ3dJA5TjJK2dDkslz4JLailnIL+qt9lZ4/sSjwUfUUv+1YUcmXICVz3QAPAL9FnjcuuK72AusZRvjOMO2zRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 15:35:14 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8489.028; Mon, 3 Mar 2025
 15:35:14 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        deepesh.varatharajan@windriver.com
Subject: [PATCH V2 1/3] rust: Upgrade 1.82.0->1.83.0
Date: Mon,  3 Mar 2025 07:34:56 -0800
Message-ID: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf4d29a-d6cd-472a-6dc4-08dd5a68fe18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UF7v9GKYAUzW7GpDzJZ5EgbXP9vM4q/toAN+AojZfGGLalk4RnQ3U+NWenVw?=
 =?us-ascii?Q?gce5wZ1zfaLNm+sZLCehLl8AYknZdlGo2Ep4ESqdpXAG/7+N/zCMorrww+Yj?=
 =?us-ascii?Q?y40Gh5ALLPLKZ/0GJ05YJ1iMO6XfHNVekqEWHpiC4+gBQgQpfEVeA6k4EOeM?=
 =?us-ascii?Q?ffjg6rgKg+36TxnCad06Lds+Z98oDN31DzYGkOBBroJ43Lw0sLotSOQuSgdd?=
 =?us-ascii?Q?zqVMATijuVI12VQkC9IvB/rzZl1SB4Izr/6dVfJHSJnk6CatIl5WN7wcigzM?=
 =?us-ascii?Q?1X05iV54gP2hYSt+yI4y3yrqycRqH/hyu2OJSeW4y89OwPYFq47n3MYUO9M3?=
 =?us-ascii?Q?/Z/ImNAFEcA4fQRoqy2oONCC/B6XXvH163mlD/1d2q50KvDkKz4oSQrGLTBI?=
 =?us-ascii?Q?BDZ27lP6yrThE7KbfSIX3C5W7YnkTivYxQOEMW290fAXKzjbDjm/9QlOc0VY?=
 =?us-ascii?Q?n9sENHhe0+KSLKC2pdZOsVjdp3KpDgsqw86DvqBI1yYN+gp7d12sgkq4zCAI?=
 =?us-ascii?Q?vHvEc3RwBv7Fzgigouj3meDXhCAW/XODfklIv+kNhMigGsvnTEx83GwqbbzN?=
 =?us-ascii?Q?+n2c3HPjk1ahfKtVNj9yWkzhDnrxSj1p0zZ1AqPKWY/QnTN5Z9SmAbIEOC37?=
 =?us-ascii?Q?FU/spHoEzk/JfdMX7A5Kx7o4NEjZQaJUO0BV3UeN4HeyNHYDJiT64wBMoly7?=
 =?us-ascii?Q?5v0qWbx2Jz9b/RNRfez9FDY3/md2utUcJTdg1TVkao7KyKhwUY0Yk2/FHPcv?=
 =?us-ascii?Q?OEKpAb9hgh9EEvtGFpx9FJZO+1Af5by0WCy1h3TGyhfAEyJ7QgoZDReoQLDu?=
 =?us-ascii?Q?lYCoJxMIDn5k44MDeUecyRlfcUwCW4l1kiqExIVU3pRFV5i6+mPuidoWlKtq?=
 =?us-ascii?Q?7wJsR5fZdCQFPpJuwfrYAyIp4t3fwf4zG13wLJNLmo2+edxAsrsGbfh1xEP+?=
 =?us-ascii?Q?3CZcWsUU4PM7AHY6s3ZU3ckVEYA7ak/H3y9oRNiIueaOevYhqXlHM6RGZf+D?=
 =?us-ascii?Q?XLIoxkJIQi/JlqZcv0wzY3naV+ayphWQOrSNWIXm38ZxfLu090LjRq2QzXCc?=
 =?us-ascii?Q?L7XocQ3yLh0owTfxuQg7nDA6y4RfDs5kpbwZhG7VKrceftn7BSuisrXPosJF?=
 =?us-ascii?Q?Lmk+zYlG1cHv5OFDeAj6v2tDvF6GfCoNnkT5zaEfHwJhZhCizzYFqWiyOVyP?=
 =?us-ascii?Q?NEOBcZMsxed0+qFnHKd/lwLxh2jrODCWx2Ttv2RLcTafcVk9wiogXPF97KiM?=
 =?us-ascii?Q?617WMjgWUYxsi1tfZ7Iyg2bFhZzsxS1ML5gtkeVZ4tAj3BgOZ5p2iVloqJlh?=
 =?us-ascii?Q?zK5YNRjC8pTHaFHEFBeGmw7UUn4fxB8mqThoPZymLuLFWT9wbfeQKavz3j1+?=
 =?us-ascii?Q?/6SGljZaUEv6VdRZYnUnEvqPbMh9yjXgAZQdFu5KESkosrcAng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QQjx5MPwi9DHwQWnOBMdVYWSUId8ikbEKpoHb+Tm2QTRK0MpMBdtNu+FtMpN?=
 =?us-ascii?Q?RKLYRrRv39vhrS0XPpqj2jHPLUycPyP3MgoAgJWY+EQdey4q5RMMGAhgwAX5?=
 =?us-ascii?Q?JX6hhnn7aoZs3gyGDh8cR2VnuJn/NuaNsqbJEb5i0wGs04CzLXvRJRqIxHu3?=
 =?us-ascii?Q?yvaU6kNszU3GTCGayRai/lMLizcYF7VDpSpD454lT4o38+d5CMgRyxxaNyrV?=
 =?us-ascii?Q?Dl4PJNkTdJFdoypBSswYtMMJmXupvy8owIcuoDtkRWk/Elbul2JPPwKhCXdV?=
 =?us-ascii?Q?rGNV8clBGOTu9N9k2jLKoywsAbmVRtBs6iNSguIjaWIDCfbrAjAk6jhBlhIA?=
 =?us-ascii?Q?ofTrOtxcVTlG4GWQ0Lb8WBwxe8RSFaPlBU60K3n6p0CKMAdToUz/hAxpA0bK?=
 =?us-ascii?Q?XfB/73oi3KhMf6OUZt5WcWF6IriH6051OWxMXGqPBrKRN7qcEKcnSkUhhLLp?=
 =?us-ascii?Q?2FBNAcFaHApooMhOuUtRlVGTZ3F4iUyb0Ax6DETSfxiTsgxhE9y6wP+50oNR?=
 =?us-ascii?Q?yuDvq0ZOoQrxApwCVMP6wwAEoSKm3HPV1rhFRWRe8OV7Ozg4wUErlKFSBSJe?=
 =?us-ascii?Q?YBk+DpiM0UFJPnPpsGn1uEAid+BBOohAp0W62ko/a+KZsDUTCFW1wlMwUGj0?=
 =?us-ascii?Q?7wLdHa2yto6e6ehGY02h+pjhVw+TRukc48FwlIzubmS0oyad7QdJiZ3hFNW5?=
 =?us-ascii?Q?F0rzmyX4MBnGjUUHna7G+12OnTMVEzbluPdV23NPs5ed2HDVsMu4zzvUcykQ?=
 =?us-ascii?Q?Nz1NHMKolIY2/I4rJ9b2e8uPiTgtlDwV4MNMNUuaQACIo+DJSpewwPTtksju?=
 =?us-ascii?Q?GfDuOmvqD1B4vfaDTmEho/N/O/oSSTdsTK4ZaGmSjClWnrNJSO0bLc0ffpnY?=
 =?us-ascii?Q?P/fJpg8bGR3hioMMeO15vBy9rNqOiDwMX1Y+I9+WymZQBzzm0s3gcSA16iHd?=
 =?us-ascii?Q?YM5i1CnbUTs9a1sp6FDxqge462KUtFxRIR9oqNrXuJ8mZKMbLRC9i0cypIn1?=
 =?us-ascii?Q?RDwyhNMJoR/cPZs4SbVqTxY4ygxmc0lzsSqKbnXe+hc2cS9f0Hbir/vRQfLh?=
 =?us-ascii?Q?3PKl2UV1cDzEJ3yEup5JA900y7Wdn011HUwLq3ZtLRDa7D1ZnFXFITXPTYhT?=
 =?us-ascii?Q?OXK9ejOt+XJBAfPQQLiewsTn+ESbAo8Do5U+yX4NuuhqLR8RJFw2IT2mkJoR?=
 =?us-ascii?Q?pRxY4v8z0SUYLl2xaencxzK2rSt8ahfwizXriDZxbvoRQzWhdxbLAJmR1Dy7?=
 =?us-ascii?Q?L+zgwgNMFue/YLEVMl5VRRWWt/ozIn2C0VOJMatVkTzePemjmMm8gNtTjiKh?=
 =?us-ascii?Q?2wTLeMK26mqEBGc1k4i+Gula6iI/6ENU9Wza6xAfCGlc9FBMupYXD0L9BEIc?=
 =?us-ascii?Q?fC7XaBZ8UlksLnCL0cprFYblhn1eMMWi43LhMS0mx4K2KjkuEErKS8+0qa4d?=
 =?us-ascii?Q?WJ8ul27kzhPwGX3kiloIrjEX0D8Iy3PAA72bM10p84rYgmiW4uIIbu87zjHC?=
 =?us-ascii?Q?e+J6p2KWs3qj0/CR+j+yLUJ9vlXBGuwhGT8ODpXgUcg5sztaTKVPEsDMxTCg?=
 =?us-ascii?Q?6sU5eaSEGE1cxaVyP+Dojj8h1P/AOGDS5bnDN7G1C4oodYlrSXlIgyFl3p5v?=
 =?us-ascii?Q?k6xGjI8J3i14QFVTFLfLVSM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf4d29a-d6cd-472a-6dc4-08dd5a68fe18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 15:35:14.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu3jbo8beqVX7SwWo7EeYkD6oh1MJH8CnEADwjC5p0bEfyP7iK+ihWTIJKivxVWefU/voIMVIBeoPQw68vCltfQYMYluRcwdnzza9EIZOEicak70lLxkYF66WNXiU/e8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-Proofpoint-GUID: Mf9VfVFscbREaXSXO4ZWATesgVYmxWSM
X-Proofpoint-ORIG-GUID: Mf9VfVFscbREaXSXO4ZWATesgVYmxWSM
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c5cc35 cx=c_pps a=7V8mf9/socFTThwl5N0qNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=b_4cnykjG1GqKH0URbIA:9 a=H2EipEnXpwY904MX:21 a=ODQXRAfQNnAA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212211

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rust stable version updated to 1.83.0.
https://blog.rust-lang.org/2024/11/28/Rust-1.83.0.html

Renamed and modified the below patch to adapt the new version.
rv32-cargo-rustix-0.38.34-fix.patch->rv32-cargo-rustix-0.38.37-fix.patch

Modified the below patches to adapt the new version.
repro-issue-fix-with-cc-crate-hashmap.patch
revert-link-std-statically-in-rustc_driver-feature.patch

Dropped: zlib-off64_t.patch
https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9dba04=
fa3kq

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.82.0.bb =3D> cargo_1.83.0.bb} |  0
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 97 +++++--------------
 ...d-statically-in-rustc_driver-feature.patch | 65 ++++++++++++-
 ...ibstd-rs_1.82.0.bb =3D> libstd-rs_1.83.0.bb} |  0
 ....82.0.bb =3D> rust-cross-canadian_1.83.0.bb} |  0
 ...ust-llvm_1.82.0.bb =3D> rust-llvm_1.83.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 76 +++++++--------
 meta/recipes-devtools/rust/rust-source.inc    |  5 +-
 .../rust/{rust_1.82.0.bb =3D> rust_1.83.0.bb}   |  1 +
 10 files changed, 128 insertions(+), 118 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.82.0.bb =3D> cargo_1.83.0.bb} (=
100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.82.0.bb =3D> libstd-rs_1.83=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.82.0.bb =3D> rust=
-cross-canadian_1.83.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.82.0.bb =3D> rust-llvm_1.83=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.82.0.bb =3D> rust_1.83.0.bb} (99=
%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 13f31d46de..f7a6cf0283 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ GLIBCVERSION ?=3D "2.41%"
 LINUXLIBCVERSION ?=3D "6.12%"
 QEMUVERSION ?=3D "9.2%"
 GOVERSION ?=3D "1.22%"
-RUSTVERSION ?=3D "1.82%"
+RUSTVERSION ?=3D "1.83%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.82.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.83.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.82.0.bb
rename to meta/recipes-devtools/rust/cargo_1.83.0.bb
diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
index baca486cc2..f47a02c261 100644
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -1,4 +1,4 @@
-rust: reproducibility issue fix with v1.82
+rust: reproducibility issue fix with v1.83
=20
 A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
 By the following changes same hash values will be genarted even for diffre=
nt build paths.
@@ -8,47 +8,6 @@ https://github.com/rust-lang/cc-rs/pull/1277
=20
 Upstream-Status: Submitted [https://github.com/rust-lang/cc-rs/pull/1277]
 Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---- a/vendor/cc-1.0.97/src/command_helpers.rs
-+++ b/vendor/cc-1.0.97/src/command_helpers.rs
-@@ -257,6 +257,7 @@
- /// and store them in the output Object.
- pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
-     let mut objects =3D Vec::with_capacity(files.len());
-+    let target_substring =3D ["rustc"];
-     for file in files {
-         let basename =3D file
-             .file_name()
-@@ -277,10 +278,29 @@
-             })?
-             .to_string_lossy();
-
-+        // Function to find the position of the first occurrence of the t=
arget substring
-+        fn find_target_position(s: &str, targets: &[&str]) -> Option<usiz=
e> {
-+            let mut pos =3D None;
-+            for target in targets {
-+                if let Some(index) =3D s.rfind(target) {
-+                     //If a target is found and pos is None, set it
-+                         if pos.is_none() || index < pos.unwrap() {
-+                             pos =3D Some(index);
-+                         }
-+                }
-+            }
-+            pos
-+        }
-+
-+        let filtered_dirname =3D if let Some(pos) =3D find_target_positio=
n(&dirname, &target_substring) {
-+            dirname[pos..].to_string()  //Keep everything from the target=
 substring onwards
-+        }  else {
-+            dirname.to_string()  //If target substring is not found, keep=
 the original dirname
-+        };
-         // Hash the dirname. This should prevent conflicts if we have mul=
tiple
-         // object files with the same filename in different subfolders.
-         let mut hasher =3D hash_map::DefaultHasher::new();
--        hasher.write(dirname.to_string().as_bytes());
-+        hasher.write(filtered_dirname.as_bytes());
-         let obj =3D dst
-             .join(format!("{:016x}-{}", hasher.finish(), basename))
-             .with_extension("o");
 diff --git a/vendor/cc-1.0.99/src/command_helpers.rs b/vendor/cc-1.0.99/sr=
c/command_helpers.rs
 index fe919a5239..2b1f442019 100644
 --- a/vendor/cc-1.0.99/src/command_helpers.rs
@@ -92,11 +51,11 @@ index fe919a5239..2b1f442019 100644
          let obj =3D dst
              .join(format!("{:016x}-{}", hasher.finish(), basename))
              .with_extension("o");
-diff --git a/vendor/cc-1.0.105/src/command_helpers.rs b/vendor/cc-1.0.105/=
src/command_helpers.rs
-index 2fce90a9da..584e386edd 100644
---- a/vendor/cc-1.0.105/src/command_helpers.rs
-+++ b/vendor/cc-1.0.105/src/command_helpers.rs
-@@ -259,6 +259,7 @@ fn wait_on_child(
+diff --git a/vendor/cc-1.1.22/src/command_helpers.rs b/vendor/cc-1.1.22/sr=
c/command_helpers.rs
+index 07dfb80412..e01b62fa39 100644
+--- a/vendor/cc-1.1.22/src/command_helpers.rs
++++ b/vendor/cc-1.1.22/src/command_helpers.rs
+@@ -285,6 +285,7 @@ fn wait_on_child(
  /// and store them in the output Object.
  pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
      let mut objects =3D Vec::with_capacity(files.len());
@@ -104,7 +63,7 @@ index 2fce90a9da..584e386edd 100644
      for file in files {
          let basename =3D file
              .file_name()
-@@ -279,10 +280,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+@@ -305,10 +306,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
              })?
              .to_string_lossy();
=20
@@ -135,11 +94,11 @@ index 2fce90a9da..584e386edd 100644
          let obj =3D dst
              .join(format!("{:016x}-{}", hasher.finish(), basename))
              .with_extension("o");
-diff --git a/vendor/cc-1.1.6/src/command_helpers.rs b/vendor/cc-1.1.6/src/=
command_helpers.rs
-index 910d068242..2b85a66729 100644
---- a/vendor/cc-1.1.6/src/command_helpers.rs
-+++ b/vendor/cc-1.1.6/src/command_helpers.rs
-@@ -282,6 +282,7 @@ fn wait_on_child(
+diff --git a/vendor/cc-1.1.23/src/command_helpers.rs b/vendor/cc-1.1.23/sr=
c/command_helpers.rs
+index 07dfb80412..e01b62fa39 100644
+--- a/vendor/cc-1.1.23/src/command_helpers.rs
++++ b/vendor/cc-1.1.23/src/command_helpers.rs
+@@ -285,6 +285,7 @@ fn wait_on_child(
  /// and store them in the output Object.
  pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
      let mut objects =3D Vec::with_capacity(files.len());
@@ -147,7 +106,7 @@ index 910d068242..2b85a66729 100644
      for file in files {
          let basename =3D file
              .file_name()
-@@ -302,10 +303,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+@@ -305,10 +306,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
              })?
              .to_string_lossy();
=20
@@ -186,25 +145,19 @@ index b070eeb322..ba768ff86f 100644
 -{"files":{"Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb12237c1=
a72a1cbe4b9392e","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc35930a5=
a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"92440d3adb5cb6ea05596d9ca860a205d3937dbf0fc959e524bac5f2b748=
c1af","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"e13c439a96d8311ba8d37b9d5522cd=
6997d94261cbb95517c82df70525acaa7f","src/windows/com.rs":"a2800ddb81215fff2=
bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/find_tools.rs=
":"4c350cddbce1557682b7f40cd917cc4f131ad89ff2e34c23d629014ed8d7203e","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"96c51067fd44124faa7f870b4b1c9693=
79ad32b2ba805aa959430ceaa384f695"}
 \ No newline at end of file
 +{"files":{"Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb12237c1=
a72a1cbe4b9392e","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"4c4a9ea55a109=
dbeada9e23d4ec963c257a56451b5fd16c7e4e8b97374f1a2ff","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"92440d3adb5cb6ea05596d9ca860a205d3937dbf0fc959e524bac5f2b748=
c1af","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"e13c439a96d8311ba8d37b9d5522cd=
6997d94261cbb95517c82df70525acaa7f","src/windows/com.rs":"a2800ddb81215fff2=
bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/find_tools.rs=
":"4c350cddbce1557682b7f40cd917cc4f131ad89ff2e34c23d629014ed8d7203e","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"96c51067fd44124faa7f870b4b1c9693=
79ad32b2ba805aa959430ceaa384f695"}
---- a/vendor/cc-1.0.97/.cargo-checksum.json
-+++ b/vendor/cc-1.0.97/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756cd=
a9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc35930a5=
a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcf=
dcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9a79a=
902c2f76911e5747ced4e032edd8d9b4"}
-\ No newline at end of file
-+{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756cd=
a9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"c2a9981b1c9f5=
430ac2a41f2953064f2383e4064feb281dc76915e4972d52226","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcf=
dcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9a79a=
902c2f76911e5747ced4e032edd8d9b4"}
-diff --git a/vendor/cc-1.0.105/.cargo-checksum.json b/vendor/cc-1.0.105/.c=
argo-checksum.json
-index f1ddc06886..880d637ada 100644
---- a/vendor/cc-1.0.105/.cargo-checksum.json
-+++ b/vendor/cc-1.0.105/.cargo-checksum.json
+diff --git a/vendor/cc-1.1.22/.cargo-checksum.json b/vendor/cc-1.1.22/.car=
go-checksum.json
+index 8c7be07836..473b5ad39c 100644
+--- a/vendor/cc-1.1.22/.cargo-checksum.json
++++ b/vendor/cc-1.1.22/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CHANGELOG.md":"b6200e753550c2285fd78f5d3d8198d3e67ee01e8504f21=
a4f2ad0c0574d8f19","Cargo.toml":"5f3c7c1de2fa554e02714ae57f7ef0be696c5dda3c=
71f197d2574abf92fd82a7","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"2a564c2c1e9a9c46e=
2b667d0b9574e2fda233e3c26dffbcd55373d052f042905","src/command_helpers.rs":"=
7c09d713b9a7ad45ad4fc431206681819465b871e7408573b311e300b1e9e21c","src/dete=
ct_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd0=
8abf392f5a29","src/lib.rs":"3213e05f797701c9da797509512991e18a40455b1d94785=
31640f90d1f13134e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"8e=
f38688fdf867606a32500078094e0bb22fb2aec9ae11a392593bbfc101ed4f","src/parall=
el/mod.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa06=
3","src/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe=
20a76307e31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9=
f52f171648e15e11d46800a73186955","src/tempfile.rs":"b12a0821586ab3945fe4ff5=
74cd76699c3694a103dbf1b5764fd1fbcbbd7c37e","src/tool.rs":"24291f79784a99060=
2e2244ccf965127088e43bd58745a3829d0d06dddd588b6","src/utilities.rs":"a13bb0=
a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7b53","src/windows/co=
m.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","s=
rc/windows/find_tools.rs":"8eb56f4af6cc40b943e25dba9f26d1629c0c464b2839a6c5=
aa8d3f0b973a649c","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea5295d3e420043=
9af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72c825e80958=
43e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.=
rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec290763101097334c74=
78f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cf=
ce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e2714c8307b=
fa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windows/windows=
_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2e6e2c49d1c=
cee"},"package":"5208975e568d83b6b05cc0a063c8e7e9acc2b43bee6da15616a5b73e10=
9d7437"}
+-{"files":{"CHANGELOG.md":"92aeb6dec3e4b55e3951a4d00f6df20edc51545afca124d=
983454f7c05e37357","Cargo.toml":"1352b0476c28b89568e740579130ab017ad0f4b546=
083cf03ff61827d45361f3","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
0b54800fe5c89cd102a5f872fe1a843c1a58e026bc4bbc611e207914b8c84dda","src/dete=
ct_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfedd26c29=
47cbce6e8b2f","src/lib.rs":"c80c94e82937980f711500cd3289842ab4bc42bcc4efd9f=
ebf64729e27410ecc","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a570c99d8=
97fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa2ce856b=
cc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"9540e661f81799159abee814118cc139a2004b=
3a3aa3ea37724a1b66530b90e0"}
 \ No newline at end of file
-+{"files":{"CHANGELOG.md":"b6200e753550c2285fd78f5d3d8198d3e67ee01e8504f21=
a4f2ad0c0574d8f19","Cargo.toml":"5f3c7c1de2fa554e02714ae57f7ef0be696c5dda3c=
71f197d2574abf92fd82a7","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"2a564c2c1e9a9c46e=
2b667d0b9574e2fda233e3c26dffbcd55373d052f042905","src/command_helpers.rs":"=
7b60816a28486743beec6658f43cdf348d87613193b008f6bcd7a19eb6e24407","src/dete=
ct_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd0=
8abf392f5a29","src/lib.rs":"3213e05f797701c9da797509512991e18a40455b1d94785=
31640f90d1f13134e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"8e=
f38688fdf867606a32500078094e0bb22fb2aec9ae11a392593bbfc101ed4f","src/parall=
el/mod.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa06=
3","src/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe=
20a76307e31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9=
f52f171648e15e11d46800a73186955","src/tempfile.rs":"b12a0821586ab3945fe4ff5=
74cd76699c3694a103dbf1b5764fd1fbcbbd7c37e","src/tool.rs":"24291f79784a99060=
2e2244ccf965127088e43bd58745a3829d0d06dddd588b6","src/utilities.rs":"a13bb0=
a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7b53","src/windows/co=
m.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","s=
rc/windows/find_tools.rs":"8eb56f4af6cc40b943e25dba9f26d1629c0c464b2839a6c5=
aa8d3f0b973a649c","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea5295d3e420043=
9af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72c825e80958=
43e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.=
rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec290763101097334c74=
78f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cf=
ce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e2714c8307b=
fa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windows/windows=
_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2e6e2c49d1c=
cee"},"package":"5208975e568d83b6b05cc0a063c8e7e9acc2b43bee6da15616a5b73e10=
9d7437"}
-diff --git a/vendor/cc-1.1.6/.cargo-checksum.json b/vendor/cc-1.1.6/.cargo=
-checksum.json
-index c8814c0183..7a7af5d2e7 100644
---- a/vendor/cc-1.1.6/.cargo-checksum.json
-+++ b/vendor/cc-1.1.6/.cargo-checksum.json
++{"files":{"CHANGELOG.md":"92aeb6dec3e4b55e3951a4d00f6df20edc51545afca124d=
983454f7c05e37357","Cargo.toml":"1352b0476c28b89568e740579130ab017ad0f4b546=
083cf03ff61827d45361f3","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
a2ee7ae686b9cb186bebfdd597438251536bcaa9815699c95eab349385b4b949","src/dete=
ct_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfedd26c29=
47cbce6e8b2f","src/lib.rs":"c80c94e82937980f711500cd3289842ab4bc42bcc4efd9f=
ebf64729e27410ecc","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a570c99d8=
97fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa2ce856b=
cc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"9540e661f81799159abee814118cc139a2004b=
3a3aa3ea37724a1b66530b90e0"}
+diff --git a/vendor/cc-1.1.23/.cargo-checksum.json b/vendor/cc-1.1.23/.car=
go-checksum.json
+index d834145136..a10eecf785 100644
+--- a/vendor/cc-1.1.23/.cargo-checksum.json
++++ b/vendor/cc-1.1.23/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CHANGELOG.md":"27c152bba5a9e4aa5f8075f618fec105590804ba75dd458=
1bb54cdcf3d719e91","Cargo.toml":"a772649c4058df65a5977d7c2d37afdbb7bcf68f3b=
47428acef6502158c0f1c4","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
5b765fc5bf3ff7367aa6acf67be465bdc776b22c090d3bbfe11816bd023c7a18","src/dete=
ct_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd0=
8abf392f5a29","src/lib.rs":"2f6d061032899f2e60e3932041c353d327ba6f27c7eb747=
fd37f8d18a750e6a0","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"342be00f6215e=
161d8163e272a2945bb9f52f171648e15e11d46800a73186955","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"f5d8d343be6db681605ad5e9adab9f10c19b9d772af241da285ddbe54740486d","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"a03cd94d7a36deb0e4490d9ce070=
624a0e79f082cdfc4c32f52a8cbe557fd0b5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"2aba8f4e9906c7ce3c73463f62a7f0c65183ad=
a1a2d47e397cc8810827f9694f"}
+-{"files":{"CHANGELOG.md":"c0125e3e52f1af277dd92935d84992fcff829ecd11a4bad=
6ac75bced3c68623b","Cargo.toml":"1b08a0bb920345c02a78f49be0a091ac426dbfe1bf=
a4b853da0c177acda36582","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
0b54800fe5c89cd102a5f872fe1a843c1a58e026bc4bbc611e207914b8c84dda","src/dete=
ct_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfedd26c29=
47cbce6e8b2f","src/lib.rs":"41f2bc5d9c29a842688dfdbea60241d0efa49229d1cf654=
06225782f54866d19","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a570c99d8=
97fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa2ce856b=
cc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"3bbb537bb4a30b90362caddba8f360c0a56bc1=
3d3a5570028e7197204cb54a17"}
 \ No newline at end of file
-+{"files":{"CHANGELOG.md":"27c152bba5a9e4aa5f8075f618fec105590804ba75dd458=
1bb54cdcf3d719e91","Cargo.toml":"a772649c4058df65a5977d7c2d37afdbb7bcf68f3b=
47428acef6502158c0f1c4","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
36e27f089f0e9276bb9a5ebe9b5c4706c560106ffa5652b1e08e8285816910c3","src/dete=
ct_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd0=
8abf392f5a29","src/lib.rs":"2f6d061032899f2e60e3932041c353d327ba6f27c7eb747=
fd37f8d18a750e6a0","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"342be00f6215e=
161d8163e272a2945bb9f52f171648e15e11d46800a73186955","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"f5d8d343be6db681605ad5e9adab9f10c19b9d772af241da285ddbe54740486d","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"a03cd94d7a36deb0e4490d9ce070=
624a0e79f082cdfc4c32f52a8cbe557fd0b5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"2aba8f4e9906c7ce3c73463f62a7f0c65183ad=
a1a2d47e397cc8810827f9694f"}
++{"files":{"CHANGELOG.md":"c0125e3e52f1af277dd92935d84992fcff829ecd11a4bad=
6ac75bced3c68623b","Cargo.toml":"1b08a0bb920345c02a78f49be0a091ac426dbfe1bf=
a4b853da0c177acda36582","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883c8=
f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs":"=
a2ee7ae686b9cb186bebfdd597438251536bcaa9815699c95eab349385b4b949","src/dete=
ct_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfedd26c29=
47cbce6e8b2f","src/lib.rs":"41f2bc5d9c29a842688dfdbea60241d0efa49229d1cf654=
06225782f54866d19","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fe=
e042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"f4=
ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/parall=
el/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67ab1=
4","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac891=
91d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f14=
4262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a570c99d8=
97fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.rs":"eba=
fb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs=
":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/u=
tilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbfe7=
b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795=
873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa2ce856b=
cc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201cfbcac7=
ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs=
":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/w=
indows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df=
13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcd=
ec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d=
1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_=
sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8",=
"src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7be=
c217264ba2e6e2c49d1ccee"},"package":"3bbb537bb4a30b90362caddba8f360c0a56bc1=
3d3a5570028e7197204cb54a17"}
diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-in=
-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-link-=
std-statically-in-rustc_driver-feature.patch
index 257883ef60..b0f6e0a779 100644
--- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_=
driver-feature.patch
+++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_=
driver-feature.patch
@@ -104,7 +104,7 @@ diff --git a/src/bootstrap/src/bin/rustc.rs b/src/boots=
trap/src/bin/rustc.rs
 index d04e2fbeb7..011c289d93 100644
 --- a/src/bootstrap/src/bin/rustc.rs
 +++ b/src/bootstrap/src/bin/rustc.rs
-@@ -89,25 +89,6 @@ fn main() {
+@@ -89,24 +89,6 @@ fn main() {
          rustc_real
      };
=20
@@ -114,7 +114,6 @@ index d04e2fbeb7..011c289d93 100644
 -    // When statically linking `std` into `rustc_driver`, remove `-C pref=
er-dynamic`
 -    if env::var("RUSTC_LINK_STD_INTO_RUSTC_DRIVER").unwrap() =3D=3D "1"
 -        && crate_name =3D=3D Some("rustc_driver")
--        && stage !=3D "0"
 -    {
 -        if let Some(pos) =3D args.iter().enumerate().position(|(i, a)| {
 -            a =3D=3D "-C" && args.get(i + 1).map(|a| a =3D=3D "prefer-dyn=
amic").unwrap_or(false)
@@ -130,7 +129,7 @@ index d04e2fbeb7..011c289d93 100644
      let mut cmd =3D match env::var_os("RUSTC_WRAPPER_REAL") {
          Some(wrapper) if !wrapper.is_empty() =3D> {
              let mut cmd =3D Command::new(wrapper);
-@@ -118,6 +99,9 @@ fn main() {
+@@ -117,6 +99,9 @@ fn main() {
      };
      cmd.args(&args).env(dylib_path_var(), env::join_paths(&dylib_path).un=
wrap());
=20
@@ -144,7 +143,7 @@ diff --git a/src/bootstrap/src/core/builder.rs b/src/bo=
otstrap/src/core/builder.
 index ff0d1f3a72..b2c9602e57 100644
 --- a/src/bootstrap/src/core/builder.rs
 +++ b/src/bootstrap/src/core/builder.rs
-@@ -2153,7 +2153,7 @@ impl<'a> Builder<'a> {
+@@ -2201,7 +2201,7 @@ impl<'a> Builder<'a> {
          // When we build Rust dylibs they're all intended for intermediate
          // usage, so make sure we pass the -Cprefer-dynamic flag instead =
of
          // linking all deps statically into the dylib.
@@ -197,3 +196,61 @@ index b8b0432aa9..b5bd71e015 100644
  use std::env;
  use std::io::stdout;
  use std::path::{Path, PathBuf};
+diff --git a/src/bootstrap/src/core/build_steps/compile.rs b/src/bootstrap=
/src/core/build_steps/compile.rs
+index 27bbc8bd8f..a6fc4df2eb 100644
+--- a/src/bootstrap/src/core/build_steps/compile.rs
++++ b/src/bootstrap/src/core/build_steps/compile.rs
+@@ -1934,24 +1934,8 @@ impl Step for Assemble {
+         let src_libdir =3D builder.sysroot_libdir(build_compiler, host);
+         for f in builder.read_dir(&src_libdir) {
+             let filename =3D f.file_name().into_string().unwrap();
+-
+-            let is_proc_macro =3D proc_macros.contains(&filename);
+-            let is_dylib_or_debug =3D is_dylib(&filename) || is_debug_inf=
o(&filename);
+-
+-            // If we link statically to stdlib, do not copy the libstd dy=
namic library file
+-            // FIXME: Also do this for Windows once incremental post-opti=
mization stage0 tests
+-            // work without std.dll (see https://github.com/rust-lang/rus=
t/pull/131188).
+-            let can_be_rustc_dynamic_dep =3D if builder
+-                .link_std_into_rustc_driver(target_compiler.host)
+-                && !target_compiler.host.is_windows()
++            if (is_dylib(&filename) || is_debug_info(&filename)) && !proc=
_macros.contains(&filename)
+             {
+-                let is_std =3D filename.starts_with("std-") || filename.s=
tarts_with("libstd-");
+-                !is_std
+-            } else {
+-                true
+-            };
+-
+-            if is_dylib_or_debug && can_be_rustc_dynamic_dep && !is_proc_=
macro {
+                 builder.copy_link(&f.path(), &rustc_libdir.join(&filename=
));
+             }
+         }
+diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/bu=
ilder.rs
+index 9ac0b0a01f..b1374042fb 100644
+--- a/src/bootstrap/src/core/builder.rs
++++ b/src/bootstrap/src/core/builder.rs
+@@ -1701,21 +1701,8 @@ impl<'a> Builder<'a> {
+                 // Build proc macros both for the host and the target unl=
ess proc-macros are not
+                 // supported by the target.
+                 if target !=3D compiler.host && cmd_kind !=3D Kind::Check=
 {
+-                    let error =3D command(self.rustc(compiler))
+-                        .arg("--target")
+-                        .arg(target.rustc_target_arg())
+-                        .arg("--print=3Dfile-names")
+-                        .arg("--crate-type=3Dproc-macro")
+-                        .arg("-")
+-                        .run_capture(self)
+-                        .stderr();
+-                    let not_supported =3D error
+-                        .lines()
+-                        .any(|line| line.contains("unsupported crate type=
 `proc-macro`"));
+-                    if !not_supported {
+-                        cargo.arg("-Zdual-proc-macros");
+-                        rustflags.arg("-Zdual-proc-macros");
+-                    }
++                    cargo.arg("-Zdual-proc-macros");
++                    rustflags.arg("-Zdual-proc-macros");
+                 }
+             }
+         }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.82.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.83.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.82.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.83.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.82.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.83.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.82.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.83.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.82.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.83.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.82.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.83.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index fdbe41a8b8..a06b6fc854 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.81.0"
+SNAPSHOT_VERSION =3D "1.82.0"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "76f8927e4923c26c51b60ef99a2=
9f3609843b3a2730f0bdf2ea6958626f11b11"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "30a00260510403199d1cb91976=
9b0a2e76eead15c352fc992bc193d795a2b2ff"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "85567f037cee338f8ec8f9b6=
287a7f200d221658a996cba254abc91606ece6f4"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "301f651f38f8c52ebaad0ac7eb2=
11a5ea25c3b690686d1c265febeee62d2c6fc"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "05c0d904a82cddb8a00b0bbdd27=
6ad7e24dea62a7b6c380413ab1e5a4ed70a56"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "1e01808028b67a49f57925ea72=
b8a2155fbec346cd694d951577c63312ba9217"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "1359ac1f3a123ae5da0ee9e4=
7b98bb9e799578eefd9f347ff9bafd57a1d74a7f"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "2958e667202819f6ba1ea88a2a3=
6d7b6a49aad7e460b79ebbb5cf9221b96f599"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "44f74fbf64dd2627310e796cfcbde7=
5c42c3435e93e880f1291c0e975b42c1f5"
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D "3d5cdbe24fd0cefe46bfa513dbf56=
631bef38d04bae1cfbebaa407c33430fecb"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "4ed9085460e444de9dee2460801=
26f5e73062802b99aaff620d2aa827f60d972"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "8039f645445f99c0e293397b53a669=
6481b7d58166198605aca0eaa998f4f11f"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "1cf5bae93e9724f50f1a20a752f058=
70565e0ce83baa157aad632aa162fd97d5"
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D "a4c20f20c8e53747e00948f90d743=
80ae890c1836a067d504eca540c6a60157f"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "c7ebb02b6ca349999b3b7dce768=
efaca5e0d9060f55397523e11a64cd10a9405"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "92bab38ce88b7738fb62a1bccf496b=
1b2975fe984cc4fc506903a03ed37e1e4a"
=20
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "d3a66e30a323fc20acd3b85=
f9a184b962a84ac9debf59c313d30c0146448cbb1"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "81044ebd81783b013cdc20=
7a7304dc59baa7c1782a6f070ecfa1a6671844e26c"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "37f89523e04b960ba34c=
0cd145c4a78751961b6007ad4ae6d8b92389c488d696"
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "90eb5646497f1cf566121b7=
26b0598f76acf38ce9423b0889b4ad71dffb59aa1"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "01709e6d5b16e972e6c5e82=
6a36331c645766ecda8f0aa48559f20c0d1129f44"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "ddbd18682a7fa0794d3bf1=
59ba5cc5aee8c7bd6860d2edd8c9f4591753b5f05c"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "8cc1399b0460b3bc4b72=
95165dcdcee310fd643dc29569e1786944650f2a3700"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "2bdbf08c8c7d3a4dc8bdddd=
bc4cf2cdec5a3d0f4a42e19183a14bed24d8d580c"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "3ffb73eaf288ebe02c06737c533=
98cbcf7f9e15bd53d6ec3f85be1364aff16ea"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "c6583a26dc5fda266c75b7bf2e=
5f6c1c9d5452f2dc3044bf99f43e59e14fead9"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "3b3473de46f7ea268130d8c7=
2140dacab9118b2e8611fc0e23ed99091f25eb45"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "8da65f141f7b8c53d5802fc6171=
1cccf28b0512a5f766809cbe882c6f8ec3011"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "7c11f69eb52c6e26cd8a33daeae=
7d630b6af49de30c1af16f4e998ca25a48bfd"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "a33f459a5cc13573e4ed73bd56=
67bba4bdf658e30b629f36a221eb5249d4acc6"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "827989a42526206199025f76=
4d08d7cd319fee58bf2e08dcaf75df9ead6f094e"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "0d93e17a06cd284bdc0a97df647=
33f4b2f9f8c3cd9163935d85812ebc8520d2f"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "687c665259646f859e6ef9b3b=
8baf49c2759e19a20aa029251130495fe5bb07d"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "ad77d9511489a7a95580d8c4=
062e7eddc509d5bdec590a074c7378f2e7f36b00"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "94d828f3cbd848f15ec72e904=
bccd904a7fac0cd88d6afecfc472e48da032cb2"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "c849be4677f42dc9439ac245=
8ca3964b69a2d6621e57f979151e7b59de22d895"
 SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "665f3c0a8752f8e5d973cf=
9b94e5c1be94954178ca8378a318b6e21e7a7b370c"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "c4e0968c6a16916a339a2dea9=
063d14f3847cee65534b525d2838b827e7dad18"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "8795c642f94d15c81420a8eff=
77efbbac553869a00c627a1e3f881c542388b4a"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "813d2dcd603a1ad65a5de77=
515f4c94fdae301a1e1e8afcc2541076eebaba848"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "e35815af6cb90d70fd4730=
020ae48d4145487ff9b8c264caef5224c843d85744"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "5ba237cfbd18806bf77f=
be8bc31b14a17f3d14acb30a022955cf047eb8d41056"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "734f407345b05617d62a30d=
96d8305b51b7cf7de3b1bdc160449726ea8f51ae0"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "ce5918e9c1a41b9e9a1b3e1=
5f6525ddc01df06d9cea63d574dc59e8a401c1b67"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "a633c961cc9225c5ec1af6=
f153e33fd103057c9ebc66eb80f388687f34215fbf"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "4954a44305622b8f68ca=
088138b9a69432e350336da1a415a282ce148beb340d"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "0b22b37e51dd1dab6cc80a0=
2968873ecb5f886fe1a65cd47131e3d10be48a23b"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "4f41aeca96e6de516ad2150a9=
8136948527907690301fef4f127676f165e159e"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "65a65485972507cb5e89e640=
56b4602489bae76cff4a9c152e69d91365ff7433"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "9882cda0a5547405e64357=
a4964d525f46d1395f85b7e7b6e69cbd4dbcd46ec3"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "05d16740639cc87d258fad152=
d2a0f7e74dc571b5216ae6260d645a2f4f09c84"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "4779732566542099491c35a9f=
4342361bb8366e76c7d37ade0b5b7ae6f470df3"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "1399034c20e3037288cd6593=
59e0a9eeb1d8a125488bbea28bbe146792a18d1a"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "5649f9b4e107d6c5f72fb7=
f82cfe15370b80b8d983670602e02e0b615bc6dc88"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "225726a3fedeb6cf136d5af50=
3fb6853a0ce3c735fd972d40d678d734e65f5e8"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "11291e98730186479854a304fccf5=
86824e16f90b4e4cee6c9e17deaab04352a"
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "38b9003148a5222a0fb117cae494=
bf2a05227e6eff877e26b233433809f81e01"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5549622876714df21235aa6d26=
731f31c37a7e1629a3f6c5262dbb0b1f10038c"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "6ea458b49aa9edc26f021cc48e622=
3d1cc05b1bf092312ada978e66037fa63e2"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "55d95ce07117430b92d1153e5b1ff=
40222687bd344872260e0a19ecf7b4c28a2"
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "9c8c4b9d3a39383aa043a9a53447=
8bd2ab6adf7a2a48c1d4d29864974f23005f"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "454b83668b57bdef28fc49aca8=
fd4c38e395b49011e653afdf3f9bb2dae8aa63"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "bd46920849468c4ab78c53b21c962=
e538b1e8a9f38c736a9e52d790c75d55c45"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "c50ee4b1ae8695461930e36d5465=
dddb7c7a0e0f0aa6cbd60de120b17c38b841"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "c545ea0f2901eb1cd6527213501=
47df11744afbb97eb117d89b1f313e9920ffb"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "6ddf80f254e8eea9956308ba8=
9fd68e1ac7885853df9239b07bbc9f047b7562f"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "988a4e4cdecebe4f4a0c52ec4ade=
5a5bfc58d6958969f5b1e8aac033bda2613e"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "97aeae783874a932c4500f4d3647=
3297945edf6294d63871784217d608718e70"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "ea4fbf6fbd3686d4f6e2a77953e=
2d42a86ea31e49a5f79ec038762c413b15577"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2eca3d36f7928f877c334909f=
35fe202fbcecce109ccf3b439284c2cb7849594"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "90b61494f5ccfd4d1ca9a5ce4a0a=
f49a253ca435c701d9c44e3e44b5faf70cb8"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "91ebf62a1f95047b93d4a4fec28=
0fb4897cc7921633fd55f5c5a3aeb2b140bd6"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f56585c55664898c7484f4b7bd1=
39770c99d7b4da6e56e4016f71cb053b1aee2"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "194a3c04a2390b1e07fdb114=
eb2c48e962219f0a1b710e2120a9806963a2520b"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "87db52d782131a8817b76f65=
eefcae2c24a49b2a6f19ed9bd4699167305c22aa"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 0c0c9dcaa0..2d14ec64ca 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -2,14 +2,13 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
=20
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
-            file://rv32-cargo-rustix-0.38.34-fix.patch;patchdir=3D${RUSTSR=
C} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
-            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.pa=
tch;patchdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
 	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patch=
dir=3D${RUSTSRC} \
+	    file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTS=
RC} \
 "
-SRC_URI[rust.sha256sum] =3D "1276a0bb8fa12288ba6fa96597d28b40e74c44257c051=
d3bc02c2b049bb38210"
+SRC_URI[rust.sha256sum] =3D "7b11d4242dab0921a7d54758ad3fe805153c979c14462=
5fecde11735760f97df"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.82.0.bb b/meta/recipes-devto=
ols/rust/rust_1.83.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.82.0.bb
rename to meta/recipes-devtools/rust/rust_1.83.0.bb
index c4f8ee7108..2bf87ba27e 100644
--- a/meta/recipes-devtools/rust/rust_1.82.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -132,6 +132,7 @@ python do_configure() {
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
=20
+
     # [rust]
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
--=20
2.43.0


