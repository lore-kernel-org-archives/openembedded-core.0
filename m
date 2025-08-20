Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA12CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:53:21 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.17132.1755687192855405414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=U1ctcUyD;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b472fd93b4aso4070491a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755687192; x=1756291992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZSF+w4o1wV9wM1y6srfC8any3DiS5qLr+MOl7bGZ4Y=;
        b=U1ctcUyDGr48HJDEGCQuviXZmPhTw1cjUH8viCB+GUEzoxw5W0py5zC1QCby36/1wU
         ML8x67PB47vAco4gPkV+RTaE0v4ojR3eZ04oGzJE9zSV66iq0qfuq0+ipq7ciw7PJUim
         sjQpoNqL57wMkF9PhBwkeOAfux2tzoYnCwGzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687192; x=1756291992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZSF+w4o1wV9wM1y6srfC8any3DiS5qLr+MOl7bGZ4Y=;
        b=kWR8YskHawRQPtrlNV37ueNmRAXlY9qYtkXYMPK4xAE3GBwq8dZXEOiNz2xqslZSSj
         1BTIU9r2mQ49stZjZ+cGDYUkgjjuENQqIyo94k3xV6iTFMvyDgfVBlee8rupDQcBnDRo
         p7h+H1MMV/Rd3h7ip+FzNBHzGzwbwrbIlMgej/7GPpp+5mQOVZootv0NxMy2vDkE+dhy
         bbeXAQ5oAgrZOxwd+xXUqtjb91UBkVsiW082kmRGcBhI8LdbJ9INuDwpi2Mcun3AiaiN
         yjUeTTCAGctwxjzW/HmSB684+kN45OtmaDdbr3zi+rni4ws7MP5Ux5MyU+a56ap+Q1U0
         Hplw==
X-Gm-Message-State: AOJu0Yxhgck5W37kLO6lNsa5JPHmigUiDG4ZUb6iBk95C+fTv+xRFRwy
	2h4XhVWDHP1oBx+N7g3xt0az3d3seBYLn9hnQLAXx4Ne1cmLuWTJmrY7VqRc1vDKCR7NQcxF/CZ
	hCqXezBo=
X-Gm-Gg: ASbGncsZBKPjBXtAPwGi/I/+28XXDK5BOMCmiiytXJ5Fnl9BtZbF1NGJeABlO968H0M
	qMSIV/B91WID1Kr/YsOWDpubHlmjhiyyb/TQaXNOqselptqMT4lKBTfaUpIo/uZSQlQVH82bKFz
	MiZIPpCBCHRg3AEWLzrTejPEZ/XsRTfCE0ObiVrlZvmvty9qjPpq37skT3CHdPwUNLCigfb1W5g
	op3rh7DmXjDJ5t7X15Y25uFuizXod4MkXy2zblVJuRlLHLKK6CNglFPs5B5hCJdFmFdX5I9xNnL
	IpAO02vmdnVFxvVteYRc9po8yDFLqgaP4I8KLrsF5rqRE7EViOLZ47TdN2O1ShIvVbCQ9f14kHf
	Jz6ZK4QVqdwnYWN5nuK/w+vrUBeM3FIg=
X-Google-Smtp-Source: AGHT+IHnLp8/H7+ut+EX7jvJFCLejnJXZgOJ+fnWL00amZxy+17tgb3hJUS5HzgZMqvkN75Ib6tBbQ==
X-Received: by 2002:a17:903:2f92:b0:242:bba6:fc85 with SMTP id d9443c01a7336-245ef2650c7mr31612015ad.56.1755687191829;
        Wed, 20 Aug 2025 03:53:11 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254cbd1sm1976663a91.16.2025.08.20.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:53:11 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] xserver-xorg: Fix for CVE-2025-49180
Date: Wed, 20 Aug 2025 16:22:32 +0530
Message-Id: <20250820105232.201407-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250820105232.201407-1-vanusuri@mvista.com>
References: <20250820105232.201407-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222171

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49180-1.patch       | 44 ++++++++++++++++
 .../xserver-xorg/CVE-2025-49180-2.patch       | 52 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-1.patch
new file mode 100644
index 0000000000..9e4e016477
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-1.patch
@@ -0,0 +1,44 @@
+From 3c3a4b767b16174d3213055947ea7f4f88e10ec6 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 20 May 2025 15:18:19 +0200
+Subject: [PATCH] randr: Check for overflow in RRChangeProviderProperty()
+
+A client might send a request causing an integer overflow when computing
+the total size to allocate in RRChangeProviderProperty().
+
+To avoid the issue, check that total length in bytes won't exceed the
+maximum integer value.
+
+CVE-2025-49180
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6]
+CVE: CVE-2025-49180
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ randr/rrproviderproperty.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/randr/rrproviderproperty.c b/randr/rrproviderproperty.c
+index 69f66ed278..0c3dcd1bc5 100644
+--- a/randr/rrproviderproperty.c
++++ b/randr/rrproviderproperty.c
+@@ -182,7 +182,8 @@ RRChangeProviderProperty(RRProviderPtr provider, Atom property, Atom type,
+ 
+     if (mode == PropModeReplace || len > 0) {
+         void *new_data = NULL, *old_data = NULL;
+-
++        if (total_len > MAXINT / size_in_bytes)
++            return BadValue;
+         total_size = total_len * size_in_bytes;
+         new_value.data = (void *) malloc(total_size);
+         if (!new_value.data && total_size) {
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-2.patch
new file mode 100644
index 0000000000..94fda308a9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-2.patch
@@ -0,0 +1,52 @@
+From 0235121c6a7a6eb247e2addb3b41ed6ef566853d Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 14:59:46 +0200
+Subject: [PATCH] xfree86: Check for RandR provider functions
+
+Changing XRandR provider properties if the driver has set no provider
+function such as the modesetting driver will cause a NULL pointer
+dereference and a crash of the Xorg server.
+
+Related to CVE-2025-49180
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853d]
+CVE: CVE-2025-49180
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/xfree86/modes/xf86RandR12.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/hw/xfree86/modes/xf86RandR12.c b/hw/xfree86/modes/xf86RandR12.c
+index ddcf5e748a..bf33da377a 100644
+--- a/hw/xfree86/modes/xf86RandR12.c
++++ b/hw/xfree86/modes/xf86RandR12.c
+@@ -2146,7 +2146,8 @@ xf86RandR14ProviderSetProperty(ScreenPtr pScreen,
+     /* If we don't have any property handler, then we don't care what the
+      * user is setting properties to.
+      */
+-    if (config->provider_funcs->set_property == NULL)
++    if (config->provider_funcs == NULL ||
++        config->provider_funcs->set_property == NULL)
+         return TRUE;
+ 
+     /*
+@@ -2164,7 +2165,8 @@ xf86RandR14ProviderGetProperty(ScreenPtr pScreen,
+     ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR(pScrn);
+ 
+-    if (config->provider_funcs->get_property == NULL)
++    if (config->provider_funcs == NULL ||
++        config->provider_funcs->get_property == NULL)
+         return TRUE;
+ 
+     /* Should be safe even w/o vtSema */
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 279351eff1..a15669a260 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -42,6 +42,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
+           file://CVE-2025-49180-1.patch \
+           file://CVE-2025-49180-2.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


