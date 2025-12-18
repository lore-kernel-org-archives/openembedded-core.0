Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DC8D68BF6
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 10:15:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38674.1766052943230744831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 02:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BL9XxJOR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4447d4812b=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9bXiZ1064611
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=knPsAAsB+Oy4ynDne55t
	9X3CWqK3oVx8lNRgAWHZ0BU=; b=BL9XxJORcAkZtsJY1gfrBLR98gkO0ar+YRHz
	EkWqSxG4o4saDBuyG/e/B+5v0lKzBsTKdxVodMK6B3xMF8yfnLoSgU5jombNRIu2
	suY7N/eTWmGJco1UPiSRMZEzX+UCF+0nDcVyLreHaE14Mut2f5JlfPGIDX71NXL+
	6oI09fccAZYlbL9uTd4LLHimLue+4vyWfxlj+fYPPoiMZZuHcNAS1QTK5nR3/mFw
	oAx1mHqgtj+a4wsre2w2g1jagc/oeoc/RJf8oL3eUSOHcOwJ03/7DilabY7LQDQ0
	rcsUC+6mlsmSjS+mB9pLykMdn3PMYhMGb9zaHFr/zyIvp5vWPg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bst6v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 10:15:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2ORwBNN6e3n4REj7VLm4xIdRvpTGxryLSSvUcKw18eY+Ed74iIt57VLOZWZnsjzEUDTGt0J7EFah2mRTuR6wzp/gDqtP+RoPNjafvGTT54wk6mipsSYFBV50QjSG4WD+pTsVGY3OKdkvhUMwAsm6owgZiDwsLSslasx+x9LppaMwrXrh6ZWejc1RiYHbib3FyDXYC2LhBWQOLEVOVvU9YyLLvansxuvTszXig8GHt7bRAP49yz6DEK8xfu+n5WfA5W3qA3ylE+0vlXR8SObHE2D7w4lj7593Sz3qhkrZp24ALKxhf1kktDADNRMXrT5eUIE8t+FYY3vd65N20zo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knPsAAsB+Oy4ynDne55t9X3CWqK3oVx8lNRgAWHZ0BU=;
 b=g8mkGOGqGugsK76g/xbJXUsJ0q9wNEUdBISVcCpuTxOeZpooS7Hv8cZaQrQtKoRAdDfUX1iBrl4uhMCythAcu5xzNS2n7iniMW2kSojo9VgTsBjWDtOqCar05Ssly1h3CEkQzj5ytQjb0HOfuP7kXA4YPpYvF44psmkrrPpVAkxb8J1n0Nrd09Q/8sTpNK+AfkoP/+L8pOmoboJuOKhOJGddqKU8EW17j4L4JLnKrM/Xz/6HUZkLnp5vcQBYmq8on+H3vmxh9r+I/B/PVUsU4uHUJ4IR2jnbZ3o/3tAsa09D9MKRRwQkEyKAk2PMC0FC3leK+FKi4WL2Z/8b5RkdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 10:15:39 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 10:15:39 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wic/engine: warn about old host debugfs for standalone directory copy
Date: Thu, 18 Dec 2025 12:15:24 +0200
Message-Id: <20251218101524.703244-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::20) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: e39d4dad-ce33-4d7a-51b5-08de3e1e6480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hIc11gHUa+GGoYt6kxfysi7kJLIb5ZzVfnZWQBRCJe4NwaZgysQvwWj3TBch?=
 =?us-ascii?Q?SMwpvw3iU0eMZfdYQslrMFTTbujybgK536ITDn+fUhnuZ20bGEzjaXX2AUDR?=
 =?us-ascii?Q?+bJ7lD9ON1Wmwa+whONMPSBHS6FLK7Pbd7EzAbITjta5j3vfNS4bRKWDNQIo?=
 =?us-ascii?Q?n47PJ3FgXs2V/06TGckFBUyq9kTkOBFfrhHRsKPrQdqhkh8w6kWlzcfiuHQo?=
 =?us-ascii?Q?ehsXA+LKsi5HYI3A8W6X4ORVZnWaogaxE8MFPIbysiGqb7lTOg1AJT60Yv1g?=
 =?us-ascii?Q?RgSYcy/5juLAyBaqImywpTXuLxs5OovwdGKGIa5kzWcxYrJ2cQGpEx3ECrlo?=
 =?us-ascii?Q?/53orcAqmhIk0DS3HRjgYluaO7oLealjKuq/lfkEbC1bSckJR2dYMF8wS071?=
 =?us-ascii?Q?nDXBTHvXJkMD9VlpCfsHUD3dDBD5yW+Oe6s+548xW90HIzzVvzUoGXwHSZhk?=
 =?us-ascii?Q?elWQvAdDW7gnbPIcpc/Kg0kOtVoVc3ytwuuGxvrLhj8YRxWmKEOfn44GqAqh?=
 =?us-ascii?Q?YczhE/nANXZ9Q6+FDaBSEdYN8d0E4e2sDNiiNI0OoIl8ECKhUtjuPzGlb1qI?=
 =?us-ascii?Q?djEer2yiIqNuhqhdEXMBm2CshfC+qStE98e5bydauSHWYNbM668GnpYKozoV?=
 =?us-ascii?Q?341gQexZP6JBCJNGByxjeDoGF85rt58nld+dXHAsEOwqd85a+i5KuFWRMUdI?=
 =?us-ascii?Q?C8rizFHU9M4/G8OczvQARxPz36Sjx8UjPlYr+JnWNxYisOqslAaYqCaFErwW?=
 =?us-ascii?Q?pQrGeqrPUG7wAzQrjxg+5pQ62Bw3FNbOvATsVWNpxqCFkpxNBgcCNPUQjG5I?=
 =?us-ascii?Q?nk+q3Y1M4OWcfmXP8qMzm9d42GMq2nx+WmoH626y1W/Lrb1VMd6dN4oMp3PX?=
 =?us-ascii?Q?uWMLvasL9ZAihwBEOFmiIzwBH0ZTbAMzNG/capqZwK4btSC6FPqU1j9pEEJR?=
 =?us-ascii?Q?tWMKjCkwu0ueN3Ais/G+DFXbQd68hUOccoVxpw1z0OHXLU/VB9/xE2dcVQlv?=
 =?us-ascii?Q?Q0O8v6aMbwb2UDbBELLnHszpnUIowdINXhN0mtBBKbWDC8CVcZIS9yZsSiqF?=
 =?us-ascii?Q?10qqH0NVhA7vNB6FYcwlCaLWy4ZLgBWWzQajgsVr/8I7RGlJpmVhprROeJKK?=
 =?us-ascii?Q?wcSvMOlar6ZvoUXIVqUiyFdNgH7a/weHa6iLrRfxBvcfy9XfqPmJwgAUIzBm?=
 =?us-ascii?Q?W+4QErmTkQJjk2k6mgjdf2Bd515Not1Wmp4eclfe59/3lQEo4r5NO9O/8jDc?=
 =?us-ascii?Q?lfdO4p4Yx6cQNo9vl8knZlbmCIyrbNdm0EZ2yRQZc7lD+k84RorQwvJJaG0b?=
 =?us-ascii?Q?lTv6FEm2+SrOLKpNXO/OiNhlqi7K1heVuWB6GY2ww3pFwCcu0zhZdrXoXWWy?=
 =?us-ascii?Q?ZHtUS2jH63kw14ZiAzYQG9N8VNcwjYtdj9xj1ldqa78oyw76qIaeIbS+WgBK?=
 =?us-ascii?Q?HWhdYFg/LcKkKhgd2ymO3YDFJ3Qb09sBpmn8xdk+N/Hce8u3E5xcTpJRMSsK?=
 =?us-ascii?Q?Lo4l8pAz2pv2Y0HX3VwugxChEjSJB30J6GI0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?59ccVjIR12E5ZjThzDGrhjrwU7X7mG6Bznw58APMtL8E2wjNn4Qr/Mvt//m+?=
 =?us-ascii?Q?oNHnapjfis9qIh97xz/UQjzRw5Fpdpg+bCn+cyl1dzh1Vep7TVFfksHj7D3x?=
 =?us-ascii?Q?bYRzqORcQLmsjZyAnPeQ2oAjQ/mEICDuPOUZok8Cw34Ah6skQE336FyPb5aO?=
 =?us-ascii?Q?ZOHA2TurT0qqAVPrmScU+ujXKN+822uFd5YnZsvQeeW1wO5fCdQwsEwPw+Hy?=
 =?us-ascii?Q?X+ifyCBJ3LTnztUAy8LqjSO+cYnibAUuC9r8s43gn5yWKap+5vysRK1x8eU6?=
 =?us-ascii?Q?5QDrA7f6u5bk4Bsf+ikZnA3aOdgVjSD1tlRi2VDWgUvC7VfCDgaLU+T/IIyJ?=
 =?us-ascii?Q?ff0c1OKcI7NqVmF6GpGg1uWNZjL1bq09JIe44Bh/WgZj/BYjaz+VJ6WX43MS?=
 =?us-ascii?Q?B1bOmfpFDwnKfudU+iaxP296LAJmSps5zA2WR13XtNgYU4N67mWDpz3R0pL+?=
 =?us-ascii?Q?xSE+eEBtu5bLNzYO9l7oWKwgsYSWxGKpoLEx8XuvucD3M6C7Q1NL7III4ce/?=
 =?us-ascii?Q?U/05IVjH0vt5r1ezDKYLCxh5F8uwtxyfD42CjLCynmbY4VYdKGD2sSkBD/dZ?=
 =?us-ascii?Q?yXxb2fZYJhoM8VbThDy6h/v0AZuNN67lsAoIBpOJs0oa85LI83p8a7ebXs2S?=
 =?us-ascii?Q?aOwVSJZtydGthrEygoGmEP2HcxXJp4S0Swch9iVNeit4/mDGqdeP1qdqDPq9?=
 =?us-ascii?Q?vHsOXkag03F8VY1U400yEzepYs0lQwznrN7TSS1Ks58hpQmpyPqN7GH8Uibv?=
 =?us-ascii?Q?1wqjVMor5jlNHbgNQsuZVsBuaxOTgFH+MSCWVM1x/57dmyBrqQvsd1ueysx+?=
 =?us-ascii?Q?0A/yeP4nJtOK9UqiXQuTD7bZtuRb6myKxlAvR1Yqlz3G+l61IyZAqaE1+V4N?=
 =?us-ascii?Q?R4ooQsadOhuDyrtIJiX+m+jUyxxPS6mf8buK0S6/iQ9Cpnz1rDtGRizqOrBN?=
 =?us-ascii?Q?7hnmG51z/CxjRhZExn11RQA/r9+e1EbdrrvMJtdRXnNNIxr0ZQsp6fLqw9rU?=
 =?us-ascii?Q?HkOBD/2cmRA9SsLVx/k7vcdPcKvSl8PFY1LiB2me5FWHB+dQrLziUigeu3fV?=
 =?us-ascii?Q?kZF9G+2PoUEhIirglzeCFh5mZqP3p6CbV+6lKyAroIVHugCf1ndQ6J99zSuL?=
 =?us-ascii?Q?FEFOKBr0NnIc+x8YNFi2P4+HcfDR5XCaTcQIYgUfXUw/4D9G+kxUHcEOCkse?=
 =?us-ascii?Q?Eo3Afkxuh2N73vrpcq4AA/gugXl8hhRh7732dnD2ZQw4eY/y08ovzGHnt4TX?=
 =?us-ascii?Q?jU6pIvTn99XvSg+3AnWKEjFGm5gVLtF3GQDjXnP8K4JEeaBPS+ptfADkIbFO?=
 =?us-ascii?Q?kOoRV0Yy5TnJ/TTebyKDe14EL1BSq2Mqbs+hffAszVrFcgK8A3ono9GPZ9GG?=
 =?us-ascii?Q?QEYviRLh5x0wC1ekCceEzAOEyj2p7gOqWBeuv0E/IMTIgT6RZA9jCZ8dnohP?=
 =?us-ascii?Q?+56WuL7SCOqZqq0GYmTxi7jsCNh3fgxa/4UR5pc7dYsFciCnxchRSRHDf2M6?=
 =?us-ascii?Q?xM2x8lU9nKWNCP9s4mK86L+OVVvDkBJOJARrs5KiR2kJyWGrObS3QkNP47Ar?=
 =?us-ascii?Q?UUu2QPngcIMsBQL8lAaKugJoGpHs+//YGYpFdMjndgH6O0bmJ5KtevqU/Sxf?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39d4dad-ce33-4d7a-51b5-08de3e1e6480
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:15:39.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqgH+2yeo191aoDiU+VJ25nTSSOW/ld4Srwcl3L4EQgP0rQCzb0AClYz5M/IMgnJSbunfPWBiCjFJOUUyNeq4RqiaDCcvH5pv/3omKF50l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4MyBTYWx0ZWRfX/W8/4FiEITr7
 80NCeN7kvcLRsJSUQk7cmF09UHqVWmqkPDSQz5tG8r3K27ZMMrMDH3Ue47hdOvI/u/auP95riPy
 rt6jUoObfeYMoTUIvynDyaANvl148vjEZUwaVERMwBD+5GIyO/FANhs8UFEOtZdXEcHIbrgdG56
 nPhdcNFZyC3RHL1gMzUHCRQZunlNWtWVW+jzlRCc5TKt2SQweZHyRd7axH+JlK6eNQGusAaJmpZ
 fdhZTD3aQED15yRN/Ljxo4yXqLdJ1IoXTqH1GktQZ7SWWJbCCGiBm3/tzQDvkYmWqRAUdKaxm33
 P9jwU91BbuCwvyDbmpoavGBfwJ2uUIOhEafM0t6V1fUlXrllxnEbxkXsb2Ym5Gow0QJHzX7R194
 CC2vaeMzZztZRt+5HNG8A2naLu1vsA==
X-Proofpoint-ORIG-GUID: JZJK0GA6lLzCxaA7WfBu4q-hx0lAEQ7Q
X-Proofpoint-GUID: JZJK0GA6lLzCxaA7WfBu4q-hx0lAEQ7Q
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6943d44d cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=eUBKwln-REtu_DbdvHUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 10:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228107

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.47) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit a warning when an older host
debugfs is detected. The warning is shown once per run and does not
alter execution.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 scripts/lib/wic/engine.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 565a0db38a..28a973f6c4 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -220,6 +220,42 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+_DEBUGFS_WARNED = False
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 47, 0)):
+    global _DEBUGFS_VERSION, _DEBUGFS_WARNED
+
+    if _DEBUGFS_WARNED:
+        return
+
+    # Detect version once
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    # Compare and warn once
+    if ver is not None and ver < min_ver:
+        logger.warning(
+            "debugfs %s detected (< 1.47): Directory copies into ext* partitions "
+            "via scripted debugfs (-f) may be unreliable. Consider using a newer "
+            "debugfs, for example via a native sysroot from a newer SDK.",
+            ".".join(map(str, ver)) if ver else "unknown"
+        )
+
+    _DEBUGFS_WARNED = True
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -334,6 +370,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []
-- 
2.25.1


