Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B70FEE4E2
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:28:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116265.1772270905643992702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H34vqJLR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6519fc1318=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S8ifmj3005936
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 09:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=w14hsnyxpTgeDUpOOXtb
	aheDDDRQtdwotB/86ycsh90=; b=H34vqJLRUD8orq8A/hcNcFs36x63UBba8eK+
	brzO+rDSGwikMBYojqCWna1f9+QnmQC/NKDew/3OfAS3yyiHwvlPNNH9p0c6ryUu
	C0KXhHlmX4arnhqyx7Vn7owkGmvQa4/+Yxqv5aJbC93Q+udd6IuhSWBdnelL4AKK
	LXG+6T3E878z5nj34O8jfWUAYP6/EgPqNZhhzHZURGTSQnBEfuFZShpROpM+ocrD
	ohUbzGx1kvhUlaHfCgbZSIvSXownUqRoO4NEsJ6RUW7pvbVaXJUX6h+g5iMD9pzW
	cP4Lz6vE5eIF1noJBzLN8Rwyb6c7Kq7YibCG7DDfZ+AIBkzBQA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4g9ak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 09:28:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZakqP1HfHrfH9+YQ9zdUWw8rxrVjFuxkbzOW4zxOiQC2mfFw8jxUZmjfRKiUgpp+MXJwPrPpekmM/tTo/27mRoEECsHIGvjbZ5tHdlhc8pQhfbLNnwcv+QeD6Z/TprPYm7tUVBp9lsBs7ITuR4GcHbV33kLZVukoGn0L13/HnOjpxVAOigLQx0weUZBTf2GUMPhbZYO1KpdMB3O0CB9BMPxWe2+6O/BpILgSSOXlHn8gYnZ2//x0WnA20fa0nr6R91cYoZeDZrQhkRQGivrQmJr0PIUPp4q0W8eiNqSbDyKDUD3UFjQCxFh7Y98q60VfJ6zt7dNUdcIwpZ6wTnqTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w14hsnyxpTgeDUpOOXtbaheDDDRQtdwotB/86ycsh90=;
 b=woXiyl4ZfnnlY1MmlsxpgWuVG8qVHy3+AtwHc6xmOKW0wmrlwWgju70/DpihCkiICAPXB88eCs2lG4/FheaIC3lhAoI3PLVVoA7qhiNfsgAM7W7xfaHxQkXhGwzrMmOv714+OARmwCBFLoSlqwhUUHGfagHRfyjhcAMhzQUZns/5pxHdcbG3Fs/hvZO1rrRzh4slkpc7JkySnY4HLheUbUpE6SCJzMdcHRYG+f4Pwpj4R3sEZBDo30B1knXjpdgPHkL8mKuCEt5IKm+IaPBhRv4uKEv37AQ7tFlh1rXlyanPZ0V+6aF/wofIDtmul829H8rLNvxWVxQbQZ6Yq/Pypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sat, 28 Feb
 2026 09:28:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 09:28:21 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] toolchain-scripts-base.bbclass: remove timestamp
Date: Sat, 28 Feb 2026 17:27:52 +0800
Message-Id: <20260228092752.131829-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2caf0098-a7c3-4ed4-b741-08de76abb6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	X14wT0M36wCHw5F5Y5aNsBnCjwtCzM5NWGMXacOA5BThO6DLJ9MgiqCgSa14f4gyj4noz+aqh1tibVCLJW/WQFA6bdlfwtSHi63aakfdvW8oWjPONOVYXqrB8KJycLfm6lxwR7wfUWYoWopal2YmfnWKFkWVY3lc2agtMMdsCFrMC9MM49QZYc2ycx88jw3AGvk4KQP5uIRFq2jS+679le2BkMP++Je008U4XzvXpT8T8aPkZ5dQmkYuMBnrjRnsHYDre0g6F25knqWH8CQ7ICLxgWWNfqkN5kLZ38mrkBtl/oxfdYzofX295eo82AMFx0pk9qjj2jNCmdU+uTo/DEWICBAb3ipNRzJpAeD6eOQxZ0Ivr4dXHRmR2KNovrmH3xTqJGwYNLchEvpFB2nTAYVEG3B3OyrZGfAEF6dXf523SlgggILnNxo0FnY1ayC0+ZtAgiG7fjZLkiFGy+UJ9E7plODNVE0l0i2hh+oA9Ama5xF83DOCb9ozlXmeRw1l/uM+9dmP5iMqiFxX6ZpmumaviNBrwrJvWhsK4s0a/EDg8Pwnjy/VhLxeQLLbH2NssXprUVmr+S7CzCIbBfsW8faFAzWSp0h6/xTUJwD8zZdm1B2Ly9SENvVgVN5nSQkglln5b2ivUc4cXHrRXYgjW+LUksZ61QeqzUHmKUsODPf6xELhb8M3nnzabe8Wdz/ZWE+qCcoSQYnr4gR4WBStUR7nK9avKUvUYko/LR9YbHCgfU6v0oo3kgZDEwe0nMOlsrm3AMUggkB5uFZyEVNIURYv0LFgyH9QmsEuekMQBtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fBaXN/qaZ1FgfWCyD3yxqIrW93reULCMA8JefXzfzpnku1nfAIHyGlUJZw9i?=
 =?us-ascii?Q?o7Gci94sBWq27nu5O/nt2XT6uwCC73J+vccrkLoAe2+nouEsb+HOK3KNThUb?=
 =?us-ascii?Q?TdzRdWrbD5LreJO/e9pmNW+QpzLQ1VB10Ooc9wmIKVKUGWPd8tZQU+iDEaab?=
 =?us-ascii?Q?91qAhCeMoGXrI/MrmECm6fP3E2v9HmgPsnBjNFgZI5qoPOIbMlElwiw26slk?=
 =?us-ascii?Q?RLF+8ZsYbRa4rryZgrQ07+sQ+rMFO2CGEcu9HyZdtGUjjJ2o9wxETTjPOQIi?=
 =?us-ascii?Q?0vI2qeBgaNSwMyIZTM3uALtuSSvi1BULCwt4oOckmV8XmcLXzbB+BmZkXy1q?=
 =?us-ascii?Q?ON9ilfCuvtl4dXAl5S3OeceoHQpWmY3DQyrTGqg+0jdg0gH99L/uI+PrqBvu?=
 =?us-ascii?Q?hYfpjsKsz55/P+rDQpmxNRZXE9d/mp3/46qVZzT/qLGFvRpz9Tv8ab7UI01P?=
 =?us-ascii?Q?QbBCWA6w0F+XVOith7e9WSnbzOkYjon4p2CnNhH+eqIYw3PUX21eK8cCxGJn?=
 =?us-ascii?Q?JW2VnVHoFNr0oCS+LpNbhe/lklBe2e4lbA7T1OPJvdqbvpI1r/1tB/LATMH+?=
 =?us-ascii?Q?+Gpzy6seh198xJ9t4AHG6YVho7buItv2cnvfDfWxiVrQ5dwZaaPenJH4X4x0?=
 =?us-ascii?Q?F4hOLexXv8FXhLEPza6x3DEFW2s0ajPgfzrcMnDhAOUg1wBrGNx+8vFD95h2?=
 =?us-ascii?Q?xXr5tAR9NHjyXUWPzurfst0Smb2GJWJQK0etwjV529Hw4dCwFStQqpNJCl5d?=
 =?us-ascii?Q?Bi9jdpCuQBqMQJYkcjWwkADDqh2Q+zuLbD7myODkttNEq1JC1xsgWZbz4TBq?=
 =?us-ascii?Q?GuGMCid6nhW8749dr3Afh/23Qt/C4oOe+gnOJt+Fl2zTV4i6MpWYZfvbjYxW?=
 =?us-ascii?Q?VuVd/uf1rvFmd6kDcFtIZU/nQKlYiGHZG2s5qxEUwN1tZguOEEXpypk/KOUw?=
 =?us-ascii?Q?u1yJMTanG7AxV47KbNtkE6hBb8K94ZCCopmYd/kwULZcVZKJ3ytlpzPEbAdM?=
 =?us-ascii?Q?ZB0Uk16KxKLFpr8KfVtOQZWoNKXPlfnQSpbx+fnq0H6iKFwjxbKig6FJ6TWb?=
 =?us-ascii?Q?36j3lzE3if/44jfiMbIokW6qnGg75VGPXdMuwhR4/KCdQfbyVxEWrYLQ4Loh?=
 =?us-ascii?Q?TuwIBOedaTt4Cots6ng3bMOu9EHQNyqv8PWhqeYs+vPvfnVtJhxtLnhRiGeR?=
 =?us-ascii?Q?qYxci2ZDJCVT94htRcdvPzque+BQz/fGSePD/XJGJ8IP/eicBcasG4rgTJnl?=
 =?us-ascii?Q?Ahu6geKtPVKjvkXT7/KGR4sSUR9492KwUJHR5LoaB/AONComtzJeUGpR0MFt?=
 =?us-ascii?Q?RnKI1BLhVQ1XRjrI+cBbxmHOojUN58p2iFKu8MF5Rs9e3sqnkOy0i+Nhwnl2?=
 =?us-ascii?Q?o2Kb3EyrE4JxYKFPpH4evnplMPhVPhzLum4mOOMU+oevykcCiBVkZy2kV151?=
 =?us-ascii?Q?8Fm9uBWcDnS+ipjCVapSot8199ElpRa72wPLmeznKXJqoI3X39oGjvKm6JvN?=
 =?us-ascii?Q?Kb+M25KKscWHJAzlZh/Fmn475wRu337c3Wy4G7Q9anBnXCyL0Q0LqC7WNCms?=
 =?us-ascii?Q?TvrWGCZx9yMnckfnhcKsYgtPoi4lDPXoen0a5CoTIrNJIt5btCKcqUTgH/wU?=
 =?us-ascii?Q?qQrle63R19AygfkMWzOwIvTwxYI3lz1b4ZmxTpC/aSGJl497v8B3E3volz2t?=
 =?us-ascii?Q?IOBvB1QrL98qBKAE73+2reu01055K+zoptjM14r/Glh0qQDLJlLrLE60vBnT?=
 =?us-ascii?Q?cdjUbT09xSsUdc1DvLKEDB3LDR4Sd/I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2caf0098-a7c3-4ed4-b741-08de76abb6f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 09:28:21.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snHSdseLxwFHIGxrJ5MEygBJolN9T87Zw7nOu7aTo3tjkevpd2SMOW7vAhWEgC2hHeW1Gdu6+flSZoaaeM4UrLidchQCHd5SrkQMUXl5JZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a2b538 cx=c_pps
 a=7U6MwrGrMRcsJNK5547h+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=zTeRnpv56XKqE2hLBNQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JUCcpXRJEzTzKCLnLDQK-5r8Ro1WZtOV
X-Proofpoint-ORIG-GUID: JUCcpXRJEzTzKCLnLDQK-5r8Ro1WZtOV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA4NyBTYWx0ZWRfX4O+V1QvYZilt
 0R3WCZXRJTi9K3FMLIaC/yt3zU3syui7crLPSMVIILjQuUSuVGlOEYIk4NdHpR7nZr37J2yHW8V
 02fpX65A154mqLgK40m3G96ZpgWpmRqOMWLTif58jjdPYJH3lcepc6bgZk0qSjrb6+TL7hU7pqR
 V7tUrRSxfbgK+DxSeZPfMeuuxPs8m5FQ6q0CUVBURAvZb99r5uPcrHc0ly9fAJibLIBknWS3FRY
 TzHOz9FNFIoQc8sVCHPxPS8IutJblS14ETL41YaDEl/h/SMPesVPTffgze4oAmdtLd12Cz0pF8F
 mMVG9vNhfYOqKMi5ZmiN9Yq9IKeXM+JjS427kTNjHTbMe5sQpQn8FLdQAHTAZor6Ag66o9m6NEl
 ci3VkhjZrRMjjVeG0Uq/ldNMKIhCFcie9KXqSFqtndTLM4w3BbN7Vr0jO+vsG+HbkvZWlDFcAEc
 rJrJ3DIT8rfxgBpKcAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 09:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232126

This timestamp makes the package meta-environment-qemux86-64 not
reproducible, and it is the time when the package is built, mabybe not
that important, the key info is the meta revision.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/toolchain-scripts-base.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts-base.bbclass b/meta/classes-recipe/toolchain-scripts-base.bbclass
index d24a986e02..444721fe97 100644
--- a/meta/classes-recipe/toolchain-scripts-base.bbclass
+++ b/meta/classes-recipe/toolchain-scripts-base.bbclass
@@ -12,6 +12,4 @@ toolchain_create_sdk_version () {
 	echo 'Distro: ${DISTRO}' >> $versionfile
 	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
 	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
-	echo 'Timestamp: ${DATETIME}' >> $versionfile
 }
-toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
-- 
2.34.1


