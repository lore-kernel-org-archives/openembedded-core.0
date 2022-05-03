Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA64C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 07:52:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.8344.1651564368751808463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eGl5QadD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g6so31929528ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9S/s97q9g2YriXsbU9V+K/nYWtNPRXXnSqQSGCiLlE=;
        b=eGl5QadDRpOU2jBRHxME4COazYknIpzXm+rnt1i9Prjd573oBtlyS8XHE2VXmhzMHE
         l0XvSrg+jcPKbGc3FjKBkh721OdpWnCc/CXQbfKpwe9odo6BPyUXmZzTOX7PAe1t0UXf
         Z5ICSMtydv68411B3OTrep3/4AZLg1Z53hyZTEf/4HQVTuLXJo7dLJtXFEK0FrCYuu9Q
         QU+wqtADv+EPAjrDgNi9NVqpGwUZ+Hq22TRc2Tx237Pt40rEGzUsYFa4t2ZtWiMJXJfO
         JWlWYzSxFP6b3ZNKvdoEC3EOOrTAaurZxKB75Ymwijd3iBbajvutbvnGY/1aBC9/WvHg
         AHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9S/s97q9g2YriXsbU9V+K/nYWtNPRXXnSqQSGCiLlE=;
        b=cHfGoUOKbNZFZQm2vUgK8AA+Jr11ZZSa2cSsq2WL/ZQw6rRP1PIOCLdyfUzrNtiNJ9
         c5RVElhTvRXeCULXGWmbOHS+079+6WZ4yIiJ2P9Y1QGZ6sw85FuE5Q7kLuRY9IyFRwKX
         jP+VufCqHti69q8veM8DuqZTQIkzbunkxY7E1CQgHiRltjdxFh09eZHwyjoAp/uoX7L2
         N0p7zaXfFQU/fNbNrY3BEjoud9fcGKwTBaqUbfHlrFNHxKcCdRobLtp6qc/UR7g46hsj
         EmGZAJqOmkaUqMJQaCbHmbToYcsZdcXCGEwASMymBNYYy+w211q9KVcnPgwdlaWUiatE
         N9WA==
X-Gm-Message-State: AOAM531x6UL6hNj19WcrDQTNZUTyGusmMk34s9LK0u5tr/dQdpyrSl5p
	l8mTrfoY+h2b5VLmj+J/p/CNembwdPw=
X-Google-Smtp-Source: 
 ABdhPJw0KA5jgc0j+9eeV8OYKfeRoBO3yWVKvWAaXTiypt+STpwl20bJ2rDxqNYBVnD16PROQ8+RFw==
X-Received: by 2002:a17:906:119b:b0:6f3:99ee:ecab with SMTP id
 n27-20020a170906119b00b006f399eeecabmr13989986eja.367.1651564367007;
        Tue, 03 May 2022 00:52:47 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-163.retail.telecomitalia.it. [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 eb22-20020a170907281600b006f3ef214e66sm4344547ejc.204.2022.05.03.00.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 00:52:46 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] cve-check: fix symlinks where link and
 output path are equal
Date: Tue,  3 May 2022 09:52:44 +0200
Message-Id: <20220503075244.7751-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 07:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165193

An if statement now checks if the link and output path are
the same, if they are then the link is not created,
otherwise it is.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/cve-check.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e4e7240..8a53660 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -121,10 +121,11 @@ python cve_save_summary_handler () {
 
         if cve_summary_file and os.path.exists(cve_summary_file):
             cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-
-            if os.path.exists(os.path.realpath(cvefile_link)):
-                os.remove(cvefile_link)
-            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+            # if the paths are the same don't create the link
+            if cvefile_link != cve_summary_file:
+                if os.path.exists(os.path.realpath(cvefile_link)):
+                    os.remove(cvefile_link)
+                os.symlink(os.path.basename(cve_summary_file), cvefile_link)
 
         json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
         json_summary_name = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
@@ -198,10 +199,12 @@ python cve_check_write_rootfs_manifest () {
 
         if manifest_name and os.path.exists(manifest_name):
             manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-            # If we already have another manifest, update symlinks
-            if os.path.exists(os.path.realpath(manifest_link)):
-                os.remove(manifest_link)
-            os.symlink(os.path.basename(manifest_name), manifest_link)
+            # if they are the same don't create the link
+            if manifest_link != manifest_name:
+                # If we already have another manifest, update symlinks
+                if os.path.exists(os.path.realpath(manifest_link)):
+                    os.remove(manifest_link)
+                os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
 
         link_path = os.path.join(deploy_dir, "%s.json" % link_name)
-- 
2.32.0


