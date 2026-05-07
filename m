Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59823CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 06:20:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5971.1778134830564108717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 23:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=caWGp5Sa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9587885fd3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6476Gsp43914167
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 23:20:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Q1ReEw/u6
	GMnpoog4tOQAzbtTUXD6GVbSjeIinI3P6M=; b=caWGp5SaTKbh3ZdJxNYFyOULW
	7L7g59qAgHv4lRylOLpJqj1JE+OvOXE56w4S8xXT8VC0z3kUMPDVLM2PYpLVAzCy
	6L7lYgqlIk3Inq6pv0ul7zgPg0HTEPQED2Q5fxYEnepopNcDObYGZsJ3IXQoZw7e
	9hHgIHsmAKaHN7SW9Rv2KGNwbfDpXUAYCmR8riYwR40oHMMPV2Di/H1DFzLnbeCl
	vFl7FHNZzukHXHfG0p5vWgMmiYuyKZtG8WKJikmxaxLgCNou34R12efeDm/1l2B/
	N4UwSTtY94Gz1DPqd7KV82++MLlV0e3WtwI+AVO93uqsvF3JlMuEp/Jxf2Lpw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddsuy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 23:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXYrp2epoJT3uVNAekpJRyzS3tdMMEPNtT46ai4g/4+ATr26D9fqhkkTZqNHFBC/6K8PTIonUWPWo1oNDbBsm6/EsMGmqBCPBExNgBqyAUc6h5IpdYI1S17xmhhZsPHxP4wF/2KwPcuRcar8HhhXfbUKZcKIGQwgQm6SQPyS1k3nxwL8jHeMzDi9ZYRwHU8Zm0Fj/lgO1afVVQqQ+swncsBVLNxXmyUof90XVbNob488O+rT302p8Zdi+yY/wicOrGKuUSru7ojmDJk7RN/CzPP6pigmyFjqnqknq30wUcWb9/rNo678ajJCm4Rx2/6armnzA1fewAVtM7OecY6YZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1ReEw/u6GMnpoog4tOQAzbtTUXD6GVbSjeIinI3P6M=;
 b=EqVkRpUvAlst/0e4Kb5nLt9S5KhG0qNGeR4sCWgpRYtV/bgMPv9tE7Qri2GEwsvnPC+IdxwOZiLKFrh6X/OYFeGiDPUwNWhqtTD/b5C9tVa5uZSWrdv7uBW0Od4Xde1/Busa8zPz/LfVX2jIZ+YfEeI8HKDmuA6GJKi7vPQVkJa4b+wVqMZ2mqNGkp9J+U4oX37jnTBdSs1dLmTKQKzdm5z93pjoVFF6MkGZgSB0o96SEyqLV+8gu4vV7edvPD/mF4qJOyEW1PXGI7vrZ9IY2peOV2m5DKeBaibCU0XMi1Opx2ai0pkGtDxR4dsC2vrcnq2PymMgAmRu8HDfvSVPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:20:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:20:26 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V2 1/4] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Thu,  7 May 2026 14:20:07 +0800
Message-Id: <20260507062010.1461027-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9a7f17-e54d-4d24-dcb6-08deac00babc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	W451IpbzhQmL6TIE3SaVG9fLdWXBb5n1C88N8sGXaoAeMYPRLXvF83ML6Qx/4k9xmJSO3wo1CQkbHecgepegrv09/cnnDNY6E83kzvrZ9Fv4CyXxFmqtJb/nPtaiyea/Z+jJVbURyHtDWDOR4e6bAtwwFp1bpKPJzjcx+zyTi+K3tMq5VTQWAgtiOpO8OvO250xqAoD3A7rqsFzLgXOzdmuEQfjGx+hY6yKbk5oUCWoxW4syToh3URuGLMFy3NzjyiwpkUg0oennbhjjRcX/Um8rHFhqnbfuX7at/C2kbM7/oNNZZ7Gp8VqNYxCxNsKaEykuNyrrad1gkQTqxWExY7ENNWu7XzaDNwmeLPGE2DdmGIpinvQiLi2hsC41gMtLL2UgDngPDSyzXtFKoojCj9nThrBlhnNgAAxJM499Qv1fJfjTuBTG3KsmuYo+cUwjtBkLkN2ICRxsjkL+4jBzGfZyqpJnb0gU04BWbj1ENK5HY4vSOYX7WNWAO0QXnR986ETMrQu5bRBlfLE8szfjzWidQByQNfSEOnY7ABIkLky/bgCwc/gHXjn3CiOZKQ6NCr4/asDZj1VQiA642OKjYBYpbq2bTvFmA3OYmu21puoOZ00BkyFW+CiUVNIWwn8adPWeBTQXxDtSdt4GlvJvHlpRLPrbGbm06zeJN9HvawiNPXn2Q4KaJUAUhVbVgRH1jt4GRJSeT+pk/dgDtMUmoa+PC9SGUHWfeDA4/ICRsveEmrp6iVSXqpl8WL2CHoUx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4HZNB/Doo4N49XK5uzyfjz+tB1g5/jLzValoUodP0aWlrcuuZ3BLLgktgQ+J?=
 =?us-ascii?Q?1xJNurSeFGEJscBe/+CbnfEvsnW2EC4ImDELi8c+3aEhCNSOHB1fnAof+ei3?=
 =?us-ascii?Q?UDyg4ZxFEnhlXdz0/+SBv6GQ9ij9aetQn0D/rO2cz0mYJDfVay23dMeypItc?=
 =?us-ascii?Q?jJ/y4Bz9RIyw4qmj6QIapTngEaxPjp9zyrnfUN8NuAnE321PEEZtEr3xhbeR?=
 =?us-ascii?Q?vqB60biEXS68ppP8LEyeS8V3Niu0lfz9zBL8nuSbZ6Z/QO1Fi0PJOTqBbEu4?=
 =?us-ascii?Q?HP94nKOZ+06dZBVc+pYp6RJ8vRuWjJ9kQMEzZy3IJx8EFnyO7hBc6yWU126Y?=
 =?us-ascii?Q?i0aVVLOahSBPyBBt950WnTopyAxIbbJ475DvOJv3kpKeIL5Mh6nrCea9zTuP?=
 =?us-ascii?Q?xL2CCIoMUWhrTEkc4cw1TaLXSjkun/p6UCwSHt/QAQ4b+gW0SvrJe9km30iJ?=
 =?us-ascii?Q?XolN7CbheKfEH3STL73sKy/Wu44uaXBcnT6NjGgBH1TbtzNUpJPNnfvWgh1w?=
 =?us-ascii?Q?TrCD0WbFu6h/7AhHZOZhJNYNgr7Xr84qmqLUkC6VQ2BIhgruAe3MenH6Of+o?=
 =?us-ascii?Q?4lrOSmOTQ0saAvD4t6Fcirp7lmrZJYakk/0+aTy/tr+ssdbDT3RO3NvX+hYQ?=
 =?us-ascii?Q?81OG0anDf2FMlXvubfGfaBJuoPHhIRYFZHS9Ren7F8S4Ui0uCyVaZBhuacjF?=
 =?us-ascii?Q?vmdqQ3Lx0xmSXUwxPEG56CYcSs8Jssu5AtwlpdfUhnIp7mURHRT1CqdBw7t2?=
 =?us-ascii?Q?eAywTew32rQI7y6TkjvbiiqaFug97eZqO9omjMWRFht8g/TKZbmCBXnb7I2f?=
 =?us-ascii?Q?R1Vo4L3yH128pYZuxTEhLIQ3nS+d9w7USBGQHme9hUti5YNHr9bPOhLZ6yfX?=
 =?us-ascii?Q?oxRfyz+u2iXU9Sb3BSB6CPGfdli/V4ZJrQlJeQx96N6wc7xGaPH9YoTSCuZT?=
 =?us-ascii?Q?6pIl2EaSpthldNTe/fMb/TundlOl6m4HlcIir9O7ibJepXJeS8yhxCFoMjWf?=
 =?us-ascii?Q?7EIm7vmA93o/0A1SQTt5N3v1GWTe8YSBo459D+AFpLV0glG6VKZUnGUVYpYN?=
 =?us-ascii?Q?T48aMkULEXW/fvxQhslGKk7+JQxE/vR4N1pMU+mZiTyIpegzAqQdfYXcSRyQ?=
 =?us-ascii?Q?dBXAhMUl15CVTMd04SG/B76Dh7Yy1Ob4YTMqdBp09OIP3UAQdxdnrYeSz3Xi?=
 =?us-ascii?Q?e0eoXFOLNE9xDLWq8mb+4Hr0v+xlo096g3FPGIXUpAnzV7XxVGSSkVmOmF44?=
 =?us-ascii?Q?2qfpWGS65KlCm7mTRli55egJT7JbInR4AVOzFUrgKs3lIei9eVzarg/PA5ZU?=
 =?us-ascii?Q?C8O0HPsbZB142aO2yqAnu8u94Cee+0avp7bwxaWLtZHgB7U734DJrCsdh26L?=
 =?us-ascii?Q?TDYDVYg48M8T9uTjcvfu9/z3rmqDX+svwEW/rjQkZHJUlyDzUl3I5l9M7Itw?=
 =?us-ascii?Q?iSs1xC3BDyarvS2C+zlSBY+0Ros57wnzHU6jfSQ00klYHzMNFzxvf0DuPkb7?=
 =?us-ascii?Q?YKQkU7hEVWi7zvF9+gNSBCuBw3orkA68kKkIvlfcGhhNA2k5L4Rb4KnIegsf?=
 =?us-ascii?Q?d2uOJVGj/ABQHpLY0W1jtreUlhk6TgOtc2h0upJ01wYI6kTNE+U5g1eMusIX?=
 =?us-ascii?Q?K5HFgSFBHTzyIo8DmD7KVrd6Glom+DYZ1Oan2UjLKrzLxWAuDJR0o6kx3TDU?=
 =?us-ascii?Q?QEuEOordG2uj7baWqv28X5KFxPEyCUl7xeRJsQeQoQhu+AjnBpAYCmxUDPpu?=
 =?us-ascii?Q?POirt4xFug=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	gUUIBzLgZZMoKbFyqaNSao5VvhtdJKmMNHnqctPMdNFsR2MX7fy8mfftl4L8yUpf6VBPdh7K8MQUqm7w9w2Wly2QXfZJMMHBPotwOOCnMUL2wvESxzPDFSBz2DTaIK8RGaPXdjmYBtkR68ToiEVvouC3iJB++8JCSiUKKU0WtvCWXJCvMUJjwu1tH9r8026E+tZodneZb51imt3ubdQua9VZ9cDnGQSbJOLzzC2eLwHBL8FYu56AGsrUU9tw2Y0ZPOaHl+Dd0HwCSLhe7MyrcR7naRh75Q6zqPAddpKaJJ+7TvDdI0Ea3SW3upqw5jiD0iXNPZy/iA+xv+B9pHyrxw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9a7f17-e54d-4d24-dcb6-08deac00babc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:20:26.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qlHyYV9H6AsuzV4ssLK+jDESs5OJUFYG1Se0t9hrSLJo+8ckpktGOXrRCAdP3cw4qgCcUDounB/B8xYK5GRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i2hCF-K1pb5NPHimlvziQRitVozfn7n0
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc2f2e cx=c_pps
 a=n8wvYzHE7/phCzIUoQmMUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=f88G9R6p74ok_6XowtAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: R8H9FxJHoib9lxFX_wlFKSqdU7fpSpLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1OCBTYWx0ZWRfXwcmtYjj3utwf
 TRf6WptqbwMcnTkMPHV4ZIkHCexfKizUeqXylHHwTz6cVikgb7dYDR8Smfxe9xAnuhUDRLC0h95
 nyr+WbXxoFttfoSl7v+Q8k/i9f6kin+Ln2HXkuIm2XgsBLGhGhjy0KcJ1UY27N6IFRxPlZKSd1A
 oPvOE+8xLmeJP+Xj/zsM4b0Jj49M/No1fm9v3AqlxYmBmK18p32O8su3GKWq3vz+yFSjWVY6RQT
 yq8Mniurt3FTFFAdl1ZaxncH+BBmgRA/iICVfpAl/zqlt9EoCKoQfimRZqL7PUouOkkZD75og+8
 6ZzcjlSKfQX8MEP3Twtr9JfZhNaD0RLJ+U2Z2kAbBKXZTPFRATpr2KhxuxLA8wAz1lQOwbBKe0r
 iMXnyRfuDzE84oL1IEyK2CveQ5qMfQhfUlH4OL3CNV6atZYilQ3mSkbZkbty50hvHsx5awGJPmE
 PbGYz2sKu/OQxvZvSqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 06:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236561

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set, we give
it a reasonable default value, which means if a version consists of
at least three parts, the bump in last one is considered as a stable
upgrade. If a version consists of less then three parts, we'd be
conservative to treat any bump as a non-stable upgrade (e.g., strace,
coreutils).

Recipes such as kmod and systemd have versions consisting of less
than three parts. So they'll need to set UPSTREAM_STABLE_RELEASE_REGEX
in meta data.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..3fc427fa5e 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,19 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Recipe not setting UPSTREAM_STABLE_RELEASE_REGEX, give it some reasonable default.
+                    if len(ru['current_version'].split('.')) >= 3:
+                        stable_release_regex = '%s\.\d' % '\.'.join(ru['current_version'].split('.')[:-1])
+                        pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                    else:
+                        pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1106,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1131,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1147,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1194,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


