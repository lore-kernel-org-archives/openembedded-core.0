Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EBCCA101F
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 02:21:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3396.1757298079018856723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 19:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sOZa44Jy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13461af826=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5882IDxM2826811
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Sep 2025 19:21:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jzslwasntkglyYaus0NT
	H64SgpPc61AHB1OFw9uxadY=; b=sOZa44Jy7jC1t5Rue/QyqA8mXZIyrKC8T3Rf
	5rrhP46zpCdyR5cRApjoZAHD1MiZ4OSrM4lVrg5VaQuMF6ZL1EyJUbhUY8BatX2T
	E/l6e8JehW3bdetaobnI33ajMPTRemcQS+mIp6+E9cw2NaqJW+GT+y9Ta/qqIA6u
	ZABeqdBCUeYincoiGMXj1/5rGUwHIOBG8e+e3zDNbd0biLxUg0H9v6G17Ll+e7z0
	mh3RIRSN5mZ3yLhqkqczVOcY0qI3Q2a7xB3tg8HWelTOC0H1PKyvQy0wDBM2GivM
	wX9QN1eRwzzGBpadaJAoeoqu0Wp7iXRkA3sR86KisVNavjkY7A==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg12bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 19:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gph/W9LxufheJF4KEXUSUajE0Uig5RNdYXhwucA6J40iqvtxhKw5TF21AoT3O2P5ZMeDg0ZdFR3bpci51I32GCmPMv6otDSSdcRhIT/5tSC9Hwk9oXsgBEThENHM6hcM8iKFmK3Ujx4e3XJ79bJELw1fgRnTmC4FS5HPOBxgkKqxzGXbLLvcN5c9Ichk2fOY5zXhcNsiIk9S7EOf4TmR07qidayNbpt270/Eb/hwaXybHDuDSSroxJkYSTxH1auJVYvmlvUy7mn0L6zB3a0wXmKqMTBXf8G97XdagU3Uvf2KbjeybmI9M1+s7YfathKmI1ape3deyV1oSwLkp0G/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzslwasntkglyYaus0NTH64SgpPc61AHB1OFw9uxadY=;
 b=iiR6afJEPUgzEVrGUtGXwiD+grqADj0h8TuGDqxRCyx0esGtSo7cB+9y1VlE3MbNh0wuVNmXIzjLfQLewenH/uRS7fXnVKwrXI+QuqsUvOFkNTvu1tUcJsn4qvBkdhsrydCI4UwO3MUQa1tkJZCkOhr12MwBcoik2gpB9oJV0CgPw6nXc1P2RdxgXiFA/pdIsepecZniV7rvm8q/RUYqYfMXNr5I6sMXzyxOSgU/1YDkVXFFNENLBh/HiXJl1LjBTY3gpyJueH6a2vTywol/cYHBVEoDQXHwUnGlii9tybVXcF8kjLxbUSvIyKw6IR6f83R2PErYq8dgUEsxOZ2Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:21:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:21:15 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_manager/__init__.py: remove obsolete codes related to packagefeed-stability
Date: Mon,  8 Sep 2025 10:21:00 +0800
Message-Id: <20250908022100.1538277-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bebf7b-6555-4c4e-d747-08ddee7e630c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2aHvttoT8H+iA2mTiWjvxWunPKOy32u2VvG2T0cIBOmP9T0CqmJjhwKsHIrT?=
 =?us-ascii?Q?J8vOX0bGp5HG3w4tWY8OX1FhDCtTHEfom3FtqFUwsJyltawa7CXV6VgLXvix?=
 =?us-ascii?Q?jsUDB4OtaBZT8lwilznY67Pjh97ei66AmrNlt15mnzYymCuQkRWsduGBqZQU?=
 =?us-ascii?Q?4ZMPUOZpQBJKzI+WAUWJxW63xMji4RTuDDnntnfQhDQJ608035Ilz8SUTQGk?=
 =?us-ascii?Q?RzZC7dUi0gQ05uOPE/lTGrNmdIx+VyC6Ua9Mad9lgfReMmaqtqsAVBGPZzhW?=
 =?us-ascii?Q?6v9M1rsALl3cZ1STUPOL4xaYvBjzajKFKR02lnzcespwy93qlIiUnmmQG2P2?=
 =?us-ascii?Q?hEhJxaEzY9tXovBOHww2DfW7EtMjXoybghXjTQUyYga78qN9cXk3MGn6a1CS?=
 =?us-ascii?Q?nMFfLBhSZ6eDLtT0uc0qrEV/IgEsc5uWsksuT94IlZAEcI6mD++edPhPVVAM?=
 =?us-ascii?Q?M52WARQJgfbctf1Prl9UnGVo1fzkPZkZjHr49jGudI8d43AiqHk2kYxGOAlp?=
 =?us-ascii?Q?g7lrvStmQl7xEPQ+db9WrKxv01xCRrOqybi05AF1K7GAWcN8QT8IejMiok5o?=
 =?us-ascii?Q?ndDpLn6DMqJ10hLjLkW3nzlFfeNc3cLC5Z3TFQTq8vTYj5jodXE0YBMxJtps?=
 =?us-ascii?Q?ErHIW5DND0255HmS8HgXeVpxac+u8QE9UdrHXQdWayi0I1is9/ixqYspcZrU?=
 =?us-ascii?Q?60mFOBsydF9/9aFm3JXj+IQfWKF7Ey4dLVBXXpxZIjrX+1SOw5o01eooEoX7?=
 =?us-ascii?Q?tuYh15cTZ2GlX97EwSBie4NJwLbLrSGKbZPSV3xoAoJcuT3UfTxt4we4hRvD?=
 =?us-ascii?Q?16TPVi4pI0FuJLPLdoilSRW6ZIGc7TmFPJm6fD6La9Tw1g7yV7iGCkUcMo6v?=
 =?us-ascii?Q?xpTlJKxElecdP9cS4LrlsiAkegdzLzx6yJ/8jk8uAvhUuXCEZZ2HKHbplqxP?=
 =?us-ascii?Q?oH1Ci4XRdaqJ4+mDL16lhPZuFipcAFFhRMjW0Iedvvrj9F281RNFHojEVT77?=
 =?us-ascii?Q?uNEU0UgI+jKdmUUR/CQ0ppHvW7xGpyI4NVkYdj4Ryyn7+QfSvPWGYtg7RiJl?=
 =?us-ascii?Q?9oNo5pOawlk0WVVS8yYs5pdNX+N2OWAswR+qzb+xg3GtpogDeWSrISoP2B0m?=
 =?us-ascii?Q?m2sFnYulqOHv73tRNQoa7pj4dt8zdr4N48s3Ma5ctS2lLvMTmGRt3mPvVEmZ?=
 =?us-ascii?Q?kTEm8/0ZmVKbsfSsbDaXksf3YVEWHOnUVPzy5STJYVE+Zmfpt9cy+j45uweJ?=
 =?us-ascii?Q?NJkL9W2uvvP2ULM8qmDd/XWrb7QGn2Mi5m41WDwXhSQAcd5OFxpkTzkH/wHJ?=
 =?us-ascii?Q?lepCoWFnErlfzHLS/I+Go83lVFE15CUjiZWSGofPsRVeXA2zVgnMVio1Fu7U?=
 =?us-ascii?Q?49ZTMO+glFixeuQTNLYhej5so672dwb0ec9TnAXs8uOlBT3Kuc78NTUuCWCP?=
 =?us-ascii?Q?AXS8ZG+la4Y84GQGh3/6MHjZqCrIcoHfStH8VNteVZU+kNer1pdBMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y4pn8QrFp4tNnMp0vHEB1XoO3aOiQ9PSi+5MBSTtdByh7UbSx95PdxwMW+sr?=
 =?us-ascii?Q?nBxlAJbNtGPSzvmimccSSsUhJmUn2lA1/f8Tn1V0o0YUYmbkJ+KPOeH6sr7A?=
 =?us-ascii?Q?cRSBOGvrbNagNXytdmdFnVHhw9WbMVoGVaiBMlPbxZp+pRkFmuhtkOUA/RcT?=
 =?us-ascii?Q?jbfB5Afv5ah7rEcxpeJUyQoLH22Oifw+dEdx4l0f76oRLyZR/JjuK7pHTraN?=
 =?us-ascii?Q?Z5AJsStpspUPPduQrX7ptWPWSke/ca3e58zqsoZOvoNQH135J729A8GAyGEv?=
 =?us-ascii?Q?yf7HIURPZhb7mtAiY+T/jXitPmjuse660odICwtVEb7DQXv4edq0lXAS9SgR?=
 =?us-ascii?Q?6m+Jcnum3Z+2WWLGMX490srFD/DTFDHOIdsxTlPrX0v7XV15kTJkmJecSSn4?=
 =?us-ascii?Q?MVycGq9VczIV0plybNmZBq7GGkXeBbrbkZbQFyN7JdNlF1uRQrKUGSXUaQGf?=
 =?us-ascii?Q?5S9qv/tNo60F8+yIGLRmX0u02pi5InVfbwJFDoDuK9OPhXs8PbR96pCDq+D0?=
 =?us-ascii?Q?i8IPig0Pw8SCNTaZi+8TJWIWhWTD1a+stYP67Wf1C3kCT+YyO6vKhZ5P1DyH?=
 =?us-ascii?Q?7uvO7cm7K7Bg+LKxrrkJBeHnp4C+KAbyjNNKuaMs1r54rWjWgGdsTy8gsFan?=
 =?us-ascii?Q?+PP3LX0IWzUP32KJRUfBW6VGm+ZQTysBSvMMdJYQ0pb1AIHb+KeuGQ6MQq2S?=
 =?us-ascii?Q?4USNoVw6P/zVA+If5Le4edh2pIK61IDLbbVLz5gnFuDdjPa71rMuHXNJ8cQR?=
 =?us-ascii?Q?Q635eLqI59fDag1z4gUglkFEz+AtUVSi7r1x4TDV6kh3fnUBDT0RJr0USiZu?=
 =?us-ascii?Q?iXgSRFIGDYOGv//Oa+hYNsDB//BKizO4VEQBdDF21Z7RMt6zF8MQc9W2cnhn?=
 =?us-ascii?Q?vRkEp5onEL6Ii0jNm02P5ouog2NHlBRGyCEhKjeo2HMyevtAIoxaq8XArcaC?=
 =?us-ascii?Q?xq1YwIpy9lXPgxtFqsYzJfmeHu3i2jJDe3V/Ac1Hy4CAXN5K1kxa9eObinZg?=
 =?us-ascii?Q?cjUReCJfEwcsm5JdlbBzQGXMnOfnSD1eJl3S3j0qprZ0zvSWnKwOCEzhnfd2?=
 =?us-ascii?Q?AOFyAEFMjLjCD9CKQFe8R8U7sNX2hwPBv+0v5o3R24L2fiICbSA7r18iXwwk?=
 =?us-ascii?Q?BmP6vHQJ2xjFyzuFlpky0BdfE1FHZfrH49ZMW3LhptvvMqtq4ymAtMpm6PdO?=
 =?us-ascii?Q?sG2+dsKRPkShjaWUlssK4PR56hNKnO21YTbv1pieAK3+lZUx3VLtzkt9TRkf?=
 =?us-ascii?Q?Gggw5kib+YXCcU3hTQhKwoLCMJNqZLQnIU//7ItJY/mXFITN3JEEk7q7gi9f?=
 =?us-ascii?Q?SgUQXucywq2Wuxb3qTrX4+8eldzh64BwKByYXue4/UxOGa0DQIaua3NgEFLi?=
 =?us-ascii?Q?KCnwZ3Ia3kgaHbA/bKyTY39eTODZIiAWgTvtWh81EZNuRKchgXhF6n6q751D?=
 =?us-ascii?Q?eEHzKXaMDx/b25B0AIA7ILLxRJhFgOz9X/h0aYN1U5+GnKrMVfqfUW3ukaEi?=
 =?us-ascii?Q?K0XLYBrTZiQ9YIUmKWI1wtdCwAQ7GQECwZJykpjj5Pe3qsBrHNoozicK1WGW?=
 =?us-ascii?Q?aYPlbBamZoCN05LN1KL5JWxji5YgXNXLp7uP5Hkr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bebf7b-6555-4c4e-d747-08ddee7e630c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:21:15.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CGOba4AChVs2+jcteMWGri+/F6XaXCq2GE1KyLxovZKh1/R2is+D61BSuX4tWiC5aNbTz3Nyz/RUYC4UshDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-Proofpoint-GUID: d6I33Olff18Dgp6VSFbzKK5KhUHhZAnH
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68be3d9e cx=c_pps
 a=VRbO7Xzw2I8tExX10PkHdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=B0Fzh78GVTGbT8YVs8AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAyMCBTYWx0ZWRfXwaqqSv4btV1Y
 KBddOcsk1f9JJZT4eIttEbJnwU1dttoJSZ/Mb/Lgi6hoYeF1KO36uvB0dH71AOypUUu3lSjgkG8
 qA3SlPcEum6mWTdKFJwL9/m5u25wUcDdXbDMLNs2h5EMGdK1e8EppHC7hZynNUwxS4wAVRbtTNU
 QY2rR3qfFRHRGHP22byK2p3gWq4DeOAKDl60q5zjgDLCQq7eFq6IfkUpT/zUG+DpmkWcZFnDiuZ
 gdX0O229aA4756QTWMxqC2g9Bzt034imXTaAD1r5Vi33CCxRJo7Nz+ZeiR29mYLMpuPJ7f7xPy1
 SOMmYQ104PW5FuESbrYYvKLJlJz2SCWM71qTvuEG0WlZTHPH7gT/4JY/MYVah8=
X-Proofpoint-ORIG-GUID: d6I33Olff18Dgp6VSFbzKK5KhUHhZAnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 02:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223056

From: Chen Qi <Qi.Chen@windriver.com>

The packagefeed-stability.bbclass has been removed. The codes related
to it are also obsolete. Remove them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/__init__.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 2100a97c12..5c98a104be 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -513,10 +513,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
             for l in f:
                 l = l.strip()
                 deploydir = os.path.normpath(deploydir)
-                if bb.data.inherits_class('packagefeed-stability', d):
-                    dest = l.replace(deploydir + "-prediff", "")
-                else:
-                    dest = l.replace(deploydir, "")
+                dest = l.replace(deploydir, "")
                 dest = subrepo_dir + dest
                 if l.endswith("/"):
                     if dest not in seendirs:
-- 
2.34.1


