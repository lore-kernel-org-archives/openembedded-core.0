Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3268C83F27
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 14:13:56 +0000 (UTC)
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
 by mx.groups.io with SMTP id smtpd.web10.11642.1752934428819035719
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jul 2025 07:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=Ewmd/1n5;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.12, mailfrom: jeroen@myspectrum.nl)
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4bkpYP58dlz129mf;
	Sat, 19 Jul 2025 16:13:45 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission4.mail.transip.nl (Postfix) with ESMTPSA id 4bkpYL3RwXz2pRDkL;
	Sat, 19 Jul 2025 16:13:42 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3055320117;
	Sat, 19 Jul 2025 14:13:39 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sat, 19 Jul 2025 16:13:38 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [PATCH] gomod: extract license files for omitted modules
Date: Sat, 19 Jul 2025 16:13:14 +0200
Message-ID: <20250719141314.2677635-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1752934422; h=from:subject:to:cc:date:
 mime-version; bh=TSof57fzg2AD2wbonqaJI+EjHhFDeGJHuJklcT2Z6YM=;
 b=Ewmd/1n5IQ1bZzHDvU/TWWu3c32511G5l+q0QPGfcAVfGQWEgc0VROKwK2Gb40AOag481u
 QjK+W9Aqen2LXJmdalHkpt8HXVqacyGuLdf1vFgqm/E6/YbBhb/GQn2onMXxBRJvknTdlB
 zqOYTBwGSGtdeyGH4PuaWRflK2nApPGQlCACn21bDROFZHWRKniAMDZkwz13lr2uDk4BV/
 xBUjSYkKs9KGLaMHQZ44NpQI5kelp9QstdTK0VzxeBDz81+MPwJr/DvBWbmFgT9ElHjbQv
 pBNafYCA/rft11gKll51dKaUzr0fHOyvPGZErykZytWK6UZMvNzu34PBX1GY4Q==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 14:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220611

From: Jeroen Hofstee <jhofstee@victronenergy.com>

If a gomod is omitted with a PACKAGECONFIG option its license file
doesn't get extracted to the gomod cache dir and hence do_populate_lic
will complain that the license file isn't found. This adds a task
do_extract_lic after do_compile and before do_puopulate_lic to make
sure the license files are extracted in such a case.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta/classes-recipe/go-mod.bbclass | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
index a15dda8f0e..fbb68ad113 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -29,6 +29,40 @@ do_unpack[cleandirs] +=3D "${GOMODCACHE}"
 GO_WORKDIR ?=3D "${GO_IMPORT}"
 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
=20
+python do_extract_lic() {
+    import zipfile
+
+    lics =3D d.getVar("LIC_FILES_CHKSUM")
+    cache =3D d.getVar("GOMODCACHE")
+    dldir =3D os.path.join(cache, "cache", "download")
+    prefix =3D "file://pkg/mod/"
+
+    for lic in lics.split():
+        if not lic.startswith(prefix):
+            continue
+
+        try:
+            src =3D lic[len(prefix):].split(";")[0]
+            url, suffix =3D src.split("@v")
+            version, _, file =3D suffix.partition(os.path.sep)
+        except:
+            continue
+
+        cachefile =3D os.path.join(cache, src)
+        zip =3D os.path.join(dldir, url, "@v", "v" + version) + ".zip"
+        if os.path.exists(cachefile) or not os.path.exists(zip):
+            continue
+
+        try:
+            bb.note(f"extract {src} from {zip}")
+            bb.utils.mkdirhier(os.path.dirname(cachefile))
+            zipfile.ZipFile(zip).extract(src, cache)
+        except:
+            bb.warn(f"could not extract {src} from {zip}")
+}
+
 # Make go install unpack the module zip files in the module cache direct=
ory
 # before the license directory is polulated with license files.
+# Do make sure licenses get extracted for omitted modules.
+addtask do_extract_lic after do_compile before do_populate_lic
 addtask do_compile before do_populate_lic
--=20
2.43.0


