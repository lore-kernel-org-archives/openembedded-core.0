Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED94C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 04:50:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.26693.1655700618039213883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 21:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hTYHljGf;
 spf=pass (domain: mvista.com, ip: 209.85.216.45,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id f16so7777681pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 21:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/OJUnZbXplDgwCx5xi5Vr77L0YXDF51zCpgrIv8E2o=;
        b=hTYHljGfLP9XZ55v/6fOOvx+qup7Cr3SXjFWuDAp2ILSD1EN7Zfc/00HNp2jW7c6gJ
         WIpTqpDw21T11dVaQTePVqMB59dYZ/H2lkhaXxbDbM00Vp9fkSory+K3ILRmEVQiTPCT
         giR/PB0lf1oYIdAfP158JKLJxSDcVuBqRzmRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/OJUnZbXplDgwCx5xi5Vr77L0YXDF51zCpgrIv8E2o=;
        b=VHL8hV7pMg66/enZBeQ8FklD9CR8eolUMMd3kRacW1e+68SNgwvW8C3mE/+229Ibzh
         qgbKtEBmZYHnp2Dv2QgYERkym8ksxECPLjDzeWiCODihyGX60ICmPvLC3i5NfFLwSjQG
         qufWvVL4XtkuR3Qeh3fvXG+AK+h51PHjKSa8Uq74c0SCicKwhZeMlIOsO25ERf++0ufl
         3vUY2BB+0Unx2smeNfUC+zNgeQq7lKzhF9MocA8Qa13Vf2LDNzWcMx7vJP6hc7z1uxnS
         9dKYJbry5pxuuegXuLwqt0Cs4ifE101mmoBDBiAwduqpmLzEdMnUwCu1pEL2YCLg2Bh8
         q4yw==
X-Gm-Message-State: AJIora+ez6KMLDGz7sXcx/SAheeMi8LtDU4Wb0WqcqdKiKFH2jL5UHLQ
	ttJ6d41MjBZeLDQMeKmrqkMn7DCmtTZc79rk
X-Google-Smtp-Source: 
 AGRyM1s2VGLeV+CaZnrrjXcmfpw+yvjLMsA1QrZ8d797rcOvbhK27S0cwNcf2WNIkc2V0RWNJJc+LA==
X-Received: by 2002:a17:90b:128f:b0:1ec:8aa9:586e with SMTP id
 fw15-20020a17090b128f00b001ec8aa9586emr11672776pjb.109.1655700617297;
        Sun, 19 Jun 2022 21:50:17 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.203])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a170902a3c800b0015e8d4eb2afsm7257706plb.249.2022.06.19.21.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 21:50:17 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 20 Jun 2022 10:20:11 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] python-pip: CVE-2021-3572 Incorrect handling of
 unicode separators in git references
Date: Mon, 20 Jun 2022 10:20:09 +0530
Message-Id: <20220620045009.6758-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 04:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167081

Source: https://github.com/pypa/pip
MR: 113864
Type: Security Fix
Disposition: Backport from https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b
ChangeID: 717948e217d6219d1f03afb4d984342d7dea4636
Description:
       CVE-2021-3572 python-pip: Incorrect handling of unicode separators in git references.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python/python3-pip/CVE-2021-3572.patch    | 48 +++++++++++++++++++
 .../python/python3-pip_20.0.2.bb              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch b/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
new file mode 100644
index 0000000000..a38ab57bc6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
@@ -0,0 +1,48 @@
+From c4fd13410b9a219f77fc30775d4a0ac9f69725bd Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 16 Jun 2022 09:52:43 +0530
+Subject: [PATCH] CVE-2021-3572
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b]
+CVE: CVE-2021-3572
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ news/9827.bugfix.rst         |  3 +++
+ src/pip/_internal/vcs/git.py | 10 ++++++++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+ create mode 100644 news/9827.bugfix.rst
+
+diff --git a/news/9827.bugfix.rst b/news/9827.bugfix.rst
+new file mode 100644
+index 0000000..e0d27c3
+--- /dev/null
++++ b/news/9827.bugfix.rst
+@@ -0,0 +1,3 @@
++**SECURITY**: Stop splitting on unicode separators in git references,
++which could be maliciously used to install a different revision on the
++repository.
+diff --git a/src/pip/_internal/vcs/git.py b/src/pip/_internal/vcs/git.py
+index 7483303..1b895f6 100644
+--- a/src/pip/_internal/vcs/git.py
++++ b/src/pip/_internal/vcs/git.py
+@@ -137,9 +137,15 @@ class Git(VersionControl):
+         output = cls.run_command(['show-ref', rev], cwd=dest,
+                                  show_stdout=False, on_returncode='ignore')
+         refs = {}
+-        for line in output.strip().splitlines():
++        # NOTE: We do not use splitlines here since that would split on other
++        #       unicode separators, which can be maliciously used to install a
++        #       different revision.
++        for line in output.strip().split("\n"):
++            line = line.rstrip("\r")
++            if not line:
++                continue
+             try:
+-                sha, ref = line.split()
++                ref_sha, ref_name = line.split(" ", maxsplit=2)
+             except ValueError:
+                 # Include the offending line to simplify troubleshooting if
+                 # this error ever occurs.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
index 08738fb2f9..e24c6f4477 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
+SRC_URI = "file://CVE-2021-3572.patch "
 SRC_URI[md5sum] = "7d42ba49b809604f0df3d55df1c3fd86"
 SRC_URI[sha256sum] = "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
 
-- 
2.25.1


