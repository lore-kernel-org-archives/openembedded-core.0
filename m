Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.5673.1611622464570940759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 16:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jQ882qPv;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id w1so20646215ejf.11
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 16:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+9vf45k8xV2VfnXvWY7I6W198MhpNwmPxpxQxvxZLE0=;
        b=jQ882qPvCl5mOmbIDRd2BOqE4k6y3tEazo1xupqX7kmyPKj4o7IgNJemQ0NIvqDDLm
         mm8gHeLz4n4MMEUXJ7C8R3k8dQrT5JsARi4AKVhr3uUwdJsb0whes6t9SLaTkp449FkF
         m4OLglKBge/z45sezjZre4mycTghzmrKp8K7ucWjzxMcSYxUE2p+ZV6gT/sYJDqYR0+T
         iXu24eutSC3hXJIP/ruKuznCCKYUmjQ4rTZDYu6H7i4DOJSZ4rRnruzy7WXedF36qGnC
         8vUArn5Y+6uD+23rHcOookRokaHocO4bhW9XoA5fzilFc79sDof5zapiLC9iDusZ/ZyJ
         2FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+9vf45k8xV2VfnXvWY7I6W198MhpNwmPxpxQxvxZLE0=;
        b=CqwGDQe3j3gNFPkMS4gcWV5l/LO/Gk8VBr6dEhx4rWmxS9qr8RLf0nkgEqYJgrcKy1
         /bvmtK+FCO8ZIZou7Q0FnbLQ9s3bTDqPTCmhX/b7HD33id7Eq962Gyj0cQpjM9g/afya
         3jfjDZmmBrilSG06IRLs1q/YfYDlAs4tN253VGTt3kf9ZSqaJztn0zD5tjp1Sqf5OocZ
         /exvVAIT5OLL7oucMdvtRf0JNQ8Gk7G7/iqG1XRjkwJuA/cKDElOvCz1LTGWIQAbtEEW
         rWBJ9KOsXfcYxdA/YAvc3SkWaoGrqjshAu4fR2apVGqSADMPPqsqHKKqUWmZSwCzLI0e
         azVw==
X-Gm-Message-State: AOAM532VMW3qyXc/15CB5GyhBM+QvdorATDsOYr56lg7/wZ73rIPyByZ
	Je0+el7GZ/Wj2QgmCTer8/ZQVLbNvv6Klg==
X-Google-Smtp-Source: ABdhPJw99nOm0J95CTaHy7BXvElJxBt9imB4QMVd3btdUdvk2Q3wox+9mGjXNhm2rkunNaalUhUzBA==
X-Received: by 2002:a17:907:abc:: with SMTP id bz28mr1901981ejc.395.1611622462917;
        Mon, 25 Jan 2021 16:54:22 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.29.84])
        by smtp.gmail.com with ESMTPSA id s18sm11758051edw.66.2021.01.25.16.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 16:54:22 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 01:53:47 +0100
Message-Id: <20210126005347.7452-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.

[YOCTO #14179]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e527c13746..c6842ff549 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
     if (tmpdirmode & stat.S_ISUID):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
+    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if i and workdir.startswith(i):
+            status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

