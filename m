Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0DAC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:19:44 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.20373.1741090776135596039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iuvEqV3W;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223378e2b0dso79289835ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090775; x=1741695575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Br+J56IXRrnYOSrAvZhSoznp5V7USZ1phT8sNcyp+XA=;
        b=iuvEqV3WGmthhWvqEwS+ONDfkjH/1aYBN0FlonSC5aQVY/xGFupn9GCE+TFAUO/kFs
         m8W/vo//Xt23Q7oZCPlfgC1jlmJauZtZUWsixRfohGTZPLzYU4fiBNfk/QREgj17A6yI
         kfCs4xPf35BUApFyRTVWVT4fSKsQWDtMY8v98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090775; x=1741695575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br+J56IXRrnYOSrAvZhSoznp5V7USZ1phT8sNcyp+XA=;
        b=w/rSfgQ2HRPaf2/sFbCwPw2jtHKzXNBvwTfI6H/iZkLKUY2sDh6INzVNvNeze3K8+l
         UVBDgQahN3ZYN7RTzxebU8ehWQ06EwwmCWcxwfj6g7PIUUYN3vvOUwDL0p9EDSSPQUij
         Cw5vK3IjQpWzkioquAZyVG2eocTqY8/xzoezbfueb4nEw5V7zwTzyNy16jzjCRxAy4Dk
         p8vFOKJFxedEvnDA8uBF5eexMeMo+DDhNJpSU8VAbBD6gmBt+53Mwp/pXVqLWb9ALxaB
         pR6222PC1E5DRWED8vkPDJ/XYmrmURJLadvl8vXQ4RKSOJPQik7okRoVxIQwnZfka4Om
         UJgg==
X-Gm-Message-State: AOJu0YzR34y8OYf0MPzof1jgglb3egdDcpK4tJTOjq0AGyLmFo14IH+h
	XUmK7c6jRizEliOpjgpm0DfaZzQgv/ObdIYVsYctHhqLVHftSUNK5BnkJP5mNDj3XrIh1/AQeJb
	cBik=
X-Gm-Gg: ASbGnctJBO5ZZS+11tSJZt27TrNN8qKZQp4OhsEGEg39gGKNfUCOnXZJNBgxauZLBla
	7GzHQFAwRtVaMOuZBnEtvMM+lupycrMvkLmn/Pr7iKRLIGkEBUa4M1OwMDXpwnZpR35jrVAGoRC
	XdQuGi6kGnD+sAcKlrlDc7BhE44fTN6PnylYach1I99xVjH7cIhID0lSgFhhLzmh8pGyHPNXHEP
	653UgIDm+mktpsJ/xAV2ss+uEnis3FTd8eS6kujorZ+FIgP+EXFTlkaMY10nGU+ScshKqKb5Mh/
	I/e6UsvD5jcxFQW7Ff+cKbc8EZA+Qp6TWj6b8Abs0v75byFm38BNTQ==
X-Google-Smtp-Source: AGHT+IEZjwUDbI8x/1L3Sqs+1cyOvylX8+5FLkpF3gMlQAu7KBIf8/rk7IFmHWmtJQUolqDlvsnZ0Q==
X-Received: by 2002:a05:6a20:2586:b0:1f3:448b:94c3 with SMTP id adf61e73a8af0-1f3448ba1aemr984340637.5.1741090774876;
        Tue, 04 Mar 2025 04:19:34 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:34 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 01/14] xwayland: Fix CVE-2024-21885
Date: Tue,  4 Mar 2025 17:49:05 +0530
Message-Id: <20250304121918.147345-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212266

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/4a5e9b1895627d40d26045bd0b7ef3dce503cbd1

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2024-21885.patch    | 113 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch
new file mode 100644
index 0000000000..7c8fbcc3ec
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch
@@ -0,0 +1,113 @@
+From 4a5e9b1895627d40d26045bd0b7ef3dce503cbd1 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 4 Jan 2024 10:01:24 +1000
+Subject: [PATCH] Xi: flush hierarchy events after adding/removing master
+ devices
+
+The `XISendDeviceHierarchyEvent()` function allocates space to store up
+to `MAXDEVICES` (256) `xXIHierarchyInfo` structures in `info`.
+
+If a device with a given ID was removed and a new device with the same
+ID added both in the same operation, the single device ID will lead to
+two info structures being written to `info`.
+
+Since this case can occur for every device ID at once, a total of two
+times `MAXDEVICES` info structures might be written to the allocation.
+
+To avoid it, once one add/remove master is processed, send out the
+device hierarchy event for the current state and continue. That event
+thus only ever has exactly one of either added/removed in it (and
+optionally slave attached/detached).
+
+CVE-2024-21885, ZDI-CAN-22744
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/4a5e9b1895627d40d26045bd0b7ef3dce503cbd1]
+CVE: CVE-2024-21885
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xichangehierarchy.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index d2d985848d..72d00451e3 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -416,6 +416,11 @@ ProcXIChangeHierarchy(ClientPtr client)
+     size_t len;			/* length of data remaining in request */
+     int rc = Success;
+     int flags[MAXDEVICES] = { 0 };
++    enum {
++        NO_CHANGE,
++        FLUSH,
++        CHANGED,
++    } changes = NO_CHANGE;
+ 
+     REQUEST(xXIChangeHierarchyReq);
+     REQUEST_AT_LEAST_SIZE(xXIChangeHierarchyReq);
+@@ -465,8 +470,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = add_master(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIRemoveMaster:
+         {
+             xXIRemoveMasterInfo *r = (xXIRemoveMasterInfo *) any;
+@@ -475,8 +481,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = remove_master(client, r, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIDetachSlave:
+         {
+             xXIDetachSlaveInfo *c = (xXIDetachSlaveInfo *) any;
+@@ -485,8 +492,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = detach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = CHANGED;
+             break;
++        }
+         case XIAttachSlave:
+         {
+             xXIAttachSlaveInfo *c = (xXIAttachSlaveInfo *) any;
+@@ -495,16 +503,25 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = attach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
++            changes = CHANGED;
++            break;
+         }
++        default:
+             break;
+         }
+ 
++        if (changes == FLUSH) {
++            XISendDeviceHierarchyEvent(flags);
++            memset(flags, 0, sizeof(flags));
++            changes = NO_CHANGE;
++        }
++
+         len -= any->length * 4;
+         any = (xXIAnyHierarchyChangeInfo *) ((char *) any + any->length * 4);
+     }
+ 
+  unwind:
+-
+-    XISendDeviceHierarchyEvent(flags);
++    if (changes != NO_CHANGE)
++        XISendDeviceHierarchyEvent(flags);
+     return rc;
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index f639088b25..c7e5c7bd81 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-0229-2.patch \
            file://CVE-2024-0229-3.patch \
            file://CVE-2024-0229-4.patch \
+           file://CVE-2024-21885.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


