Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DE1C7EE23
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 20:33:25 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.25809.1684252610896125483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 08:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pm.me header.s=protonmail3 header.b=Kdq56kIa;
 spf=pass (domain: pm.me, ip: 185.70.43.16, mailfrom: antoningodard@pm.me)
Date: Tue, 16 May 2023 15:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1684252609; x=1684511809;
	bh=4vv85u4D6K/PmC66CDzCB5hsRqfBomMoOR2XkSdbk2E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Kdq56kIakCF+GyYHoalDkdSGkN87hzVPGwNYEbpAt/X4ZcPYVllqCrzIBivXJQyYQ
	 KM0pgfHAhm2TfW9ChstXgMkMJdzpZZEFkhHBSJCCpUhqyhJjmlGcW3R81chNGJ2Kv+
	 tM7S32XZTYrVf+0RzrWKPDJvnJNchBmeltWNbgzhspXDZSny9BWNUJocGwVuBuMZxt
	 rFiYw+Q+k2JoQRyxvSJOODN7s30POwpuCoG0AVeSDcKZZqdurnx+l7DPg3t7uUivlO
	 mriqxtRF3RB8HtRho23T0rBVgoszNZ2131N46SksBbgvWcr9IoqNmYZH0at2p9iLzH
	 uxf0PA7jx7NfA==
To: openembedded-core@lists.openembedded.org
From: "Antonin Godard" <antoningodard@pm.me>
Cc: Antonin Godard <antoningodard@pm.me>
Subject: [PATCH 1/1] archiver: move exclusion logic in a dedicated function
Message-ID: <20230516155545.298359-2-antoningodard@pm.me>
In-Reply-To: <20230516155545.298359-1-antoningodard@pm.me>
References: <20230516155545.298359-1-antoningodard@pm.me>
Feedback-ID: 17651652:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 20:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181422

Extending archiver is not possible without duplicating the anonymous
function's logic. Move this logic in a separate function
"include_package" which returns a bool.

Signed-off-by: Antonin Godard <antoningodard@pm.me>
---
 meta/classes/archiver.bbclass | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 4049694d85..0eee1abefa 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -76,33 +76,39 @@ do_ar_original[dirs] =3D "${ARCHIVER_OUTDIR} ${ARCHIVER=
_WORKDIR}"

 # This is a convenience for the shell script to use it

-
-python () {
-    pn =3D d.getVar('PN')
-    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
-    if pn in assume_provided:
-        for p in d.getVar("PROVIDES").split():
-            if p !=3D pn:
-                pn =3D p
-                break
+def include_package(d, pn):

     included, reason =3D copyleft_should_include(d)
     if not included:
         bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
-        return
+        return False
+
     else:
         bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))

-
     # glibc-locale: do_fetch, do_unpack and do_patch tasks have been delet=
ed,
     # so avoid archiving source here.
     if pn.startswith('glibc-locale'):
-        return
+        return False

     # We just archive gcc-source for all the gcc related recipes
     if d.getVar('BPN') in ['gcc', 'libgcc'] \
             and not pn.startswith('gcc-source'):
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn=
)
+        return False
+
+    return True
+
+python () {
+    pn =3D d.getVar('PN')
+    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES").split():
+            if p !=3D pn:
+                pn =3D p
+                break
+
+    if not include_package(d, pn):
         return

     # TARGET_SYS in ARCHIVER_ARCH will break the stamp for gcc-source in m=
ulticonfig
--
2.25.1


