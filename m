Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20286C5B552
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2812.1748550495363949487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E521A2454
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:27:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08BCC3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] scripts/scriptutils: silence warning about S not existing in emptysrc
Date: Thu, 29 May 2025 21:27:59 +0100
Message-ID: <20250529202802.1198179-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217443

This function creates an emptysrc recipe, but S points to a directory
that doesn't exist and bitbake warns about this.

As it is under the temporary working directory which will be deleted
later, create it to silence the warning.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/scriptutils.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 81f0b01fa53..32e749dbb1a 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -182,7 +182,10 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logg=
er, preserve_tmp=3DFalse, mirr
                 f.write('UNPACKDIR =3D "%s"\n' % destdir)
=20
                 # Set S out of the way so it doesn't get created under t=
he workdir
-                f.write('S =3D "%s"\n' % os.path.join(tmpdir, 'emptysrc'=
))
+                s_dir =3D os.path.join(tmpdir, 'emptysrc')
+                bb.utils.mkdirhier(s_dir)
+                f.write('S =3D "%s"\n' % s_dir)
+
                 if not mirrors:
                     # We do not need PREMIRRORS since we are almost cert=
ainly
                     # fetching new source rather than something that has=
 already
--=20
2.43.0


