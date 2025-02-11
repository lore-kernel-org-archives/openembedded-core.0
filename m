Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BB7C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:49:40 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.12832.1739281775035070906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 05:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKfX9IS9;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d15bacddbdso19952955ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739281773; x=1739886573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrNPaK5ks2gNEj38MSHPlHmjjHZ1WhER0QOCQH6HWqU=;
        b=SKfX9IS9lBbZUwXLwaxXG/aBriKDt6kzltA+KYwnRbVhvlSZ6Ri1j6CENCD/sRamEU
         bGwadBugwqTB21OldQcnkiP8L2s0TlBy6zi0lglLKA2EIUCWdm+Popj1p9ktlTID+G8V
         tsIw5MENk2rsGj6WP9AXM8fwXitj8c+g120HogClvVU4bShS8grT5S6hCAYBXIpgSHDj
         yF8YhzNIdLpyVG00AwhmOGkAh1EGbiPik8N0cyBDAp03gr6bj5I6J5uofCjsm63fSXP/
         /hC34WUg8Noorqansahbuqc6XoN5NVacT7Pd/0qTZr0DfyMErh2S1CDx00DNejPHeH3L
         WPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739281773; x=1739886573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrNPaK5ks2gNEj38MSHPlHmjjHZ1WhER0QOCQH6HWqU=;
        b=vGg75qaIjaFiTgdWDMtKDaJp/snZKifQohPKABXi1cF2vwTZ9HY94Z3sSXk2k9VAjk
         6EqRvQlvZSa7xVXD5ZuiZIYqpx4xyO25yP/ZWw8mshTSFNUrSuu4VR7tiE/ttt4OE1jf
         zZPuT5/B8pmk8iTGYb78YX3/FSXjfcEMStpeB/C2gspZEUcAhQrEkGCHg/FCZ4+WBxqh
         IhmtCio9UY2/Sj9WxNwEeIXiatD4sBkMOvBDXCmdE3zohgcfgnse/4t2WbzotHKLEF8R
         JGzEEkgmD/kIMmCpB7nlYhs8ZG1DkS3foxHQKXoWEy45mVwV4Tu/w0aa1fQjE1k1KX0Y
         m7Fw==
X-Gm-Message-State: AOJu0YwgGY9/h1DmbjQmmyJ0Px+bKTVyUBkAdb5uqTOidZ2HixAPQHX0
	tOLaEH8rbwqDJjiaVS6YpB1pe1RLKCT42KAqPWYPXLocTbVEUIa/IaYQaZ+n
X-Gm-Gg: ASbGnctBM6WOZOnA+sBtapEFUhydTkziku/L+cQrx3oNLqAlEqvzsLrgKkyYIt56lEw
	SO07p0aeLIQ08hE44xg5I/j3rUqLJxDM7BZ7rO+AR+d2vRru8Zrp7GPvk5BWbIZE6ngWlMgOXyu
	5q/BCg/AOHCpRpa4ukCvuUnFXDONM9PdPJGPq7IgCDN0QiaEqFc6ZSalbNrATzxclZPMNiGTQAg
	HHXWoRiktOZIsCFByUGPpf3vB/qzNC3atQx8NgWfnc3m3ji41PtrSA2vF7H84978cpKN53BtZCR
	oPou8AIQW0xD6mEFPAmYroUGk8qbFw==
X-Google-Smtp-Source: AGHT+IGexf9sWCrid6aRxnRLoA/j48b5kCAcZKmS0E8Kch81pOfK7KHwsn5clGK63RlN859aTNpfEQ==
X-Received: by 2002:a05:6e02:3421:b0:3cf:bb3e:884c with SMTP id e9e14a558f8ab-3d13df2bf5amr155313835ab.16.1739281773451;
        Tue, 11 Feb 2025 05:49:33 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecdc1c3ed7sm2306289173.87.2025.02.11.05.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:49:32 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] classes-global/insane: Look up all runtime providers for file-rdeps
Date: Tue, 11 Feb 2025 13:49:18 +0000
Message-Id: <20250211134918.95565-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211134918.95565-1-colinmca242@gmail.com>
References: <20250211134918.95565-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211125

From: Joshua Watt <JPEWhacker@gmail.com>

Uses the new foreach_runtime_provider_pkgdata() API to look up all
possible runtime providers of a given dependency when resolving
file-rdeps. This allows the check to correctly handle RPROVIDES for
non-virtual dependencies

(From OE-Core rev: 018fa1b7cb5e6a362ebb45b93e52b0909a782ac9)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dfda70bad6..f4b4c05e3d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -761,13 +761,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                         continue
                     if not rdep_data or not 'PN' in rdep_data:
-                        pkgdata_dir = d.getVar("PKGDATA_DIR")
-                        try:
-                            possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
-                        except OSError:
-                            possibles = []
-                        for p in possibles:
-                            rdep_data = oe.packagedata.read_subpkgdata(p, d)
+                        for _, rdep_data in oe.packagedata.foreach_runtime_provider_pkgdata(d, rdepend):
                             if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                                 break
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
@@ -811,17 +805,17 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     # perl
                     filerdepends.pop(rdep,None)
 
-                    # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
-                    rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
-                    for key in rdep_data:
-                        if key.startswith("FILERPROVIDES:") or key.startswith("RPROVIDES:"):
-                            for subkey in bb.utils.explode_deps(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
-                        # Add the files list to the rprovides
-                        if key.startswith("FILES_INFO:"):
-                            # Use eval() to make it as a dict
-                            for subkey in eval(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
+                    for _, rdep_data in oe.packagedata.foreach_runtime_provider_pkgdata(d, rdep, True):
+                        for key in rdep_data:
+                            if key.startswith("FILERPROVIDES:") or key.startswith("RPROVIDES:"):
+                                for subkey in bb.utils.explode_deps(rdep_data[key]):
+                                    filerdepends.pop(subkey,None)
+                            # Add the files list to the rprovides
+                            if key.startswith("FILES_INFO:"):
+                                # Use eval() to make it as a dict
+                                for subkey in eval(rdep_data[key]):
+                                    filerdepends.pop(subkey,None)
+
                     if not filerdepends:
                         # Break if all the file rdepends are met
                         break
-- 
2.34.1


