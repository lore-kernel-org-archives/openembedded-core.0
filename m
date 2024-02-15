Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C64DC48BF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.18119.1708013905874131851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qg9L4T+y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d934c8f8f7so9812905ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013905; x=1708618705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox63t4CTDyfuSP1K2iHvQALwf0QveLqaifrMP40Va+4=;
        b=Qg9L4T+yQCCLhkt42gz71P5MDiZyGYJ8O+B3OonOX9Sno7USHBVf/knymIheWHyjW9
         WNXBu7hdNcADH+w4Fg1HMYP/lDuh6q8leBESgzlvE54i1knEYnPiydQcbFDdagCL0KQs
         zOljfTNvIKEYmjmh6Mc2oJxmzKEKDnnJ8Nc4b3vWTIQV6kYz+wiBpVZ/+H8BkDOysafR
         +JQZtCAHmBLKWpT4LFiWi11arprsbJt6ksdAqzlxCBV679X9vBo5Q58WMlC+JYDhPt42
         KvGzBGoT6cT8sS5B/liE3qYIdppqaE3FIwy57US9e0bdbjnA1A/x2y+1mX+SE0ar5VLj
         e1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013905; x=1708618705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox63t4CTDyfuSP1K2iHvQALwf0QveLqaifrMP40Va+4=;
        b=BvnqzSoFs3ttUNId5fFJaFyW5TEaftzGlMI52ZzTS4BJVL2Mn5R2k2ZZZBBRTOwnqA
         eNEQkEq5GslYKvZkNr8/EHZdH9h/7I2l2Tq/6YddExL9epbjj+G6iX+2vjNuHlUpL59Y
         DU/IOYGmfInGTFIroEXrDLtchH6wdmZbPNMYoO+TGNF0n0HoCqQ0bUABpAeb0zhWx+AC
         0I4k5bfc0ig9DGBN/1T/M7NA7xv5NIyZNeoH6PncUJ0b9YFc6b+TVr/aKsNqyxzQDXf8
         /aB3XCeKkb9y622qZ+4wiLR3VTpEhIOCEckMjKX4x8+lutMr1xAPhEThdTIfnGtjy9sw
         74hg==
X-Gm-Message-State: AOJu0YzzsWX+RUQIFvJLGrDsYB1GgHW2f6bW6l1CYuG+l7Z+xQB4Bu9u
	i8arQDwzErF1+PdluJxLjK5OpZp6MTX+ze8gXhZNxM+rJJWr1MuraBKwb5yFPESb4XG3YH/uOJj
	zr/s=
X-Google-Smtp-Source: AGHT+IExFBrEA7hsaEzm379U5VNKf6Opy/eCZ8m/0GdtnIawkCo8biba5+U4AEp6hbW3UOx1/TxlSQ==
X-Received: by 2002:a17:902:ea0e:b0:1db:6de7:f053 with SMTP id s14-20020a170902ea0e00b001db6de7f053mr2250277plg.66.1708013905148;
        Thu, 15 Feb 2024 08:18:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/21] cve_check: cleanup logging
Date: Thu, 15 Feb 2024 06:17:50 -1000
Message-Id: <55d7393eda71fa37a93c1a0f5c8f7f18640cf079.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195526

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
index b5fc5364dc..ed5c714cb8 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -79,20 +79,19 @@ def get_patched_cves(d):
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
@@ -100,7 +99,7 @@ def get_patched_cves(d):
         if fname_match:
             cve = fname_match.group(1).upper()
             patched_cves.add(cve)
-            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+            bb.debug(2, "Found %s from patch file name %s" % (cve, patch_file))
 
         # Remote patches won't be present and compressed patches won't be
         # unpacked, so say we're not scanning them
-- 
2.34.1


