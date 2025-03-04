Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE53AC3DA4A
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.20397.1741090832116237424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h1vv8wlJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2239aa5da08so40956835ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090831; x=1741695631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKvy0wPPcxAslCXxyXpBye6c78c/EwEpCxoN6UJQ7ks=;
        b=h1vv8wlJ6mJzVDwTbUPRNw9UPrdMUwO7JyLotZAgzmKOlL4vN/Ye/hUBtud8Tkg3hf
         3NDsvvZaW1YYVr6JPkHRjUCkgP2b1NNDY+tEMNS4+iNWbD9PG2cl+mVPpBdN/NR3fPKM
         27af2ZmjLG4S3RDL271J3J+A7BIncANHaKzj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090831; x=1741695631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKvy0wPPcxAslCXxyXpBye6c78c/EwEpCxoN6UJQ7ks=;
        b=PypztMInteHkXjC/kx83NcsN6yEMuWXJS289c4gz4BkRyie3Rgi4HtvO3z29nkjkLr
         QVRMsHGBEw34osVW7AwMFz0Bi/VHoiOT0MZrSybIM8nT7x7ZKwzyxn/fy9YdDO+QhUPH
         mznVP97QZiGol9AXer1nZ5JbSlcCh9MxzWhH8wFxW241PaHNvOMr/cwrGdahry0SfjaI
         qGAJG4Yhu07d2zOvRxvWWJz0u9I9O0uJvg88fpIVLwNzyI6q2QeGH11Z361nuZmS+Czb
         y8G3tV8gW4akzsihn0mkHmv3RE4unDvjmNmiGfkm7OYunmSnfO+JXk1d64CoH7bN6cU1
         gc0w==
X-Gm-Message-State: AOJu0Yw+7jOfWGHjz4o/eihJGg2mzjDOitk6XZAM/Uxp+tG9ML/ImwCh
	+EiNG0acsI83MhVw+L6cDqnAbhdFhuvofKnL/97UyGlP4Xs/ovQBojlCcvxh8HI/sSfyFIJDkKJ
	cI9g=
X-Gm-Gg: ASbGnct3uccOSPlWXN2dGh+D7SGFxtlIdgGmPjceKYHyIA1xpwsvDCpCnWkHUoWnSlv
	yGmXhtAHaQS91utixX5prrzFjGGrq/AgHQk+pT4LQd0MLx39MaZMiHNV88K9JlJooNa1PxGyXPo
	u8WZAk7BTS5zKGXDYvlWA+kgEKH483riTOQE5tIvSNv/fPywzg3DEdlIR1SAtDjFltQxFO3v3pm
	EZ0OdZQwswOZ5GbJOhHyckeo7pTO6fSSjQm/6x4kWqj+kwctzRULOLTMHCfUL7KiA2irv5pNsOF
	up+n/Ubi1XCuii8F6upRM3nYwvbnYsLZKObSTfpk+j0EEMk8hInKkA==
X-Google-Smtp-Source: AGHT+IEaP9M5XH6majufkj1zKCRUHOov0kkfsk+TOPYF+hZQoPBnstM64LU3D8rbmjYFsxyswNnfMw==
X-Received: by 2002:a05:6a20:7347:b0:1ee:d8c8:4b79 with SMTP id adf61e73a8af0-1f2f4c9c694mr29679260637.2.1741090831003;
        Tue, 04 Mar 2025 04:20:31 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:30 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 14/14] xwayland: Fix CVE-2025-26601
Date: Tue,  4 Mar 2025 17:49:18 +0530
Message-Id: <20250304121918.147345-14-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212279

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26601-1.patch  |  71 ++++++++++
 .../xwayland/xwayland/CVE-2025-26601-2.patch  |  85 +++++++++++
 .../xwayland/xwayland/CVE-2025-26601-3.patch  |  52 +++++++
 .../xwayland/xwayland/CVE-2025-26601-4.patch  | 132 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   4 +
 5 files changed, 344 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-3.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-4.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-1.patch
new file mode 100644
index 0000000000..df5416a452
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-1.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-2.patch
new file mode 100644
index 0000000000..22e751c017
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-2.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-3.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-3.patch
new file mode 100644
index 0000000000..8d714f0302
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-3.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-4.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-4.patch
new file mode 100644
index 0000000000..e2261192fa
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-4.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index d90f9970b5..6affd80e22 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -38,6 +38,10 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
            file://CVE-2025-26600.patch \
+           file://CVE-2025-26601-1.patch \
+           file://CVE-2025-26601-2.patch \
+           file://CVE-2025-26601-3.patch \
+           file://CVE-2025-26601-4.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


