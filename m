Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2F7CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:30:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.35615.1697740247925077580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 11:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iPMMeE4P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202310191830446646cf7724417682bc-1_c2wk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202310191830446646cf7724417682bc
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Oct 2023 20:30:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=A+gZ465tfcYWXnZVu54JyrEDygogk9O5oLp0XCA6BWo=;
 b=iPMMeE4PGj5r7NV8uU/QGnkVOYWyQkeK9ZunbD6p2AnU4HUh9vt79FCfoaCZERUrq1y6+z
 8r/iENafhTO0XChr9iS9kTTulKAq1pPV63HV5SXb5c3LrJ7iwNFk2HSo0/1k6hofHs0BKE/g
 KDKNwevex5gpp6f60fcLl/Fj1BvWo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] zlib: patch CVE-2023-45853
Date: Thu, 19 Oct 2023 20:30:01 +0200
Message-Id: <20231019183001.731256-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189480

From: Peter Marko <peter.marko@siemens.com>

Backport commit merged to develop branch from PR linked in NVD report:
* https://nvd.nist.gov/vuln/detail/CVE-2023-45853
* https://github.com/madler/zlib/pull/843

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 42 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 0000000000..ba3709249b
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
@@ -0,0 +1,42 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+CVE: CVE-2023-45853
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index f768b41988..d75474dcb6 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2018-25032.patch \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
+           file://CVE-2023-45853.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.30.2


