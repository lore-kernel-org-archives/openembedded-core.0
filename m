Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.43598.1606170334964264473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 14:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=doaDB3Om;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id m6so20346662wrg.7
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dY9E5og8ID1A6/bVSDuBD+BwaDGe2FHRLBT0rrWVtn4=;
        b=doaDB3Om95Z+vrJHTBGOflIMam8ZmW/wVmdapBURPHG+WZAXpPUwWunU2wqCFQTnY1
         +uscUIsDk52kUraPnNx7kQqAK6nxi+DQom2ZtaSjpzP2d01BihPHC1GEcMb3eIWQdI43
         YcfeYl4Vjhbxc8vgCc2bnUnxFyz1+fT6NyT+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dY9E5og8ID1A6/bVSDuBD+BwaDGe2FHRLBT0rrWVtn4=;
        b=a9FQfRNpQFUfIkozew9cczj81/nN5maaa88coltWKgPl8GVsJ7u3l20GYfNWuGjs2k
         cmFwUFyupnl/1UOEen9gNfAiIyifBpPYv7jlfqXzaT2Db0+RXkGOsxizg5hsfxeQ3z7x
         iYwSafXoJ88xjQC5NW/KG5uj0An4lc6NsMt6mW1sxlC8jbQAJ1Y49v/CYqzfB2ayPfm7
         qVN5YqboRdrqPKRLHrxZygUk/EiFgo+i/WgzmlQrRTIXnebct+5n0eMs8tZ2aEQQSj7r
         Ah4ckf9NEpNFl83Lq1mF7EiY/s4BNjfFc60khaUFxj4AjIjd4WFFl3ClvuUkGh7OLijk
         WXAA==
X-Gm-Message-State: AOAM530tiGUXoY03wTNkkWRnorS98e7iL1B7W43TB69hVZDHgGICCdu0
	QiyKyGn41Iokr+oaZ29++lQSe216wB7JXw==
X-Google-Smtp-Source: ABdhPJwff1H9jzEha71VaRmnVToIMABWWEWLFIEqLv2M6O7KhfW4IQ2TaE0+h3g5gh5wqBaoAO3k7A==
X-Received: by 2002:a5d:60d1:: with SMTP id x17mr1931435wrt.338.1606170333105;
        Mon, 23 Nov 2020 14:25:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id a15sm524633wmj.2.2020.11.23.14.25.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:25:32 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] fs-perms: Ensure /usr/src/debug/ file modes are correct
Date: Mon, 23 Nov 2020 22:25:29 +0000
Message-Id: <20201123222531.3030482-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If files are copied into /usr/src/debug directly from WORKDIR (e.g. makedevs)
we'd get the permissions from the checkout which would depend on the host umask.

Avoid this and be deterministic by setting the file modes consistently. Core
code copies the files in so we're responsible for the permissions.

Unfortunately to force this change to apply we need to invalidate both
the package tasks and the hash equivalance mappings since file mode
'corruption' already made it into the output hashes (both input options
were mapped to the output hashes).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass           | 2 +-
 meta/conf/abi_version.conf             | 2 +-
 meta/files/fs-perms-persistent-log.txt | 2 +-
 meta/files/fs-perms.txt                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6236c0bb23..247bdc7bbfe 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2340,7 +2340,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "2"
+    # PACKAGE_BBCLASS_VERSION = "4"
 
     # Init cachedpath
     global cpath
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 5318a101902..251d43bb218 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "3"
+HASHEQUIV_HASH_VERSION  = "4"
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 3a7cf3ab945..518c1be3c93 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index c8c3ac5dbed..daa4aed840f 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-- 
2.25.1

