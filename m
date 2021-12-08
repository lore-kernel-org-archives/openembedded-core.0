Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78590C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:19:07 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.42])
 by mx.groups.io with SMTP id smtpd.web11.10317.1638958743676272816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 02:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=iJ3PDIg+;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.42,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TibAnlDFtIoUXxseDlj1Q24AQ9yzHrBKOX/yxR00Y8uHRU8cXga2dP0X8mWBLvMw8XnZprxPlHEyGvx71CyOEDznHBredMnfKoaP5lbgAb9dnTbYZvzwr9iWRdSedt5TtqfW3KNGOQKw2XcGPPpqiwpbz0wJEx0/02GNg7viFuOzolXJf0vGWVJWfY+KATJ9GHWldIrpDDphq6TMqb8ZaaWCTXMGbflQQ1QxAdHdDdTZd5H+CU9k60VqPX5+F5jvC1Hn7vJOvqOcv3xzCe6HBWXmJ+9WMcXhh3ES0rddPM3A6affqd9/vU/yfA9Wtso27kSU6FZb42M3jndJe7O0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Akgct1byB96G6UVkB4An697Y5bc25baBN2ZdrwO9OVk=;
 b=JGVzWKXDxvJJi7MU+W53cyqos+yb5x1uCrEIzNtDSdYmkzQ/kZCkGEmxtKlzMMRyRntQ5DZsXtL6TpB2ikN1UmRQRKPjlHmMx5kO4lW1USF1wPkEFgRtEL1KL1k5ojnHazusDookyLqHVy7Tq6FRt+W899yW0ftTEApPzgP4u/0CH4xbUKLYcg2lqdhLK+W8wM0/ZHPGt0CR1mjwW5r5CejcnhJMcSj3EC8boVn+nNF94CcH1zFPHGno2Sm3g1bm0kZGpCGofLkegdrQ7P4UseFbV2+/IvXZjE4OxzsTCt0BzERfWRzeX9vh2cIE5nwIrZS0MEL4uS3qd3o3LwM45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akgct1byB96G6UVkB4An697Y5bc25baBN2ZdrwO9OVk=;
 b=iJ3PDIg+G48kzRkEOH01uhZ/hGVzdIwuaecp/6ZLmpqLiLx0z2gSHFD0ysOJLDnZoSq06taw6iVC7jQ6+r1FsoZYcgjf4BjPKnbLWQd3oyUCZUerv7IkuzgoH5Jx0TJ9zwmUaCCSx9e3xsb4e0uwxLNa1zkmM3gQ/Xrh162yjMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 10:19:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 10:19:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 1/5] recipetool: Set master branch only as fallback
Date: Wed,  8 Dec 2021 11:18:35 +0100
Message-ID: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.94) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 10:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e85e7aa1-11fa-4343-f222-08d9ba34270d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6526:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6526B76AC9605C3DD0807534D76F9@PAXPR08MB6526.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UaKZPVKNZSKE2HN7mJdUgRmmxLCJ6nty0oR/4hZQQdkpuglfZ5vvPJbZJn5eY/eCZ7mciUQHEdEOuc2+Z2TirwyfIiIMjsA8JFVN6RB4PtG8sj6XETbxR8dx89oQ4F22N/Ab1SJQBOljrMlVhDXHblsaJbeAA4O2FUniyzzt3aEHG9qeF5W0WT4CgEx1yNMcjkkGRh98hYfZRSLfB3FmW+JSanG0Y4Izu9is0f5bK5HgdHBX66so9npaXTOnb9svud7ZhLea5BB3Jwl40ZGvEcZhEc9iKnFWZ3TAeexTRb8qZuU18ug44UAIpliz17Ijmm2dKXyFpjxa+Ssfal8/Qyc/kT2i7WJgZ9xUDBk/U+1ZaiyTnZaUmMwZ5sXFFZ29DbzrhCvuei0i+s2LBHa0bJVuiJ2MMgcr9UvPLp50elXErGDMO7VcGORcJJDcTZ9Nzj5snmkP1pTxtUW57v55CFqfhH9goVFtLaIVUXY1Ef8FSorfsah1t9d/UWD+JSZMrAfzrTqDgg8Q1kYnIwERgLhM0pDQMYd5X/bHX9ato/ayN9+Z3swR0UDZxGOUScB5bkOxWWhTV93AE6kdt4wtLQrKqOijmIYVLZJ2ssQJmbOWB1mdzd2KdR6en8BjZ4TiMOzzjcxaOLf1RhSwyB9NyUhX+9IEsBsSuE4eM3qslJMwQDzjZ7+fgaKmAaHZayrE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(5660300002)(6666004)(86362001)(66556008)(7696005)(52116002)(66946007)(1076003)(316002)(2906002)(8936002)(38100700002)(8676002)(186003)(36756003)(4326008)(6486002)(956004)(2616005)(83380400001)(38350700002)(26005)(6916009)(107886003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vNm3N8ZiBCO9U0pVzhXouXUxSM+iV5VNrp9SEQca5ImyCc59eu7+kLolgTAO?=
 =?us-ascii?Q?60rz+BAvyej/8JYVH7ga1Ch5eqHky0+zOskzd/XtHF2xRJJIrKXM2HHPP2c1?=
 =?us-ascii?Q?CHXjOnmG37tt43hfjK5T02HqYqg2zZ6a/GonNizPRb3EUIzIQVcKMXjSXueZ?=
 =?us-ascii?Q?5aAiYoXGYLz4YrTXUvYZ6ZkxQNjSjFIBEJnrEaBoA4WpZ+7JITf2ebtNFT3X?=
 =?us-ascii?Q?RFT9bz9ZGuPJOkaoY9i//CrhTWQdDLMVaodxi66T5GtUdNYnEMA8dTPSEiG1?=
 =?us-ascii?Q?Yns7KsHJIaraxpvPVvSwRJfyhlx3XccTLHZuc5TMJfd9vSsEGNTXvXUFFM1g?=
 =?us-ascii?Q?G/diV2Kg0Bax5PpNYjb4lTw0vNh+tPPT/nBbKkIYPOCIHRRoGtYDNbYitqvJ?=
 =?us-ascii?Q?OrtNVe5HWEapbt50M/Oip5wEx4xDCU3UD8NZSSviVrELLGIyS1VW4ZSLxNZz?=
 =?us-ascii?Q?uiFOPfOHb2ZmnF9YCB6ocQIEJWrFkXsauuKXLdZkxq8y5EisYFS6t/HldQ2t?=
 =?us-ascii?Q?TSaTxRu3GQ8yF6/9SAPBhQM2vXhueKMwUgO5Pqf6LL8IzQVtRJbaXwfKDHfe?=
 =?us-ascii?Q?pdBDztO2puFOIAVy8PB3rPPvOxegy8r6kpGmWHyzc2f4yaH7tpVzamnPqM82?=
 =?us-ascii?Q?Y6ORFSy/Xk7GeanrEKk/+ji4yXBIq1p3mAhxoMyQ+K71VZqNTKQVgYDftSI/?=
 =?us-ascii?Q?E7g3Lg6eDyFZhvztrMrVUU3+h3s12gio4CN1nA1JwLOKKE87vlGOSh3wm/nr?=
 =?us-ascii?Q?StE1gRw4W/mStFxlcRUHioIIAgAuCrxUaIto5UN4r8ZPAbO+ZDzbWsMHjv3Q?=
 =?us-ascii?Q?0YYIpJEhkd234zAbsawRP1eeIxyLeagEk+lRJEK2zhdyqgA4tBPqmbWI+aFI?=
 =?us-ascii?Q?HQvzni5GSnWUu9hqsVGS/VXJW1SLaeCQh8z/nqAl1Myr5LYIbcU7kPappyEQ?=
 =?us-ascii?Q?Z0dfy/aRN8LHZbJmiduMzEGvwsPq6vjdj7mTzw7ngUX/qI31Zdw3ilRJis2x?=
 =?us-ascii?Q?YpR/cWmb339BfqvfMzjnWX/T5xomqJHnzOjUcopn5hf0QUNfS75OlHuysgE2?=
 =?us-ascii?Q?6Nd3dj0iuNwMlEOVNfP/a1+qfyWmOopbA0pr5sGhAj6tWDNWF077moEswtKg?=
 =?us-ascii?Q?G1ly1Nu6Cm2BrotXytGsr0bvkz8+xmR/1JsaXB6qurZaZe2pInHt+Ye1xU50?=
 =?us-ascii?Q?0ewyfynbm3LAK3JYSxMIXRBI3yLrxXRhYqdqcGjJClU25TJGMi3RaOx2w74r?=
 =?us-ascii?Q?D9d++74zyGlyDRFSUV1sQHaDXmNKrgdOGsXHkxOyoP9bkTFfRU6Ky7XYpK0D?=
 =?us-ascii?Q?fvJAI8TtY6DaOrYKkq7nbrpMCQuoRkdPSbpWIcI0dKl4P3M2BnJlOGzffH9d?=
 =?us-ascii?Q?grMVlUKSjBXghz/a5fjhN9icwZX5sNqaMHzvpognTM1I4DbXx7T9x1Fk4XRV?=
 =?us-ascii?Q?dsyt2XispYzJJpRmZY8TrcMh8JjlGS3MjUdkMoj8cT7iSDPTiVQLffKp4Av1?=
 =?us-ascii?Q?xSkkvfEROlVW2t5Oa1rVu2Gx8KQYBxITYP0tlLFzUfqKb2DhUzo+7hMjmQUW?=
 =?us-ascii?Q?fYILEVKxgtzPRFEP0Syg7rV6gt3X8cyydNRey14uJn5c+9hV6+TXGI+/A+Mt?=
 =?us-ascii?Q?6p/5Ymv7nNgjp8CZ8/LRqiQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e85e7aa1-11fa-4343-f222-08d9ba34270d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:19:00.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bDE3Ki25ldEcSuPGK6QA/mtcJVKfe2t5yAb76h+9pI6o5DDAImhGbr13Xpz36vRvaHJaMSt/m9rzvFyB9mDV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 10:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159355

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
sets the branch=3D parameter too early to master and thereby breaks the
-B/--srcbranch option.

ERROR: branch=3D parameter and -B/--srcbranch option cannot both be specifi=
ed - use one or the other

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 4f6e01c639..406c97f1c5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,9 +389,6 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme =3D=3D "http" or scheme =3D=3D 'https' or scheme =3D=
=3D 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
-        # We assume 'master' branch if not set
-        if not 'branch' in parms:
-            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl =3D bb.fetch2.encodeurl(('git', host, path, user, pswd, parms=
))
         return fUrl
@@ -481,6 +478,9 @@ def create_recipe(args):
             storeTagName =3D params['tag']
             params['nobranch'] =3D '1'
             del params['tag']
+        # Assume 'master' branch if not set
+        if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobr=
anch' not in params:
+            params['branch'] =3D 'master'
         fetchuri =3D bb.fetch2.encodeurl((scheme, network, path, user, pas=
swd, params))
=20
         tmpparent =3D tinfoil.config_data.getVar('BASE_WORKDIR')
@@ -530,10 +530,9 @@ def create_recipe(args):
             # Remove HEAD reference point and drop remote prefix
             get_branch =3D [x.split('/', 1)[1] for x in get_branch if not =
x.startswith('origin/HEAD')]
             if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=3Dmast=
er' as this is default.
                 # Even with the case where get_branch has multiple objects=
, if 'master' is one
                 # of them, we should default take from 'master'
-                srcbranch =3D ''
+                srcbranch =3D 'master'
             elif len(get_branch) =3D=3D 1:
                 # If 'master' isn't in get_branch and get_branch contains =
only ONE object, then store result into 'srcbranch'
                 srcbranch =3D get_branch[0]
@@ -546,8 +545,8 @@ def create_recipe(args):
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
         scheme, network, path, user, passwd, params =3D bb.fetch2.decodeur=
l(srcuri)
-        if srcbranch:
-            params['branch'] =3D srcbranch
+        if scheme in ['git', 'gitsm']:
+            params['branch'] =3D srcbranch or 'master'
=20
         if storeTagName and scheme in ['git', 'gitsm']:
             # Check srcrev using tag and check validity of the tag
@@ -606,7 +605,7 @@ def create_recipe(args):
                     splitline =3D line.split()
                     if len(splitline) > 1:
                         if splitline[0] =3D=3D 'origin' and scriptutils.is=
_src_url(splitline[1]):
-                            srcuri =3D reformat_git_uri(splitline[1])
+                            srcuri =3D reformat_git_uri(splitline[1]) + ';=
branch=3Dmaster'
                             srcsubdir =3D 'git'
                             break
=20
--=20
2.20.1


