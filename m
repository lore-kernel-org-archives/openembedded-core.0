Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.47])
 by mx.groups.io with SMTP id smtpd.web10.9038.1619340259053723272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 01:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ca4mS0Oz;
 spf=pass (domain: windriver.com, ip: 40.107.237.47, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGfZaRlvkzFes+2SrB+XlVRW9nEU4BEjUadrDfZzcnVTVoBJzGEL7pU7QdGTey2G4S5yYe2xNH6LDlHP6I9qOQ/cGpF+1HDgyyrZFISD6atztTHhRin6MHB5xlGnLsSW2EAxBp24aqdUC9MKrPbgVPQp+T8zdxSnARH9dThdujQcHQqCfj04Z4U+F0BXRtrefTUFnAS1bhbjBu6dbguFmBl/QrduggPKWZYr5mNRcRFIQRHnM88soDkBRF2F7RwCEThEdlRE32yEi8EoiZuRWKUPOwChb0m1axA57EtqmKmIIFYseax0Godam2hGUQVTQw/wzuqypd5V9OXAJZKj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLK0DAEMWLfPamESPRKVDn57hBXtcJ3Q+lu8YEoT8L4=;
 b=bU6nyUgPWm3gB4VM00nH5HWeGQaB9zG5vy8ENPbpQl1o1sjFtbve7hgqQhgKFR41zptoQ6QWpjIbGjYipDAk241yylV8EmONSuxl/sAndGsVWcPKF87OQDJS9FHQ/A+2UV7gKlhVJMTTAKgpF371N5Y+y2mFKxbmZVuWT53jVCMXhgt2aW0XWGdF/yaZFLdUZP+nGrNvFy6rSd63G+ZLdCRnqUkH+QjStdxN0ch78T3ptU2gPSNtjrwMXOTt9IfI2P185+r3KI3uM1lIlgQqq+ibZnCYhMDJ23tMXBQ1Lb0gApAaAPfV6FzSMWUgCgTzF5QA12YfD/xqwYedcLT+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLK0DAEMWLfPamESPRKVDn57hBXtcJ3Q+lu8YEoT8L4=;
 b=ca4mS0Oz+7OUYHjOOZZzEHQQSPvyJxkqf02fRI6AGPUPGFfx8SLok04jYrQ9NSQB/Exo1v/3n9x8Wf+H1905HNPbe4Z/ODtgNr9fdqQvsZ82cVSSkvIgU9prY8KgpUSKXYDCnRy4cvUfgT0VVqf/6QcnhQlJu4cQH+Co3GYEIDM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3768.namprd11.prod.outlook.com (2603:10b6:a03:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 08:44:15 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 08:44:15 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] glib-2.0: fix CVE-2021-28153
Date: Sun, 25 Apr 2021 16:44:00 +0800
Message-ID: <20210425084400.36177-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0156.apcprd02.prod.outlook.com
 (2603:1096:201:1f::16) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0156.apcprd02.prod.outlook.com (2603:1096:201:1f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Sun, 25 Apr 2021 08:44:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5180e85a-6c7b-48dc-d094-08d907c64e44
X-MS-TrafficTypeDiagnostic: BYAPR11MB3768:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3768047B4F1702BF231ABF6AED439@BYAPR11MB3768.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i+QICo2b8hrRoeTCuoj1OJRdl9ycjqOuLJp+UhOU1T/0CVb6OUctFUBuM1k9ZDlmF9yAJI/YAM/IUGE53woX09LIfSta9Wm7+LVzOpuo5/oPbPyAhqy/0cUQOOEk2lx4KO+4ZjN6l0sAdcKu8H0h8eCS91q2eJsz619rtE6/rkpTAMeu52yHH5IFD9vMJY9KdbvgrofALq4f9gixGGnPA2Lm0L3UKzKgXrWkAu2cahbaE099yVMsCWIisti+LqM7HQhjQIQCXQcgtVVlmcvVlApveGfkQ9VQ229WRgsfbO0eLA9II7f/Gx+x76OUDQFtqxqZVJ45kofDYkA6+jDN8MyRMKRRdrxqEgbqKaGKXYLJvjyiBriZzuTfgi3pfOJIofja/1BLl1LIUthfxo5vxRjE1HClIkxA8fXEf7HGna7TAeb/RtnPq7d7IQ2BdTbu9o3zrNjaimQgLHBDG4sSu/MNETRALT2sWeWyYnFpHh7AIRz/CEhwluvDjoIvqLiCw4hrG+qwmMhlfG8IysAsLw4jdMhGe0MqpTIU9qeIj0Smd7xgJVnHMzYZMesx3rFoqp96+eWyfTn4FMlLjZWrH78KCUi2jxduZna2M8zJNi7nfpnBIssD7e7K5yZMqPpvq9OCahWCrNd2JjrbaBDESiUkpYeIvw/21iPWW6qJWMRB5BFwn/vHCXTEpdHj+rAKTw7x5x3xYcMaseDi/Rg4bWz1+Q+RxDUbu8+wmgOYWPlQVGTHmbJNdTVa+3J0NqYl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39830400003)(396003)(6916009)(956004)(478600001)(6666004)(86362001)(2616005)(36756003)(1076003)(6486002)(38100700002)(38350700002)(16526019)(6512007)(26005)(186003)(66476007)(316002)(52116002)(8676002)(8936002)(6506007)(5660300002)(2906002)(30864003)(83380400001)(66946007)(66556008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?QiG9+Sz6N5/G5W9p2VRYefj2LkrD56F3oNCJMhPQfdbbs8Op2/KUYkQ4QCnR?=
 =?us-ascii?Q?RkX2DUO+R4Hx+luk92ise08JQbP3ng4S2wD80ZE9oNgP/bWMNfB/wryim8mZ?=
 =?us-ascii?Q?xKV/qAUOTJ1F6+TbqxhjdFJkHuMIg9XEUs7TDJJKkzARdb+IfS2xmJjaV10r?=
 =?us-ascii?Q?9Fp651SuY0hYeww2EX50DSfHphNNQyhm/th4Fkfd4Mw2g/KnkHUV/nkoyLdf?=
 =?us-ascii?Q?b+wmpBRZaxupGrkOoK+6JTLNDgRK/jIBVFPVN1v8Hzqch6oC4nvYJfbg3ozm?=
 =?us-ascii?Q?UiqUwqCIUVHhxKDfMmKLN3l/8m0R5OC41HsGx0outE4L6rU4Mu1i7fvDHnhf?=
 =?us-ascii?Q?LhKUzIvaOEN53SpWIu6WNsrP4GsOFtPYYwJnf1mjSE8FXvuBoRVR0J4DEnP/?=
 =?us-ascii?Q?Atw15MRiBPiwXKcCKndBx2JEQ81mdVTtsnLmCkJeMm+TN/1Zkho4yTqX/NWt?=
 =?us-ascii?Q?2thbjDZhqIRtNStrno2dnly6lV5VCP7wZ6NKeL612DDVE8Hay/e3ybUboXlZ?=
 =?us-ascii?Q?a0K2lWiEqPHGUg1xWgDSKsd8S2c09gH8tAdV4Ir1MuQbQBT8zIlfZW5TJNbj?=
 =?us-ascii?Q?dLp7zUiIX8RY7HdjzU0eeglqmvny4ul9Cq/7cdkyYcZZ8jgObZx+un/gYYcz?=
 =?us-ascii?Q?BRbGf3zswkigdk2o+iZ4ydm2gUZuHGmbb+TE2q4RLF032cs5H7B0u0SFb5tV?=
 =?us-ascii?Q?C9Nu6GIlkhjWtFAXIJ2wPWao3UHCn6rLs1BMIwR9azUTb+9RAmGGzsMH8ud8?=
 =?us-ascii?Q?T5wDlY20yF0SbOL1gd+1jToL80in7Kuiej6FpH/1b/Ll5GandS1tydwsYMMK?=
 =?us-ascii?Q?q29mtgkXsm+BezBsJTEaZQiqca0cCJf/yybPYyfJIWYW8N3Lybdw6nZRpVDY?=
 =?us-ascii?Q?P/SmBkuCb8okNQwatq9LmKIpd3wBX90tycTtvj8bFn0pNZuWK5GhRR9phNwr?=
 =?us-ascii?Q?L4JcduOUc4iT8wPfLlz+t+tikCSQAXaouvpn/iJvJxVSet9ZqqGGOq7QCzvU?=
 =?us-ascii?Q?IIMJYGs5bCuBb3UxOdf+D05m80fXeee/AkXd4SiF1rfAZJMqpDuf7SejzT+U?=
 =?us-ascii?Q?ga4vJR9PQn6oLV9+VfB3n9MMek9/jqxjYk4r4NWSfL4NjxvomAxDJR5X6YNe?=
 =?us-ascii?Q?zIaHnkbfrnh7yhOuFdLnoqK+OpQTeMk/rWBIahe/VhxeWpqIGmUMIUguCIko?=
 =?us-ascii?Q?7abnq5Tg093Q0mqw+bcq1yqWpjKyR55G7euDO6MhNkHWMd8e0+wyAvtJUNLZ?=
 =?us-ascii?Q?joP9rsdw1pwVY6tSyWzj3j1S2wY9mqqQgTcDOqwh2EYYFpGqNM8xzCpMJIAa?=
 =?us-ascii?Q?3cAfqXrXj79tnmIOpUqYH88G?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5180e85a-6c7b-48dc-d094-08d907c64e44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 08:44:15.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPIlTJh9DkpMarZ2qD6lcURwGrb6I04NVWowD5TIU4m1OMDJjQM3cjOPXs5AoKMXwuK5IUI+Dd4jYbit2Xvz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3768
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Backport patches to fix CVE-2021-28153.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...outputstream-Fix-a-typo-in-a-comment.patch |  32 ++
 ...-using-g_test_bug_base-in-file-tests.patch |  47 +++
 ...outputstream-Factor-out-a-flag-check.patch |  60 ++++
 ...stream-Fix-CREATE_REPLACE_DESTINATIO.patch | 294 ++++++++++++++++++
 ...stream-Add-a-missing-O_CLOEXEC-flag-.patch |  60 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb |  10 +
 6 files changed, 503 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfileoutp=
utstream-Fix-a-typo-in-a-comment.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Stop-usi=
ng-g_test_bug_base-in-file-tests.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-glocalfileoutp=
utstream-Factor-out-a-flag-check.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0004-glocalfileoutp=
utstream-Fix-CREATE_REPLACE_DESTINATIO.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glocalfileoutp=
utstream-Add-a-missing-O_CLOEXEC-flag-.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfileoutputstrea=
m-Fix-a-typo-in-a-comment.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-=
glocalfileoutputstream-Fix-a-typo-in-a-comment.patch
new file mode 100644
index 0000000000..e3def1a980
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfileoutputstream-Fix-a=
-typo-in-a-comment.patch
@@ -0,0 +1,32 @@
+From 48dd0d030a2b5240457472d40d8691b80bf5fa78 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 24 Feb 2021 17:33:38 +0000
+Subject: [PATCH 1/5] glocalfileoutputstream: Fix a typo in a comment
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+CVE: CVE-2021-28153
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/issues/23=
25]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gio/glocalfileoutputstream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/glocalfileoutputstream.c b/gio/glocalfileoutputstream.c
+index f34c3e4..e3d31d6 100644
+--- a/gio/glocalfileoutputstream.c
++++ b/gio/glocalfileoutputstream.c
+@@ -854,7 +854,7 @@ handle_overwrite_open (const char    *filename,
+   mode =3D mode_from_flags_or_info (flags, reference_info);
+=20
+   /* We only need read access to the original file if we are creating a b=
ackup.
+-   * We also add O_CREATE to avoid a race if the file was just removed */
++   * We also add O_CREAT to avoid a race if the file was just removed */
+   if (create_backup || readable)
+     open_flags =3D O_RDWR | O_CREAT | O_BINARY;
+   else
+--=20
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Stop-using-g_te=
st_bug_base-in-file-tests.patch b/meta/recipes-core/glib-2.0/glib-2.0/0002-=
tests-Stop-using-g_test_bug_base-in-file-tests.patch
new file mode 100644
index 0000000000..d8d4d51751
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Stop-using-g_test_bug_=
base-in-file-tests.patch
@@ -0,0 +1,47 @@
+From 3d7f54ae4cfdddaf1a807879d9263e16cd12ffd3 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 24 Feb 2021 17:34:32 +0000
+Subject: [PATCH 2/5] tests: Stop using g_test_bug_base() in file tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Since a following commit is going to add a new test which references
+Gitlab, so it=E2=80=99s best to move the URI bases inside the test cases.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+CVE: CVE-2021-28153
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/issues/23=
25]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gio/tests/file.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/gio/tests/file.c b/gio/tests/file.c
+index d876965..39d51da 100644
+--- a/gio/tests/file.c
++++ b/gio/tests/file.c
+@@ -686,7 +686,7 @@ test_replace_cancel (void)
+   guint count;
+   GError *error =3D NULL;
+=20
+-  g_test_bug ("629301");
++  g_test_bug ("https://bugzilla.gnome.org/629301");
+=20
+   path =3D g_dir_make_tmp ("g_file_replace_cancel_XXXXXX", &error);
+   g_assert_no_error (error);
+@@ -1785,8 +1785,6 @@ main (int argc, char *argv[])
+ {
+   g_test_init (&argc, &argv, NULL);
+=20
+-  g_test_bug_base ("http://bugzilla.gnome.org/");
+-
+   g_test_add_func ("/file/basic", test_basic);
+   g_test_add_func ("/file/build-filename", test_build_filename);
+   g_test_add_func ("/file/parent", test_parent);
+--=20
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0003-glocalfileoutputstrea=
m-Factor-out-a-flag-check.patch b/meta/recipes-core/glib-2.0/glib-2.0/0003-=
glocalfileoutputstream-Factor-out-a-flag-check.patch
new file mode 100644
index 0000000000..425a1d402f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0003-glocalfileoutputstream-Facto=
r-out-a-flag-check.patch
@@ -0,0 +1,60 @@
+From 8cc84a2f8c668541aaba584cb9b73c98afeb8e2d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 10 Mar 2021 16:05:55 +0000
+Subject: [PATCH 3/5] glocalfileoutputstream: Factor out a flag check
+
+This clarifies the code a little. It introduces no functional changes.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+CVE: CVE-2021-28153
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/issues/23=
25]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gio/glocalfileoutputstream.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/gio/glocalfileoutputstream.c b/gio/glocalfileoutputstream.c
+index e3d31d6..392d0b0 100644
+--- a/gio/glocalfileoutputstream.c
++++ b/gio/glocalfileoutputstream.c
+@@ -850,6 +850,7 @@ handle_overwrite_open (const char    *filename,
+   int res;
+   int mode;
+   int errsv;
++  gboolean replace_destination_set =3D (flags & G_FILE_CREATE_REPLACE_DES=
TINATION);
+=20
+   mode =3D mode_from_flags_or_info (flags, reference_info);
+=20
+@@ -960,7 +961,7 @@ handle_overwrite_open (const char    *filename,
+    * to a backup file and rewrite the contents of the file.
+    */
+  =20
+-  if ((flags & G_FILE_CREATE_REPLACE_DESTINATION) ||
++  if (replace_destination_set ||
+       (!(_g_stat_nlink (&original_stat) > 1) && !is_symlink))
+     {
+       char *dirname, *tmp_filename;
+@@ -979,7 +980,7 @@ handle_overwrite_open (const char    *filename,
+      =20
+       /* try to keep permissions (unless replacing) */
+=20
+-      if ( ! (flags & G_FILE_CREATE_REPLACE_DESTINATION) &&
++      if (!replace_destination_set &&
+ 	   (
+ #ifdef HAVE_FCHOWN
+ 	    fchown (tmpfd, _g_stat_uid (&original_stat), _g_stat_gid (&original_=
stat)) =3D=3D -1 ||
+@@ -1120,7 +1121,7 @@ handle_overwrite_open (const char    *filename,
+ 	}
+     }
+=20
+-  if (flags & G_FILE_CREATE_REPLACE_DESTINATION)
++  if (replace_destination_set)
+     {
+       g_close (fd, NULL);
+      =20
+--=20
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0004-glocalfileoutputstrea=
m-Fix-CREATE_REPLACE_DESTINATIO.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0004-glocalfileoutputstream-Fix-CREATE_REPLACE_DESTINATIO.patch
new file mode 100644
index 0000000000..54a9f452d6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0004-glocalfileoutputstream-Fix-C=
REATE_REPLACE_DESTINATIO.patch
@@ -0,0 +1,294 @@
+From ed8f2235da7d2a408bfa18c1003f4a07f90b05e8 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 24 Feb 2021 17:36:07 +0000
+Subject: [PATCH 4/5] glocalfileoutputstream: Fix CREATE_REPLACE_DESTINATIO=
N
+ with symlinks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The `G_FILE_CREATE_REPLACE_DESTINATION` flag is equivalent to unlinking
+the destination file and re-creating it from scratch. That did
+previously work, but in the process the code would call `open(O_CREAT)`
+on the file. If the file was a dangling symlink, this would create the
+destination file (empty). That=E2=80=99s not an intended side-effect, and =
has
+security implications if the symlink is controlled by a lower-privileged
+process.
+
+Fix that by not opening the destination file if it=E2=80=99s a symlink, an=
d
+adjusting the rest of the code to cope with
+ - the fact that `fd =3D=3D -1` is not an error iff `is_symlink` is true,
+ - and that `original_stat` will contain the `lstat()` results for the
+   symlink now, rather than the `stat()` results for its target (again,
+   iff `is_symlink` is true).
+
+This means that the target of the dangling symlink is no longer created,
+which was the bug. The symlink itself continues to be replaced (as
+before) with the new file =E2=80=94 this is the intended behaviour of
+`g_file_replace()`.
+
+The behaviour for non-symlink cases, or cases where the symlink was not
+dangling, should be unchanged.
+
+Includes a unit test.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2325
+
+CVE: CVE-2021-28153
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/issues/23=
25]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gio/glocalfileoutputstream.c |  77 ++++++++++++++++++-------
+ gio/tests/file.c             | 108 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 163 insertions(+), 22 deletions(-)
+
+diff --git a/gio/glocalfileoutputstream.c b/gio/glocalfileoutputstream.c
+index 392d0b0..a2c7e3c 100644
+--- a/gio/glocalfileoutputstream.c
++++ b/gio/glocalfileoutputstream.c
+@@ -878,16 +878,22 @@ handle_overwrite_open (const char    *filename,
+       /* Could be a symlink, or it could be a regular ELOOP error,
+        * but then the next open will fail too. */
+       is_symlink =3D TRUE;
+-      fd =3D g_open (filename, open_flags, mode);
++      if (!replace_destination_set)
++        fd =3D g_open (filename, open_flags, mode);
+     }
+-#else
+-  fd =3D g_open (filename, open_flags, mode);
+-  errsv =3D errno;
++#else  /* if !O_NOFOLLOW */
+   /* This is racy, but we do it as soon as possible to minimize the race =
*/
+   is_symlink =3D g_file_test (filename, G_FILE_TEST_IS_SYMLINK);
++
++  if (!is_symlink || !replace_destination_set)
++    {
++      fd =3D g_open (filename, open_flags, mode);
++      errsv =3D errno;
++    }
+ #endif
+=20
+-  if (fd =3D=3D -1)
++  if (fd =3D=3D -1 &&
++      (!is_symlink || !replace_destination_set))
+     {
+       char *display_name =3D g_filename_display_name (filename);
+       g_set_error (error, G_IO_ERROR,
+@@ -898,15 +904,30 @@ handle_overwrite_open (const char    *filename,
+       return -1;
+     }
+=20
+-  res =3D g_local_file_fstat (fd,
+-                            G_LOCAL_FILE_STAT_FIELD_TYPE |
+-                            G_LOCAL_FILE_STAT_FIELD_MODE |
+-                            G_LOCAL_FILE_STAT_FIELD_UID |
+-                            G_LOCAL_FILE_STAT_FIELD_GID |
+-                            G_LOCAL_FILE_STAT_FIELD_MTIME |
+-                            G_LOCAL_FILE_STAT_FIELD_NLINK,
+-                            G_LOCAL_FILE_STAT_FIELD_ALL, &original_stat);
+-  errsv =3D errno;
++  if (!is_symlink)
++    {
++      res =3D g_local_file_fstat (fd,
++                                G_LOCAL_FILE_STAT_FIELD_TYPE |
++                                G_LOCAL_FILE_STAT_FIELD_MODE |
++                                G_LOCAL_FILE_STAT_FIELD_UID |
++                                G_LOCAL_FILE_STAT_FIELD_GID |
++                                G_LOCAL_FILE_STAT_FIELD_MTIME |
++                                G_LOCAL_FILE_STAT_FIELD_NLINK,
++                                G_LOCAL_FILE_STAT_FIELD_ALL, &original_st=
at);
++      errsv =3D errno;
++    }
++  else
++    {
++      res =3D g_local_file_lstat (filename,
++                                G_LOCAL_FILE_STAT_FIELD_TYPE |
++                                G_LOCAL_FILE_STAT_FIELD_MODE |
++                                G_LOCAL_FILE_STAT_FIELD_UID |
++                                G_LOCAL_FILE_STAT_FIELD_GID |
++                                G_LOCAL_FILE_STAT_FIELD_MTIME |
++                                G_LOCAL_FILE_STAT_FIELD_NLINK,
++                                G_LOCAL_FILE_STAT_FIELD_ALL, &original_st=
at);
++      errsv =3D errno;
++    }
+=20
+   if (res !=3D 0)
+     {
+@@ -923,16 +944,27 @@ handle_overwrite_open (const char    *filename,
+   if (!S_ISREG (_g_stat_mode (&original_stat)))
+     {
+       if (S_ISDIR (_g_stat_mode (&original_stat)))
+-	g_set_error_literal (error,
+-                             G_IO_ERROR,
+-                             G_IO_ERROR_IS_DIRECTORY,
+-                             _("Target file is a directory"));
+-      else
+-	g_set_error_literal (error,
++        {
++          g_set_error_literal (error,
++                               G_IO_ERROR,
++                               G_IO_ERROR_IS_DIRECTORY,
++                               _("Target file is a directory"));
++          goto err_out;
++        }
++      else if (!is_symlink ||
++#ifdef S_ISLNK
++               !S_ISLNK (_g_stat_mode (&original_stat))
++#else
++               FALSE
++#endif
++               )
++        {
++          g_set_error_literal (error,
+                              G_IO_ERROR,
+                              G_IO_ERROR_NOT_REGULAR_FILE,
+                              _("Target file is not a regular file"));
+-      goto err_out;
++          goto err_out;
++        }
+     }
+  =20
+   if (etag !=3D NULL)
+@@ -1015,7 +1047,8 @@ handle_overwrite_open (const char    *filename,
+ 	    }
+ 	}
+=20
+-      g_close (fd, NULL);
++      if (fd >=3D 0)
++        g_close (fd, NULL);
+       *temp_filename =3D tmp_filename;
+       return tmpfd;
+     }
+diff --git a/gio/tests/file.c b/gio/tests/file.c
+index 39d51da..ddd1ffc 100644
+--- a/gio/tests/file.c
++++ b/gio/tests/file.c
+@@ -805,6 +805,113 @@ test_replace_cancel (void)
+   g_object_unref (tmpdir);
+ }
+=20
++static void
++test_replace_symlink (void)
++{
++#ifdef G_OS_UNIX
++  gchar *tmpdir_path =3D NULL;
++  GFile *tmpdir =3D NULL, *source_file =3D NULL, *target_file =3D NULL;
++  GFileOutputStream *stream =3D NULL;
++  const gchar *new_contents =3D "this is a test message which should be w=
ritten to source and not target";
++  gsize n_written;
++  GFileEnumerator *enumerator =3D NULL;
++  GFileInfo *info =3D NULL;
++  gchar *contents =3D NULL;
++  gsize length =3D 0;
++  GError *local_error =3D NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/2325");
++  g_test_summary ("Test that G_FILE_CREATE_REPLACE_DESTINATION doesn=E2=
=80=99t follow symlinks");
++
++  /* Create a fresh, empty working directory. */
++  tmpdir_path =3D g_dir_make_tmp ("g_file_replace_symlink_XXXXXX", &local=
_error);
++  g_assert_no_error (local_error);
++  tmpdir =3D g_file_new_for_path (tmpdir_path);
++
++  g_test_message ("Using temporary directory %s", tmpdir_path);
++  g_free (tmpdir_path);
++
++  /* Create symlink `source` which points to `target`. */
++  source_file =3D g_file_get_child (tmpdir, "source");
++  target_file =3D g_file_get_child (tmpdir, "target");
++  g_file_make_symbolic_link (source_file, "target", NULL, &local_error);
++  g_assert_no_error (local_error);
++
++  /* Ensure that `target` doesn=E2=80=99t exist */
++  g_assert_false (g_file_query_exists (target_file, NULL));
++
++  /* Replace the `source` symlink with a regular file using
++   * %G_FILE_CREATE_REPLACE_DESTINATION, which should replace it *without=
*
++   * following the symlink */
++  stream =3D g_file_replace (source_file, NULL, FALSE  /* no backup */,
++                           G_FILE_CREATE_REPLACE_DESTINATION, NULL, &loca=
l_error);
++  g_assert_no_error (local_error);
++
++  g_output_stream_write_all (G_OUTPUT_STREAM (stream), new_contents, strl=
en (new_contents),
++                             &n_written, NULL, &local_error);
++  g_assert_no_error (local_error);
++  g_assert_cmpint (n_written, =3D=3D, strlen (new_contents));
++
++  g_output_stream_close (G_OUTPUT_STREAM (stream), NULL, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_object (&stream);
++
++  /* At this point, there should still only be one file: `source`. It sho=
uld
++   * now be a regular file. `target` should not exist. */
++  enumerator =3D g_file_enumerate_children (tmpdir,
++                                          G_FILE_ATTRIBUTE_STANDARD_NAME =
","
++                                          G_FILE_ATTRIBUTE_STANDARD_TYPE,
++                                          G_FILE_QUERY_INFO_NOFOLLOW_SYML=
INKS, NULL, &local_error);
++  g_assert_no_error (local_error);
++
++  info =3D g_file_enumerator_next_file (enumerator, NULL, &local_error);
++  g_assert_no_error (local_error);
++  g_assert_nonnull (info);
++
++  g_assert_cmpstr (g_file_info_get_name (info), =3D=3D, "source");
++  g_assert_cmpint (g_file_info_get_file_type (info), =3D=3D, G_FILE_TYPE_=
REGULAR);
++
++  g_clear_object (&info);
++
++  info =3D g_file_enumerator_next_file (enumerator, NULL, &local_error);
++  g_assert_no_error (local_error);
++  g_assert_null (info);
++
++  g_file_enumerator_close (enumerator, NULL, &local_error);
++  g_assert_no_error (local_error);
++  g_clear_object (&enumerator);
++
++  /* Double-check that `target` doesn=E2=80=99t exist */
++  g_assert_false (g_file_query_exists (target_file, NULL));
++
++  /* Check the content of `source`. */
++  g_file_load_contents (source_file,
++                        NULL,
++                        &contents,
++                        &length,
++                        NULL,
++                        &local_error);
++  g_assert_no_error (local_error);
++  g_assert_cmpstr (contents, =3D=3D, new_contents);
++  g_assert_cmpuint (length, =3D=3D, strlen (new_contents));
++  g_free (contents);
++
++  /* Tidy up. */
++  g_file_delete (source_file, NULL, &local_error);
++  g_assert_no_error (local_error);
++
++  g_file_delete (tmpdir, NULL, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_object (&target_file);
++  g_clear_object (&source_file);
++  g_clear_object (&tmpdir);
++#else  /* if !G_OS_UNIX */
++  g_test_skip ("Symlink replacement tests can only be run on Unix")
++#endif
++}
++
+ static void
+ on_file_deleted (GObject      *object,
+ 		 GAsyncResult *result,
+@@ -1798,6 +1905,7 @@ main (int argc, char *argv[])
+   g_test_add_data_func ("/file/async-create-delete/4096", GINT_TO_POINTER=
 (4096), test_create_delete);
+   g_test_add_func ("/file/replace-load", test_replace_load);
+   g_test_add_func ("/file/replace-cancel", test_replace_cancel);
++  g_test_add_func ("/file/replace-symlink", test_replace_symlink);
+   g_test_add_func ("/file/async-delete", test_async_delete);
+   g_test_add_func ("/file/copy-preserve-mode", test_copy_preserve_mode);
+   g_test_add_func ("/file/measure", test_measure);
+--=20
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0005-glocalfileoutputstrea=
m-Add-a-missing-O_CLOEXEC-flag-.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0005-glocalfileoutputstream-Add-a-missing-O_CLOEXEC-flag-.patch
new file mode 100644
index 0000000000..0ab9a750ab
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0005-glocalfileoutputstream-Add-a=
-missing-O_CLOEXEC-flag-.patch
@@ -0,0 +1,60 @@
+From ab4ee65fb5778964fa3cca9b3d6749711ef9ba19 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 24 Feb 2021 17:42:24 +0000
+Subject: [PATCH 5/5] glocalfileoutputstream: Add a missing O_CLOEXEC flag =
to
+ replace()
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+CVE: CVE-2021-28153
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/issues/23=
25]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gio/glocalfileoutputstream.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/gio/glocalfileoutputstream.c b/gio/glocalfileoutputstream.c
+index a2c7e3c..4c512ea 100644
+--- a/gio/glocalfileoutputstream.c
++++ b/gio/glocalfileoutputstream.c
+@@ -63,6 +63,12 @@
+ #define O_BINARY 0
+ #endif
+=20
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#else
++#define HAVE_O_CLOEXEC 1
++#endif
++
+ struct _GLocalFileOutputStreamPrivate {
+   char *tmp_filename;
+   char *original_filename;
+@@ -1239,7 +1245,7 @@ _g_local_file_output_stream_replace (const char     =
   *filename,
+   sync_on_close =3D FALSE;
+=20
+   /* If the file doesn't exist, create it */
+-  open_flags =3D O_CREAT | O_EXCL | O_BINARY;
++  open_flags =3D O_CREAT | O_EXCL | O_BINARY | O_CLOEXEC;
+   if (readable)
+     open_flags |=3D O_RDWR;
+   else
+@@ -1269,8 +1275,11 @@ _g_local_file_output_stream_replace (const char    =
    *filename,
+       set_error_from_open_errno (filename, error);
+       return NULL;
+     }
+- =20
+-=20
++#if !defined(HAVE_O_CLOEXEC) && defined(F_SETFD)
++  else
++    fcntl (fd, F_SETFD, FD_CLOEXEC);
++#endif
++
+   stream =3D g_object_new (G_TYPE_LOCAL_FILE_OUTPUT_STREAM, NULL);
+   stream->priv->fd =3D fd;
+   stream->priv->sync_on_close =3D sync_on_close;
+--=20
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.66.7.bb
index 3909b76ddf..e5e65a4aad 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -50,6 +50,16 @@ SRC_URI +=3D "\
            file://0028-gresource-Fix-a-pointer-mismatch-with-an-atomic-loa=
d.patch \
            file://0029-docs-Document-not-to-use-volatile-qualifiers.patch =
\
 "
+
+# Fix CVE-2021-28153
+SRC_URI +=3D "\
+           file://0001-glocalfileoutputstream-Fix-a-typo-in-a-comment.patc=
h \
+           file://0002-tests-Stop-using-g_test_bug_base-in-file-tests.patc=
h \
+           file://0003-glocalfileoutputstream-Factor-out-a-flag-check.patc=
h \
+           file://0004-glocalfileoutputstream-Fix-CREATE_REPLACE_DESTINATI=
O.patch \
+           file://0005-glocalfileoutputstream-Add-a-missing-O_CLOEXEC-flag=
-.patch \
+"
+
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
=20
 SRC_URI[sha256sum] =3D "09f158769f6f26b31074e15b1ac80ec39b13b53102dfae66cf=
e826fb2cc65502"
--=20
2.17.1

