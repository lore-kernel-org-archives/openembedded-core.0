Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAEFC54740
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.70871.1724736240444544741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxbmrnqA;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so516283866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736239; x=1725341039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY75C/xGcghPL0UXfvyldsiv7oYXU5r+U2E8QvpKWHM=;
        b=kxbmrnqA7KdmWAJflqQF865I0gfpG2kbwHAg9MHjHBUBjxlY78dYlp5KcrJdDTmg80
         HtB4Uqm+7nlmbLv1FRbgQNpf4T4f4P15gjgMIommgGvsPkLwWld+UmKD+d2uGYylk5Rj
         JDm7K/zAF1rMhc/AasuxAhQLNfQPpxGgfp9/I4K3rwkFO1ywqc1jdehvWcTv8wk+nbad
         FWa1k9+Pg75wivhcmWRA9xldCE05hd+ogj5cnkSGnNHs9SAQuz8ygO0SpyTTqbAdmm4d
         lbAr0wQgTPjr+ZNvdXYCsKJl59YR+Dkf4Do8QeatW4gvV3Sxu0zz/VQVROhBRWq/IB1o
         GxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736239; x=1725341039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jY75C/xGcghPL0UXfvyldsiv7oYXU5r+U2E8QvpKWHM=;
        b=xMJqIwqcpHbepst3ZVXB3IUWKBOlci47w7vW9qfNj2uR9iIiFCENY2xbFbWdIkVfuw
         aZlrrV/vZgJui5YBmB6ErJCtWO8LEWchExKif0ryoqiqgMOEdmO7DmCwrdt1QvlMimgt
         Y/lNKf140p7w+LicjKk0co0iJIgAnm0gLpFZuYc4neJmUFLKBQ4zFV9GIEfMbIjeT/8N
         oz8HCGQeOKrJuKa/SJIMzXkFXrrVzWQsGjQYTRx/ucNt8KM9WvFBmsclMOEUgJbviBis
         i+02rxSFDdrIucDSJe3oqd5NBuXVqXeXrxBloirNQxv9Vf2fR2dze+Mu6vE4Uahgk1lr
         hBYA==
X-Gm-Message-State: AOJu0Yw+iladD1QSbxPXAO8lpZDaor5WShz7nx3sTTQryxn05nicLz9w
	19XoVrU66SNEtr7fi3qAL++7VFBhZ2XWabdpXA0UvMIyDPjiWeJvPGNK6Q==
X-Google-Smtp-Source: AGHT+IH6TS5z6LNj9iphEjqgMpozvpv39iLKYbdBThEFBjeO8Zjlj3SujMHdWm7/KhkRxmtVwrMowg==
X-Received: by 2002:a17:907:7f21:b0:a77:d52c:c42d with SMTP id a640c23a62f3a-a86e397e404mr122358666b.13.1724736238563;
        Mon, 26 Aug 2024 22:23:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:23:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/34] selftest: use INIT_MANAGER to enable systemd instead of custom settings
Date: Tue, 27 Aug 2024 07:23:22 +0200
Message-Id: <20240827052354.1319810-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203778

From: Alexander Kanavin <alex@linutronix.de>

This is already done in most of selftest; these two were the last
holdouts I could fine.

Hopefully this improves sstate reuse as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 7 +------
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 5 +----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 74811d2c0aa..94d01ba1165 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -250,12 +250,7 @@ USERADD_GID_TABLES += "files/static-group"
 DISTRO_FEATURES:append = " pam opengl wayland"
 
 # Switch to systemd
-DISTRO_FEATURES:append = " systemd usrmerge"
-VIRTUAL-RUNTIME_init_manager = "systemd"
-VIRTUAL-RUNTIME_initscripts = ""
-VIRTUAL-RUNTIME_syslog = ""
-VIRTUAL-RUNTIME_login_manager = "shadow-base"
-DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
+INIT_MANAGER = "systemd"
 
 # Replace busybox
 PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 13aa5f16c9b..27090ae5cd9 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -310,10 +310,7 @@ class Postinst(OESelftestTestCase):
                 features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
                 features += 'PACKAGE_CLASSES = "%s"\n' % classes
                 if init_manager == "systemd":
-                    features += 'DISTRO_FEATURES:append = " systemd usrmerge"\n'
-                    features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
-                    features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
-                    features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
+                    features += 'INIT_MANAGER = "systemd"\n'
                 self.write_config(features)
 
                 bitbake('core-image-minimal')
-- 
2.39.2


