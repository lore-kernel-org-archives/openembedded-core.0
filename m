Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.65])
 by mx.groups.io with SMTP id smtpd.web09.41.1612396497113452694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 15:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RbKT7nR7;
 spf=pass (domain: windriver.com, ip: 40.107.68.65, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml48/S2vscegsyomDv1+wMKhALRTrVNK6/xS0udSc8BBSJir8XSVoxJeGs2ff5GYiNOK/xPT1+TGZgNW0Anx6GimgEoxx+IAkZNecvoriIyD32p2d5feiGyMcEDAmmRqKXLE6zlpQGKGeqgW+ImDRUKC4SldaFuiHSysi0Ce/0ObEc89zFOWPax21btqqfxsB0aAPqB7r2Vi607kGXEeW73vhXVaFnZ7i2D+ZXO9w0sgOOZdx8OsgJnw1XVEJRDpgyLx59RxQenI1njK2Zg0RNa/JD+BG6c+sSaIzUNdi1CbyzLf4dRw45GsJ5DuP0GEuWgBIs2fP2SxSHLUfpLk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rxg1XwYtycx2+eLMPAcxdUOV1jnke3lDSczzdZptA=;
 b=SjXvpR2wzP9B+RnyHid+715ORMegf/h9V5/2TzLvP6r53iYDQKiHakf8GqQIJQAyTZYoe00InW4J1aQrI9LwIKRwijQuFvY3AHj47acoi9+E8okxRSQnrhYKD8G4bhr17ajWRGA6AgpX1DAFeJG6oL9RdwHvQxjhc0sn+JAltqdggi9mxT0gqnhH/qo4TO1d3ycFf/UoMspbdvM6LlG5JGnvReuY/Gb4q4pkHcBscNUCAoB3q+Nm+KH3y0DZOw1w1zNgy2PUxZupGFXqR5a8qa4wA3/W0uN+qDF07ytqi4qAd1j6RWZngfx+ASl6eg35mnS4jcNksvwfIKaSuvobxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rxg1XwYtycx2+eLMPAcxdUOV1jnke3lDSczzdZptA=;
 b=RbKT7nR7eL3pel95USqV1dXwOLa9VIsVicem2U33LrltNULjKPSfWwkmmx30ANYkS/38YbB20bmFoG9dSiUpW7eSqAOXEe1qD5myVe4C6i9+ft+EQTarHDnEVbMDcAiifdODFDTX5aENDQu2byBbNJJx6RgPs2yDS+/A6s1d1Og=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:54:55 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 23:54:55 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH]] glib-2.0: add workaround to fix codegen.py.test failing
Date: Wed,  3 Feb 2021 18:54:39 -0500
Message-ID: <20210203235439.15882-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:54:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3744304d-0761-45ba-443a-08d8c89f1b52
X-MS-TrafficTypeDiagnostic: SA2PR11MB4777:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB47776E7A6BBC9D10F7AF850F80B49@SA2PR11MB4777.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9hGXHgBxhcl3jjVAtR1LUl4DzHqcP7xIYAlXwbnaBgnNlRC5ldnHGgQoyCcgPepO1s4rZ3W+0+Cp5iXyDI725u9nMo8gS5ql9Pp0iGi6Xj8i3zvPOvIUda2+1bGgS32cYwCIdqDApCGP2W6Hfsbl2KTCrb/319SLNCqDtIA02KomV36B6wQ9VodPyhc0GzkUB470NmIkrjmAXEdb7CH47V9OtsdTSbcMSN4o1uu0rdX4qvMgd17DcYZEXm0YbbTl8oY12ydfWKwvTyNJZlRaTjaDJwKwBNuhLxFDoVha3Y4UKJa+un/x7xo27PGERc+7jTd/MiLYnshKxwEiucygqawlyj5AdEDlbfMXpJkbPJ70ygujPgZz3bhajzQtPuZ9wx094XhtXZZZ5HTvXUu6jZZlX50OWqpEfuS5I4Sl5yA1FlgyXu1pm/7rougfUgVXeql5Rlm8TR/QhzEeWtF1uv62EnZ7imNCXHr0AVwxzMYhcirE58ogjbgs94uO4qtPPnep8zDo3rsWBBsqQN8gMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(366004)(376002)(346002)(26005)(6486002)(2906002)(956004)(83380400001)(478600001)(52116002)(6506007)(8676002)(66476007)(1076003)(86362001)(66946007)(5660300002)(2616005)(6512007)(6666004)(66556008)(16526019)(36756003)(6916009)(8936002)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Kx/pJaGT4aSUR9WBWSEA6o0MO4HcsQNGmppuLjd8XUnmDQdbgQRLdaaO1Is2?=
 =?us-ascii?Q?wurQ0kJDee470a9H7KLiugKNRvEdu1txjLmkfbfePZIffHPGgEoEyat1jTiw?=
 =?us-ascii?Q?QUj5CrK1fzjNLbDRM/HKrgUfchtWSv7nfz+F8kRhWbwG8AlMHSQYIIL0vFnO?=
 =?us-ascii?Q?bWIlKKGLhFH9f+Ul3JwkTUevi+EkS/jl8YuZ1aYEW7a53x3MWpWEyVvUnf6v?=
 =?us-ascii?Q?IsYK7l03iOgLfGl0j2FdP/ePiTxAkqa0ufhfbAHIvWCkNw3sCPiH2drBnKIj?=
 =?us-ascii?Q?sjCT6hkKFxxGInNxV8JmbNj7hyi+PfPr7wp8wq5dt2DbGZRioj8+nS9NxQ/4?=
 =?us-ascii?Q?v1c2WZuRjF48fchziy5D/pWUDdvwGeHWlZSEsp1viaYBp8daoKYxUSanQDJL?=
 =?us-ascii?Q?pK49OjvY8/UrS0qxF3VqMXvmnbgWouHaHb0sdGuaOdqZqB6oHWq83yMQP75B?=
 =?us-ascii?Q?CTFWXbWPvLNWRJ/W4PCSYOVYSk3RghjzN3/z363QaqTeI5wp+Phj3GtOSV3k?=
 =?us-ascii?Q?3neFFQyxutQ0vo29gUYWzQDDVn04b3vd7eVSNx11g7It6/i4GlCBedilsSfo?=
 =?us-ascii?Q?q3txast6sX6gz8GhBUnVQdUSNaKU7WZkt6209hhf9C3dEIuxJxcDLNvx6u1U?=
 =?us-ascii?Q?gOwSIREIlWtWcJ3T2EdVsnFci/mkSkzCRd8x5OvdkqTaVcpn8JZwUv0WPiQv?=
 =?us-ascii?Q?bE234wslSq6Ss7FRPjyZz/0uMLdspGHovbARXsS/K6ZQcfUeycUGm4aXc0R0?=
 =?us-ascii?Q?pei7Vm4mONpfWLeTj0zfB7QVSHB35itcm0OpCfdXMpjokpAbH20Za6yIbPDG?=
 =?us-ascii?Q?gg42Ccn/Ldcik92FO74SlkFzfK4HmUdON+6o2lpwYlVPatLF1Txhx9FjSn+X?=
 =?us-ascii?Q?Fmczj7FgD7NRz67JdfOip6eVW1UoJnppLW79u3FbnwFhI+G5Vvx8hq68rvq+?=
 =?us-ascii?Q?lfBuX06n6dmsJdtdFfDLjCuPd8XIm9Mb0ESB6bnawEFPVyx3Nez8SRM4LS2U?=
 =?us-ascii?Q?JU/wXWvswVKQUSZFpP8YgVUqpj9dfv3WZpMc/+nG4WWHb6dfRSbC3a8G6wD1?=
 =?us-ascii?Q?irWlNPJ7WmF3esZp9qJM/WlHHpq5Pyy7mKWL+raaICTyhmY1mjwQswpzORzg?=
 =?us-ascii?Q?ZJs7LY/6usR0FdfedE430VvLf8aDB/diUUZYp1fxUQnLYuKawnHtjdgb+Ta8?=
 =?us-ascii?Q?IHZmiBdgHDNa72COKlPQRh5bo3CMWit7KUAnf3ywdKCAz3JgisZo8gecm3a8?=
 =?us-ascii?Q?nUxYYQhaaBB5Eq9t2a2p8knowex/+YwYWAoIaJjvcFE74DhoeLoVi0wWmWS7?=
 =?us-ascii?Q?YKznSW1N0jeKyoPxWyxgdpfd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3744304d-0761-45ba-443a-08d8c89f1b52
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:54:55.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vJJgnuORjZPpGBGLEh/lDScBYLaqYgUkmpaZq+9SzU6oBLHV0kM2gLuMCdyzZWcZHrMWT1CISbgocXmGU11EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
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

