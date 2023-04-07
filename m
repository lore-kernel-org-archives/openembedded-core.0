Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B681C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 12:59:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web11.7188.1680872358088729670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 05:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=T6K+pE6/;
 spf=pass (domain: welotec.com, ip: 40.107.7.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPZbmgQ1Jakg6azbR/wIbBfEKz05KLtApFpkVySwXh/6+eu3VrweitfHfh9gP+/vv2fZDya8d74oZXPstpQ7/TPWPDj3AeXKNUrJPKagMwIk1mJ5FJcf5PgEXoWyN6+FdFYaV8JiRt0NdmvK1FNErlmUy5ClsfiynxsfPI9eSfdrfGagYBcCxBeSpwIXu5hXwVMf8rDn3pXfgxhR9mvc0tWEH/3Avvp/F/4cFYo3Regh0lEari3YY66hqpISQX/uGdiWWLY2u24QZsmfFW7IwW8Xo7+eRQk+xbn3Z1S0cXSVNpJEY4CX7LU3Ii82nUfn/1YJ7lf86qTSECRDckUelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N4i5u0LcQJXJla6E/b1q6aJfBdfo4NV0z8eTvJbPv0=;
 b=EXiLUfQfSOUh19kveQZY4LkbdyfeIMkeM2G/T8Kue+l3Ebo+ZKnMfS9uMFSg1kiOzjTaFMVSy1ftfxABeUJ11x8umwVpMj57OWzCCTjUUKyPsz7CKNEMgRO9V77wrH7rMCGtXGcihieCF/EAgEb/QQArnuiqhOqXkoIXmlOI2RlQNAi1N9r9ODtc8B8Nq/OZC4BND7DAI3Ej4HDUfnSr4t+U++DR9HIllShvNNQT9AKv6Oi2LnW057TMPu3rPEUTIK/H+8f3jQo1Bujm6qK4yN5YWk7YT2U7ylWpVyT1QPOY8x00fQPtYGH/LnNWhqF/MjipwE92Z6xN/ar0uBEK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N4i5u0LcQJXJla6E/b1q6aJfBdfo4NV0z8eTvJbPv0=;
 b=T6K+pE6/xIPvTQJiD86lN3CKe9PE8yUA7RB5uIrZ0V+kK1ZHoFe09aPGT0zks8Z9+R8USJ5lTcITK08aj6XkK3gXm8rVpX/hqSIFyK9uixkChlDtMWaopR9AphRboqcnmo7pKUCZKk4uo0EeCR758dRedaIovEF1lwaY1N/ioC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 12:59:14 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 12:59:14 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
Subject: [PATCH] tar: extend numeric-owner to ACL entries
Date: Fri,  7 Apr 2023 14:58:46 +0200
Message-ID: <20230407125846.3983045-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0296.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::19) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c977049-7c7d-4feb-9a5d-08db3767e1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6FanMwePkaN2CE0pAB9kuK7pxaNUu0+UUmNG0uPSI4gQbNJC7NQkX18blKxgTO27DAnNGTOGoCpnSSIuVCNKA+matFeUkXYGhKhGsLY4Ohq2A/QQf5TXrfgnwoJlsraBCxcYTTXS91t29xepN5fz+1gFdi+QPLFAOSo0imiJBiAxAveRZNyx6Q1nNaTwaelb/UKqWpegoG1yj+CrbIRiPpfW63NMIhmtFWIqHvldwRWOiIu5AHwqPqGJHYzAtxoTSv2rpMhxbHsI7CawwQpT1y6dpnn+WgZVREjT5HY8h/8JuXHFkV6NhuIWGuxRDyOitnehg3+wIoVthGtxznPHQ/8etFdovvKBGZR8fO+yV3UCE9zfjSoJ53r4pLq6Wg2Uf36967BZJeOFBpuio9OFF3Goo58zibg8H+3REKwY7L5ypOTm+Cc2eMR6iCSkSdDGQdu/5C3pXD4g+KgxYUTkhrVoee7LGU3jwjm5X7yZ3Iq+cnzNOs8BqRgTYZmDnpkZO/6xovulTbxl4dLchs8LW5yd1GMgmjTmyvDd804wQRi1CPA0f4gbSiTTfzaz/mJ1F1uzGv9Omwip260BMZzCdWVlWTtGpgLCKT7BejMJhtfMzmFYg8KD38BXfms0ztk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39830400003)(136003)(396003)(451199021)(36756003)(38350700002)(38100700002)(2906002)(4326008)(5660300002)(66476007)(8936002)(66556008)(86362001)(6916009)(66946007)(8676002)(41300700001)(2616005)(6486002)(83380400001)(66574015)(54906003)(186003)(6512007)(26005)(6506007)(6666004)(1076003)(52116002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hazhpHsDopkQi7YSYjFHoEad5XpODlUXAdpagOZgAc8N1WqROIkLc26TZ6jJ?=
 =?us-ascii?Q?sBBIRhoHwofJddFOTXASfMfL9r1y3IZR2QttlTKKg+ZFzcwdUrrqCG/uToKU?=
 =?us-ascii?Q?Mm0kECF8b9txwLsc5lk4EAztFtN65AvYycLXDMvOiVpCesEDSFCbRvMf+RHh?=
 =?us-ascii?Q?500+29Jtmrk3elOEvWPGnsbihmsJv1Uf5j9NKYRzI6TH+agX9JTVItHzW2yw?=
 =?us-ascii?Q?Df/wYw7ITIwD639WLp2Dj1GymsUIVhXIrTt2JbuVqPmww/66soJ7CdU3+t40?=
 =?us-ascii?Q?DUPZsaJrzF3adTO2PuPgfkMw04EkEuyTKEOmLTObeSQQE+1GMxDe1xqAIh7z?=
 =?us-ascii?Q?uQHbiCtRU+phWj1K94jOU2wOjvBOEXAf4lZpgUSlM8E7C+4CwMn8nsKLQbK+?=
 =?us-ascii?Q?IIjsxoJOQIg/4SA2VLj4WBwADqWqnasL4V4A9NrWzV7TondW0cTGA19ZKCPh?=
 =?us-ascii?Q?SAZ4jTc8Q/FRHZE2RgNSZqVEKYAoqHQbjtC0T/LyujVJ/MKBtGfKtH6NltgU?=
 =?us-ascii?Q?aF80NC57UKTLMkW8U9ADRVXTh75A4BRr6UXGwzXBVzeCMeIxrlBncd+HkFAD?=
 =?us-ascii?Q?AFR/cgUC2Krz1lew9kKEVcGB6fx0EXBf0UgECnYB0GMNakbFxlPPasoUsPWU?=
 =?us-ascii?Q?yJclAZBQWakkTkM+lxm6I2AL8UwdEpGTf+/Id5z4q/uHa0RzrleSS4c4/dJq?=
 =?us-ascii?Q?QeqUS/NEphtcPNE37mMXioqd7XZ697uwu+rsqla3JOp1ekEsMWW7KKJ0oyRE?=
 =?us-ascii?Q?/6SoGmPoIG5Q1CplLcAh0NRuiCYiMVFEBVH2/gA/sMRWzgO6Q3Q4WZGxB/gh?=
 =?us-ascii?Q?yAcwX6OH2NDXSSkpaLzV6iSQdNASqe5cq9uvkqXOQoNgVtiCzpVCP+q3R5yx?=
 =?us-ascii?Q?KdVw1gN54zjPqQjVec12HTEFKwpVzK6qECgPAVU9hslup9+5q3WjkkawOixR?=
 =?us-ascii?Q?y+UBYR/rs3jBCyDkS6yH/rH04Z8xejqx3rj8zDMIXRKBHvvkVnoZA8HyMiYG?=
 =?us-ascii?Q?q1Y0K4rSKqTBXymsOu6s/Lr5QFjrhfSKAsUL2DeaFkMyI3eKBLnJf3+8eNeB?=
 =?us-ascii?Q?XnFbb1njm2ZVcDgMFs8pUNL/PcL6k2RshHPD2JU/8GJ4nNAo6FhUu5GZQsuO?=
 =?us-ascii?Q?Y/oTS3nvXuRmZx6Cc8N/YjcN42NiTDHC3eRRtJOmSuA9bB0qMzLPRDkUKusy?=
 =?us-ascii?Q?/Lm3NiUm/IxbA60cDKmmEM441X0KMboLLWgOOzB4/f+IArJfi46PmiYcKcsr?=
 =?us-ascii?Q?JMVepXxLkA8lISe+bleAkfPXA2rYmTxHZCW7j7NGg776NmUw2sw9kX4ZpBP1?=
 =?us-ascii?Q?NaSjxxrIHPeti5HdLP01iadZr0X47HHbOW3v4Wqh5ORUB89DggVuB//mUeB2?=
 =?us-ascii?Q?vOOW6UJLQDnruG21OiIp3GtnsAXa38f0aVPJq52aYjHnJStLgtqwOLPTBlnD?=
 =?us-ascii?Q?DERp22oXO48JkIKU8rba/sookIpv/djrCVab36lcLxm39t5EJ/F8Jiyg9G3v?=
 =?us-ascii?Q?1USxUwQ/kh8RvaA3caf+CGuv4GiuEczRLv0GsMpivjIFEbbsmgMS07OgLBdk?=
 =?us-ascii?Q?FPoCCpPm7U9XMxXv/5WZe48QhGZ0ywsrp0fvSsug?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c977049-7c7d-4feb-9a5d-08db3767e1c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 12:59:14.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4DGtqt2Xd7px1VTbCYcG5cRWxzrPHaL4t4m52rwDVzEOYlEMsplc3/ACvnvORfQK0viWfqhxBDYZWbevHCZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 12:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179818

ACL entries store references to numeric uids/gids. on platforms that
have libacl, use `acl_to_any_text` to generate ACL strings that preserve
those numeric identifiers if `numeric-owner` is set (instead of doing a
conversion to user/group name, like the acl_to_text function does).

this fixes the following broken scenario (and similar ones, where a
user/group of the stored name exists, but has a different numeric
identifier).

system A with user foo with uid 1001
system B with no user foo
file with ACL referencing uid 1001 on system A

on A:
$ echo 'bar' > file
$ setfacl -m u:foo:r file
$ tar --acls --xattrs --numeric-owner -cf test.tar file
$ tar -vv --acls --xattrs -tf test.tar

expected output:
-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
  a: user::rw-,user:1001:r--,group::r--,mask::r--,other::r--

actual output:
-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
  a: user::rw-,user:fakeuser:r--,group::r--,mask::r--,other::r--

on B:
$ tar --acls --xattrs -xf test.tar
$ getfacl -n file

expected output (extraction) - none
expected output (getfacl):
 # file: file
 # owner: 0
 # group: 0
 user::rw-
 user:1001:r--
 group::r--
 other::r--

actual output (extraction):
tar: file: Warning: Cannot acl_from_text: Invalid argument

actual output (getfacl) - note the missing user entry:
 # file: file
 # owner: 0
 # group: 0
 user::rw-
 group::r--
 other::r--

Fixes: [YOCTO #15099]

Signed-off-by: Fabian Gr=C3=BCnbichler <f.gruenbichler@proxmox.com>
Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...-extend-numeric-owner-to-ACL-entries.patch | 113 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.34.bb         |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/0001-extend-numeric-owner=
-to-ACL-entries.patch

diff --git a/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL=
-entries.patch b/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to=
-ACL-entries.patch
new file mode 100644
index 0000000000..9acce2e90a
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL-entrie=
s.patch
@@ -0,0 +1,113 @@
+From e95db1b5315957181c0255f6ca9607959abac4c3 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Fabian=3D20Gr=3DC3=3DBCnbichler?=3D <f.gruenbichler@prox=
mox.com>
+Date: Wed, 26 Jan 2022 14:54:58 +0100
+Subject: [PATCH] extend numeric-owner to ACL entries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+ACL entries store references to numeric uids/gids. on platforms that
+have libacl, use `acl_to_any_text` to generate ACL strings that preserve
+those numeric identifiers if `numeric-owner` is set (instead of doing a
+conversion to user/group name, like the acl_to_text function does).
+
+this fixes the following broken scenario (and similar ones, where a
+user/group of the stored name exists, but has a different numeric
+identifier).
+
+system A with user foo with uid 1001
+system B with no user foo
+file with ACL referencing uid 1001 on system A
+
+on A:
+$ echo 'bar' > file
+$ setfacl -m u:foo:r file
+$ tar --acls --xattrs --numeric-owner -cf test.tar file
+$ tar -vv --acls --xattrs -tf test.tar
+
+expected output:
+-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
+  a: user::rw-,user:1001:r--,group::r--,mask::r--,other::r--
+
+actual output:
+-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
+  a: user::rw-,user:fakeuser:r--,group::r--,mask::r--,other::r--
+
+on B:
+$ tar --acls --xattrs -xf test.tar
+$ getfacl -n file
+
+expected output (extraction) - none
+expected output (getfacl):
+ # file: file
+ # owner: 0
+ # group: 0
+ user::rw-
+ user:1001:r--
+ group::r--
+ other::r--
+
+actual output (extraction):
+tar: file: Warning: Cannot acl_from_text: Invalid argument
+
+actual output (getfacl) - note the missing user entry:
+ # file: file
+ # owner: 0
+ # group: 0
+ user::rw-
+ group::r--
+ other::r--
+
+Signed-off-by: Fabian Gr=C3=BCnbichler <f.gruenbichler@proxmox.com>
+---
+ src/xattrs.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/xattrs.c b/src/xattrs.c
+index 7c00527c..b319dc68 100644
+--- a/src/xattrs.c
++++ b/src/xattrs.c
+@@ -130,6 +130,10 @@ static struct
+ #ifdef HAVE_POSIX_ACLS
+ # include "acl.h"
+ # include <sys/acl.h>
++#ifdef HAVE_ACL_LIBACL_H
++/* needed for numeric-owner support */
++# include <acl/libacl.h>
++#endif
+ #endif
+=20
+ #ifdef HAVE_POSIX_ACLS
+@@ -362,7 +366,13 @@ xattrs__acls_get_a (int parentfd, const char *file_na=
me,
+       return;
+     }
+=20
+-  val =3D acl_to_text (acl, NULL);
++#ifdef HAVE_ACL_LIBACL_H
++  if (numeric_owner_option)
++    val =3D acl_to_any_text(acl, NULL, '\n', TEXT_SOME_EFFECTIVE | TEXT_N=
UMERIC_IDS);
++  else
++#endif
++    val =3D acl_to_text (acl, NULL);
++
+   acl_free (acl);
+=20
+   if (!val)
+@@ -392,7 +402,13 @@ xattrs__acls_get_d (int parentfd, char const *file_na=
me,
+       return;
+     }
+=20
+-  val =3D acl_to_text (acl, NULL);
++#ifdef HAVE_ACL_LIBACL_H
++  if (numeric_owner_option)
++    val =3D acl_to_any_text(acl, NULL, '\n', TEXT_SOME_EFFECTIVE | TEXT_N=
UMERIC_IDS);
++  else
++    val =3D acl_to_text (acl, NULL);
++#endif
++
+   acl_free (acl);
+=20
+   if (!val)
+--=20
+2.30.2
+
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/=
tar/tar_1.34.bb
index 1ef5fe221e..bf117f600a 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463a=
b874e80d47fae504"
=20
 SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://CVE-2022-48303.patch \
+           file://0001-extend-numeric-owner-to-ACL-entries.patch \
 "
=20
 SRC_URI[sha256sum] =3D "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a=
511079255646ff"
--=20
2.34.1


