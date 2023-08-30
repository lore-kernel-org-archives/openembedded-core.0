Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A499C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:22:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9310.1693383735839501179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bv+6s+bj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760630e6d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U8LHoj000788
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=o1wvwtJkzYEHbbeaW/
	hs2/gOCok5FIksjGsLPF5hza0=; b=Bv+6s+bjyq//QNEVBl9BNkiwt64f5cVxoK
	1VWX/qGoEGRRCbAWc65iImyGQGCYTQe6clsdIomsTNYtWqB8DvE//U2arnMdDLB+
	3yXQ89wyWLCPBYFSgw/TjqAD2Lh51cf/I61r8p3c1bgqieXe8cG37DjQqI8XPdMO
	NiJ2xDc+iJA/FpXASwXu8w6JcZ4ScWCpxsYo2lXcESZzEeeKfguSWP3Z1bSw9XQd
	EXerHD//pbST7ax0si93gobTuZzX0gbW+1TBcNd3Ao13LheEtv+o0KbswqEls7Rk
	oMGYbJROOKGfu3YAfM71wFo3xJ8fDRpA59mRZi5hAUxoEx8ZhQQA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c63g8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:22:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV5DoZ1nf0pC6PHizbumYnwJCpQpQwqZyfQe1rRHojxpht/Ewxex6lCTE8hKryoNZFLKVPx4gtFOGKRB54fVbwcfTqGGNKut9PLeW+e5W54gYfHfk4LKHh3Kork3QXbrJBflDgv70OeEnA2voesJ8ony1YWF9sbH6wD848FPXwLOurwCLFi9OIq6FmfjPtALuclirryQ4ed/0WcsNhUM8d7x9VEoJ9LHV0szfG2KUSrju5O/EAuNWIxed4ourDFlH1Y4ExuNqkCebw5CBY2oFLbJ0s4VQvvfEPF5jOn4fmC5been/ntYnoNCVohLW1iwfOV8lMOugwnOJjhIXM3saA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1wvwtJkzYEHbbeaW/hs2/gOCok5FIksjGsLPF5hza0=;
 b=dMmwOM4KdGH4dlRP5/MMcD2uvgVL1gihvwdBV6ovlMhZ2N6Y0+FJypePR3fWIn35xm3XOUOlpkpEsijolhv8oZWky+GMWp0AZjFlsYIfFYmGg64knRlp0oAd5EQgGkW3rDzZATIHc/fIPWGMY3FJhsYb4TlCnfl0c0ceae7r7NIHFLo9n7wfEP7ucYwL6hEjqUJwhEceK0qOibJrMKlIoDmaGyExqzSxSjFlPER1M7QUxhnxTInN7MkdHPvJW//z77QTyQqUgMLK0zT3xeCea/xW+aJVKiNRimyecsmicAZmqhXqroy1gnWO4DR6P9nvwXDyO7xrXVsaTr/Bo97JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6649.namprd11.prod.outlook.com (2603:10b6:510:1a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 08:22:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 08:22:12 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-depends-dot: improve '-w' behavior
Date: Wed, 30 Aug 2023 01:21:58 -0700
Message-Id: <20230830082158.1618931-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b28417f-e4c6-4b83-354a-08dba93235ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	//2m13o4n/V64Ocg8ISKuADXHtbZBYV73gdVTbo7vRb2xWwAxc3YXDiafrCFPPuUIyGx2+4W6HXsoyyn2mAXGEtFrWSHz1zNIPcySN945y9AoKolCxohX2wensTVLzbF5XD2VQk0DGiTEzZWboz0Y/7hMxNEK6bNNvvn2cyIlhxHnFdBXYruSR60ScbufLvolm+lw24YybF8BYLBYxgXTqkalThi4DbLMRltZE3JTVsltg8ZgRXVsJqyfEVzbkJzE9u7gZal6WXn/mLhYOUThZbzBklockigC0KJT0I8qbyg37aBKwkzPNyg11Hq7rg7SuMfvZHL2dcvQktmd4raPV5k53fpm29PYE560OJqU5z7sLvPGugZFh0knaiheIFNsaDT2PwOUfsghQz9tLB9lCpQSgqfZS4w9gutlNWXvSsomf5rHoPbmiYeq31lAaM2kkyYU5ADjd/qim/0/WT2x80dTArvql9ho1BwhB0OXDD0I6VReGGAKJerp5MhfN4P2/d6/sthxDILVe4ZHwfQ9DRstoV0mxY7TtNSAFJDPVCcwug1vyESiWaOAepAANAIaIc803B/vfrH94EIEVfdgt8X91i6StTWvXYYhqm4pUtUkxrsJ3CZJrrMhGcCAVpq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39850400004)(346002)(1800799009)(186009)(451199024)(83380400001)(5660300002)(2616005)(8936002)(41300700001)(8676002)(1076003)(26005)(9686003)(6486002)(52116002)(6506007)(6916009)(38100700002)(6512007)(316002)(6666004)(38350700002)(2906002)(66556008)(86362001)(66476007)(66946007)(36756003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z8UuZb/X/skIyyDd9Z4U9jbEEUTbUuE5lNnIUmaxQQAtn9aRf9SpGQkLr50k?=
 =?us-ascii?Q?deqhZlCj710Cu3V4RLLgsJ7ibXEdEkTzXc2NFcJjQY+WVfoLa0kAAUMskwfI?=
 =?us-ascii?Q?u1dwtle7buqq7q+DXbACc2AoXR5HPsMvolTfvQGJ1cCrZUfcO64O/3W5Y5Q3?=
 =?us-ascii?Q?1uL3GPZHg58CnN8/a6wHhRlhjPaz/UIRRUKq2y8pCnssEI72Ny1XOI9do3lu?=
 =?us-ascii?Q?wtxcN/jNlWv6FO7fXsPDpt7FHmWNsr00XooXbVjPwPmwT0RlmUCB9If36PVq?=
 =?us-ascii?Q?T80rIlyoi/E/50EU2NRo51tQWbcy3u8zf+jNAr03Rt5wnNXOvHCgC/Kx27EQ?=
 =?us-ascii?Q?utCU/0yhgiIXX2CcXq0m2NJjgfei5v6xsMrsttopIXfZzr32qd8rResTfSku?=
 =?us-ascii?Q?0v9zTgWMLlk0MnKnhmDd7zijFr4OpyMyDmT496UxVboI4B21KWGSwfdF4QnD?=
 =?us-ascii?Q?iUz9LXV2nDJT7ALzJ8cfKkmYx8JocS7K7Uoa5gTPwegmDVJFaBbdhrNU6Cwd?=
 =?us-ascii?Q?qwmi0tF6UkjCtN7Bqy1K3MGfnJRdZPDBsfBiOt0PvkS4xRqWNWb0bOwPI1x8?=
 =?us-ascii?Q?LZ4OcjakTZ/OQ/6PiIQdY4gwi3pFnrBP6+GseJMEEjHpqy1U72DQq3/mreYi?=
 =?us-ascii?Q?YZLw3bvZ9gZ/tPazc85ehxKcPzUX/kso3vKMdB4+RGlk4zJSOh340xgog+ag?=
 =?us-ascii?Q?AEaGxocXlDCG/u1dnVkzqOxtvUsM5zaPN/NB7fzlslsHbvWE7YwQv6JYGxpj?=
 =?us-ascii?Q?EKH5aB1iCugzO0+c150XFfcbNrw58nhdzafHdKVajHu+KnuQx2bJ63lcDbOY?=
 =?us-ascii?Q?e3Pb+JMukmjT6dyJGHvy6CVmwexE9eqSZDsHgj6AKIXtADj+avVgxoAzBY6G?=
 =?us-ascii?Q?1zCHi0zvfDoYD+LAoeXuVO77zeIAS6If5T2kqN1glj8Zeg6BqBlI8zGWt53p?=
 =?us-ascii?Q?2HnMkaEyfqG3On22l33g720xe9tBDsyIGCo95R+MiWKdbsaMeH7aB8NWAQth?=
 =?us-ascii?Q?CwY0lk+bni3WdcpsXHoIUAczmkgoZOJw3OTCpWZx0bl6cbvLvOwDdqmtHOY6?=
 =?us-ascii?Q?KiJmlcXHfXDcAgibyj3aWoiCJwAz0txxnq2ItsmWq3OxaSW0jCgjj+tcUDhU?=
 =?us-ascii?Q?p3Go+CVGmQiCkYUswgkw14adMSl0sYVNv5TBy+Xvf50eFjy8YxVbg207jysm?=
 =?us-ascii?Q?pDKD4kGwSwwFyAjsIzOnuT4HpwDxz8Crki0cIRYWL5wKgIfg6FgrJbA91syW?=
 =?us-ascii?Q?BcGzoOaPoF7OM8dzt0Lmx2QWZQ5wgwwVmJAFEdLE9vTv4XIBnvwIxFvHRNkR?=
 =?us-ascii?Q?yOhXLNTfSMpGdW25uesUOVACeRPVkVNrg2eeOzoMcn1iaP0jPdBs+yJ6dEe7?=
 =?us-ascii?Q?+ooZFKx6/To62xZoF2Q4nK73gvoooFp6pJNLxE7QF6AdjvwCnFQC8Ix0lITs?=
 =?us-ascii?Q?941t5rZAoh+DUSrDU7xx2PMDmTpsZ66+vcUF8jGA/ia45Hg04yIxzZbDfbQr?=
 =?us-ascii?Q?Rb846pBZt4YEECkXr/MAIpVG7vwXZl1P32CuQxk/mT1TvrF8sLw8QHt/SVgb?=
 =?us-ascii?Q?Z0ukhFuDVb7qHhtjR8pXFtdmdvd5A7SiZskF7d0j?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b28417f-e4c6-4b83-354a-08dba93235ef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:22:12.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oz+XVMutntyoBJV0lognjCGw+y5JQOCyKNewonJNGybwTojH63NlVjb0ttjhSRxCZSXRKSJkmNYTVPXX7Siyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6649
X-Proofpoint-ORIG-GUID: 8ZoTqCU6mQunEh0ook3IaeOhGopNb9cq
X-Proofpoint-GUID: 8ZoTqCU6mQunEh0ook3IaeOhGopNb9cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=409 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186872

From: Chen Qi <Qi.Chen@windriver.com>

The '-w' option is not giving very helpful information. For example,
if we add 'spice' to IMAGE_INSTALL, bitbake -g core-image-minimal,
and then run `oe-depends-dot -k nspr -w task-depends.dot', the result is:

  $ oe-depends-dot -k nspr -w task-depends.dot
  Because: core-image-minimal nss
  core-image-minimal -> nss -> nspr

The result is not showing the full dependency chain which brings in nspr.
With this patch, the result is:

  $ oe-depends-dot -k nspr -w task-depends.dot
  Because: core-image-minimal nss libcacard spice
  core-image-minimal -> spice -> libcacard -> nss -> nspr

This patch also fixes a typo in help message: recipe-depends.dot -> task-depends.dot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-depends-dot | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 1c2d51c6ec..d02ee455f6 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -14,7 +14,7 @@ import re
 class Dot(object):
     def __init__(self):
         parser = argparse.ArgumentParser(
-            description="Analyse recipe-depends.dot generated by bitbake -g",
+            description="Analyse task-depends.dot generated by bitbake -g",
             formatter_class=argparse.RawDescriptionHelpFormatter)
         parser.add_argument("dotfile",
             help = "Specify the dotfile", nargs = 1, action='store', default='')
@@ -159,9 +159,14 @@ Reduce the .dot file packages only, no tasks:
 
         reverse_deps = []
         if self.args.why:
-            for k, v in depends.items():
-                if self.args.key in v and not k in reverse_deps:
-                    reverse_deps.append(k)
+            key_list = [self.args.key]
+            current_key = self.args.key
+            while (len(key_list) != 0):
+                current_key = key_list.pop()
+                for k, v in depends.items():
+                    if current_key in v and not k in reverse_deps:
+                        reverse_deps.append(k)
+                        key_list.append(k)
             print('Because: %s' % ' '.join(reverse_deps))
             Dot.print_dep_chains(self.args.key, reverse_deps, depends)
 
-- 
2.40.0


