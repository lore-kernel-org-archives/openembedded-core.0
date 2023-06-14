Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443F0EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7474.1686734977562868287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Sr9vYpYu;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-970056276acso68846166b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734976; x=1689326976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPltx6ZWs93yMWendHPAFfBOuJ3Z0eQqfAmpMvMkt4A=;
        b=Sr9vYpYu41N30EqzNiIjiIrIo16MNOoQCv6NtTrOejUqef/A7KqK8aG4Y0EsVHXtu0
         O7JEgYx6UoqmtowRxqOyG93zYB2oh59coJ5Mx22A8DDQUGUSy3QzYVlg0rUgitFFWPlF
         XVc/G7wghURONqROdSAVr1t+Vpd8z6+c4c36M7bVKPnoiw30JCne8Q2E2tbOE3D8M/Hx
         Om13Da5ciGKCpt/p6C9wWINJnPpuxlwmLpyktQL6SC890WJUqfz5KhhcRcS4lrmYtkMq
         53IkH6uN0mJyj2nDvvT9FbAeC087kH7v7ZqVIpckjszCB0XxhzklRAPYcLR3C0rtoUI+
         UVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734976; x=1689326976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPltx6ZWs93yMWendHPAFfBOuJ3Z0eQqfAmpMvMkt4A=;
        b=atvfM5I88yu63Uq/yR9aLYmnNVkaOna18RT84oWHjHFwi4qh5mPaYfM4+bWPNAlLY4
         XXrpBzFy+tuQ4PWAeiT4xRcZHAmlGKepfD5gYkK02StnTVzfP7CzsCnF11QjXhqjFJzW
         gVTekeYIS9xObib9p8XmZVZs7T5oCbmripYxN3SIqaJoZ4sYldud65a9qwGfrKrIDuob
         6999dRV9glmnX3CyurIplB3s3V8wcsHTzbERvcqiMoP+8ANxj03NynEm8DUKvmsWH5bg
         zkrXKMFB8+br9py0KeE9ois4PRsO+4rTg/h+Qtx+MetR7tBuDCcRhDXwLmm+Rwsgljud
         F8xw==
X-Gm-Message-State: AC+VfDxEJ4EKkS4DWB/nS4avvJHlfk1jMc13D4jRFNeJEXZgd30XvGIa
	pG+TqMHEb1PrkU5epwm7SbNWm3RXwMo=
X-Google-Smtp-Source: ACHHUZ7W0qOfV1itGMd9w5hjEE+eqKrQOsZ61MldmwHCLY9bBTGByhs66YBUtmyumF+qIVXkDY4mvg==
X-Received: by 2002:a17:906:99c4:b0:971:9364:f8cd with SMTP id s4-20020a17090699c400b009719364f8cdmr13675387ejn.44.1686734975914;
        Wed, 14 Jun 2023 02:29:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/55] dnf: upgrade 4.14.0 -> 4.16.1
Date: Wed, 14 Jun 2023 11:28:39 +0200
Message-Id: <20230614092918.4065570-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182761

Correct the query for locations of rpm package files in the local repo:
upstream has changed it to a separate cmdline parameter.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/package_manager/rpm/__init__.py                | 5 +++--
 meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.16.1.bb} | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.16.1.bb} (98%)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index fa218485f5e..f40c880af49 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -386,11 +386,12 @@ class RpmPM(PackageManager):
             self.save_rpmpostinst(pkg)
 
     def extract(self, pkg):
-        output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
+        output = self._invoke_dnf(["repoquery", "--location", pkg])
         pkg_name = output.splitlines()[-1]
         if not pkg_name.endswith(".rpm"):
             bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
-        pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
+        # Strip file: prefix
+        pkg_path = pkg_name[5:]
 
         cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
         rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.14.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.16.1.bb
index 62df8c4ace5..ff79701dc7b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
+SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


