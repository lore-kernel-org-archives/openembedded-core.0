Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A8DC67871
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 02:05:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.187005.1673921148703983922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 18:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811263df=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H23GNN028266
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:48 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqa36x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7ixehRMeZ1CAfh4Wipr2nRi6ELkZUh3eMAOy98Z6l9Mjzn7VFt0QmKN4hxChNkN/urkF2Qen0IO5P7lEhARRlZkFQK65qQxH5utuzCoBbt6YPYRCesLxKD269MDi0zFGyJjOmsuJrCHKTJL0KY2Do6+4am/Ev0GnhIt3OnUIXzKmYFiPqa+tbqXpcdFGN2W51YhmMp80B95OZl25jt3qTu+ayly4xd2T7G3B0urNe8cw3NPtGESMiX+KtBK5LdU8BUbXpDriCpeE7Isqd5Fap+PmHXVrDSztQLDUklImIdZoyblAXHFBeuSidJgJwRpn+1i/AMNSt0oofjpenodHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLjyGjNW87dQosmhedBT2PjqeVdvLVgZFt+qjsa9bxk=;
 b=lNgSo70ICtj1RB+yLYDdwEIXDogo+tzNDIC2ZPKkCvOHwNVzpShy4hpv0uFJ/usYHLFRZbJiyibHMPC+5324ObYWuWwDajE4lqEGm9qAo5RRQuHKGcW7Z6w7Z81kjsbSIgu7MsOWasG6jXJCNFI44n10hiNm++cQ9JVF5YHBw3smsfHKfPmrotcBVVTxmmyG062uuiVAgYE9s2K/Yn0stXrOEADi1umy1VHEeRHKAj7G4qy3i12ovvNyvu5R9uw4Dd3s600wCJHm8A6gryoRbdytSrb7OLufdT96ae5cLog3ndkN527LfGOALRVeXcvo3sYphEYAjzfvsLI86KzdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 02:05:46 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 02:05:46 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH 1/3] qemuboot.bbclass: add QB_NFSROOTFS_EXTRA_OPT for nfs rootfs extra option
Date: Tue, 17 Jan 2023 10:05:02 +0800
Message-Id: <20230117020504.697181-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
References: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6ce56e-440c-4d15-ea95-08daf82f589c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B2yvM9/eeFY1QGr9woNq2HjM0g9Xk0idOTvLSuwJ0LebHpSwexW52xmjgMv/ZQo/TYTebi+vDPnOn0V2obT9lyXyd2DSvpmlMsC55fZ3EglFt8AXtC2HrJqnjk+FnJ7jKbMmXCZcnWGgUarZGNAxuWQM8abUuvovVYjAqXYTbzkc9FGvx1PndrIe38PFHBxZ1eq/ZJPH2OW6tPg2WeSLTZLF/NStJnL0Qvgftol8lF2G3ZrlPEpVQNkX60kw+5ZrTN/U8mURYD+98rFVp1Hshqi1hWEL51QtcC7cJ2d9ErFTNyRzpie5xm/tj1g5gLidoK8E0Suo6uNpvHzX0h/3DJI1i2pswfwYdK3wBECJSVKqH8OXQNWUllpenTHNHAuNe6aICq3STt0i7Snr99TQjWT7q3AYQ8aWHV1zu5G+TGMpKsVwW2tq8gbLFZdVrRMsMR/bXThhRosPrphr6Qj8EY7W7Nfc83v1JJlbpOnZ9pRQZeMnzfYQL2sRyeAgXBF/1ntPh95UvpQzkZ5UHDt8KfhirM2qkIoqBkhKl4Pf4hHJjyygin+aQoEvP3N3TfsM91onFesxuw/1puU+APSUafNGvsejim4nTmWspuh+fz3axwpLeruC/mjp4IlhEFONiar8Ie5PbmTqPbnx1ahP8K/FN9GPKL31maRBIEFUtt2Zz901jrqEzbJOE5+q0pP/8qqThRwCwS1h2gUPlbjsMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(6486002)(478600001)(8936002)(44832011)(5660300002)(6916009)(41300700001)(66556008)(66476007)(26005)(66946007)(8676002)(2906002)(316002)(83170400001)(52116002)(38100700002)(38350700002)(6506007)(6666004)(1076003)(6512007)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fmJwffYB77sMv6PGYt35sJjkNg4zyb3rsQ5lAAlDfH6PPr8EJuDO0NyZHiiB?=
 =?us-ascii?Q?D9ybLh0tylGb9QI3uYWpkRbIQvCPnQBs3YdEscKcarnr2ff0fP5RubgnKIna?=
 =?us-ascii?Q?uhKeQV9LOdHSVB8qzD5TSD/OBchQ1rGxMa03ISYQCsbzQSY9kgc6cKy3gPJ8?=
 =?us-ascii?Q?tfXo7JU3yUuaGG9MOkcoOKqo7NEO2hWHxqO+/s7uDqXsxIDngyNCO3LLUuxb?=
 =?us-ascii?Q?8GmxI/dVi69B0Qpne7WoyGeYOPIfn9D8cPedGo6xu/Oal1IeAbmWcat9lQH1?=
 =?us-ascii?Q?pA29LDIvVRihoJjI4ruUiSrKzX0/Ci9jJp/y9+AAjCoN5iVRVJPv9ep2cD0l?=
 =?us-ascii?Q?oV/c8v7T4zKicDWZ63xvEOFYgs+DDg05zyuNUcr3elaiOMlTFVibNi64XVAz?=
 =?us-ascii?Q?mmyjBgA19uxLKjL6NIpgwZGH2x4nlCJoa+vm/nC1bTkgH5Th16Fh4skf8WQk?=
 =?us-ascii?Q?5XYiIm2YXF7TZlYhChR8/7PYzg8dlUWw9fObeA91rI/pG8Ke51Q1vIx1jEki?=
 =?us-ascii?Q?hhjz0M9yWVmicO/QFkAX0l1bzEHgSt7ZmLgX+GinnztOQOg16JVMmPAICJKC?=
 =?us-ascii?Q?AzXPY9aWeLBVVxo6Yu45DiL4oz7BuZJe37AmM1M3hrfa044XQ3GDMsVxmNEw?=
 =?us-ascii?Q?FDp8Qn9SXOOJqptnudxxM78VtJts6IZcmQEy4rw8xNvEFtXvn8SS8FQbuCTV?=
 =?us-ascii?Q?3QLkJeS1bofZWS8cINb39aKneBrMYqXlg2s9b4ySkNT8WDS1UXnuDn7nRVTI?=
 =?us-ascii?Q?7Aywc09IRXVSELCs51wic5cvD2W+44GOXWczA56Snd04nf/Sl/+nCMqOW1c8?=
 =?us-ascii?Q?RZHa+xCMYhTx0+6sagTC0yuIMnXUwf3kqVqyMESLa00A+t00UUjf0NBw1Blg?=
 =?us-ascii?Q?t4dC/XObUCKOJNCEtj1HP66NXFZuHPhsmd3+sh/21OcGmkfcz+ZcYyjsrsqp?=
 =?us-ascii?Q?0eU7rsqlWm9z6WtP/i4tcjWaasZv+Mvn59sZbN0u/RP6x25Mag41fD58Cgat?=
 =?us-ascii?Q?8UDFIT3MafiWcj7OBU4/T2b6l09+zQRdH5eGAd96ue05dBhoE9Wv3/BmNEUu?=
 =?us-ascii?Q?2CxpPVvLZm4Q+lUceQQowI1nv8WEm23hvP55xn4IiSU+FJHVQ25pycF9UQJS?=
 =?us-ascii?Q?w8LvsHqPtqbpVXlRpswY9LHNjy+zu3+efpqDmgbAToBl4tnK83sRC0n5Bt2n?=
 =?us-ascii?Q?ngSqFxJcmJUarxiSLxOIhbCop+Pfye8HfKpt1zvcOXO0yBvIPSAZ72QAC0f/?=
 =?us-ascii?Q?gDekB6/OTWYlBI9/MfnP9UYjt21wdhuxn+vYyQ050SYOApDXhi9VlJ+7wYTB?=
 =?us-ascii?Q?EZRRUBnL0TYQaWylBvCJ6jnVdvsK1N7gR2s53FiYByO8uZWLC6PPxjHNG3Vi?=
 =?us-ascii?Q?CADco3WYWrdlCAuUSqbpkkPTX4AjsfMDIIno+c/rdEwnvxNWzh+65p3tSbEJ?=
 =?us-ascii?Q?QiF84JlS4vSO/ni9gm4bDkttzzvi/W/EVrekdC6takRmRppYaTn/CAAb/GkI?=
 =?us-ascii?Q?oLr2Wj0ub4zWBjHVPG6I2S5V+DhGDS0cxgv0P3fxcH8SF5+v3LrOjhmfGEij?=
 =?us-ascii?Q?oC6mX4nQJ0eoJ7gGXHvPeHXwwLzjkICLxEV3L/Ha/sz2P4XsqEQnlR+z3Kyy?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6ce56e-440c-4d15-ea95-08daf82f589c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:05:46.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuvElpHAcJMTGVCP/cOW9NF4QsPVY7/P54Q4+3QOY7kybF384hV/3VDfhhbhqQPPaYPIglBPfeRtza/ORlliztoghqlgbAog2Kk0GtRRKF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-Proofpoint-GUID: 8hA34z1xaJtvAGY6lk3QpfMiRW4heKXU
X-Proofpoint-ORIG-GUID: 8hA34z1xaJtvAGY6lk3QpfMiRW4heKXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxlogscore=744 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 02:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176020

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This extra options to be appended to the nfs rootfs options in kernel boot arg.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 5a0e50ccfc..444871438d 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -86,6 +86,8 @@
 #                      without the need to specify a dedicated qemu configuration
 #
 # QB_GRAPHICS: QEMU video card type (e.g. "-vga std")
+# QB_NFSROOTFS_EXTRA_OPT: extra options to be appended to the nfs rootfs options in kernel boot arg, e.g.,
+#                         "wsize=4096,rsize=4096"
 #
 # Usage:
 # IMAGE_CLASSES += "qemuboot"
@@ -103,6 +105,7 @@ QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
 QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
+QB_NFSROOTFS_EXTRA_OPT ?= ""
 
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
-- 
2.34.1


