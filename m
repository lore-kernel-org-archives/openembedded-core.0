Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6792E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 17:32:30 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.16407.1733851947440189500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOw3ybp9;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71dfaa28eeaso1245664a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 09:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733851946; x=1734456746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZfu9VIMxvChDiZ8AsICgcA1JPZ6RYLklumCrMfn/1U=;
        b=JOw3ybp9W8SPnLy5JBOhxXBVUuC/TvQshuVWom8hawDEyGFmQM7gv19lz0cbuvYay4
         u5Kh+qYB3EbUPEDeBxDRSqdJXSDlY+EUVXzD3ml68IjLd4eg7PnK06/UXAMlctRlC0KJ
         5HCUpe987Z4efX3WckNyCZ1fyWA4rzqn0Yy3QaoMQGpan8KmogOfMHI6hDZCHPVgBE36
         Q3XFncQSAeQ/rnxRa+w4RQ4PDfR9DCrEXhUSNC4iFOiUvkx8cEp1Xafu1WoQO1PV4Gk9
         gt+6l2A3mBiP05sFgyvmSlnMF3pGAYWJaDSkgVPzcdRROHYCQg+WajU5jHUj2HYk/r/6
         x9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851946; x=1734456746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZfu9VIMxvChDiZ8AsICgcA1JPZ6RYLklumCrMfn/1U=;
        b=TiskO9oszv7HK/hsAsKbPCqhXnohyepWB1gA4igbLDfaqLfqkvUgxj1Z083SJlBV/5
         CZY8Cx1j7f41//cMXzCNyofjWDlsq78LXKKZvGestgCw60TXjwuvwax1xYt3qni9CMpJ
         8x0cI0+oubSWs0VkeeR7otSngV4r+72Jgj3PxlZIXIOA5ufu5eFq8qcnWv/3Xl+IPxBX
         YhRwT6kupyyVn7LGNkJPqqLA2biq0VyZSUqt7HN49JQ9FtVGKc1vfJAgDAwWXksaPzJl
         mFXjSNDL727vZ3rgnQy6bh34K5FI84P2k7WgOk3mDa7Y2Oq6if936rVYH1wgYK1aEI3b
         OrLQ==
X-Gm-Message-State: AOJu0YyzvwjbzJfJg1pq7ZG2+zHgYB991cF3+0laaiS8u2sEJlhNOknG
	3Fw0hnqIk5JT5IF8j/m6Wyjiu2lK+jeKFYrKu4oRnxyGkewEUScaDR0v6w==
X-Gm-Gg: ASbGncs7h2UImiHoxRBThDtc1kenwVX+3b+tQq3jWN5atdyqLuGVUg0kUSl+U88ebub
	/yy/2/LwqIimY5NA7QNq+mLwrTJ6HXorJGgSrsExEdwCwyakZhtAzzOGS0T5aAsbm9WNE3RLAS6
	la4RQ8yBMT/pcfFvXqrmVh+binuk8TcAwY4ylqZpMUwQHB6vU/jZMUID+uYn4cZAw8y6vNSM19+
	PwJD2UGsyXErYelLcFqNEDVC8Hed4z1DTtpAXZNARbUdLNPsLjx
X-Google-Smtp-Source: AGHT+IHvChjaaSfdHvUjWDmR6U/EamMMSAb0GQK4YKVg7gmC11DIG+Zsucd6mTWsoTD9JVxb7tX6fQ==
X-Received: by 2002:a9d:6c84:0:b0:71d:eee3:fd1a with SMTP id 46e09a7af769-71deee3fe9dmr5769744a34.0.1733851946021;
        Tue, 10 Dec 2024 09:32:26 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71ddf819756sm1838124a34.26.2024.12.10.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:32:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes-global/insane: Handle case where RPROVIDER is also a provider
Date: Tue, 10 Dec 2024 10:32:19 -0700
Message-ID: <20241210173219.1381641-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 17:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208541

The check to see if a provider of a given package is listed first
checks for an exact match of the provider name. However, if this match
existed, but didn't match in the task dependencies, it would not
continue to look for other providers of package. This would manifest if
one (non-virtual) recipe package RPROVIDES the name of a package
produced by another recipe.

Fix this, and also clean up the code to make it more readable by using a
function to check if a runtime dependency is in the task dependencies.
In addition, if no provider is found, list all the possible providers
instead of the last one that was looked at.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/insane.bbclass | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index e54d2c15082..866cef65260 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -825,6 +825,12 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
 
         # Now do the sanity check!!!
         if "build-deps" not in skip:
+            def check_rdep(rdep_data, possible_pn):
+                if rdep_data and "PN" in rdep_data:
+                    possible_pn.add(rdep_data["PN"])
+                    return rdep_data["PN"] in taskdeps
+                return False
+
             for rdepend in rdepends:
                 if "-dbg" in rdepend and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
@@ -833,17 +839,16 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     error_msg = "%s rdepends on %s" % (pkg, rdepend)
                     oe.qa.handle_error("dev-deps", error_msg, d)
                 if rdepend not in packages:
+                    possible_pn = set()
                     rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
-                    if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                    if check_rdep(rdep_data, possible_pn):
                         continue
-                    if not rdep_data or not 'PN' in rdep_data:
-                        for _, rdep_data in oe.packagedata.foreach_runtime_provider_pkgdata(d, rdepend):
-                            if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                                break
-                    if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+
+                    if any(check_rdep(rdep_data, possible_pn) for _, rdep_data in  oe.packagedata.foreach_runtime_provider_pkgdata(d, rdepend)):
                         continue
-                    if rdep_data and 'PN' in rdep_data:
-                        error_msg = "%s rdepends on %s, but it isn't a build dependency, missing %s in DEPENDS or PACKAGECONFIG?" % (pkg, rdepend, rdep_data['PN'])
+
+                    if possible_pn:
+                        error_msg = "%s rdepends on %s, but it isn't a build dependency, missing one of %s in DEPENDS or PACKAGECONFIG?" % (pkg, rdepend, ", ".join(possible_pn))
                     else:
                         error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
                     oe.qa.handle_error("build-deps", error_msg, d)
-- 
2.47.1


