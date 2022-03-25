Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08459C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 06:51:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.137])
 by mx.groups.io with SMTP id smtpd.web10.2199.1648191104102457623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=CyPSI2O8;
 spf=pass (domain: arri.de, ip: 40.107.8.137, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5XDBzPaLnSXKG10WQRaiRy0wuugOP+G9ZyjFpKE6H8eecLoDNWZXFWF5Cf1Jk7+pAGha0+e09s3gAAWMkHlK2A5vEGCTNDTDk6RgMRDuKN/Ej6BkYRO3t1CqWPI4M2jbPRNEpYZ+XIH8Sq8Xtv8Cvt875l8RdqXXiwQEC3RSsodB+uXbS0dhkcLEIBNqS02I260ezAj27hLiJtSOhr0efbqLoYcmhAkJvRJ6JAlmJahvmCfxYrIs0iyguF0Hp5V+sehieMC0jTMzGDMUaMQ8T79vqynLHykTdHVWGkSNnhD0+3nLE8ymUPKMGiacvHTU3C1FJexz6LJr3bPYJ6aKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXW23ihcA77TiWa8f/2YNFxUi6jMqHAo02WZDzJo0AY=;
 b=AlDGe2qKE9b9lb0AILQfiBpFwVe5cwJnJEGPHJqNCJkgffqn7VxTaSdlN9fHbuyXaWwauhQeXhDVvl+dGigDouT0yT+9j8IB/NzH/+X0hoHXBw9k8wXUfyv/JK5GmuroHoDLOcl4pGEgIo4kCpPzW9iGRWPUGSCrHk+VsBh3AeCOJrxasTPqiR4zlmcFAvULlALy809rvTLOkSt8ilo7Bfmd/bkYe0/YzFnVZfEN9BhoycMx5WrYGal4k06yJVIHuA77Re0hEJvWcvFeLkYasII8rGyS9tuRU2dX/lDeFHMLB78Jn2b1l3RFOSEXIFot5nVxAl2rrkuIvtqDPF929Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXW23ihcA77TiWa8f/2YNFxUi6jMqHAo02WZDzJo0AY=;
 b=CyPSI2O8YKVBE4Bk2Z49zTRwrwqUlHS+3WbS8P/at1fjauw9wxQCKw8qe60KDtorIfyNnfNVEEdCG8R0N0BqfcjGAY2qI50bJxgdlgM5lvGmrIlGF1vZ/AMAKdvNfhE8Yl0utr8Nh2yDR4PTwd0hk45oGfRTC85+aeL1v3GD4M8=
Received: from AS9PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:46a::32)
 by AM6PR07MB5159.eurprd07.prod.outlook.com (2603:10a6:20b:65::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.8; Fri, 25 Mar
 2022 06:51:39 +0000
Received: from VE1EUR02FT023.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::80) by AS9PR04CA0040.outlook.office365.com
 (2603:10a6:20b:46a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Fri, 25 Mar 2022 06:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT023.mail.protection.outlook.com (10.152.12.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 06:51:39 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 07:51:38 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] glib-2.0: upgrade 2.70.4 -> 2.72.0
Date: Fri, 25 Mar 2022 07:51:16 +0100
Message-ID: <20220325065116.14742-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397e6e27-bc2c-4eb5-244b-08da0e2be997
X-MS-TrafficTypeDiagnostic: AM6PR07MB5159:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR07MB5159DD6AEA89FD9EF10619FBBF1A9@AM6PR07MB5159.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zD967BeGpIYDpJTNqtdhA45GlmP3ZjuhUCq/YqUU39JvD1e8EAM0umHJnCwon7sS9a35qy9Cc5vvdz3aehmeeY+FBFfqnu4Hvp0/i/Bp3wD6tdtgQBAKUUIP4jZILxUmEBGS4CmtclezHbAAQ/EHePCkWClY3QnqHwnflGGIACexYLqkPEKFREugQx4ft/iQLdQwd3Y+x2uyOE+5+GQNmZ+aGC5aP35PovWg6S4iXda7aVh1Ezj9UYAC+qRcfzy6ACtQSybUWshyL/19KGHIPE1MlyO6U5Ue49qQeic6Y+PPAg120aNztO65ksPmP4++TREss9LPgC/rhv6gg/CpMYkLXWtDpNM9p8T9dszQsH+PkFItjxEk/eOWO2rIz+6AxEGSYkYJLsiBwq2MJARuNmiMd0RceDq5LCRDCN5U4XvWN3HDE6JZuxty/Sr3YBZdGmS0gryKDjSaNZjHhuytn95fn5fRa6Qm8e2ZNvx+B/q0gTk/UGtvlXSC50kP8WjwL8t9Ys/f0d9RqQSaOU8PpyZEzzb6c1o9VlA2kbbNd6xqpvFZgEAlO+6YJ1+Q2iisz8J8RwtkVwux4whFDIM5+7r0IeMqyEsUEw5K/1p18BcJAE4F+XIpLwi8WBLIePY0AsSkvKNafU5uqDxyHqIBSJW3uYb28n9SMdOIfe0tatZQz8XV1NlRTbpxjgFE6tQRD9rPLmInzaNtT9QfIm09Sz48avPr/ifWE3HyVQBYDv7cDnhxp+iDPN4NwCvU+a0kQJR6piXcVlFZMgsMm5rrMeOxmzdgnfS9pRGAALgDdgo=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(40460700003)(8936002)(6916009)(53546011)(508600001)(36860700001)(316002)(70206006)(2616005)(70586007)(4326008)(81166007)(30864003)(426003)(83380400001)(1076003)(336012)(8676002)(107886003)(26005)(186003)(47076005)(16526019)(6666004)(82310400004)(36756003)(86362001)(356005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:51:39.1256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 397e6e27-bc2c-4eb5-244b-08da0e2be997
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT023.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 06:51:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163627

- 0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch:
  dropped (integrated upstream)

News
=3D=3D=3D=3D

* Bugs fixed:
 - #2620 g_time_zone_new_offset() assertion failure if offset >=3D 25 hours
 - #2538 Various unit test fixes
 - #2542 fuzzing: Fix test failure with G_DISABLE_ASSERT
 - #2547 gprintf: Fix a memory leak with an invalid format in g_vasprintf()
 - #2548 tests: Various fixes to gdbus-auth, gdbus-non-socket, gdbus-connec=
tion-flush, spawn-multithreaded tests
 - #2551 tests: More flaky test fixes to converter-stream and test-printf
 - #2552 gtlsconnection: fix typo in docs

* Translation updates:
 - Czech
 - French
 - Friulian
 - Hebrew
 - Hungarian
 - Italian
 - Kazakh
 - Polish
 - Romanian
 - Serbian
 - Swedish

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 ...-correctly-when-building-with-mingw3.patch | 32 +++++++------
 ...degen.py-bump-timeout-to-100-seconds.patch | 26 ----------
 ...ble-more-tests-while-cross-compiling.patch | 48 ++++++++++---------
 ...{glib-2.0_2.70.4.bb =3D> glib-2.0_2.72.0.bb} |  3 +-
 4 files changed, 44 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-code=
gen.py-bump-timeout-to-100-seconds.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.4.bb =3D> glib-2.0_2.72.0=
.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-corr=
ectly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 8a6d46df799b..59de3fa969a4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-w=
hen-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-w=
hen-building-with-mingw3.patch
@@ -1,11 +1,10 @@
-From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
+From 4f327be49fd6ac5a77da6e48459b37f37a601977 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/tests/meson.build  | 8 ++++----
  glib/tests/meson.build | 2 +-
@@ -14,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  4 files changed, 9 insertions(+), 6 deletions(-)
=20
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 3a19c82..b762835 100644
+index abe676767c60..34b347815308 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -27,7 +27,7 @@ test_c_args =3D [
+@@ -27,7 +27,7 @@ if build_machine.system() =3D=3D 'linux'
    endif # libutil.length() > 0
  endif # build_machine.system() =3D=3D 'linux'
 =20
@@ -26,7 +25,7 @@ index 3a19c82..b762835 100644
    common_gio_tests_deps +=3D [iphlpapi_dep, winsock2, cc.find_library ('s=
ecur32')]
  endif
 =20
-@@ -148,7 +148,7 @@ else
+@@ -176,7 +176,7 @@ else
  endif
 =20
  #  Test programs buildable on UNIX only
@@ -35,7 +34,7 @@ index 3a19c82..b762835 100644
    gio_tests +=3D {
      'file' : {},
      'gdbus-peer' : {
-@@ -402,7 +402,7 @@ if host_machine.system() !=3D 'windows'
+@@ -434,7 +434,7 @@ if host_machine.system() !=3D 'windows'
  endif # unix
 =20
  #  Test programs buildable on Windows only
@@ -44,7 +43,7 @@ index 3a19c82..b762835 100644
    gio_tests +=3D {'win32-streams' : {}}
  endif
 =20
-@@ -472,7 +472,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'clang=
-cl'
+@@ -504,7 +504,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'clang=
-cl'
    }
  endif
 =20
@@ -54,10 +53,10 @@ index 3a19c82..b762835 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index 6eb23e8..36eb919 100644
+index a0c64afe6ae9..48407f99569c 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -142,7 +142,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -151,7 +151,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
 =20
@@ -67,10 +66,10 @@ index 6eb23e8..36eb919 100644
      glib_tests +=3D {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 47f3a5c..7ea7ad1 100644
+index e0b14319fb58..f6756a3c7dfb 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -32,6 +32,9 @@ else
+@@ -54,6 +54,9 @@ else
  endif
 =20
  host_system =3D host_machine.system()
@@ -81,15 +80,18 @@ index 47f3a5c..7ea7ad1 100644
  if host_system =3D=3D 'darwin'
    ios_test_code =3D '''#include <TargetConditionals.h>
 diff --git a/tests/meson.build b/tests/meson.build
-index 6741f8f..12fdc90 100644
+index 5ff99a4a8258..8a4dad0ccae7 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -73,7 +73,7 @@ test_extra_programs =3D {
-   'unicode-collate' : {},
+@@ -53,7 +53,7 @@ test_extra_programs =3D {
+   'assert-msg-test' : {},
  }
 =20
 -if host_machine.system() !=3D 'windows'
 +if host_system !=3D 'windows'
    tests +=3D {
      'timeloop' : {},
-     'iochannel-test' : {},
+   }
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-=
bump-timeout-to-100-seconds.patch b/meta/recipes-core/glib-2.0/glib-2.0/000=
1-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
deleted file mode 100644
index 7690bb37a6be..000000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-ti=
meout-to-100-seconds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b833254bcc9fcf4cdc2572027b1154d799535ca4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 20 Dec 2020 22:01:43 +0100
-Subject: [PATCH] gio/tests/codegen.py: bump timeout to 100 seconds
-
-This may be necessary on overloaded CI systems.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_re=
quests/2348]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gio/tests/codegen.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
-index 51de0ed..ca98c9d 100644
---- a/gio/tests/codegen.py
-+++ b/gio/tests/codegen.py
-@@ -55,7 +55,7 @@ class TestCodegen(unittest.TestCase):
-     cwd =3D ""
-=20
-     def setUp(self):
--        self.timeout_seconds =3D 10  # seconds per test
-+        self.timeout_seconds =3D 100  # seconds per test
-         self.tmpdir =3D tempfile.TemporaryDirectory()
-         self.cwd =3D os.getcwd()
-         os.chdir(self.tmpdir.name)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cr=
oss-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests=
-while-cross-compiling.patch
index 9bbb33ffc16c..6147bdae462e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-com=
piling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-com=
piling.patch
@@ -1,4 +1,4 @@
-From 73b1c416674d285b021e218da1a3ddb884e606da Mon Sep 17 00:00:00 2001
+From d2d7af496b4f4a13779179dbcbb98de56b09783f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -9,16 +9,15 @@ case we can depend on glib-2.0-native.
=20
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
  gio/tests/meson.build | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)
=20
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 5dbfb8e..3fd7998 100644
+index e8d10a0f11f2..abe676767c60 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -221,7 +221,7 @@ if host_machine.system() !=3D 'windows'
+@@ -250,7 +250,7 @@ if host_machine.system() !=3D 'windows'
 =20
    #  Test programs that need to bring up a session bus (requires dbus-dae=
mon)
    have_dbus_daemon =3D find_program('dbus-daemon', required : false).foun=
d()
@@ -27,76 +26,78 @@ index 5dbfb8e..3fd7998 100644
      annotate_args =3D [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2'=
,
-@@ -570,12 +570,12 @@ if installed_tests_enabled
+@@ -601,14 +601,14 @@ if installed_tests_enabled
    endforeach
  endif
 =20
 -if not meson.is_cross_build() or meson.has_exe_wrapper()
 +if meson.is_cross_build()
 =20
+   compiler_type =3D '--compiler=3D@0@'.format(cc.get_id())
+=20
    plugin_resources_c =3D custom_target('plugin-resources.c',
      input : 'test4.gresource.xml',
      output : 'plugin-resources.c',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--generate-source',
-@@ -599,7 +599,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -634,7 +634,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
    test_gresource =3D custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--sourcedir=3D' + meson.current_build_dir(),
-@@ -610,7 +610,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -647,7 +647,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
    test_resources2_c =3D custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--generate',
-@@ -621,7 +621,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -660,7 +660,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
    test_resources2_h =3D custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--generate',
-@@ -633,7 +633,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -674,7 +674,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
      input : 'test2.gresource.xml',
      depends : big_test_resource,
      output : 'test_resources.c',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--sourcedir=3D' + meson.current_build_dir(),
-@@ -644,7 +644,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -687,7 +687,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
    digit_test_resources_c =3D custom_target('digit_test_resources.c',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.c',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--sourcedir=3D' + meson.current_build_dir(),
-@@ -655,7 +655,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -700,7 +700,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
    digit_test_resources_h =3D custom_target('digit_test_resources.h',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.h',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
+                compiler_type,
                 '--target=3D@OUTPUT@',
                 '--sourcedir=3D' + meson.current_source_dir(),
-                '--generate',
-@@ -688,11 +688,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapp=
er()
+@@ -742,11 +742,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapp=
er()
 =20
    ld =3D find_program('ld', required : false)
 =20
@@ -107,15 +108,18 @@ index 5dbfb8e..3fd7998 100644
        output : 'test5.gresource',
 -      command : [glib_compile_resources,
 +      command : ['glib-compile-resources',
+                  compiler_type,
                   '--target=3D@OUTPUT@',
                   '--sourcedir=3D' + meson.current_source_dir(),
-                  '--sourcedir=3D' + meson.current_build_dir(),
-@@ -704,7 +704,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
+@@ -760,7 +760,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper=
()
      test_resources_binary_c =3D custom_target('test_resources_binary.c',
        input : 'test5.gresource.xml',
        output : 'test_resources_binary.c',
 -      command : [glib_compile_resources,
 +      command : ['glib-compile-resources',
+                  compiler_type,
                   '--target=3D@OUTPUT@',
                   '--sourcedir=3D' + meson.current_source_dir(),
-                  '--sourcedir=3D' + meson.current_build_dir(),
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.72.0.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
index 704d428f0449..8b7016ec0fe4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
@@ -16,11 +16,10 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only=
-.patch \
-           file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.pa=
tch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
-SRC_URI[sha256sum] =3D "ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e=
8c468e9d423c33"
+SRC_URI[sha256sum] =3D "d7bef0d4c4e7a62e08efb8e5f252a01357007b9588a87ff2b4=
63a3857011f79d"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.34.1


