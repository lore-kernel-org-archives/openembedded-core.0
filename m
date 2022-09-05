Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BBDECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 13:06:33 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.48])
 by mx.groups.io with SMTP id smtpd.web12.24576.1662383191255423790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 06:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KUEMo0Ps;
 spf=pass (domain: kpit.com, ip: 40.107.222.48,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKSPloMzi25obrqcYK3R62Ot4/sNU8HAjBPYQvu0ayuoTxQM6fK12FrIC4p3xDK+H8Dm38TvPVQFdIXU8hLolUOJJKb3yOUisAiJVidClPILftb94ZBb1AurDggCEG0EzPDE4k3bZSai4V+h64SRFoYtCADOpQV/zh2lHCq2tirUA+8oAi6vtYMxn6nY8I2JVj5UMSxIOUiM/QxW7fhyd1R8DkodlNIPQm4WsJpPePk2QFaeS12CY++7CPPqu1FP6ZIOKM8Jeadfqsp+tpmHUU0fzTZwR7sXl0IY3nKUv4Qcm/5+XeuOuV6Px4ganSO+lkQBuVxD6st7wA3g0VGPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFBYaNqAXwaoVJiZs5ZgECjliIruxAnHx3+yzPhdsHI=;
 b=iyMPQDKn4et+g3RWaD+RGxNAEfJk6SxQll5uL8CKN5X7pvgCl0YdcWhOeQlsQJQVwo+NNtesu0NngqNtxYX9rM87XtYYz4QdIh1tssgbHm93Ycs3kV5sHGpmAMz0Y9zeuzrk3joArow/IP1gSHxYRC2q6Uhj377/O8umYyKIYXh+NUcgdt5FtZ0KrwsRgrl+XuxJvP+s00q5NQpc1hqlzQn8nhzM/PAMIQ688fXcOibfy2qIydRZTjNzdRmtAcZEFWhX8zcdL2UvrGNMWKCvKOjfZLNDkOfhEg9KEPm5wCqzRMv4lbFHjHD/dwZBS2ExuRDIt72V/Z/EYKm9SZl1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFBYaNqAXwaoVJiZs5ZgECjliIruxAnHx3+yzPhdsHI=;
 b=KUEMo0PsalovCGS/wnOraubLc0XV3DuPPg4/1x3Ko43EsbF9qX3f8yiLOV5vWGD8TcyUunbi3qRTZmjrc8qJCsUmfpvx7Y2C08o6Ik6qy2aCrlzXFMj7Ea89EOQlktytwXvkGkq13g9NPieyR6o5Y8gZ7mLXk2GGSW96BTtSLOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB8086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 13:06:24 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a%5]) with mapi id 15.20.5588.017; Mon, 5 Sep 2022
 13:06:24 +0000
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-23177 issue
Date: Mon,  5 Sep 2022 18:36:07 +0530
Message-Id: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b748d4b9-f56a-4fc7-3734-08da8f3f6f16
X-MS-TrafficTypeDiagnostic: MA0PR01MB8086:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IaQ4xDxb8+PCSsNuIY5JxVXJ/Nw0MBMXd9wR57K67YsrnxGYVqc19PgFE+dC3UfSRKDlJWhjqyFHwAbwnQn5uMRRyCeuAlMUTmY/oagr9lgMMjWPZ3cz27t5V0QO5urEE4EwQDQMq1hih8nmXkwxjwa+XdTOKm2YME4W8+zZ4yj9bTmZbyeRbgcW/VtrY9fo2kpWQqEgu5VOHN9XFDTbhqmPR9viu0lgA3mOtBmiZmG2nUGMzbJHSgTYCWHaWTbGc7hDM83sVnzI84glaeamizJf9S/fAUlK8k/2LHW9yOjQl/CEaTeEUEmeD9b6Aa0S9qfRXzEnu1/yH+jtIPtCYjVFY1nWdftY2EpM3q/8HshZ09rFahzuwv95sL4YobLp+gGsLt62YUGebbT3nO9m3oNNRvxa//kHZM6C+uR1zRW18sdZB3A0j2Nfm9po/XKOKZB5LUKOhzHzLh+qaz/5bHxvnW+WvMMO5SYyJMc5/5AOpSoGn4DAi1tnvw588lVqBiUsf0rSB7JxXXdyYEYcD4V+WpI++U0FNvBNxmu9dWjNqkQiCN1iGHYG1nOQ6bmWxcBzwuZYAzelzyYtHAD9fhx2Wwa69OGE8BQaIEIy9ETHsDqoNMPdtldxMJLm3Mxs1JsdjMYUdmXoIBeMqDYP+XW7kA3dunF1ogkuA3fru1QkU8UwHkN+/quSVwE/xzZrwfuD36b3tk1PjFO+iHgO8Ysvs9SlGFUNWjzSuusSY/V2GuLV1F1rNnlmS2o62auJRYGaM5aYaLgOzQiw2I0MqCc87EXS9mlSEZ7j1ulnhNQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(186003)(1076003)(2616005)(26005)(52116002)(6666004)(6512007)(41300700001)(6506007)(4001150100001)(8676002)(66476007)(66556008)(66946007)(44832011)(5660300002)(2906002)(66574015)(8936002)(478600001)(966005)(6916009)(6486002)(38350700002)(83380400001)(38100700002)(316002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6bpSz1rI9Mm1FEsWutbq8byQAaclL0KgmaNl0X0lMdwak50a55b4aHzoytVQ?=
 =?us-ascii?Q?NlocWVcGR4AhZji4tBwEmeW1u6R7R4s39LrIq0h3F1my8UJku6kHrJqp106b?=
 =?us-ascii?Q?hzwTlapaO4E0H+H4O9z80yRabc9+wgUvSXhkJbsw4FXVmOSS7SG3buENWMn5?=
 =?us-ascii?Q?VpO/CXSdT7DHnODM9oTEaj20INH1Fj6IAvqFwDR3NkaiZAz0zBKmLYgsSUoZ?=
 =?us-ascii?Q?1zq7cu/BvXkWxZp0f2gDGLpi06rX6bmsfZXvkidqOdUMKiojlyVysW9VApcS?=
 =?us-ascii?Q?YQhH9RLNiGKFZ8s8X7Dg+PnxEPA/5YJyEXYRogXss+UM2D93jaymiwz0yC6L?=
 =?us-ascii?Q?J6UB0FAmxVsLfqRzJhQHn0K6p7ggL3wGH1c6U4K4Ay8duW7V8FuD3+9OCJth?=
 =?us-ascii?Q?Q/oGwpJaNvpIsIpP7Wn5OFbV9e66U2W+jq3Qru/gStK3NzGDpIelf4Duwep8?=
 =?us-ascii?Q?Eh34yli+ryus1d1Hx5IKJyoVQ144EfSrlFGgQPld9tAyiajyv3oKksNLBTLa?=
 =?us-ascii?Q?dG0Em+bCrttXlXd5zO6GiSSSEU3AvFbCjQMIkj3p3A2n5JhBpipMzIAXCTkr?=
 =?us-ascii?Q?u8fl6qRsGilwNWJs9qOhzrOd5dsZYvDrEgRLLWWoQP7JlQgFTZJDDkPKsojE?=
 =?us-ascii?Q?YOssoyMkooCfx15OyXeZty3CYL3XtmXuFdMZEOq56mCPOd5gT4wBEDZGwOQp?=
 =?us-ascii?Q?c4+vTMAa+enN3lE8V1glZs7+jHD/siibkuhTvy9G0Wu7UpcTVflwGuNcgPrX?=
 =?us-ascii?Q?NSyQdKr6mFzX/DSYyK9hdeVCz5HntIcxUPDoOSqfArHAPxHHwSJg3ezvHyTS?=
 =?us-ascii?Q?yERw2En/xY91Sn3Tq3FyoqiY/QoefkSpUysC0Wa4U4CMgkuY5wLjtHaQeAku?=
 =?us-ascii?Q?keByRG4OgWNMnz4clYoEtYrNkSumdNN5ZaSplJ0JFKrDm+hZ0O1436+F2b6j?=
 =?us-ascii?Q?CVJV/kbaSzm800PbARloE7dPjbJ5Zu4QQG7XvJQkxU4rxQSr+bC7TqewcK+1?=
 =?us-ascii?Q?Esdeh/5qnjpHPQnJ4byDGUOqmxNtrrS0ETTp51UmqHI4f9b8i+D06Qkg3Gp2?=
 =?us-ascii?Q?zCWf06F0j2SwWFEspEBgs9GdoMxlRb/jHc6ItKy/Q9PKd2gSiwC+3fm9YGMc?=
 =?us-ascii?Q?XGPRJ5OKNjPOBg6e47Vdgl3RcetlCzOmyWnYmeU7uh0LfjifFW4pMrlDV6Gq?=
 =?us-ascii?Q?t1qAd9VarTpONHJGaaWtgDdyJ20W8npPO5mhpjRRsGmAEIzNpclutDpN8mk9?=
 =?us-ascii?Q?XnwJPu+Zh6u39MU3H1pNwDrx+G3q6aUUjCpE2CspFRuEAXZk6zoha9dAluH/?=
 =?us-ascii?Q?JdH9lw2WCobGIVTpItfTSlWwa4CtGPCbrbZAnRKBpeTibh80Xqcce6j5PsG6?=
 =?us-ascii?Q?SGkg/l/WPQLc2atVaZ8fVKuOk+HU5zkHbOn3RDABO4hp0X0yumAFUwZuIeb2?=
 =?us-ascii?Q?IIQk5fRiN0G+WCG1y7YQZD0piJFLrnlQMhBymxlclMSEQqU/IKdYe6IQ6/IU?=
 =?us-ascii?Q?oajNiwE/aty9Au8Ub37S0YSBTZGT8VkH9yQshQHWuxrZYrN1++zPxMXWZb8O?=
 =?us-ascii?Q?iRBrhFisg81YqjB/vRE58Kh/lANFomdvV8CMnLX/?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b748d4b9-f56a-4fc7-3734-08da8f3f6f16
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:06:23.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j3PzbDzFAUohTw8n6MC0QkgtfbXs7TPLTnKvEkgk85r0h9nYRsr1pvGp9+gSHpu/viHvBSq5219bZnFWa+loaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 13:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170314

Add patch to fix CVE-2021-23177 issue for libarchive
Link: http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4=
.3-2+deb11u1.debian.tar.xz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-23=
177.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
new file mode 100644
index 0000000000..555c7a47f7
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
@@ -0,0 +1,183 @@
+Description: Fix handling of symbolic link ACLs
+ Published as CVE-2021-23177
+Origin: upstream, https://github.com/libarchive/libarchive/commit/fba4f123=
cc456d2b2538f811bb831483bf336bad
+Bug-Debian: https://bugs.debian.org/1001986
+Author: Martin Matuska <martin@matuska.org>
+Last-Updated: 2021-12-20
+
+CVE: CVE-2021-23177
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/lib=
archive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/libarchive/archive_disk_acl_freebsd.c
++++ b/libarchive/archive_disk_acl_freebsd.c
+@@ -319,7 +319,7 @@
+
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+       int              acl_type =3D 0;
+@@ -364,6 +364,13 @@
+               return (ARCHIVE_FAILED);
+       }
+
++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
++              errno =3D EINVAL;
++              archive_set_error(a, errno,
++                  "Cannot set default ACL on non-directory");
++              return (ARCHIVE_WARN);
++      }
++
+       acl =3D acl_init(entries);
+       if (acl =3D=3D (acl_t)NULL) {
+               archive_set_error(a, errno,
+@@ -542,7 +549,10 @@
+       else if (acl_set_link_np(name, acl_type, acl) !=3D 0)
+ #else
+       /* FreeBSD older than 8.0 */
+-      else if (acl_set_file(name, acl_type, acl) !=3D 0)
++      else if (S_ISLNK(mode)) {
++          /* acl_set_file() follows symbolic links, skip */
++          ret =3D ARCHIVE_OK;
++      } else if (acl_set_file(name, acl_type, acl) !=3D 0)
+ #endif
+       {
+               if (errno =3D=3D EOPNOTSUPP) {
+@@ -677,14 +687,14 @@
+           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
+               if ((archive_acl_types(abstract_acl)
+                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
+-                      ret =3D set_acl(a, fd, name, abstract_acl,
++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
+                       if (ret !=3D ARCHIVE_OK)
+                               return (ret);
+               }
+               if ((archive_acl_types(abstract_acl)
+                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
+-                      ret =3D set_acl(a, fd, name, abstract_acl,
++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
+
+               /* Simultaneous POSIX.1e and NFSv4 is not supported */
+@@ -693,7 +703,7 @@
+ #if ARCHIVE_ACL_FREEBSD_NFS4
+       else if ((archive_acl_types(abstract_acl) &
+           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
+-              ret =3D set_acl(a, fd, name, abstract_acl,
++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
+       }
+ #endif
+--- a/libarchive/archive_disk_acl_linux.c
++++ b/libarchive/archive_disk_acl_linux.c
+@@ -343,6 +343,11 @@
+               return (ARCHIVE_FAILED);
+       }
+
++      if (S_ISLNK(mode)) {
++              /* Linux does not support RichACLs on symbolic links */
++              return (ARCHIVE_OK);
++      }
++
+       richacl =3D richacl_alloc(entries);
+       if (richacl =3D=3D NULL) {
+               archive_set_error(a, errno,
+@@ -455,7 +460,7 @@
+ #if ARCHIVE_ACL_LIBACL
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+       int              acl_type =3D 0;
+@@ -488,6 +493,18 @@
+               return (ARCHIVE_FAILED);
+       }
+
++      if (S_ISLNK(mode)) {
++              /* Linux does not support ACLs on symbolic links */
++              return (ARCHIVE_OK);
++      }
++
++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
++              errno =3D EINVAL;
++              archive_set_error(a, errno,
++                  "Cannot set default ACL on non-directory");
++              return (ARCHIVE_WARN);
++      }
++
+       acl =3D acl_init(entries);
+       if (acl =3D=3D (acl_t)NULL) {
+               archive_set_error(a, errno,
+@@ -727,14 +744,14 @@
+           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
+               if ((archive_acl_types(abstract_acl)
+                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
+-                      ret =3D set_acl(a, fd, name, abstract_acl,
++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
+                       if (ret !=3D ARCHIVE_OK)
+                               return (ret);
+               }
+               if ((archive_acl_types(abstract_acl)
+                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
+-                      ret =3D set_acl(a, fd, name, abstract_acl,
++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
+       }
+ #endif        /* ARCHIVE_ACL_LIBACL */
+--- a/libarchive/archive_disk_acl_sunos.c
++++ b/libarchive/archive_disk_acl_sunos.c
+@@ -443,7 +443,7 @@
+
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+       aclent_t         *aclent;
+@@ -467,7 +467,6 @@
+       if (entries =3D=3D 0)
+               return (ARCHIVE_OK);
+
+-
+       switch (ae_requested_type) {
+       case ARCHIVE_ENTRY_ACL_TYPE_POSIX1E:
+               cmd =3D SETACL;
+@@ -492,6 +491,12 @@
+               return (ARCHIVE_FAILED);
+       }
+
++        if (S_ISLNK(mode)) {
++                /* Skip ACLs on symbolic links */
++              ret =3D ARCHIVE_OK;
++              goto exit_free;
++        }
++
+       e =3D 0;
+
+       while (archive_acl_next(a, abstract_acl, ae_requested_type, &ae_typ=
e,
+@@ -801,7 +806,7 @@
+       if ((archive_acl_types(abstract_acl)
+           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
+               /* Solaris writes POSIX.1e access and default ACLs together=
 */
+-              ret =3D set_acl(a, fd, name, abstract_acl,
++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                   ARCHIVE_ENTRY_ACL_TYPE_POSIX1E, "posix1e");
+
+               /* Simultaneous POSIX.1e and NFSv4 is not supported */
+@@ -810,7 +815,7 @@
+ #if ARCHIVE_ACL_SUNOS_NFS4
+       else if ((archive_acl_types(abstract_acl) &
+           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
+-              ret =3D set_acl(a, fd, name, abstract_acl,
++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
+                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
+       }
+ #endif
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.4.2.bb
index b7426a1be8..d8ed80686b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \
            file://CVE-2021-36976-1.patch \
            file://CVE-2021-36976-2.patch \
            file://CVE-2021-36976-3.patch \
+           file://CVE-2021-23177.patch \
 "

 SRC_URI[md5sum] =3D "d953ed6b47694dadf0e6042f8f9ff451"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

