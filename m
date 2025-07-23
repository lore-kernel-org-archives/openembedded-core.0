Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC98C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 10:49:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11128.1753267784459394087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 03:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299b9e9f8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N69NoG2239845
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:49:44 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv21wb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF6uWxug+KcZeG711IzmcKeHxmpsvH1qoWs+w9AJGawwXCFBOzjO2r4jE9CgFcrh3eD9TvS0TMDLzHVPyeGgWsI9R3oSmSAJFcdgIjwVIQohz7nKUS6+BoxZdLXYZSHjtU0zKM/GOMSoA8Muls7115vBBUPjwDp0Kp13P77B7ES1wBLtMVBX73mIKiHyZnVMTkzZiP5BZJ/kkbMO3tAh0zG720n0RYQtXlt5fgnMp+LYoB9QASHCz3f0deV+kubuK/9ZiN4XpMg2q9WiTzzat7ZgrR/NfmF9fL99VpSzUDG/uvkDGOZ35V4xqs+FCivE5dBGwkgmBKHaZzQrsdrITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqqP4LNUDbM5uB5cb1aQVYiMGZKRzav7esbhIbBn9a8=;
 b=sfJHyfnfzpHWMG4X71RMx8SxoO4qpw8Ex4ZR7CCZjj/rPaHV7spcA/lms4xp/Pfy9ISkv9oMw+pYF961qmMcWS6NyFpHQ4KHJAq62ZpCUTorZyz9blJEd6y96DXWSyPC9UE3CNkTf6+5K/ohLUtqQoD3B2huAaKMRzvYyoez9oCOcmnfMqbX1jCym1wD7qNzTw0RonPA5lreON+ZspX3Kq89UObdjj5j+UOBEy+R/7Fm84cTwYBS7AWiIP+zX1wupeOLwk6NPlw3VvJ+acqcxuKyC07BTCn3APhHSqVu7eaUIbNRJ1fBRqz+OE9sB1IIg3KJwoJSVqn4AVvxHYaTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:49:40 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:49:40 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: set CVE_STATUS for CVE-2025-5791
Date: Wed, 23 Jul 2025 03:49:22 -0700
Message-ID: <20250723104923.1204089-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4afe25-c0b4-4c24-aee1-08ddc9d6a001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cE8PFvVmIMGw9wOj7Q1/aGGTn/qIR6zBrzmjULgV5S6ZvHyFVzH3Nfg+k9O8?=
 =?us-ascii?Q?3AN7PrObMQlyIlKAVZg3f48iaH/xZBXMfArtGsIEHgvcctncTrt/NR3XywvC?=
 =?us-ascii?Q?qNSL2pMQcHJl7wuY3Ru7YToGlHHAcMN76BWmBx8vJlWoORvpDxca1b8Q49jO?=
 =?us-ascii?Q?ffl1Di1Bb3VNcPf6+hHL8FSiuOpGgUfmviCkUirsvMtTdmOPvJnFDNfEEI9e?=
 =?us-ascii?Q?AQLZAlrsF4GYJKqCdoWX7IZREyKcu5LKM4Aco1j7VH2BL3n8mIflgnXmDwpG?=
 =?us-ascii?Q?o2H00YJBM9l6i6auBEf5G0wThzxC1uEiPS77AAsdHkm9E1LxB4Oo2RYyhSq7?=
 =?us-ascii?Q?iFtbvbFYzXXpxlM1khE+3xA4Yt+SsPxhIGZViefItcJnTOHqNg1P3MuiiXlJ?=
 =?us-ascii?Q?MGTOUEX4BxOeEnq4evuctsz/miTC5HLiKnFz/XFkGc71PrhyKTiF6V1yMQn/?=
 =?us-ascii?Q?Y8RZ6E/zkWur2l9QC2piZhXzInfFP0WscP13LWPu5xjjfjiRdhDvdMXpu5ek?=
 =?us-ascii?Q?+c4ipb6MXtIeaBJ90A4RCMUcJgCMzEnza/Ctj6xxdX09Qw4oa6asFhQTy5lW?=
 =?us-ascii?Q?F/jTB0hwcmO4q0NvFayBEbCPvzGoL3tltqwbG+QHx5xgS+3WQ0U/gjeO1gph?=
 =?us-ascii?Q?ykOWI+is4NcYzdMzzvDHLCKhQf1JK9JayoZ45gWG6Rr39O7kRgmizMT/7YEO?=
 =?us-ascii?Q?fWZhq3XDFPCPV4jWPDC80sG8188FCHHGPwAb1oY9LMsVgxTRjb9+IUCrMpdT?=
 =?us-ascii?Q?x9NcdKXhl1Yki7ILefYa0E9OSZh64MnteXcstXVxXMtP2oEhEHrue/CxFoVS?=
 =?us-ascii?Q?b/SPEsnVPU9qz1qiSljJw+c48WCeeJ2XqwaT7x17FG7EEnw0+2igNvprGFNa?=
 =?us-ascii?Q?61n6NeHgJ17Pov5Y0L0pLQ2IZM/xfMhTOCDST9tum4YGesV4Ctk9oOtJMnkS?=
 =?us-ascii?Q?4026UR//swKpgxnUHX3Dglh7SPzXjX6IwHx5vwk5NplwaLaezULveR0/dDwL?=
 =?us-ascii?Q?RR63pz7tblzhwQChHYLK7BYPXizT1FAsAwx2K6icjFN9NQLCr8QiwPO3xmlI?=
 =?us-ascii?Q?g4r1RU0EPoq5HgPYSJVYvAWosh/omf0zMZ/Ed4msjaN4X0W12THKW1SvqsPD?=
 =?us-ascii?Q?TWAtghpmixno5UBepjZmExlg8B+06u8yeD7wB4l9zEpImmeqs2P5wIsGd2tz?=
 =?us-ascii?Q?eqOigY98AuWrMm190c08uqNvkMlepv6Tb+z4kx/13AElqi4CK+OLN8V78gLs?=
 =?us-ascii?Q?jH+bbrmS/ZXoB5bBsmZj/S7fFBdKBeDL+bEng3vWAU7t/DCbLCXes1fw7m2V?=
 =?us-ascii?Q?RiAsjuU16iTMys7yor/lMh/GoNeJTXufVO/WRHnXAX46lZN6zpfyCHD5f0cq?=
 =?us-ascii?Q?yHNBaZ8cFUJshOI0SQP35WyXSvderttVj2EMN6X1flkOdW8yCE3EYBq3/8Pw?=
 =?us-ascii?Q?KMQycRnKckXKkxNMDm8Fs04if2xawTnru0YnmJF1ymhxBr1O9guFbdfy2krf?=
 =?us-ascii?Q?YdrkHaQAIDdDToY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w/tt2Y1tEc4LW6+Vc1jsVJOMyYmw6w15Ghro5nGpV4EQ/elzDYqDGps2Hlmz?=
 =?us-ascii?Q?XEKdumHCvSBCgIN+ZH1ACKpTCJWH5jZPSh8CruINv5PscMlXrfVDL+MjIfo/?=
 =?us-ascii?Q?xsd1zw5y5OU6e32zA8NjkGNT9P2b7YtGFbJpbx7208LKcdg/Y34X4pqYXVjw?=
 =?us-ascii?Q?Ph/25VkupeAF2aIZHzbM4tvHL4FzVKWJO05fCkzp54w7YhZZeW2qhEGRAbHc?=
 =?us-ascii?Q?nZQ5qNHIKq8Q545HQc8hJVvHXCXIvEIcOAA4uBvk5zkAW187bMzgZbgmVPFh?=
 =?us-ascii?Q?yZRe1LnwVmhbpMjbHi6aT9bhI6Sy/JcfxiiaGvjV1bReRWuentia4h5kcPFM?=
 =?us-ascii?Q?NXuby5PBuuu8qDh36iXoXof9Ubaj50hpFzRbq306d+mGpEpaijYjLedFhqXk?=
 =?us-ascii?Q?019lxSQxj59lAzazWNuvXxCXbeownvtVmcYn7231I7hm7J7ketIsl05fr0iB?=
 =?us-ascii?Q?VQ3UsNOR0GJLfdPsTIT2ZEE31Hu7CuGRg0I4iiFjNHh7YaJMv7bREsrvWjqg?=
 =?us-ascii?Q?Bfou5atUwGhqEtQ9xqOAdmsY5qde3ucKI3S7Dn3wkkGNLdtUo+jjCTJUxdaI?=
 =?us-ascii?Q?jOIV12uBC4JY7twslJppMmxbuDzYbc1U7YKHj8JzMyiRtOdnpZpY2fpwb7xe?=
 =?us-ascii?Q?y4L/zKKysJxYCm5OJROfHeIE3iPYq+gh66e6n3bhprHSxc7wk+TUFibZyM2h?=
 =?us-ascii?Q?Xv91XYnxEwBonKCTNnUC6LQT/vP769wf9NgUXjEwnK30B5iQeiQPU9e+O3aL?=
 =?us-ascii?Q?OndRvr5xaJmFwmJoVxaqJ+lJeal5cbm8Nnp2zn3dkZlCjkQ5KGDe8ke3xj+D?=
 =?us-ascii?Q?AfjZ9t4x+IqxVQhT6TIuhJsNCTuj9gv7yCqgJL6/M1OmMsoK+eLrrbkU1p/9?=
 =?us-ascii?Q?FmL6ohKSdira95t5DTonpyGIxgOxHewVW1uORtNxh/aERb1fPPTNe/bI39+Y?=
 =?us-ascii?Q?YwCo7qwWCBVR4vDw2221wE6t3THiTHLF9gT06TId1xeWkNZmFVvkmUTG3kzW?=
 =?us-ascii?Q?U265jLOVzfCEVRr2IZHfC/FPfjVkvWFTEMuD9OBokvxqt8ov9aDhWkqhMx/m?=
 =?us-ascii?Q?JuaNTeqsoL/mjPLJ1B4Ns0ZLrtlsE4+64NVhVG1UZWPFHs6YynRfKeXqc986?=
 =?us-ascii?Q?oVMsNl1VH2tAnbDsz6x9JiK1swEvVEsQnRaR24cyla9LzM/1LdckKAF4K1AO?=
 =?us-ascii?Q?S/NDXo8JX4SrDwvz+cLjHJIbRdsb0HDUttf9XRPa6LrLKE5zMyZEqFMSLYqy?=
 =?us-ascii?Q?4ZwqunBjwb6NYW5D0zItbpfkQFoJwjB7AiN/yfDOKcVUhyeXXVVLF5moTNtk?=
 =?us-ascii?Q?rYLy/x5v5spmmKJwzap6M2OifKmx/QCaJD6Yc+uDWWRWD+YgFjGj6DcI63RV?=
 =?us-ascii?Q?MgqPrLYd4txgMQ+LOgZLevbk1CFuesyNxZoJK/Li1MFKTcrenYl4Kt7vPzbQ?=
 =?us-ascii?Q?AVGOa4Y0Owru+GocWAy6yY6RtfUmvH/DdXKY3m1l6Buu53Iy5/TYm4ZVjWdJ?=
 =?us-ascii?Q?AlGDFomNYdEWGfk4r4bUIwbLZISpUY6dcwnODBm2wZeZIq3E1V1K0myWrQcS?=
 =?us-ascii?Q?ByYTC2TxqFs1FgYd5eIE2l7M/z6bp8+eF8DObWOEKvLvEYNbL+kGO/EitbYx?=
 =?us-ascii?Q?zbJoXUO2pv5rkeSePEUywLs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4afe25-c0b4-4c24-aee1-08ddc9d6a001
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:49:40.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cbnrYQk03E4RgkzUjhA/vJJFbjV2GdqMxjaPIFaw9O5oOX3lnavupoe56A5kiEbjFpVxJfABLf5v594CnE+eZq+r4TxIJNjb1LPW5AilNzHx56gjNmAvq6nJ0YnsJHb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Proofpoint-ORIG-GUID: mQYfrvd05C9FwKWkQ56KBaWBTbTeAvKP
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=6880be47 cx=c_pps
 a=LuzQ4XTo42GRDgkCKj1yyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=PYnjg3YJAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=MkfagJZp7bLjBdGtx_kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mQYfrvd05C9FwKWkQ56KBaWBTbTeAvKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5MCBTYWx0ZWRfXxpET3rWfcwYl
 u3xnSdBzJCIygjKqmLALBpWzKLL0QDto7i46YeiM3nSLnIpIdJ+jwhcr/9c0IJEevEVh3Z34Wi8
 6ZZ1MLR1Hw8eM7ZB+0QgxmXMIRAnT5PYHFPLS9MZl5cv/qa82E7gXhP7oRHIc7oyDuSmfFRIcmJ
 F5ecl9UWB7DxU7y7mhzCPmecbvQR+CF7N3eqInZFmpePxqFKsitBQ3ZFHpt3BX3nCLgrb4AebB9
 XavJuLRumaz0/XTBFTyur3oCS0k4TGWNDyKnPZpbq5/lLTxdSoOQ7/UBwi8gNY1yrrfhdhdwvzx
 FTXcXRmby+KojC+SlK68ULagcOYW8Rxu5xikgMDXPCaerVo5VH3wQlZgOjYKKkI0IDzuORoF3I9
 c5Rc8che
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220801

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

As per NVD, this CVE only affects users crate
https://nvd.nist.gov/vuln/detail/CVE-2025-5791

The CVE-2025-5791 affects the users crate, which is not used
in Poky build. Instead, we rely on the sysinfo crate, which
provides similar functionality. As confirmed in Red Hat Bugzilla
https://bugzilla.redhat.com/show_bug.cgi?id=2370001#c0

The upstream Rust also does not depend on the vulnerable crate
instead they also dependent on sysinfo crate. Therefore,
this CVE is not applicable to our poky sources.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ed15d9c763..7e100b73d9 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -20,3 +20,4 @@ UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2025-5791]  = "not-applicable: Issue affects only users crate (We are not using users crate instead we use sysinfo crate)"
-- 
2.49.0


