Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E093EE6440
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 13:44:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85214.1767188656164070713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 05:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=nGMcwsVt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B2C61A2560;
	Wed, 31 Dec 2025 13:44:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D598560744;
	Wed, 31 Dec 2025 13:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97665113B076B;
	Wed, 31 Dec 2025 14:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767188653; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Mg9i5eNKsKNVLur65PcCeSHox6Yp3/c2NoVyvgiuh+M=;
	b=nGMcwsVtwjn9T6bLoGCs2oBWoSqrARopo1DNwVb3T3pilP1c9t7ptz+3S6ECnFlo3m4D25
	QkPlMGHMiD8Q3cOpyBI4x+1AGgo7eTD2JySVuG5jNBBoX3ctIaQLeUZ4CZihkPb2tbgfW8
	F+sKBHqz4t80rdx70Q7yge9z4iyQp4+Y4rKXENh3HRcAfzdn5V2Xkrt4Q7fltMMtcahcRG
	11aQIppR7BkKNP+NcasQLzYnLGrEQ7qt2ZKXnu5IIg5eI3/3918/pAM5PU6mQQpQmp2FEa
	AHnW2cjm27dStBuLEEJAY73XUiI7guTlDXPFfXpbQ7M6nImY6qwQuY/v+wyq/g==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	jeremie.dautheribes@bootlin.com,
	jpewhacker@gmail.com
Subject: [scarthgap] meta/classes: Add missing CVE variable's dependencies
Date: Wed, 31 Dec 2025 14:44:09 +0100
Message-ID: <20251231134410.233707-1-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 13:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228747

The proper way would be to cherry-pick the following commit:
2cc43c72ff28aa39a417dd8d57cd7c8741c0e541
But this also requires applying a patch to bitbake to handle that.

So, for Scarthgap, add (manually) the variables CVE_STATUS and
CVE_CHECK_STATUSMAP to the vardeps flag of all callers of the following
functions: get_patched_cves() and decode_cve_status()

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
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
index c0a5436ad68f..309403abe162 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -148,6 +148,8 @@ do_create_spdx[vardeps] +=3D "\
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
--=20
2.52.0


