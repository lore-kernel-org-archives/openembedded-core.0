Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E553D6552A
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:48:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10735.1765964887021260981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=suVmnSa4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4Avql1466852
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:48:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lWXUhW4KpOKVg0M8RWdq
	AEybz4/8KiRpfDGIaZxfxIs=; b=suVmnSa48RrkTOzPrrWd7Bqq56gcAQ7pfJyG
	/8phf6XOhDbqFHkUlRl+09SG+9RKR6vbQDxtZJXt9ImE4AAixLQK8yP5a2agoGKB
	gxlKrMNI8vCzdxjLodJWHsP7kJkpH+dhMMxrMcPi3ZX1h+7Ia89sNOAP92RfZ1SK
	nCR48Wxk/p1dHFy8dl9xB4KOJ5d9dvDpo6nBTR6Fbqr5PxD2g9gycqkiBY2GT+EH
	4gnqOiLnsfHbHHTlY+GiU2u3v5BgO0Ik4AAWf4yotTkctKCq/RiXwdYz9lTVFtun
	1fKDWLYvxC52MaxnnVoHMsoDTaQw1ITo/yeedM1t3X15fWzF+w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sgcp6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh4KqY1svOEDir+l5YxgNUCTsNGaW1kK7BIu31BVuPf7wqspVUzNc3XIrHW7l+Z8VnNHgEssd2z8VxRBQOl03Y0RjRGIVtyvKDExHeRvGjeiwnsYaYoP9chilQxthmwDp24o7P24FeQr1RX65+qOClYyaAqRmbdw6TQlkKWasI/es5x/8luYA3Y7y6pwNmhEWjpG/bD0OdyhYiJORWjGMucYMDTS9u312Gs2NDPhA6nkN1wNXWBn9iUFqqvn1sdVkV8KeD2dF9VwboYAuxMwl3mn4SjElNBWdIZTyYkA2mHJcrVteM89KwJw2KzN5669/j3+sBn4ukgpIjDoTecI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWXUhW4KpOKVg0M8RWdqAEybz4/8KiRpfDGIaZxfxIs=;
 b=YsokIMoqofqtrnPbc/t+mkenG9hcnUVvM1iJ3CsHnNzj2d1hDub0c/GTaFJicI+Gtc4JmpQEKFucG4Qhg9DBvZtJ83yJXoVB9UOw9rHmzT2ouJCBTkjuYxVU3OpnTb0P1SCXi02gjVERnYWkbtjz+lyg1lwaP8qG5Zg6e2mmV2MRP6C7N4jQmXrPt1+cnDyKfb7NZqvNnGPPSQsmg8Q+A9VHmchmG+XglwFmFdx0N5ymppDfnr5SWmVBopLgi1jfoGpmOkM3dQry8tTwEOOH+5b3zRTIo+OJgB+oQCdCrEpqMbCjYv/mk6QPOwCkUeTQmmbyUZvBgmSSQShVRfTjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:48:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:48:02 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] insane.bbclass: avoid unnecessary rerun of do_patch
Date: Wed, 17 Dec 2025 17:47:47 +0800
Message-Id: <20251217094747.3217558-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0188.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: d63fb119-3c43-4215-a631-08de3d515eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c7dBDKdeBJnHH/7AvQS9gW/SQG91Uf4bPP0RTfvi3ojyy2fZjAgt7qVvGCnV?=
 =?us-ascii?Q?AtQxMUiDGsOC0hBoK7WEGn6wcyCDrnJwDEKQQNcapWhiwRN8ez6fZiUoLpsP?=
 =?us-ascii?Q?b3jzJlXKxrUjko706i81V0ndcXs8KVfReAd7h0zJUwyBW8QwyO6oMg6YeATd?=
 =?us-ascii?Q?bA7zMQeha7Ni6+x8D6nLi/xakioC0VYN3mku9YJTaeYalRWCru22jSU5X73G?=
 =?us-ascii?Q?wjji5uWD9xjoNtQQdgHwvYIh75Wq/ryQ1D74hG7ILeFsNm/TpZHS7tAOvI8j?=
 =?us-ascii?Q?7oV4izspU+RliaUwOrfEZLYsXLFCZWCCqDZx1yvmcT4LNLzq1ZcPo5/1Tqkw?=
 =?us-ascii?Q?hctHwRxVOSIRqd1vDGnscJq29sunbYIfUYkrQxRctlxiFsPbBV78DGxBZw7R?=
 =?us-ascii?Q?X8QnGDVRyHzo1dpMls8F5bLe3e1ASHMDcPQSVd8ub+iepsvXtAIr/8VFpB0K?=
 =?us-ascii?Q?fSa4CSqbOapCD0eaht2A9fWKfdFe0CRzOhlx2xAgqb5E/fI6sBhMYxS7DRHr?=
 =?us-ascii?Q?PLBfra42vHkC1tUYyfSeMo43eYeCxluqwg4aHnky3pVNR3PXc9ybP2hTmrsx?=
 =?us-ascii?Q?ozHJsagkWKFYhomBkz74ejTS0RezaRHXcdt/dWfDBYaWbaxoOr3D/Hd/CEp0?=
 =?us-ascii?Q?+e0sSBsMtjbBp7d+cqULI2Ora/O/HXw/saij7AZWephI/VlOe0QyB/9bV0xa?=
 =?us-ascii?Q?uS5DK9dichxkPV/+gxJsUYw9UIptzVr1LX3KjPVB7M0dSR+YS5jRxyOzSMeA?=
 =?us-ascii?Q?CKFT8qDJ33/1bngw5fwnv7/Bp4B8TNVEYCcpr5FOJlE52/dfm2WIy26JOq3O?=
 =?us-ascii?Q?gys7gPeqB02n3N7+i3Yk0rQ9r/gtmTy4uKp8wi0Xi/zk8+plWQ73kbWWvlHI?=
 =?us-ascii?Q?0aROqaEnaIEKiB4WeTuNaTVAKn6pYYfQ/9ixuuYrOcuk9EUXl5sTwE21FhXp?=
 =?us-ascii?Q?tAbaE478VRV6Gl8Qdgo+1LYR9V7bh3DJGLOUOP2EJf66li1zZjJt4wTuwHhm?=
 =?us-ascii?Q?AJSOhW+wXIOzZThU1S27mOhabMAzV5NW7z9rfD9wcaVzIn3Z3ByHWYqcVkI/?=
 =?us-ascii?Q?o/EWHaDSnMOxNzhXEEtPoqjYM6LTJQNciLxHvNXVxA4uiMdyanXxWkw3akg7?=
 =?us-ascii?Q?3LzCIdoB6/qrirYqFs6M0Ec3gyy1GKNt9ADnf5JTuy+ZkpCck86kYErA4BJy?=
 =?us-ascii?Q?mxTab7qMfvPTJC1PIZXLWivqgxNbk8h6xM6d8hwyd8+GE5dBpS208wFC1s5u?=
 =?us-ascii?Q?xyhqUHzj/SYEBBGOusfVvNX3piCzcHPxCgH6NQ1rU3g28les3nxRRibc8w43?=
 =?us-ascii?Q?dyQYd6laDUcIggbWCIzeeHRpqaUhKwYKKILAwWjTZ43VsKJ88yaoxPNdvLEv?=
 =?us-ascii?Q?0lTjw/ZaQGW03ddK08ZQlxRm/8pWXq7SjmIIP7hVrHdR/53ZHTxR/4Eu3ip7?=
 =?us-ascii?Q?zzFjQWxqCUXM+WAYhTBrDGE2uoTOdi8dvrpXDzipWtr3MZeGqUbVyyZt37N2?=
 =?us-ascii?Q?IbOzdjKHgilM3THu50a6vqN5w5MPQZgl4da9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vvF3KZmsmHw+bYc9zUIXWdjvs05B3dvYEVJ2KDMrr1wl38XJiDglUMsO6tho?=
 =?us-ascii?Q?JS698E7qXdklgZws4rSwRxDjAQe52wpgOEz9SXdP4EY2Qwnl41moc79b9dL7?=
 =?us-ascii?Q?y19td6qSyAeTQIqqA0yBzmAdFJ6ZBjKkVKBYgKlFufDapuWzdl9UqIeel0L1?=
 =?us-ascii?Q?T5LY6KIMIxDU36fRtvL8El2Ntiaft6Weu4MPDsCPnnmx36PniTPBFt8xkofO?=
 =?us-ascii?Q?VWCLJfT3fNuUzZZbilHovNHE50iRJfJ/T0S+FFiqtmDRTbEojCI44669oF1o?=
 =?us-ascii?Q?WVaXBz3RehCscb8XjJiWnklYqwpgD+h0HrKUHFCGBTjJvVdTMw/oz/dic8i2?=
 =?us-ascii?Q?aQ5gmD4y+tHvffpBaM62e7diB2SM4r1zwT8eWuDu5Viif5x+y57zyYIx1JCK?=
 =?us-ascii?Q?eDz69sITQPspM78vSz/gq5zfxTL2XAkAezWCROPEm11Am67rnko7TA89i0ni?=
 =?us-ascii?Q?p4raSkLRw88AxpJYW+Cci/Yf7pdE4YKusAIgK5Qv4X9hSQI01dJTA9GLRenk?=
 =?us-ascii?Q?8Q6PswF3LT8I03tirCCyG0+5A2hXYX2vw6dpGiJGonY77NMbYhECkDDO2GKl?=
 =?us-ascii?Q?I1mWYurgBi0ZRZUuCEeihIWwxOmn4m2zWNmDMxM24nHA3cHtCa9bYhYhn5TT?=
 =?us-ascii?Q?iHwUkOvuGL/fJcCpAVfxl5nx/6DJGv59e9gEhwYMlNXYJdM0kcs5vOqAGyMX?=
 =?us-ascii?Q?xfSOkFcT9VaB7tiO8UbUGRLUuSU8aRNU6CVhx/liSXNhWfOzSpZprGusEerU?=
 =?us-ascii?Q?656ZWCIUgKnnfIQ6c4cTCuH2/bINKHNqysPIr1WsWkNsEFImntgV/pUDxgoi?=
 =?us-ascii?Q?UFlKXpQ+SKgHnztIkCuO0GCH4GLz3YfO4g5dBGml0Pgh84LXULRC10BzoLy6?=
 =?us-ascii?Q?ySdl83XoVhHcUrl6MPwXFRzmUkveoGRmt4Ypj0omCJ2f/Rxsv1gsDs11hjH4?=
 =?us-ascii?Q?n7/N1Ggu2qwLjzaY37F0Wt5ZCRn+ipoPYITXqGwuNMqKD2vs409vkUWr3LZt?=
 =?us-ascii?Q?yoc8EG6vqrPv2qfkf1NUKrevUvefvXGxE2w2c390M4oSnj6jHoEkzdgs7mk/?=
 =?us-ascii?Q?W3FdMtcyt1ZbSf1kOu8BHkmZR+ym76Cs4znOK99VDYX8+Pq+oSb8zsLsFv1+?=
 =?us-ascii?Q?vWHSR0bfzk61Y3u8n2QGA10CKRziDEpESc1LLA8c1km0gctHxof4itXFOhqI?=
 =?us-ascii?Q?kgZLJJV9MefHaQTWZgUM3X4vgL5I8uiINmC9DY1EsE5VlPmB0A321/m28ZcB?=
 =?us-ascii?Q?Jy+V/o/fkB/WIpJYvy/Y+5R9/Ln6U5jglOjjAscICmEvXglEwoQ+1LrXq1Ap?=
 =?us-ascii?Q?ao7TfFuYva1CnsTjFxnxwUzf3bDJPOsnhXOkSOUbX9DEvH4YRXounaKBrHJB?=
 =?us-ascii?Q?7MNE0yDUq0ctVMaN7W2ZrwsHEEdIJng2Vwm0TRSz2utb/wPhBOWy87qArQk8?=
 =?us-ascii?Q?o58cnhHJ2pCjumczV3IzlHRZE2PQloydTm3KiID+nA0CZKr/JLT/NwOmGAQ5?=
 =?us-ascii?Q?OGyNz5gcHOuWc8RUHJhFvjX/NxgiXLXeA2CmgmYXglMTSph0qeOjw2iRd5tN?=
 =?us-ascii?Q?eCikG89NaI6aI23LLQoV93T18R/TNvdSOU5A0Gk+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63fb119-3c43-4215-a631-08de3d515eb0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:48:02.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMhOyALbF4JUrRfRy1ubk+Qdi+HzD96xC1xmejAedU9gANp6mww9Uw+A80xssOviRZzS/upfmmSqZMJx6LO8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-Proofpoint-GUID: 7EOnkvtBD9W8SAljTBplVAxJLN_tIwZW
X-Proofpoint-ORIG-GUID: 7EOnkvtBD9W8SAljTBplVAxJLN_tIwZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX7bMtNTd9QPs9
 Bd5B0c6oifIRYWB62wWROS7HJBo37TMlHiO9L/VW8EujBg7nT7ugD5eV5tuGN5uTG4L5I8HzmuO
 j/EZ8NVuxgUUGGIJPG1I9Oi/t9r3yg0tkydO16tm0MUAdhNLypy4elgF+vQG8KltSp3zfHV6JJk
 zMhV4hb8+fgAYxB3Ijc1vfiVuOhFRdNMFkVmmaZhdwPhgnHkG1YJlJdUdPi5/kyUpGe1gwVafTK
 9F+9Rgk1xMiXHJm79QSy9e/1T+uqvEHMuFF3r5GB7wwCBxnxdqr9fq9Uw9HNdIJ72nBlVBDkH2R
 Fikn9jTW6PStx6+/N1LqAw2FQk39LfkDYleo7yKlr0iLcUCrZqXL8qSHC5D1v23piLxADWezO3a
 iiJnCPHxRIZd3Ko4PWm6Kfiratszag==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69427c56 cx=c_pps
 a=VZSJMqPseUw/+4g/T0Awdw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bsVlAXb_Xh1ewsIMwOsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228019

From: Chen Qi <Qi.Chen@windriver.com>

When toggling ptest for DISTRO_FEATURES, the do_patch function
gets rerun.

The dependency chain is:
do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}

Such rerun is not necessary. And it's kind of annoying because everything
gets rebuilt, including cross toolchain and recipes not using ptest.

The ERROR_QA and WARN_QA should be enough to trigger the re-run
if unimplemented-ptest is added to one of them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e..3185209b7f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1345,6 +1345,7 @@ python do_qa_patch() {
 
     oe.qa.exit_if_errors(d)
 }
+do_qa_patch[vardepsexclude] = "DISTRO_FEATURES"
 
 python do_qa_configure() {
     import subprocess
-- 
2.34.1


