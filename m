Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E17C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7948.1646406307907430002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1HQvn2G0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso8182255pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PNUZEL9agC/uBqUv2VRJglmBRVknyT2PSym8g5TwpRQ=;
        b=1HQvn2G0n7gP//OmXJ0mlB2UAeGx/rFkzzJmvvLBLAP89m96s8MpkWnfpHnOdpaouW
         8MKMHbRSq69RK4+eDfK8JFsloNy9Nl7sEb3Gh56MVwBrP/zK2IMSmWnqLu8QBO9PgwKP
         AOb7FVzG7aJNKqt0Bf4cLh+rrFrqf5Qpjlk5VKuyngJrYeahY6JvBbcgNweV3XxL2hmV
         a0kGxwF9kwf8zNaheLZVO/oInX60SbY7WjSwjsYJPMt7zoh+TslM4UR0QxW+fwaeBOWh
         akJIG13cw+Z0eNLjsZlacV/FFvHf5UWNUxWREU9mYgTsI0n8k7iJDQltZ0mNPJ1jUJcY
         SyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNUZEL9agC/uBqUv2VRJglmBRVknyT2PSym8g5TwpRQ=;
        b=qQ9MkhmzcQvfmTrZ7m+ni3kUMhGwCS1f6rfJVZD3D9GB52msSuSxEfWI3Dv82DhrD0
         vT1xlQVx/nBDLCjOwkusCOUK1WPooSDiq6pS1XWijg87ma3pipaOOrsM7UYnJgs/kzYs
         NVQOdK4xt8/t18i8yeldfSL+nns4ybNkovzD/CAUGWYt3c7mT2tL23U4vNl/AaDFOAzo
         eampAie6qvSGQMCenMra7yjsWi7C5PRbB+PhiI48+17OS1xM0TmXQLKueVgtVbcUM1kz
         OcSTkNtyK7M7RmkJdJB9C27Jbi5bZvPAmOhnCSR9Ylm7MjPDcPJJks6MV3hVeIqXd6kB
         phyw==
X-Gm-Message-State: AOAM531UQYtCjqUVzSA6nSX1AqdFfxG+O5SzB9r9d8foI7oftfXdzupD
	0usZioKdj0u7jq7G7c+4/6DesFIJRGSIe0oTgPs=
X-Google-Smtp-Source: 
 ABdhPJzzhMPe0wSVc5pS07F3U0zUZuYbkfIv+nTtTYV25/s1sZZAS2GmkG2vw1J/4mZb49EnYme9Vw==
X-Received: by 2002:a17:90b:4c41:b0:1be:f5d3:78eb with SMTP id
 np1-20020a17090b4c4100b001bef5d378ebmr11136225pjb.187.1646406306970;
        Fri, 04 Mar 2022 07:05:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/18] cve-check: get_cve_info should open the
 database read-only
Date: Fri,  4 Mar 2022 05:04:18 -1000
Message-Id: 
 <2b3d13a451e99db669977d4d1172653b736ae6e1.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162729

From: Ross Burton <ross@burtonini.com>

All of the function in cve-check should open the database read-only, as
the only writer is the fetch task in cve-update-db.  However,
get_cve_info() was failing to do this, which might be causing locking
issues with sqlite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de517238f1f418d9af1ce312d99de04ce2e26fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6b627464a0..5369b7074c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -323,7 +323,8 @@ def get_cve_info(d, cves):
     import sqlite3
 
     cve_data = {}
-    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
+    conn = sqlite3.connect(db_file, uri=True)
 
     for cve in cves:
         for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
-- 
2.25.1


