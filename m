Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62602C8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.508.1751384881707354999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614huqR008206
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 08:48:01 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4b2xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwgzWL1X88ItBdiJqHpL6W9ytyVOqQR0TaDmrbxSe5uMtECkPawlCpvHmunTTGqIYh2bjuZYB1PS46unLrpxChWqE8ANFoGKRYpmvZit3cuIAZIFinn2D+I7RGuDE1o4U7HpiW+m8NId14yvZb/MW93o+MmfSoBdMFw8JaJSCbZUauThBoReIWxuVBoQBYv2sCFtRABDGcpV7sk6kjdBCe6l4u0Uav2HdQZ/mCbZhUY4w84zx4iVdMaLykhRqFo2xhepth8NpNM4FuR44iIZlmPP5ozolskmg+F29e+uM5gINnojAUrF6cHkSIzs8mjhDqce2kXQ1B73fOoSVnt7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/2m4JrAh3Y/Wxa/oJw/yPCtWIxxtZ3z0rgbP4GpZvg=;
 b=iWc02dvEld9jFaBd/4RDg1A6N+YNEhFqn6u8g1Wi7KWPkPl5fobea7HKCNhkc+Q6PMQnihwfQd7kmjUcaA+9ZaP45KDXnucDluAOLpdyJ9Wie6ozRvDUQT9pxbDgDRk+/iD3gHmOGtK6h/UtDpof2BnOdMLHha6cwupvFo20I7cEnZ9vW0av7g/5oASksHmy7x+BBJASNFztEq8nAGhz5xtu9gPLwnQWnJfPUr53EePniegi0L7Sc/FH+Mj7jCMkl5ekimjdbqs7NL4T24EipAoNW4YsewP0IL2EMLI+Nwiy3t5hKGEK26guOcgpYtbON1KpegCh3ZemTKySl9lO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] procps: fix runtime version when using git shallow tarball
Date: Tue,  1 Jul 2025 23:47:30 +0800
Message-Id: <20250701154731.1465906-9-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: eae9c949-c3c5-4842-ba43-08ddb8b6a791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N+jvH9yKaiH3KK1fTShE/mTyl+1PnNwsmD0b60x/sW8ZQ3GBEbBI2E8vBpWO?=
 =?us-ascii?Q?LFmmiCX/kjvbgQPhATHqtourLSi0Rsy/E8JH13yr7IrXowDtywRsgbDuB9ur?=
 =?us-ascii?Q?bPQaz2yS5sN3jtWZVywV7EKxGdV28U8eVQx+sTGmeBvL88E/lqZYmuO/h1EA?=
 =?us-ascii?Q?dWdIEp0sjmjo1BL7RWi3+ks1yWlSkrwa/mjYaq7BzghEeTilOM0A2gxFVk53?=
 =?us-ascii?Q?UAv1nJGkNEtWIr1Xw55XdaGVEqZ2fn5Wu+kRgjL4uFbHSGv8BboXEAr6mwyF?=
 =?us-ascii?Q?pJfzfEM5ZtVVIpEzjnSYYj5yh+fJ5QqHJhtxxq6a+aPcVO0zypagGpxCjaIz?=
 =?us-ascii?Q?nfgEoDc/m6KFQFBo9M2Z4HJY4wnLX0qrd1p5sfLf4ukP9/pfaie5PWYqSQYb?=
 =?us-ascii?Q?Ov0RqwYXLW8//eej0fMhyridLfoA75wh5EmIjb9oxcn1nEze2jc8Q8Hb55ua?=
 =?us-ascii?Q?EzFFIr5vQA429Ar5EXYZQmuB6pAUQSowhVZ9lsoZqMQeEEz3QVvQ3uEN5wYi?=
 =?us-ascii?Q?QgtY3HzZ7LW48gveT8Ldvdy/fiPWufQtv8MKOmP8XXDunr5eONHqsQ8rNVQR?=
 =?us-ascii?Q?nSLoZiH5ZKJeB20Bd4miR5BXIAfN5+tuDHW5RHQMlSSD2XwCU6kfkJejZV6x?=
 =?us-ascii?Q?zCEUXqhr4fEuZq24eegsAReNp2NzJL5Nvk+7jy1wz5SuVLtrNpItx2mOH9eG?=
 =?us-ascii?Q?ys2r8P7RO1ccoQ0Kr85k3WKu7ELB8DQsc5tBHbIGus0RI7gWm1NKpQ3e38mn?=
 =?us-ascii?Q?o5bu+rw6M0+fM+54uCCkznvwx9Zy8hgVYHYnAUx7eblfL1xVCVXMt3BVJp2m?=
 =?us-ascii?Q?THo12vBxXM5dlfyF/QXFjzwz4w0eUa9H3SK8mfGQBcrYzx6kGiIKVekfRCPb?=
 =?us-ascii?Q?+cVs5+Jxuv5spKtMYLrXsfCZe8Z+UTF7r/adk3IvHtU5pRwwYVAOEyTaLh5X?=
 =?us-ascii?Q?F1gWUDGdhKs2CETTla5TKaAN90fugsgj7neWhE9GLnOS5sTTrBYA44DeEqo6?=
 =?us-ascii?Q?q6neaN2lDUUFpbqS76SPqmDHehLgX3mgAHTFkmg7ZUeiL60PwAQs8QYjtmXK?=
 =?us-ascii?Q?6VFqFniIZ8/EcRl/ZRvkms0l1NF8gpN8lgXe3JEjbsgMT45g+cLgerK7+eXV?=
 =?us-ascii?Q?NSF0pmihjiFLaBrUN3OX0RytqzIAkzwWqJCkiECLMiFEgfaNbEGdlc2s+ZKT?=
 =?us-ascii?Q?PzFB9B+r0iYnSKHNh5petU1Cvd3dRHtFdvO2bG/0nuOGxaIZ03SpD8frY6Ns?=
 =?us-ascii?Q?s8q1d/hDJuSPM+pnUyO6rluXYPWle6v3mvLWkU6UkonV8QUwhCowG1Yxen4x?=
 =?us-ascii?Q?cfrl+/95G4iUbSKrwBpmXBiHA4comfR9N4ArIxJAUqWDttgIFue71LCrjGzi?=
 =?us-ascii?Q?Dmp+t4AkWlacmnotBu4zONiSllmZi4lCH2ltghzvsMEaE7ekPMZ/K8ElZfd5?=
 =?us-ascii?Q?VUk8DfO34ec4xbN3O16I84WbVOBOS/DjWV1KxRsHlLWnQh/CXmSD9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jZuTYB5lem+Qjm3rJC1LBKF138SRzZpEi71TWVeI7Y47LGWpLaoU/IPF3/AD?=
 =?us-ascii?Q?0P9sMwucpjoF2F19/9YhOFYSU+MSrD6rSHQhE0SuBh4khoKAVPRoqjdWVfoq?=
 =?us-ascii?Q?81tUCyKeKTuWrpmRvaDBMtemhW/qnIEHxbAVNrpvRAwvWt2dw+cnUFrJDVep?=
 =?us-ascii?Q?Xdk/50PefJlhAZMmUcsn6R7Z/j7yZJ5Rcfc+dttFK3GOWB8Bu/RIaUdLGB8l?=
 =?us-ascii?Q?P1nikErwjWEMjlkMC5lfLY4DdjuxLnA01Muk5LCuRiPcB9zDFnPq7pn2IeVX?=
 =?us-ascii?Q?k+RUVKG0KE2GX3RHr35Kynh4Mf31P8oJ7HNkBaDrUQfsnVEvgkvg5lP2xSkX?=
 =?us-ascii?Q?P314MMg4pL/4+JXdia5/tDLTHzZ7oQTL1FFehHk1WY4IFHRwmOFaSRUN77/H?=
 =?us-ascii?Q?pFKD68r8h0uGBrCIdBa1cBvcFpJvfRiDLvs42zZzY05NF2x0jY35HbMxueC6?=
 =?us-ascii?Q?oHTcDJLcArIH9zWIkniOrdFiiIVurpZNmIzFHTyAmxjTYBUfIPJ4F0FvvhfX?=
 =?us-ascii?Q?fGM+sq+qm7mvXB9lz/9fa0IZvD4t1mVDLnTvJcbk40twaje3tpgA6JWzYcMM?=
 =?us-ascii?Q?UNzNcuwokM3IRliwk0zoHA/h6yv3OY6LOHbBEkFBHWQgtKgeP87BYKEhsAfl?=
 =?us-ascii?Q?xNyRst3dciao4+hgpr2d7HbI1ZzvFIhUoWgZGHvB7kjJEKmN5NM07ya51cjX?=
 =?us-ascii?Q?VHcoC9nBgIS/f8BroOzvpXIhec+LqWFM+UJAV66za7fuVCn8oPbVNBGAoz8s?=
 =?us-ascii?Q?9+353cYaDmhFblGgTxtrjYhKh/eHiyY7XYb8B6rtmq5pGPhILmRc93CPL8ni?=
 =?us-ascii?Q?CjoAS6txVhcH5ctDCmsNeA50thIK113wY0I21D9PpDIVv09xBArw4b8eE2Ig?=
 =?us-ascii?Q?X0KJ7nvdnPQDUhESPdQnRDsyXvWpLEwQv+qv432iN6ZwsbeN9NXuzDZ9ZMPy?=
 =?us-ascii?Q?2/EY+pYN6CshnD1hjxvslRj5CcxliCsUTA5j2I2klTBfO4sPQppQEM496cSX?=
 =?us-ascii?Q?2/eqHdT/09Z1B4jKHUJy/b1jDyFTriMsLyrKWjUTTHwtfmE07doVz8aZEZMr?=
 =?us-ascii?Q?Ect1QxdnP2EwD7RFfBur33Ey2X2PQdnBx4u1pBiEbc9LUVstvtwNNua+P9tB?=
 =?us-ascii?Q?BixTRb0ULw4UN8KahjIaQfBh+axquGehvU7aIcTpHJmD6lrCRnL+CVl2yZcW?=
 =?us-ascii?Q?RdLx28dK4GFV5IyPLUQuNu6J6ht6bYVDMrBOMPBd1t6uoBbrrhatGfKA5ja3?=
 =?us-ascii?Q?hC40AVW/tGJWUnK8QlTAW8oFlfv2YGQ1fzVN4jomltPlLqTvgmEwH7XPLDus?=
 =?us-ascii?Q?Y0WHxbQVShhWVvfpk4jlVLfbsxjNkB6d9MhhlY2Euig4w06F5M+1N8xaIEmN?=
 =?us-ascii?Q?oXvkvaPK2COyoXzIj8rVBxfUKX3nnw6mrBy5cmt5eh8NvPbZfuRDwPYI4Gh+?=
 =?us-ascii?Q?qmNX1ulvEcb4Y76aIgZhwpt7m+kqt8wV2U+/GDvJYLIcRaA1eMHyix9EfQ31?=
 =?us-ascii?Q?6etmxiXMpG2Toe5DhgRi5d+f6W7Mrqkul9uEZB27vOapVCh93Qi70M4WYln+?=
 =?us-ascii?Q?hRiHyhY7n9zNNWOrfjb/dv50fgjOQ+W+GYHmr9sl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae9c949-c3c5-4842-ba43-08ddb8b6a791
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:59.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mnb12u9hjtzwWBkg6HlUE0iFn3MI/oXUr0a1+g+wz+YSXwFmE2vZD1o0na55HpOG0kKzMfx8Fp4XxiHr/imuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-GUID: oy0c8oIUVppBquQND4riIWn7CjrNBTM-
X-Proofpoint-ORIG-GUID: oy0c8oIUVppBquQND4riIWn7CjrNBTM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfXy2w+0nZHp1tS zHNWelJW7dpCNuW5NqrVnHDW5pmTsQl22JN2mLS0M+A5wc8ytmaoZKrBLoL216VMeanW0cYaL+i syikZEHbNah+V+jI1EqZfvoaSLj54UlHiyvTtVz5aROvLuO07Ty4RfVzTeX63UzoXQkI20Q68ih
 SfABRFEXOi/f/UeK8y8JNtCLKAXLMjUvMJFLsC5pHdlkMMfPX4yRs509Gl4JoeAEpUh0dhqISaO uoPXMf5ict3jJOLMoMKFoECCvaW96v0mV2yeZXBv5dAklSaey8KpnfyRZ2WuU2ApR0QoYGVWcrj S3sCQfvNniY7kXXgBxqFr2x5XzhgGtx/IX68XoKZrzQExGFHJHZ2/B5hnb/YNn5RupLXyWMNVzW
 uZW7yQcapo864O1YS6IA1DRYuP8C/ivK0GqgZK4LZmCCaaEQRGTxGxjQQn1lY+PFS42vY7Lw
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68640331 cx=c_pps a=nbz8heNEc1OWkMMTQbiTjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8 a=1EDOiw9Ep1guGeHi-oUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=826 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219596

Add tag to SRC_URI to fix runtime version when using git shallow
tarball.

Before the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng UNKNOWN
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng UNKNOWN

After the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng 4.0.5
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng 4.0.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/procps/procps_4.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 2b41be3930..d568cc831e 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
            "
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
-- 
2.34.1


