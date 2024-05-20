Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12EFC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 12:34:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.59797.1716208460131397819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 05:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C084ADA7
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 05:34:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 674B93F641
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 05:34:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdkext/devtool: replace use of librdfa
Date: Mon, 20 May 2024 12:34:17 +0000
Message-Id: <20240520123417.3182885-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 12:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199570

librdfa hasn't had a commit for a decade now and as such has problems
with modern compilers (specifically gcc 14.1).  Switch the recipe
creation test to something much simpler that we also control: dbus-wait.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext=
/cases/devtool.py
index 5ffb732556b..d0746e68eba 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -69,10 +69,9 @@ class DevtoolTest(OESDKExtTestCase):
         self._test_devtool_build(self.myapp_cmake_dst)
=20
     def test_extend_autotools_recipe_creation(self):
-        req =3D 'https://github.com/rdfa/librdfa'
-        recipe =3D "librdfa"
-        self._run('devtool sdk-install libxml2')
-        self._run('devtool add %s %s' % (recipe, req) )
+        recipe =3D "test-dbus-wait"
+        self._run('devtool sdk-install dbus')
+        self._run('devtool add %s https://git.yoctoproject.org/git/dbus-=
wait' % (recipe) )
         try:
             self._run('devtool build %s' % recipe)
         finally:
--=20
2.34.1


