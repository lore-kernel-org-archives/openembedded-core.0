Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7126.1631269255171986411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE1A76D
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5481F3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] testimage: TEST_SERVER_IP isn't mandatory
Date: Fri, 10 Sep 2021 11:20:44 +0100
Message-Id: <20210910102050.1266413-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When using the simpleremote test target, TEST_SERVER_IP doesn't have to
be configured as the code will detect the host's IP if it isn't set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/testimage.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
index 3c689aec913..8bf6b17af8a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -143,11 +143,8 @@ do_testimage[depends] +=3D "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] +=3D "${TESTIMAGELOCK}"
=20
 def testimage_sanity(d):
-    if (d.getVar('TEST_TARGET') =3D=3D 'simpleremote'
-        and (not d.getVar('TEST_TARGET_IP')
-             or not d.getVar('TEST_SERVER_IP'))):
-        bb.fatal('When TEST_TARGET is set to "simpleremote" '
-                 'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
+    if d.getVar('TEST_TARGET') =3D=3D 'simpleremote' and not d.getVar('T=
EST_TARGET_IP'):
+        bb.fatal('When TEST_TARGET is set to "simpleremote" TEST_TARGET_=
IP must be set.')
=20
 def get_testimage_configuration(d, test_type, machine):
     import platform
--=20
2.25.1

