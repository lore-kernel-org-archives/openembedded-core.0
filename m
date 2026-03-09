Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869C0FCA166
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20770.1773078281231964838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KMRDeVgO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294Ursi3973763
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=; b=
	KMRDeVgOC+OBztb9uU+EQBxFiND2m33Y+Wmm5baRsBQbT/lBM4Azp9kpCiMvoFPc
	G4xbRoRna9OfflozeX55XobpIT33hN1zA9ZoizSE3fMkDn8LCYi+quDa9ubSSe3q
	speBvW27945kspfoZdlcWRjp2PmfpBTBvtSnvsIarn8z1JLbzK3zE9pz+Qu3SHWA
	IZg5FMn3lTWYGaQ5MmzJVolEI98E1GY8jYLoU9AIp7rRKr3E39hQvGjA8/fsSAPl
	MTFn+Q/ebHOBKF9CqHnPT2UYO5/+EFpY544SaZUifvBQwj91f0IlVMg3cd3fdnYS
	OWmW2ppUosXlvJNALu8slw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278m-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3/b0Njj4kqkTyN7qP0eJ79I7XSCUUvfJCGEdanySxk/+FAX++zpg83PSo4vM4QFO1y646dlX3TL9XlsWewThcUIOwb680y3b6QvF3lxTr8tXhVtF7phB1mJtuPKVgr+b4RTPHeqqJQP1xnZlz8mh6rxrohGljxDAwL5FRPrnMd46v0k/oRlEEYtKdqFCqMz+fnPYIAh/K6soa3+vVKEG3X99sMQjabKMPj1OQGeA918mfZUgp+LHn3Z9Rx2TK0t5Ze2vhwSIUvcPCkpooBOF7h5vzFiem/4X757fL2V/Dj/+MnoWb+aevlNFIC1gt6u8SbEpRM3n1LD6dyAKgIHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=;
 b=PLoDyBQ4CWkco67EfVxVp6v7kA7mGG5+jwuDf9WobXrs//lJabZybONpPZFLse5L7hbFtbr+rz+Ur/ZddCsnxdPKvIoPGSXc38GUkyUdKQ6Y3P8mKEQssyRZp+OGNUEV0DWpogHQOZsV/Ko3LANxoSA2kNhj9oDFKfo+x7C6CziCFMNTZzig4onEMr8nDV/mHv+sKILB4QwdmMEum/vgeoA8LzRkYYfWkBDRjOgUVqS2lmc3g96hDIv4QQ4UMnQxOELo13xBobAHtevxanE93pPJPB0v0684i7Xzy+kfWU+1oMxgk+MFspuoZq0RIDDr0rLsNOCWK350y+nuqfKEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 12/14] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Mon,  9 Mar 2026 10:43:44 -0700
Message-ID: <20260309174346.3384212-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2f2baf-7cbd-45be-f5ec-08de7e038407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	CU53kiNYPGyZdZ3d8lPjR30sK2o5EqomfBA1e8PKye+lS3Yxjtpq3KXsFx0qJGIpHYcklRq2CgGsGYa53TtaeROP5g+jtOuWnIZ4W00UVKLPJAcm/0Pvny/CcFHHo8LZnBmExcMykcnjzOHf46Kz8sfPiVWdep2fj60sJWflSdwdv01dcaX2SC6xOCIlp94jmrESWVaE/ClgYOu0+2enm5Me4/zFq4H37LWNYKFlIAfhhwdMz+w7hzXCAaBANbaxGjw9S4pek4+5fMenrNHY2RBTsOcHYSNZHnbb0AUd6BXEV7VY0+sXLF8E2FFG4t41DuFDsbF84pxwSH3TdZDGhU5c62AIgmvB6SZRUIttquxhWtRF/fskA5zj3exOzMF4TFxIR64NVZ3J9mt0EYHI4Av+vwVX/uHzF7MTCDGx0ovV6XzLfkuv17JFM+JkNSbWnrwwVNKifX37CImCkuKrFpKJeyAaRbDuZq7Si3pdD3IfdeHD2sG2ZUa3X8z98YFCXRmP5CpQdb/tX/2zu+LAkgkNbC/n8u5YJAwXh/oXuuLmlJI3mJ7oXmpPjMv/s7Y56Y0AogOXwY6lKXQaccsYngcJkNOHnWID8UZll1PzAl088Xp/PzYTsSQR5293U5P3buO2dioOrJ/VpgCJPo3HxGBEAaXxFgP3vubrY9jtAPi/vWv/bxkNX6544+rJXVCg7JG8eFDg3XBGHMy3xLB5nSghLtoKu/gcLLLruWqUFVKaLgt4iDMvIugx21hdioYg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l9I5oGY+msyfqS24z66w+ZlWimuTS6nM117sXBsIc6bSEMbppy2Z0TCwqrGW?=
 =?us-ascii?Q?HLRvL7ee+4SVW37uo/70KrFNeTnrOm31KlQMQDPXOB5WkdGtRrSyVIR8Jd83?=
 =?us-ascii?Q?4jocr4t+Hw51iQel8AqST9xN9E3duCQouvBhz84ptTcCtBHMIOTgOLDXe/rM?=
 =?us-ascii?Q?wve4UWfh0yOkLX7gF8VUCH0dR9p/jGzb9R9mqgb5sEUuetrCe3mosAK5M1Az?=
 =?us-ascii?Q?r57uUvSdj4y4tNp1x1NEflqJtkCHgxMaW++cUUuMuyGmw6kUKP2YIGRwyINP?=
 =?us-ascii?Q?h9rqiM2AeqbQcLDSSGDQznaibb3h15MhZdjf8o5kith3mNFXdTAbQXaj48Js?=
 =?us-ascii?Q?yFCwfeNVg0pRUtB86Yr9BwevGaKUo0mznft0c9w8SBUIHtyk4iQQrxeigRMu?=
 =?us-ascii?Q?1m0dNFaYl2ReU1rNpbhq6zTq3u9QY+udm+7l1TMBVwsBQAUEXbNySHFWAGiw?=
 =?us-ascii?Q?C4vYCEnc7aMYCzzV5xfqCnI3YgCUrNng2Z6kfWpFlCEve0xfVCcOImvXvaY2?=
 =?us-ascii?Q?MfR/sqJskXAolRdyIVch7IG2lVe3JFUih8WfQWz4WKD5Kc60W4Pxq5IJG4oC?=
 =?us-ascii?Q?wyxvU9EAY//2+2k5+O0NTqBQjb+IK5ENJtfOXapQFiWDsG3MpPtUeSAYXzG9?=
 =?us-ascii?Q?qqNEhZzqxSekfegvSmW0EnXmuCYaA7bCCg44NcdKzispCdwmni55G73KM6qx?=
 =?us-ascii?Q?Q6IBnErU5y5Jl9KqP3tmm0RQfhi38tPqrhROFsaiAyzznydSR7Ell1toEijj?=
 =?us-ascii?Q?FNL3HxLlLXNBDmuWsjpqAysW2TUDJmJfoGQRTynw1Gu/3FoCACv0u8xiyTVF?=
 =?us-ascii?Q?aWXkWimb01yEsM+JjVWADtwJrhrQwL9iULbpyesQdSr1wptaaG0HmasOti61?=
 =?us-ascii?Q?I900Eo2xcBACX8KkkT6unIZ0wpAvY7kX0wWZ9tjmV/Y+siYU7+EpAiyEoMas?=
 =?us-ascii?Q?irYwvz4O/U8kNJA/Obnp8HeaUHxN7HEksQF+U3rMUemXer5yfiLJcf8eHrf1?=
 =?us-ascii?Q?+ZdvwkGM2G+bFZkBKwPd26liLtZq6tvSa7h23bLRWNYEnft8d3Dx2X6kf7cp?=
 =?us-ascii?Q?7rao6aLtKQfv9nhfU14MMVKwIF97DAiUIXyk4VcCj0i87yotQIRAj7wRPjgW?=
 =?us-ascii?Q?Iu4hZccaZCotVECOPZ0Y4XlPd9M6XEZXfnA0DcMmIL9QrlOPc6vFDM3e7AT0?=
 =?us-ascii?Q?QZonnhAJTBlxIT1ueG9xngiyoRra8OZqQUBzLszA2Bqcc3GeEBAi5d9XZcfy?=
 =?us-ascii?Q?76XmIrnXA+Vikoq5K47NCS8cQxr14lpPGR3/fJsFbojWRNStsIP/NORs0TKa?=
 =?us-ascii?Q?eLnaODQlKphRg06CWxGK/K/jbXgYVqsNH/y8cjw+96bqoXBq0qT7EKb7zAd+?=
 =?us-ascii?Q?+QkjbczsX3MN/ABLCv9F6RlVqXAiwfpORGzP8+YdvhYzcw1ZK8KWUJFWWHqv?=
 =?us-ascii?Q?4E4kKw88idCSAvhD5xuHtruDpjXQc3TQoicGfJesdDVV3vHrRM6C7eAfcup2?=
 =?us-ascii?Q?zLpD+Fv4LiHE8ssDfPmWSKMaynXZoCDY7iLHHLrJcZFCaSHPC+oYPkfIkxm2?=
 =?us-ascii?Q?1Sv3j73hxDpUCWWbDNq+ZzQYVucyeITNLmgP+ZOAJqnMMp7tbLF2FZpT66Ml?=
 =?us-ascii?Q?rSRd6zmh4oWPvxqdgonRZcbTKnKCklQsOCo+Z5Bvdrgn48If+ai/YYe5UqEo?=
 =?us-ascii?Q?xGq5nOhlH9w3Gwfc92gT5I4ij9dFzTc5Wi+nILl2iS83R6s4ii3KO47WSCPm?=
 =?us-ascii?Q?x8rlCbhCZb55f0VDGvRe8T1fsKgzyTc=3D?=
X-Exchange-RoutingPolicyChecked: 
	sEw6pa4Jhbss0Mv3r6u3i5NJNmDihAugiQaxjScOX7bNmrVHJdJ9tQ3YR9/BdUbryZq1fCGVhrOXe0Cl5Bys2E3bATc3qIQEYlcuILO9SL/nZ0+jYtfdzqE1EXqy+rcqI+Z2CI6iQDp+gL5WEAS3mai9wGTDjIRl48QCam05kiwounDBDb/Npjdma7qRX3aS1VBIIfMZxScZmmWy1gdTjKIC01yD47kez7NVxh26ofTv9RFuxO2eTcc0QXHfxrUgwAkgfbNE1H8gXMPi9SoT2SGZ4zCQGp3QdRq4h8h6Crb7maITu1dHRfWn1iyn300uG7bWA0kd1BjS4bdTEUZjMA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2f2baf-7cbd-45be-f5ec-08de7e038407
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:29.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djyARa2AUJZfzwdpb9LJbNmAoJqNV9+VHsGKzVOmx2fo3qYY1xSNhe3Zsu4Ce9LokUmpphdWUqJdjyhMQsETwNKoSu8DXw83JSBhRKFrH5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: F3xzJwEfjfMm_uQJt2EU3f-HQFjXnSJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX/G+3aTKQl9W3
 x6lOrvlTMmCxLu8HssmQkYvz/tzU7wB9OKAziigSwVMfWFvcS5jAM9B9CD5Jld9UW19OIxuKU3h
 rFhOkRvSRiTeJb5tgC4UdAJVOrqpYbvLwzt3Wk6fmTJTu1XIF06ppz/DBCi+P31F8xcZ8jPmKEa
 R5YkLev4dR7OLFOCLuJCBwF/dC1hBJd1otg6OmvyXhpkDdgyzim0pd7LsPqrLL7csAlYSeNekE3
 5KCqTB+VK4cwSKOAExy0JMawZMqPOoP9V5gBKcXHri1GVmxyw6k+IsfQLGalnJD7X5aE15iQNiX
 ahXy6zgUQYTFDjuHwpYQbUd4lDnbes6+9VXUTmq+GDpapGhShd8wWhTNmwuHSqPkMIsLFZIJLXG
 8AzqI6ffW1OfVflyLjDaz1rErjM/BzGph/Ptzie9vbMs76oz98PD6S3UWohKBJePucHSdECf6f5
 RU/xsCZTOJqSbizwf/A==
X-Proofpoint-ORIG-GUID: dQOHxq2VCwIcCOeW0j_S8GcQx7RPGjFI
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0708 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ROIJiIjWYnIpTvY2ysEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232749

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..077780a192
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module-rust
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802"
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


