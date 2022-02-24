Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317FAC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:27:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11750.1645716452149876502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GDvISBQZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9054b88637=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21ODBtbT022185
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HDAorzqhYh9oi+IeZ7TI5t/oIqqY0QoITQx+6UQ/nNU=;
 b=GDvISBQZl6xew6viI+wE2DapfoZFzX0DLHxal/y182c0fHSSGxcXuh3yRBLgThI1SRwM
 AceRtrzExad6jpuNSlK4BG71Wp7OnjjlX1YZpuzb0pTIWmic8hIj8v5xc3iHhC7zpIYB
 V2FBn7DvRU4XAzVDvQXRajRuXpIviOyBtHgWvzXi73ss1nb2+dEY2g79ITxxTn0bD8hh
 K5NGqfAt2RxlZo3icmUM/P13bxVvPEkF7AnRYFR2I5q7ENRKZOBMNxRv/oqxm+YATQVo
 NbzcDWuEjIZ2ee2ne1mkZbvU6P/BiPbSqgA7mPhHKcxhiFdpHboLnPRgpfxEXG6n3wG6 ig==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ee069rk5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 15:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0UkRJ6Cfubugp7Q+agAmj0pT62zlThjiy//yb6hTRFyv9+rpljykEhx1OH+ilhr/fhuUHQBRCpzMENqJhksg4+CisGy2x40zbTRncc3I/75VkVcjnX1+ij7ErhEiY3ugdHQzgYYdmL72VSKwiNqvPmkWzynbnOcUeISruLKPTp3Qg0QZ95syouVXn0SZShc6jfdhaJh3N0HcnBJ7GQAeUvPGbKGQDsNyR529RrpK7HWOKpYQmkLSbiAECz6qJ21aETl2atq2CuN5pzI0nSWwP6GqjSC5GlHL58bplMD1ABKU7UGqJfCbKSZ0VUi69dHd6sVXoTpADjmBfoe7uRT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDAorzqhYh9oi+IeZ7TI5t/oIqqY0QoITQx+6UQ/nNU=;
 b=aDEonHn3mg6NzCyfh4DlwSMD5l9XnUsx4lE/KOxs0Bs5DdGWdxpB1+Q1w5xs3pQ+oAGudNfZYPrA3QMi3AmBlPPymeC74JQsiyJF/e8c2QEOttkhT0v4anTdSYbElIktUBl6nrs0WioSNXkc9Ynq8PzXv/qwCfWL0CO657R4uIMD4JOpQ0UbIBtnkfoGJZe3m2BKPteicvLzhOjiaq88qPwlPaOhOGAI1re3sfGrH27k7rzGCyQr8HdybHHdL8uAYUr2BD/+es10yc7jvFrqv7Wvc7tSmbvG+D3ocZqc9TiOu1cWnxp8O8lG2UzRFrOaaAntvxPL7qa2laXCbHh7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 15:27:28 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 15:27:28 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] license.py: rename variables
Date: Thu, 24 Feb 2022 07:26:59 -0800
Message-Id: <20220224152659.134461-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c49d465b-48f4-4b3f-6e9a-08d9f7aa2ad5
X-MS-TrafficTypeDiagnostic: DM4PR11MB5456:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5456F90EB35E742CFC7D405EEE3D9@DM4PR11MB5456.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CLaiMmIllhIkXmP3YllnzUe2VFu94Cu9FcemEsCi178n5BZtdP1wOLgU5cKBnrzOXTySyUwqnb43FadFjzUESU+LBPXJdVSGLArIshLfGk9YGYhdGQDDw5j4p6nDfmiJveFZxPrP0E/3v+T+UXqeql94l1Ubj/7YZ6jzpGwbj297YCvh1yiQzJGQpfpUdBWeKxZQhCp0vhp9Y4NuNNnreOYulV7HOGL3ztnZLFNz/kSJWWo5PYACsuE1JtUdArwug7SVSPGQy3fwqXgkxMjmwnE71WYXybI5GUtlt/Kx9YkZZsC856Oc85dy3YxlptW3offkYyeuD1LhD3J28PWfhy1XqLCJ9LHKdbKz6hzd1v/SuOdMMoOceZoQGooY7mRTEICIGDo2yV3cukYDH7fNnKmDVqxQo1Z+bi+33lojImzxaisWqpeE8trSsHbnpzxuvfapb89ZE7DaTUteh88SqhwXjxTRWZQ5a7tirqWq4fT8r7TRobwfU4DLs7N/tQb4I13Rgd1w+SNDn3TM75wSgpu0lRmF7yDVxT7B/XMlGIh+jVqj3Ueq1f0jaGxwWkSlTc752Iuxxosi17vWiqqJZglOiBLaZ4Urni9K+egGBsOu0zbk8PrnvmmMBUVgcBdNd7ZghtDIXzPq9OfmwhXUUFFNJ6U5fSQxnF+/Q60rem3bquVRvmove7FP1+MvROyS0PYqOxNPjFTYnkVphcBm/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6486002)(4326008)(8676002)(6506007)(1076003)(316002)(44832011)(52116002)(2616005)(107886003)(2906002)(8936002)(38350700002)(38100700002)(6512007)(6666004)(508600001)(5660300002)(86362001)(186003)(26005)(6916009)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PR9pCJYpePFtxaa9oLevOHNDSykAa94UYabwDHpI2UiOIN+VGK7SfhFjcBps?=
 =?us-ascii?Q?ACvm8/iqgO3Q+jNLphiE2bjXM9np4YQuJT6u0dgDr9gDN5m2Fpbo5W/guuPs?=
 =?us-ascii?Q?yC86ICLZJndOElyFJ2pZ9z5i+Fo952UlO0QPeOQmhSrfSHf7dlNN+cigDoC3?=
 =?us-ascii?Q?h9GAX2Zkgcb3V4qRNF9vmPcP4IgPw1nhJbv50RcKmH1PVjkuOoKtd6DrgNYc?=
 =?us-ascii?Q?QVO/vSoWY8LxPapGNrK+AttziJkY7wI/llWdqqyRCneyopyvp4So729IWbHW?=
 =?us-ascii?Q?RbAXDYS1OuN+UKJlshYdYP7RKN9TFBA+cGN3+1WV6Z+N6rFcBfU/lEoa1znI?=
 =?us-ascii?Q?SX882PDj7ZvnK5N1GKpzHWYvzLbez0ea02UMRsphCkjv+D7/lRgSKs4jr5LQ?=
 =?us-ascii?Q?UEevXdsZYp24GLFWpXjPXJ3U85fOQFN8Nkxbx4pwoC4P92i5fr/rZbFwMa2U?=
 =?us-ascii?Q?K3UvfKB9GAumdABXIMRUUAAQ6fMhgyvy5RIQkvjoPt8iR8jlhf+Kji/ttoyJ?=
 =?us-ascii?Q?CVdFB2nDgFdWUy29KYOTo1vOBwYdg07LUxQcwtS3bgfygssHhTFaq6r+hwWN?=
 =?us-ascii?Q?Pqxg+OV/jJ1BkKEA6/R5Y8bbMd/CpIBwQ5kkTJ51I6Fe7v0/LEVU8M0TXCR6?=
 =?us-ascii?Q?1aSAAPSxYWeAnbL1Mw2RLS84YUzLjDSXGHRqPL4/q58DX2EjoUAuORfzEncK?=
 =?us-ascii?Q?YQL8rBNLCzJai8m06mMN9JG+X8PL9jgVlBaRVa7RJF+W9+sw/7sLy0bFJs4k?=
 =?us-ascii?Q?OCXUGIosiB7fBJynf0+5fkXKdFRTUzSUN/VdIEGLRE3q9uFgemPmRdR9cOCj?=
 =?us-ascii?Q?79klZqZr6ZyvCHvjZGDJOEoOylgkJFu/zYXQQZ2HV4uAtlJbgeIiVPy7blZs?=
 =?us-ascii?Q?ekG/mXZL1xz3zLxj+SWrpWEyxzSzEy/FeGBoTCjSiVx8ukUtDyndk/XbQx9a?=
 =?us-ascii?Q?qc8R1V5x+pkwk93q4EJTJV0dTg9vMNBBK400OZLraGb3kz5UjrAPnpfrOivu?=
 =?us-ascii?Q?PMuOGYGWiKgwW3wl1Ck767cGxsTxXQESgNotyOjMSH7Iv2577KQDMgJDeirl?=
 =?us-ascii?Q?Yqy5aqiTV6Cw4XRw6UgO6xFkNPsWSUikVviEXbdgobrzMOW5amGSQgfhTmA/?=
 =?us-ascii?Q?WzE6ax2eYBQT3JRMjpHFeSsgegY1T+9xkPMkZeaQBLtBqgYCWHD4BOK58tXA?=
 =?us-ascii?Q?xndXBq+J09u3mgcd+B4ZZrd7796U0gnr6cgr+pU9itgcdnMg1Fz6wk8sNnoq?=
 =?us-ascii?Q?4k1KX6SHdID+nf86eNWpV/nZcjHC3gsdubYgN48L4+PImIV7WAA2DSFjZ9cZ?=
 =?us-ascii?Q?9m+iSDt3SaIQCQVtLqbDCXiCJfwvFLr5B3AvyvAfDVxOb5OhII8dQ/V2rHOW?=
 =?us-ascii?Q?MSvyrB0XEl0P60uCtg6lvvuUy3UEPYfuoo5tI+xzFPprMszp8r/tcdYSzk6B?=
 =?us-ascii?Q?M9VHNn54l52tM6b3pgdoYfyS/X1FGTtIO3HpyA1d/YUQMMLxdDtAE3dZGxXN?=
 =?us-ascii?Q?hAQBH91WnDlfqaw3xYIilC8ITZkCQ5zKG7vaJ2aPRToxqUQcbJBFWxNqebrA?=
 =?us-ascii?Q?gTe8Fm4BsP3AKNQ7E/MQR6axYBL4TdhFZQ4n7dUuQkIgq6XQfDU8KO8zbNex?=
 =?us-ascii?Q?+3mkdg6wO6ckyZyhYsxCW7s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c49d465b-48f4-4b3f-6e9a-08d9f7aa2ad5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 15:27:28.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jaP4ZbWVU0wu9+d8JmhtwgoVDcTQxhWy2HKped7guathfausSsWnDedzR+Q4ulIz7JpZaSbkcjTKPLnD6sKHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5456
X-Proofpoint-ORIG-GUID: EnTv8MhWqpXbBurzYgudgOPkG4-Qv5Px
X-Proofpoint-GUID: EnTv8MhWqpXbBurzYgudgOPkG4-Qv5Px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_03,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162323

Update the comment to reflect new variable names

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oe/license.py | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index b5d378a549b..4cd382b4fd7 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -99,20 +99,22 @@ def flattened_licenses(licensestr, choose_licenses):
         raise LicenseSyntaxError(licensestr, exc)
     return flatten.licenses
 
-def is_included(licensestr, whitelist=None, blacklist=None):
-    """Given a license string and whitelist and blacklist, determine if the
-    license string matches the whitelist and does not match the blacklist.
-
-    Returns a tuple holding the boolean state and a list of the applicable
-    licenses that were excluded if state is False, or the licenses that were
-    included if the state is True.
+def is_included(licensestr, include=None, exclude=None):
+    """Given a license string and include list and exclude list,
+        determine if the license string matches the an included
+        license and does dont match an excluded license.
+
+        Returns a tuple holding the boolean state and a list of
+        the applicable licenses that were excluded if state is
+        False, or the licenses that were included if the state
+        is True.
     """
 
     def include_license(license):
-        return any(fnmatch(license, pattern) for pattern in whitelist)
+        return any(fnmatch(license, pattern) for pattern in include)
 
     def exclude_license(license):
-        return any(fnmatch(license, pattern) for pattern in blacklist)
+        return any(fnmatch(license, pattern) for pattern in exclude)
 
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
@@ -131,11 +133,11 @@ def is_included(licensestr, whitelist=None, blacklist=None):
         else:
             return beta
 
-    if not whitelist:
-        whitelist = ['*']
+    if not include:
+        include = ['*']
 
-    if not blacklist:
-        blacklist = []
+    if not exclude:
+        exclude = []
 
     licenses = flattened_licenses(licensestr, choose_licenses)
     excluded = [lic for lic in licenses if exclude_license(lic)]
-- 
2.31.1


