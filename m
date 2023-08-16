Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE4C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:11 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.132])
 by mx.groups.io with SMTP id smtpd.web11.170831.1692216602317089389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=fXoEnNEl;
 spf=pass (domain: ni.com, ip: 40.107.237.132, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfh/GujGYT2sB06mzR2kMIoNa8buCtI+VA4ryf36dQ4wQFC4dWO5E4npsyof80k6tZmBJZ3ZeeEYnICHSO/Fluqi9W3p301ktVZkXCKuv4FwTSYS/ZBfzBrYGl18UWixqH2HFq9CWXoJYEPtg/ImdLVWG/pFa6tTGYqwRvdrl105AA8s8+UCdXiUxGMOfHrR09CLMJRXRO1XPDKbzhFSPx+8PlJ6y0S7d9RjA1LFrkhGcFrVVgrz/uZdV/OShPb0efPq8icENMWQpSVxLzIIa+Ty2XqOxmrh34h5TiAtuT38krdrLWf+6siM3v3gbtKfMRBCC5PKCEPFFg1mi8RZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRDSgsXOM6mYi/9X1SJY2pJUML4f21GWOnaQastIA3k=;
 b=lLXb+tkF5nHz3j4EYU262jA+Xe+xxUBoklXEmZb1OtxK/AGjIlIhuwtuWtqm5wIL1CPQLb97P7N0VhJuHW1CbCLpMGnoAEHS8dRli2VjQ82wkj94BY1YZR1xQHbqCHWSQeN6HT3WLbed1JxA6iucmiIjxHvYSmgRGtvySgjMrT/dms1ZyUo/M6rhmxhJVk3FNcvQ0Fh5I76tW5QqVpnSXgwALIQu5DPzwIsBFD3IxzbHrn5lB2ApQZys5AbOe5EiQb8lnBCtW4M92yeyMdQCezSRmGIuM1fwKaPu/skJS+9JIi0LtXXkG1rzZiRXdIXsiT4umZGsYJLMsw+MBVWg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRDSgsXOM6mYi/9X1SJY2pJUML4f21GWOnaQastIA3k=;
 b=fXoEnNElMQH8KYYJeoNRHQJVZ4NfGfn9eeq5qRZfxMUX42kCegQJMb8AibSn18NGdHsA4C8SV7Y3/P0QvK5yMBhdqo/ziXJHAmiB000SMyAxgRZ61bgDfFKW+s97Cfm3FK27a18bwH8rYjMNNy/SBD3z6CInrQMOdkW5zazJ5Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB6963.namprd04.prod.outlook.com (2603:10b6:a03:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:09:57 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:56 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 4/7] package_manager: Add generate_feed_dirs method.
Date: Wed, 16 Aug 2023 15:08:34 -0500
Message-ID: <20230816200931.2577181-5-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:805:66::40) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: b007fc11-f734-488a-b70d-08db9e94c2e0
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YpkjUiQ5dEhSD00T+bbv95o1gwZ4doeXkk1nleaOKtjWXJUrl2SHHlet1Fpzn4ofGivTGKlqhpj08D/GWLWGhiEKUDpjQd7Z/l89z/k+eZBcXJeQxiSVIJOG8Y/VOU7N1b4cvytu6xhqIDA7BrDcyCKpX+pNnEFBJdsp2RYDlR0d7DlBL5Hq07x2KgGDt0Ncq1ZwAihXxLR0Y29hp3sALxtWRRigfs4wgZ4lIZbpLUnwPm+ACIPrh5PWoM8VjwMyLfU9bMJD4ocIAsi5LopmzY+ECMmxarw0qhw0ZlORML5RSs2XGk43wm50pWGk8cURc7CWTljsD/h7BaCCIeykNpwiZthbTT2UlJTO2qMRQnrwVXC6XQUKIabEvhfMX7xv8N5LbBFz4BCQKeEvTIs6mlXhL2gAKZg6ECfrsJ4+0Fhyn65Pwo9h2OD94AfOfCL5qOQUfjC0pbrkJx7bGMCqMMr5psxO43y+B9nznGKM3suS0Oc6mowtUCHRL4GiQNjMtOeoOmnOlTICxwr95zZbHC7loVa8Jm68ISIQvCuGRXAGy+ClW16VVBgQ22R8YdVz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1TRo3qAKtNUcSYv2NNWIK1O5I6K75dLbW6bCN2vH5RQUls86OuzjOz7YbMnI?=
 =?us-ascii?Q?Mb4yeTWauI2lInNBSnXpkLZOSVRZfcDH7lt1v8wJuWEO7LpOgZ69ct+tguGb?=
 =?us-ascii?Q?k7E25bM8rxZaXuMmdeFXGYXEGEEU3SKkWc0fGqsiirOCIFzi/ZyaVU7uFkg2?=
 =?us-ascii?Q?/SC8IBNphmexO/MUDaa/k5W+8bzUrdBoX4HoqxPX9tKplLI02SL0utlWq9uh?=
 =?us-ascii?Q?Vng27sL5mKhb3/yudKXAgxzEBnDBL3DGV/dg07nQJdAdXcQweswt3fBsGlQw?=
 =?us-ascii?Q?j4Ve0Pe8+sAxj4N6TXZfn8pO9jANIDCfaQBAc9GejojCIDSdW63z30uuH0St?=
 =?us-ascii?Q?QOFKR2tVrpmZVXlzi8yDWUsb6AfwHLlDbyNJZYLNRWsPdBJiN5kxtsFFPBvz?=
 =?us-ascii?Q?WcYrxqL017nAwTnZDSp/6p3/MRqj7X1qsFXa2M/rXAlZKe1XuMAf8qISHEmK?=
 =?us-ascii?Q?KPYCFQNj7oCfrjbp5E2ClxJEM1w+aKWEMLFRke/HuAaBFNalWxRwHWkmKbCJ?=
 =?us-ascii?Q?rFJHmy8lUl8NJ6zCaFDyax7WtfuuT2LFkAYwJUMQhnwJwaJ/1gZpB9Od2Vud?=
 =?us-ascii?Q?SfIGJgmV0H+L73hhXaPO8EZZ8ckvopChe0IoSgxQRLaRaBvpe3vXsNRi5OPt?=
 =?us-ascii?Q?KKiV6HNFgkqnE5xBNY+2qtvUfKntUHmkI3vfjf9lustwgrZQlPkqhPfePMxC?=
 =?us-ascii?Q?kTIy8oQFk4sw3aZyK9I3+ID8fO4e+2kSL7B+RG+jjoUwpYO7ukoby85g6knz?=
 =?us-ascii?Q?Ig6s7w7ad+VnrmhdE+FhADVkemtgZO/vpW2owYCOoCUU1gTY0H0vBGr4aqOc?=
 =?us-ascii?Q?d2viFqqJiiNkc3x5uE3eV4K5GRVJTpjVV9P6mn0M+qOuKn9qNKcfS9i3bzQd?=
 =?us-ascii?Q?A6pWndV1unny2JhVcEEwEYZtt7IUDnombK700zD1WXNyZlVwQO05HOEYOfrQ?=
 =?us-ascii?Q?yzX/MWoNRuTSPNV9h2VoI4S+zjf9y3CMIn8gwi+x7+fR6+t52EGtFrJmKk4R?=
 =?us-ascii?Q?GYg5WSAUmLLFtPFw9nSbduzpZKBx1TnNSX4dKVoPuvZmuAdaS4eMS1xD+Gol?=
 =?us-ascii?Q?TlBiT/DZeFXZ+QsDrE3jFLOLWZUeulGobsROEGD6s/zZSZqclqto6GMcdmxg?=
 =?us-ascii?Q?sNj0pNY1wXChpakSqv3z825iOR3Iyvtbm7oga1g9R2ztqvgX7rtZLW8cm/Hr?=
 =?us-ascii?Q?143JmOxcMNitEZw25/ApbDEjMk4S3UasBWdZBurxL7IEOTBYbWYy/L++7kvN?=
 =?us-ascii?Q?X6Xb7NLHCYKLIxjWfDldXuPQgGrwzAur1bWFTTr7f/S/Zwq9Qt2pZy+AjsQH?=
 =?us-ascii?Q?v4bGfoE1QRYqPXgkN78Nb8krrkilqo3JM8vllUaT12jxEd068FJo3z6RZUUn?=
 =?us-ascii?Q?K6fan3A73buXk0ADxuJUsA/YdY6ZeUnt14+x+IOi09r3rDd4kY9t3+LGlhMK?=
 =?us-ascii?Q?zA0Apgadg0+aEQBRL12m/Z+v513yxUIaOKI/SHKKjtoTW9A/qqw84ATdXiWu?=
 =?us-ascii?Q?2KcWO5qGARM10UCbmjwvJl7aSj1o8XYOxKk3R17ZBUBozDnGoFEJDd0h5ow2?=
 =?us-ascii?Q?3+Kceu46Sa1u16grszZXIM9iWbyYiDvf+GrYJhn4CuejvpnXkA2acgxexYm2?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b007fc11-f734-488a-b70d-08db9e94c2e0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:56.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzgREpMqd0t5/XCS0Y2NUzQgI8O5jxd+gmIjV91pt8GzFqgHX+uyd/QOcJe5kagVF7Ne4cApr8zYcE1ZZBe8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186147

Add a generate_feed_dirs method that will call the
create_packages_dir method for each package class supported
in the build environment. The value of the PACKAGE_CLASSES
determines which feed types are built. For each package
type, the new method will determine the proper name for the
package_write_<type> task, the directory to pull finished
packages from, and the feed directory to copy them to.

To support side-by-side feeds or situations where one feed
is dependent on another, the create_packages_dir method has
been updated to support an input called assumeprovidedfeeds
which lists feeds whose packages and dependencies can be
assumed to be provided in a separate feed. Those packages
and dependencies will be excluded the feed directory for
the new feed.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 27 ++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 10376dd9cd..e87ae6d8d7 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,7 +449,23 @@ class PackageManager(object, metaclass=3DABCMeta):
             return res
         return _append(uris, base_paths)
=20
-def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies):
+def generate_feed_dirs(d, assumeprovidedfeeds):
+    classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
+
+    pkg_class_map =3D {
+        "rpm": {"taskname": "package_write_rpm", "pkgdir": d.getVar('DEPLO=
Y_DIR_RPM'), "feeddir": d.getVar('DEPLOY_DIR_FEED_RPM')},
+        "ipk": {"taskname": "package_write_ipk", "pkgdir": d.getVar('DEPLO=
Y_DIR_IPK'), "feeddir": d.getVar('DEPLOY_DIR_FEED_IPK')},
+        "deb": {"taskname": "package_write_deb", "pkgdir": d.getVar('DEPLO=
Y_DIR_DEB'), "feeddir": d.getVar('DEPLOY_DIR_FEED_DEB')}
+    }
+
+    for pkg_class in classes:
+        if not pkg_class in pkg_class_map:
+            continue
+
+        pkgcfg =3D pkg_class_map[pkg_class]
+        create_packages_dir(d, pkgcfg['feeddir'], pkgcfg['pkgdir'], pkgcfg=
['taskname'], True, assumeprovidedfeeds)
+
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies, assumeprovidedfeeds =3D None):
     """
     Go through our do_package_write_X dependencies and hardlink the packag=
es we depend
     upon into the repo directory. This prevents us seeing other packages t=
hat may
@@ -474,6 +490,15 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
         return
=20
     pkgdeps =3D _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname)
+
+    # Find any packages which might already be provided in a separate feed=
 or repo
+    # and remove them to avoid duplicates. This assumes any dependencies o=
f the packages
+    # are already met as well.
+    if assumeprovidedfeeds is not None:
+        for pkg_pn in assumeprovidedfeeds.split():
+            provided_pkgdeps =3D _find_task_pkg_deps(pkg_pn, taskdepdata, =
mytaskname, taskname)
+            pkgdeps =3D pkgdeps.difference(provided_pkgdeps)
+
     for dep in pkgdeps:
         c =3D taskdepdata[dep][0]
         manifest, d2 =3D oe.sstatesig.find_sstate_manifest(c, taskdepdata[=
dep][2], taskname, d, multilibs)
--=20
2.41.0


