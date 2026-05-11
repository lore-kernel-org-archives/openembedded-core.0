Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD4BCD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:14:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46667.1778494449524595425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UzNBtSJo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE6B31A3501
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDABF60646
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC75011AEA46E;
	Mon, 11 May 2026 12:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778494447; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ZBQbrEXzTCvUqYQMJlc3oBKxtt7GIS5RIi7gVm1yLec=;
	b=UzNBtSJoIddk2lHEOcpLar59LaCD5JBc98DqAh/i3euqR5UVsxmjj93co8of3yazjJxuB3
	fAS8d/22NWsdkhuWk/kiVEyoT5d1L9g9HL4WCmQRI0A62w7EALj/rvU8BZ0ZH3vhJk1B0W
	Qh5CC+hZ08SD/HtMH4klUkIse1E41d6PqyR0xjL3cJwtdV886tIEaPIkAgGnRZj8jlmoHc
	4VHWFwJBCzMLpHl45NaiA4QWiwJjzZLqopV4sn9MSkOzTI9yaN9V01nd9d50OdJg/LOOml
	neTHv28OD6sd15Mer7OlUuOJsMzO/yOQk1/W8O5nCGNLgp4VHQA46DneviitqQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error path
Date: Mon, 11 May 2026 12:13:54 +0200
Message-ID: <20260511101354.1173682-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236803

From: Thomas Perrot <thomas.perrot@bootlin.com>

Commit 678c1c207731 applied os.path.isdir() + non-empty check to three
functions, but the error-reporting path in lookup_pkg introduced by
commit 46ff3a8d2c18 was left using os.path.exists() + os.listdir().
This is fragile: it raises NotADirectoryError if the path exists but is
a file, and silently falls through to the generic error on an empty
directory rather than skipping the rprovides block.

Apply the same pattern used elsewhere for consistency.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 scripts/oe-pkgdata-util | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 904008bd029a..acefae24f3ab 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -239,8 +239,8 @@ def lookup_pkg(args):
         missing =3D list(set(pkgs) - set(mappings.keys()))
         for pkg in missing:
             providepkgpath =3D os.path.join(args.pkgdata_dir, "runtime-r=
provides", pkg)
-            if os.path.exists(providepkgpath):
-                providers =3D os.listdir(providepkgpath)
+            providers =3D os.listdir(providepkgpath) if os.path.isdir(pr=
ovidepkgpath) else []
+            if providers:
                 for provider in providers:
                     if provider =3D=3D pkg:
                         continue
--=20
2.54.0


