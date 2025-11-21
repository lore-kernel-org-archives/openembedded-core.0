Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA21CFA76A
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8230.1763718867480578953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vQdROfTd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2643C1019C;
	Fri, 21 Nov 2025 09:54:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1FD60719;
	Fri, 21 Nov 2025 09:54:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D899610371E89;
	Fri, 21 Nov 2025 10:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=L8UW3c1R008XEdue4HpXTQbvoycIwuhixU+JiLGQn0w=;
	b=vQdROfTd7jUrlgJr3fFL5yvupKP72hwBfnoxaAd41Wu+WR0QdrWE/vaD1/Dc6jNBoNS7Bt
	ZOQbJUhf+HHT/C9rai5CffwqhkvFYufVQSo0/ACeTI9OhFLmJSnjwqb4Bgq0zB6PsB5s9K
	ko5hFPOV+lOw8FKySrR4kIeezSANImW1FQnK8E2N5UXtdYqze8lW3xu7Fw15zs6l6RYQAc
	4YjZXYLce14EVfjZ/ZX4B/fEETv6+D5R9nwn7sLnlKO8BfnAZLHs7I1iVGWZLqxPqkYq01
	3r71zlW1ZzkkFTdR4Q0aF1Q3AVm29OaPrliR3wqkrqabc3+5QyhyFvYQM8sSXw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 5/5] vex: fix rootfs manifest
Date: Fri, 21 Nov 2025 10:54:13 +0100
Message-ID: <20251121095415.288301-6-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226662

Rootfs VEX file is created by gathering files from CVE_CHECK_DIR
(deploy directory), however recipes generate the files only in
CVE_CHECK_DIR (log directory).
This make the rootfs VEX be always empty without any message.

The code is copied from cve_check class, which writes to both, so let
keep them aligned and make also vex write both files.

Also add a warning for case that a cve file would be still missing.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee6541d0940c65685aaafd7d41a59a9406392e7d)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/classes/vex.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index c447b37db89b..707e6f45a19a 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -213,6 +213,8 @@ python vex_write_rootfs_manifest () {
             with open(pkgfilepath) as j:
                 data =3D json.load(j)
                 cve_check_merge_jsons(json_data, data)
+        else:
+            bb.warn("Missing cve file for %s" % pkg)
=20
     d.setVar("PN", save_pn)
=20
@@ -306,9 +308,12 @@ def cve_write_data_json(d, cve_data, cve_status):
     cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
     index_path =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
     bb.utils.mkdirhier(cvelogpath)
+    bb.utils.mkdirhier(os.path.dirname(deploy_file))
     fragment_file =3D os.path.basename(deploy_file)
     fragment_path =3D os.path.join(cvelogpath, fragment_file)
     with open(fragment_path, "w") as f:
         f.write(write_string)
+    with open(deploy_file, "w") as f:
+        f.write(write_string)
     with open(index_path, "a+") as f:
         f.write("%s\n" % fragment_path)
--=20
2.51.2


