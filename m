Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FEFCD98E6
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71887.1781274399576061437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2V4cy128;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46066e640easo619885f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274398; x=1781879198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0D6X1BHS6vEvh7YnTo3VHeYE2SYHH1cVVFuewjv1ss=;
        b=2V4cy128Ofow1rv1MlkPx1PLeA+FeDG3mxMMglm/jezWbyK8sY5wbvmdS+4YB1/cYC
         cTRiNrqW1CDqg0vEF2/Q8KsAIvqbmVUgbuNw5rmfcgT8ctnrvMMT7maRBN/h7lYvHqFx
         XpdlUqfdY9Om8ZK+vh5z4hWm5FelbtRZ3kH6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274398; x=1781879198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0D6X1BHS6vEvh7YnTo3VHeYE2SYHH1cVVFuewjv1ss=;
        b=FyGlqbT/DBuXbDaDXPobOI2Nv6/DmT7xmGeunzB+48GREwVo3MmB3sqhzHce/STVff
         nRmO4GDvOai9O1K8IE3JmMb5MHFIawTtLiVa6dEHNOrExBtuvnhpbCtyWJtF3748jf0e
         ubVZKpYp0tE9yP93Qf/5tzM4sv+GB24C4xMIEGhaCc5pNQaWAQ010MkdSc9qkJ81khkW
         LL5tGgfvQEV6DNkthrqvNXiaNlwE4Bc2i3l6Xf7xxcmfwLdKt5x7vl6quAdIUrtdeP9w
         sbPuAJSl7XnhfH+IMpZZG5k9n7VyDu3MDK0FWNHSQmCNEd15UVQJljit/Hr2rQFNWTYz
         4XqA==
X-Gm-Message-State: AOJu0YwOVp16Unf9zFTuJ2hHy6b0pVyTdrJSedDdQHOsmCkGzKeBs72f
	Gm+PyWhWyqNxZe+dberCJodoDVSbUuaRdQBJxrGBHlVqscvswZBeHr9lQ9MYDF+VJPG/V7Oiy02
	pIICPWg==
X-Gm-Gg: Acq92OGU1iYAHIbRTzxOdIi2dHmbCD8ZWBiQNgqWAv+u8MZ0yjxRXgukf2zbhxAHANY
	+nd9jZabbazqKqDP5B5Q0jQw3wLGIqYVrdo2NbW/yZxP9ZwyGOtN+UPvvw2yo3m0MaFMFNvLz5q
	boWkKhhNFSXyNz/LRADWSbAh9s64DrQyhWJ9sYXWsuhbdOzKphuvm4Ij5R9eFvKLIW+9fkk6dS3
	v3QSsCex57jxZfaA6UywjN3Dq/+jkF0IWOytZOdtE2IW3Q9TGNIMhYwehxwWLe64+l7Vlh4iea/
	D/YeDzT5z8AXA/Y82ZWFmygmIXIQ1eeR/Rrj19Ibw75nlg5YRE94QZqqZPZnj3qWUe4GtBdtmWu
	y2saZZMbz2LRJuYOGCmedqiwOiWCti0TDdlIFgb9P5dsDSJKzL6vdsC5pgZVj3P51g6MFpVpxWJ
	wxckBKk+mszNK9Gjz51HtyloM7+yTjA1Zu8A==
X-Received: by 2002:a05:6000:25f8:b0:45e:ea46:3346 with SMTP id ffacd0b85a97d-4606da8d036mr4928600f8f.6.1781274397539;
        Fri, 12 Jun 2026 07:26:37 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:37 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 02/21] busybox: Fix CVE-2026-29004
Date: Fri, 12 Jun 2026 16:25:52 +0200
Message-ID: <ce830d67be738ffad413c15fbb6672d9c3a6edef.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238624

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1] and [2] as mentioned in Debian report in [3].

[1] https://git.busybox.net/busybox/commit/archival?id=42202bfb1e6ac51fa995beda8be4d7b654aeee2a
[2] https://git.busybox.net/busybox/commit/archival?id=d368f3f7836d1c2484c8f839316e5c93e76d4409
[3] https://security-tracker.debian.org/tracker/CVE-2026-29004

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 .../busybox/busybox/CVE-2026-29004-01.patch   | 41 +++++++++++++++++
 .../busybox/busybox/CVE-2026-29004-02.patch   | 46 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
new file mode 100644
index 0000000000..0423a76730
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
@@ -0,0 +1,41 @@
+From e49fb0f6ad0a0f924ec2cfe6838d04c4f1f4c3ba Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
+
+CVE: CVE-2026-29004
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 42202bfb1e6ac51fa995beda8be4d7b654aeee2a)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index cdd06188e..62cc0f466 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
new file mode 100644
index 0000000000..ac8c031cc6
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
@@ -0,0 +1,46 @@
+From 4d8d5b7c4426e62375235cf4903b6cb53bb193d3 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+CVE: CVE-2026-29004
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=d368f3f7836d1c2484c8f839316e5c93e76d4409]
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit d368f3f7836d1c2484c8f839316e5c93e76d4409)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 62cc0f466..64a41c9d8 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 228bfdadd3..7929d396c8 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -64,6 +64,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-60876.patch \
            file://CVE-2026-26157-CVE-2026-26158-01.patch \
            file://CVE-2026-26157-CVE-2026-26158-02.patch \
+           file://CVE-2026-29004-01.patch \
+           file://CVE-2026-29004-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.53.0


