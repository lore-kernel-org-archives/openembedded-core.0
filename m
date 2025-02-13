Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C3C021A5
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:26:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.12087.1739456801108327516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=corahBoo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c4159f87so12536145ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739456800; x=1740061600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6UPa5EYmSiz6djPcwLz4pyVwq+uC9v1SMG7coN8Wt4=;
        b=corahBooAaxbcAYcb4pSI3XfMl60NFYyq98dEVOL1iwf4NQXhfz8yomW+BLEAG4abI
         F82VtIs+byXzAPUTsw03fnqaPSjaNDXlvXH26EJbCSIypdGClOlYsJLRrCYnIkGnr+82
         YLIcb3OhLK8xMuOQhOlMpL3hhSQBS0MNW//UkdZQ6EL9IMcL/3qfbavrW2T4xx9OgHii
         XSNYDV5F8GvAy0Xjxx+BTrNc7B7uursBqohn6JCuenIGeIN7CjJlfFeaRTLcq4+lEQ1b
         pNrS3V/Ltska8mnYu4fCcyInAt2Q952p3yxvbLcA8rgd24Y1rbqLYJVSKkLLUP6f7guB
         GCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456800; x=1740061600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6UPa5EYmSiz6djPcwLz4pyVwq+uC9v1SMG7coN8Wt4=;
        b=uhMVICxi+SuUOOodebAO9DaK40G/enwpDWTJsFeFZ4wG6vjs8THWZcHiJUhlil/bYP
         8NiSfgGekXceQe5FyqeKrdME5pdGtdzwyRFMXD4dDfQl4bjvYGKBL51YMYRK711m7N6E
         yH/HSileuNFemebBW1ksWKzz0RKvZvuTilE2Yg8GKuTxc//DAncEhYOthV0Gg/++jrd8
         T7ieEv+qbM2p4xvQl09HiBGnNRQR8Z/VwQg+pNwz8cy/ndpN8ESGa15m2efYit7OYuJN
         +TWT7xACB7BZbWTl0Ufuzqnqh9pI7QA9gSGslfSVzGKePFOiaLjeJO5MHQ8O3gzz1XwS
         KHHQ==
X-Gm-Message-State: AOJu0YyRrnTrYVQsGIXr+S3HZyD8gynGibH4liH9R8jb5yaZ277ed2Nc
	EZnZIqUw3fTwAQtoK2eJ+sBf0l+b6k6tx5dapbvaeMTUBw1pwT/bt2FZtMmlCznLATx2pvpUVN8
	9
X-Gm-Gg: ASbGncvUMfwlNksFk+i35SqivNpmKwtZc1ZkfMm9raupW9fs3jOi7ShQB/yX7/CXHwJ
	9BTi9vj1XYnhMu/hceBCm5AQlr0bVEhL+0dAdb1rdmyQCrAR11lwxat8jVh6n+cbLH9KmpgBMyN
	XgT6w3mg9RbsHaqY3l4z6dOOxx+PwclJNLH2Gng2/J1i8FmuXISb1Rt3H43Hg3EZT5VWOssZv2O
	qHISUnYe/d6/xAX6YWfjIYMzY0ZW/7yUKKPeu8BOuLhGf0i6LtPyu/CP5jJNOOSkP0Z9+CUGRXb
	pc06
X-Google-Smtp-Source: AGHT+IGFjEwJJaB61UAyX062ZKUNMoO6YhIVMF8VQBjnoLHbWifin6Mfzi858dgSISMwNsFeLOA9HA==
X-Received: by 2002:a05:6a20:244a:b0:1ee:65eb:73ef with SMTP id adf61e73a8af0-1ee6b2fe357mr5378504637.12.1739456800364;
        Thu, 13 Feb 2025 06:26:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm1342377b3a.30.2025.02.13.06.26.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:26:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/3] classes-global/insane: Look up all runtime providers for file-rdeps
Date: Thu, 13 Feb 2025 06:26:31 -0800
Message-ID: <0ff31972b60dda5d8bada2ffb428cc54bb49e8cf.1739455358.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739455358.git.steve@sakoman.com>
References: <cover.1739455358.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211340

From: Joshua Watt <JPEWhacker@gmail.com>

Uses the new foreach_runtime_provider_pkgdata() API to look up all
possible runtime providers of a given dependency when resolving
file-rdeps. This allows the check to correctly handle RPROVIDES for
non-virtual dependencies

(From OE-Core rev: 018fa1b7cb5e6a362ebb45b93e52b0909a782ac9)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


