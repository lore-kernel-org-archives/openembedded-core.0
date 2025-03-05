Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9677CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13043.1741181586649795707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fmQXs138;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22401f4d35aso4707795ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181586; x=1741786386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOriHYwlRmAuVWJMAm92zLg/f6EkhmISaHFljj3oMFQ=;
        b=fmQXs138Igaawr+gxdqsXzUWnym0rTyA83kVFe00b73BI2kBq1ndYPyko/YYeZd8I+
         g7OYJum+ovB7SblZMxw3UhXy/IMBnvJU+suMStL47oJzk6rLE3H8/+mU/sRtHN1/1Sqa
         cBaBeK+LagjHkGGiUMx1McCHRvwhyNlWHDghw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181586; x=1741786386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOriHYwlRmAuVWJMAm92zLg/f6EkhmISaHFljj3oMFQ=;
        b=trA9NoZBNKkejjcTGl7QCCYEsp6Uw1PY8/NNytjQ/oBmv0O4SPh/lAOle6hlHLt118
         2dXfsoxPcE1ToDrXD/x3WgmuxGbbE83nqvGsXzOYnVG1fiA8UeCzhdwfYf9dpFYf19Ci
         ibXw7VP7j+iQCYYJM+2M+aWhhpCbnEtuI7RW6znk66f/LX1PfEuCrHUhRrOv3gtVvMHs
         tT/I7uuzjh9VvwxXXivkjT4LUWSRettGJy+boSRVZcjqL3nqygSe5v5jKsNXcmd8l9xT
         lO4ksF4CkC2Ui41gXgStDQc/JOUYL/OnR94a6qDFMkW1DRB0SJgcHinFgOmcxGH4GoZD
         VZDA==
X-Gm-Message-State: AOJu0YzIFALry2aRNvgEST74cCKZtnOWoMG/oxtF+9fH2E1MUcJhCtRR
	NSXm4ML1VepAni9nD4feagjQ9iE5n0x9zkThUEoa5tzAnJM2XbGf0xQKJIn6R511DnKEZwn6fNr
	cZU8=
X-Gm-Gg: ASbGncuHgyPER8RPFDmfcDYNEPFKnDENKz3YMVky8AiEqF6/Uzxqp3Rjkg/QxT1zTrG
	kIgNF5KJB72WtM7r00eUff8RTdmvNyDwOtOO1+FBRjhWyhXnTcLZnxXmO9tDwNcK7yVVufU0uSF
	a+ct2yT0HADgcOzhgzmmwQBDJIogX3HNZUIVisnG9cM2n60a8X/EgMejlNOlpgE93qN4ZHeQuJE
	v7tbyXh8+XNkicVHStF7N1zUCdNjF0Fp4uNVzOoHtMs+85HGlXXtbB87EtMN39dg+8WzRdvv2gs
	r3QMhCR0Oeg6roVR8wNbpUoxD+IgwC7Acti83nmEizS9/nH9H6sODug=
X-Google-Smtp-Source: AGHT+IE3pdZIZpcVoEt6AfzETaPEnUGHgngqQCvo5LlHxXyS6YCFgoroOVCNZv1JOLkfZDpYXyf98A==
X-Received: by 2002:a05:6a00:3d14:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-73682c86ca9mr4491898b3a.17.1741181585608;
        Wed, 05 Mar 2025 05:33:05 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:33:05 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 9/9] xwayland: Fix CVE-2025-26601
Date: Wed,  5 Mar 2025 19:02:14 +0530
Message-Id: <20250305133214.169364-9-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212315

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26601-1.patch  |  71 ++++++++++
 .../xwayland/xwayland/CVE-2025-26601-2.patch  |  85 +++++++++++
 .../xwayland/xwayland/CVE-2025-26601-3.patch  |  52 +++++++
 .../xwayland/xwayland/CVE-2025-26601-4.patch  | 132 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |   4 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index ac0408ea67..0265366393 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -20,6 +20,10 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
            file://CVE-2025-26600.patch \
+           file://CVE-2025-26601-1.patch \
+           file://CVE-2025-26601-2.patch \
+           file://CVE-2025-26601-3.patch \
+           file://CVE-2025-26601-4.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


