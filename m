Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8219C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.6422.1741212703252648186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1Rr/fliz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22409077c06so7940825ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212702; x=1741817502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/1aCcJfYhN0AAaU2BnnqgXGhts2Tm+OcbYRifJZp3E=;
        b=1Rr/flizftv0nnzHBQEjN6FFK2ky9izMJjBcPlGwO6sOneNayc/Y5kdnAAS+3XbgRy
         X4+UV1U83W5UC8hb/SjiCr12ls5xVDW5gm0iwxTY6mqO7QQLr27OANG26GQNAHIRQCpa
         PiD78i4CdzMcL0Iv7cyeT93PPVsfrDwzFSjF/1q/F2nOE+SYX4YX2pRPVOjw+kRIaUNE
         761dSV1/HxtPZXuhK8VAtkijFcpt/N23WXFi318muJFMU6R9Kh5SXgH7C2FYFjv+NwQo
         YCwAEamwMZ7YzgKPOTEh82/s3Z79Iv7nC88lcO/fvIscCogCyNZrtZLuHzRgq7V6GLp7
         +DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212702; x=1741817502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/1aCcJfYhN0AAaU2BnnqgXGhts2Tm+OcbYRifJZp3E=;
        b=Ud1a1B890aByK8gDpNy+zg3IMszV2/3E2beo3eNoDkrj0i7IXQORJ6EtFOkTJoDbig
         I4IjsdrMcPNA3GG3o3+aSVoi71UpchVvAdMom8fCDbmsLosm3DLuKEWfiK5emiaesfpo
         9otGMvOSXqAY6ciplpeD9ZWj52nGwV2+AlwTtUGEeEvqJWXPIUr9gt+XI0i+SO/w7TIQ
         cxp4rmmJKGPQz0Tc5CsnTLmEkgH9ZlLxA3se9YxfukR2phy9+zSM41+oVmiEqQ7d+sEX
         gWI7e2Gw4orCzVbBLFZN72e9EDXC9kY2J9u7xX4HbJEiIQWPvzsuAIMrIcBb5KABVY/p
         zcow==
X-Gm-Message-State: AOJu0Yzb2qAbi7wRuDIensOACgofzxqvraZa20fPh6IxQap7aYUdd+5M
	+RjDqMDj/3rhb8av5jic/27oVgj3JMMySjSepA6PE3IUX/KyUvwi7vSzxb3Bkd5IXz2Uk+9MOOA
	h
X-Gm-Gg: ASbGncv0Cg/zu+4NFZAXhNDmmp92CoAkWpzO4p36Li9Ykjm8TA7s/dQeeVfqJUmxOM6
	Mry87bJOSUQD75tYt77wJ7B35t8Ykh2PDicb9j8o8Co0EP6UMHKQ8/x6Mr1pnFNJyYfkZJ/Dy6u
	TYL1N+ifjdjH1Za6abWYyPTNsdjnzYMGNlfb3ON5K4BOI+WWHLItipTLXVMelfpbEgsH+/Lze/V
	dVgpOrt43OMTgt8YDabcZ6+/0zjHMKYSLAg7rsV0DUuaR3pqOnUJG4BnrD6+Sv8H6JOVoRPsGiD
	cACnJfnPFJJwovt9Gc5aklIB7+vEgZhnza0=
X-Google-Smtp-Source: AGHT+IF1iKaC1JL/zLC6XPNWWecNL0vdrhshGt7EddrETqxTFXLQ2nN4qdjb+TRLanP0YG6a3F+gWw==
X-Received: by 2002:a17:902:db07:b0:224:584:6f05 with SMTP id d9443c01a7336-22405847225mr26937035ad.41.1741212702434;
        Wed, 05 Mar 2025 14:11:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/16] xwayland: Fix CVE-2025-26601
Date: Wed,  5 Mar 2025 14:11:10 -0800
Message-ID: <165032003e3f7fb5fde7322c5ad64c26f286228a.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212361

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f &
https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


