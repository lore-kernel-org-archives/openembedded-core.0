Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD214C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:44:57 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8624.1785235487325636887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aq1hi/qA;
 spf=pass (domain: est.tech, ip: 40.107.159.20, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxAq6KdGFp72OCeYa/QxoJFuF4o/05erVjiPOzKVwrtqXmriQK12grjuxUMvXW2RbQ1fM56nR7syv0bAeX2JD2TjNG/4UW5NCdGmMkIcwaC5bPqeDxBet04LU3DH4PjhjBBdQc5giVkm14S/XeNzOagrtL9K+9ogxs2LCPR3O4j73OD0JafC7dgptFGRUete6be8Q6BRx5Mcd5FbbMQT0fRZLe+EaXWgHMRxC3J8elSDuKdJJK+VTy1mggr9EVU2g15S2xXB60h3pnJnueX9J2aL2jV8JgKNlyr2gMZFjedLwkiKW0oVYHOLivUf0qncsyxxZnZF+qJSomwQmIMrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSCBvzkjocOLeqYuUv5sUUnqEKB4t/mo4uBnHFXdQSE=;
 b=xW5e1kjzJHEvX30G8sig8nuLqLZLJZldfqd2jhmiFQvywkUk3jA3cuw3/behwqz+iVWTw3JnOD4nZ6H6/yJRne2uFQTthzyvPwGkcy68MbdOV+AUNDzr4iRDCclsrjH/YtDjAlATmd3GVagnjIqEjLgE8ILSuAQqyZflh290nAlgQ+lu/ouc2fefFMz9GeVCh0rc7ocbrRppjN7is/s9p7THmyrQM8GrOur9lz3R6AzbeAO4cJBV6lwfPylcQjlqnBHYMIU3MS664GhbYnqItcPRqwKD/8HaX/2TGnLy+87d34XK5HSR5G4V76cScgPauq0g4XLg9lRLE47lcnW7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSCBvzkjocOLeqYuUv5sUUnqEKB4t/mo4uBnHFXdQSE=;
 b=aq1hi/qAqkwH6MiDj3dlaa3jtY2Jx+XHJpvyPiNoYvlHGDx3tMyNmZ7+E6VgWfedxVxu2Ph6aDOSj7tjWLdaffUdTyN5S8zEJsnQW1HQtrNAUTgDfBa+c72owrNsGvCpKPLc+Jd4zKLhadUlpAW/l34Wy5RMmRcr/TkwntU6yPt6RIWQPuCLG7u8qOcBh3VoM36sf3HQfbnf+4iTfd6HqZEsxvRDr5bL5mMb4f0pkcpaCMAyeIUDAAuKwveSW5afrFW4xCM6FC+6iCVOlvsXqgnnMck8PYehbcggQwt8E25l5xARPn8nPRUOyw/J5sRAJSljtbZewyCe+NX0A+ArQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2246.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:44:40 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0270.006; Tue, 28 Jul 2026
 10:44:39 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] wget: fix CVE-2026-58472
Date: Tue, 28 Jul 2026 12:44:20 +0200
Message-ID: <20260728104433.27561-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::10) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2246:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d7aaa3-97f0-48c2-6987-08deec9539ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|56012099006|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	mCL37g3oQoKkR8hGMCUKlldgND+F9H++xOxQQUzU9ZGpCtMlExv+5UmDnfObZ5TfrSY7F4nLaChk0ZaTEZrQoGG1pLPT9WEADcTx5T930FhWxZl77sTU7qVv8FcQzOkupQ8DEwUH/CUp74pvONrZiypfdLsLmLWYNIGIinSqa+J7Fcr3FVr3c+ciNCeS2np5s1FJ92GdOBOoUHgbTlcwTcy5mCzKcOX60XHf7giCnAyqKhptFQTWPOXK8sGt6hoKSaXkNuI4w4pcP51OnUYh64qO/xVWiFa57fuW/i+o4QqeTLNKRHAy2Uf5Xru0l81J24Gndgcevp+mEIQJBhwRFsswN4xXuFNCxn4m96IsJVOiEcFSULWrII8GKG9ZNVIcmTmPMBoEZrsQ99/yz/j4SNDARlmFipUy+sh6xeslBD7T/oz0Of6QUWzZcVJCoSZK/46+KY4FSCl5tjfkCQcln0oXU+RPu/kVsgxqW9Dx0H3Cq3QJfYA6sAVWsfWOVlbLl/CR2yu0HJXVsfh58CaIXqPYixRXSWPZ1Xy78JOzVtKYawbP0ujSluDr5gMaR4Dh3872I1JUICenPf01Jk1Rwp7esP+UPVR/7udR+LPDYhU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?14bBxQCgjhOb3zh9k/IB+GIljLx0nkEIlEesqqv+Zc+J3pkEkg8pXnXtxo6z?=
 =?us-ascii?Q?k4SMW/Q3Mqh3n5N6tSy2/JBQ22+0VHidZtrup48d7pQBegVKgCxv8CprHfJC?=
 =?us-ascii?Q?MKtrxIEvRtD5OO8Nu3oBIJu8fq4/wO7o+qsgTQW/2Smwx/BP0do2OfCMBIPF?=
 =?us-ascii?Q?4zBnphGNk99gYRoaBV/PIrKKSNmMrLGxno2D2hNhxvS8cXZMuOJw4T9Kr3MF?=
 =?us-ascii?Q?n6UXGKU2lm+aova4p4trqnZTlwMoATEHxycpwIE1I02hXAzOeSNqb8N1QWwM?=
 =?us-ascii?Q?11L6yEfY+FodGLH2W1LU7aBP6Wi7HUuuwNLiaPw6Z01mPyTJsxJatpyIxm32?=
 =?us-ascii?Q?f5ulVutGVAvVdq6/O3yQW/Dd1QXRkdkqtWNwOzH802U05Bv1i6oovLUqIQX0?=
 =?us-ascii?Q?OI2fzAKAGt+E0SqqsmlrQUCFNKiYh++921SS/N6fc0FAQntYcpYdbek7tlVk?=
 =?us-ascii?Q?v1CmKVQA9g+F/voQORyZ0s0cyfmQ3rOaqfpalqzmn9NxrcfZrE05bc8dcHjv?=
 =?us-ascii?Q?ROwDT3Gy1wNrLO29XVuRddBXxNWOEGx/iIhb1nkJ6sH0ucVE8A1YMXaoKdaS?=
 =?us-ascii?Q?oYEFY6IcxJXS/mGgrHxDwZmfj1hnZfLXQWXNLS4ygykSlVnd48zj0mx06ZA5?=
 =?us-ascii?Q?ULjPRFHXf42+Hm51GHC8IOwM83it9IE2Bym4S8M9KfsTXSMw8Ck18chA6B8D?=
 =?us-ascii?Q?RrymtV6WjGSSDDMoQ/TYXMjKMR3KhwmoB0WDZC0TynOgN3GFn9cT0+ic5pwb?=
 =?us-ascii?Q?CR3TWKc9GpdkU5Dc35SOPtkAZJgDtmw9O2cCUlARY0OHJAs4Yl4R/JWxBM/V?=
 =?us-ascii?Q?CZZQJDLEGhvaZ/HIJue2jFJ42+cgESq1iMLGn31l6l+XFcny+DKKIaKXC8P7?=
 =?us-ascii?Q?xJReaCBJYYzvESve0xhS5Y8Um8hCld49LAc6tdbcAd9MkyllyrXj8+1rVQ4R?=
 =?us-ascii?Q?moHMs7pdq/sU75LZ59gXiT+hH/x5RfAZkHecdVzuuD0EUBR4MCyXyTVjS5Jn?=
 =?us-ascii?Q?6GsUG79z0xiXR3jrKlm/RqF0ikw0mbqqXO4sS9Nm06z+Igg3OCfcrjmI0fdq?=
 =?us-ascii?Q?zQsmveFyuulkhAKeiS6RdkM6KzdMsv6ORAWQEMWBVgnlaUr0fScCdAQoPLWl?=
 =?us-ascii?Q?qD9rAc8C6E1q7TmCw3YGmrersAxoRDAFXtcbDB2k1Xt3Sse425Lxs1E+73O8?=
 =?us-ascii?Q?hm/16gfJPBq7NfEdvux4K4vlpk4YhqODJtfVPF8qtaIVe9QePLDfk9+WYian?=
 =?us-ascii?Q?bXBenNUg91Iz1iP3JuFrbRQ2BPShINUex7Cp9AYy6gVMg1LQ9rmFQa+S2dmy?=
 =?us-ascii?Q?DwhRevy2FMRTg1IPpZpAn0YvYjqInNOkNKdnA7Gm1BunYZn10/4itGgkCOAn?=
 =?us-ascii?Q?f4ksOjDrYVNM4bcTPB/1uyFqw7ZCj45X6I3+ahRPxN9+KppZOc20gTtJ65Xf?=
 =?us-ascii?Q?iP6Pt+ThECdnSP2zyD8ZxRf69bv9WHhJ+nBR4+ZDUFJpZPyaXPdhV6W0rKfX?=
 =?us-ascii?Q?ksHLwPEi+TTK4zv0K7Rys7Fk7MkUAYx839d8PmBZcGfeL3RPw3kvYZ/+ulIZ?=
 =?us-ascii?Q?wASEfXkL4JkvYuoc2ZfDEBfBstv3s/LPMMkihdIncKoSpD532hQJ323zafBy?=
 =?us-ascii?Q?nyLn0pO8Ccfu5VPjVw28qlfVNt02tSZePchfknsDiI14vjLg6TFIZgWeWjNG?=
 =?us-ascii?Q?m57tDTWRH2TQQoPZ2Oc+EgluezmM4hfUu/hoToH/YDl2pnIs98RJJHle+oZS?=
 =?us-ascii?Q?AWFfZC6J1g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d7aaa3-97f0-48c2-6987-08deec9539ad
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:44:39.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXi313i/sMHigTC9fZzL1AkqJ806xcpVkMU2CIQgAPDbQ4q46Filb2BazKbbOOiPnb/rvbhiwwpq/bHRGTminQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242182

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58472.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58472
  https://www.cve.org/CVERecord?id=3DCVE-2026-58472
  https://security-tracker.debian.org/tracker/CVE-2026-58472
  https://ubuntu.com/security/CVE-2026-58472
  https://osv.dev/list?q=3DCVE-2026-58472

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e7=
5587a812 [nvd]
  https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb731=
97a38ca2

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58472-regression.patch | 235 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  73 ++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   2 +
 3 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regressi=
on.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patc=
h b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
new file mode 100644
index 0000000000..f8b532292f
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
@@ -0,0 +1,235 @@
+From f76978a51ba9365e7ecaed96c1cfb73197a38ca2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Thu, 2 Jul 2026 13:13:07 +0200
+Subject: [PATCH] Regression: Fix buffer overflow in html_quote_string()
+
+The regression has been introduced in commit dd692d9 and
+is not part of any release.
+
+The tests allow the address sanitizer to find the issue.
+
+* src/convert.c: Fix string size calculation.
+* tests/unit-tests.c: Added tests including tests for html_quote_string().
+* tests/unit-tests.h: Add definitions for the test functions.
+
+Reported-by: Trung Nguyen <trungnh@cystack.net>
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/f76978=
a51ba9365e7ecaed96c1cfb73197a38ca2]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/convert.c      | 148 +++++++++++++++++++++++++++++++++++++++++++--
+ tests/unit-tests.c |   4 ++
+ tests/unit-tests.h |   4 ++
+ 3 files changed, 152 insertions(+), 4 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index 3baec850..482676d9 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -48,6 +48,9 @@ as that of the covered work.  */
+ #include "css-url.h"
+ #include "iri.h"
+ #include "xstrndup.h"
++#ifdef TESTING
++#include "../tests/unit-tests.h"
++#endif
+=20
+ static struct hash_table *dl_file_url_map;
+ struct hash_table *dl_url_file_map;
+@@ -1186,13 +1189,13 @@ html_quote_string (const char *s)
+   for (i =3D 0; *s; s++)
+     {
+       if (*s =3D=3D '&')
+-        ok =3D INT_ADD_OK (i, 4, &i);     /* `amp;' */
++        ok =3D INT_ADD_OK (i, 4 + 1, &i);     /* `amp;' */
+       else if (*s =3D=3D '<' || *s =3D=3D '>')
+-        ok =3D INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
++        ok =3D INT_ADD_OK (i, 3 + 1, &i);     /* `lt;' and `gt;' */
+       else if (*s =3D=3D '\"')
+-        ok =3D INT_ADD_OK (i, 5, &i);     /* `quot;' */
++        ok =3D INT_ADD_OK (i, 5 + 1, &i);     /* `quot;' */
+       else if (*s =3D=3D ' ')
+-        ok =3D INT_ADD_OK (i, 4, &i);     /* #32; */
++        ok =3D INT_ADD_OK (i, 4 + 1, &i);     /* #32; */
+       else
+         ok =3D INT_ADD_OK (i, 1, &i);
+=20
+@@ -1251,6 +1254,143 @@ html_quote_string (const char *s)
+   return res;
+ }
+=20
++#ifdef TESTING
++
++const char *
++test_construct_relative (void)
++{
++  static const struct {
++    const char *basefile;
++    const char *linkfile;
++    const char *expected;
++  } test_array[] =3D {
++    { "foo", "bar", "bar" },
++    { "A/foo", "A/bar", "bar" },
++    { "A/foo", "A/B/bar", "B/bar" },
++    { "A/X/foo", "A/Y/bar", "../Y/bar" },
++    { "X/", "Y/bar", "../Y/bar" },
++    { "/foo", "/bar", "bar" },
++    { "/a/b/c", "/a/b/d", "d" },
++    { "/a/b/c", "/a/b/c/d", "c/d" },
++    { "/a/b/c", "/a/b/c/d/e", "c/d/e" },
++    { "/a/b/c", "/x/y/z", "../../x/y/z" },
++    { "a/b", "c/d", "../c/d" },
++    { "./foo", "./bar", "bar" },
++  };
++
++  for (unsigned i =3D 0; i < countof (test_array); ++i)
++    {
++      char *result =3D construct_relative (test_array[i].basefile,
++                                         test_array[i].linkfile);
++      mu_assert ("test_construct_relative: wrong result",
++                 strcmp (result, test_array[i].expected) =3D=3D 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++const char *
++test_match_except_index (void)
++{
++  static const struct {
++    const char *s1;
++    const char *s2;
++    bool expected;
++  } test_array[] =3D {
++    { "foo/index.html", "foo/", true },
++    { "foo/", "foo/index.html", true },
++    { "foo", "foo/index.html", true },
++    { "foo", "foo/", true },
++    { "foo", "foo", true },
++    { "/foo/index.html", "/foo/", true },
++    { "/foo/", "/foo/index.html", true },
++    { "/foo", "/foo/index.html", true },
++    { "/foo", "/foo/", true },
++    { "foo/bar", "foo/qux", false },
++    { "foo/bar", "bar/foo", false },
++  };
++
++  for (unsigned i =3D 0; i < countof (test_array); ++i)
++    {
++      bool result =3D match_except_index (test_array[i].s1, test_array[i]=
.s2);
++      mu_assert ("test_match_except_index: wrong result",
++                 result =3D=3D test_array[i].expected);
++    }
++
++  return NULL;
++}
++
++const char *
++test_find_fragment (void)
++{
++  static const struct {
++    const char *input;
++    int size;
++    bool has_fragment;
++    const char *fragment;
++  } test_array[] =3D {
++    { "http://example.com#section", 26, true, "#section" },
++    { "http://example.com", 18, false, NULL },
++    { "http://example.com?a=3D1#frag", 24, true, "#frag" },
++    { "http://example.com?a=3D1%26#frag", 28, true, "#frag" },
++    { "http://example.com?a=3D1&b=3D2#frag", 30, true, "#frag" },
++    { "a#b", 3, true, "#b" },
++    { "a", 1, false, NULL },
++  };
++  const char *bp, *ep;
++
++  for (unsigned i =3D 0; i < countof (test_array); ++i)
++    {
++      bool result =3D find_fragment (test_array[i].input,
++                                   test_array[i].size, &bp, &ep);
++      mu_assert ("test_find_fragment: wrong result",
++                 result =3D=3D test_array[i].has_fragment);
++      if (test_array[i].has_fragment)
++        {
++          mu_assert ("test_find_fragment: wrong fragment", bp !=3D NULL);
++          mu_assert ("test_find_fragment: fragment mismatch",
++                     strncmp (bp, test_array[i].fragment,
++                              strlen (test_array[i].fragment)) =3D=3D 0 &=
&
++                     ep =3D=3D test_array[i].input + test_array[i].size);
++        }
++    }
++
++  return NULL;
++}
++
++const char *
++test_html_quote_string (void)
++{
++  static const struct {
++    const char *input;
++    const char *expected;
++  } test_array[] =3D {
++    { "hello", "hello" },
++    { "a&b", "a&amp;b" },
++    { "<tag>", "&lt;tag&gt;" },
++    { "\"quote\"", "&quot;quote&quot;" },
++    { "space here", "space&#32;here" },
++    { "&<>\" ", "&amp;&lt;&gt;&quot;&#32;" },
++    { "no special", "no&#32;special" },
++    { "&&&&", "&amp;&amp;&amp;&amp;" },
++    { "<<>>", "&lt;&lt;&gt;&gt;" },
++    { "" , "" },
++  };
++
++  for (unsigned i =3D 0; i < countof (test_array); ++i)
++    {
++      char *result =3D html_quote_string (test_array[i].input);
++      mu_assert ("test_html_quote_string: wrong result",
++                 strcmp (result, test_array[i].expected) =3D=3D 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++#endif /* TESTING */
++
+ /*
+  * vim: et ts=3D2 sw=3D2
+  */
+diff --git a/tests/unit-tests.c b/tests/unit-tests.c
+index e9695e98..0a820ae6 100644
+--- a/tests/unit-tests.c
++++ b/tests/unit-tests.c
+@@ -68,6 +68,10 @@ all_tests(void)
+ #endif
+   mu_run_test (test_parse_netrc);
+   mu_run_test (test_retr_rate);
++  mu_run_test (test_construct_relative);
++  mu_run_test (test_match_except_index);
++  mu_run_test (test_find_fragment);
++  mu_run_test (test_html_quote_string);
+=20
+   return NULL;
+ }
+diff --git a/tests/unit-tests.h b/tests/unit-tests.h
+index 4402c017..9ad1957e 100644
+--- a/tests/unit-tests.h
++++ b/tests/unit-tests.h
+@@ -64,6 +64,10 @@ const char *test_hsts_url_rewrite_congruent(void);
+ const char *test_hsts_read_database(void);
+ const char *test_parse_netrc(void);
+ const char *test_retr_rate(void);
++const char *test_construct_relative(void);
++const char *test_match_except_index(void);
++const char *test_find_fragment(void);
++const char *test_html_quote_string(void);
+=20
+ #endif /* TEST_H */
+=20
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 0000000000..96d01e735e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,73 @@
+From 132786a69d88d8afd376fa2d0193b47a54396533 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 19:13:15 +0200
+Subject: [PATCH] * src/convert.c (html_quote_string): Fix integer+buffer
+ overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/dd692d=
9cea5335b181d877ae917fe6e75587a812]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/convert.c | 31 ++++++++++++++++++++++++-------
+ 1 file changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index b934d49b..51636340 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -36,6 +36,7 @@ as that of the covered work.  */
+ #include <unistd.h>
+ #include <errno.h>
+ #include <assert.h>
++#include <intprops.h>
+ #include "convert.h"
+ #include "url.h"
+ #include "recur.h"
+@@ -1169,21 +1170,37 @@ html_quote_string (const char *s)
+ {
+   const char *b =3D s;
+   char *p, *res;
+-  int i;
++  size_t i;
++  int ok;
+=20
+   /* Pass through the string, and count the new size.  */
+-  for (i =3D 0; *s; s++, i++)
++  for (i =3D 0; *s; s++)
+     {
+       if (*s =3D=3D '&')
+-        i +=3D 4;                 /* `amp;' */
++        ok =3D INT_ADD_OK (i, 4, &i);     /* `amp;' */
+       else if (*s =3D=3D '<' || *s =3D=3D '>')
+-        i +=3D 3;                 /* `lt;' and `gt;' */
++        ok =3D INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
+       else if (*s =3D=3D '\"')
+-        i +=3D 5;                 /* `quot;' */
++        ok =3D INT_ADD_OK (i, 5, &i);     /* `quot;' */
+       else if (*s =3D=3D ' ')
+-        i +=3D 4;                 /* #32; */
++        ok =3D INT_ADD_OK (i, 4, &i);     /* #32; */
++      else
++        ok =3D INT_ADD_OK (i, 1, &i);
++
++      if (!ok)
++        {
++          DEBUGP (("Overflow detected in html_quote_string().\n"));
++          abort();
++        }
+     }
+-  res =3D xmalloc (i + 1);
++
++  if (!INT_ADD_OK (i, 1, &i))
++    {
++      DEBUGP (("Overflow detected in html_quote_string().\n"));
++      abort();
++    }
++
++  res =3D xmalloc (i);
+   s =3D b;
+   for (p =3D res; *s; s++)
+     {
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index fb77754965..8df11c9d75 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,8 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58472.patch \
+           file://CVE-2026-58472-regression.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


