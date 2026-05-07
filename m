Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1303CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 14:29:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13352.1778164177384860044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 07:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=JGGBopn7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E68CC5DC5B
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 14:30:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF10F60495
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 14:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDCE91081949C;
	Thu,  7 May 2026 16:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778164175; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7DfogcCK7vxH5W1GOA4mLyQTronEtnJRkIj4ZHFvBjM=;
	b=JGGBopn7+wkAXpTlFJQXHcD+q5rr5ogyTbH0XCJDuYTBlABYWXPRt3k5LCWxBzwUVzv4ko
	f9n1UelXHVxyrI8uQX50kX7CnxVuIDiE9ZH4T5M/ENt9bp+dMKvR40Djdlzgj9w1WA/pAA
	FBLtp+xiORbLVO8hRoN1kKuOERS+ZCgXyl7XojkNZU8cYL4SSe4eO/jNE/1VNse0piYChi
	HIvraybWrnR/ybb3TmfGe7XTdNDgHqO0A83vfQ94Ujcl8OHa0aeL0a/2WQBI1BpToJUlND
	+vaIBB1BEioXz3lWyfxnS2UqYFSwYmmz8Pj6S/042uKbWBcM9KGPGRYimk1cKw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] fetch2/crate: replace instance method monkey-patching with URL dispatch
Date: Thu,  7 May 2026 16:29:24 +0200
Message-ID: <20260507142924.916471-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236595

From: Thomas Perrot <thomas.perrot@bootlin.com>

Instead of overwriting self.latest_versionstring at init time to swap
in a different implementation, have latest_versionstring() inspect
ud.versionsurl and dispatch to the appropriate private helper.

This avoids surprising instance-level mutation and makes the branching
logic explicit and readable.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 lib/bb/fetch2/crate.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/bb/fetch2/crate.py b/lib/bb/fetch2/crate.py
index b46d4f1a9801..bb12f4e9b7c2 100644
--- a/lib/bb/fetch2/crate.py
+++ b/lib/bb/fetch2/crate.py
@@ -81,7 +81,6 @@ class Crate(Wget):
         if host =3D=3D 'crates.io':
             ud.url =3D "https://static.crates.io/crates/%s/%s/download" =
% (name, version)
             ud.versionsurl =3D 'https://index.crates.io/' + self._genera=
te_index_path(name)
-            self.latest_versionstring =3D self.latest_versionstring_from=
_index
         else:
             ud.url =3D "https://%s/%s/%s/download" % (host, name, versio=
n)
             ud.versionsurl =3D "https://%s/%s/versions" % (host, name)
@@ -158,7 +157,16 @@ class Crate(Wget):
=20
     def latest_versionstring(self, ud, d):
         """
-        Return the latest version available when versionsurl is the [nam=
e]/versions URL.
+        Return the latest upstream version, dispatching to the appropria=
te
+        parser based on the versionsurl format.
+        """
+        if ud.versionsurl.startswith('https://index.crates.io/'):
+            return self._latest_versionstring_from_index(ud, d)
+        return self._latest_versionstring_from_api(ud, d)
+
+    def _latest_versionstring_from_api(self, ud, d):
+        """
+        Parse the latest version from a [name]/versions JSON API respons=
e.
         """
         json_data =3D json.loads(self._fetch_index(ud.versionsurl, ud, d=
))
         versions =3D [(0, i["num"], "") for i in json_data["versions"]]
@@ -166,10 +174,9 @@ class Crate(Wget):
=20
         return (versions[-1][1], "") if versions else ("", "")
=20
-    def latest_versionstring_from_index(self, ud, d):
+    def _latest_versionstring_from_index(self, ud, d):
         """
-        Return the latest version available when versionsurl is a Cargo =
index
-        file.
+        Parse the latest version from a Cargo sparse index file (NDJSON)=
.
         https://doc.rust-lang.org/cargo/reference/registry-index.html#in=
dex-files
         """
         versions =3D []
--=20
2.54.0


