Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3004C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:51 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.53266.1638136790592050386
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PGO7jeTg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id 8so14653396pfo.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3qqR7TRCSIEnARmFiN6wDG1JdrsD5qr32c/c71WB6b8=;
        b=PGO7jeTgegMEsPljWEpSyer4ANADv/AKXslQkciQInw/yCuNt4XNgWGKUdja88w0LS
         jLvX2939nWuX9yqOtUN54c15j5vuRi4KWbprpRU/t+u1YbLnigOgyaJYkXeJjGN48P4H
         DsA0zJWxC5UX1+0TSi8jGkM7mN8frFMtrYz0ioG03YVQqgfjG1pbnA45JttuU8zcxhR7
         +Rye6EmY5jViU3j9spsgvFZ95zrvGtsEU7r5DX9pAdVGuUZjy5vKg/3Y5MEbFB+MBr1E
         UOHrdUg6Y9sOLiCxEDafn4HWmFG+BiReNrA7aqNp2dAQyXMjXg1A6ht/iZEpSwk3qdXD
         lwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qqR7TRCSIEnARmFiN6wDG1JdrsD5qr32c/c71WB6b8=;
        b=AY01eCQ7S7kQTuxQCqF1b2nE5KuBEBFQj4Gt8HBVXSDPZEXNFUzB7/rzegTBpjUQK/
         ej3V50aYaj1TadkMnECGH2PqUMqp4dvMYehJ5Q+aH8mi4MiWj7pF0Q58zn5Dd4FuXNXq
         cWiCaXLVi8zKMtygLuOrc4KDh2zxkhrrq2jd8YumE5y4tKQ8xcpa5L0vUgcieVJ4uNAF
         HZ9hu0u4DwOgZkC0/NUonjLgrQlY3ymzJO23egn+cDy8lBqJTInVPj2mmFAzvOyRUKg8
         Q+ej8HddW4NQGcAIeDgZHrGcdsCrOSIePBxQCoMZhjRwPY1L7QOXQadjpmSQCbVDF4j/
         UY5A==
X-Gm-Message-State: AOAM5308usqwRw0SqiETVNuWfD0XDJzWJKS0A5+Q+yZ4Z42pPUlXciBN
	9KZE75aakGDS1erGRwFalBJ0qkh0qBp7TqmkMqQ=
X-Google-Smtp-Source: 
 ABdhPJyP16mu1rAtpw4iHf+dmh1lRuBqQB+qd0Tp9T5xENbRETNWsAYhFbwcDqE0/nT2sDDjSi3ARg==
X-Received: by 2002:a63:681:: with SMTP id 123mr18510280pgg.548.1638136789213;
        Sun, 28 Nov 2021 13:59:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/42] dnf: Backport bugfix for upgrade
Date: Sun, 28 Nov 2021 11:57:48 -1000
Message-Id: 
 <bc0c1234b7ae48394af92a4d14c2b47f2e3b98a1.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158918

From: Jate Sujjavanich <jatedev@gmail.com>

Keep installed packages in upgrade job

This prevents duplicate identical packages from being reinstalled
with each upgrade

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ackages-in-upgrade-job-RhBug-1728252.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.2.bbappend  |  3 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf_4.2.2.bbappend

diff --git a/meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch b/meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
new file mode 100644
index 0000000000..57c2375a54
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
@@ -0,0 +1,60 @@
+From c88a77198c0156e425c2725f30e481207de5162f Mon Sep 17 00:00:00 2001
+From: Jaroslav Mracek <jmracek@redhat.com>
+Date: Tue, 3 Sep 2019 11:01:51 +0200
+Subject: [PATCH] Keep installed packages in upgrade job
+ (RhBug:1728252,1644241,1741381)
+
+In combination with marking of job as TARGETED it prevents from
+reinstalling of modified packages with same NEVRA.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1728252
+https://bugzilla.redhat.com/show_bug.cgi?id=1644241
+https://bugzilla.redhat.com/show_bug.cgi?id=1741381
+
+Closes: #1474
+Approved by: m-blaha
+
+
+Backport to fix bug in dnf in oe-core
+from https://github.com/rpm-software-management/dnf
+
+Removed spec file portion of patch
+
+Upstream-Status: Backport
+Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
+---
+ dnf.spec                  | 4 ++--
+ dnf/base.py               | 3 ---
+ dnf/module/module_base.py | 2 +-
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/dnf/base.py b/dnf/base.py
+index b2ced61..628c154 100644
+--- a/dnf/base.py
++++ b/dnf/base.py
+@@ -1968,9 +1968,6 @@ class Base(object):
+                 obsoletes=q.installed().union(q.upgrades()))
+             # add obsoletes into transaction
+             q = q.union(obsoletes)
+-        # provide only available packages to solver otherwise selection of available
+-        # possibilities will be ignored
+-        q = q.available()
+         if reponame is not None:
+             q.filterm(reponame=reponame)
+         q = self._merge_update_filters(q, pkg_spec=pkg_spec)
+diff --git a/dnf/module/module_base.py b/dnf/module/module_base.py
+index 976d730..ce70f63 100644
+--- a/dnf/module/module_base.py
++++ b/dnf/module/module_base.py
+@@ -214,7 +214,7 @@ class ModuleBase(object):
+ 
+             if not upgrade_package_set:
+                 logger.error(_("Unable to match profile in argument {}").format(spec))
+-            query = self.base.sack.query().available().filterm(name=upgrade_package_set)
++            query = self.base.sack.query().filterm(name=upgrade_package_set)
+             if query:
+                 sltr = dnf.selector.Selector(self.base.sack)
+                 sltr.set(pkg=query)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend b/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
new file mode 100644
index 0000000000..3811db604b
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch"
-- 
2.25.1


