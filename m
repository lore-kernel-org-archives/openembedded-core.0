Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7651FC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.101644.1709565813419739741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QMF8D2aX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so4234181a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565813; x=1710170613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Br9F1iYByhGyf2ISJnIKmQh26wZLk0ioi8exVcDvY=;
        b=QMF8D2aXsO8/cS328ChXmLosEo346TJGfoLbl8ZpOK9yxP/l5i5vvWex8PdrEJfTME
         OEO96wOJkf/0SnkDCum4pKM65ZNQ9qKfSbh+sBX1xB/vYD5somQX+KXnYETxf8J9nLLB
         cMduqDhdn7294QFGoQXk+2Abw+pKsdjs7dVFYAhTeEeJODUDH9DwvSozfCGhqIW4qZgY
         7efLXRctAkznt2dcmYka+8y/HVN+gxJbYW7rFuyxPcOPY3IHiyEj2s4qitFUFb/oOsJL
         A1aPnWgmHSU3uZnKS47uy3cdiXFCwTKte5rB7WiHz2BdPgY6j9aL3RIShD5PFSwYvASa
         XNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565813; x=1710170613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+Br9F1iYByhGyf2ISJnIKmQh26wZLk0ioi8exVcDvY=;
        b=rHMbRRqw8Rhi1lZDtn4NHa79STJLyZV0pO1YzDZBpJJeHcVAtM/YdtGDGC7K1IySUN
         JHGsSyUZI0UcLO+u3HMV4b82Xa865wFqzbj7/6kiqEpiJ/GtKuTaj7KvWvUyz9Rm1VXx
         wOgj0jwMHYvOf3oy3WJFqeShpuj49Ww4LLLb5kPf1HQmpEJi/yOTXmICV8Y6YgJGTrgF
         oVf3AIaN4AFbiByEaztS3djZ9ZdNpilcX4BiE7oYGCe4o/SRxPVJoqArueNc45hlXYAZ
         xzde5eNHmSKPzreEpAzLnud1a3i8Cx9ZyszHtCdq3jRdV4OEoNKwFvnGDUBFong3mLgG
         X3og==
X-Gm-Message-State: AOJu0YzX2/gNrpQm+y5ns2GVIeVe5bIphN+8JZMI2KrBxMvtpzC0Y/xR
	wJSfH5TJUVkxPktJMA0rzHd067sWw3ZXUnARuZ+adkxk+xB0tnD8ey217gUvH0m+hMAKSTP0k8r
	wuag=
X-Google-Smtp-Source: AGHT+IGSVUnCUfljy3Afmjq3wyTNGy23JQedr6MnH4kEHWT8K6ccV5RL3YLAGXvCRCIbcBkGHKv7ZA==
X-Received: by 2002:a17:90a:7805:b0:29b:789:802a with SMTP id w5-20020a17090a780500b0029b0789802amr7611891pjk.31.1709565812819;
        Mon, 04 Mar 2024 07:23:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/11] cve_check: cleanup logging
Date: Mon,  4 Mar 2024 05:23:12 -1000
Message-Id: <1745208bc08037497ad9de1be15a3cc4a22ceff5.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196605

From: Ross Burton <ross.burton@arm.com>

Primarily list the number of patches found, useful when debugging.

Also clean up some bad escaping that caused warnings and use
re.IGNORECASE instead of manually doing case-insenstive rang matches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10acc75b7f3387b968bacd51aade6a8dc11a463f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 65b1358ffc..ca2b393116 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -73,20 +73,19 @@ def get_patched_cves(d):
     import re
     import oe.patch
 
-    pn = d.getVar("PN")
-    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+    cve_match = re.compile(r"CVE:( CVE-\d{4}-\d+)+")
 
     # Matches the last "CVE-YYYY-ID" in the file name, also if written
     # in lowercase. Possible to have multiple CVE IDs in a single
     # file name, but only the last one will be detected from the file name.
     # However, patch files contents addressing multiple CVE IDs are supported
     # (cve_match regular expression)
-
-    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECASE)
 
     patched_cves = set()
-    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
-    for url in oe.patch.src_patches(d):
+    patches = oe.patch.src_patches(d)
+    bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
+    for url in patches:
         patch_file = bb.fetch.decodeurl(url)[2]
 
         # Check patch file name for CVE ID
@@ -94,7 +93,7 @@ def get_patched_cves(d):
         if fname_match:
             cve = fname_match.group(1).upper()
             patched_cves.add(cve)
-            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+            bb.debug(2, "Found %s from patch file name %s" % (cve, patch_file))
 
         # Remote patches won't be present and compressed patches won't be
         # unpacked, so say we're not scanning them
-- 
2.34.1


