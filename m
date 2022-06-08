Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C95CCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7224.1654699200772245583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BQnnvUpf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso18521025pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=drLWR4ndQRQwwEoHrYbEEZoqyr6k6qwuqvYaSQNr8+A=;
        b=BQnnvUpf8PBPX2kq0VNgcyzu52c4Hk8MOz8dPlRkp/NdjPMBRmvr2FpiIiADZynAry
         fO1xejL2HzQI7CXhYS0JL3n3OZMeM5LulxqTu2OMNHOWMPWjPp2SQZd/v5Y+iiA4T0DL
         RLvthz2MwKjNe/lRfHNx6Vm9Q0eb1YQHTa9wvGQDLMiEGNKg5p+OuK23ikUjphX0Q4lx
         krDYefO4sTDHFQ5+WzR0BIXGBNC7ya3eyypSXGlQPyUlTxjDvGiFpZpGA4R2/GbsXfaO
         oJibx1dH4q5cFQM6pXgrXIOKk3ss/jpdncxUtBAP7U/WxiurPialGWC+MzLDKEd13uDx
         /3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drLWR4ndQRQwwEoHrYbEEZoqyr6k6qwuqvYaSQNr8+A=;
        b=k+e9sc+3eMPKxXsTSKrUAuDZfKhHNp9kaNTzkMPMrP1Igw3g+MGU+pqnMAx5VNiBlt
         +LG0hQw6RX3XgQlXJ6vhkrNWoUkWBMTOpkLP1q8G+WN85++Lh8Pvhm4t+n1XqtyC2QCJ
         BQa4RDnafdX2TIDB8p1U/+7L01dYM9nyeP0F6C2s/9ajm7OQwTlwgmViaPZzcJIdVvnC
         NB6KD8U4M0qENich32JUbi9IS5FgP+xzdoCTzk2JmenEAGp4lzRn1QeMmQvl+5r3gLiJ
         0PavTOczEl0YTZELRzkB6U1r/tqSlBWzXkR+j+HDhcL63FOzpgGMi/TblPv79lkFN+NB
         V9TA==
X-Gm-Message-State: AOAM533kMHjDlEpQm25liF3r5j0n+BHuvJuQv23X/S2Sviwtc/s9yPRT
	nDYi/CnNyWCFjivhufm/6+m5SYlCBxD2rrET
X-Google-Smtp-Source: 
 ABdhPJzZZPC9lTnMxxgDtAbj3FFPCeTqaju2SCLGfSCcsPBsYUJ5BpZpHnMr43SFymnJGZ7Qt9FyMA==
X-Received: by 2002:a17:90a:5d04:b0:1df:91d7:5563 with SMTP id
 s4-20020a17090a5d0400b001df91d75563mr72988025pji.95.1654699199677;
        Wed, 08 Jun 2022 07:39:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:39:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/22] cve-check: write empty fragment files in
 the text mode
Date: Wed,  8 Jun 2022 04:39:15 -1000
Message-Id: 
 <79c02facd3f248122b4b7a6bd00192151e4a6406.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166713

From: Marta Rybczynska <rybczynska@gmail.com>

In the cve-check text mode output, we didn't write fragment
files if there are no CVEs (if CVE_CHECK_REPORT_PATCHED is 1),
or no unpached CVEs otherwise.

However, in a system after multiple builds,
cve_check_write_rootfs_manifest might find older files and use
them as current, what leads to incorrect reporting.

Fix it by always writing a fragment file, even if empty.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1b7877acd0f6e3626faa57d9f89809cfcdfd0f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3844efcddb..0c5f40b78d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -435,23 +435,22 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
-    if write_string:
-        with open(cve_file, "w") as f:
-            bb.note("Writing file %s with CVE information" % cve_file)
-            f.write(write_string)
+    with open(cve_file, "w") as f:
+        bb.note("Writing file %s with CVE information" % cve_file)
+        f.write(write_string)
 
-        if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-            deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-            bb.utils.mkdirhier(os.path.dirname(deploy_file))
-            with open(deploy_file, "w") as f:
-                f.write(write_string)
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+        bb.utils.mkdirhier(os.path.dirname(deploy_file))
+        with open(deploy_file, "w") as f:
+            f.write(write_string)
 
-        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-            bb.utils.mkdirhier(cvelogpath)
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+        bb.utils.mkdirhier(cvelogpath)
 
-            with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-                f.write("%s" % write_string)
+        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
+            f.write("%s" % write_string)
 
 def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file):
     """
-- 
2.25.1


