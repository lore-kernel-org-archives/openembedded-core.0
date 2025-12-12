Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276AFD43369
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 02:37:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3898.1765507028915112881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 18:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pYfNSJOs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4441d9c407=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC0wdmU189862
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mXOLHIXAJp22rO1IVN/g
	5rB+E5JUr35iROfNrd3sqgY=; b=pYfNSJOsZAglh/+NgHlDLPcBdv03lbOvfTjM
	RTAcZeAYU/c0NiazCmpiDaAioWzGfyMMB8HAMkGrrjZd5L2TEARMYZGhFriC+d/J
	v5DLAR1T67cAIHIy8cG5QHOTqw8fn/5xMsA0F2e1s4VnnlagkTPoB+vM03V3qOK9
	DYrU+v3FROnwxiNbhUfhY0uX35rlTK212ERNaSi/4DwtX2Av2T3b6mdTwtJ7AwEJ
	wTARVDzBfToHJ6GlggUkHvDkVPQhg5ob6SdgNVCzfIb2ReGUrII6Eyk2UAJcGRiG
	An6w5D6Usttiep47ymkQ/26NzUhi9y45tFbsYj37L5S8c4LQSA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07htxay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:37:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXuFkAm7tg2f9fxlHelvgvL/9K8Tvrxbh/volein/7edIa5+jOcltbnQ/6RNWUcayh/yjq3EyMv28bCAMIlbiqSpymIufmVznj2Xln+YtM3EVKpXq2msqIVAYV6iQ4WScF2sj8tBKChExJsis6qNwAwSuD/HEITPXQeAqdd8B+wmnhdtkjMAQgLVvN8kANp1sQI+WJx8GML0df40lejmbOnHucPTzp5PT8vygliQ6FNZEAZCdrD4e8U2lbaQfwRDzbEbCj9UzcHOo06G+StE1MV/6u6cZX1LLv9T0XoN199AOYiaqzTWIZQ176/pb1Mni947GO07a879rtai3yqyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXOLHIXAJp22rO1IVN/g5rB+E5JUr35iROfNrd3sqgY=;
 b=sefseAjQZmuoSZjPQy16fxiCbywwZB7xUvj02sIsXuY1TRWBmaUOiOL3h7lf+/S7V5e4R0gahJ+Tbw85UXWUG4uhcY13+SnXQwgK4v9wodxzeu6iw+ivpPLgWf+e+U5g/xPQ2NrIZLC0TXVaBSDrcvryZVUv+O06OPLgsXgVvAxteoZ3F6F61BmNxb0bVIJHisqJKErqzesSTrKr2vk3Oz1b4R+lncPclPmmVrkyGtUihGLbEMbQUd3/WlkQoSPzKeQwZChF1d72u/kPJcAm4L6MnDV0YcUMZFsREyWlF3zfrgi30H/HsgKtEF2qvFVh/MV+45OnGlpIQ5i4E8irTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 02:37:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 02:37:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] qemuboot.bbclass: make nameserver configurable
Date: Fri, 12 Dec 2025 10:36:45 +0800
Message-Id: <20251212023645.4130495-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3318ef8f-3e4f-42e2-4b1c-08de3927559b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+VhW31Tmu4gvO9KSOSkjlypEwc+l0B2rzXeL7mzWrV3V6+pav9GDBFOBGVcM?=
 =?us-ascii?Q?sYx6M17jL4NYTSiwPg/aIKeopajbrhoDA0dZqQaJb61jd74+Ju+fxoNS2mTq?=
 =?us-ascii?Q?g+/nZg6dKXT01x4AS/U/7iTg3a3rdc0ZcROBwrcWoC+jWLJRAR+COkHH9/XC?=
 =?us-ascii?Q?KvlZvTskTzZ+h5ai9R7x7gb06kulT+N7eShbUDGqUmsIGdHer43AtYi4FV5+?=
 =?us-ascii?Q?5iU4UDuv5Sv9Wo4fS8NS2dYh6u1aCzyEoP/EQftmi+oSFtJt8OGnTYaCzuG8?=
 =?us-ascii?Q?O3MtLBzfvTEULZSQEjGZbCp4eREELzfoO0HkavR6Q9+X9rFX/f7VwHrqpsHK?=
 =?us-ascii?Q?hIvAIVbum/QKJyxhYYeB7MJaOaJYA0mNn1cOPtzPEsFoJLwQK/l457ObVaz/?=
 =?us-ascii?Q?5ZVvNQzrwdxrORpHGU2DGdFo6PLAA9GP4p2qKhONazBFlPx1qcn1hxfCrMJs?=
 =?us-ascii?Q?LIvGshmyV66hc+YTndTNlx4BxZSYYRsJIzWm5fzC47vr1L/CjYYy8uof0Sam?=
 =?us-ascii?Q?355V0O9RE7CpzV9G3/SrejcpKNssGPZ1ugtMOxbJ8FwtmBrtMgg8hDzRoYLZ?=
 =?us-ascii?Q?oiHshUPSKg1c1jLc68H1jfNExfW5E16yYNTGh4QYO+YWiFRYMCxix6SuhYAz?=
 =?us-ascii?Q?0qTRIeBjQnTolYztIaEW3e7q8La+zgmAEWsJ7YXBPZEsJxH/3TPG4wmVLiFv?=
 =?us-ascii?Q?SgVj3k8KMJWrD3rXwitQyQXe9aHS5WiLCQkff3lPNa2HT4Fbzag6xVIosyqA?=
 =?us-ascii?Q?BdW/Z8VuKCtugwFYrR9CGrTQMm3AUnShwiD996UsPGOX46yiQMBaOPylR3wR?=
 =?us-ascii?Q?bZi/xtZiIpipPY2AGvjr+BF4K6rN3UE4D6GE7fk9iB069sNn/Gcq920tZeuX?=
 =?us-ascii?Q?HuOyx0AFIt/lQQUz6XiPyrpuUhWP6y1Wi+SLTPEVxQgQDxh8F5M2Eytx5UBf?=
 =?us-ascii?Q?oasJxnu8hiY6di6/1wgsW7tbe1slZ3D6C79P7NyctNzi4Lw8Pw9ymrOIFtWV?=
 =?us-ascii?Q?8Hrk06DyPkvjGFuTYx8RzmPjeeMqksMISMt7GfwqKV145e26R/b0oUnHxCVO?=
 =?us-ascii?Q?+BkCMjBCl2khEXxjnRNuDCUQQ5IoWUsgRNTXN3ZgGaIMD9nzQLBYqfnh1T/L?=
 =?us-ascii?Q?0pxRnRb6zakgwpiwIOK5Lpa8F1e64utQlbg98ledACCsDM7eLr9vZ5hbPYaZ?=
 =?us-ascii?Q?F5JAJo8A55512JIE50k57zcwIKx32pq32WT/O3Ntx13GKkEAQ3hWC30AjqhD?=
 =?us-ascii?Q?zoM2ZH65WENjs1l2Zsf/iGC/Xc3Qc3UADZWsmG+Lhs+/jJGZdjGyHDXD1kib?=
 =?us-ascii?Q?Sml08qPgcO5W7WcjOPPGfnFK0ZAyz6OFi19soDKkeXjxPQyI14wtsgDsVaNz?=
 =?us-ascii?Q?zo/hh1pMQPgwS62bo3NrsBQ0WNKfO19FSo3I7tDsKsYWr+dTYYA/6Yy1uY8l?=
 =?us-ascii?Q?wefWuwv7E0eUZqqc3hqWVEqz7Ie0UB+53ByuSkSRmdH3C2s7NkK6hhHlu1CS?=
 =?us-ascii?Q?r+Hen2dL6sM12KQXqLVfvITCphA0AUMH4D9K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YHRY5i7LJnaYJXko9g5KvNy7kpsCbyRz+9lgHpEu4KOFYKZFahbPaAvAp7DK?=
 =?us-ascii?Q?UmTMXzcUtJzHmacdDJag7wFG190r1jQqdbm2i0v4t9NeoNlDe27UuZfGqe3W?=
 =?us-ascii?Q?1sE/HB8/+pdBQhoGxJaJsWmyPoa7J4jW8dnuTLtz+juZN4hrwUHjzwkRgoxM?=
 =?us-ascii?Q?UPgr+ECFo3tMmzSdTj6Vyav70qJPHnfBwaAbHH8Yzpcj/wsPghMxvU786HPU?=
 =?us-ascii?Q?eJpDqExoPLLAhNhDGHRQ4S0BLPUHs4vMHZsj+bLcmuuEDcltTKjH6mV32870?=
 =?us-ascii?Q?UMgrg9QEKHBxTVJG6l18/OkoOXVg5Nj9QOJCR5RA607GV0wK8Tn0FS+xAL1m?=
 =?us-ascii?Q?1DXoGhlrHsuE/2MWWS3kcG2YtWKdPVcqPAzEaZSCWz1DEHQvorbIDYWt8ln0?=
 =?us-ascii?Q?gKDhcwFqyttufoZhF94MLQuef77SWUZc5Q+qWZiHlvmNteIC9uXMpOeFytLa?=
 =?us-ascii?Q?qir03V6uAgvS9OtHd9YfSHav2hGsXsKHmQFTVafDg/d+2WQypsE1djZV04o8?=
 =?us-ascii?Q?NZy2jRUdxwJzb+mM7OcFy+FeEQ2roeaZXYJC8tgl8hSyvUX+uIZjjtbOufFM?=
 =?us-ascii?Q?+rrVELJmJJAQ0W2Sb7RWeMr1PRhLXteixrj/odLGq4xcUw0evK4nrpUD1f4j?=
 =?us-ascii?Q?fNTWVeAIjUtET3yvdn1lcOQVjcrRaNscTrMKO8/2JL4jk6ABVJuDa2E39273?=
 =?us-ascii?Q?BVm7PD/CkFoFT+U4ywlo4S5ClKcX2lhpMKOiqiEZWE6UrwQXsZMwR01KeMXy?=
 =?us-ascii?Q?fZRfJTDPiSe3g6hABfVXrRUylSFVvyR+U4sTDU3SmuTOXk18XDutqTdLh63b?=
 =?us-ascii?Q?fFJmvqPUM5eIIyxP0NSn5RMrrNK6RXROEdnZpm+FhI1gHcH0ipda7MgMcja9?=
 =?us-ascii?Q?kOzVkG18TLn/YZN3Gl3oAsZ1A4+WjNZOqUhXgeFWUDDXf3JoojrYoTKu5tdf?=
 =?us-ascii?Q?iNMoVQkymI7NvhdzKgpT3wqhHKHKWlfMLe/aVuuYHxQ/PY8aoOFm0TLKXMyu?=
 =?us-ascii?Q?0eZqZ8YnTtsrI1aQ/Jl2zyD1MAwRcomXckmmXWzvep7YyPf/uD42h2c3h/id?=
 =?us-ascii?Q?dLRoA3pLh5HO5LW2Omjz8ZLL8s8it6Orwowq2I9GGlHAdv/aRn0PQxjVqhLW?=
 =?us-ascii?Q?7wcV3xsvmXMnSZGqA13Zr05677ycYnIfyEd+2eHGCjbiMT0Hc4PgvB8wLDgp?=
 =?us-ascii?Q?eAwbNl2m4Gggb5DQ95FlRCPjvg3vILBMI5GXnJRS6zKelD1DsyEUudI9uqoj?=
 =?us-ascii?Q?ohQe/FomyHYOKnhyLwKZmDjnOohNToL+oT+roJWBaKLVIx5PXBM7dPzpXola?=
 =?us-ascii?Q?cj7GqQVmoI2B1TUaF5StzgsoJb7tLt+zahQCcua0yezDkBxorM04bb+r3Wq6?=
 =?us-ascii?Q?LzlrTOEenBORFTflnIxQUvLWQBbgJA97Lq6H+7tKda5Ji+sPjhslz8wyO+D/?=
 =?us-ascii?Q?eBKKzOK+lYpSIgJ5MrqMzjUH3Vfbj2pNo9LPj8rxh/eEfIhIqqOiWVfqeNXo?=
 =?us-ascii?Q?GWFhRSI86yr3ue7TTrYeAcYbL8Jix/OiZRpteDvGsVodYJmpPKsMZW+X0HKA?=
 =?us-ascii?Q?4YUz/abJe7Al0beUCvLEjCpAW/Yrk6AYVDT6YRKI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3318ef8f-3e4f-42e2-4b1c-08de3927559b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 02:37:03.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR2uBL3VTSdQ5iIUCG7UPbHJFRkAzFX/lvIAyncgla+gUw21L9GavjcuwpeVPDB8vsFxmwmUXKAeGi31Iy4tpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAyMCBTYWx0ZWRfXyPUb93nD9Yea
 WzAFc6PpNsilxSVAZPcBZby6tmGgntqss+H4kCy7XMDYaBfpkj8m2ej01hT3TMHV5jNcPS19hel
 ZSKDw4tRIhp9y90X5raJNE4vlhaF9abStrvbmzrLuR7TLHfz0zwDzlvRf//EDSCwmOUo/uWKmUp
 7JO3DziBPmFnA07MO14KYHGyqATou+JDorlQI3BRMxnzm/pX3yjCYv7na76sol0kontyhqkCHSW
 nU2ZNSaDTSviSvmJJAJbdYcRz5AdRCvX4UnrSYIQTuFSM70+0MAVK+KZWQae5tkmDbmIzn3TFY3
 CPKYq0k7WYyy2PwLbgHWbXK+4U2cGhn/6wECb1C9dIYePrsYhvG9uSKPLoKvSEUyowumAycb5Eg
 u2PQipze/6lpF75IBgYZaGeNErNEAQ==
X-Proofpoint-ORIG-GUID: UPpk_PIW_dcCrpOE1zKq_709d-oYJfm_
X-Proofpoint-GUID: UPpk_PIW_dcCrpOE1zKq_709d-oYJfm_
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693b7fd3 cx=c_pps
 a=2PUY6gUHBEqav+0eoazkAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8pif782wAAAA:8 a=t7CeM3EgAAAA:8 a=YyPblJXfQVqbtQJxjMgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227569

From: Chen Qi <Qi.Chen@windriver.com>

Instead of hardcoding '8.8.8.8' for tap interface, we introduce
QB_TAP_NAMESERVER to allow nameserver to be configured.

This helps improve runqemu user experience because users can easily
configure their nameservers to access the networks they want. Note
that this method does not change the contents of the rootfs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/qemuboot.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 69cd12ec54..56106b1958 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -106,7 +106,9 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 #
 QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 ${QB_NO_PNI}"
+# 8.8.8.8 is Google Public DNS: https://en.wikipedia.org/wiki/Google_Public_DNS
+QB_TAP_NAMESERVER ?= "8.8.8.8"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:${QB_TAP_NAMESERVER} ${QB_NO_PNI}"
 
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
-- 
2.34.1


