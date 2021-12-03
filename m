Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE9C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.15313.1638555714991697981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wlXs6Fdm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id x131so3622024pfc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M4N6wr0HwoJ7LfRz9WPdDnkS+sID3pzfnf1/uP1YZLQ=;
        b=wlXs6Fdm4Yb5O7blcjHhSJ/tRB7zxPJiWKs9Ugk6onMc4crp6g7elzMrNCXmM9i3c3
         iQhSbJAL21hvnuyckkAi3AiQxYku6KBDJdPU2oLyeAKrIyL3rm0ctZrzXeUNyhIFA3VP
         PDkECOpTTukcndHNHJnW6Z/Fxiht/Jo5JrimwhDoqN1AF+ZAcKATe7mcn3SQWHd6LN4t
         0iRef4ZcUdu5W8vAleQ0LE0iVP7D1KbsxV9lxP9GY5z2Zn/0oTnyGWb7k5pRdOP3z2mU
         t9w5eDHDIrFJglyBhN8o0is1vSYj2FinAZKTeM/PBc1A1ry41hUTVwOaHOv9TED3S1Eg
         TrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4N6wr0HwoJ7LfRz9WPdDnkS+sID3pzfnf1/uP1YZLQ=;
        b=7vX94GJ+0GdeIapTOHSDGXUHpgMMG8ha25Fc5fOc8EMvnXrzENlHANK67YYV98+XHf
         P/nHKs3Cbx1GeJm5dvGAeSY27UgKSPAVZ4O1BM6b/VYsDqSxMxG17ipSO7BYNzv03TIT
         73U9OU4IDiJ31IzMew4PgNNMdx/uWLmzusv6IyLRm051mOjbvIjqJMrWOrhydAWDwXh2
         UUJc1a99W6OzZw+J1ZZ+lI2XiJXTaNv55HIYWDns37YUISSN3RJ3vqbpnPyD04RV8+rA
         4XHMb57PZjujyxZo9mma0kq6UNPxXDxTRkF+ZQyqjHC/H1LZIn3sGl7COdJUrN/86b8A
         Ap2w==
X-Gm-Message-State: AOAM533VkBii1ureeEKeA9qPnjcq7qdvaHCODOqCEXi1iYJS4s/hKufI
	e046aNvjqJYNScTD5DPihX4dE30XpyXhzbwyaNY=
X-Google-Smtp-Source: 
 ABdhPJwhr1392jPgaUd1QQPtwnCYTz6mKCkSfCjKDTZ4ZhiaaPIne2HVLjL7bHVvOHRTONJYeW/aJg==
X-Received: by 2002:a05:6a00:2496:b0:49f:eba0:6575 with SMTP id
 c22-20020a056a00249600b0049feba06575mr20652957pfv.78.1638555713979;
        Fri, 03 Dec 2021 10:21:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] dnf: Backport bugfix for upgrade
Date: Fri,  3 Dec 2021 08:18:59 -1000
Message-Id: 
 <2ead580a981e5d4f72d5bba22db4ae718815bc42.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159139

From: Jate Sujjavanich <jatedev@gmail.com>

Keep installed packages in upgrade job

This prevents duplicate identical packages from being reinstalled
with each upgrade

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ackages-in-upgrade-job-RhBug-1728252.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch

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
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index 1b00ae945e..6b6b233d6d 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0030-Run-python-scripts-using-env.patch \
            file://Fix-SyntaxWarning.patch \
            file://0001-set-python-path-for-completion_helper.patch \
+           file://0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch \
            "
 
 SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
-- 
2.25.1


