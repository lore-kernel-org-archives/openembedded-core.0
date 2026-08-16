Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEB9C5DF7A
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19455.1786921886888304392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hw8RNBgl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMikgS722970
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=; b=
	Hw8RNBglfITv958NBgpPkRa3n32a2dSFzyE4+5bSu2X8wXENZUlBmuiZ4psE1k+h
	zg39Dzl4huv/h9bZALqS0PtTwBqEz3r7rrtiUWuaDvjyUp9pRIW2MpZn5i8X/GT7
	zWL57qygJfLRhujP1z3cTVF7MCZp08maX0nEUXkj0oZRdlH0z3LlCnL33sYQGusf
	DG8LkCJjC+/kJ+qyMo9Qp8/uC2xvsacntnwniXGPp6DPOEzhhEaNhVTYAX+j6xOA
	lpdbE/kYnwtVSOTj8DPxNQbTiStbC6atV7ns35432ihyuTTQzPkcvrhNC0qkYFbb
	oa2E1WMXq48YqxmMQfV5Rw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023104.outbound.protection.outlook.com [40.107.201.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ss4t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSno4GqocP4wmvWo7+9xF8PDdS5FxlZ+Ct5W13b4GtIF+f0uReeL0N6yPwHdY1s0hxM2+YRv3bV9ovdC9chBYK9MLbiALaQqXcwg5xCth/QCwMTiqT3B+ADJoB5EtxhHgP+V2ffKk326nbyuy4vTJ0bwGcmNwFj1ohTxFrWbnJLgvw/WIhZalVdqH3vaeSac99ZVGEwTZ/ltp7JeJRd6uidwDXjek+YJOA9/MlFcGOZrlQGTV1+ibuhBRe0KuaISN9ET5KBYexYeKFhMZMVfYC9UnDdZByQe2ZOnhLBtGBuS14PYDj4RmfhXbwf5zj8aVi0dIqTMQDYQEuyIHjnavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=;
 b=QX7+5doeaB7h1w86md81AuMCWlymYSemc8twb/Sua/4ZWJ+sq5lWzCDGVHbsFFze2CHaEVC2AwEe07E+hOd7tftYyfDZAAfgN78UoaEVxNEXeYZDoqt9tY37WqW6cYyI6p+bBO37qSKvSh1v60Mfdo4p/xidoPDAPF2Dx//1R9i8lnklAe0Fm/hnpdtTRV2PgU/v8xDOyOGv+RZ6yB+XzSdrUEMOHOeEfgQgl1fhaJmkKj4A56IaY0OczK3DB0E6424459/TVDPckn3/+MD2m389zVxU5bWrq4GSPVTCMf7MhWG/vMJZVYLgbBnEuyA/HwGSZVz1rdm2nMwG/IX0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:23 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:23 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 04/12] lib/oe/package.py: Don't redirect stderr
Date: Sun, 16 Aug 2026 16:10:56 -0700
Message-ID: <20260816231104.3871015-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 83195384-5a67-4392-c8c8-08defbebb085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lnQuqTcYcZ6DPCUr6o7fHDoqNRNv8h+XJhcyMqksRFQPsNX+qyFk1xp5WiUi2YPDZkm0oBgveA3gpP2lNZyaMWocjlevKhjosgn6AaRZnntl+uVOfRM1AvA5Efu0pcPr3jcy7k6FYinkgjuyfdRDx054+CdHuSLLdV55UFBQAE2Bi57YNqwDBQz1rPhLt+RgWkLEsYPz/WaDJXt/GMFrvHkRdptm5QpZ/f6r3QyDVAbE5yH1ssHUwTQNWls2A0txCkvwxa3wmz9M1cyvCvRymU2eZzWFyaoEYywGm4dR/rvn6SsinSICzQY75KoaKUazGSw6F/9ElcHGh6Gs/j4veT5r17fXTpIENp3gTVPYcUB3ckuVxRRYGvViRoxtFa+DjxJxfowpQFfrdk3de6aIXQihAQUlUAwckeXlTTjwloi1aPOySdi7qpLe0hZ6vy7n2zUQeWPburtOu9jgoCV8iF0Y9UO8nSylnfsyQnzRR7mh+bxD1JAu1pxbVL9fDidnySfdU0uVLBcohHgLa8X/kXMF/AB8lNA73GbPMP2heziFSISKL9s8c5KP1EPNVN9f3R6KCYk/+6Ppl8bCEE4LyevH6RWPwTWDj5k3bEYWfx+BxnlvhUgcZN5IwN3j2ZHDvePGPhf9LJCAsxdPx+/MiTMdV4fIh1M7jCS0jmjrWfuzzLoxMs+JkpZBhJFfeEVQSmoKUMaS3erYvf29HaOylJ3orG7N2/qtXrzKLcT7CFs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RZjYz+OsFPUgnwg5PuVD41q36PoFLzOoDitfjX9uSYJiCsqR9QC2TBQ1BC8I?=
 =?us-ascii?Q?2nH1PJ1yIwfNrNjnVwBYNvLBKM2qmEvpIJTXEDLyCY6Dsfg3ueV9vB1zOwqm?=
 =?us-ascii?Q?oudszGMeWr/j7xKPnuZ82jo+vwpsE2acWG/irao6DA4OfeZD6nVLyuTZdBkP?=
 =?us-ascii?Q?rM9gcLr94TlGoYLWO2k5bfow6IKbyNXnr+cUhioU3l0ae/vorU6x65LAzz52?=
 =?us-ascii?Q?mqVIOIDSykb/JmatjUSlyEUk1x158oX1UZEG2H3O1VcrBmgNftrRvssY6aVk?=
 =?us-ascii?Q?4muEClRggAwCuy7TmkSzMDs1nqhBHnZ8RjuxZBFANXio8SWYWvA9PVrSyX7C?=
 =?us-ascii?Q?dNCgSQPf0FeIk8QZQPZFnbS00sVN9xcZKqHskqBpQpY+DXu/S/D3qU8UfBFK?=
 =?us-ascii?Q?53GHZaVCsQgXDbiOIG5zqthHhNcet34QjkfFS6H9k+j5Wh95fZf7ek8d4mPn?=
 =?us-ascii?Q?Gy9tC02I6aUw0h9W7X1dgN1FjC+NUe4ZWP48yiIQw2AIzr1sWpJQygAXJGd0?=
 =?us-ascii?Q?2p2ULSSqdGbBlC9vRDyRi3u0EiMya6ssHuQv46fk/1yeF7+or7oiFCyBCTfU?=
 =?us-ascii?Q?UJzuXl5Lzo8UYa8sy8yl5t8USTSdjcwIOZzUdW8nIVyGbGqESfI1O36KB7Xm?=
 =?us-ascii?Q?xKE3bDRkXg0OUsHCsrrNgAI6GyTOKLgitP52/L1YkipN6byrGm/H/EDQHXej?=
 =?us-ascii?Q?NhW1NJJ9oUhfJ2lXl/OHQ7A9eNavF0mrbcbAsVrt3qkZ1cfW72rb00SoBZvR?=
 =?us-ascii?Q?RiFKfZjrKp2T2DmyfYvnZ7/k6o11QYMLcZ0JlcWZvJ8BbVWawQz4S28BTb0V?=
 =?us-ascii?Q?XOMREopqPclcSbLD1X0biCKpJzT6HDHWXKiYr58PqU9aC7mUPw9Mltoy561e?=
 =?us-ascii?Q?h1GGsNVf5gqFIMlaJ4cCtbMVqxJ9s8VuSudbCJquZyF77a5Cyb5eHOhDAt9h?=
 =?us-ascii?Q?Q4o3Qsa3rDbk/aCLJzhBEqoTQBc3z+gH4vd60BRxxgTyBTq0p30v2glD8jpi?=
 =?us-ascii?Q?1r97brImgkTMFQS1LuoskuNKVzNG5hL1j29CiVYjW31wgySeswjd6ouW37+r?=
 =?us-ascii?Q?mShVOUBNqeFxMTLJnz8mVUDK0oxCTjPsDkTNPTsKQjMma+y+C7pOiqH7tGW4?=
 =?us-ascii?Q?CtV03P2DqwOX/vUQ8Sw304LYJuK3+nI4dCefjxS9OnPyk32qdxy9wbxDw0PB?=
 =?us-ascii?Q?43GTs4enLbp5xCKhO6imCg2FqcxWGhwsAufXilNlNu67C0B99wHa/JPT1m0c?=
 =?us-ascii?Q?+augH6tG7RQnU7EkSQkX3BTnlOOmui6jI2vUc47LpilEVwULc0JI1W+qty1S?=
 =?us-ascii?Q?UXj+m7G8E3Jy8cmIYg0GAxVTXD+30Y+SRNE53tYjpuWWcHMN5XSCe9gFl3Kz?=
 =?us-ascii?Q?GiMGIsTDXr3PrJLzN67laJaySBnfCllqJcMaOkK84+L8/dgsj/JLb5713CLh?=
 =?us-ascii?Q?p0i541rXtii0l30zw758bjbdOi+5iR4f7NBx0XWTT2hIIRhrOVI3NJ2lm35m?=
 =?us-ascii?Q?SCndqi9lXc2EkwCI0sFwLLl64aPrME+0eCHpaSYnvT/JOcQ8CGWClOeWtn2l?=
 =?us-ascii?Q?hEM1cJCr6LhYO9LDEnncC46pm2MSW0ei7NULSRK8oU84NnELBezLAbm0Nm+7?=
 =?us-ascii?Q?1wb6+mZaLJFU9fR9pmc8UthPJBF3QEd6hF8WvIZxTnfCcgrl4bfmDBQnEgR7?=
 =?us-ascii?Q?VPRkj6WCkpgAQnn3Q4BE48J7v6A0anJQ4M/sK8NhZhC1RKiwocFaOyGLLOCw?=
 =?us-ascii?Q?nFm4rsbF2UR3KnyFTB3rfErSJdfFgWs=3D?=
X-Exchange-RoutingPolicyChecked: 
	WMfxAFvRXRAbpaLPRg/uo/O0/d7VBeMM7KRnu0EZYor5lGhm4bh3d+Z8L9IXAJBov6r64zp2bZUcO6C9DZ1tx9bwb9u9EARtxmntZ8Cv8VLUXbfyCr6MWlJXlDoWAjALrsd5JOcYJEAZkO2tjyDCumczdQU02Md1tvffeunaDg/hohmT7cHjD7l5O8v7UsCluHZfErYYuVaBwavFH1TKKYVryOPfvZLBpUw55+PinSKYJ1cOFMMi+/rAdHbChfRlR2DjS+gsOEqw2FOR9TZGM2RY8sOu+eXtrxXAviB/ha9rGh9qan5XtUP3mJPBjjz6Q1GMbJL95Fu5EoeneS4l2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83195384-5a67-4392-c8c8-08defbebb085
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:23.3154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g50mIVlX/d3aj5nb7zlw4mwo9s8B3G5lVQ4xdywOXGLPOc/eqCDBXuYml3r00LUZwZw/BPG3WCAbvZuds5rKu3SYsRPZCcbHClcBQRvMhII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfXxhoGT1FLW0xa
 fGMNvPX7JZAMIo+ehwWxE8S9E62Z7V+FFsWkric47Lpsq+RKi2gPv05EUaYo8e4p5Q1ZjuhgdLE
 iDLRpY0Ycjvx+L1zq2dkwWZEVsoP1NuCWg3roGZtX+rtWiwyxxR+W8WV6C5Qi8sCSWRNz6qg5uc
 95VXSeZ3yi2/x2sY9i+DeB1p0QOkqH3MhO1PDLem2zOohFrnJ2hvWJOniNBBO5QxevXLBP2ahbA
 SKak0LgtNQw6pOgoc0vCYYks+V7UO6cuG/V3/O9w7VhhwFgzj3NUJDAl9s0/LgWVpR6ftixikLn
 ymJ1nZME7mNjaoWpsXonFk1Vaxzm8dxf+MI3cdobgDgjCDL9jev27r0AbJM98b20RRq3xMUSaGH
 Sy0qNWS6O9hVp7NgmC7q+mw4o6e0KtMMOUm6F/JozVbzshYBdQliX9vOXZZ+Btzb+d/XJ2ogI2S
 3RvCPMA4MlHDqKahwTg==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a82439d cx=c_pps
 a=0aASrZ1Sr5nz2ag1/hSaPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QxWemH26AEmWQ4BDCQ05FrFmhkBEAAJ0
X-Proofpoint-GUID: UDUuWIzK82wWTtHm4pbXjmBZh_fPmDEm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX3/4AdyszTNWE
 t7R2nc8ZM+LoPyfSAHJtk3V+lAohTl/rhIEVYVK8AbmZMIGgmp7G4p/VR6+QkOsM6yzMm+wfH7G
 DVp2GIu5EIRxswAGZBSAEoSlKG05mCReQnL7c+OBLa1aBvKac7y4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243570

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d8862ae92d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

