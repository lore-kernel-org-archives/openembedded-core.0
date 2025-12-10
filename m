Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A200CD3C90A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15909.1765374972582682532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA454175D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 05:56:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2C803F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 05:56:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory_analysis: show renamed directories
Date: Wed, 10 Dec 2025 13:56:03 +0000
Message-ID: <20251210135603.2980546-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 13:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227476

If a directory was just renamed but the contents did not change, it was
not listed in the output. This change should be listed, so be sure to
handle that case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/buildhistory_analysis.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhist=
ory_analysis.py
index c1d502e89cf..4a95a928adf 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -150,10 +150,10 @@ class ChangeRecord:
                         lines.append('removed "{colour_remove}{value}{co=
lour_default}"'.format(value=3D' '.join(removed), **colours))
                     if added:
                         lines.append('added "{colour_add}{value}{colour_=
default}"'.format(value=3D' '.join(added), **colours))
-            else:
+            elif not renamed_dirs:
                 lines.append('changed order')
=20
-            if not (removed or added or changed_order):
+            if not (removed or added or changed_order or renamed_dirs):
                 out =3D ''
             else:
                 out =3D '%s: %s' % (self.fieldname, ', '.join(lines))
--=20
2.43.0


