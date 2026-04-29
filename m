Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823A9FF886F
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 03:20:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3810.1777432826447944202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 20:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l+0/uduO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95795ebc5b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T29cwt1267983
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 03:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Aqc0l1t0f
	ivW5evNkJ/q7Jxm+fUhi7nXYmVb/rfWqlk=; b=l+0/uduO6aZj1qeswYtiq0Xpo
	GQGTTfQNT3ATs7uPCGIiCkr9EZqn8Br/9gdoslpwFxUto6SHFIglVkcNEmrvAZb5
	GsX4iNHHtie7rqbrk8t/VydwVgY95mwaL20wCrB/tkJNBtBGl72j7lruMZLAG7Et
	vXNyzA0pMr1D2A5/nXcv0htZX10oWsBbFo2NdTPoD+34rrp/XEjo8aOLsnqUbSg1
	P3WafgCtHk85/Yxac+xO2QWjJmpFmF1V+dGoERqPcB39+UOqOdGgGm2hnJ8nokJs
	o94RZQeY/mQIZK/n/qxHPnF6U23dldTcNSkAcEdigAZC9OxY17MXftSqmHRgg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6vcnr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 03:20:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzcCL9S2DuY0aFYK64vwOZJBnr5o7qZqr8VwG7GlpOFz54T8ZYk7jhIHxYa2WlMpsFfRSzkGH99vgGpIR8mYgSskYUSsA4ixbBI/41xb3ACxm7YscjmBxWCcKFOVXEJdJg2FUC/NCMKI6fc3UVjs1odiUTjtPwcG71+8GohA5tHWqLWzBCdq7KfHk41sJxVjfnY4m/uk0Hkvn77wyn4tIQx3yhCfSfFzWIrl/NMQiLE+p9ncZczjHJeJkcJJ5MPWSk1jYqkQaGukEltFguqsua4yBVRoXZqhqcsIbL9OVBRcVG7Pg6oKz1+180rOqLbPmXaBx2L0n80M/hQ1y3JjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqc0l1t0fivW5evNkJ/q7Jxm+fUhi7nXYmVb/rfWqlk=;
 b=fkk4Fh1G8tFI4u1BFkindlxmZr8C6OMWqsy0nMrkcQM+CuGBDQLFV/JDdiMYGim73ZtSjk0lvzxLgJszFLVrxsD1jJECgDlDmuRrNoBId8eoy6Ch7ztyIOUKIbGvq4W/t05NDve3HuCWTKcyj7a3r+4ak7KMrm8h0kByjq/Iqqpm8+CTZEftpreLvzJIZ3EoX0j52P2wai2frcjnaqHxm8MQOlSJfKVUjHJMHdlSXvv9q62OZoJ4HK7Ytw3nXTlV69EGI8AqzH1WBW7oOFa0ueHULMijjuIkpxk82pnEQKi1zG829dpA/xHpw8HFqbi6fiDubM82ExgoCeB0Tvby1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.18; Wed, 29 Apr 2026 03:20:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 03:20:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alex.kanavin@gmail.com
Subject: [OE-core][RFC][PATCH] recipeutils.py: add optional same_major_version parameter to get_recipe_upgrade_status
Date: Wed, 29 Apr 2026 11:19:58 +0800
Message-Id: <20260429031958.1075182-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: be17b4d3-55cb-44b0-e17d-08dea59e3fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Io13uk5ki9jA7JZKCMTKEObPIY5lHn/YrzHQXL9XgS7MasrEbJvZ45Az52T8iVhscyo8tnCfB+lyTkYVpAoQEz14ReZgrEMdiytIFDzuFdZKeHy+vgYwQpF3DuKug3Q9wmEam/UmkmdZPFLJq03MDYtvn6OUVBTA/hOrsqEqF1PXWUgEl3maznBYM0jlRNLxXI/VE4ea6UvEI69mPv4VPcq3W+tukSm5ClZmbd16z/QgZiMvthcCmq/FBNI1uJJtukbOd+EiyA6nQDB9QSkFrsIiIidD6x77umq/RPlJhFaUELby/YnbOfQ/jKDgh//kXp6lCU3OmWx0jm0hMXkypFvpRx5Prn4zlJboedBzHcwlMSd2Tvinbl/nNqqL932XpHU1GeMih8SfJibsoi4Pqhy7Fji1LU3ePHTcU7pY1VyT6EiiUd3E2r8pyLSeyGeqemrEQaCJoLwk7QX+08cSNud8qsdM5LsQlEeonVVeDHF2DOl17eMWRkMxVoK2o2JUx1Ipt7MkxxeRqabSclkgjGRM0bZLRRwDNCe8RQXzuVgIvC2oETJZO8gMfF5uhFPB0IF1D1d5RtRE01tdkQCn9WxYDN4KayEAD91pFmVozhC7HN3pbKXu4nqy45wyNbLmcLCkc3Pcxnt2SD3/vgfRWBc1nc2R6hd3e+aXJwO5d9RYyUSamDplFg2n0yzZvmpj4/ynqsQYT2tDyzZt+Us6MZ8oXf0sTSocC/7fGODHqdMQV38IY9kfa/C9fXeV72ogjbRAJI/V3Nwx8DN329RVi2F9pQqn9179NnZTD12AfRs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5IvNbJQZ31vN8CSy/RU8GHe5uD+gTiLxljkn9BcpZAbEh9CRtUjdvThqIHtM?=
 =?us-ascii?Q?g+sIU6y2pwRKf1bB1rWKFOhYZwCJxnNb4FGmI3gXmjKLrMK4UdgEaWdceWLs?=
 =?us-ascii?Q?UkK0SR61gl940+w11TkVtV5RV/aluSBfxj+cLNBOUAAWAYwY6x1rNhSjSkA2?=
 =?us-ascii?Q?PY+vwj/321y19ATpZS3u7dj+Joj1OGfp6p8Em1dVtlm9UEwvuqUqTDRy1PeC?=
 =?us-ascii?Q?pz/wiESV8vGrE7TdLJhT5A/p9yQ0BuFiSOJU8Q5CFdO87+R6F3maKQlTbvG7?=
 =?us-ascii?Q?ltI8j6tUPhIWvqN6/YElNRum4rjBVOPRIeATmJsAPiiuxzvU/yyayPCD0wD+?=
 =?us-ascii?Q?13G6CursGP53P+yWVRrB/1ypetWPxn7OQKQJh1fwkWjoCPI4kyo2i1CPH3Bd?=
 =?us-ascii?Q?RXubE+tVRrXoGDE0EKcwyMN3Nkac3g5mvEAPSMsyr+waXNjOUi3bB/t6O4dQ?=
 =?us-ascii?Q?l+jWXh0hk7Nq9b5U+REyhTrnuzsvn5f+5XJWpCfAgxARLsxJToVSB433xDIy?=
 =?us-ascii?Q?uWodE2WZsuH2KWYlj5Br1xoOJYHgUIZnFdN7jSmTp6HRXw7GIOIpLHEzdOG6?=
 =?us-ascii?Q?o88GpHw07H1lUb9mT4wrMfq8UJESpNrRgDn9VJct0nAACUWkEF8xQPcoul+t?=
 =?us-ascii?Q?ERQL6MGTTjbxWwahRl/wpU67xLP/iSuYP7bxobX38qZnEoReZctM8Pmkd0TZ?=
 =?us-ascii?Q?BNR8X70oq9r++aXPwIlVqWoUllL/DOO3zahQhGH2XBssVuz35ckA9GMxY7lF?=
 =?us-ascii?Q?mY9Iq4d09H7wlHrQHmXLlCNTwtYZ0+eVBwmhfSgESwjoCdy1gpEQu0NExUDG?=
 =?us-ascii?Q?CaXIKeDI8/qk8ncvGCYhueL1bnfeYCTzE/HRxHDXi0CAOMvZjXRhks5FffkR?=
 =?us-ascii?Q?pghuCnkKp8ORJ/rMBbSoma9wRvigf+fad8WDjWyzL1P0+BbA3du9tSY3HG9Y?=
 =?us-ascii?Q?G6rBSjIF3d1bzmfuA0G7Z5+2Xrm4RD4YVaAaoaOellVJAiwBq8Bq2RZUwceX?=
 =?us-ascii?Q?4ZQLfotYEpwvSVcu0E8UXE8e6O/6JgCkXoVuozZvlC3pSnT++SirVGfQASWj?=
 =?us-ascii?Q?Pchl2oguQR7lupzqJonA+F4s0gVD0BlQ3exiUUC2f7Y+XfgyJ9u6Y7gjdI94?=
 =?us-ascii?Q?J0bXawueFVLb1qTbfTRMTZpl60O4hxmHtlW/ytv3XpZUa6gdY2Ynp5Y57blN?=
 =?us-ascii?Q?3pdhwRnTo70yHBXoDeETqADqJLxQOplamHaZOrMEsWMMyO5Sdgf//ugIJrLr?=
 =?us-ascii?Q?Pw8sYpaxIqF1EQ/DvMHyLG6iTwvMCdBJ0YA4AvQdojA/BC5cVLBARLqscxnr?=
 =?us-ascii?Q?3ehIZ6Xjo5utjql4VZ8GnjKmL3TBSSxFFk8jsgAKn0t7+3zOzIIT9gsJWhQY?=
 =?us-ascii?Q?GTgyqHIVUvtnAVhJFcQaoFS/QaaQKK0tXR3N05ksJAlGkTxWg7bnSCQZrqMJ?=
 =?us-ascii?Q?/sBAu4WFynqu+XSKXPrsUI81eF/i2vUy3MDC15IpPbEFSg0sVocpuG/KfeKe?=
 =?us-ascii?Q?lGsscuxIAA8MjV2KFihJLqbtLNVavVZdmhqAqgW6uTlzC1IKadNJXKiEfQaO?=
 =?us-ascii?Q?05bNrbwRru0ET4Zr4vvXSjykuXK2p+q8+0NpO+hFtQdod4QlZn3sMo0kNCLZ?=
 =?us-ascii?Q?H0gfdDjyN4OnXALscS3o82wjN3IQd2q8V8w8i3VKyYwbtd/mUJMCqxKIYb/9?=
 =?us-ascii?Q?nad03N7ecjlCRhn2Xqi2djvG14ahmw7DhpSObZQe3EXDEN5PL0IiiN0aHhct?=
 =?us-ascii?Q?KM2wfljXHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	hqdKDwf2bN9iL8TxfsYq3uy+83n49cNiRcZ1TEI+7vHvkMQQj/wyaXP3ai+23RneMwcQYDGWlBUhk4H3999p2Jt4TSWgGYk3wz7hZ3f815ZNGPtKBMD9oT4LiEZOvDSrbyRHXdq5U49vVHZ3YLJGQZi0brLuoZ+j+z+Je5CswJwiSwEKut3PeGj5TBL0hJ8IuUIDE7fgQmLTocEcAUfetj+8+elDVZem7ztMptnK8UmflT7FesnoAGQ06Eay/nPtu1ZTZAAh9W4pyE+UDINS8wvJ+TrQmLp46RApxCMnx2kaSbsfF2o8KbmSiy6TUTyBIIjuY8gE634tf/h/LWq54w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be17b4d3-55cb-44b0-e17d-08dea59e3fe1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 03:20:23.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74xso2FJdrdKyTB4KeEAiRzMwKbVvPygT0XphcuK83Z1voY+bPJr5osAkbQ3kWIbEhHNGC5P74pO0mtNs8SBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: AdnbGPsTjuA4_RzMq5NWHCJuQzJFF7FK
X-Proofpoint-GUID: 22Mz9eJr3GE30pWHVhFVkfYdscPnLhid
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69f178f9 cx=c_pps
 a=B8vmKHXld1RnS6EAYjBvXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=9yvo8pdFzNs4Kck5P0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAyOCBTYWx0ZWRfX6uFpNfdiBI51
 faq1GDABcuVp2mRQYxngL7N42XNxQnUID43AeGgoqDPlTECJmmFVaR1N6MjHWSBOB5K/BSK1vXG
 gbLdbQabwy/AM8Zz3oXeIxluve2kDoyOOyGdmT/5XBhPxAj6sJs9TpzlCU4/onkJZCSoPFxC4/b
 c3gMv+20DqBvL1eIuLIM2G6KpdXWRIUh+Dyev6fqSXYGBn+u0ZHjxiUi7XwYwfSXFiByP94Fa+3
 ziino5p2Y+S6CKfpWGYhHqpCqXDaIXp6DVzaKn+/J69eiAbChI4S0//a7alGKEMAVKLFqWSqBOv
 IadyzEqp1uaj8Q10Jq8Nx0Hgj/9hYmJ73VkOJNTRkd1hW1GaJlofqx/tRnUeCk2RWHLR/RdATR0
 mcaRTpFAAEfUXqtNSFP7/hm8DozxWcRCYJ7pHB9EHj5JRB2iaJUfMKTjXAMLDeI8j0esYCMYriP
 mPfxhhUyIIBsxA90xNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 03:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236076

From: Chen Qi <Qi.Chen@windriver.com>

We want have the ability to do LTS package upgrades. So we need to
add an optional same_major_version parameter to get_recipe_upgrade_status.
When enabled, the version with the same major version will be reported.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..495ca40133 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,11 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_major_version(pv):
+    major_version = '.'.join(pv.split('.')[:-1])
+    return major_version
+
+def get_recipe_upstream_version(rd, same_major_version=False):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1084,10 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if same_major_version:
+                pupver = ud.method.latest_versionstring(ud, rd, major_version=get_major_version(ru['current_version']))
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1101,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, same_major_version):
+    uv = get_recipe_upstream_version(data, same_major_version=same_major_version)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1126,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, same_major_version=False):
     pkgs_list = []
     data_copy_list = []
+    mv_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1180,12 +1188,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            mv_copy_list.append(same_major_version)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, mv_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


