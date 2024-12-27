Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6BCE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 06:54:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9050.1735282441694782708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 22:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2091c24697=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6834t002033
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:54:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0wat8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:54:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geh6h/D5TNlYwZU1tPFSnrBDM004qMTOua90O4chA2el7RxpAIdnqWNPwXJ1OMVLCA+A73vNaRpdMEpSWWsTP1iX+WoUoQntHpxSWBSXIdNo5ebEL6n+tQ1SadcdOHC2Yj9AGsmmH3cI2S96CliIaW6rfV+7e/ggCTdGsk81kGdYKyt21NYs+U80GBOw54d8cGoCqWLX89VbSxGAdOYvI4Vy+8iZp1wAKHzPFZGZiSzMZv9UOL43uhTxJ9WsOenIrYSfIH5q1BhFLftVxcVHbNQ/JvqTu7tvaSsnAaSALvbLttESuht5d7nAswWmCpYP6XATSlnNXG9goCq+NLI3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMLFiW+Y9g4aP389qguAs/pWOVpVSE67b7fz52Oj100=;
 b=KZi8EaPWHXtZcCnTvnhEVdUAQ+jPjsTVMqP6ZlRWNgMrAXCclrqHk8BLZqHwZnC/qvotn+ei+d28rmJksIbCfpccINJL4t/6UC5mq9gMHMnfG4/yBNQfss5MwhaU9Q46waErAHHu/PU1SA5GvQQH0F+bQFdMBnQiCvWWMHDhFfDXgTLxVI1Be0RmDQJHGS4ML1h8ttxOB1PJjT5Q0rbifVzVU0BUk5i0NxCwxgDwyWiDikacU0RY72vRRVWESOLjt6eTjbOURA0uUdj6os7CujnLchwKzlN/XdjEHWEMiJbf9xMFb7Mxw3je+fW0mFhU9VcRIDLA+yw0UvrlFW1+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 06:53:54 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 06:53:54 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] rust: Upgrade 1.80.1->1.81.0
Date: Thu, 26 Dec 2024 22:53:37 -0800
Message-ID: <20241227065337.1257972-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b593c1-d00d-46ff-1d57-08dd26433a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KrhFPIHSEsWuia1plMldSyRDuA7zy5KxmEJm75tRkfpJjJxqKTswTmrLDJmD?=
 =?us-ascii?Q?zWEesdMTDSh3vB96npoKg9EO/hGSZRYmmGjYsOmafF+Eyr6x9/UVMg3ECoCP?=
 =?us-ascii?Q?bGZ4H3xORbyq7xOGatY9kCyxdQ5DOdklykMpqjdh37dZ55QCvTjN9qnTXn5q?=
 =?us-ascii?Q?ykSUDDxHA+7jGWZcJpb+tw+HLgv73EvTuTSdjqJ1TS0OWBlDnioQiatYDczT?=
 =?us-ascii?Q?Zd4kUQtosup874csJxIrjx6YaeFXlKkcflCLJo99ZRopiLUkpvqqrag9yW01?=
 =?us-ascii?Q?uoh7ip+qR8YH69U0XwpC3vXcla7fAoUzwwb+jwvp03c0QSR/fsB314K47sMd?=
 =?us-ascii?Q?bpsKHQud+QginO0GV+/17/A2hwVN4pW+YbnVp6+3XAnNsmGymQI39E1hmAf0?=
 =?us-ascii?Q?OJaReDs8C9fOpQ3r6z0R/AbG0W+o6WkbWtVUez6LBpSHqR7RUiOIy6iELoxi?=
 =?us-ascii?Q?Mo76iPAJB/7YaQIUVuT3CTTgFIEAX/lVlKm88f7eCjp+icq6Sg9q3PcYy5J3?=
 =?us-ascii?Q?HzpZoFG5np+4W4dUkvCFZ82vvXcluLiU4WJpfeHyxzMA0ylTDAkGLX1Xn350?=
 =?us-ascii?Q?dcPFnL4imzMdnKhRRrKqPt8rGgjKOJDNEtpIUtHgMrqjsOhT9CImB8entY0o?=
 =?us-ascii?Q?q8EZ0NTLGZ1NSqXI2Dzweq3/Wm+LeIJSHnwFlkGNVBSfhO6eUGh4I3HUQ99r?=
 =?us-ascii?Q?sd7r+FilUzDDoQd+FrzECnd7vPeYKKaWojqwWemn2o/qRmwQiBKSF/5uIqy4?=
 =?us-ascii?Q?07kP/cjC0k6w4iPOIlmTc8OptvAXdPJbK/CiXK6KJV7VEdDPYsnD4owQ7eCZ?=
 =?us-ascii?Q?BM/EFDHGNrZr/j/jJO4LojZ9Nz2MzGLnab9zNnqpFEwOb+/wRz6nu13Fcl0S?=
 =?us-ascii?Q?bbruw762ik5Lja5FEHbrr5VbvnkuK70LfmaT1Xr5iq0kAxjdGulHBZKh2BGQ?=
 =?us-ascii?Q?iIZVgGBQLd5ch9U1VFDvW+BXwQTlqqKMLomSR+7Lmn28NILjSsIq37+rJqNV?=
 =?us-ascii?Q?RIFHRo6cme/WrixAAtQW1P62JGg5sdVSQwAbL/w4WrhAw/aBB04TnzUwOQYg?=
 =?us-ascii?Q?a6/W4N5nLHcOX6beFLyHmA24gj5QIUKeBlAQcG9AnJWZZSvwsgppt0Y7sVKL?=
 =?us-ascii?Q?/3vk2e6Gimv1C8T7ikqBPwjegFH/P1kU+Ztvjkc+hwSm+Vbc7bwYAyq7nUS4?=
 =?us-ascii?Q?lXNuipbtptj8vlpqDgnP1YzEPgraXk47VKdxmKPqUXGZlUKEKFuE2k2JaKDd?=
 =?us-ascii?Q?csxttm+SFF91wD8q9xtuBQKSkgHN60KxSMTALa5ob2dwPtE5OVfA8lzBpFsa?=
 =?us-ascii?Q?Jq48tQ06rknxx5bQWThukRpWsry7H11iTej790wBbITFvqR2RO9wUPLLviu2?=
 =?us-ascii?Q?zoBFtwT+xmPMFcPYlz1ZpZLh4l23Dr9LMu3lVCBI8g8RLn9dIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+gxjIAY9TTmtd0iSMIN1hQTXKIEz35I7IZo+1Re6iZXVgAV4KBCNUEpfvMX1?=
 =?us-ascii?Q?KnjEz+jeLa7EZ1gVoAqk1IhU/sG+8zKq8uW9h/96a4gWyFMe0e8qH2BacT2J?=
 =?us-ascii?Q?iHwsybprwhMd0ee48XNsyo6RNxQ0m7gb5BtoDEqlp+46qt7lIx1nXnX1BRnE?=
 =?us-ascii?Q?xBAGWJo1WxvxIz7Tu/VSh+QlmxrVschk5CvMNptTrH86ZjVVVAQ9FduJyiQx?=
 =?us-ascii?Q?1AohPcbIIGZbqTNvvHSEbKJBYYTeT/nnqu3TRWi4gjJO8WiVO1IjdEFTFaE7?=
 =?us-ascii?Q?/2GVbVsTJdIze8Wl/t7glQ19ZwTLBL7UTiiFyoy6bKdOZvfeopdzQmffuhU4?=
 =?us-ascii?Q?gBj/j3Cj5xXbFSS4cmBVQgh8KG33l45eyys6NqZARDMhLisspQCVDcATfujY?=
 =?us-ascii?Q?pw2ANMoz5gnj2REBhj7BkfbBWLYRX2ZLvL6GNZ+hN6EjxxINlUTP52NiIx6j?=
 =?us-ascii?Q?Z/vLuJG0uwtRMpJw9WMC1FVHxtCM+AKKF1dcOTEDnBFCgOdCL98b96SWIREw?=
 =?us-ascii?Q?4Yp4fl9AchmidoH/sP7nqx95QjqTPiYYeuVUVsSVO0vhMoPsKWwM9tbOyXSc?=
 =?us-ascii?Q?1dLlvmAFbhh67XpbZP3fRqllba2yOgHXOAYLgNWD/Flw6YUH+Xcwb0p60oMd?=
 =?us-ascii?Q?3agDezIZD25IsZx+EPFG64WTtR7g2PZKHz5uRWZzMWfT99Rn8VLqWnHYLNQD?=
 =?us-ascii?Q?qfO21s7pj6EYVlhHCscBRgbpJBbg4OXjLDdCNtgIuergaa1xEXdGDx2VWYoa?=
 =?us-ascii?Q?GbfaDPCHEfsl5SaRjei09fboSxzGTVaXo4tu0D+Wi/AFK2PnYM6pUR0ox3C0?=
 =?us-ascii?Q?DbkVcBIKZX4EDPQ0PagDvBo90vQatrM8kk0kGjh/08PKa/3XmUtq5nKSBEf5?=
 =?us-ascii?Q?XeBxX5to8P8Hlq5AqaGeZKB8swQ2tmn3xD8P2oLkN7/QFpzIQHhJQGO/NvLZ?=
 =?us-ascii?Q?g4CNlWObocVaKpSFvhn21xzGKmuBEYu+7UqGNbfRW/Zk6/5nXvsIDEvnpRTC?=
 =?us-ascii?Q?/7ijilsk/QssSLnt1QB6kPwcQPlahnfP4sW3YQ0XxJxyqEQ87+juwwdEBcPg?=
 =?us-ascii?Q?3oSEHODUkTaheCTeXJB7GSh0pPny+zsLyZqm8K7LggCXiT0VNtP8CuLO//zK?=
 =?us-ascii?Q?I3lO9j+F7wQjDALssTYpXMf/jN+R8arkxZkEaK+N8wFFbxdBC/4rdiwz6XYV?=
 =?us-ascii?Q?tcuDH3IX+gpIS2ImsBckiIA+fD8xAAlV5iUMddJTk9ubkP4jz/0LjrakB6XF?=
 =?us-ascii?Q?E3/WgfLDesmB15p+JSw/se2y585Zvldpfnwq8Gg53u+ubz8gMpD8oF3heZVN?=
 =?us-ascii?Q?IlhgLz0avrVtLqmqb9l81tSPtS0QioqF3lQQNjGRU9X/ndR6IcreUysU6IRH?=
 =?us-ascii?Q?6IFdeniz2+oTKbb7JhahqE3TNG2XuvQHg7rZArQqvX3lddwkyFoKEOG+iFat?=
 =?us-ascii?Q?SZMjqen+0bPiMLCrwtws4T2Jm2xU1+k1pliNkZEsF5x2iZ8o6HeWsWp446km?=
 =?us-ascii?Q?F5uGW9hsVx1aK8vRo4dLr7AMq1HDY2gC+sCr/W/6jpA1vl6R3Z2vCLPZW68Z?=
 =?us-ascii?Q?kN5eNPDtq+FLkYgXcZ7cNgMb15ATvLwarNNMaJkDSUy/4aTPuDai6NKjfoeL?=
 =?us-ascii?Q?LGPIlQ3XJa3YKaTkLIDtrwE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b593c1-d00d-46ff-1d57-08dd26433a9d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 06:53:54.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNtbA7E5kCms2jopIgQohER+Z2BdYkdjmcX0ZBa/wrXNr/LLjGwLgLc6YOjLb2CpgaYCGZieAZhSkCN+m1BKinn8dbYlDPXNy1j8PlJOiSI/6xmeN/+AxudLI+WFM/5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676e4f08 cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=navRoStkKKgR38ecjcUA:9 a=f8od9IJyfylVoEKq:21 a=On0Qz11iJF4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: lkhtklTdaGI6v5xuzWtSwqHOcdoi23Zu
X-Proofpoint-GUID: lkhtklTdaGI6v5xuzWtSwqHOcdoi23Zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209096

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://blog.rust-lang.org/2024/09/05/Rust-1.81.0.html

Dropped:
0001-cargo-do-not-write-host-information-into-compilation.patch
hardcodepaths.patch

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.80.1.bb =3D> cargo_1.81.0.bb} |  0
 ...te-host-information-into-compilation.patch | 51 ------------
 .../rust/files/hardcodepaths.patch            | 46 -----------
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 53 ++++++++++++-
 ...ibstd-rs_1.80.1.bb =3D> libstd-rs_1.81.0.bb} |  0
 ....80.1.bb =3D> rust-cross-canadian_1.81.0.bb} |  0
 ...ust-llvm_1.80.1.bb =3D> rust-llvm_1.81.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  4 +-
 .../rust/{rust_1.80.1.bb =3D> rust_1.81.0.bb}   |  0
 11 files changed, 93 insertions(+), 141 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.80.1.bb =3D> cargo_1.81.0.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-cargo-do-not-writ=
e-host-information-into-compilation.patch
 delete mode 100644 meta/recipes-devtools/rust/files/hardcodepaths.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.80.1.bb =3D> libstd-rs_1.81=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.80.1.bb =3D> rust=
-cross-canadian_1.81.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.80.1.bb =3D> rust-llvm_1.81=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.80.1.bb =3D> rust_1.81.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 8ccef0a4d8..c0817a2bf5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
 LINUXLIBCVERSION ?=3D "6.12%"
 QEMUVERSION ?=3D "9.2%"
 GOVERSION ?=3D "1.22%"
-RUSTVERSION ?=3D "1.80%"
+RUSTVERSION ?=3D "1.81%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.80.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.81.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.80.1.bb
rename to meta/recipes-devtools/rust/cargo_1.81.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-=
information-into-compilation.patch b/meta/recipes-devtools/rust/files/0001-=
cargo-do-not-write-host-information-into-compilation.patch
deleted file mode 100644
index 7579ea0b5f..0000000000
--- a/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-informa=
tion-into-compilation.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 065d7c263091118437465d714d8a29dbb6296921 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 13 May 2024 14:57:54 +0200
-Subject: [PATCH] cargo: do not write host information into compilation unit
- hashes
-
-This breaks reproducibility in cross-builds where the cross-target
-can be the same, but build hosts are different, as seen with
-"rustc --version -v":
-...
-host: x86_64-unknown-linux-gnu
-
-vs.
-
-host: aarch64-unknown-linux-gnu
-
-This can possibly be improved by only hashing host info if the build
-is a native one (e.g. there's no --target option passed to cargo
-invocation) but I'm not sure how.
-
-Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/c=
argo/issues/13922]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- .../src/cargo/core/compiler/context/compilation_files.rs      | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilat=
ion_files.rs b/src/tools/cargo/src/cargo/core/compiler/build_runner/compila=
tion_files.rs
-index d83dbf10c..b2ad8d9f3 100644
---- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_fil=
es.rs
-+++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_fil=
es.rs
-@@ -652,7 +652,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hash=
er: &mut StableHasher) {
-     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
-         // For stable, keep the artifacts separate. This helps if someone=
 is
-         // testing multiple versions, to avoid recompiles.
--        bcx.rustc().verbose_version.hash(hasher);
-+        //bcx.rustc().verbose_version.hash(hasher);
-         return;
-     }
-     // On "nightly"/"beta"/"dev"/etc, keep each "channel" separate. Don't=
 hash
-@@ -665,7 +665,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hash=
er: &mut StableHasher) {
-     // Keep "host" since some people switch hosts to implicitly change
-     // targets, (like gnu vs musl or gnu vs msvc). In the future, we may =
want
-     // to consider hashing `unit.kind.short_name()` instead.
--    bcx.rustc().host.hash(hasher);
-+    //bcx.rustc().host.hash(hasher);
-     // None of the other lines are important. Currently they are:
-     // binary: rustc  <-- or "rustdoc"
-     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/rust/files/hardcodepaths.patch b/meta/re=
cipes-devtools/rust/files/hardcodepaths.patch
deleted file mode 100644
index 696654227e..0000000000
--- a/meta/recipes-devtools/rust/files/hardcodepaths.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-When building for the target, some build paths end up embedded in the bina=
ries.
-These changes remove that. Further investigation is needed to work out the=
 way
-to resolve these issues properly upstream.
-
-Upstream-Status: Inappropriate [patches need rework]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
-diff --git a/compiler/rustc_codegen_llvm/src/context.rs b/compiler/rustc_c=
odegen_llvm/src/context.rs
-index b4b2ab1e1f8a..8bb3e3f0557c 100644
---- a/compiler/rustc_codegen_llvm/src/context.rs
-+++ b/compiler/rustc_codegen_llvm/src/context.rs
-@@ -34,7 +34,6 @@
- use smallvec::SmallVec;
-
- use libc::c_uint;
--use std::borrow::Borrow;
- use std::cell::{Cell, RefCell};
- use std::ffi::CStr;
- use std::str;
-@@ -155,25 +154,6 @@
-         }
-     }
-=20
--    // Ensure the data-layout values hardcoded remain the defaults.
--    {
--        let tm =3D crate::back::write::create_informational_target_machin=
e(tcx.sess);
--        llvm::LLVMRustSetDataLayoutFromTargetMachine(llmod, &tm);
--
--        let llvm_data_layout =3D llvm::LLVMGetDataLayoutStr(llmod);
--        let llvm_data_layout =3D str::from_utf8(CStr::from_ptr(llvm_data_=
layout).to_bytes())
--            .expect("got a non-UTF8 data-layout from LLVM");
--
--        if target_data_layout !=3D llvm_data_layout {
--            tcx.dcx().emit_err(crate::errors::MismatchedDataLayout {
--                rustc_target: sess.opts.target_triple.to_string().as_str(=
),
--                rustc_layout: target_data_layout.as_str(),
--                llvm_target: sess.target.llvm_target.borrow(),
--                llvm_layout: llvm_data_layout,
--            });
--        }
--    }
--
-     let data_layout =3D SmallCStr::new(&target_data_layout);
-     llvm::LLVMSetDataLayout(llmod, data_layout.as_ptr());
-
diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
index e3f57e764c..e052c32b81 100644
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -1,4 +1,4 @@
-rust: reproducibility issue fix with v1.80
+rust: reproducibility issue fix with v1.81
=20
 A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
 By the following changes same hash values will be genarted even for diffre=
nt build paths.
@@ -49,6 +49,57 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@windrive=
r.com>
          let obj =3D dst
              .join(format!("{:016x}-{}", hasher.finish(), basename))
              .with_extension("o");
+diff --git a/vendor/cc-1.0.99/src/command_helpers.rs b/vendor/cc-1.0.99/sr=
c/command_helpers.rs
+index fe919a5239..2b1f442019 100644
+--- a/vendor/cc-1.0.99/src/command_helpers.rs
++++ b/vendor/cc-1.0.99/src/command_helpers.rs
+@@ -257,6 +257,7 @@ fn wait_on_child(
+ /// and store them in the output Object.
+ pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
+     let mut objects =3D Vec::with_capacity(files.len());
++    let target_substring =3D ["rustc"];
+     for file in files {
+         let basename =3D file
+             .file_name()
+@@ -277,10 +278,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+             })?
+             .to_string_lossy();
+
++        // Function to find the position of the first occurrence of the t=
arget substring
++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usiz=
e> {
++            let mut pos =3D None;
++            for target in targets {
++                if let Some(index) =3D s.rfind(target) {
++                    //If a target is found and pos is None, set it
++                        if pos.is_none() || index < pos.unwrap() {
++                            pos =3D Some(index);
++                        }
++                }
++            }
++            pos
++        }
++
++        let filtered_dirname =3D if let Some(pos) =3D find_target_positio=
n(&dirname, &target_substring) {
++            dirname[pos..].to_string()  //Keep everything from the target=
 substring onwards
++        }  else {
++            dirname.to_string()  //If target substring is not found, keep=
 the original dirname
++        };
+         // Hash the dirname. This should prevent conflicts if we have mul=
tiple
+         // object files with the same filename in different subfolders.
+         let mut hasher =3D hash_map::DefaultHasher::new();
+-        hasher.write(dirname.to_string().as_bytes());
++        hasher.write(filtered_dirname.as_bytes());
+         let obj =3D dst
+             .join(format!("{:016x}-{}", hasher.finish(), basename))
+             .with_extension("o");
+diff --git a/vendor/cc-1.0.99/.cargo-checksum.json b/vendor/cc-1.0.99/.car=
go-checksum.json
+index b070eeb322..ba768ff86f 100644
+--- a/vendor/cc-1.0.99/.cargo-checksum.json
++++ b/vendor/cc-1.0.99/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb12237c1=
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
+\ No newline at end of file
++{"files":{"Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb12237c1=
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
 --- a/vendor/cc-1.0.97/.cargo-checksum.json
 +++ b/vendor/cc-1.0.97/.cargo-checksum.json
 @@ -1 +1 @@
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.81.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.81.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.81.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.80.1.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.81.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.81.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 66d777f623..4446863576 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.79.0"
+SNAPSHOT_VERSION =3D "1.80.1"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "4ca5e9bd141b0111387ea1aa035=
5f87eb8d0da52fbc616cefa4ecde4997aa65b"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "77803cfff2ea0342f26b59eabe=
c353bc43a1791012aa70855ecfea0fb7ae76ac"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "519abf4757fbd8d7e3bb4e4c=
fdc362ded972c1d95f04675684df2d31e8c0899b"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "9c847b42b81325d25a9240e33bf=
03fa8652f5dd321ae90a9a7a58b46bf124b17"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "a8c4f1ab2f65e7579eb80153fd1=
ca9a0b365ca31ca6ae0ebd34156e0724dfc60"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "3d522172f9797e65c609a640af=
7f4ac331525150c91f93e41798c5578e9523e9"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "8fc4bfc3a5fe64f8530964a5=
ea3bda95e39357eff14d6a8bb24f010ecc912923"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "fc21ca734504c3d0ccaf361f05c=
b491142c365ce8a326f942206b0199c49bbb4"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "57bd43f363ebd399a38aa4ac3b137e=
9172706770f8b23479f9dd859c6ae779ab"
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1d2612c829d946ca8ce32f2beacfd=
e2c5ebed1fcacb720a58fb8e7786e4c82f2"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "158294f7c424ef75d84046b573f=
225c15d531745cc79d416a18c11aa8253830e"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "4695a6eb66252d519510ca0a859803=
fff3a5041f71004404df0ccc9fbf0298d5"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "b0f6d95c8a292b1276f30b1bca1419=
7b28297c2fcd51974ef320d05497be3ca3"
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D "a6899744ed734dd3a9f59631a9437=
21bfe67ed6273e60dd67e8636820c1bfffd"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "6547876dcf243aeeeadaa38dbdc=
e02c316b6f83305a5337520e02eaffc90834b"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "b40c1437491d0a24756b6baabb14c2=
d4d0def199bc652f16e417addb171ac977"
=20
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "354d498a8e36abe6ebd7bd8=
59c8c7e7f02b029aa1897b9b60a87e9902ebb1079"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "88eab562705d56a246a09f=
2897cbae9e37a66dc3cc2cab52c781cd78024f2b52"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "88730b1b0d9c5252e041=
ed1fc2375d7292dc45132bcc8b6214490c578de240d3"
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "f39a604e1a5a5ba1c7342c9=
d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "843272f7ab9b2f8c24f1747=
249275e0472fb2ede90f3a404e897559ddb898c18"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "e4dba3b66bd8f811c8508f=
d3be1bf136b714018768d9f16a96f601ebd375bcc6"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "68f30f3743b573e205ec=
c1733e1250ffb8d8d81e131c3b2f4a819b7e1e610d62"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "5ae96e69573690aa48ffb9f=
ecc62826ffb5d2fc280d19d1e54ab36ff48e28b68"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "2a55e97ce512c27a012720bb2a0=
cd86554c1d734b5cb91b98f58af167cc0fde1"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "1ae0bbe5835d9461a12f22d509=
787e6c11aac8335c677152a57a04f8d22cf755"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6aa2f351bc7dccb544781f4f=
ecddb5ef67e05bb310c84e0106d968231384d9f4"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3b9a8067e97dd269a27fe91be16=
3e046e85b47973f5d512c3368c49d332dacb1"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "a88402d95f2959caaff20037144=
d3109a69ce3310e1dfbb27231dacd50fa2988"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "ae1762dc8fd679d65154d5af95=
00c7539f55ec9d049ab736a910893d382fd6c0"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "88e8144c25ef8347471dd53e=
ea7af62e5b31eadf0788f4a82be7560f5a0be255"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "5f435b48316a719c87fb27f49c0=
b37884cef7dd3ecba76df9db2a4008cc03458"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "1e2ffcc41a2083be2f4733d53=
4d5ee0e05fc2ace1f21033792a4e2497cbbfbe4"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0bceeb8dc5b48e5ea9cff67c=
dcf8488fe2afe44d7e75ca04669c7c0c2e02a0df"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "af95929af71494ee3e6988=
ead07204ea05b6f2b729cdb1ffcc26db75e47bf318"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "2295d50425ed5dfb028560ac0=
f9a611212d8deb43791a1d199419043157ab95e"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "be2707eaa24f34775c98044f9=
2c391a2c6037a2214adab9e83c62903001fb577"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "a422a3b638c42f26ada441d2=
940a44a8c0f1ade9459f86d48a3d8fcc866bc60b"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "cb5ad871a0a7efe7c270cb=
f319d006a84e8f8526acb22ce941f2840fd0e368c2"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "e3257dc0790728498cf2773c3=
ca66d728381cc6d1f403969bd282223bd97aa3d"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "bec32adad9f2cd1650ed24e=
e82fccf7329c68243cdef7cef1e720ccaea097dab"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "6bb12041b6171e80598c0c=
04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "3b5d53d70837d5ec942e=
c41a8da37ed932bbdc1e53f78dc54e218db458701588"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b144840f179114cde30789=
09370bfb6928153d0ae303ac9848622c57cee3578"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "a523cf21d751be597a19830=
136e3479b7f22d3642d95f53f78a11e770d971d28"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "93ce75f4edf2c3b792714d=
33e279c5743d9d3ef841f8f2d8a7e76c9c7d74f952"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "06633b26384cba594424=
ec02acf0d64d4724033a856a2e039a18a518cacf1d3e"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "5f72f8723a2023b0bbd64cf=
c3d10959c4210b68579ad8e174809d17e1e2ead36"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "83e28f3e02cce4a9d19841bcb=
40ec0c8ad4e9af9fb215c39876028e6e9e6baf1"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "fbc978db4be2e6fdb1dbcb3c=
a00ee54c44dafd08930738f1c6aa7ae249685a34"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "2b8af4060acb10f347c66a=
3477ae92151beba12192590ea40723dcf9b1f7f5b2"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "1b952b8cd597060ac07bbe99c=
ea382651ca6eee4ac2abe0a90303ccf2278e60e"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "29e996af02293562f6ee79032=
a5414fffbf77e75cb7f0ba89053849986cb6303"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "24465ce5fe8f04d9b54c31a2=
c5bcaba6d702925ac3cdec0af5b954643013db90"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "1fbbe8df7596682466ae2f=
ca534d5f6bae8b3f32577450e2632955268a786a06"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "838d78ef8b9a11751b1dfb2cf=
2abfdc845deca8f0002c11930d54577b433cb93"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "5663e6ea018a13f1c87ac74de2678=
29952ea979fbe5f8ee5c1c3531e25d1749c"
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c00bd892e0f29bbc2514f87c7521=
210ced8c175a41eee0a428e19a6ef157779f"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d70e710a5138871e8d972f195c=
ed9f7aa639ccef23a87fa03cc527d2b9c3cd36"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "ef4b494fb7356b6e88a69b71378c0=
4ae0f4a3c264adae84c9d4f3a1314eaa2b4"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "0c22278b4e8afa79de0cae798575c=
9ef258e73d0555b18a84efd5d042c69c6e2"
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "52c3368de0e01b07f89f74a4b362=
79be1b7d2312b05253c7c9ccb50bc38f263a"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "e732ce690fd63e3c2576bfe83a=
556031c4805c17b35b8a1c1a0ddde5cee31d46"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "0c06439db686645be36390969b503=
996608f25954eab2b7fd9a2915da6c0bd7b"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "07fcadd27b645ad58ff4dae5ef16=
6fd730311bbae8f25f6640fe1bfd2a1f3c3c"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "3fb282ee97626e4f25c4f6faac3=
997859b89f13983dd6fa111e25182dfcb91fa"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2c914483c0882d44af2e50a18=
1cbd2c953d672d50b31aa669ee2346cade1f108"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a04cf42022d0a5faf01c31082bfb=
1dde9c38409f0ca6da90a3e40faa03e797ae"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "da9340b3249f08656cd4fe10e47a=
a292c7cd79903870a5863064731a00b5b27e"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "e01d434e952821900f37824c797=
f87ed16db79e54fcbd2f396b2f1b5cb2e3c55"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "b793405538d8b6ec1632779ef=
a8835b07b8987db2008c5c9c809bc4b17dcb121"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "0367f069b49560af5c61810530d4=
721ad13eecfcb48952e67a2c32be903d5043"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "9c38f2cd4c19196fcf113166237=
ab03512bf19ce5a7f13c3bfe0e5cc3317eb44"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "94927cdfa7cad391700b1a77730=
bb17aa364831ff6a6c40ce6500a14c1314647"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "f7c7a73a8e5640f9d5aca6b2=
6866b4da08cf3d3509ed1c4184309fb868acbff2"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "ee7fa0104b019eec22750ac6=
35e699d21dbb5430fc6982c495533900ec568d5b"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index c39c954c49..8484c94ef8 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,17 +1,15 @@
 RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
=20
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
-            file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://rv32-rustix-libc-backend.patch;patchdir=3D${RUSTSRC} \
             file://rv32-cargo-rustix-0.38.28-fix.patch;patchdir=3D${RUSTSR=
C} \
-            file://0001-cargo-do-not-write-host-information-into-compilati=
on.patch;patchdir=3D${RUSTSRC} \
             file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.p=
atch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.pa=
tch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d=
122a15b3ea13be77947"
+SRC_URI[rust.sha256sum] =3D "36217ef7e32f40a180e3d79bd666b4dfdaed49dd38102=
3a5fb765fd12d0092ce"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devto=
ols/rust/rust_1.81.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.80.1.bb
rename to meta/recipes-devtools/rust/rust_1.81.0.bb
--=20
2.43.0


