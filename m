Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F3EC43219
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.654.1648751360410980869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12A2A13D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8B243F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/23] oeqa/selftest/wic: clean up only_for_arch decorator
Date: Thu, 31 Mar 2022 19:28:58 +0100
Message-Id: <20220331182915.22128-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163847

There's no need to pass a recipe name when determining the target
architecture, there's no need to cap the size of the lru_cache as it
will only have one entry, and __name__ is set by @wraps.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 5d7f7bf6135..317b80ea27b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -22,26 +22,22 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu
=20
=20
-@lru_cache(maxsize=3D32)
-def get_host_arch(recipe):
-    """A cached call to get_bb_var('HOST_ARCH', <recipe>)"""
-    return get_bb_var('HOST_ARCH', recipe)
+@lru_cache()
+def get_host_arch():
+    return get_bb_var('HOST_ARCH')
=20
=20
-def only_for_arch(archs, image=3D'core-image-minimal'):
+def only_for_arch(archs):
     """Decorator for wrapping test cases that can be run only for specif=
ic target
     architectures. A list of compatible architectures is passed in `arch=
s`.
-    Current architecture will be determined by parsing bitbake output fo=
r
-    `image` recipe.
     """
     def wrapper(func):
         @wraps(func)
         def wrapped_f(*args, **kwargs):
-            arch =3D get_host_arch(image)
+            arch =3D get_host_arch()
             if archs and arch not in archs:
                 raise unittest.SkipTest("Testcase arch dependency not me=
t: %s" % arch)
             return func(*args, **kwargs)
-        wrapped_f.__name__ =3D func.__name__
         return wrapped_f
     return wrapper
=20
--=20
2.25.1


