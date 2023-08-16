Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F67BC25B75
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:01 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.111])
 by mx.groups.io with SMTP id smtpd.web11.170827.1692216592984145053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=O7NrnBJ9;
 spf=pass (domain: ni.com, ip: 40.107.100.111, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUKWnoHo1ZyNxvbQomhCLn6OpXpZJcgFpvkeA1BcVK2WXXcVlFMt5P2IvwoXBIOZzHIamBcCX/I+uH4FJna1ApVQcILs0DbeGm8aTPcngmSqvVgiFpfgX+ZhjdlYJi9Fx+Jgd9EKj7XiDiQo49dMdm61GdGooMDZiUp6CJuQlOj3optNt2DzALIAxq2ChCvln3WkIIt5WbM7ocNdWJHRPxtvgcTR0oyhr/8/Y4vvspIc9dM4VnQCL6QXBR6pVXu7THRjb8CXEOeB4rN8B5PhFh7mugnBSj2Mjh3s7g2ZcPXseIs3oPIgI9erYweWHZjx0iJqMUX8hsUmCmBrvQFXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilVtkFbp8povxKtNiQf88QEAzl59bqlCMbhe29lE9xE=;
 b=ly7fwfWwUs5QXqkQlqn9dfChUvpisNzLxNz3KUs6leE6whjwZDyAb3t6/Z7Yj1umJoFW8F8T/P0mM4TUsYGr8pS8ZK2BCVqC976k87pIgQZRR/KT+f//m58pANto8EpuAJvhTfuChXXSo049klROjOxUGkqM0PyiPeNnR90HfDDV9VTE8g2EmP178ob9V34uU/9cp6IzlKYcBdwXNuC0phXWA/ECOBCucZosbjsNCDrFklJwIOx4VoeN7ZRkqHxscQrHJM16CrhxbireT3jebVSaWE7MFQMwoMimPQIrMTMMsvTVsuYeTqOJ3Am526M8Mqr+SNKNEFq/yvTDBm1aag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilVtkFbp8povxKtNiQf88QEAzl59bqlCMbhe29lE9xE=;
 b=O7NrnBJ9oD5AeQkcSTr27UuBAvC2ap8RFeesPtVbMqjy9ck8ZRDJeoJvKAcvwrdWVOC6oNSBDuF0Vgp+nD+Vmxj1ZOEL4ZqzLBRZWv6teWcPdieFjrLpRMEfObg6rz/HO17qo5rvFIRWsJso60L3ENZIj/vKqmL2xm/9rlRknO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6400.namprd04.prod.outlook.com (2603:10b6:208:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 20:09:51 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:50 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 2/7] package_manager: Add feed support to generate_index_files.
Date: Wed, 16 Aug 2023 15:08:32 -0500
Message-ID: <20230816200931.2577181-3-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:5:334::31) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dfd6b8-42f7-40fd-66c1-08db9e94bf73
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GlzBvcPcLn46dDxzl3Ob6RVixQhBwWg6GlGldADwB0IKdGLUxPu+YPFvCY/KxLAtkBCMpCKcAdtYPCN+RZJvVlvb3E5aTk0MMOfXJtjFjWLnYhxeCjYdNlTdQ3XWhhulg8xgSfRlzVA6cSP8LWphsGB82V1StaHkPhat1T5TL/V5FRoUlrfKRyccSaunac46JHdKsLgQAhLO0U6sE9IK91LshJov9qzyngzyBNQg08k6fz8bGXnkSPbTtg2es0UZevqXJSjfTGoHzcuRkYYvchpoH651pjK7a4x+qIfziGTVwM4RRugxhk2OaziiC4nrsD1oQN0uFRhUhfAANu0i1A/4EMoWkeCp+vG6e1QnWithB13KbeKjzsVkJuiRoxd7haxK87RaY50QwFcol2Ux7Ka22tOAouIvfTT5nY/guqpg3653VsolbPMMBkqJXWvldcm9SCOWITtNfQ5rixw5jNAK3Lxj58dTydJxnZI/+52pNIV4aJu9ynAoSfz84SS4E5DGfmiJXPJmvOKWnJ1ipQSgC+tof65TQHcrEMp1axilOHMOzQ7E4LYcqHPy+BVD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1qBknhT1BM103dqZ5exP9kDjejEYPoazfy8FcZDGxFo7GfEcFYnQ5rXIxIDY?=
 =?us-ascii?Q?0nuZ85DhsHODKuC8IzaSJLfPAoxKDo2sToWbQGkh+OQ+ChjOzAypPYlcIk2D?=
 =?us-ascii?Q?C+7BD0jxp72j99WT0PjPrxpRmxZB2YbFXA4Gi75XYXsbVCT7JNquCZ1oD4Z5?=
 =?us-ascii?Q?F/iLDIry5JhWg+0VaXsgkiTVFMqb/5l8mvCY9OQnaFbgesvEkt1jl7gYveK+?=
 =?us-ascii?Q?Fg6TZW0QShzpSmF7YagDRVQqDNkWIxRxZsJ2hLRWu/VLPNNHzg5RzBqWFi0j?=
 =?us-ascii?Q?LQJZKgTgn7e7H2x/7xMyII2OuvRkrTjG5XgRkZN8t4ElD5d0wj9YGUSn+BCO?=
 =?us-ascii?Q?5GXJQpWyo6NH280ItetNWWT7juvvIItnHDChXXee1DvF1SkGvSfxaP7+v+Ie?=
 =?us-ascii?Q?p+UaLvyUp+uUNj3W48QL4BDoN78arhTUD96UIyTUBS955O5MZuDKvlo7jywT?=
 =?us-ascii?Q?HIT2nLK7wuxgr3jnJE0XZZ0HhUgwZltNMnuuCHeTCGTDf/68JvtK0NxQ8Y4U?=
 =?us-ascii?Q?usiIZj5NtNGjeoUw8KkMpVKYRIqoFJUlsM+nOLSzXmXVdtxdDL7qHK3oLxnV?=
 =?us-ascii?Q?tVQ7PzmwTLEtgLly/oMh6VdEXuNajdAA3WqebOnAcQuPUqm93160nXh1MksE?=
 =?us-ascii?Q?zocTImeqiFqBdKFs5jrWXybSjJ8uhqG07o+ITJbHrD1LvUavQVUo6wjUL9OR?=
 =?us-ascii?Q?LNwyPwwSpjWupIPjFtteateq57pbe0XxBczm9ZCA4XVYFyYiVFKWTX3pt+Iy?=
 =?us-ascii?Q?6o+SM3+exTOvH7lLO/pqWR+IZbrhGb9ZlaB+d8SoAO7+zc7vDOahFtEDwIgU?=
 =?us-ascii?Q?kJlHsI60EPEQPzJe0zkWixUGRLocsOBvvgDHOTSqWjbzr8c/Y7ZiyZPzUUs5?=
 =?us-ascii?Q?94E9c5v+xuYyhG583G4+wmhju9BdjgQ0ZXiolB7yNxcwWrP8kXcX72VE0OyY?=
 =?us-ascii?Q?tYZAMQpLbIK6pQrXnlet4LMIdC88cp9lzotw3OIzwb/uuc2cRQ2FdT4MxOrL?=
 =?us-ascii?Q?f88GVO1Ko4yDjJADZnBoUWLE7JKHDK5buaBskEQ86FZza5pbM5a7KLT24L6Z?=
 =?us-ascii?Q?qKzBsC4UnhgkBY7EcptiIrjlTnX3NjA3ISeqIo9jmcWbmoFlw3vVP1SK4hso?=
 =?us-ascii?Q?Lga7t6VwjlIHpFkGM90B/ckAw9oaLSFAMfOVaXcZM/VVyqkOAzDMrIPtFgJU?=
 =?us-ascii?Q?dhCZbQbAlyIIXIhPjaGcANm4lWMkmjWOslAz7hpSHA/YHQJ50ORpSYKqQKm5?=
 =?us-ascii?Q?JA4osCQzMFYvJNqXE+liEfPee+meu2twBksJB7SxDxnQ/NrBs5E4z/IEXhh4?=
 =?us-ascii?Q?hYEw8rTMmbex6KzcN57NvvgaLDMBI4uzQbxx9C4grhP/yDEs6+73m9D7+Yjq?=
 =?us-ascii?Q?rcNhiI0mRnw2bEnmSckCo4pz0bGOagYGURQpAOu1b4Zx1EX3ADuFW3GqNftb?=
 =?us-ascii?Q?+pSDE1K5cG9fRmplBfEUvJ2HVpY5aEANKupFL8wg+9lDmMUuIfwdSB4r0Vph?=
 =?us-ascii?Q?3WfGz51/6zqZtHTkYUBe+4fXj9+PsJdyeS7NkCs3216i7lt1XqLRUIX4gpRA?=
 =?us-ascii?Q?epuW5ppiyETdEUngW3As9/B8aw2ifJckkiBaLlyNf5zg3j9wLqRYc61NukzK?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dfd6b8-42f7-40fd-66c1-08db9e94bf73
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:50.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Mrap1ETVtWO07BN5MdL4K3dt5m6j/h+/RQlViDqEhX/zGedha1AZHK9y1kt3eLlG9FS7xbVCrBtKiNpbuDvhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186145

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


