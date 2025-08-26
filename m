Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C456ECA0FF0
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.64675.1756215885455817005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yLRmHTGS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-246aef91e57so33549475ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215885; x=1756820685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkD62ahqpLcxCk3Qov8PdI26bZE+p7mikZ/sc7awdlo=;
        b=yLRmHTGS/e23B9SEQsCf7f8LZZaljPprYR8yoSqum1tz6sDC4slaBDb2EPihqp2xye
         SB4ESC0FR2++4Op0p5oCX+5e8WuJWgDIUwLFshzdi9wU8a/nfm5Lw9DXd83Z6Kwv7QxO
         hEp07ncgup3fGjRrauZST+IxcjNr0zeUN+WuPAiYvUDH/AH6Q3ZpTFhUJqM1GKrJq/JK
         VWqb0SvoygOIVUVYVO0fqlZu/CB6sCTPCb5aKkKjXGDylbsAJQ6Gyh6asLtsFOBq1jOQ
         gQlAiX96pduUVYpPYgxxwTooh36AkkRzpL4OBck0NuzLsqDoKf1tOMZpxYggMNjsNH0/
         BzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215885; x=1756820685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkD62ahqpLcxCk3Qov8PdI26bZE+p7mikZ/sc7awdlo=;
        b=TZ8U/rPEER2kPSr/SYaRI89AElA6QU5d4IqmW1DF3fLIaFUJJYpi+SJaYsrxIJUMLa
         z+u4w1iXIKu8cSqwiYvB8q0nUt4CtuAcZJA4uKcu4kOMHbvOjVfOQf5wCBGDUltKebbs
         2Qw45b2mOIIVNtb4LUxhMBWz8CzDyzsXsS7z1V5+z64rxT0vSeGj7Srole4DNsKMS7EB
         ZyF8/zNWSkRqgCnEi4UctIAjweC1Vu4KNrGlMji0zyt6fGeIRT0PTZcidumPzxC8jWe0
         uzjKOaTgXKGOdwujs3gnzJ/DVI1K9rzA0WGcP5Ag0Pq77BNJujSkVBr9nVnlLawBu7un
         RzRA==
X-Gm-Message-State: AOJu0YzCSc9J5M2MWpF1ktPt4N/N/SRqLYUpsyaJm/LVp3Y1gX49g5It
	YKImM+Kt0q8hHTxXi9mledE5kUq01Vpb3z+U6wsVxVFXRK8IsCfS6rqJbaIXMLFCWWCh9MIXMPu
	hSnQW
X-Gm-Gg: ASbGncvxV1gSuY/2Z6J0PLl3q5L0ZBZ7IGtzz9pOqjsMo6iHXKqqNq+GWIUx7iiUgM/
	P1WfdrzLOjDijGLtk8EuWe1TVhA4ir/p99/OTD7yYTMPf4FYTZDUuDkjJS+TaYaVFAQFW62wOVX
	6DQoSug5wjDEgKKtziN7jX/AzGxQkk9VRIriX7v5WfDqecnGxdMV22BhgzV+RcJKXmQKz14HRWl
	g5+OYCoXi3tmVssBKq+FGFwUfCHHghf99g5x/T/TG6c0hDLdTWWuoQ3Mxzc0pY4VpdxjuRvPJWm
	uqM3HKFo5OOxkrhroQkflNKgHMBZ7NJzf3zIRNg0NXxdWmP3kR1VXufFcf0+1pFsh6tyixMrbMw
	uN75Dhc/Hiays6g==
X-Google-Smtp-Source: AGHT+IHng0bMbOrJ6lB5oMmChDB9k92Bh231Uzyx3WqIRxQlqRzjyunXMjMoP7m4yytviljXEgcqfA==
X-Received: by 2002:a17:902:f707:b0:246:2733:940d with SMTP id d9443c01a7336-2462ee542abmr213835015ad.15.1756215884591;
        Tue, 26 Aug 2025 06:44:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] xserver-xorg: Fix for CVE-2025-49180
Date: Tue, 26 Aug 2025 06:44:26 -0700
Message-ID: <88abe8ec73f822b461670557539a7df0875325cc.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222465

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


