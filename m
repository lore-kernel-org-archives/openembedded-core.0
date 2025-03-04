Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA572C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.20496.1741090808717890988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dYzGBbli;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22328dca22fso82327365ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090808; x=1741695608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lsnOEJ9z8GU5p1CSkE5/K6UNvV5anAfbeEBGJail18=;
        b=dYzGBbliUybc5+e/UZzMbbr/jwMqTTB04hAVWolZ/7861eGnmHJgmF9xW9udOmpmSh
         2X098sFpp4fUc0LJnuZrnov+09hK3H1eLN7TJZg8+HuH7O81ahrlN4dzY/sGuCLefbLe
         v2vXYwQcz0Qi72zwLWd9fzjzh+DvX6P/fVKvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090808; x=1741695608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lsnOEJ9z8GU5p1CSkE5/K6UNvV5anAfbeEBGJail18=;
        b=e8M6vhdKQJidySjD+qPdkMjOPBEmXnosRZHlCAmsgiU46fK8NlrVngK6u9QteTgjMf
         V69cr6cKD++5xCIP0P31h8jmCdiZP2hIPpCPeHjdvRMeu2IINAOX4tT+XTC+Je3nm+xq
         g2xmj50R3B65y/aq5QLiw+9NwiFdICvh9NWknMXF/KGGo6NRyXkK029xUBWBWHV/LCVC
         VPOXg6hHxgJ4yN64mLnajlmxXfuWuA7nf2Hz+NUwG4EMxq/pNZcJOjpITygTkrphT8mO
         n2d0zS07Nhfwd8ejKyQmhA2avAC0VBItUQwr0lhp2I22+rcjXrNMjU89cqVhd7QUHS2y
         0NzA==
X-Gm-Message-State: AOJu0YwllnkkE565mktsFwoAM1UOdTyv2zsY7JTfTnHSb0SmwMBCTc81
	YabSoa7yg3TJxGkVELvPawGSGTYhp5V7265AZkXHrTOActIlv6ydwg9yzhXpNXDKGjQ8Dd7gP91
	bqxE=
X-Gm-Gg: ASbGncsvqRzOJJR/EzP+wPm+1CKYxp23CDchbCibfkVLPxsPt4bfRo0CFHxmKIUD86V
	6FFysExAl3V7yqD5Exrh8/HzYuBY/lCX5Ik95Rb+kJlQZs2Ep8ibqYCy/j3L3saLH5pff7yJ2ve
	H/ydpQg7WXNQesBqEjU++jbiquXUgaJTpbClQjvVrstxHyxB3WWwbNBwgCRw2+hRDpqEjsVAws8
	HqDkrIKbETPBG2LXgZqLLfesnZ5w0caZJudFFp+IAcqlkU2Z+xcpn4FhyJPFJXXfe604KrjSMOR
	5q9/Myax//U0p+jU58M6gCRpbFyEicXPs7EmVYmk7V1mPCaB2ZXq7w==
X-Google-Smtp-Source: AGHT+IEHphGXRilH0oGN8tkIa5rWxFV3srs5Jv3ajmLq7/JXOxPQnVqBWVw3hYpKPKzUtbcuDAaD4Q==
X-Received: by 2002:a05:6a20:9151:b0:1f3:4108:eed2 with SMTP id adf61e73a8af0-1f34108ef94mr2390225637.15.1741090807742;
        Tue, 04 Mar 2025 04:20:07 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:07 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 08/14] xwayland: Fix CVE-2025-26595
Date: Tue,  4 Mar 2025 17:49:12 +0530
Message-Id: <20250304121918.147345-8-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212273

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26595.patch    | 65 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
new file mode 100644
index 0000000000..a7478d9e2a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
@@ -0,0 +1,65 @@
+From 11fcda8753e994e15eb915d28cf487660ec8e722 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 27 Nov 2024 14:41:45 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbVModMaskText()
+
+The code in XkbVModMaskText() allocates a fixed sized buffer on the
+stack and copies the virtual mod name.
+
+There's actually two issues in the code that can lead to a buffer
+overflow.
+
+First, the bound check mixes pointers and integers using misplaced
+parenthesis, defeating the bound check.
+
+But even though, if the check fails, the data is still copied, so the
+stack overflow will occur regardless.
+
+Change the logic to skip the copy entirely if the bound check fails.
+
+CVE-2025-26595, ZDI-CAN-25545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87]
+CVE: CVE-2025-26595
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkbtext.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/xkb/xkbtext.c b/xkb/xkbtext.c
+index 0184664207..93262528bb 100644
+--- a/xkb/xkbtext.c
++++ b/xkb/xkbtext.c
+@@ -173,14 +173,14 @@ XkbVModMaskText(XkbDescPtr xkb,
+                 len = strlen(tmp) + 1 + (str == buf ? 0 : 1);
+                 if (format == XkbCFile)
+                     len += 4;
+-                if ((str - (buf + len)) <= VMOD_BUFFER_SIZE) {
+-                    if (str != buf) {
+-                        if (format == XkbCFile)
+-                            *str++ = '|';
+-                        else
+-                            *str++ = '+';
+-                        len--;
+-                    }
++                if ((str - buf) + len > VMOD_BUFFER_SIZE)
++                    continue; /* Skip */
++                if (str != buf) {
++                    if (format == XkbCFile)
++                        *str++ = '|';
++                    else
++                        *str++ = '+';
++                    len--;
+                 }
+                 if (format == XkbCFile)
+                     sprintf(str, "%sMask", tmp);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 814fc1ce40..452bae8c8d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


