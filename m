Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ABDE77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:25:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44211.1736414744967666267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098iIPu026697
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 09:25:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkhjh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:25:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC2ALKoxFeYvwUT6hZI7ET5XCgo+k81Ir3VIJFKB8b9GuY49qZNJRhR18YcdxkLLdetmVDZruOSppjfWzFnGBbiJM61c97snz+gOid9kB70m1i60ohuVfec5m8xecb202WboD49QgkLk82559azM+yC9j+Rq2YqbdXbUJV0x/OtrlEZtOzSLptK8HSHqVYxzofv75QaaI/or7D7BYBdeGEYuIbwYV7FVri9F5vQlWgXx/Qf45ikXlXHxRWsPAiybiacCohRadqLD0caDN5e2c2Jc26LIcjwCixyz43DeuRAD6me8YmwKJFjP2/68+Btka9r3hIKbDNmLwIEOT3uZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGm5yj4vrTIg0Su9ILFcA1JJBqYh888G0Fx9xSvEcEs=;
 b=Ag+iwztXi6lrrsk+dptmS2mQXjFL14JJrUpUVWOnx3J454I1iLtx7Y0ppapWSHwSQI84AZ6iHptP2jPJnQMZdxDz+YnE7M2syAxB6E8OGsVuQWrwNf9q3KS0mRL4jwA/m8uNStYcTyn76lSldHwZiOJqJCH7eoHD3mj3YnA/GXG3F7EOn8oj9qkLcT1K65nCNVc83miERjIoQeE449Er1W4hG1aHlyam1/GdO5RIa5e0j1a9yyCCjNiYj3gpAX/M5ZZdQdRcUV/9XR8jQcZt/1r9knkw2IDejLueZ0e0bJ/8188EnjJKo2iHTAxVHGIw9Hlqgl8TfJ47gx5dYds0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 09:25:41 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:25:41 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 2/3] rust: Fix for duplicate libstd.so
Date: Thu,  9 Jan 2025 01:25:20 -0800
Message-ID: <20250109092521.3921275-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109092521.3921275-1-Deepesh.Varatharajan@windriver.com>
References: <20250109092521.3921275-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 898bb8bb-4bf4-4642-1cd1-08dd308f9626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QdpDl8MyEasBEVoGxV6Oq13hv2ILuCyk7JFJUtvvERYvGATEczKYYvqiZuHE?=
 =?us-ascii?Q?17fi8z8sqcNh80dD+lenlMItDeFmHkPHb5MiCFAeWZpkM9sRZe7G/JZwgT5c?=
 =?us-ascii?Q?pU52Rewhd4jzFcMqGrH9iuuY1EbrsKoOAfSQW5gruC51CmRK+DQiSxvvKY3y?=
 =?us-ascii?Q?jPJyVHUnIkpUhiZikSITaflaiEDkp/teEwro679t0/KkPcA+PxfyJjTK7gMv?=
 =?us-ascii?Q?Os4A1x51J17qsR/TGeh8uC2akgiv5PuodN5EFTtrMGAFyFlpjX6szoWbzq8J?=
 =?us-ascii?Q?U3hMBhI9pic3LExANksdwdqcyVoVWT8mLqYhGLVYG4K6c1Z2DxEDkmIENXXu?=
 =?us-ascii?Q?T0HELkMrDNhmkpBpy9bbHQIYx4bAckapLUp3qSEW81ZsbwVaXIQ6FJyaq3FC?=
 =?us-ascii?Q?ZnsJZ08v9GKup8C1pSL8HYBg3MCGylDA8YHccweRnUOw5DhAJkwuEf+KTQxb?=
 =?us-ascii?Q?VuWNScJdbrtPxuBi4NKLlErVLrFDyMpiflJr5MuaWwenlwiXPUJubUfPfLim?=
 =?us-ascii?Q?Pv+QremDe8QjrnHmD+3SrxFZ/vzR4tXhW48NgRA7wADIZjdXaqp9AC37iAYP?=
 =?us-ascii?Q?Q9egStdNOdbtiDhCGjBFClnZgmHBLNK3gJAH+hLd8MDejleW0Vgbpx88LgzC?=
 =?us-ascii?Q?56Bx5peI+Yd2/OMFj1HxZP32g06UIWGARb2ukZm1FovC+CMhyRybR+MSNuV1?=
 =?us-ascii?Q?zhCc5XW1unEfV4zRY5XcxtrRmUSTmT/4mmLRM3LW+9nNNtan/7UFxTPdC1zG?=
 =?us-ascii?Q?6ebRGS3zxoET6iGbdwBd013d4Hu5f6sN0ADucLFlvugUIvpS4WzmTjKtOgkI?=
 =?us-ascii?Q?5EDDzyYtMK/qu9TqMQ6u11jVndthVzigIG2Q7mll09L7QfQa2Tg6GFBeIinL?=
 =?us-ascii?Q?BmL0I7DzdAfgLSlL0r+9YWVfljvZ9+LWsUZqA3nthgPLIM9nwQoEJE0RW4Cy?=
 =?us-ascii?Q?zSfyZU/uXSXSkA9dO35IB1Wfmxu8wzI1IIJxAHx/xOZT7cgv2+Kq4WN4rfgg?=
 =?us-ascii?Q?KyRckcV1v87+NtaKTTRCD+n9ph/y8z+cSE7lkh+CFinjOvELZv2ORbO1Hyt9?=
 =?us-ascii?Q?luuXceQaDoV/xOiFOZhwRun9S3sJqtmfvMovJwsfLahuLmDmecdhhAwkRB7Y?=
 =?us-ascii?Q?tMEJnRZrKIgveDig4bi8hcOibvgf/B8WC1GSqxQVhtbSD8QAgtoM/plfyYbm?=
 =?us-ascii?Q?3oIyDeHTdubaC2A2xC725GW9Pi9gPCQf9xRJRP0hWdWoZN8lJ8TAmLVH6Jmc?=
 =?us-ascii?Q?brptcqnzNHPorapmEB7QiovbCN4SVmCAXv1Ln/ytxxincFEyt3Ya/ZTJ8POm?=
 =?us-ascii?Q?Rp04UkMN7c7P6UTb6lEDgJ7WxwVWxBDp8NDaP27NFAVHlG5fhubexFIt8JYX?=
 =?us-ascii?Q?C1zVr43dIJHrMlBM1lGbtTigwKkbjvtvrX8Yj7v4aLe/9jFOhbwnD023C3G7?=
 =?us-ascii?Q?AQarCbrnp4d5aKcE3phY1RzHAg2Fj6mG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A70rQ6ncZ6EsgNBTpi+MASb/cd0xiPDy9vNPOo7C2/jjE8fRGebXgORfhWhD?=
 =?us-ascii?Q?ViCO2x/CPSSXAeIscwPWwyeVAnShV/O7RN1yqbqqOwAjgVefrOpCfiFRRhpq?=
 =?us-ascii?Q?/DSYiwuzqWYPLLoNyYJwNDq9/4/sCOtc1XQl62rQVB0orJPLqkTLAM2oJrZ4?=
 =?us-ascii?Q?GOXzO0Q0OobsvJjndfSzbnOHkFTEWxE2sDsZeHKbYAQcm4XqCAKGu8/e01xQ?=
 =?us-ascii?Q?aG5YIVx8jYjTCytROXbPrYUUejKgo5WXH61vhbLWcKEUptgzSMcZArJCbyog?=
 =?us-ascii?Q?uKPj5oPDlpxfa3Np1koDMtGQ6oneE7TwaX83GILDFJI0fbOqvTCrsDIc2ugY?=
 =?us-ascii?Q?HPq2AFpvuFvbq1fjan/ID4hvyqgTLeo8wsfoXiRa6eJIyVfY9tjF71SplUCs?=
 =?us-ascii?Q?TwZVhIMQh+b4yep7klbnnlN75CgDiz6rNj7DavMsNyoT1ZHeXYhQytYWHzby?=
 =?us-ascii?Q?L03KRHieqw242965JG1OROQ0yAhEhcat2DgG2ndmHBxSpUINtFwTXbvU0L9r?=
 =?us-ascii?Q?U2wWAuYKRJ9DMRa7HMRHZs/SRriAZkdStOaQ8bVFjIzIDjRYUHVmtC/gQtaI?=
 =?us-ascii?Q?0urRRVQ0yHcmjUvLxydOzwNt7VANY450jAIQ6M+IzjffUAj7uEC4lttu1mot?=
 =?us-ascii?Q?r0UfOzfAmws3oBWeCW27yoBtK3cBDtGPAxwISxzRL1fFw+mbK208I0T8SIov?=
 =?us-ascii?Q?CBiJhbrMdKJ1YgZ4sfsJPkckbxjvJVEiH7PLUdRUFkqrvvaUJkIbeWbB2yhK?=
 =?us-ascii?Q?Ez9WUhNoG+NYu+oLNlnicpH8LIQVMs5TmZRl1XZOEDajJrBmDKFoOtAdKaNB?=
 =?us-ascii?Q?7KRLwGZWiARiwv+1fS6q4YWXwAykJBIQUDk0dpjf2LBS5B5xNDAblthGa+bI?=
 =?us-ascii?Q?0Ll3oyZVuwhMNVI2DfQn2gwact+YcO2pwB6TxDesirWoUliO377aVKolqlQn?=
 =?us-ascii?Q?9h5uScWhc47KrWsgOeY0d0qWN1WymD7vUsxiSIVGJWt24vjEnRPjqOlt7MRt?=
 =?us-ascii?Q?XdWxO2/EwGirpQWV66pwnEf+tB+ZvFnGYvcOaNxpwbQzDv/OOgZqopSJ67c8?=
 =?us-ascii?Q?VQHMK21yZ2X6VsGQBE8fL5h44MQbx2CVozSldoRi+UJ6NTKK2Ih2kVXeHlm7?=
 =?us-ascii?Q?cLzAs37nLboMqkOREkFZ5Lw6sRAefuyTMo2hzSt3ErgkesUmGeWTUoCgxXSP?=
 =?us-ascii?Q?D/jxY829kmBSMXq8VcoPXbjsr9jqwWEjHMS5mQA6qrL8zwWT2H9LSEhml73B?=
 =?us-ascii?Q?mfDVv6dDNPgSPXITbz3qayOeGE+XX92UoGW0dzUC2+BwrmDvXkqcL861N3Ra?=
 =?us-ascii?Q?ZNXMy1qpt55yWQNGjVeCMtV232N3budgRPK2qTI9o7WE84rNGVnIzQCOe4SH?=
 =?us-ascii?Q?1guKRefd4kt3VZKTaxwvnMhnRDn+4qmw4PlGSTQde76toGfUDFfYI1E3zd6t?=
 =?us-ascii?Q?scBX7KwsZmHJOMqx5N73vJYyPLtZhOfMYjgci6dZjWJ7Z/a0culiSii+I6BL?=
 =?us-ascii?Q?AY6u/visEeNzhrMBNJGoq+IZl4EEJLh/0KIx75tpBsJ+R6Qxj2Vf7RMVDN61?=
 =?us-ascii?Q?48GoEhIKgR/VZ2n1neiWECZmgI3FzbHLFKs/TbXh/SXuT0OTM33Pzuj2psrR?=
 =?us-ascii?Q?SfG5FHcNObZiJ5goC7i4DVs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898bb8bb-4bf4-4642-1cd1-08dd308f9626
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:25:41.4876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0q0AeZiDGo8jr/kaZivso+KUi37h3tDw9iN83hSBhSMUqlcYQTYRWLLo9NE4Uquu5I9Z9g7QBLMX+l0RaKDRcaUlPw8dBQF51ufAnBJa3Fn5SqusdN9JLL5XL87xRDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-Proofpoint-GUID: vlEYkDK_JTtPa2WLGyvIOAL73cPoS8P4
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677f9618 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=6dGOS1gDf5vp_lC5mo8A:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vlEYkDK_JTtPa2WLGyvIOAL73cPoS8P4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=769
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209617

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

During the Rust build process, multiple copies of libstd-*.so are generated, as Rust copies the
required files from the stage2 build artifacts to the target image directory. When these build
binaries are copied to the image, Yocto's do_package step encounters an error. To resolve this,
the redundant libstd-*.so files are removed during the do_install step.

-----------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so:..
....
-----------------------------------------------------------------------------------------------

Multiple copies of libstd-*.so are generated during the Rust build process.
The redundant files are removed during the do_install step.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.80.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..b583508456 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
@@ -294,6 +295,7 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 addtask do_update_snapshot after do_patch
-- 
2.43.0


