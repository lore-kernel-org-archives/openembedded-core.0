Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F9DCD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 12:16:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78524.1781007411538157576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 05:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TwLmswOG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0620276590=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599tkrp2302501
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 05:16:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=8nTaGdBi51hmuUgGAk47
	XUBIUdI2LjHLHlESB7/zYOA=; b=TwLmswOGo3bNHs72GAMv50wT+/qUIiaCxIQ3
	vhpwAo2q686KphCj+GPggQMKbmY5gGwVGbr4JVK82D9zzGJ26iWUkPDwpErGX7nD
	2Xj+QPYq/bMDC2/UtD8M7J+rhAYcO5jMGbn57NqF81Kk45TiJFat5k2942O6fG8g
	0E4OkHLber0S0irqHpKKGNGJmq9tToWvGtOwHjMX4c/oFUP+03ihugd8I+igSbks
	UMpIDAJyVv58kOJRe8gpPVUq0ePECptV4D/tdQ/rXzUAM95QAP/erO/etRZhI41f
	ZgPndbx4wY4xKP5AgsE0on2qWVw1TxiZTELP5I9pO9ate2VCnQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emety4903-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 05:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAQZx5WkHJzk2FbEIyCp0uqScOpoRXhaH97xmGDtb6HHle6t0XcuWW0kGp8BXfCRLDrTlCC3G87DkQUo8UTy+mQ97YVHeg0oDkAG4UytKY/LtKBeOcGspGcGmpNnH+Z+qzn+WJZLRMh2gl0rutRMGeYSaot1bpvTskAyyNaYutzkdGXJEt5u0Bpe8gs19k+R3t00qKVs8ODFLvgbS9n4DMc1yoggqx1oxDktqBarSzFAQn18DqWUTevC9tvvXxREFMUqM1kqk8J9HbcaaKqEWHseswWcSpqiyRxAzaLijDIEWGUCionzCl4d+peZSdn0c5sMWChLZQrVUvEQiLC16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nTaGdBi51hmuUgGAk47XUBIUdI2LjHLHlESB7/zYOA=;
 b=wL5osp8PF9czg8leF3EJKXkF1UcRlzTuY2Hf+AKjpTUuRgkwlkVaFETwrhOjRQwgfn58IFnM9AWQiYpUxsho5y4Vg0L4D1wWDGLDYNI2up4VLVFa2T28+9JY8wDtiUSzbvh6s1LI1x1eM8i0oyF4ZmEOvjvkI4Xw1nzQCOppNC7GWB3Gyuo4orglOATBoZv25uACGlApOqlgCFl8Z/vuIkl2B1HnMh8bzZe5U1/HPp03jPgsD4KC2ejzVIDCdinRJ/v2I9KP8Wvxjk5VwLyWVcPl3lokahTiEu+xfWwihe81rX1CVsctnvJpJbtj/ArKxAaSLizfdozBqf5elZduhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 12:16:44 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 12:16:44 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] texinfo: add missing perl module runtime dependencies
Date: Tue,  9 Jun 2026 20:16:33 +0800
Message-ID: <20260609121633.3344000-1-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0123.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::12) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: a8354bc5-2dbb-4f1c-340e-08dec620f890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|3023799007|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	f62AJ9GBRrZXpf5D65bC+zji0DKOz/DKoUbDu5DDBNjlggRo4FADqi4OOPyeBtdhYMn04V9rdeAUfpaxq4gjmvpRqiCgAF4mgs4mnGeC7rrKbDJsAWDe4NVrlOVih2yFDbokaxn9G9R6WExPNGRARQNL27leMkNJtw/jnwIvEBuvBX62nh+Dm7TCne2e5hTLGqcIP030DlGmuzlwZgTq66bOvr4f8wSxM//CseSPCiqBHWJndOeg6mT6lhdHcKO3peEMpWl9h1cLzwaFVW3nCgU6ZULuTuBZVLmOW/XqAtTizyY+lBsrHOPKpceYC5CdNPaCZsiH1a8UgYQ2jYAYOCg6AA1BGpWNP34HZ/VeKRnsaMte0gfDVJKqFCFPHBS31llsPm9M9OSCtmOfVOy7MSrwzOdNIGO0hJdFTGqrgk59+TrmFC8JliwKrR0w/2IMUAN5J+/DJK077of8wutPQXFLCI0FLSgTVLn4DEpUvZBIUmBjYSYbAlw2bv273ZL22oZsacgvIx8nc2bsiu3JRz0fT/+5ui/hvbg774Xu2yh+92hQMRzP2PeWiu0aF76tQgRSeCvfYFfBVQtbgfzOjgifT9COl9CvVnYdzzTHjbdkLvvqaU0DBpH+7Gra8FhPcxizof95rWq/rGDxBv71tl80XyYVbNLuTPB5NSymDF5Kn6hHnrHr4h3ElzwbO2OMiaGUubB8czdE/E0RtcdiEjbZWVHF5d6O7HTphzTMt/viL18XZuhUOfLzQoopH0HU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5ilQF9ebKsMd8ogNm/VKV+D67nLhBmpnjxXwNxPof/uliQk4K1arl1w9VOi1?=
 =?us-ascii?Q?SnuM+7e7EQxFqytEVEouf2HZ4IGDpoRHu4lEGVNnjyASiFluPhLB96VJe/yq?=
 =?us-ascii?Q?ZBCpE7AqcRgt1IxtvWm/Ih7x577VdSezHd0FFSLwlFxXEvUtZ25k1mJBNPFF?=
 =?us-ascii?Q?rzq/gTyszGZhmLFH0veiOYfa0pN+bJ2B4vsGkQR3DNzR6+dQdaq8G0p/h5H6?=
 =?us-ascii?Q?frllSF3BnPuR+ejnrflkoBSujyEPjDPKO+E5uPhJUGo5akPcWOOaWlOoEz3G?=
 =?us-ascii?Q?7GDklToA4B29mPx046BffWEmwWgd2yYzhrsE9fNc/IQGuBl1mQfY8mNPM0kA?=
 =?us-ascii?Q?WX9K83aiC00S+op7xDHJ5RhE2XbPpdl4+TY1tcxyYbRy1zNDWj05S4n3e0me?=
 =?us-ascii?Q?OFVOJDhFUWhzmPNDd1tYPCn6DDknH/E85/fXYpIz4YG2lgaP82QnPPAFw3Gu?=
 =?us-ascii?Q?agBRNcZE6pWnKzv9BN72WoWoOkNsmNfqsT5/Y9cOikYmMAAz5lccE+AKEw6D?=
 =?us-ascii?Q?eLpS0INPY47ZMu7NgGHOOl4nX/yJcml/sHWBaJLwfkyCkdNArxmeqReC7aDs?=
 =?us-ascii?Q?/OxODyMN2+cK7TdQ/acaZpoLQOu7RNlYngR0OAhKmc2O91vCtIknKrTSZpuj?=
 =?us-ascii?Q?q149MND+P56V36v3QwNhBUzieTjaF3GdSDTdTpXdd76CDKBLZEtcO9ln/5yK?=
 =?us-ascii?Q?dG8ci82JhocF9ai93xMYJ/wMAMC9/gv2Vb6EpO5vcCMMbFxozULknw2ByrSU?=
 =?us-ascii?Q?nwPssBwW1G3J6L3dhUt4kjY2hTsoxMURG3/YW9vWgjCFTCsixBzzS6Z4hQ5q?=
 =?us-ascii?Q?KMQQZoKFvv81N7Do08VVb25McwnV3s2SdsjGyT1qqTlP0U/gs9IvCyqfQCIO?=
 =?us-ascii?Q?CC5OkkUkB1vny0aWQCKBcNTzrUF7PM6pJMZKSUCztWLa5/MnoZnWIZOgwtPO?=
 =?us-ascii?Q?pNZ5iPk3pQuK6FWBKA3lm1xZzUbBrd9PFpnUr8S4ejJDVkx5qvP4e6dId1Pk?=
 =?us-ascii?Q?tr3V2mHGtN5YRWJOCwj1rSeiqsqM1o83s3U/lDML87nhOj8B4wEuAf1ydkxp?=
 =?us-ascii?Q?CqPi/NORPUbDreEQHre/SDajcMsd6L4kpYBHJJrnAWfKmCBX+bQXgMoX4hQX?=
 =?us-ascii?Q?enA8HCo+6LR2ckqW1sssafLrX4Nid8dMV0YG/HP16pUQ4EGCN5mC2K5jBgaR?=
 =?us-ascii?Q?Zq1S2hLi1oZkt95XcVswoanVgdt3WHCCbiNH/gC+1g5YYvES2X9amd4IbYvM?=
 =?us-ascii?Q?gChm9Htnw1ULqUktKcM5/BRIvrdS/G2HnPVpoEOAT59Ml/3NX17j2opobUmi?=
 =?us-ascii?Q?tu2mw7vWRo9mv4eOxjEJyibIcd2ZrdSFEcgyvnSBpq0+EhGWiiuyPgaSFAsa?=
 =?us-ascii?Q?8APj2Crr2CDGkEXKy55hCl5ta/mxuZ0eSoXezJTFRQtUjA0/KGV4fBdqEm+C?=
 =?us-ascii?Q?bieDT4L7fOA+QjwGzpvTqrUoIVBHd+SiaibCtfOSO6CpXH+FNpgEUWqHkl/R?=
 =?us-ascii?Q?30H0H/sfzZBvRJ6FD8gdFVhDN0rk5djXHMRTb2kSAkYRNVrz9kuFCWDVT+Uj?=
 =?us-ascii?Q?DyaL6dQz/RlxVgdQczJJLkQNX7OCdpDHpHNRzQxh/XzArbghGxMLE4U9m89v?=
 =?us-ascii?Q?ktBU0skotTWoYdm7TELd0VeS6r8RLymNrzNmEtgjp0POoGRJF11ECypYjtaO?=
 =?us-ascii?Q?zaGsFFJkc7Im9l09p0lfScWM7HAFUPZ3z+EeTyoOzAY7endjSZNETDEYvAUn?=
 =?us-ascii?Q?pA3WP2EQgtzTyqkobAHqhgsV1mYvAZo=3D?=
X-Exchange-RoutingPolicyChecked: 
	kg5medzPnog6RkewcPILc6h+wV8KKSGrK+kQs3hTR+zGJXz9ZUDzow2y9aXN4u3uU0GXKqhAhi9H4B4c5EcE/mrwbdkw3etgxgtj1D1x6wQ/F+B5c8sd1TWPhjUU95NUzO+0GtfSgP1tQ3euqeE+ShGYSbP7kl+k6oid9Ao2B9JWNJymI9DmB6zQk9uuzow0NUQXstGh0OqAfF6yW1fdb88ohkjNcaU11sW5Vk65LpHGKEdptzW8je9vhpV08mbXuC856ZOcl/atzb6hMqVDIYl6lJw/eBL5RGPT8XPbIDH5ViIh/q6X85KuRykMxnrTtJI0kpASqi6nQ2Ees0pL5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8354bc5-2dbb-4f1c-340e-08dec620f890
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:16:44.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU/JPoOTCNaypyXKd+J/s7Xu0y71hGdPMAOVLsTQmPH1DeVpsTcblBPXLLLpN1Y4rXRqcsdlHiYco2y7M5t9nFFJHVxMfPH+jRyw03ONHQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
X-Proofpoint-ORIG-GUID: -KqijLFwBnSoKd6AbNkl8i_PRgBQeuro
X-Authority-Analysis: v=2.4 cv=VKjtWdPX c=1 sm=1 tr=0 ts=6a280432 cx=c_pps
 a=gjcLB77VbSPYcqvaeYBpgA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=8i6-b8GgAAAA:8 a=HoHU_dbhCaPAUUMhjs0A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAGLwFu5sp1jj7jejlXE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX2J0cOMyyMW5E
 unlHRdtNPlxjk5CXWqlFJy469jGBQLk+bF9m4BHZ2SsXq1YV58HaLhomh0PSiCglD+RghLRRtdX
 btAJyAaeEV9UaO2oplEBZJ1scc1T9KejHh1vaNjbXxQYYJM+k05ENC2DODESGW4T3BN0zvLNEQR
 vTcaBOhQiB2EPNWEFFCSLvBf/G5h0gqKSMM4HI6HG6f0CTiXwT5qatj77VuWwXibMgFODH7Yntz
 5VhcG8C2d3NiFUNhbvTv1wO+sMgv2FWHHSvL3t9mDjRAraCA/GcOC2tUTLBNUPVLkBztPHhh00J
 nIn6T5VCioE9/Pu+vkGju0jU9NAP4qYuOYcnfep4C6bZuXKYQPxhvIJqweVQadkCNiena34UWlm
 RNGkYnHVViLkTieP/51nYfMmgiCjlW2m8izD9j4hsXxQE2DVAiO1+YkyACMU9AcvRTPzJfJleFr
 TZ9jUkLXZvTOuTvOaCA==
X-Proofpoint-GUID: -KqijLFwBnSoKd6AbNkl8i_PRgBQeuro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 12:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238293

Some makeinfo commands like makeinfo --version, makeinfo --html fail on target
with errors like:Can't locate xxx.pm in @INC
This is because texinfo's texi2any requires several core Perl modules
that are split into separate packages in OE. Add the missing modules
to RDEPENDS so they are pulled into the image automatically.

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 2 ++
 meta/recipes-extended/texinfo/texinfo_7.3.bb              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index f97a28cab5..768a0383c5 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -37,6 +37,8 @@ DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl-module-threads \
     nativesdk-perl-module-warnings \
     nativesdk-perl-module-vars \
+    nativesdk-perl-module-locale \
+    nativesdk-perl-module-config \
 "
 
 DUMMYPROVIDES = "\
diff --git a/meta/recipes-extended/texinfo/texinfo_7.3.bb b/meta/recipes-extended/texinfo/texinfo_7.3.bb
index fae4e510b4..5d942464d4 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.3.bb
@@ -77,6 +77,10 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
 
 FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo ${datadir}/texi2any"
 RDEPENDS:${PN} = "perl"
+RDEPENDS:${PN} += "perl-module-if perl-module-utf8 perl-module-encode perl-module-encode-encoding perl-module-locale perl-module-integer \
+                   perl-module-file-spec perl-module-cwd perl-module-file-basename perl-module-getopt-long perl-module-posix perl-module-data-dumper \
+                   perl-module-storable perl-module-feature perl-module-unicode-normalize perl-module-charnames perl-module-unicore perl-module-file-copy \
+                   perl-module-file-glob"
 FILES:${PN}-doc = "${infodir}/texi* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
-- 
2.43.0


