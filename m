Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C261C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.12052.1651248088838005509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qciQPQSt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id n18so7516443plg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MgpqcwKSrLZyVARs4vgaJHphp1ToKXD1Vnmf4vP1cGg=;
        b=qciQPQStvgcZCDwnCwIs6uX7lUnyewpspo7Avzu2hRGaJ8yYDnAUvG0y/Yi6RbDbnI
         J9rmqTLq89jZUX7ZXD9wa2x74wK/8IHrvSeSRIzKd5tJ4bsgrz+QEH4aCrvu6WpSAw/L
         /2TS2cYs6TDJtgVaA80ZCb1dNOK4mCaFk6oDsAbBZB0CPACsjXrnlVI+eU25z4vgqnsm
         SNX3qa+3rywA/RE/sJ3h5YoLkb32/whhIDb4OYxFmDcGBJ7won7obdFythyrotf3jr9d
         GqsyKne3yqjG9Wlu3/5DNvEKYP7Xlvh9lUma4pGW1dTra3I05Jlt3wV5jqe/YbG80fiY
         ItYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgpqcwKSrLZyVARs4vgaJHphp1ToKXD1Vnmf4vP1cGg=;
        b=GFxptk7Vs/sTubdQcAAUNsxtB0jgTVWNjjxLrqgYfYyt8zPRE7cLsaEZYct8shsvJ2
         pHnyoCXe3G+XqkYfcndc1B/9g+UMUcAyOlwdx8OTAgHHn7Nt7v47MnJ0Wb3OF7rMpx9Y
         1+ifvuZ4HKSUzCMFibFjEL2AQNHAA9g4vDK7kQJQCvR96CD0uhFIoccQooq9I/x2FwdV
         zlXwTlgXK0Rc8iuIDS9cowBy4Mw65a75ljVkPoLmSiplLj1BmXevDVYMJP4CCweg36OF
         ftBRJ6gJDy6C/mPGzBnzTe/iXVmFw03NvysPbz5tdrDlMxRdbOwCC2xOp2KWaANn2woH
         h23w==
X-Gm-Message-State: AOAM531a+lSxfeIzQNP/TDq7pR59A9MLty9CPxJQODkSaGMRsgqUKNmB
	+TCXPQD3CARWcpUPiWkX3giWRSADimfryFRn34s=
X-Google-Smtp-Source: 
 ABdhPJzZPjLawBlaYb1KdZgc04nyYke4HpmfOSLAjuATsyRFcDIYeiLbAqHyipmcEZ4FvDnATtLiXw==
X-Received: by 2002:a17:90a:bf0a:b0:1db:d98d:7ce9 with SMTP id
 c10-20020a17090abf0a00b001dbd98d7ce9mr4692886pjs.155.1651248087176;
        Fri, 29 Apr 2022 09:01:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/34] cve_check: skip remote patches that
 haven't been fetched when searching for CVE tags
Date: Fri, 29 Apr 2022 06:00:22 -1000
Message-Id: 
 <b52a508bd7693c40e6416db9c9076a8789499501.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165022

From: Ross Burton <ross.burton@arm.com>

If a remote patch is compressed we need to have run the unpack task for
the file to exist locally.  Currently cve_check only depends on fetch so
instead of erroring out, emit a warning that this file won't be scanned
for CVE references.

Typically, remote compressed patches won't contain our custom tags, so
this is unlikely to be an issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cefc8741438c91f74264da6b59dece2e31f9e5a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index e445b7a6ae..dc7d2e2826 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -89,9 +89,10 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        # Remote compressed patches may not be unpacked, so silently ignore them
         if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
+            bb.warn("%s does not exist, cannot extract CVE list" % patch_file)
+            continue
 
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
-- 
2.25.1


