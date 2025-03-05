Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BF1C28B25
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6414.1741212693418777469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vU2OHZWH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234bec7192so137485415ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212693; x=1741817493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTdVspFTV2H0dBq9W6uLDAm5Vt686hEreR8F7/e4U6U=;
        b=vU2OHZWH6UcJHa0KK22QE9RpCg3pMnG9jVA/2+xdirKqqpcWopyI46yUPSZsuVZIKj
         SGAfITVeOqtEVwTKmBW+0R0CLae7b5LzB7Se0XubtxLtjeVih4hhplVb9UZXB93xrdgd
         jUZV+kBKzVB18yx15E8syA6c69wPw4Q/hPH/UnKgD3E3z4Sxp/DVqKgVbKb5kLqv6oCo
         HVX5r6VEwMhTvm1ScOTQ2VDu/MIGbf4eotyhKm2mxzAgTeVDxVCkpUTPyK8FsOTUciVg
         TnCNOFnS62V5U2SOpFXuNDwHS76LutasEjN0aZlFDxxp0LzskM7hiNtACpi6lAmj5QCX
         A1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212693; x=1741817493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTdVspFTV2H0dBq9W6uLDAm5Vt686hEreR8F7/e4U6U=;
        b=pWfc0uhJcRNzenAt4FKaTHJ3dk59FYSVL/bDwbL+qMgteWJplUxJ6egJxLAsqohqQw
         TVeQctbez4PYXqy5ShdeCVFrIwWtsac0uK4tR6YCgNLYLouJV6LiVt5q5TyIjZQ+XcJ5
         xSsgaMOoM/hnNwn09hKLAGjlX+Yif87XqDy/aYuEEWZTw6yzHi3sbtgWxpYhDeQBIUUK
         XA6sJrOVz5Ss4x4kMwgQx0PLzSH3ZXp940SRXInoUkeKKnuCNbmoCYNahJEWVRxX1egK
         jzYuiWXH4ZQ/6cyASFQzMQRVbg25qBIoFxIyqFRTKashnYI4qEcw2D9VMyZgfqwvnBal
         pBlQ==
X-Gm-Message-State: AOJu0YwVa6B5VYwa/M4dZDbagNWsACW77R2HmOBNbLz+kZKIns4It93c
	Msifjcl9ic8wFK/TQii8uHQrIw7wt3vjFRiIqdGrwdRjGpIPsjiNcp9oElaBoESAjEv0c1rHjso
	P
X-Gm-Gg: ASbGncuJhK3k1JfAyrYBXgcZs6FEtG67vehu+j0lN3dhaOx1rmZoKx4RUqQC3j03Stg
	H1x2TNejH5F53OqGb86sHNRksO/oovKR1xy69Kf7S+JzFNvsTGXGt4HsW68tQkbtTPeowVbVPtz
	VVNZY6BvIfAMW3fdi79qo3ghQawCD8FnTYPe9ObYEWzgkoCl7WlXeb6QvkNY7J5DGhDjYcF/LYv
	Z2TzU/EC+aZv8ztrRX+YVFLzzPLQHYbcDu69vCNxM2fwInfS3e8xuAaRuFSTYNlkvFWQb5wtOiD
	0USO3KI2KM8md+fruxqN33mHIxgXOsMqCcc=
X-Google-Smtp-Source: AGHT+IEERS5unmraRDI2PmYjj50oAqTOYfGGfyyem7opIKKu/R1B23sSw700i5lispHhCd0GqPyhhw==
X-Received: by 2002:a05:6a00:1804:b0:732:1840:8382 with SMTP id d2e1a72fcca58-736829e22cfmr6907506b3a.0.1741212692724;
        Wed, 05 Mar 2025 14:11:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] xwayland: Fix CVE-2025-26595
Date: Wed,  5 Mar 2025 14:11:04 -0800
Message-ID: <f801e34c07472af8384e69da27271584ee6a8d1c.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212355

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26595.patch    | 65 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 3af0bb9012..2215d2fe4d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


