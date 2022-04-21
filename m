Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716ABC43217
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.838.1650575512467129269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 14:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=V8FryFJe;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650575513;
  x=1682111513;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V+0oNHQnxMo/TfXFW+4JUve2+9IMBaj+YEIoNRi6xz4=;
  b=V8FryFJePA4/bVjGv+DPZhejhKU0XhG1LYyOeAHqwVXx8NE1bF+Lsqsi
   /9XrKj0X8yN+2/p4h7iHJ89zQeObVhlxljiFGsbDohTRXRIiaaJ1uAjAG
   ifn92SUp0pp7AjLTBLn5s8cdREGN20bHPOwc+0gfCEgbO03DS7U0L4IXs
   2FsGB/pmvrEERQdetJarouuWblO3jVkjLTKyMCJ5gjTkTm22Jy500cLWJ
   O/IpHTtr0T+5pAcjOfTtaJvh6w0PzUwPrEEiK64VQrQZ0ZHXjSBMmXelJ
   8ScmmtwFqZ9U9jW7X+gp23ApF0HeMah0guFzPyPHik6mpqvyFkAeCPIZB
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][kirkstone][PATCH] license_image.bbclass: Make QA errors fail
 the build
Date: Thu, 21 Apr 2022 23:11:46 +0200
Message-ID: <20220421211146.19368-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164766

If, e.g., license-file-missing is added to ERROR_QA, then the build
should fail if any licenses are missing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license_image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 7e1d0e08a9..3213ea758e 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -104,6 +104,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                        "The license listed %s was not in the "\
                                        "licenses collected for recipe %s"
                                        % (lic, pkg_dic[pkg]["PN"]), d)
+    oe.qa.exit_if_errors(d)
+
     # Two options here:
     # - Just copy the manifest
     # - Copy the manifest and the license directories

