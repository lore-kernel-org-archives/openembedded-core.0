Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63566C1B0D9
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.9465.1740659543930178361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PqQMCDxM;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22356471820so7690955ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659543; x=1741264343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj5cwV9TE66+FGikF4flcG6cobK4Zv3qdFSGazKsM2U=;
        b=PqQMCDxMq/kjW5IGyHvnkv6oQ/0eHS5DvwE4agF1fJaTu6ReshnE8rhlDLCAmIxp0x
         NKjY4XEpNIl6EgTsWSy9EQjlqJo1t1gO/yKCCwqQpZLBqupeqgoPs9pNkgaNBUXaEchg
         ByKmQHSBl47G7mCRQ4oOz6umAX72jFnydeuIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659543; x=1741264343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj5cwV9TE66+FGikF4flcG6cobK4Zv3qdFSGazKsM2U=;
        b=k9mQrvNQ/z/xwE0+ejDDtO9fAms0bHcUEsjLmHv8om2QHJi4w+ERiXQxDSdvkuEX63
         X7PpRyv0X/PWNF1WEoaiTi3jxYw4dd5ZNnudhbHTfBQMCFXYQnVnPH02BHCURx3ZSI3T
         LXtv8DKWrjpeIGp5Q9ADH2VEQiPLLgvsNU0W8wuYor1s3Fnp/j+qjFohejgeVXdiiobN
         nsPvXlwVrAJIkjPaz59DhNt7IOTIsufQXH8vXWHBiBBo5PPZ3ybMHdiWZxLvF3dJCP9y
         kE16/QHFWVE61U9qbHyHWNq/LO9nR81NF7usMoMM9YiIh0vKRgTLUn4vLPe+Z+Oep5TS
         Bj9A==
X-Gm-Message-State: AOJu0Yz1qn6V500t6mpOW24M4/8QfG0lXzXpuoHbHxhqPq7tADj+12Ru
	CjoKn7aD4vfZcBwOwfhIRxIoNWSK5DbLjAdsiYL/24hneMCoet1rZJMvA5GJ/0dszekmQSq3PHl
	LuQs=
X-Gm-Gg: ASbGncsSjgT4WaNkzGYer2KzFkfemE1YbJ8Fg8V8vdtU1128wGLVWT/2XHvqtvcEALi
	FbXdXYU9FKYh+5NgeuujPJf7xZyUJRjh3kn4LVX7kLj9AvtpuAModuSgXzYJxNIxZeuTltzjPpf
	j+w36GMeTOXUxtfzdqjurYlg4w1I/iEiPicKyI1cf/PygmoutLP9DLCb+JnPI7z6OSPkTIoOkT5
	sEvHvHEVgAyF4oHWa8muzGzPu5pl1eJm8U6GlKHuGYt6o2XxKcPdySXXUjUsw7X4rZ6fUQTLSG3
	cXgcfoZyDDKvbYmOVt3GeYGaItfPyHal5uw=
X-Google-Smtp-Source: AGHT+IHWEHhfJnW2r6hJEBJp/ZkFLkgTox8fJ0LKq7TxxG/z2pzGe9TfBLh/gzGbGE5vj8colPlvTA==
X-Received: by 2002:a17:902:d508:b0:223:517c:bfa1 with SMTP id d9443c01a7336-223517cc0f1mr39534375ad.38.1740659542909;
        Thu, 27 Feb 2025 04:32:22 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:22 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/9] xserver-xorg: Fix for CVE-2025-26595
Date: Thu, 27 Feb 2025 18:02:00 +0530
Message-Id: <20250227123207.270978-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211993

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26595.patch         | 65 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch
new file mode 100644
index 0000000000..a7478d9e2a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 11003db04d..94381a1a16 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


