Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1576.1795132745900870873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 15:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A08BD40800;
	Thu, 19 Nov 2026 23:59:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L255xQPr2Hac; Thu, 19 Nov 2026 23:59:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 751D1407D7;
	Thu, 19 Nov 2026 23:59:03 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 92216165FCB;
	Thu, 19 Nov 2026 18:59:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] kernel-fit-image: exclude loadables property from DTBO config nodes
Date: Thu, 19 Nov 2026 18:59:02 -0500
Message-Id: <20261119235902.705611-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 23:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250723
Content-Type: text/plain; charset="utf-8"

From: Denys Dmytriyenko <denys@konsulko.com>

Similar to the previous fix[1], besides excluding the kernel propery
from DTBO config nodes, we also need to exclude loadables property
as well for the same reason detailed in[1].

It was handled properly back in OE 5.0 (and older) fitImage
implamentation, but got added incorrectly with OE 6.0 re-write.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D06ed34005=
957a6afb88270603df5e545941546b0

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/lib/oe/fitimage.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 484e5c5ee0..c97b334413 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -431,10 +431,12 @@ class ItsNodeRootKernel(ItsNode):
         conf_desc =3D []
         sign_entries =3D []
         include_kernel =3D 1
+        include_loadables =3D 1
=20
-        # DTBO configuration sections do not include kernel property
+        # DTBO configuration sections do not include kernel/loadables pr=
operties
         if dtb and os.path.splitext(dtb.name)[1] =3D=3D ".dtbo":
             include_kernel =3D 0
+            include_loadables =3D 0
=20
         if self._kernel and include_kernel:
             conf_desc.append("Linux kernel")
@@ -468,7 +470,7 @@ class ItsNodeRootKernel(ItsNode):
             if self._sign_enable:
                 sign_entries.append("setup")
=20
-        if len(self._loadables) > 0:
+        if len(self._loadables) > 0 and include_loadables:
             conf_desc.append("loadables")
             opt_props["loadables"] =3D [ loadable.name for loadable in s=
elf._loadables ]
             if self._sign_enable:
--=20
2.25.1

