Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F26EFCE28
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24348.1772646247416241568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MNvgqlOe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CjKhv2802328
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wU4bGB6xX
	bULonAsug/wYa08ullO5VN+JFg9jvpwWtw=; b=MNvgqlOeOw0xs8UPYlL03nXuQ
	BKNqmITgkxFOw/SiqiNnjmFxWCWAhHAWTFsvgJYWHP9XClUQh5Mi3fK7GlEkicqg
	5QTQtmWbPQCBy6pCX8SdhoQITrApi6/vmJnfwh7II9+GFb5wvE588kchHIkWuFZq
	iIJgNL3v4rtsV0wc8Ey7j/XBFaxZnsS9UKV4uh5W946DaTGMALrOxi6AspfgS++c
	EsorZYloqK1hd04LPw0D0bLSjZPuGBYzfi/QtEpfjAGD7GW5E0uWz6kLbbpJuyVd
	fg7t7ITzoK4EY1+xju3W3V6B/z0N5VlH0RaPiUDvPoGTIQ5kZl36/fY+3QUzQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj0v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpTTaC6oeC6kbez7yoFovc37yerRg9VEmZq8pzol94XGV3cOp6aiM6NN11hydCYvcS/I5Dscl+c3Cz4RUuraGWZO1nsn6agVSmNKsNM221e5VsgO6nkBDqW/avTfMtJspAy5eJ5Dbwvp8Hy0MCfwgKP7KEuYT7K/LVeTA8fWshPZh2EDtuILnTw+6my1kOZe1DOdRqdS+l9lrIvkESfWj93VCR673SiXyBTGiUFgjeP6lhqrrdPN4ZkMaqy6+msChwz3poy376RGV0EW197Jjm+tKyj1w1ym6NOygFAdEGi9d9HXcAR5hOZ4/QdfoWFQHnNTlYwOaYP6HD6Km+YIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU4bGB6xXbULonAsug/wYa08ullO5VN+JFg9jvpwWtw=;
 b=IzJVkjltVpDLUh0sQQ9wMKkKGGU6liYsThVemdDa7x3me7WkvglynzIWzCcdiPD8DHyu0qj7taDO9L1t/b6az/iTllVwoeGiU1lemkqMs40cQQ8v3E5MspF53DvC17suR5rJow7f8LlgBbNipTHsihhA0anLvumcKAVZ6/lSMviRRlG4mS37EzeHW+kZQap5m/Bja44CseTNZTNkI0NHHlIzAjkDvXBH18ynPO0CzCUvWvvd+hqqC5TJ1MgEVn4WioXqwq36LxLRozkAnQTFEIZxWGbf1cqcGXMqj1ZgiXxS82HMpc5Xr1A/egX7M7PRFRRO+8U1+o8XKe9cszJljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:43:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:43:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 00/14] Enable rust support for linux kernel
Date: Wed,  4 Mar 2026 09:43:10 -0800
Message-ID: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cee7f8-977c-46e9-c70f-08de7a159dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	JbQXM+utO3Kw2pecqu/dg9KeDAJk7FzFFu2561TV5jJS984W+Nel0c9PFxAZXuqSppTw9+zqb47wPWhNro3Bvsjt5Mt9sbWdnD/I2ScAAF3V4i3fDOv8/oirLX6hFF0J5G9U+sad0v3hjqqGXgSQGvhkq7kIQFUig/0H7kZFHPhjwSdSyOeVO3KMgE7SrUpfDcqzm6moUfl28d7uabSqrxRlAOSnftK5RA9/brEjBO2sBrzQ409JaY0WUSgNrP4Kk41qY2f5P0grXWxJAIZFRD4kB/gw5EOGmhYN1ZEyN86zHrboy0hV7VLK7dPAbW3GKRbN7I3i4ashhpNNfuTYVz2w4KUNXtNysUjiZrs6F2PucxwCUG8SMru79VBr1xtIcy0+H2SSFTJW0Vsb/rklafQ2HrV8G+fBnytIfSUagFajVxX+I/xybPpvmmJu7893GLUvIt7qW3rLFdV1SZlHps87uxtI2IeRQxnbd3j2ZQo+J7CT2/RYTHqJFFeMLXR8kUZZsD1IKMxwpfYzrhB5SJVp6IZZ8Zt4Sh7f86HWEWAE8R6UN1WZo6NjZpFB7M+HjPCwVz+bqqnHG3DkCwfHS5Q0VRm29BzA5io/Rbwz1pkRuUWYrXw8gTFPXbOpAQ+Hs9SjsUjKPw5lKj1S0CiUUWC9YCjoRovWPNxFH1o7Ij58XQb4lhWUVP/lzkQq7vfRjwD+PGXzRgZ/d9QHccE1qSpVs0e6q6+7Ni2RAGJE2N69on6Pod4Q71G2Iisn9Eml
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dd/EA9jjpGzeX9JFyIV9RwVcVOjjFyuaE+arnqryUzGK9iq/v6nmU8Bd4ty2?=
 =?us-ascii?Q?X8pMVT0MzBUIrvAba4bItXCuqT/YaUKTEz7mdasOTQwNQdqwJuTeGkUf3Zjs?=
 =?us-ascii?Q?fmp0tDTrlcZ/Wx/LcoZeP1w0pk6qQVBEqyaz303fV8JJrjIV2gGeSg7Z1bes?=
 =?us-ascii?Q?L7UMmSL/781sVUk7TK/5xG5p1zfc30tQJ9PgKb0s1DyOtpAHI25PGYAnSlJ2?=
 =?us-ascii?Q?oFi8U/YxIbOxGIZBGfKpyZBuooCV+Lx1l9lDQOWgb46btDKJJMsJ+XpiPP/V?=
 =?us-ascii?Q?MGj/MR4NJMfrl1aOtGXrjNBfSoEuqmfJanmw81KcT2d1Tpg5OZ92zaZiYLKL?=
 =?us-ascii?Q?xvn12yO0pAL9/TSCGroxv9u9hYoWzCly0iw6KYhpFoj2PKvoT7khh9eUAyBE?=
 =?us-ascii?Q?bNXigh8+kwZQJ+T5EMxclTo02GpF5uCu8urHRHaWPCXoF5RB4dyPvEjG4gWR?=
 =?us-ascii?Q?v2d244Ds5LeDACynnzko9X/QZAVf13vA4TLGxAbZlIgybEoSlz7igcV7GNMI?=
 =?us-ascii?Q?FHLV60FxfHcW7g4duv04gYpYt5Jpq8b+9A5eHctto7UhwYxn1gLQv9SlOQld?=
 =?us-ascii?Q?XhmqfSyA02VAuz4PlLV3PdF98BGcHST+W+5FT3v5+CfQnc5FU1DrvJuRzz80?=
 =?us-ascii?Q?DSDB6qKpYu57CBkBZHNymhbwvx8ciDLWu3DJR4zSbLnHVPXrm91qF+FPzwCG?=
 =?us-ascii?Q?ZyXY0yiN6Vnv8MmRXNOKfNQGo5O8JVsFl25z9YGmFnVflGYNXMWhZTzajdLy?=
 =?us-ascii?Q?84Wh8D+OLEATLOtbDeQNpOenuwHnDWcuOMlDrlEbJi1P+DtnYWr/e8NDNM75?=
 =?us-ascii?Q?pZNZXDmFd8Br1hXoHnv9GEms13VWgdIxn1++jYC9WEMCpMk65WsWlu+8odB2?=
 =?us-ascii?Q?XwG7lX+a2JUZfxnv474C6OjCkfbSfKp2M+hS/RWTfGrVaWjqzob8IWxTViuw?=
 =?us-ascii?Q?2J6FJ41mBYHFVc5/PIPnqg6RnyyPcNS+sZXkmi391/bd5OQ2EbIG6rWSN0h9?=
 =?us-ascii?Q?PbrI7vNnhwFzrwwFct85ki1Y7CgkgAeONyGPESHkhWxJU1v3aLzLowAato1f?=
 =?us-ascii?Q?C7+nrv5ljuoSLiIQBQIO8SUPai+GRTKlM6AB3C4u6PVJU4zRR73i2NVZ7vOs?=
 =?us-ascii?Q?JdVHX6dTwAuiTKdaydR9MufVKJ2WmwP2iYxh3/tqD2EUzDK665nPUaRQAqyd?=
 =?us-ascii?Q?n4edAyivwjU1iJnXZLWTot1+8VT2UtNGG2E7qZASWth3oHKop+DQG1Yz6Gnz?=
 =?us-ascii?Q?/EIIJ5az09ccdkrfnEEf9voMg17y/gVXMlyV7s9lYDAUtaKz/KdLE0J4rtfC?=
 =?us-ascii?Q?MChPzStNgOwRB6hZoBtju7cAO2cVpwB3bWLAtZFs8Y4sfv2uhGe76JinlOcN?=
 =?us-ascii?Q?Qrq5rTRdaUsvENTppJtSY5rfns60xv59nLLvU0ET7BA/VzMMR9SUumJR/SLT?=
 =?us-ascii?Q?6oZQvVtfr5kATQmgNNzYXWvHeevqtq2BhFDlT+42dz0gAy3A+gCSRh/OtEfa?=
 =?us-ascii?Q?2CKYRYQ9SdHLGn5nY96aNpY65T+9sYvGXeUcoQyj6dufc3q86GiDBiC+JvjH?=
 =?us-ascii?Q?nxFn8cThE5XK64RRlsHXd0TIajmL30mw5IKfsyGFhWLmYNdYe6goLDwEkspd?=
 =?us-ascii?Q?NK5/cyDSX+wUb458sNDYrjg6hp7xuq/whaYG8bKbLHzsffSMZ38iMABj8TNS?=
 =?us-ascii?Q?oZhjRD87Z77RbxAu0fbgvclasQ6BKjLvSdcInWo3+a5P2mDj3SYGQMevbsLL?=
 =?us-ascii?Q?EdHOTOx5K4bU5BN9nyZ1N7JHM/32GN4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cee7f8-977c-46e9-c70f-08de7a159dd2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:43:59.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWEIz5jcISixkrvPa6orHOfH5l2JKpjJLRAEddexAlE63xL3SxeQHqukR0ZPJcE/QjZI6nxQb88JyBXSOHVx/tfuwnR410Qohp0Cbz6SgF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: XoOJWTJgxe7arJUMg8TQ6M34NbG0hZzi
X-Proofpoint-ORIG-GUID: utzgAZkSXL_6PUI8GsO4ke8NLeWKu2co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX9p2OEn6pP7ec
 +n66dLMjitFqdljGqRP6ILM5+maui9Cx/NQ1k8Q33GXSy3MrnQnOoJvtO2gY0GtHDNL4c6dYd4W
 5HFXNt1OQ38xe7Bazr1wzo9WbJ4SZOJaFEcLJXFrSyF65AdpeieCw+K4/yVzWLzzaCmnaY4ClBU
 UN8RBIar9mcd3uP0YxArbzhYzGbZsJxUmkDOOSYz12SK5i2rU7AJZw1y0n2z9MRW1q89HTt3Fvz
 XbaEpqEKraNXwURUiQ1Ov6vq74+RK8Qd4R+9RaleWfLx7ZcGRxb16fTHOv6Py+PRQY3X5TjQtJO
 /POGTXKv/WeTqxju5g/e0VsLaRQwBcKwoB5ly1IZJnxDb+GgCz/+pmqJGwwYiqt009PddM9WOT6
 uGSm3jeXn5cdBxpBpBad0SN6Xbi17h/0KZecTp1S3frYMRu64g3S/DhKkEcmhkiWDMrydWZb+KC
 C+UK7jQMfGbMVPbeAnw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f66 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=1xu6l7B-EAIxQ2hwfIcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232416

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v7:
- The rust support in kernel runtime selftest intermittently fails on autobuilder armhost/qemuarm64 
  because qemu.run_serial(modprobe <module_name>) occasionally returns incorrect status even when the 
  module loads successfully. Since the test already validates module loading via dmesg, Disabled
  status assertion check to avoid flakiness.
  Bug Report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189

v6:
- rust-kernel support is now can be managed with a dedicated KERNEL_RUST_SUPPORT variable instead
  of DISTRO_FEATURES. Kernel rust support changes are now moved to new classes kernel-yocto-rust.bbclass
  & module-rust.bbclass for ease of maintenance.
- Dropped patch "kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation"
- Extended disabling of cache to make-mod-scripts as well.

v5:
- Regression in autobuilder with v4 series is due to applying v4 series together with following patch
  "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
  is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
- Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install
  rust standard library sources for rust-native.

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
  nativesdk, as it has been merged into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files
 directory previously stored underrecipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
 by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
 instead of adding this directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe and
related build infrastructure in the Yocto Project. The goal is to enable building
the Linux kernel with Rust components and provide support for building kernel module
which is written in rust and also provide support to build rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support
for out-of-tree kernel module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
- Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 09: Added oe-selftest case for the Linux Rust sample.
- patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 11: Add support for rust-out-of-tree module compilation
- patch 12: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 13: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 14: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (10):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  kernel-yocto-rust: enable Rust kernel support via 'make
    rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel: Disable ccache when kernel rust support is enabled
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  module-rust.bbclass: Prepare out-of-tree rust module compilation
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (4):
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 17 ++++++++
 meta/classes-recipe/kernel-yocto-rust.bbclass | 25 +++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 +
 meta/classes-recipe/kernel.bbclass            |  1 +
 meta/classes-recipe/module-rust.bbclass       | 21 ++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 41 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.93.0.bb     | 19 ++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 ++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 ++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 16 +++++++-
 11 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass
 create mode 100644 meta/classes-recipe/module-rust.bbclass

-- 
2.49.0


