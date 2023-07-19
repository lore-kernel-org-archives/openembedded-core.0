Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A2FC001DE
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:03:16 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.96])
 by mx.groups.io with SMTP id smtpd.web11.5265.1689796993724201494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=g6Ba9lcO;
 spf=pass (domain: ni.com, ip: 40.107.93.96, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ibla5tdhnUdmE2/mTwOc1BPNKjW6Rb+0npoxxf5R9ybFJyJphDPvgdjc2bC6YGJ66Mn9LyTX+AhFndc9usdcZbax1s6PFN2bNfzPLhkn3nveWWwco522/doP2WgKlZYm9lHfG7pF6F+m2A9MudYV9+LwZgcgV71bAr3+uQ+qZ7cllgCKdT3/XmCBO+llS2yG4b7BhZY7bIcDFUpqKFZQfRznnuajLN2jSee9fFLzUfc6cSujQqgI3rPPD0zS+x4zTR/BvISNmYH2CuVpzxJwJTd5oGlNzu34f3tLMgw5XMC4vJRe9ntRWOOEeVjx7jxB+E6WIAYjoF2z3Laje2v+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSVt8C/A9ubfyrqqy+0vdmBPoYgNBX8Vo8RFOWxXYdY=;
 b=n60CDUYuvrLwu4tN2vRQwJTmN6njXRiwxaigNYkyOkwxAKT2SI9KaNkoypVu5c/mUTejl7dL4zcfB+o78KKKhnGbFS/pUMGd+d4rND1RLhjlThs3L+PihWphhpX4QA2mcuf+49R6IDqAvUlexQNJZATFfz0LO0WYwdoJzk1n4Fs/4Y2GLgYOYw8TderYQ9oSfeFChyjqhOWe4DI5eWOsKvkv0hW8UtOGOqTrkP4Lmy6S6aKOPzZUqUuVhSzunNRFmXykM4Xug4A/i+ElTZLpnk2csozJDsbbkZ6j9a8O8cR+ZMwby4uJ01wd37PvH++je+iA9KPfe8b5+Xhj/55W6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSVt8C/A9ubfyrqqy+0vdmBPoYgNBX8Vo8RFOWxXYdY=;
 b=g6Ba9lcO6n6ZnD3/ajlLKMiYruzC28O5XthvLlkQtRd7KT3XRB6CJ4IpKmf2ZlS5dZfKGb7OG7qou0zYtO51qRC/qY68xpWO/5nEVKpYc3hNR2oa95Yn1Nb6QVrQu9duw/4F0H6hT1YAvOIwVp2ZEZcWLefCndVkFws4VOWNi/A=
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ0PR04MB7805.namprd04.prod.outlook.com (2603:10b6:a03:3ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 20:03:11 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada%5]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 20:03:11 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH 1/3] packagefeed: Add new oe.packagefeed classes
Thread-Topic: [oe-core][RFC PATCH 1/3] packagefeed: Add new oe.packagefeed
 classes
Thread-Index: Adm6fAuMLTjtzjoEZ0iaNZPLycYIMw==
Date: Wed, 19 Jul 2023 20:03:11 +0000
Message-ID: <20230719200252.1203047-2-charlie.johnston@ni.com>
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
In-Reply-To: <20230719200252.1203047-1-charlie.johnston@ni.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:5:80::25) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
x-mailer: git-send-email 2.41.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4870:EE_|SJ0PR04MB7805:EE_
x-ms-office365-filtering-correlation-id: 925fb07e-2e3a-4a25-0222-08db88932e0a
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UWcN4AM9TUZloZBVOWhrxgZwXBN3cVVlFpKKdtGm+DB5q/i1z66kulxhhx+FX+HVcQ8KICeTFhF+g8Dz8cpg97OIf5jLSFYAZfif/hem3ijWdM9JfBCJBQo+eWCQLNBwRb3yuNQCTf45Z9se4icfn2xRubGnoM4J8dDpfvqmMVhBj+l4q7UwqCmQhGh9jxV/yW27LH3Du+Nkd/h5kVHrz3Hdtu4K3x6qVNAx1lqbpw+tgct72R/6uNPNZTTE8x6bJg0sz3ooQDGwSWRn16hyr/ypFjRKYUt5a3z1zufWIzoYKYUQuNe0uUt3GsTUXXjOIGi1fTLZLyjnS9p2g7mWFRmFaqiM8A10FG/tG2kArK6IM/UJtTKAn+0yFdDxuuhzwKgieWJLJfpYNSCCQadqAdf/GwmbxKhA+VYMnd76E96QCnN2xUKbT3DZv4xLJbIwgcmngEfCePo8jFC7sdqc/7Q2u1zSA5od8xA0NQ70c13hPMNdOfiTJMlfRAiC69A6vlT0eQEhZ7G5Hcx0NylZpIe2kpM2yP/MSYAWzjQCjFoxWZ1OtW3+d3xVRatJbBhK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(6506007)(1076003)(26005)(186003)(2906002)(6512007)(71200400001)(36756003)(6486002)(44832011)(38100700002)(83380400001)(122000001)(41300700001)(8936002)(8676002)(5660300002)(316002)(66946007)(64756008)(66446008)(66476007)(4326008)(6916009)(66556008)(2616005)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bwLxoQeOsX/eTjsGFdP0UV8oCzNGv5bib+Otwrm3CV3WMtc9xiwf2ws/dD?=
 =?iso-8859-1?Q?sy+WtX3i+SaBj/JLjZBGHarn8a5fK1v4TS0dByiYrqbvvlQIJerz+67Rjx?=
 =?iso-8859-1?Q?gs+tWyn5a8nlhTuOJ858v9SDKNPXGUdjP5KD4lfoGAFfJOxARbksK3fVoy?=
 =?iso-8859-1?Q?PLrHpX4Eo3LxsEkGjCSS0T0pAs7ftX7e8sEwnFZ6tXYcn9+0/3utPj7q8m?=
 =?iso-8859-1?Q?xuL/Du2+mkidIZA0yFSv2Fd/XVxf/k3Y4sSsKQ35XD+j1FXfeLUfZOvo5A?=
 =?iso-8859-1?Q?xDEdoUTTeICL3WKkut1ivka01QWEP3+3jLlrVxA+Sq2cJRRVY5FicWb0ZV?=
 =?iso-8859-1?Q?FpnAKfEodwhIyTWvdOGHGQQmU+TK+AmxF9g0LmUjSsluaBvCxDQ3TZ0oSC?=
 =?iso-8859-1?Q?oslwPrHMVL7WMlAbyE92/2kShMf71GmC19Vty9T3SVKevLQfWiWhafY6WM?=
 =?iso-8859-1?Q?3N2I7Ea4B94bjHVFHymuY411BFP20sAaOD5/pfULn5gYKkrgHQ88GJ7E5f?=
 =?iso-8859-1?Q?cLPA1BwlKQk7jb8Gw5AWxhXdeEcfgpM+meBLNOJgaFq4OVYQAWkhis6tzp?=
 =?iso-8859-1?Q?9FeNYNjrzLNLluOTvd5ciu2oAhfSRlIuDfIjKzL+oe5lTbCyNLvuZXeQ1a?=
 =?iso-8859-1?Q?d3+YH6+pM14bmuGwe7Q4x8V9TBbpm/fHmRwdgvgFVNNHkWFPwXlzNNHsGg?=
 =?iso-8859-1?Q?7ROWwAoz3QTl3M9UNNpaYiPZcfUc3L9cmBwwG6fSIldAMPQdy7BbTCMtc6?=
 =?iso-8859-1?Q?EK98D7YiCsm/oXGbEpIK1fogPcPInAHJCVv0Q62g4cM2CaBGYG/pRg6s7p?=
 =?iso-8859-1?Q?eY+pLmniAoo2o3Wc0KZ+Sw/stiDouw9/AqdcPkzkgma7Yw7BJ0Tu9ch5Pw?=
 =?iso-8859-1?Q?X1D33Uw+DyUQpq8RA18hsbJV57MdHPy7o9NRDWiOJqInG2qKC7sPtkbnrh?=
 =?iso-8859-1?Q?A7rqU1PT75MwprsptgtqTgg2T/kpBcVIAaS+M7dSHrEDr66lv4AMX28U8m?=
 =?iso-8859-1?Q?FO/cOofGG98iNodq5ZVQwWvSPQp0jZvEKUKDAy3WxHluMU2kpWun62jU+K?=
 =?iso-8859-1?Q?Dlj2By2o6R0TXo5ZNqmRp2yIEMOLsdrc5++YcHnRc7KiC58Hkw5WsBT87n?=
 =?iso-8859-1?Q?K3MTWpIftpaIasR1bldz8WyAPiqpbLUGzVTE12FAsiZb024pCBYJRPugSZ?=
 =?iso-8859-1?Q?atI8uYCCWXjXWgh4/e6xaa9MFkgpLHGpwK3CQDZQCHh7k7m6I620Jk8nGs?=
 =?iso-8859-1?Q?y4C+7qTBtOm1LVnyov/n/5th29rlG+EX/2bitAJ4A4y9iW5ZVy2jw8RbEJ?=
 =?iso-8859-1?Q?Fy82Cb+CoDAhMNTtfDEsBv4nLSu/uwu8Xqbvm8S4OGJtrBjFpHjVNlkt8M?=
 =?iso-8859-1?Q?tZ5NwhJVGqPsFs0O7sSPuk3CUZB/u/o58M/pRprsRZ+x7ud8dbtBDLoBAp?=
 =?iso-8859-1?Q?WlZpPuUKu69wOEmMM4xepkGfZ+1sanAwzWKZcPbItui8+YpHJ4Y1KER/E1?=
 =?iso-8859-1?Q?cq9pNwGGgFj+YUWG+F3twdkdgfW1yrn6yDkuo9rJOZxS9VEztRVBWgxXtM?=
 =?iso-8859-1?Q?KdWFrFfhVemnP3CpqvvzlW3L7a8T59kRQCKqjDwiEIJYSLbCClqmta1PZ/?=
 =?iso-8859-1?Q?ywOgVNKIs0ZSYKaF83xXMlQlAjNB8ycnR+3ALts7mxiqQ0o+RqOcjtDQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925fb07e-2e3a-4a25-0222-08db88932e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:03:11.6764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: He43vcH22kEu3YIWX3X6OzkAOwLyoeAl6Lhb7AqBzZWrErEi/b2rLhLBEQImVxUH1lKLmzElVD8ArAPKh1GTGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184602

This change adds the infrastructure to build a
packagefeed to oe. Specifically, packagefeed.py
adds an abstract class and the logic to create a
hardlinked feed directory while the package type
specific classes allow the proper package indexer,
deploy directory, etc to be selected for a build.

The logic to construct the package feed is modified
from similar logic used in oe.package_manager when
constructing a feed for rootfs builds with some minor
differences to allow filtering out packages which may
already be in other feeds.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 .../lib/oe/package_manager/deb/packagefeed.py |  14 ++
 .../lib/oe/package_manager/ipk/packagefeed.py |  14 ++
 .../lib/oe/package_manager/rpm/packagefeed.py |  14 ++
 meta/lib/oe/packagefeed.py                    | 120 ++++++++++++++++++
 4 files changed, 162 insertions(+)
 create mode 100644 meta/lib/oe/package_manager/deb/packagefeed.py
 create mode 100644 meta/lib/oe/package_manager/ipk/packagefeed.py
 create mode 100644 meta/lib/oe/package_manager/rpm/packagefeed.py
 create mode 100644 meta/lib/oe/packagefeed.py

diff --git a/meta/lib/oe/package_manager/deb/packagefeed.py b/meta/lib/oe/p=
ackage_manager/deb/packagefeed.py
new file mode 100644
index 0000000000..7833cb437a
--- /dev/null
+++ b/meta/lib/oe/package_manager/deb/packagefeed.py
@@ -0,0 +1,14 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.package_manager.deb import DpkgIndexer
+from oe.packagefeed import Packagefeed, create_feed_dir
+
+class PkgFeed(Packagefeed):
+    def __init__(self, d):
+        super(PkgFeed, self).__init__(d)
+        self.indexer =3D DpkgIndexer(self.d, self.deploy_dir)
+
+    def _create_feed_directory(self):
+        create_feed_dir(self.d, self.deploy_dir, self.d.getVar('DEPLOY_DIR=
_DEB'), "package_write_deb", self.d.getVar('FEED_DEPENDS'))
diff --git a/meta/lib/oe/package_manager/ipk/packagefeed.py b/meta/lib/oe/p=
ackage_manager/ipk/packagefeed.py
new file mode 100644
index 0000000000..223f6a057e
--- /dev/null
+++ b/meta/lib/oe/package_manager/ipk/packagefeed.py
@@ -0,0 +1,14 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.package_manager.ipk import OpkgIndexer
+from oe.packagefeed import Packagefeed, create_feed_dir
+
+class PkgFeed(Packagefeed):
+    def __init__(self, d):
+        super(PkgFeed, self).__init__(d)
+        self.indexer =3D OpkgIndexer(self.d, self.deploy_dir)
+
+    def _create_feed_directory(self):
+        create_feed_dir(self.d, self.deploy_dir, self.d.getVar('DEPLOY_DIR=
_IPK'), "package_write_ipk", self.d.getVar('FEED_DEPENDS'))
diff --git a/meta/lib/oe/package_manager/rpm/packagefeed.py b/meta/lib/oe/p=
ackage_manager/rpm/packagefeed.py
new file mode 100644
index 0000000000..e8da346eca
--- /dev/null
+++ b/meta/lib/oe/package_manager/rpm/packagefeed.py
@@ -0,0 +1,14 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.package_manager.rpm import RpmIndexer
+from oe.packagefeed import Packagefeed, create_feed_dir
+
+class PkgFeed(Packagefeed):
+    def __init__(self, d):
+        super(PkgFeed, self).__init__(d)
+        self.indexer =3D RpmIndexer(self.d, self.deploy_dir)
+
+    def _create_feed_directory(self):
+        create_feed_dir(self.d, self.deploy_dir, self.d.getVar('DEPLOY_DIR=
_RPM'), "package_write_rpm", self.d.getVar('FEED_DEPENDS'))
diff --git a/meta/lib/oe/packagefeed.py b/meta/lib/oe/packagefeed.py
new file mode 100644
index 0000000000..3a2deb89e7
--- /dev/null
+++ b/meta/lib/oe/packagefeed.py
@@ -0,0 +1,120 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import oe
+
+class Packagefeed(object, metaclass=3DABCMeta):
+    """
+    This is an abstract class. Do not instantiate this directly.
+    """
+
+    def __init__(self, d):
+        self.d =3D d
+        self.deploy_dir =3D self.d.expand('${DEPLOY_DIR_FEED}/${PN}')
+        self.indexer =3D None
+
+    @abstractmethod
+    def _create_feed_directory(self):
+        pass
+
+    def create(self):
+        bb.note("###### Generate packagefeed with index #######")
+
+        self._create_feed_directory()
+
+        # call the package indexer create index method
+        self.indexer.write_index()
+
+def get_class_for_type(imgtype):
+    import importlib
+    mod =3D importlib.import_module('oe.package_manager.' + imgtype + '.pa=
ckagefeed')
+    return mod.PkgFeed
+
+def create_packagefeed(d):
+    env_bkp =3D os.environ.copy()
+
+    img_type =3D d.getVar('IMAGE_PKGTYPE')
+
+    cls =3D get_class_for_type(img_type)
+    cls(d).create()
+    os.environ.clear()
+    os.environ.update(env_bkp)
+
+def create_feed_dir(d, subrepo_dir, deploydir, taskname, feed_deps):
+    import errno
+
+    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
+    pn =3D d.getVar("PN")
+    feedtaskname =3D "packagefeed"
+
+    bb.utils.remove(subrepo_dir, recurse=3DTrue)
+    bb.utils.mkdirhier(subrepo_dir)
+
+    feed_pkgdeps =3D find_task_pkg_deps(pn, taskdepdata, feedtaskname, tas=
kname)
+
+    # Find any packages already in feeds that this feed depends on
+    # and remove them
+    for feed in feed_deps.split():
+        met_pkgdeps =3D find_task_pkg_deps(feed, taskdepdata, feedtaskname=
, taskname)
+        feed_pkgdeps =3D feed_pkgdeps.difference(met_pkgdeps)
+
+    seendirs =3D set()
+    for dep in feed_pkgdeps:
+        c =3D taskdepdata[dep][0]
+        manifest, d2 =3D oe.sstatesig.find_sstate_manifest(c, taskdepdata[=
dep][2], taskname, d, multilibcache =3D {})
+        if not manifest:
+            bb.fatal("No manifest generated from: %s in %s" % (c, taskdepd=
ata[dep][2]))
+        if not os.path.exists(manifest):
+            continue
+        with open(manifest, "r") as f:
+            for l in f:
+                l =3D l.strip()
+                deploydir =3D os.path.normpath(deploydir)
+                if bb.data.inherits_class('packagefeed-stability', d):
+                    dest =3D l.replace(deploydir + "-prediff", "")
+                else:
+                    dest =3D l.replace(deploydir, "")
+                dest =3D subrepo_dir + dest
+                if l.endswith("/"):
+                    if dest not in seendirs:
+                        bb.utils.mkdirhier(dest)
+                        seendirs.add(dest)
+                    continue
+                # Try to hardlink the file, copy if that fails
+                destdir =3D os.path.dirname(dest)
+                if destdir not in seendirs:
+                    bb.utils.mkdirhier(destdir)
+                    seendirs.add(destdir)
+                try:
+                    os.link(l, dest)
+                except OSError as err:
+                    if err.errno =3D=3D errno.EXDEV:
+                        bb.utils.copyfile(l, dest)
+                    else:
+                        raise
+
+def find_task_pkg_deps(pn, taskdepdata, feedtaskname, taskname):
+    start_task =3D next((dep for dep, data in taskdepdata.items()
+                  if data[1] =3D=3D "do_" + feedtaskname and data[0] =3D=
=3D pn), None)
+    if start_task is None:
+        bb.fatal("Couldn't find %s in BB_TASKDEPDATA?" % pn + ":do_" + fee=
dtaskname)
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
+                if "do_" + taskname in dep:
+                    pkgdeps.add(dep)
+                elif dep not in seen:
+                    new_tasks.append(dep)
+                    seen.add(dep)
+        tasks =3D new_tasks
+    return pkgdeps
--=20
2.41.0


