Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ACCCF2C8
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:45:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31441.1768812301486570502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=iD3O0GG1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86D5CC2033F
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:44:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E01060731;
	Mon, 19 Jan 2026 08:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CFC310B69783;
	Mon, 19 Jan 2026 09:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768812299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=jwQNqtMOMUfFHbaAG8y02Th7Zexl8PW0nNX3o8JIy0k=;
	b=iD3O0GG1zrDyfhz3yiCJApvwXelNVCM5VylchppD2sxn56SEFli27mS1UnUOigjSlkt9Ji
	95gCJoD4FvL2v9a8X5XnSWSd1fGaaVg0VCLlgeSK4TsSwE4nLqE+QRVdB8xWuo4VLeMkEW
	G3a8PtgrRP+paqbVDOfvF37+XSWv3XD9OfPoyBgdWw/3viqz2ZH4z1Z3GGo9Uf/H2tErn8
	a6RkHd3PTivEgHHTfcCoxH07kpzuY1o9FHVJGhu6Ze3piSGJdFEM3qnHY5s5hg3ZS4iLzG
	zJbuUgdQ9yZHzPdDz7DP5AFfOaK2/+8njPuKfrOPBnxR1AhOWb2c5ZZBV79FXA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	jeremie.dautheribes@bootlin.com,
	jpewhacker@gmail.com
Subject: [scarthgap][PATCH v2] meta/classes: fix missing vardeps for CVE status variables
Date: Mon, 19 Jan 2026 09:44:50 +0100
Message-ID: <20260119084451.8559-1-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229596

Several CVE helper functions (get_patched_cves() and decode_cve_status())
implicitly depend on the CVE_STATUS and CVE_CHECK_STATUSMAP variables, bu=
t
these were not declared in the vardeps of their callers.

On Scarthgap, the upstream fix (2cc43c72ff28aa39a417dd8d57cd7c8741c0e541)
cannot be cherry-picked cleanly, as it also requires BitBake changes.

As a workaround, explicitly add CVE_STATUS and CVE_CHECK_STATUSMAP to the
vardeps of all tasks invoking these helpers, ensuring correct task
re-execution when CVE status changes.

This keeps CVE-related metadata generation consistent without requiring
BitBake modifications.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
changes in v2:
 - provide a clearer commit message

 meta/classes/create-spdx-2.2.bbclass | 1 +
 meta/classes/create-spdx-3.0.bbclass | 2 ++
 meta/classes/cve-check.bbclass       | 1 +
 meta/classes/vex.bbclass             | 1 +
 4 files changed, 5 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index aaa2e78fe211..037193bb4b96 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -710,6 +710,7 @@ python do_create_spdx() {
=20
             oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", inde=
nt=3Dget_json_indent(d))
 }
+do_create_spdx[vardeps] +=3D "CVE_STATUS"
 do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack do_coll=
ect_spdx_deps before do_populate_sdk do_build do_rm_work
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 6125e8b54794..388497054b09 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -159,6 +159,8 @@ do_create_spdx[vardeps] +=3D "\
     SPDX_PROFILES \
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
+    CVE_STATUS \
+    CVE_CHECK_STATUSMAP \
     "
=20
 addtask do_create_spdx after \
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index f5bbaa5d159a..3f4704fb4ec2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -187,6 +187,7 @@ python do_cve_check () {
 }
=20
 addtask cve_check before do_build
+do_cve_check[vardeps] +=3D "CVE_STATUS CVE_CHECK_STATUSMAP"
 do_cve_check[depends] =3D "cve-update-nvd2-native:do_unpack"
 do_cve_check[nostamp] =3D "1"
=20
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 707e6f45a19a..45a15348724b 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -160,6 +160,7 @@ python do_generate_vex () {
=20
     cve_write_data_json(d, cve_data, cves_status)
 }
+do_generate_vex[vardeps] +=3D "CVE_STATUS CVE_CHECK_STATUSMAP"
=20
 addtask generate_vex before do_build
=20

