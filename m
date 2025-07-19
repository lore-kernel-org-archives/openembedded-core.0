Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE24EC83F27
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 15:01:28 +0000 (UTC)
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
 by mx.groups.io with SMTP id smtpd.web10.338.1752937286458798955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jul 2025 08:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=Qn4mm97i;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.17, mailfrom: jeroen@myspectrum.nl)
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4bkqcN04nKzTPMb1;
	Sat, 19 Jul 2025 17:01:24 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission1.mail.transip.nl (Postfix) with ESMTPSA id 4bkqcJ5hgnz2mZNWy;
	Sat, 19 Jul 2025 17:01:20 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 4C08D20075;
	Sat, 19 Jul 2025 15:01:18 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sat, 19 Jul 2025 17:01:18 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [PATCH v2] gomod: extract license files for omitted modules
Date: Sat, 19 Jul 2025 17:01:05 +0200
Message-ID: <20250719150105.2697443-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1752937280; h=from:subject:to:cc:date:
 mime-version; bh=AJVCNhy037yGCY0i/nSTz5iC/nZTb5SM4B0aY/TPhvY=;
 b=Qn4mm97ikLk+c0cpPXx9KFn/G3Sj3lyb6zF9QfaA1+a4/e6N2/9/5C2+ZGvQch6L/0ht2l
 nr2vKeqqm6Viz6NxPUGwqOBg0FudxNshSLYibmnYqjhdiJWv4FhrFgbwR0DzX0/6FfcSzw
 8EufLihyKz6/vVdEmGn0jMAbbo+Ev6XFIedgcBlLNaEXWapFgdWfSdPlS3Jk9Z7wyxrT4X
 5I7VIzdEXBBINLilRSp8h187LyiLq2gplRR8R4XV/mu7bSzfDa/f80jhTP1Dgb8tccPqSD
 MZ7IrdYT3bv7OMVBUBMHOT+t45FcfIXqCVUSwJQqpHblAxsTKvd/x2T2Y7nUOw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 15:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220613

From: Jeroen Hofstee <jhofstee@victronenergy.com>

If a gomod is omitted with a PACKAGECONFIG option its license file
doesn't get extracted to the gomod cache dir and hence do_populate_lic
will complain that the license file isn't found. This adds a task
do_extract_lic after do_compile and before do_populate_lic to make
sure the license files are extracted in such a case.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>

---
v2:

- drop bb.utils.mkdirhier(os.path.dirname(cachefile)), extract
  will create it.
- fix typo in the commit msg, it is do_populate_lic
---
 meta/classes-recipe/go-mod.bbclass | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
index a15dda8f0e..4c0496e1e7 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -29,6 +29,39 @@ do_unpack[cleandirs] +=3D "${GOMODCACHE}"
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


