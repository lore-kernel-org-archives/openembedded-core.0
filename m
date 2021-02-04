Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.77])
 by mx.groups.io with SMTP id smtpd.web11.146.1612397301477539087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 16:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C9nx5CQB;
 spf=pass (domain: windriver.com, ip: 40.107.69.77, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHTinsE4qdje9sxCcW/N/VeJI6moibBSL2w6MYkW5XXMNjgjb+1442RJjI0YuU2Y7AcPSFgxJBt/fBMeQo0MFExjDTqjlUR4Qulzk3beDT7k5cXuPRtqjEKehZT27iD7b92gG0F50qiC+O6X6bGF/VMX6pkEXhRHFgoeifS5xXxcLAYQdyKxFJHSxjIHZs0mZaByf1Sofu82l0rUndPjmxEvEzxTHB02GlnQyM+JglklvZHfIohmirJwP+gFpZeBg8tGxIrwyo6NVVtLmB9W2wq/Xbz7GpGL2dO6CEf8WoPJZZ/Zc4DU+GsS7CyMiWEZLyfe2jshqkSVtuA3SyzeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rxg1XwYtycx2+eLMPAcxdUOV1jnke3lDSczzdZptA=;
 b=XHcBqa4zxohUrruz25wrObCy0lIAs5YMBGDN05B5Nhp1fTi++zg6aiuERz+gCuzXsfcU39NPxIOP3prWQ80JG1ZKp45M6nsHyzzX/ePeXlvP4ciYxUSMubEiTO5q0uKjkjDJtc6XOG+xTRhkMHB5KLnBZgD4IWoL0/GuU0XgXnnc30kHGenU+axY8naL/Tu5HIuwj2Poj3hVuExb6AnZqe+emTXyW2e/snfEa0tigS2APIO369xH6MMWck3VOhnS7YxE2kAUkA/6eAzqB8RsmZFIaVI0jRy7xdlYkiLtQ7HAiOZJKSmWn1aCzI8EtY1lubItMmecGsTyR0rcoIehEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rxg1XwYtycx2+eLMPAcxdUOV1jnke3lDSczzdZptA=;
 b=C9nx5CQBwXueSA0k3GngB0Hu50uEhGpob9HvG6RhLhVzldpaROm8dmOk1sKSmEHSJoqdRXEvo5PvGJ8DdBtVOcsh68Ecwvbn/vME1XA6/b1vczU2dLWSNvm8DXg+JSbSf8oJKo0auaU4Dd+RaQV8+wDT5seSgzgXVY/yRNr16dk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Thu, 4 Feb
 2021 00:08:19 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 00:08:19 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] glib-2.0: add workaround to fix codegen.py.test failing
Date: Wed,  3 Feb 2021 19:08:07 -0500
Message-ID: <20210204000807.37397-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <66062128267E148.9318@lists.openembedded.org>
References: <66062128267E148.9318@lists.openembedded.org>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 00:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38da9fb1-cbc3-4de5-d858-08d8c8a0fa6e
X-MS-TrafficTypeDiagnostic: SA2PR11MB5193:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5193000C835C56547ACE86AC80B39@SA2PR11MB5193.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j4TUOEdXrvcpD5RVx8yL4OhuZqHU+tvlcZo+rYAGD7KkqS9RGwVaDbgWdpNYjmlWvSp5Fnw+JnThmBtNMl1GqMrLjabvgWLhrXGBs1puE33X4cvCAp9jEuw2khF6PdhxuwcExiszcBEtMj/gx2ezuWWGVke47PEQ63mk5QvqqjZh7C+7NWXzt1WJdELD0EzU+1nhA9HodSvc08vbOIA5cjrXaKCTxI4tDv0ugDlZxa/0NhmglaMfNQgN8i5pIdjF9ChcjMwTM/MSG+5QhSrxoCHo+tleg1JdvlZv4YV1xFvvK+n3MhXHUV+0zGcHPdqKGI5R0YyDzg5H8tD58Qkgl6+5dGOu5iHHepS1Ih3f8/NM9yjVSaDi6Dequfr7BpbXzADHNQu4nzy1FzvCD+uaeVdKhnmUuEipxoaiWEZl+GdrB+m7Tj4m4tjiWjlji1MCS4k9EI+sdqA80HD71CXn4zpRzIdvZEQSSXTMSKGVFnRpVrW21j59Terl9E1e3GJzfqfyk/AwIRf9vORxQDoMIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(5660300002)(478600001)(66946007)(66556008)(66476007)(1076003)(8936002)(6916009)(6506007)(6486002)(6512007)(956004)(6666004)(8676002)(2616005)(2906002)(36756003)(86362001)(26005)(316002)(83380400001)(186003)(16526019)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4vEUiU7oy17G4YgEvuhNYSEJq2PrUQ0eW+TrLDa/jcrDjfL6YoXNz9C+u2Z7?=
 =?us-ascii?Q?fPI0uCY1vAKTBPZM9Oo0LRLArI8QAtHjp+De6CiL2pfO0qlsdSV9NxTIqYUs?=
 =?us-ascii?Q?PYcx+gWvpmd2ZpEA2V9pg4ZGm4C8R96t6D6Ujvzz6tMcMQ0pCut90xGqF9lc?=
 =?us-ascii?Q?uJXhFGX0kl2MnGy9ovo7PsWXvqgnKVeaopK1cxdWEcWjM5NG8PMcRoi8sxHH?=
 =?us-ascii?Q?5MkoWTbH8svD/bCi6ViYiGwJDB+eL9TXZfBv2xpzm849F/Ybk3WRyF+tlhw6?=
 =?us-ascii?Q?XoiPsc5GRj3fzFJJtSpDKCvK5Vy4SBpSPsRwmU8JIkb6NfAXOSehSbJBji4D?=
 =?us-ascii?Q?mGy90J2vlzPhwRJnOyClHxhDuPBCO6iQgPnSWf+1S+9B6iJEjJlBmUD5EtyU?=
 =?us-ascii?Q?EuB1ZKn+iw6TdiopoJucEaxsDJGTN3dMpL32zUekMH2GL8r4iQ2rPNmUbUTA?=
 =?us-ascii?Q?OSiWOSYYdAyR1FHZ3aeLLKacNpd0Jw0SdjpOkFsTmlT4uucqrgSV/bLL5Is0?=
 =?us-ascii?Q?0OlY8aPOmlB4C9UHdt80yajHyKe4nlKC1in1qtKItwX2L6nA+DaXDnIIw4SF?=
 =?us-ascii?Q?wQaP2gvtKioxmWLJQaNa1PwoJcpRNNrXQ0jiPZYsjGIb9DNOfr88efrU85KG?=
 =?us-ascii?Q?rL8DQNgheGGy26pRs7YyRqVi/x/c28DnVyihR+qjkbwGoGAk4AruekDsqubj?=
 =?us-ascii?Q?O0XkKo659Y2ZW2OGymoI/uB1vltQoF2fovsdm38bhULhkpPvgmy0ig2pUaJX?=
 =?us-ascii?Q?yjGEwyw2ctxTE8dOIlpFC1peck4Vl48zvTev9SO5G1ewQc1Xq+taqfF4aN2a?=
 =?us-ascii?Q?ZfbEgU4v038oe+VmLDnPkAfxsf3Dbqx89gzGLnbYGCGcSWDbX/fFv3NQqLLf?=
 =?us-ascii?Q?/Q5/C5LuXmcO/YZaIqTenqKSelpWw77H9NtaDyhTiiR/mGfpUgH+RgAp0hIM?=
 =?us-ascii?Q?P6dFcBTwl9WB4rLFR8gjW5DjD5hcnN4Fl7D5nYmoxd/yHnUeuly7Kv2cfIRc?=
 =?us-ascii?Q?+g/9i3L3M7PIEp5MNNkuOkJ6BTtXQd//pwOrydHJDt8xzt2L9R9IlcQNPGzt?=
 =?us-ascii?Q?sY25a62iIjHcMB7uWRBLwPGpiS5zvP2FimS1iwXbOmYkpOOAUjwGt2lUn7Az?=
 =?us-ascii?Q?G/cPu52caEZxCJfY6x4NAdOYlOmh5SQ63AdtB/1QbYOUvautgKkS3JYhpa39?=
 =?us-ascii?Q?9weuszO05CJq8Im4vPgAu1DzwBdY3lnH1AEM13/EVWEGOONYeNDjlgIilX2T?=
 =?us-ascii?Q?8LMA3It9+dawFsQHAfvjFZX1/wWhTKBDuisZXvnMb1YmYLngTVNs6lygzMcp?=
 =?us-ascii?Q?1P38wmmD6rDzNfEBGoLOQarr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38da9fb1-cbc3-4de5-d858-08d8c8a0fa6e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 00:08:19.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkM7DDhRv9vJoMsvY/etsi/TlNxggvrsM0LWEinf+C4pzXRA++o/6TtljjYz9+AvrPPRW5TOQGCJYDFUrwDR3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Adding a patch to remove an unecessary print statement
in test-codegen.py that cause the ptest-runner to fail.

Root cause is suspected to be in ptest-runner.

[YOCTO #14170]

Uptream-Status: Inappropriate [other]
this is a workaround.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...-removing-unecessary-print-statement.patch | 38 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.=
py-removing-unecessary-print-statement.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-remo=
ving-unecessary-print-statement.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-tests-codegen.py-removing-unecessary-print-statement.patch
new file mode 100644
index 0000000000..40427e0e67
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-removing-un=
ecessary-print-statement.patch
@@ -0,0 +1,38 @@
+From 6178df5658045a6253ef806e018fe80d99a8f5fb Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Mon, 1 Feb 2021 16:10:28 -0500
+Subject: [PATCH] tests/codegen.py: removing unecessary print statement
+
+A huge amount of output(boiler-plate code) is
+printed to the console screen.
+This is not critical to the test results.
+
+This causes intermittent test failure when another process
+has to parse its output.
+
+Root cause is in ptest-runner, This is a workaround
+
+Uptream-Status: Inappropriate [other]
+
+
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ gio/tests/codegen.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
+index 51de0ede4..cfa4db42e 100644
+--- a/gio/tests/codegen.py
++++ b/gio/tests/codegen.py
+@@ -250,7 +250,6 @@ class TestCodegen(unittest.TestCase):
+=20
+         result =3D Result(info, out, err, subs)
+=20
+-        print('Output:', result.out)
+         return result
+=20
+     def runCodegenWithInterface(self, interface_contents, *args):
+--=20
+2.29.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.66.4.bb
index 70e8aa8785..5e1c0f2d33 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.=
tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only=
-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.pa=
tch \
+           file://0001-tests-codegen.py-removing-unecessary-print-statemen=
t.patch \
            "
=20
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
--=20
2.29.2

