Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3443.1792487910263359628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XZJQ04br;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: bastien.curutchet@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36B90C62200;
	Tue, 20 Oct 2026 09:19:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3CD360393;
	Tue, 20 Oct 2026 09:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEC48103289A8;
	Tue, 20 Oct 2026 11:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792487907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=DPsyLPbdrIwIb+vdaRvNncKF7h/ooo2Ex1sewTCGoAU=;
	b=XZJQ04br7utSknNdqop/2ppoiT/hMkS+xiZPomRjQ3SHJrWLz5r93KZyteK4sGxQuO0zwi
	0oGC+Q8ML/8kUaL7FM6S4kmnPG0TZ0Tx/ANP14Pq4BDKjPYdRYM7mm0vPnZZXjPxMSKjzy
	uC+2k1cw8/iQLpC3lgWrnMjF/NFh8L+sp68lslGfaX5xM18PWcpZLXFWkEfz4br33BbXh4
	QA/orlsQf62h6BUFfSseiiu+PFenz/fADlyiDH9mNBrnKorSEi6w2WUIpvozMEqtm3Mvej
	Vi8x1iBdH8kjOl0snBhd/xB6WXz/jIGwB3NZ102H/VYj6iEKnD3lS80CAFyVCg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: openembedded-core@lists.openembedded.org,
	yoann.congal@smile.fr
Cc: jeremie.dautheribes@bootlin.com,
	Sergio Prado <sergio.prado@e-labworks.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [wrynose][PATCH] kernel-fit-image: reference the boot script as "script"
Date: Tue, 20 Oct 2026 11:18:14 +0200
Message-ID: <20261020091814.62136-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248255
Content-Type: text/plain; charset="utf-8"

From: Sergio Prado <sergio.prado@e-labworks.com>

The boot script added to a fitImage through FIT_UBOOT_ENV is referenced
from the configuration nodes with a "bootscr" property. U-Boot does not
know that name. It looks the boot script up through the "script"
property, defined as FIT_SCRIPT_PROP in include/image.h and used by
image_locate_script() in boot/image-board.c. The same name is used in
the example image tree source in the documentation of the source
command in [1]:

    configurations {
        default =3D "conf-2";
        conf-1 { script =3D "script-1"; };
        conf-2 { script =3D "script-2"; };
    };

As a result the boot script cannot be reached through a configuration:

    source <addr>#<conf>   fails with "Could not find script in <conf>"

    source <addr>          falls back to the image named by the "default"
                           property of the /images node, which is not
                           generated either, and fails with "No FIT
                           subimage unit name"

    source <addr>:<image>  works, as the name of the image node is not
                           affected, but addresses the script directly
                           and therefore cannot tie it to a configuration=
,
                           which is a problem when one wants to boot
                           exclusively from a signed configuration as
                           part of a verified boot chain.

To fix it, rename the property to "script". The entries of "sign-images"
are property names of the configuration node, so rename that entry as wel=
l
to keep the boot script covered by the configuration signature, and updat=
e
the expected value in the fitimage selftest to match.

Verified on an i.MX95 board with U-Boot 2025.04 booting a fitImage built
with FIT_UBOOT_ENV. Before the change, 'source <addr>#conf-<dtb>' stopped
at "Could not find script in conf-<dtb>". With the change, the
configuration form runs the script and boots.

[1] https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6bb0775e6ca56eb50119e9ad618dc5b865252f72)
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Hi all,

I hadn't subscribed to the oe-core ML, that's why I resend it, sorry.

Best regards,
Bastien
---
 meta/lib/oe/fitimage.py                  | 4 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index a1040181a2..2304119902 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -453,9 +453,9 @@ class ItsNodeRootKernel(ItsNode):
=20
         if self._bootscr:
             conf_desc.append("u-boot script")
-            opt_props["bootscr"] =3D self._bootscr.name
+            opt_props["script"] =3D self._bootscr.name
             if self._sign_enable:
-                sign_entries.append("bootscr")
+                sign_entries.append("script")
=20
         if self._setup:
             conf_desc.append("setup")
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index 84e21346ab..822b8c22c7 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -697,7 +697,7 @@ class KernelFitImageBase(FitImageTestCase):
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDL=
E'] !=3D "1":
             sign_images +=3D ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
-            sign_images +=3D ', "bootscr"'
+            sign_images +=3D ', "script"'
         req_sigvalues_config =3D {
             'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_S=
IGN_ALG']),
             'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_KEYNAME'],
--=20
2.56.0

