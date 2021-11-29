Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25374C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:10:17 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.62111.1638198615797100118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oBYwvv6H;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id d2so23116499qki.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lrgviiyuQ3QdlOYNYzPerjy36RNmfFt9+NtKcEix25E=;
        b=oBYwvv6HjEbcigfhLPFwK4TJEhXX/DUDlOogL8zqEgGOeuBL9Phhy/Z+qqV2ee5eZG
         MgB2/+D5MV6EckcCuIkSuyyteZxHhb5hDR7MxC03M7oK2wtr8oXQEyPPFbAYNhpwkDlg
         6jnXLgwf9YIltfSU8ygxiumnD9d2o18r+4LZ5Noe78GYZqZlm92V3eNT3XaqUymDnhsa
         9hqHoiRFd6aNJ0fYpNKSK0L3//mRjV7+fdhSIpx4SRz+anCD5eRrNSZ6oFikDeL2cTxN
         nEDC3mPzVF8OXZ2OAn0KE5FRNGZfekKSVqV5785PTl9KHApCpp7yak12DgJ+AyIRRlGO
         L0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lrgviiyuQ3QdlOYNYzPerjy36RNmfFt9+NtKcEix25E=;
        b=U0tsmzwAAuoPwL5zjwlzvxusK/pCnzi90+1iOrtZpv5HfXMAmZURjLkp7zcMbBe6Km
         5gHexwjrp3asfqpk4OLCr6/fkYWJ60VkM2Sj4FGrx259xRkO3eC/an2Llw6Mwv1xvYrz
         aEqBPyXNNaAkHoJR7AT3t5dPXOFRtHZbJek2/7xnCq4+7bI9eWkZxjoSuF2xBq5zbqN0
         Mh3+PYpk+JBuVpMHUjyx4iugSfz+09dT+5F8kuIgfmbrqC9cuN3oysJ2EX2+JnmysiZo
         O2omHiYWBjreFae9SfmFrXwqfCxtUm6JC3kLDL44CiWjVMjCRQs4ajTyXHzo1HkQOlei
         qHRg==
X-Gm-Message-State: AOAM533N84KRId9Cz16oytv6B2FdTleDzHo8PdMgoA2k8ZM5GIEUb6UB
	HfUDQVAcq+jnHvF8oc9ftH+RP8iwTuM=
X-Google-Smtp-Source: 
 ABdhPJyoWr3HdTEmJq9dPFkZ4u+6D6CUzHL+fGvUG/0o45/b10JJ9c8sgX4CCegga9PH11s2giYMDQ==
X-Received: by 2002:a05:620a:15c8:: with SMTP id
 o8mr41045286qkm.385.1638198614746;
        Mon, 29 Nov 2021 07:10:14 -0800 (PST)
Received: from localhost.localdomain ([71.220.185.242])
        by smtp.gmail.com with ESMTPSA id
 o126sm8264677qke.11.2021.11.29.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 07:10:14 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [dunfell][PATCH v2 2/2] dnf: Backport bugfix for upgrade
Date: Mon, 29 Nov 2021 15:10:11 +0000
Message-Id: <20211129151011.81253-2-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129151011.81253-1-jatedev@gmail.com>
References: <20211129151011.81253-1-jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:10:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158952

Keep installed packages in upgrade job

This prevents duplicate identical packages from being reinstalled
with each upgrade

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
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


