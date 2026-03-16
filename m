Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48536D58B19
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 04:10:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43448.1773634221685446602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 21:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=buAl4Usv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75355d60f7=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G3puWt2141663
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WVW6RzWTN
	FMM8xrUxSPZMR2PojcvxhUFoZtHI0o7gOg=; b=buAl4Usv7tt0d5/9lNVQxuA5i
	5vDKiq1Qf49abJvb6vWi3Jbo5gvPu7eNWqEGXAf+ougAGtfU/c+WuC1Y6Nxe4KA6
	3qivc+ubqoZo9VDcrK3nQk6gZZpqJa3gPtErvab2EFWSv5eSR7QHNblSwO+eYVRr
	2C12EOc6IlJJlQEyJqn6mgOZ/QZPBLRvVAFP/kPpyTnrTf6NOJC+stp2e/EIc6r9
	sam4E78VNduS4mNGouDaFhifIrGam+WOrRZl2sKDy/FbRuQ2/qkyb+7AeKNrUSuJ
	EqxJIQee8a4yqOMbvZkCS52HGM1D8/dCnqp5OMCFJGXbWAmJynbepH0uJPxmQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhmc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQlF25uramD1Y71W1C2jG0Mrfsuc5krJGNX2fQUByGPWuiow+C6MjfA/fF4p39z5u9gghpbqsggpwySi3R07kF5tTyO+T88VpwpGfA4y94CPNJUeSad5NrsNoDUU8wThB536QO/5cYiS0yTbcDLrrLkEN75QhClmBw27XzLQOhoRMT4k9YaOWSNPHyJbVH89XNT212d0PyJxLIlJSfU6iBqqApMmwepOyRBvxjmWzX2qaaexQLxJEMCIC0cKZsJWkNTDUSV+3YqSYoqwSBVKsHJLJitByZ1CASpHBHk5gTPRUOPjH0CfH/9zNc4wi1JxpGUKNTMG1iRpGfnd2zGUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVW6RzWTNFMM8xrUxSPZMR2PojcvxhUFoZtHI0o7gOg=;
 b=jsXsgKBfy2vSSJpsFltktS2FGNeFCu+yHD6iIQmFuy9XSUM4ppN+sQRPrZDKds7XsYOEdaw4DZmx6UlXo4BLGOoJquHnjNnUlO7hNbZzqCB9sH0epdgpMrP+5QSvJbnQ2AI+5UIgxo8BBJ01uFaWwkXFDQxUh3U0RV1EZcPSzONyyLws8DYpgucP6P6alffwyC4NeyV9h+elazq41nrQVJtoWA0BuJKF+TMUVRDPfmyBhOuiHZ6GslSlpfkqHtIBj6r5h7S4zyDeg92+yKTJCFxgP4SuAi5HIdwJ8vRelBMVOyb7Pgik6b1IDKFoF8mmbnki+uuWaVHiloD9WJQVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Mon, 16 Mar 2026 04:10:18 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 04:10:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH V5 0/1] gdb: upgrade to 17.1
Date: Sun, 15 Mar 2026 21:09:57 -0700
Message-ID: <20260316040958.122568-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 337abd5e-3970-4013-751f-08de8311eeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uc7+pDhyIB1HSDIYypOonceXBfimHDLIL7PgtD2gqXoBG12mnMAzA5b8iEnarhSTWLWihonYavaFLEM7QTkSQ1qKklbkQxInk4BTgpMCe30hEZWTmUgNYHd+5HhIZyKat62FMgwOF8n5Y188V2UHiuoL7zfcimG0K12rDwPnCQzvHmPmbx1S4ZEVmiQ+2oWx6W5YjPl6PW5qmEvQZyrxJruGlDPG2jZStA/rWI3N/XFElX0ZT4rk5r75BvMjbiMk6Z0jRn67D4olgtomH71ggBBXR+RqezjiEmcMBjh5MV/+lfGOGN1URwOM7SLpD8Sjh0Av2uvY0F2tHLJ15UQwNy/zffaRKCUoV5FfZaesybpFCTidqEPyPL6yhtub+JdXeOFlmHNs+kapCJAtGsktH7atSb46SifxlVn838ED/RSth84bAMKpSm22tdjAXuNF9d8WCkh5S3apBZg+B620gttXsLTmyiS7SYtsTuexL9roqc+TDDHAKmQHbHm9rc2umkIOYMs10uxQM4WMZSHu4AZFv7Bjnz/UOKsBmqPOIa423LZLvt7QHeDHdK/vvbpqEr0WbaoSe4UkjPBUyxy++sAwhwWEXqMv/hQ9Uh4iaem5Xl+dxS52rmuObo1sO6SmlEeEPwpo6Dzq2wxXekp4Hobz5q47ziBDLfVgzT+Ib0utmkOXC1zIzThoAC0x4gxQuPVqVt15gUxj14aBXGBaCy3NEli8Fj+6BJNlGvQZI1zsvynWlKBne/Xe3Pxz8SXG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qlBsgzb6Pz7Mh/+Fpj/CAsVJh0a8NT9LrulawTJf0+4qjde9QxuLDr5FyDm2?=
 =?us-ascii?Q?LQjcPkyRTNltVjy5EIjhUr5rIcKMNlv57mGI6gnx2YyZie3LbBow9+lsJO8y?=
 =?us-ascii?Q?z6fYudiEegQ9QoRkiPOuPp7okcNIFdFbOMN6IiZsdfSn4AMkOG/Mkv5qHkQl?=
 =?us-ascii?Q?tRP2tayd3AK5zXMZNi+LLgb/7iWtEtnYv1V4qiqg7zNc+2KoG1PU/E7WS8bN?=
 =?us-ascii?Q?KK08xJTCMc6JK9OTwlpT/rc4BFgYDOjjX8w2vCp5r1B4k50BhxS2gzcVkDU+?=
 =?us-ascii?Q?YKHtjcXf9QKrhCfGqBsd7YT+o83Wn5isl3THtBReIfLAUTxJBCIM7ECWkebj?=
 =?us-ascii?Q?5MV/oi2wloROCaHipPBL1RRAm9TMzK/Bb533UvBPjbV6A4CYSuD8mQOOGlvV?=
 =?us-ascii?Q?qtho8Tb9AM/sYBdsBd70+nZF9HhRDhla4JJrA9OR15NaNUS5e5VOb1Nf6oV5?=
 =?us-ascii?Q?vVAm0QP8LEBhg3Q5s0yK5ahM8zk+QfRkzBGuGkGzLHGIFUp4N1xNLnDgt2Gi?=
 =?us-ascii?Q?7DmAew0DJV3H5CBSNwQpn0rb7Bpk5gagtUiCDKjcrTss1woPoktxfFSDyolh?=
 =?us-ascii?Q?LZU3hCpYyg3sK9f3NybyPxBI3xue4CNyKGiR+ICAjgEInIj7gEzZvPEeGxWE?=
 =?us-ascii?Q?vguZZsqW3tEhkrnLpksHKl7HVU3vLd+DEAH9ew9JGl9OSriF4qenap0eHfmP?=
 =?us-ascii?Q?1GNf9DkTN6lvsb6yZvB7OE9bfS+AQ942gHev1jXWDtvCW9U9rgmaLouCaD2Z?=
 =?us-ascii?Q?CLr+A0ru7d+uJ3yRhl0MviCGF2jEdrSQUdZ3Gg+JCc1Xn/uwOY6OOM3zXWdq?=
 =?us-ascii?Q?VpLksTkVp12bG6I+jG8MBSD56P7IpVTPqvz0287IXxKMdq5uIKoqoL6oBD/X?=
 =?us-ascii?Q?GdVtJINgelVuVCs3Jj38Cf/j4QUlr8bCzaVjLu3VkQJ/i3M8yrWlc6HKdD1y?=
 =?us-ascii?Q?7WsvANNQi7FbFsLW73WTqaeqXKkeNQuoM/SUEsHHR8iJPaNkeD8EzCNj6nMD?=
 =?us-ascii?Q?BrI2gRylHov/QFM2XUyXQnDJAaUpeUf5CoewoWBmhPQq7xZfo7OuSmi3BhyZ?=
 =?us-ascii?Q?QD9/u13DKSdpTMJrlfN/COiY2K+5s3ruD8jtdwntx9QwHHXitIZ6RmUM3ncN?=
 =?us-ascii?Q?oe5e9NjTASKlWZrmYFS/RrlhnmpprhNbJi0EZdl+Bx+/eJUf/FISrH0ycQLo?=
 =?us-ascii?Q?5T25GsIW0RoTGwUTPm4llbZ8Yw0KhCbLDVUJTfMRDWx+xaLccqbJsD4rWjy3?=
 =?us-ascii?Q?iZzVa5X5YqD9//A8EMZWyB90i3iD6A2BMF0lgVdLtWsAf/x02yuvxF8Wz9ov?=
 =?us-ascii?Q?qeG1R4e+tdBYSnK8J4UGJPnRMykzk62HtN9KD3xTwcAWaRWbrRD1SesZ4d9B?=
 =?us-ascii?Q?Y4ZselWjtYwlf0e9yQKqL8DfkQpX+TOgTMs/ZNzQ4G0/ojnY1muOfy95XHJG?=
 =?us-ascii?Q?7LoWK83nB9UEXHrml5wQtVwodMBN6k3vJKVAZGYdlptv8F4CZxg4Pr8J1G+Z?=
 =?us-ascii?Q?Dy+mGq4c8KiK/QTVu0LGIRXiebe1jSLLuFXe8MNFnXp438f7xTxH16fvCEep?=
 =?us-ascii?Q?5fQHqAdUMB75F/DR1eXFk63FEFXbNXVPIRqqfr6uzvJ0LiCbxMcRMXFJXziW?=
 =?us-ascii?Q?uE+dzSm9Su086y6a3iVHaQ80lrBukAzn0c/H0Ip2dJ4wvvaYiRblVaYCrOmM?=
 =?us-ascii?Q?+4SiwIEb2xy6UX9qgIgN5rFKEuPaHRzh4q42DIXZzEhACquVGDhBzUJcYdG8?=
 =?us-ascii?Q?hdA7u8dXLPrBYux05uSNLagFC6gzMrU=3D?=
X-Exchange-RoutingPolicyChecked: 
	kHgAPgkvjbJfmLCj6ilzFJqRHytU/WwfhgfTf+KBNc2jlzp2Lw1Qvrsa8T0a2lUjtMyPy/nKTiST5L2zO7gb12Deq5Dv7FQT5DO3nsuLuP9hsI1BFfUt6mHtz6smIC/n+tZ7e9CjLZZf32AihLI0uzFoDeSBm05U3x5+0G3K/GQMW84Zm2wBxIL/yB7UgTiA7fMG4+8egaF/ZWWjeAGJI+T59bR6KjeNrnRZ7c0nRacVxxUAJGnSzoi1+h1/MqdP5Tzb2NX+E7pfn2Yfqw8vhNbrpLiQ4a54Gadn3W34WizINAj+gcf33hYQJIqwbTyek21LSDCcF/A9zdlTChRZhg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337abd5e-3970-4013-751f-08de8311eeea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 04:10:18.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwGPi1hoDfOlocOdSF8q6tgm0yO/sMIwF6Gv22S7YM0FSF1mCyCI7dXCcnss0LdWE5i3IX/qXx3kPDZNg3zbVX4tgk/bmrEqfjb0xNKW+E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b782ac cx=c_pps
 a=JYb6bdnaVjS17BdPGRuFtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=Trik1TV-rLQ7WaJNbpcA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyOSBTYWx0ZWRfXwAIU1yuLPUYc
 ALipOyDapUEfzI6n1M07zr0MhojjShyZYH0aVJdnnucpAWyFbkec3aRlLuONM8Fchv7AY4JTG11
 WiGtXLyaMbkQC0LKgQW1dVVE2QrYKYLE/cN4rClhmrdgk6v00nVTLX6M78HLLmHmeob6jZ2jQSj
 IZVFwFKV24extOGgYUK8acQUL56VsByuNH6c/yI3c0Piea1WqY2lOI8QdFsBz2AX5OJPlvAvf+L
 AyEBHTR/nRCt10wnLL/tC0czU37LF75+rsu9cqT0xwzUfzZr9YyejDVmHc081tDF5zXxzRw1cqd
 t6CtSC0k0esk18epeu/Lbm7MU8KijWnHNrW5aM66XY4jiQZQMK89gtWXY6wyCC9mM32PqnqJbw3
 T7nBJprlPu42Ugh3tzKxJpZuAu8Rd50LUvQ3X828D+edZ1KYR7pUSoNrIjgtZdztWtMbAKSHwKZ
 85DPk0cPjHEXFZCx9Ew==
X-Proofpoint-GUID: TIzwQ4KzPOa3eah72EXv-y57Dl-wbzL6
X-Proofpoint-ORIG-GUID: TIzwQ4KzPOa3eah72EXv-y57Dl-wbzL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233207

From: Sunil Dora <sunilkumar.dora@windriver.com>

Upgrade GDB from 16.3 to 17.1.

This upgrade resolves build issues with newer toolchains and musl-based
systems. Two fixes are included to address musl compatibility and
AArch64 kernel header changes.

The previously carried Readline 8.3 alpha backport is no longer needed
and has been removed.

Changes in v5:
- Fixed patchtest errors

Changes in v4:
- Filed upstream bug for header visibility issue
- Coordinated with upstream and added workaround
- https://sourceware.org/bugzilla/show_bug.cgi?id=33926

Changes in v3:
- Fixed GDB custom baudrate issue and submitted upstream
- https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html
- https://sourceware.org/bugzilla/show_bug.cgi?id=33747

Changes in v2:
- Updated patch metadata and commit title

Changes in v1:
- Initial submission upgrading GDB

Build-tested on:
- x86-64 (glibc)
- x86-64 (musl)
- aarch64 (glibc)
- aarch64 (musl)

root@qemuarm64:~# gdb --version
GNU gdb (GDB) 17.1

root@qemuarm64:~# ldd /usr/bin/gdb
        /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)
        libc.so => /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)

Sunil Dora (1):
  gdb: Upgrade 16.3 -> 17.1

 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   5 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 249 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------
 ...support-fix-AArch64-struct-user_gcs-.patch | 181 +++++++++++++
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 7 files changed, 433 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

-- 
2.49.0


