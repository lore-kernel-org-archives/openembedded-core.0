Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7B5C25B73
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:01 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.99])
 by mx.groups.io with SMTP id smtpd.web11.170828.1692216595388184136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=MO2FOCse;
 spf=pass (domain: ni.com, ip: 40.107.100.99, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyQyi/1bqks1crUq34UDHQ0kKT1DWkvc/7x0qAyIf64dwZ/pClAk/Y86Tz3YvTGnEIJMHOsgmRlg1o94rsIzo7c/j9eUQUcnnSYU0QEuvDlh1k9RVi15Xc643cTZpwKAQinIvSQacd+16DjWk99cJNWHzK+EZrWdQOiwRR9iEkXFUvrzkTqTRWS9IT6bktuikpMjOP2zOTNW/myXBCfzcdiN/qvLj9wrLwTrc+kySTYXA8VBJH351EVQai5TNeWie8z3l1a/3Fd7mYB4hg4pI8bvrZadw0w24iu4BFqS4n7+o/WYK3YHx5ApWGERI4Q3XPH/+oo3zRLF9AF0AdpUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuPwA88eIXUpOOgCZaOYW5rrr+ec8kp5dtlBDAw1nJU=;
 b=cGYViVKVNQ0j9rHHAGf9z3O+xj/E3TKxXcT3vFotNAGtvI71//+/enYQkl6YEwU+qFmmZFwG5kef2Yzbd7ySF9+qfmz7NkAzVFU6r1s89d8BGX6L6S5qGi8yWFTd8ZZt4cB/I7QWYHa8IHEAcYGvT39lXrcRdgWulS/39SNOdOMc/byLOnKSPCGFe3p4JTSnkhapE8lgmZ2hBwsiywS/+MjG6PZttzOF1D4TVhMu0r9UyNrng3/I+jEgNpe9TIi7iGCVKRZbG2fLSl1t5mNECBVFHatMpqnjMD4BLEYjH6NHUCqDRCF8zEZcg9t5R2clU1SIff1noLK/9oR68guNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuPwA88eIXUpOOgCZaOYW5rrr+ec8kp5dtlBDAw1nJU=;
 b=MO2FOCseNPrOX+SdeH0Wp5Ap+JOkRWZvu2hW2+S1ie1tKMH4ijG4JokaWywVBdXrrr/WKuYP/Z3EkqxKaCZIOoc13M7fEf4WseitJgIVLefFzOHRPPRIr1iVG4S1O7qyxjEfn29aoLG6BIHleYC6Sr9eXU0Nj3h1HEuHW52vL58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6400.namprd04.prod.outlook.com (2603:10b6:208:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 20:09:53 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:53 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 3/7] package_manager: Add _find_task_pkg_deps helper method.
Date: Wed, 16 Aug 2023 15:08:33 -0500
Message-ID: <20230816200931.2577181-4-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:806:28::29) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ab97bc-819d-4e22-4a3f-08db9e94c125
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rwdsc1oS0FxSAxbDsvJFELx30igGOOJXy3zMJFbcyzKUyflq5aVyKDRXL8P8HA3KMNOeWxiY6PWLo4wNJCaHuRIndv+W/XK9wjjrfyQKKQf9kJ8aZiZVfYfG0rKCLS2PDW2V66jekhQq6ULw1YLEXiEU58XSML/vW5BWin4SAXRT4ab5qASOh/YF31kHkNwHH0xDQHxATMdcuyPAGgISot57elhLMZIpuoWTnouUeOC/gfx2oXGlvnd5mXW0jKjY/YRoeqVnu1AkkZelPxPiZg4AiAdCBhnrN920F4jXH7qalwyjfhxBGpG2DwSUpJ96IlpoRG30AEAc6hjDImeL62J0nndEfPn9+Nux9xs6YnaPABtzsTIV5UXLL5d8XmjCnyNaolE34pinyp5/XHOZ1ZpYAS3ISmveYueiBF1C6pfkCDe/IWpxyUzcHR0H3uT0ToDDkUz54DN7kmzUTgwCPJHgzirlvmijkLef7ig6b6kMZ5Ek5CZNFe0UVSmqYvuTqhF7bAJdC5cYftwLUkuI8Azv8yQAeT88m5c+w+Oa1Tj+3KTAMb79oc3tTPwn5VDB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dTBQRIjO3r7zuaMGYv5jieUtkQH1C/PnHMug/261XRrZnbJ5lec7fL7+JGIf?=
 =?us-ascii?Q?w7c8aVjhcbRps6O59gI8aBC2tj3LG1X9XbBzuZCbM2+wPqy+149Lr54pi+g/?=
 =?us-ascii?Q?Ht/SPc9X5NzzTpSDP/RL/gXVQfmF2OmaZlgag06pHGJs3NyyLf7KPFxMcDJX?=
 =?us-ascii?Q?OxqUgpVxZedqAEuc5ps8OAv/zTvd/MAAuilaUqDQ0evUz2/VpvSIJJkMsHDF?=
 =?us-ascii?Q?SwOt1kUpaCyWRvoljf5N+d3fxCjVTRH0XgQE0I1ncohYJXsnd14PSAM8gIDv?=
 =?us-ascii?Q?qZdbYsFOBS1DUKnGft73Ce/F29CeCVRAgpmr1+byRj8PCWV0p7CFLunTvdTM?=
 =?us-ascii?Q?i6uSZvAnRezqcqBS8o0LZYmG4qpNAhq4J28VfuKiqfPD+hYwh/UNZIksUTxQ?=
 =?us-ascii?Q?xUmbkoxy7d7DE1qvcvZWJE3znCxFenMVJTqICa8Cp/O7BbDQxhZ2u1f/8ob3?=
 =?us-ascii?Q?ktgO2YTizumRvI1brsh2HOzazROxeZtP9laU8BB5F7Qwm0CYSUGKqqE/8Ggh?=
 =?us-ascii?Q?gDg+jweokL3JJbYO5X0jKNfopdnKdCPNN/a88SO/9tTpcIIuLOU+mxT6HngR?=
 =?us-ascii?Q?Q7+HQ4to5gCWM6gpFVlp+fcaZiIHzk63fc4FT1GYqrv5AKgrcMRGhscMwMhy?=
 =?us-ascii?Q?W2m4r15lVtJ20kBUWo05DhYn/jmFi7zGspX87IxboYLyuffDkODHAUxNuYvm?=
 =?us-ascii?Q?pO1PD0Zz/msTWBLzPRZsw0qUYu4O8YfuKvnipq9fStvoxhnpQyT5XkgdWswY?=
 =?us-ascii?Q?kY7MUnNoHm88PoDi6AEXB+uq0SbT8NpZmEuFBg8sKjVtTGtqkkHxYacvS9ui?=
 =?us-ascii?Q?OdgRpe/aeMh8drnXqOVgjZLk1ue+gpmv577VJvYwEUdW/wCtOyGL0CdmJSxx?=
 =?us-ascii?Q?wjmHmXZCNgubsMDUfHfcX0/CpRJSP0Ke7zXhOYjVU1bWU1cqt8JG7wgJFP19?=
 =?us-ascii?Q?MTD+hE0cjSKFrHJNav1Wtc4oeLgh0lPo/Ij+AHEVTlLSZaZIMyYa3iIgankR?=
 =?us-ascii?Q?IYPQt1iQ7iIfDvIqzFpZUNr11hneVwU0mgCBfbW1mTSm8kau1fAccveUAt5M?=
 =?us-ascii?Q?NvrAwzrBtoYsV/YA/N8YKYEBbFtikpiDWQ7BUtoDLGYguozu+Jur9KcaTbuD?=
 =?us-ascii?Q?lgU0e1wIUeqnvktMwYNUQgXvRgEA+Qf0i/cVB7kBL9f2LhAwai+PKQpOcrhV?=
 =?us-ascii?Q?dzN39kYtc1Gw/p2Q6OIs0v6XWysL/9s4ZkAPYNSqUlazHTSX2gkMw9s4dLm5?=
 =?us-ascii?Q?lzowIiuOyrHqfe8+qD5Q4/haZl2TzxlPfUmn4ZKIfFAkj8dhMNJzYJXtzSzq?=
 =?us-ascii?Q?6tgSGDwOQG9HlylBZwiW1IUWdmWxnh3wDBMNS83pOu9uipgTvUAbnPOl0j8M?=
 =?us-ascii?Q?92HExK0dk49anxY97Wep5tapL0YY3ujJfREhOzOF7P6WxVoHEqtNTPKz8kUx?=
 =?us-ascii?Q?9cnVoApniNiOLf/ZPfy6o+kZIbhmEcOS/Ppjgm09fvHbeyXbkLgsUY+aAd/4?=
 =?us-ascii?Q?AuIqhTx8qP2UPTldW0uYFG9Btlr24rdGwNG9IH2Yw/GTG3xd1FdE2wIIJ8BY?=
 =?us-ascii?Q?AtaKbV6hpDHTwphk1dJH7/YfBv9a6fHgdQ53pOeHb8AhxaVXLq580C/KhT+K?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ab97bc-819d-4e22-4a3f-08db9e94c125
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:53.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCdV7InRMJ6V4YwZPAVAPzBeuC8lnbV0K4UQ+X4BBXhhI5aftXuVRsKeXZsrZvpsv4XPbxXZi4lshVVUMyIHmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186146

To make the logic from create_feed_dir reusable, this
change splits the logic used to traverse the package
dependencies into a helper function.

Additionally, the logic used to find the initial task was
updated.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 51 +++++++++++++------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index af4254caf5..10376dd9cd 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -473,31 +473,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
         oe.path.symlink(deploydir, subrepo_dir, True)
         return
=20
-    start =3D None
-    for dep in taskdepdata:
-        data =3D taskdepdata[dep]
-        if data[1] =3D=3D mytaskname and data[0] =3D=3D pn:
-            start =3D dep
-            break
-    if start is None:
-        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
-    pkgdeps =3D set()
-    start =3D [start]
-    seen =3D set(start)
-    # Support direct dependencies (do_rootfs -> do_package_write_X)
-    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs=
 -> do_package_write_X)
-    while start:
-        next =3D []
-        for dep2 in start:
-            for dep in taskdepdata[dep2][3]:
-                if taskdepdata[dep][0] !=3D pn:
-                    if "do_" + taskname in dep:
-                        pkgdeps.add(dep)
-                elif dep not in seen:
-                    next.append(dep)
-                    seen.add(dep)
-        start =3D next
-
+    pkgdeps =3D _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname)
     for dep in pkgdeps:
         c =3D taskdepdata[dep][0]
         manifest, d2 =3D oe.sstatesig.find_sstate_manifest(c, taskdepdata[=
dep][2], taskname, d, multilibs)
@@ -533,6 +509,31 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
                         raise
=20
=20
+def _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname):
+    start_task =3D next((dep for dep, data in taskdepdata.items()
+                  if data[1] =3D=3D mytaskname and data[0] =3D=3D pn), Non=
e)
+    if start_task is None:
+        bb.fatal("Couldn't find %s:%s in BB_TASKDEPDATA?" % (pn, mytasknam=
e))
+    pkgdeps =3D set()
+    tasks =3D [start_task]
+    seen =3D set(start_task)
+    # Support direct dependencies (do_rootfs -> do_package_write_X)
+    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs=
 -> do_package_write_X)
+    while tasks:
+        new_tasks =3D []
+        for task in tasks:
+            deps =3D taskdepdata[task][3]
+            for dep in deps:
+                if taskdepdata[dep][0] !=3D pn:
+                    if "do_" + taskname in dep:
+                        pkgdeps.add(dep)
+                elif dep not in seen:
+                    new_tasks.append(dep)
+                    seen.add(dep)
+        tasks =3D new_tasks
+    return pkgdeps
+
+
 def generate_index_files(d, isFeed =3D False):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
--=20
2.41.0


