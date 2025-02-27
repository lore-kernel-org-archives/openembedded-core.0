Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC86C282C6
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.17031.1740678014478180791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PDvW28En;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2232aead377so25619635ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678014; x=1741282814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqA1StXRZxJ41GGfUapPUTXIxYqEdk2SjIirXeocLjY=;
        b=PDvW28EnzIhKeaVDnHp23zHf1McWCxTio35ER0vkJ+pC3ZxdhAkNX4+/xkZYH5Sfn1
         DGMBHktmRkCAvPGedAMeYSEsg168Ld2Uib1tAo8tMBHbgWgAUZmJJaOvpAQOkxbmAmzJ
         hCf8Qo6DsKL5ce+cpeW6dzqfdzm0eEYZY8zHiS+wa+C4gwDY56FyTS3KMxEx102hBaiq
         pM3IBj/KJJgSwGt/7ImkJcVJnIRDeR4WCnqHroHaXVQhUHWjIi1vZOl3cL7XUmX+ZXEL
         pofR5GVObPLYvHOHfiN70dQDpJQU+oQxjCoeUJzja3ecEIfDhgAcgdshZUW8aZMtGu7t
         Zwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678014; x=1741282814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqA1StXRZxJ41GGfUapPUTXIxYqEdk2SjIirXeocLjY=;
        b=GuxDTG83xqdnbmjX5Ynhfpi5OWvTN8rBZnK5wXTdSO1a9+gkvnQUxKh4EVjuYVgXlK
         7ZUIkWTmgfSq4ESRHpEsouFm5X2lbBM9Dz3RBV/j/vsrZnpD+41GA4qQA6jxTQsEQhGo
         ppF23+JQA13tqAW81YxBodAe++Q+eLalpqVPjVCBDkDanlbkcyANQYsUKmkCZbYyLhtJ
         r0NvuPxajaB4PdwKeU9p5t3fn8hxD9XczxQ1khjL8F85asZvq/zbE++MD3VYJJW15FeT
         cp+IURx3LI+m4Wfy5WqBWftkKSynaq03tPMA/nNlg5dlk+GvvDUV4M93/DQ5Y42wwtF4
         olFA==
X-Gm-Message-State: AOJu0Yxb63SC+zsUHWtbWI4YiSI1v2tTBXbImLa/qCHwK2k92kHBUszv
	ltM+R2Q05OHlngMCPGJsIoc6wd09Z0Tk3A01XF6Uw4rAcUaBoKMnvUExA/++UaMkfNaKGUp+D+B
	u
X-Gm-Gg: ASbGncvsiGafuLrPO64/8Vo3Q0c/BXyrY9O6k3GEdYDDmRXF9oLKs3ah1fTy/4om41/
	r8dT2yTMELETYonTSbt6ex9NSlJna3RJKMtQ7ZsrmZIfy9mnpbRDfvby/3dlkXOw77G2WuGQ38R
	MPI5Y8J/For5Z2ZJKK+wuYtz8wBqszoEvJvmWAI8cRcm9tfQcQKOdJ0HTpupO3Zdq+3m34mDlDH
	KUpFJgNIFm+SMyu8CeUbYbBp8EaBZLZmea2g/ZqYZa7NeLzrWqRcq5wkLxSafWPqG+Sc7q1exNY
	v3vCc2nRhfXjIlxiXQ==
X-Google-Smtp-Source: AGHT+IFQYqW7N/t3o30dFD1C9Z88/PxQD5hKpmu0bzKfdPeR3cLurJ50sd97TcMiS/ruFP1Opzow9Q==
X-Received: by 2002:a05:6a00:a91:b0:732:1840:8382 with SMTP id d2e1a72fcca58-734abed2a3bmr656064b3a.0.1740678012449;
        Thu, 27 Feb 2025 09:40:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] xserver-xorg: Fix for CVE-2025-26601
Date: Thu, 27 Feb 2025 09:39:43 -0800
Message-ID: <edc4a85c1aa5a137d4f5d8fbc74135c6805511db.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212030

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26601-1.patch       |  71 ++++++++++
 .../xserver-xorg/CVE-2025-26601-2.patch       |  85 +++++++++++
 .../xserver-xorg/CVE-2025-26601-3.patch       |  52 +++++++
 .../xserver-xorg/CVE-2025-26601-4.patch       | 132 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   4 +
 5 files changed, 344 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-3.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-4.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-1.patch
new file mode 100644
index 0000000000..df5416a452
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-1.patch
@@ -0,0 +1,71 @@
+From 16a1242d0ffc7f45ed3c595ee7564b5c04287e0b Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 20 Jan 2025 16:52:01 +0100
+Subject: [PATCH] sync: Do not let sync objects uninitialized
+
+When changing an alarm, the change mask values are evaluated one after
+the other, changing the trigger values as requested and eventually,
+SyncInitTrigger() is called.
+
+SyncInitTrigger() will evaluate the XSyncCACounter first and may free
+the existing sync object.
+
+Other changes are then evaluated and may trigger an error and an early
+return, not adding the new sync object.
+
+This can be used to cause a use after free when the alarm eventually
+triggers.
+
+To avoid the issue, delete the existing sync object as late as possible
+only once we are sure that no further error will cause an early exit.
+
+CVE-2025-26601, ZDI-CAN-25870
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d]
+CVE: CVE-2025-26601
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xext/sync.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index ee0010e657..585cfa6f68 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -360,11 +360,6 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+             client->errorValue = syncObject;
+             return rc;
+         }
+-        if (pSync != pTrigger->pSync) { /* new counter for trigger */
+-            SyncDeleteTriggerFromSyncObject(pTrigger);
+-            pTrigger->pSync = pSync;
+-            newSyncObject = TRUE;
+-        }
+     }
+ 
+     /* if system counter, ask it what the current value is */
+@@ -432,6 +427,14 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
++    if (changes & XSyncCACounter) {
++        if (pSync != pTrigger->pSync) { /* new counter for trigger */
++            SyncDeleteTriggerFromSyncObject(pTrigger);
++            pTrigger->pSync = pSync;
++            newSyncObject = TRUE;
++        }
++    }
++
+     /*  we wait until we're sure there are no errors before registering
+      *  a new counter on a trigger
+      */
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-2.patch
new file mode 100644
index 0000000000..22e751c017
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-2.patch
@@ -0,0 +1,85 @@
+From f52cea2f93a0c891494eb3334894442a92368030 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 20 Jan 2025 16:54:30 +0100
+Subject: [PATCH] sync: Check values before applying changes
+
+In SyncInitTrigger(), we would set the CheckTrigger function before
+validating the counter value.
+
+As a result, if the counter value overflowed, we would leave the
+function SyncInitTrigger() with the CheckTrigger applied but without
+updating the trigger object.
+
+To avoid that issue, move the portion of code checking for the trigger
+check value before updating the CheckTrigger function.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f]
+CVE: CVE-2025-26601
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xext/sync.c | 36 ++++++++++++++++++------------------
+ 1 file changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index 585cfa6f68..10302160fb 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -381,6 +381,24 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
++    if (changes & (XSyncCAValueType | XSyncCAValue)) {
++        if (pTrigger->value_type == XSyncAbsolute)
++            pTrigger->test_value = pTrigger->wait_value;
++        else {                  /* relative */
++            Bool overflow;
++
++            if (pCounter == NULL)
++                return BadMatch;
++
++            overflow = checked_int64_add(&pTrigger->test_value,
++                                         pCounter->value, pTrigger->wait_value);
++            if (overflow) {
++                client->errorValue = pTrigger->wait_value >> 32;
++                return BadValue;
++            }
++        }
++    }
++
+     if (changes & XSyncCATestType) {
+ 
+         if (pSync && SYNC_FENCE == pSync->type) {
+@@ -409,24 +427,6 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
+-    if (changes & (XSyncCAValueType | XSyncCAValue)) {
+-        if (pTrigger->value_type == XSyncAbsolute)
+-            pTrigger->test_value = pTrigger->wait_value;
+-        else {                  /* relative */
+-            Bool overflow;
+-
+-            if (pCounter == NULL)
+-                return BadMatch;
+-
+-            overflow = checked_int64_add(&pTrigger->test_value,
+-                                         pCounter->value, pTrigger->wait_value);
+-            if (overflow) {
+-                client->errorValue = pTrigger->wait_value >> 32;
+-                return BadValue;
+-            }
+-        }
+-    }
+-
+     if (changes & XSyncCACounter) {
+         if (pSync != pTrigger->pSync) { /* new counter for trigger */
+             SyncDeleteTriggerFromSyncObject(pTrigger);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-3.patch
new file mode 100644
index 0000000000..8d714f0302
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-3.patch
@@ -0,0 +1,52 @@
+From 8cbc90c8817306af75a60f494ec9dbb1061e50db Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 20 Jan 2025 17:06:07 +0100
+Subject: [PATCH] sync: Do not fail SyncAddTriggerToSyncObject()
+
+We do not want to return a failure at the very last step in
+SyncInitTrigger() after having all changes applied.
+
+SyncAddTriggerToSyncObject() must not fail on memory allocation, if the
+allocation of the SyncTriggerList fails, trigger a FatalError() instead.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8]
+CVE: CVE-2025-26601
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xext/sync.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index 10302160fb..65f2d43780 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -201,8 +201,8 @@ SyncAddTriggerToSyncObject(SyncTrigger * pTrigger)
+             return Success;
+     }
+ 
+-    if (!(pCur = malloc(sizeof(SyncTriggerList))))
+-        return BadAlloc;
++    /* Failure is not an option, it's succeed or burst! */
++    pCur = XNFalloc(sizeof(SyncTriggerList));
+ 
+     pCur->pTrigger = pTrigger;
+     pCur->next = pTrigger->pSync->pTriglist;
+@@ -439,8 +439,7 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+      *  a new counter on a trigger
+      */
+     if (newSyncObject) {
+-        if ((rc = SyncAddTriggerToSyncObject(pTrigger)) != Success)
+-            return rc;
++        SyncAddTriggerToSyncObject(pTrigger);
+     }
+     else if (pCounter && IsSystemCounter(pCounter)) {
+         SyncComputeBracketValues(pCounter);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-4.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-4.patch
new file mode 100644
index 0000000000..e2261192fa
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-4.patch
@@ -0,0 +1,132 @@
+From c285798984c6bb99e454a33772cde23d394d3dcd Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 20 Jan 2025 17:10:31 +0100
+Subject: [PATCH] sync: Apply changes last in SyncChangeAlarmAttributes()
+
+SyncChangeAlarmAttributes() would apply the various changes while
+checking for errors.
+
+If one of the changes triggers an error, the changes for the trigger,
+counter or delta value would remain, possibly leading to inconsistent
+changes.
+
+Postpone the actual changes until we're sure nothing else can go wrong.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989]
+CVE: CVE-2025-26601
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xext/sync.c | 42 +++++++++++++++++++++++++++---------------
+ 1 file changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index 65f2d43780..cab73be927 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -830,8 +830,14 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+     int status;
+     XSyncCounter counter;
+     Mask origmask = mask;
++    SyncTrigger trigger;
++    Bool select_events_changed = FALSE;
++    Bool select_events_value = FALSE;
++    int64_t delta;
+ 
+-    counter = pAlarm->trigger.pSync ? pAlarm->trigger.pSync->id : None;
++    trigger = pAlarm->trigger;
++    delta = pAlarm->delta;
++    counter = trigger.pSync ? trigger.pSync->id : None;
+ 
+     while (mask) {
+         int index2 = lowbit(mask);
+@@ -847,24 +853,24 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+         case XSyncCAValueType:
+             mask &= ~XSyncCAValueType;
+             /* sanity check in SyncInitTrigger */
+-            pAlarm->trigger.value_type = *values++;
++            trigger.value_type = *values++;
+             break;
+ 
+         case XSyncCAValue:
+             mask &= ~XSyncCAValue;
+-            pAlarm->trigger.wait_value = ((int64_t)values[0] << 32) | values[1];
++            trigger.wait_value = ((int64_t)values[0] << 32) | values[1];
+             values += 2;
+             break;
+ 
+         case XSyncCATestType:
+             mask &= ~XSyncCATestType;
+             /* sanity check in SyncInitTrigger */
+-            pAlarm->trigger.test_type = *values++;
++            trigger.test_type = *values++;
+             break;
+ 
+         case XSyncCADelta:
+             mask &= ~XSyncCADelta;
+-            pAlarm->delta = ((int64_t)values[0] << 32) | values[1];
++            delta = ((int64_t)values[0] << 32) | values[1];
+             values += 2;
+             break;
+ 
+@@ -874,10 +880,8 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+                 client->errorValue = *values;
+                 return BadValue;
+             }
+-            status = SyncEventSelectForAlarm(pAlarm, client,
+-                                             (Bool) (*values++));
+-            if (status != Success)
+-                return status;
++            select_events_value = (Bool) (*values++);
++            select_events_changed = TRUE;
+             break;
+ 
+         default:
+@@ -886,25 +890,33 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+         }
+     }
+ 
++    if (select_events_changed) {
++        status = SyncEventSelectForAlarm(pAlarm, client, select_events_value);
++        if (status != Success)
++            return status;
++    }
++
+     /* "If the test-type is PositiveComparison or PositiveTransition
+      *  and delta is less than zero, or if the test-type is
+      *  NegativeComparison or NegativeTransition and delta is
+      *  greater than zero, a Match error is generated."
+      */
+     if (origmask & (XSyncCADelta | XSyncCATestType)) {
+-        if ((((pAlarm->trigger.test_type == XSyncPositiveComparison) ||
+-              (pAlarm->trigger.test_type == XSyncPositiveTransition))
+-             && pAlarm->delta < 0)
++        if ((((trigger.test_type == XSyncPositiveComparison) ||
++              (trigger.test_type == XSyncPositiveTransition))
++             && delta < 0)
+             ||
+-            (((pAlarm->trigger.test_type == XSyncNegativeComparison) ||
+-              (pAlarm->trigger.test_type == XSyncNegativeTransition))
+-             && pAlarm->delta > 0)
++            (((trigger.test_type == XSyncNegativeComparison) ||
++              (trigger.test_type == XSyncNegativeTransition))
++             && delta > 0)
+             ) {
+             return BadMatch;
+         }
+     }
+ 
+     /* postpone this until now, when we're sure nothing else can go wrong */
++    pAlarm->delta = delta;
++    pAlarm->trigger = trigger;
+     if ((status = SyncInitTrigger(client, &pAlarm->trigger, counter, RTCounter,
+                                   origmask & XSyncCAAllTrigger)) != Success)
+         return status;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index d7b0e7b589..e77b81eed6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -31,6 +31,10 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
            file://CVE-2025-26600.patch \
+           file://CVE-2025-26601-1.patch \
+           file://CVE-2025-26601-2.patch \
+           file://CVE-2025-26601-3.patch \
+           file://CVE-2025-26601-4.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


