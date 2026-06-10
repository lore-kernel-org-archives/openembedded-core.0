Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ECCCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:20:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15403.1781079605231549993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 01:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jhz5oew9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06216acf1d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7jSaU522031
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 01:20:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rmpcJb08++3wUXxgosuviTak4AM0snkHlEx+mdqEuuE=; b=Jhz5oew9GTKY
	xVDMiqBAjuM9u1VBMdzTFDqrS6A1Pi20+LibnN2yldWqPD0x6y+DZQao5m4MSfkJ
	Oxd3ZmU/U1tqvwC262Ewjy5sgtwu1jOXdcL9pvEbqc/I9fi4w0DDdWbZbg3NNv9s
	5LGbBZqi8DYtGGM1pWx4p+QTsmEvrRxCBfMkjZC13F3d1zkBF8jcxgl/rMy7+y0D
	IIakTKU0WZKM5XZS3u3nX7ZpKesEMQpBCxcXPTTp6k5I119Kn5PlbU+O23qWmYF2
	4wvTuJWalaudzUvsx60K3gHjlgRHBwaCaDNtWlTx4am1UNjAxURaf/oZ+DT8JK69
	ryQ3SQ2WpA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwkb0bje-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 01:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhwDxvDZWzPJr5QvGF6OIsYcHkrUlo4mWRWvFgoudvUJuPZmefp94dWTjgYEmybJyxz6UgJ8jDXTx6VwVbUw25/EFPr6uRUVVns1YKpoND/8WhNrhvSk9iAgJi/NPIlaSqgMI6/fbG7INICZg5knHE7kPl4wSV2KOjBh8p0KGNN8wWnSTCAg4z81Aiu8PlbBoaDSs3C9oNcv6/UE0W9RrHyu0wr4z6cy2pIwCUIFJVgwrpXTsMX+lbrwhZMOiNAFwt4yYfqwoDmJYMHvAOs5lRIf/kW/YYKozWAa+s/0aWhlbgkWWOpBLQ8BQ5NiFvWo9QGAQgdqmatO9uaRIvZ/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmpcJb08++3wUXxgosuviTak4AM0snkHlEx+mdqEuuE=;
 b=nJhXIBHwmx/xMSkUBWKEvJFeajM8/zSivFibZOD94RRjcJmweB2vEyN5fWzQvI5+fTsQumXm6AKpu69O6MKIO37z/2QEZUQUTwXSANLM7kZDV8Mtq8XygGS/0mNlwjVU0sN6bPeKqez3clU0n0gM8bALLZGDgWLaGeZ/KmHXf01KY/vfKNru+ZnEOBOz/VyF3QWVqYws7j0H8PapxEYz+MS3XFWS6jEVBZY0MR4X22bv16OnxEsIvVgukEZvTI3zdxCZLDS1GsXFH+Ry/tJWJaKzFC160OHN14YD0jzi6Nf4aS0aznVcZH6nWtle0RpqoHoe3vbAwSY7F9vszMNyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 08:20:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 08:20:01 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] diffstat: upgrade 1.68 -> 1.69
Date: Wed, 10 Jun 2026 16:19:44 +0800
Message-Id: <20260610081944.3886484-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <936DE046-F202-4C73-A1F3-3A2FEC8E89F4@arm.com>
References: <936DE046-F202-4C73-A1F3-3A2FEC8E89F4@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d8c1d-788b-4a19-cd6b-08dec6c91088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	VGwgt/cTdQ2LEdtEExjj5lFkPrlO/hwXuzYNmHKN4W685s+PuWvpfv1w50+anZzcQmyvJ7kvFkrxVqMSlyXi16t5KExz5DEr54p5MNYGsP9VCojCRsuS/kDa7WJatfsoSLtWsBSn9woAGDw/Gnb65iT6dVKr/tg0N3fv/Wt+OBmYTMrjlWorCW6aXEs01rJAyF0UA+yfrJ2WLovxi47mR5tYdEUnlG6+P0djKXF3YHjU968TPASWy67r77yYcmRdDrm9IloNj4hCqnUGmHj9XN6z3jT3B911DpEdRuXkvXnJqAgJfiUMMARPNkmncF6P+1wLE9HPxSNu0tOGM2HBdAP7+cUZ8Gep6d/RME0faatR64QhXyYgZbt9dXvlLzImqIziaDRUFVOP/krvV9VUFI7n8IEd+6kKbbckgfRdQIwozyjLmU2z5CY4gZj6OrEoTyWiUeFC0EF4arWxBLQn7Lwck51CPlEWIKIQq+qHukrsFab37Tk28RGT7AHRqHR0OUoYdyl1WMqjXI6RROm7xnLs39N/8ol20MmJmSflion0v7WN4eD5zsGC0CbXxQRJfC16I+q59UrkhS4zBaIg9nyQIjxFpDiwtmGV8pCtJBLtzRNEeTcEoDGZH97EQYT5f0R+2ZnnmU5RqFCLlE+Vtt+Aey/THGuJHPblBJAfBS5l8tsw9Z2RcdKRjvJjvJiGlEEtg7+ePKMg0aALYXT3ElOb+xhGP+l+YpdpgvjvdpvivDnVgvSE9Inrz+KIrp0S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Ta801zT3sPHW7zJRLPf9bSZ/tiB4IvAdPt3DD2uls6fkUKq//XRAffupoW2?=
 =?us-ascii?Q?BfNoXatyk+B0WD8atevpHlxd4nCngGT7BJ0FdbvBqj/b120bYLm5IKD8GBDF?=
 =?us-ascii?Q?ZLUKzPA4IFECAEtYK/hZ1mnUqN8paVgzM+CnM1mVZPcedwpbprZZ9cSwqD/5?=
 =?us-ascii?Q?V6q3IehU3JiRBWUjduyuf44vkxinEee9B5ODyPCsTUo02a63UEzzdfPEZytj?=
 =?us-ascii?Q?Z/fVWd/IxJ8pi8B1gNWR3XpwOksMVrnAtYMpiySVMnqxDdFtoTDqIJh2VsBS?=
 =?us-ascii?Q?cHVu2vZJ+kB6Mb1mtwo0+Ue0HpP0yJvnoAaAF2wt5V7anaZtg+SzonSegt+z?=
 =?us-ascii?Q?nUjEu5PgpRldX9OMMhHHK3o0QKO4pNWJN3d7I9sCssP+np8JrbgVuBGmxomc?=
 =?us-ascii?Q?Y1MiqXnFBy8qNziks2yFd+p4fpMGpELuJs2y4gcUaxIxEGGqCoSlfKOUoAR1?=
 =?us-ascii?Q?lqbz6V006XtR7YX+jHQNDzkq7s2zwjyPuspVBH96m/W9yTXpjS3DV8yhjXwF?=
 =?us-ascii?Q?bQVBnFCCrLp1fASKKSEM96S6bmTNbVLt133CN3RYkc9eNbB/jXxukn3mS/gK?=
 =?us-ascii?Q?pN9u1wmVs5tKpgi+G5llIzpl+XSY84SzhA7inRITfSb/bDaSuEqjIoWTIlon?=
 =?us-ascii?Q?gktVDVGqtDH6fs+m03anuVoc6lq5b9KgeEEtW0UoLMch3sjPLWSZ5EFljfZ6?=
 =?us-ascii?Q?vOli03gd+W6Q0W0o6i5zxxPRox0QGV2/4BaOghFfNtvYqQyEvG+zgAAIpoXt?=
 =?us-ascii?Q?uftrbAOE1b0YNmL4R0qdtNFS9c89ZsQMeL3ygP5vO9TmC6/VmJhvY5Kqpkan?=
 =?us-ascii?Q?z48Wo99UOTAA40NH7rNDMq3X13EUbphtpizj90bQXfoSv+py7/kR2j3F5CDk?=
 =?us-ascii?Q?EC5XYoVr3qhOKhzvytV6BKnFZgThqbDG86UcUzma7siJpFSFleFIsSSc5tIb?=
 =?us-ascii?Q?EysQBiJrva40VdYomKSfzHe2Nd40AsJ3BcubaJbOWA+S4y9tD10006Ksb6D1?=
 =?us-ascii?Q?Yp8cOxcetU0U2OVFLsDbGtRRW4mkH8DFwmnkjydlUJh7w4KhOKE+Hqenjgft?=
 =?us-ascii?Q?ckpmqwIBNvMy+mNYptdgLoqlHWYWZU8t8Gn8wkjAnngqj4UM6Z/Z4M1BJ3EG?=
 =?us-ascii?Q?d6f4BeVDUJJaA4ruao811v8EQ+pZFogNRVK1pZlc+bOQUCKLMKXW1FB5zC2Z?=
 =?us-ascii?Q?cJexHJAUynd5Qdl6Qo7OkeG2x+27t1YF5MSvb9KwRRrsbYVNHJJnrxITOKkB?=
 =?us-ascii?Q?SOJ1JDsOdW/92WYAzOHvTe2k+YxKJ1PBEFAd4s1hrfryIhDSxYRNUoCGKnYm?=
 =?us-ascii?Q?7JKcz43rt7iSYt9g+NDX91M8ayGBjReK6rYzRM4mDHhrf6w6gbJqXM5RPQi7?=
 =?us-ascii?Q?cD/T2FQ+ws/2ANmj6CUxEGC+NjBmgbggLYAAqscjvahwRH7K8sjeH8uU7psq?=
 =?us-ascii?Q?/gBvJP+IQ9q4fYYIC8wG5kM9KLqwO2y4fEYVS4QJ9Sc/tt8yIC3/T7ahbh5V?=
 =?us-ascii?Q?W7AsrlvTumHtft+6XpgPwQq8KZ4N1ZBjuNu2l5YOGfG7RBcJ81Za4+nWN6iG?=
 =?us-ascii?Q?kBR1TuRcXN6CW/fsLPkshiJejx+Kd0ITGwjFWR45sBo64jOTH0Vp4E9iX+TF?=
 =?us-ascii?Q?l22ruu6A25//IpkkxHyRsYEa5JCxW4qEcevEfa39sIVdRddBgQ/LoI4N+PrU?=
 =?us-ascii?Q?UH+cj6LWfzmeQqz9hLFFG6EuZlmu0oK0GSpPKDeJKuuzqK+yZz0B+5l4mSHU?=
 =?us-ascii?Q?HfAnfBNNY9NAvUiPFpvkUrWIfEABMGE=3D?=
X-Exchange-RoutingPolicyChecked: 
	aVjno993z8bPsWDcKE/driBDMDsFRIVPeKHERG6mc6AapvmPl/IkcSgmKfERdPaMcwple0BQe5jm5cjyrg3xdgLCQFM4y5p4IMNQ4qJNX2X8rgWsJgIQ7hBSIrbXaHuRU4adnH2ZXuaixjSqj/xhHP3wOoe1zPUePkrQpJbl3aDcfRpYYYOAed+SAxbMVEt/AjbXqfBF1iw28DI/JxryDcGdm+9kHclDmg8dzsEcOaAPJzCw5SqXyyJyFH9dblLy7pEGCkz3Tuf4LLwpptIPqr+HeVbabt6uL6jROfDsNWvdr/ivCzRp6Lkw9dv6EPRv55XngdtObi4O5JV9y9U49g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d8c1d-788b-4a19-cd6b-08dec6c91088
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:20:00.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qmv8mxmoZBhj1O5nTxpxcRr91oJ+SKNTe0HPssTBOUMkOU7eyU7CEiMJQ0yZyhPOst/HpEk+hv/ofmPmv40HCSoOjGiIrxvDo4qLPsngDGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX0XkoPOJ07Bnx
 +v8GoH1J8O8aDfieeys6FCCEhveShg6wd23QTrlL2xJZOuhmg5JYmv2QpstTb9539ajfMq8v5CT
 OTgLKsskmZXQst6yiMAhZo6hHr/uS809oDmON23msv8hEO63RcuCahn4ZCPtnDo4IQjODMUn6Oz
 2jnq15uJ5Mn0ORE4lQrTPe28w6sI691ygCx+6meuOde90NiWHLNXnk8wifvWoBouOsuNB5wSF26
 /rdv+6Kqsq9eoBkewz/a+z+RhKyCDX5lBiFSPGsibwzWBrOFCyFb+LtczVAQIKtlVVTATTFcgDN
 hxdf7uDLRDDvgUmmUL//HzcX8ueHFqgrMAry/8E3USfwivZ6biRHKwNZnxzH+Ovuyq1TMdQOCkx
 5oULgS9O/gi5R400U493pQWhHfrB/3guztV34tBzPv9cq1ZGwrVvE4R9VeFLVOoF0DtdpCb2XJV
 MzTqbQnxBRtLnecCmTA==
X-Proofpoint-GUID: xIsfXDToTm3hujGXEvQmlpI84q84tjo1
X-Proofpoint-ORIG-GUID: xIsfXDToTm3hujGXEvQmlpI84q84tjo1
X-Authority-Analysis: v=2.4 cv=afhRWxot c=1 sm=1 tr=0 ts=6a291e34 cx=c_pps
 a=7U6MwrGrMRcsJNK5547h+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=HiWkEfo4AAAA:8
 a=goT8vtq0AAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=nXu1EPtd7J30qkmNoJ0A:9
 a=_QplDg0m8TGAdENQf2wZ:22 a=R2Ji3J8RlHp2PMwqXl91:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238321

License-Update:  License Year update

refresh standard-autoconf.patch based on 1.69

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../diffstat/diffstat/standard-autoconf.patch | 23 +++++++++++--------
 .../{diffstat_1.68.bb => diffstat_1.69.bb}    |  4 ++--
 2 files changed, 15 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.68.bb => diffstat_1.69.bb} (81%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
index b301c2d86d..9359fdcb25 100644
--- a/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
@@ -1,4 +1,4 @@
-From 0069056a23b39f53a05b89b2545a3a5ad1ff070a Mon Sep 17 00:00:00 2001
+From c6a700c79fcfba21b261cfa99e5e78ee3341c7ac Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 18 Mar 2026 11:27:24 +0000
 Subject: [PATCH] Use standard autoconf
@@ -11,10 +11,14 @@ form of AC_OUTPUT.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Refresh for version 1.69
+Fix configure.in:88: error: undefined or overquoted macro: AC_SETUP_DEFS
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  config_h.in  | 8 --------
- configure.in | 2 +-
- 2 files changed, 1 insertion(+), 9 deletions(-)
+ configure.in | 1 -
+ 2 files changed, 9 deletions(-)
  delete mode 100644 config_h.in
 
 diff --git a/config_h.in b/config_h.in
@@ -32,17 +36,16 @@ index ac8ff1d..0000000
 -
 -@DEFS@
 diff --git a/configure.in b/configure.in
-index cb641d4..7042800 100644
+index 24dfbb9..5da5d89 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -83,5 +83,6 @@ CF_WITH_MAN2HTML
- CF_DISABLE_LEAKS
+@@ -85,6 +85,5 @@ CF_DISABLE_LEAKS
  
  ###	output makefile and config.h
--AC_OUTPUT(makefile,,,cat)
-+AC_CONFIG_FILES([makefile])
-+AC_OUTPUT
+ AC_CONFIG_FILES([makefile])
+-AC_SETUP_DEFS([cat])
+ AC_OUTPUT
  CF_MAKE_DOCS(diffstat,1)
 -- 
-2.43.0
+2.53.0
 
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recipes-devtools/diffstat/diffstat_1.69.bb
similarity index 81%
rename from meta/recipes-devtools/diffstat/diffstat_1.68.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.69.bb
index ce1ba79c2d..0c62537e8c 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.69.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "X11"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=53d95e97e08db153daa45bfe4e4be37e"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -13,7 +13,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "89f9294a8ac74fcef6f1b9ac408f43ebedf8d208e3efe0b99b4acc16dc6582c7"
+SRC_URI[sha256sum] = "bb02464072f769dd9832fd999526734c90eb4d66fb56d5351540a750c88a77f6"
 
 inherit autotools gettext ptest
 
-- 
2.34.1


