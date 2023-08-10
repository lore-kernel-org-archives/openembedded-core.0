Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F1C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 19:24:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26739.1691695442442495668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 12:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RTwYJYHg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so13860485e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691695440; x=1692300240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ir5MiQh2YwI3wM0ln2wRDlZHpcMOEuAwXl7c35sviy8=;
        b=RTwYJYHg23o9ohFSCOa52s+D2ZCOnBRiPb4EeSj6d0+HMOVdQAB25TFzP/A6PijE2G
         96B8UYZnyyO91G/htXMSb+FEalJLePlSHb28Wlds0c8svgaoJOiKUNfRZH/TeVLPVJ05
         9T+L2/LQQSh1NiL90xfvCdDPnglhI+7tFnNB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691695440; x=1692300240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir5MiQh2YwI3wM0ln2wRDlZHpcMOEuAwXl7c35sviy8=;
        b=FbqZlEL5jaoKgl2pTL/Ji+ML8e4JvL8vnIMIQ99IDfY6sLlLLfV0nHODkPadXSmtHW
         gtoTLLHwzPf6ewqtfgb8SJrfMdFhHUyJQPhm/qoA+vuwpl4mMvbVXlbYeiLZ5PmUCoLt
         0CV70+Qb6mnAXMiuRrcacuzlEBoCgtSYW/JoyXrXKzUPkapnl+H1d5NFMSwfJDV4F9Hx
         /pQSCKio6OXXwt2E5+Isu4e4sMtVxtcZ6CukfzJyWXQxQX1SWhZsCjF8PgiX5Z92pyI0
         SZyJdGaobCw842ecZWFdAk2pMiq81zIOiqJXz/zbZFvGUGSe+LDTqcSdlcGIsYXTUg01
         qA/g==
X-Gm-Message-State: AOJu0YzDLkw5KeOOGQQ4tWGpEvhql60Lp3qS1FkvyRjaNU4+kdTrnySt
	fJVubrkpi+o4Mh0n2c9ewN05Rcku2eyLw37DzQI=
X-Google-Smtp-Source: AGHT+IH8faUYdZHIwQwYQOscUUvXXQ39l/fDevoy/RrLjkD0IKiaKFur/KcJUTe1v8CRbXXd1iJ0mQ==
X-Received: by 2002:a5d:4644:0:b0:314:3369:df57 with SMTP id j4-20020a5d4644000000b003143369df57mr2609432wrs.5.1691695440158;
        Thu, 10 Aug 2023 12:24:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1e7:9ff1:d8f3:9443])
        by smtp.gmail.com with ESMTPSA id q10-20020adfcd8a000000b0031753073abcsm3024166wrj.36.2023.08.10.12.23.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:23:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest: Ensure usrmerge is enabled with systemd
Date: Thu, 10 Aug 2023 20:23:57 +0100
Message-Id: <20230810192357.274109-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 19:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185822

systemd now requires usrmerge, ensure this is always the case in
our test cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 8 ++++----
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 0292c882f25..a5e069d0be9 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -250,7 +250,7 @@ USERADD_GID_TABLES += "files/static-group"
 DISTRO_FEATURES:append = " pam opengl wayland"
 
 # Switch to systemd
-DISTRO_FEATURES:append = " systemd"
+DISTRO_FEATURES:append = " systemd usrmerge"
 VIRTUAL-RUNTIME_init_manager = "systemd"
 VIRTUAL-RUNTIME_initscripts = ""
 VIRTUAL-RUNTIME_syslog = ""
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index b4f06638287..4031ded0fe4 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -58,7 +58,7 @@ inherit overlayfs
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 """
 
         self.write_config(config)
@@ -79,7 +79,7 @@ DISTRO_FEATURES:append = " systemd overlayfs"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES += "systemd overlayfs usrmerge"
 OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 """
 
@@ -97,7 +97,7 @@ OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 """
 
         self.write_config(config)
@@ -115,7 +115,7 @@ DISTRO_FEATURES:append = " systemd overlayfs"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 """
 
         wrong_machine_config = """
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 81b8d056ccd..463679dd325 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -294,7 +294,7 @@ class Postinst(OESelftestTestCase):
                 features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
                 features += 'PACKAGE_CLASSES = "%s"\n' % classes
                 if init_manager == "systemd":
-                    features += 'DISTRO_FEATURES:append = " systemd"\n'
+                    features += 'DISTRO_FEATURES:append = " systemd usrmerge"\n'
                     features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
                     features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
                     features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
-- 
2.39.2


