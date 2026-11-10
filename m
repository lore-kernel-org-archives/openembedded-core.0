Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88.1794324670900263663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ThgMDgVc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4544E1477
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:31:07 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2A743F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324670; bh=522Ovy5BnV6r2qIgUPSnN4/r5VNmYgh7BG01yKRyT5k=;
	h=From:To:Subject:Date:From;
	b=ThgMDgVc0HQsCR3HDf0FMWxtm18Q5Iq29+OLI8JZRmybjb7PPrUFTiPFAAaGRGgzb
	 56IJdqewAKF3qqiwRMWdX+pJHVWzkIdaGpwq3c7WGWbOhj8LSK0e5pMkNn5FCZl4l7
	 M6BpV4aIxe4Ha4HTiLxfZWj8BIO4pJOxIpOdh0v0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: use __spec__.cached when looking for cached bytecode
Date: Tue, 10 Nov 2026 15:31:03 +0000
Message-ID: <20261110153103.3124649-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 15:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249924
Content-Type: text/plain; charset="utf-8"

The __cached__ attribute has been deprecated since Python 3.13 and has
been removed in 3.15:

  The __cached__ attribute on modules, which was deprecated since
  version 3.13, is no longer set or taken into consideration by the
  import system or standard library. Use __spec__.cached instead.[1]

Replace __cached__ with __spec__.cached, and remove obsolete exception
handling that doesn't get triggered with the current standard library.

[1] https://docs.python.org/3/whatsnew/3.15.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/get_module_deps3.py        | 21 +++----------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index 8e432b49af8..28b5d22c458 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -143,24 +143,9 @@ for item in dif:
=20
     cpython_tag =3D sys.implementation.cache_tag
     cached =3D ''
-    # Theres no naive way to find *.pyc files on python3
-    try:
-        if debug =3D=3D True:
-            log.write('\nCalling: sys.modules[' + '%s' % item + '].__cac=
hed__\n')
-        cached =3D sys.modules['%s' % item].__cached__
-    except AttributeError as e:
-        # Deals with thread (builtin module) not having __cached__ attri=
bute
-        if debug =3D=3D True:
-            log.write(item + ' ')
-            log.write(str(e))
-            log.write('\n')
-        pass
-    except NameError as e:
-        # Deals with NameError: name 'cached' is not defined
-        if debug =3D=3D True:
-            log.write(item+' ')=20
-            log.write(str(e))                                           =
  =20
-        pass
+    if debug =3D=3D True:
+        log.write('\nGetting cached attribute for %s\n' % item)
+    cached =3D sys.modules['%s' % item].__spec__.cached
     if cached is not None:
         if debug =3D=3D True:
             log.write(cached + '\n')
--=20
2.43.0

