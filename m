Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95784C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 03:14:28 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.1406.1637723667182059394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 19:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GfwW0NYh;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id t83so1346566qke.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 19:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HrONKEy8Ag9s6eQ7FOxlkixMhPChyrbAJ0dfx/hqQeY=;
        b=GfwW0NYhY33x/qA7CesyE8DhT+EVCM7pHV4nAOYY0x+/IS1HCO6+DXOi9C9uHNAvSY
         5KG8ivqp0PJ6Q8qvWI7OTS6C1AzEytEWS87+lTujM+Vw/p97BVPbNE7x8RHoGvCFF7Sh
         J2nRw66HtRqwxJpJz2IokoznZp0cRyIuM2/sIy8LeARz6d23E7shSlp+dX6nsU4zqFwE
         bGKI4cnkR8kydVUlYS0H9cF+//Ar6COUY67TeA5IqHBjTbm+agFbgPtTCA6J29p4ARxW
         kyhZhNyus3GM+uJTJ30IvQu1PUdzAjbW5lEICdjMuFHRgKwCK8rq2w4XeQthgNvCKUwv
         /NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HrONKEy8Ag9s6eQ7FOxlkixMhPChyrbAJ0dfx/hqQeY=;
        b=Yyy1VRVUHZ0pgT6OJg0s02LJZVSHbIJa1SetdbUc4ib9klGg6s8iIklNu/z7KCYAbk
         bIRClRRkqTpkM54bUddqhUrUJ8FlmWZgCG5WFWMWJzN9j3tlkcSZ6hQALYC/ltkWe/r6
         bIcgxA4erHlZyEl9F+668pyTOoD4hVm1rANxmsQjcUYGa0NZ0BTZdOYTKNCE1h1a54Mz
         h6VRkrD0dKSsBJF1jqfLs4r1v2pDlEVNXeKoD2FczUvoZw/w8DfjgNTMsokeVZPL5LWK
         xIAZcoiIyuCwuwDPfUdGNYTR0dHgdJUb/0hzfvaOo7LuasUCwQgnt3u3bpEeBf+sjfRB
         Gr3Q==
X-Gm-Message-State: AOAM530aRIF8ff11eI2aFvlIs/R2hpV2WqmPionvaXucjAZHozAWRkHE
	I3d9f2VgP0F1WlQwsN7mlQolKEC5Y8A=
X-Google-Smtp-Source: 
 ABdhPJx+p5TxsIJDGXwroRSkC9cASYp6BqUYL6Pk0L+xbcAMc/vHrhVNmOdXt/jrN5F6vGswkLn22Q==
X-Received: by 2002:a05:620a:a45:: with SMTP id
 j5mr2470078qka.392.1637723666041;
        Tue, 23 Nov 2021 19:14:26 -0800 (PST)
Received: from localhost.localdomain ([71.220.185.242])
        by smtp.gmail.com with ESMTPSA id
 k85sm6992009qke.134.2021.11.23.19.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:14:25 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [PATCH 2/2] dnf: Backport bugfix for upgrade
Date: Wed, 24 Nov 2021 03:14:23 +0000
Message-Id: <20211124031423.76384-2-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124031423.76384-1-jatedev@gmail.com>
References: <20211124031423.76384-1-jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 03:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158651

Keep installed packages in upgrade job

This prevents duplicate identical packages from being reinstalled
with each upgrade

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
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


