Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25265CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1063.1778000349195865388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3uW6pECD;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso65386955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000347; x=1778605147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsWTBWs4jx5EuAURA2HcZZ49V+KKU7ymDXGJmYEsswg=;
        b=3uW6pECDYJY8GY/tAR3NmZoEJlivIcXYBdMw6g07RqfxtPyXQOQ/0UMd0OzGVtqk5c
         YVEq8e4IZe4NeSpSho0/M4FNs2NenMWyf1LDtiEv7YgtHA6mPLo90LRumm6FHPgdNhA+
         22OJlwpm8NW+gTVqD714iTohI8bRexs/wpRzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000347; x=1778605147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsWTBWs4jx5EuAURA2HcZZ49V+KKU7ymDXGJmYEsswg=;
        b=ATmKrIXojxqQaS4hAWZA+uosgnb3pQP2DseI7CW08nVHKzdUL3kSEIRrAOhYzsq3st
         1vjVGCnezsgR5j/nyn/Dt9AQQL0w6oxszXDIuFaPEJuwX003uuAVmf/HmAiQdtbhZye4
         N15z4OnuuskfNQGXi3rM1ct7vNXqkEFo6Ap6zfm5baIyzRTKxOX591Srih6j+hDhJ0Hx
         0z1QH4iZC0vtp/sNlxCXMmzZjv9jQekCWyTcDTjV2tTvtbX3QbbPoQJo/HppWd9YgjvD
         RYj1BxWJEx63ApD+PfWKfPK6qwmcu6A35Keancartou+Gx6QQK1D/v25lTe6c955tuVH
         sMlA==
X-Gm-Message-State: AOJu0Yww61cyysk/7odBrw333PmTZdk+ud1JfdiPE9/VsE1b3iBmWn0O
	9KC0ystIzSLRpdX2d8U6DKHhyQBbFi/fKNOstYwXzrGqf7d5jP2NGNtC8QUEIX/Ur1RG2kMcc/f
	ueDhxbs0=
X-Gm-Gg: AeBDiesT7oZjg1xDCgA0QuGi6LY8KEfdJjE/e80PKlHxERFX9p6XFL+WtbZB6sNztlm
	Z3gNPRt5Jwdhi+vKEPbJwW2zTLug7gfyrnpMCmlBSM6gawTPaDjwagsycKfccGoFRSzDXR83xRh
	LV/xLHTogFseCHkok6m8gDKTT4eG8hnzURgfOYUk5qDZ7zD0Mu4toCRewo2qrZY1NjFS/4e5zyQ
	OeUpeBEqguZ5YLrr4kRdsUD38TpZsl6dMJ3gOisESDKioxCvW/z+PuKztRI6mWY/yT2snyppDSx
	9fNFETlr1SXpM76udCYWfZS9iwL1dzESBk+I3qZq99tbwaGIRgdd//6Kgb/3eP20Lz9o7yMlVWR
	cdVs82lVX3Usw+mXeudPs7yW38ldfYHB+0jH1+BtrgODomLabtlqehn7DkNNPQJNG2m4+lAd2f6
	E8BS1g5p34PWE4zhcALNfZeQr7rnfrWtoiXi2iHt60KftfYlIv9h5zI3L8tL7fpN4g9bFrb6ADg
	2ZURo8yo//Ejl+TtDQrFRtdIg==
X-Received: by 2002:a05:600c:1d18:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-48e51f41b9cmr841145e9.29.1778000347306;
        Tue, 05 May 2026 09:59:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:06 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/23] systemd: fix for CVE-2026-40226
Date: Tue,  5 May 2026 18:57:38 +0200
Message-ID: <84dc87ab504b8b357e7703a911c4f131aa971fe7.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236512

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport commit[0] and [1] which fixes this vulnerability as mentioned in Debian report [2].

[0] https://github.com/systemd/systemd/commit/773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a
[1] https://github.com/systemd/systemd/commit/bfa0a842822c4f79da9d47f8a773fd128d8f8a0a
[2] https://security-tracker.debian.org/tracker/CVE-2026-40226

More details : https://nvd.nist.gov/vuln/detail/CVE-2026-40226

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../systemd/systemd/CVE-2026-40226-01.patch   | 63 +++++++++++++++++++
 .../systemd/systemd/CVE-2026-40226-02.patch   | 39 ++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
new file mode 100644
index 0000000000..6f2893cab7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
@@ -0,0 +1,63 @@
+From 773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Wed, 11 Mar 2026 12:15:26 +0000
+Subject: [PATCH] nspawn: apply BindUser/Ephemeral from settings file only if
+ trusted
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for 2f8930449079403b26c9164b8eeac78d5af2c8df
+Follow-up for a2f577fca0be79b23f61f033229b64884e7d840a
+
+(cherry picked from commit 61bceb1bff4b1f9c126b18dc971ca3e6d8c71c40)
+(cherry picked from commit 718711ed876c870a72149eea279b819cdab14e91)
+(cherry picked from commit e4db9c12957d315c0ed22c6ca87a816d0927d6dc)
+
+
+CVE: CVE-2026-40226
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/nspawn/nspawn.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 005a3d2be1..0ac0c94f06 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4275,8 +4275,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_EPHEMERAL) == 0 &&
+-            settings->ephemeral >= 0)
+-                arg_ephemeral = settings->ephemeral;
++            settings->ephemeral >= 0) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring ephemeral setting, file %s is not trusted.", path);
++                else
++                        arg_ephemeral = settings->ephemeral;
++        }
+ 
+         if ((arg_settings_mask & SETTING_DIRECTORY) == 0 &&
+             settings->root) {
+@@ -4444,8 +4449,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_BIND_USER) == 0 &&
+-            !strv_isempty(settings->bind_user))
+-                strv_free_and_replace(arg_bind_user, settings->bind_user);
++            !strv_isempty(settings->bind_user)) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring bind user setting, file %s is not trusted.", path);
++                else
++                        strv_free_and_replace(arg_bind_user, settings->bind_user);
++        }
+ 
+         if ((arg_settings_mask & SETTING_NOTIFY_READY) == 0 &&
+             settings->notify_ready >= 0)
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch
new file mode 100644
index 0000000000..47f780e6c5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch
@@ -0,0 +1,39 @@
+From bfa0a842822c4f79da9d47f8a773fd128d8f8a0a Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Wed, 11 Mar 2026 13:27:14 +0000
+Subject: [PATCH] nspawn: normalize pivot_root paths
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for b53ede699cdc5233041a22591f18863fb3fe2672
+
+(cherry picked from commit 7b85f5498a958e5bb660c703b8f4a71cceed3373)
+(cherry picked from commit 6566dc1451089e07090f5a114ae2eb43ed39188d)
+(cherry picked from commit 1c55a0a5e26a07df828f72092ad1203e221b60db)
+
+CVE: CVE-2026-40226
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/bfa0a842822c4f79da9d47f8a773fd128d8f8a0a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/nspawn/nspawn-mount.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 470f477f22..09c442a63a 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -1255,7 +1255,9 @@ int pivot_root_parse(char **pivot_root_new, char **pivot_root_old, const char *s
+ 
+         if (!path_is_absolute(root_new))
+                 return -EINVAL;
+-        if (root_old && !path_is_absolute(root_old))
++        if (!path_is_normalized(root_new))
++                return -EINVAL;
++        if (root_old && (!path_is_absolute(root_old) || !path_is_normalized(root_old)))
+                 return -EINVAL;
+ 
+         free_and_replace(*pivot_root_new, root_new);
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index fe9d699816..9c5f8af240 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -31,6 +31,8 @@ SRC_URI += " \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2026-40225-01.patch \
            file://CVE-2026-40225-02.patch \
+           file://CVE-2026-40226-01.patch \
+           file://CVE-2026-40226-02.patch \
            "
 
 # patches needed by musl

