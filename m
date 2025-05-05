Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768DCC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 10:29:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.46939.1746440939554646463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 03:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YAfNpYh2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250505102856c4965406cb41b8ec20-dvmvad@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250505102856c4965406cb41b8ec20
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 May 2025 12:28:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bBJpIvyvia+gCAksqkyuiwe8PO214paTy1TRltQmcfI=;
 b=YAfNpYh24ZvdAkT9Ujbt+HaYS0WAct5Mq6zBCbv3Hb5Gu9sTMh1TStgWoN5yr43tTGQYEQ
 fmMRx3PGlH4QGPiU0iBDXfXqE4+Olnoe3/5N8fwJtnZdL4PiNiGceTcaM4O72EZQexvAjI3r
 KZyhsxEbF4l6JFNeLW151GNNBuG7vPIHywpNAOIESoUyEaex19bnjF6wGd5KsQYmqJmwhNYJ
 iH93Wy55MkOroq7CPReLU1B+4qooyzmDs7XWbP6efmAVHIbuwsMCsldklIhik7J0I8FPa9eb
 20cVcPz2U5gmTp3GgNFhDuz5LB9JACBH+5fhRtb1UMzQUqN/oGJ90rjA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] vex: fix rootfs manifest
Date: Mon,  5 May 2025 12:27:56 +0200
Message-Id: <20250505102756.2474521-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 10:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216004

From: Peter Marko <peter.marko@siemens.com>

Rootfs VEX file is created by gathering files from CVE_CHECK_DIR
(deploy directory), however recipes generate the files only in
CVE_CHECK_DIR (log directory).
This make the rootfs VEX be always empty without any message.

The code is copied from cve_check class, which writes to both, so let
keep them aligned and make also vex write both files.

Also add a warning for case that a cve file would be still missing.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/vex.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 905d67b47d..402d8e0d96 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -196,6 +196,8 @@ python vex_write_rootfs_manifest () {
             with open(pkgfilepath) as j:
                 data = json.load(j)
                 cve_check_merge_jsons(json_data, data)
+        else:
+            bb.warn("Missing cve file for %s" % pkg)
 
     d.setVar("PN", save_pn)
 
@@ -290,9 +292,12 @@ def cve_write_data_json(d, cve_data, cve_status):
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
     index_path = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
     bb.utils.mkdirhier(cvelogpath)
+    bb.utils.mkdirhier(os.path.dirname(deploy_file))
     fragment_file = os.path.basename(deploy_file)
     fragment_path = os.path.join(cvelogpath, fragment_file)
     with open(fragment_path, "w") as f:
         f.write(write_string)
+    with open(deploy_file, "w") as f:
+        f.write(write_string)
     with open(index_path, "a+") as f:
         f.write("%s\n" % fragment_path)

