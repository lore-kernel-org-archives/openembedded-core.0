Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1188DC04A94
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.117])
 by mx.groups.io with SMTP id smtpd.web11.566.1691012441876901496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=UnBe/wry;
 spf=pass (domain: ni.com, ip: 40.107.244.117, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFMr5NqyErnS5J0w6mBMs0r6Lglc49Ppz5C+9KPdfxUjQ8RCgKKiniTodd8r5QvzZrXnu315paQS5MMR4GdkP0OHWF4pKYwBi8sWjwOh26xfeXeBO8T1qVMgHzmJMrDZ7aSMycLsB0fvT5rqgbdk/j6x09F2MGVFdbUSrwX1gHYZuOr2FI3YRaT272HTDht6inBmIb5WRUtHwPhUuEg8JUsbdCft3aaooG3O8kYUJ37irjipyXXHQkrdg3v/+pFeo6APGfDCYqGlELZQ7Ouuep4fh+Y6EBKNTdnKDaN6JstQNM1l6WsX09reFljuTplN/v4nYzjvhcutY7UoIg9aYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilVtkFbp8povxKtNiQf88QEAzl59bqlCMbhe29lE9xE=;
 b=aNgBBGgDgMKHKEf4tzdO9mD56+QwSqzxmlfcHinOLLiAfiK7xLitc1/fOXXiwDQGwGfiiCNv+w/uC6LjDyWEISI8chqDxGmaeohsUJDmDmTiAkolcJ3cVxZuOhfASu0oPhhdXh6NxXztfLmrEyfsWyPCTILwKHIpMwRlU5tvtNkFAJyPyagV51nFk1UAevgwOZQUA15EkVPEE/Wfu37XSQNNBGJ8/uB6teh1yk22Ksx58yEAGvehBAMPSR20YD8b8pB+kdATb6D0qfjqUiepHZkqZcEf46xY6yqYVdk4KOKwRhNoS3jr/zKYTqq8Oabgy42fQ3m4xrZes0vVh/+t4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilVtkFbp8povxKtNiQf88QEAzl59bqlCMbhe29lE9xE=;
 b=UnBe/wrySQToGjqh5P2IQHsDHVDEsGVo21qZcpOLV7CBwoZ3uS+r9xHGuL6ohF8qt7XX3eT/36PFkVVG+iDVl5jMVbzD+DS5wdNVZZeNHqjvzJqvXgYpE+jK0WSoN4h2tsPwHOmFmOs4k8UaJ1MKOD53iVpTXL7zz3nh1V/dxxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:39 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:39 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 2/6] package_manager: Add feed support to generate_index_files.
Date: Wed,  2 Aug 2023 16:35:06 -0500
Message-ID: <20230802214019.1068795-3-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0081.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::22) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 825a6679-8d48-4a47-7584-08db93a11d44
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kvkV2iZ1AbOtlK65CAGrHbDCQKSUqC3a2oKQx3UZr4GqCnCm4HbwYyqRvzYr//HJZtPecg12czvBBL/EqC91J4CDB90Ya2Ay+m8+OveKfiOotLJR3OT1dmA/Fwlj9El1RhnrfzfUnyX2kkJpuQDLRSKYVOf+g1+vRbuj62wGKXxSTnp93UkxK5lXvbGLIqYM9HlJgL9Dyd/5l9VUgwBYuCwQJr75Z+j7tYVAKyJgaTi5/yJhi2335ALSeziOImHnz2887xDrO/8J95sIuYQEFSKClJQyXchkOQfj/ITeAA9dV5CnbyF/kgcuoGEIoYzDe69Q2poPOIe74iKcc3ukiL20cR72JLahOuhps7mHKzc9LUS/s1m7goTgbMIYJvHuhQaPcFgPx7iwLFVkjSRea0D47zq7fkujNHnoqq4Mns7xnwzGY1cHrn6AECdL9LhVdgDLc8eBaQydPEOF+T+JLsTVALQROvuuOpFUghDGoXJxv2KNvMrF74ROOPOwEu2dBk7SwvEw8oucoSBpjh4BtjKsK28ayZOYiZBH4M7GQG3on9Z/wPL+AFFrX/Vdczkr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2LLRhav1YJPSRVyf0ZreRcoR5WKI26iJ4NWK+eH33y49K5KAbUFYqZMPAKMm?=
 =?us-ascii?Q?WNIYvCI2wIV4XoC63cqGoSYySuggR0Tz6dGwemqDX1wkfmVoEOWkGAcArPb1?=
 =?us-ascii?Q?BYE38+Lf5FjLmunA6DjGWBoMHoSHkO9UYs6WmBu63rMX/w/deyOoAptRXHAR?=
 =?us-ascii?Q?FhbWYtLSMVzFwgMowFljKQ3Ijp/lISp7e4vcpY479VIcPHrTl4fs3iZT3o4q?=
 =?us-ascii?Q?Jh8pKYCpIvjsB+1gA8XaGuVeyyZ/21fDOtb/uYwjr94roGsUf2sgJ74nULGR?=
 =?us-ascii?Q?x/Wm/Q1J+0zEfsd/d59x7pbv8KzQE+nnP4epQVl95T9aLsFnKzrITOagQ9b/?=
 =?us-ascii?Q?EzywDy/VBbXtdopnm5kh+zDun45Jm2djQCk+DHE7b0uvmk62e4ouKKhvpOK0?=
 =?us-ascii?Q?ZcUSRD96EX1G0g6KIAYjmVEGTGbLJfSa+QfucUNQiKFWN8g6b0mx7MhA3Soq?=
 =?us-ascii?Q?h10Y8uk9EAvbQRci9LSwA1XYAOqTgDrpjCYH41yTaEVsv51WtdjoKe806CaQ?=
 =?us-ascii?Q?378ewG1qDGBgpKlcplQ9bPsWfOdimPttsfrhSvJHKkIt30hp+cO+l5YpXTxn?=
 =?us-ascii?Q?y7Jg/caa8VXt62vcJU82XF/pE2UpIzuVXL533fqL6fFvSMdLpMWZahWmPm61?=
 =?us-ascii?Q?Uq0/jAbubauzkswHWoGYTjgnUnSi1/dKVU0u8s8wLXjODm5oBszrRGg38Hf6?=
 =?us-ascii?Q?3jgwaak0ukL9JD4fjcP8Ja9Rq2716dGi53aw0GJGZH9jIkizaprIomn+oafs?=
 =?us-ascii?Q?T/LRYUrVo3VFg0xpSwRoaJZmjQmO2pI9ViI3p5fTFESMcOc3ovdhFmdTReBa?=
 =?us-ascii?Q?Tj5SsYbFyb5ywxewD+fkncN3u9B19s7orkzPk1tYajVJDuUqpxzeRSNrlkjY?=
 =?us-ascii?Q?jz9pAj4CI6ZYDgrxbr/lX47tg9OBYWw/hX55agIwBERPL0ThhgbG20lmRatv?=
 =?us-ascii?Q?xRPkZGp8b0cPDD+RSx2yqKwrRkA0GGz2bL64h37dMH0RVwEHOPuxQamasVvf?=
 =?us-ascii?Q?Q42dFTF8XrrC2pbcQwHpFrEDZU0J+100agkW75UWYCn0kgotCAnhMV6ezk+5?=
 =?us-ascii?Q?wymhRh4BHFtmGbTSe3PzYVgEaVKvZzdir1tJwGShW3XRnb/mZ/kN9RZdBnMb?=
 =?us-ascii?Q?fuD90J0Ylq7guyQWTYMKxBNEPC3YhFM9yTYPXOx2gizLDQy6pcbcFxJbV2go?=
 =?us-ascii?Q?fSX6EhConxa7xjJOTXlRCwh4o7UmwD4p4PSHN4cfXkCxw75Td0HcmyJoEfOV?=
 =?us-ascii?Q?G+N7ZNdaBGRQ+XEROM7lvOfWqyX7mQiMaLwxr8XLhmYNEhT6m9TSCnrYdwFl?=
 =?us-ascii?Q?/72Bc0/epv+X6eUjg4LdXHvV51omZMDEQW6bfTDGuHXjHbZ6Sc7OnHxO68bm?=
 =?us-ascii?Q?TyUxV5vGjyRoSjse14J74COs/vrgr2gs3eSJOVrBJunAFn9cQiP57004DjS0?=
 =?us-ascii?Q?Vq2ICFZv4qUD9kjaUGUxG7tET0l7Vb118TknBuqO+eCRrcCcQR0PQSVwziZN?=
 =?us-ascii?Q?X7gBRcAzWvgtc9PjarW6oE9RrwsXuXRimaiaFbfNzpWbHQC6jeO6R8/Lpp68?=
 =?us-ascii?Q?sisS4cXwyo8YpQ48HD/tV9nsNPu6LFsScI8lRQGdVQ3rnYNe4Ezc7bItQIK2?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825a6679-8d48-4a47-7584-08db93a11d44
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:39.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyrXjVUObdjhXv4VIZb6nK9v2mivaMJeXBWewaIFfQJeKS9wEpWedGRSGNz8+vRyFOzkmberlHofxT/AlhOcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185436

Currently, the generate_index_files function only handles
the creation of index files in the DEPLOY_DIR_<PKG_TYPE>
directories. This change adds an optional isFeed input
that will instead point the index generation at a package
specific feed directory. If no feedname is specified,
the original behavior persists and the index is created
in the DEPLOY_DIR_<PKG_TYPE> directory.

The directory for index creation when isFeed is true will
be DEPLOY_DIR_FEED_<PKG_TYPE>.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 0c313190cf..af4254caf5 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -533,27 +533,29 @@ def create_packages_dir(d, subrepo_dir, deploydir, ta=
skname, filterbydependencie
                         raise
=20
=20
-def generate_index_files(d):
+def generate_index_files(d, isFeed =3D False):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
     from oe.package_manager.deb import DpkgIndexer
=20
     classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
=20
-    indexer_map =3D {
-        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
+    pkg_class_map =3D {
+        "rpm": { 'indexer': RpmSubdirIndexer, 'pkgdir': d.getVar('DEPLOY_D=
IR_RPM'), 'feedir': d.getVar('DEPLOY_DIR_FEED_RPM')},
+        "ipk": { 'indexer': OpkgIndexer, 'pkgdir': d.getVar('DEPLOY_DIR_IP=
K'), 'feedir': d.getVar('DEPLOY_DIR_FEED_IPK')},
+        "deb": { 'indexer': DpkgIndexer, 'pkgdir': d.getVar('DEPLOY_DIR_DE=
B'), 'feedir': d.getVar('DEPLOY_DIR_FEED_DEB')}
     }
=20
     result =3D None
=20
     for pkg_class in classes:
-        if not pkg_class in indexer_map:
+        if not pkg_class in pkg_class_map:
             continue
=20
-        if os.path.exists(indexer_map[pkg_class][1]):
-            result =3D indexer_map[pkg_class][0](d, indexer_map[pkg_class]=
[1]).write_index()
+        pkgcfg =3D pkg_class_map[pkg_class]
+        feedpath =3D pkgcfg['feedir'] if isFeed else pkgcfg['pkgdir']
+        if os.path.exists(feedpath):
+            result =3D pkgcfg['indexer'](d, feedpath).write_index()
=20
             if result is not None:
                 bb.fatal(result)
--=20
2.41.0


