Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1826.1795133691149812479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 16:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 074FD40864;
	Fri, 20 Nov 2026 00:14:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOvKrlAH4-PY; Fri, 20 Nov 2026 00:14:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D57E2407D6;
	Fri, 20 Nov 2026 00:14:48 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7CF01169AD0;
	Thu, 19 Nov 2026 19:14:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] kernel-fit-image: make "os" field of loadables optional
Date: Thu, 19 Nov 2026 19:14:48 -0500
Message-Id: <20261120001448.714390-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 00:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250724
Content-Type: text/plain; charset="utf-8"

From: Denys Dmytriyenko <denys@konsulko.com>

It is not required to specify the "os" field for the loadables
section, which current implementation incorrectly defaults to
"linux". Make it truly optional and if not specified, simply
omit it from the section.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/conf/image-fitimage.conf | 2 +-
 meta/lib/oe/fitimage.py       | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.con=
f
index a06d30e494..44b7554cfa 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -99,6 +99,6 @@ FIT_UBOOT_ENV ?=3D ""
 #   FIT_LOADABLE_LOADADDRESS[atf] =3D "0x204E0000"
 #   FIT_LOADABLE_ENTRYPOINT[atf] =3D "0x204E0000"
 # Sensible defalts will be used for some parameters (compression, descri=
ption,
-# arch, os) if the corresponding flag is not set, while others (load add=
ress
+# arch) if the corresponding flag is not set, while others (os, load add=
ress
 # and entry point) will be omitted in the final FIT.
 FIT_LOADABLES ?=3D ""
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index c97b334413..dec1da79ff 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -407,9 +407,11 @@ class ItsNodeRootKernel(ItsNode):
         opt_props =3D {
             "data": '/incbin/("' + filepath + '")',
             "arch": arch if arch is not None else self._arch,
-            "os": fit_os if fit_os is not None else self._os,
         }
=20
+
+        if fit_os:
+            opt_props["os"] =3D fit_os
         if load:
             opt_props["load"] =3D f"<{load}>"
         if entry:
--=20
2.25.1

