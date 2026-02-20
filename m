Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872B6C55ABA
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 11:47:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36632.1771588016356819330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 03:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FS44R3OF;
 spf=pass (domain: linaro.org, ip: 209.85.216.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3562258142fso1080048a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 03:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771588016; x=1772192816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2c6lJRPYXlsz25EhxK4ysfLFtXkDCAhW3xMPQhjtEiM=;
        b=FS44R3OFExaGQgEM/eMJuPff6TGwckQ72bt7ndToqp1zSNqBaCPz7rdLENVxdpWSfq
         IuxQgTVZjrG4uunSZ+Ri57Br4IT0AxWMlXX7ngjLj6OLbV3+1EOimabsfR9sijtg5g+d
         tyX966VFbG7rvPdsvBIRAbwgmETniKd1ua3933B+4n2zU8XFxr6DWKhHGzx71SNxyx4W
         hNZEixFmgLA5W2k3n9VhlkwXJzv+jFk6Oc8J43tvvhPtG0rNAvb9sZtddesUjYHcKnWR
         R9UDCg5CnFPK9JEvxlK1VdvdcoVCk1PVv3fP/+fSX6U3Wj6dIqGF9B+FLyNnWtuAO5Za
         5kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771588016; x=1772192816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c6lJRPYXlsz25EhxK4ysfLFtXkDCAhW3xMPQhjtEiM=;
        b=vBKUXxy5eCkKuvJZ04yU2uyxhiV2f8/h+QHnb+aOKL2s+Dl3NuPt0RYoloPRpTnbeW
         nEt9toSZ5Neiskcy/AFm9t0XyREOFFpO08tLYq4ovZFTCr8sq6mb6J7ZUOL9usn++m9M
         JFSEfsnnXPWNRChXBmagZTrir6UqiWachW1Mo/t3nh1sUIqQJIUo5oS/SZ7OZC+gzaSO
         Fo42qL7GCuMB4k9ZVxSzn+P/8L0Knk30ih7Ox+sBxTugXKY0wSnQ2sVbMTR25DZ5AwMH
         GBfkB2rM8/mI0tdqTI9ZRlQ/XicBVyxUyBR/qcDskzIsounSfSnZZYqnQJsMEfk6e4+K
         pKwQ==
X-Gm-Message-State: AOJu0YyAz2kP56qFu5fD/B/Zs/6vA0RiUgrXi7oVIaBKtV4JYRqmUt/r
	UPs2q/GtL6WwPT1ISXkDfc68j6bGQQxPyWCmi3Gp30jRNjYlpHxny8Bvi8UFZXZN4pDgUjpGQfp
	95pkc+Z0=
X-Gm-Gg: AZuq6aLkg+lyRCnwOGv67v///CFBS9Isibo7y159KoJNR6R6Ol7q1eU+TBIpnh5l8zk
	B8RmzdtOea5hA6MZCGOw8eHI2DDX3lnW6bN20R7rFQ5AEEHUh8t/MBpUAAhGjO1IcTnQg4XaBry
	7mcHqasaaml/2eJwtCDyQnGkP90G2tHkNIgyXmrM3j0e22nrRiSb6qZfMc0pKlj78TMUX1KgDns
	s0LNq+hvUVfOHlsVjtjHYj3HwWIfCiL82mjgp+rw5FV34mF38eNaPu3Tw2ZpmmJ/TQRrCI/TsCR
	yd2N+77/mvrVmsdfCpf5qzmTUw5Nf6LgiVbnCXlzWPZk0JbpjG/VVvb0U4C18p0VYR2LfLzjeKD
	4mwNf+snxfsaKWibv8a7sMIeHfl7eT2CyldakwwewnEH3X1DBWSVRqQtHK1cL4n6k/qanS86EZP
	6xwcBXtcwflH7obDGwIoBSJYQfgzT27nQ306uIco7ddHudh3Mzr5L8RWvgebLVYxaNAAXL2wor
X-Received: by 2002:a17:90b:5644:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-3584481e55bmr15798099a91.1.1771588015369;
        Fri, 20 Feb 2026 03:46:55 -0800 (PST)
Received: from nuoska.taservs.net (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b1f84fsm1045308a91.2.2026.02.20.03.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 03:46:54 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] systemd 258.1: fix udev rootfs by-partuuid link generation
Date: Fri, 20 Feb 2026 13:46:37 +0200
Message-ID: <20260220114637.3772842-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 11:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231512

systemd update from 257 to 258 broke genericarm64 machine boot
on Renesas SMARC EVK board. The firmware and kernel drivers
trigger a lot of udev events and the changed event priority handling
meant that rootfs by-partuuid link was not generated inside
initramfs even when all needed kernel drivers were loaded
and correct block devices were detected.

Backported patches from main branch fix the issue. The patches
have been queued to upstream v258 and v259 stable branches.

For details see:
https://github.com/systemd/systemd/issues/40654

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../systemd/0001-udev-move-functions.patch    | 186 ++++++++++++
 ...-not-build-full-list-of-dependencies.patch | 286 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_258.1.bb    |   2 +
 3 files changed, 474 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch

v2: move patch status to commit message since patchtest prefers that

v1: https://lists.openembedded.org/g/openembedded-core/message/231506

diff --git a/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch b/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
new file mode 100644
index 000000000000..e8dfec9c554d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
@@ -0,0 +1,186 @@
+From 6d558b28c7c42ccaea4c562f10f8c221e5920bab Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 21 Jan 2026 12:32:50 +0900
+Subject: [PATCH 1/2] udev: move functions
+
+Nothing changed except for the functions are moved.
+Preparation for the next commit, where worker_detach_event() will be
+used in on_worker_exit().
+
+Upstream-Status: Backport
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ src/udev/udev-manager.c | 150 ++++++++++++++++++++--------------------
+ 1 file changed, 75 insertions(+), 75 deletions(-)
+
+diff --git a/src/udev/udev-manager.c b/src/udev/udev-manager.c
+index be25c53702c9..fa0a5f11cdea 100644
+--- a/src/udev/udev-manager.c
++++ b/src/udev/udev-manager.c
+@@ -390,6 +390,81 @@ void manager_revert(Manager *manager) {
+         manager_kill_workers(manager, SIGTERM);
+ }
+ 
++static int on_worker_timeout_kill(sd_event_source *s, uint64_t usec, void *userdata) {
++        Worker *worker = ASSERT_PTR(userdata);
++        Manager *manager = ASSERT_PTR(worker->manager);
++        Event *event = ASSERT_PTR(worker->event);
++
++        (void) pidref_kill_and_sigcont(&worker->pidref, manager->config.timeout_signal);
++        worker->state = WORKER_KILLED;
++
++        log_device_error(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" killed.", worker->pidref.pid, event->seqnum);
++        return 0;
++}
++
++static int on_worker_timeout_warning(sd_event_source *s, uint64_t usec, void *userdata) {
++        Worker *worker = ASSERT_PTR(userdata);
++        Event *event = ASSERT_PTR(worker->event);
++
++        log_device_warning(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" is taking a long time.", worker->pidref.pid, event->seqnum);
++        return 0;
++}
++
++static void worker_attach_event(Worker *worker, Event *event) {
++        Manager *manager = ASSERT_PTR(ASSERT_PTR(worker)->manager);
++
++        assert(event);
++        assert(event->state == EVENT_QUEUED);
++        assert(!event->worker);
++        assert(IN_SET(worker->state, WORKER_UNDEF, WORKER_IDLE));
++        assert(!worker->event);
++
++        worker->state = WORKER_RUNNING;
++        worker->event = event;
++        event->state = EVENT_RUNNING;
++        event->worker = worker;
++
++        (void) event_reset_time_relative(
++                        manager->event,
++                        &worker->timeout_warning_event_source,
++                        CLOCK_MONOTONIC,
++                        udev_warn_timeout(manager->config.timeout_usec),
++                        USEC_PER_SEC,
++                        on_worker_timeout_warning,
++                        worker,
++                        EVENT_PRIORITY_WORKER_TIMER,
++                        "worker-timeout-warn",
++                        /* force_reset= */ true);
++
++        (void) event_reset_time_relative(
++                        manager->event,
++                        &worker->timeout_kill_event_source,
++                        CLOCK_MONOTONIC,
++                        manager_kill_worker_timeout(manager),
++                        USEC_PER_SEC,
++                        on_worker_timeout_kill,
++                        worker,
++                        EVENT_PRIORITY_WORKER_TIMER,
++                        "worker-timeout-kill",
++                        /* force_reset= */ true);
++}
++
++static Event* worker_detach_event(Worker *worker) {
++        assert(worker);
++
++        Event *event = TAKE_PTR(worker->event);
++        if (event)
++                assert_se(TAKE_PTR(event->worker) == worker);
++
++        if (worker->state != WORKER_KILLED)
++                worker->state = WORKER_IDLE;
++
++        (void) event_source_disable(worker->timeout_warning_event_source);
++        (void) event_source_disable(worker->timeout_kill_event_source);
++
++        return event;
++}
++
+ static int on_sigchld(sd_event_source *s, const siginfo_t *si, void *userdata) {
+         _cleanup_(worker_freep) Worker *worker = ASSERT_PTR(userdata);
+         sd_device *dev = worker->event ? ASSERT_PTR(worker->event->dev) : NULL;
+@@ -470,81 +545,6 @@ static int worker_new(Worker **ret, Manager *manager, sd_device_monitor *worker_
+         return 0;
+ }
+ 
+-static int on_worker_timeout_kill(sd_event_source *s, uint64_t usec, void *userdata) {
+-        Worker *worker = ASSERT_PTR(userdata);
+-        Manager *manager = ASSERT_PTR(worker->manager);
+-        Event *event = ASSERT_PTR(worker->event);
+-
+-        (void) pidref_kill_and_sigcont(&worker->pidref, manager->config.timeout_signal);
+-        worker->state = WORKER_KILLED;
+-
+-        log_device_error(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" killed.", worker->pidref.pid, event->seqnum);
+-        return 0;
+-}
+-
+-static int on_worker_timeout_warning(sd_event_source *s, uint64_t usec, void *userdata) {
+-        Worker *worker = ASSERT_PTR(userdata);
+-        Event *event = ASSERT_PTR(worker->event);
+-
+-        log_device_warning(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" is taking a long time.", worker->pidref.pid, event->seqnum);
+-        return 0;
+-}
+-
+-static void worker_attach_event(Worker *worker, Event *event) {
+-        Manager *manager = ASSERT_PTR(ASSERT_PTR(worker)->manager);
+-
+-        assert(event);
+-        assert(event->state == EVENT_QUEUED);
+-        assert(!event->worker);
+-        assert(IN_SET(worker->state, WORKER_UNDEF, WORKER_IDLE));
+-        assert(!worker->event);
+-
+-        worker->state = WORKER_RUNNING;
+-        worker->event = event;
+-        event->state = EVENT_RUNNING;
+-        event->worker = worker;
+-
+-        (void) event_reset_time_relative(
+-                        manager->event,
+-                        &worker->timeout_warning_event_source,
+-                        CLOCK_MONOTONIC,
+-                        udev_warn_timeout(manager->config.timeout_usec),
+-                        USEC_PER_SEC,
+-                        on_worker_timeout_warning,
+-                        worker,
+-                        EVENT_PRIORITY_WORKER_TIMER,
+-                        "worker-timeout-warn",
+-                        /* force_reset = */ true);
+-
+-        (void) event_reset_time_relative(
+-                        manager->event,
+-                        &worker->timeout_kill_event_source,
+-                        CLOCK_MONOTONIC,
+-                        manager_kill_worker_timeout(manager),
+-                        USEC_PER_SEC,
+-                        on_worker_timeout_kill,
+-                        worker,
+-                        EVENT_PRIORITY_WORKER_TIMER,
+-                        "worker-timeout-kill",
+-                        /* force_reset = */ true);
+-}
+-
+-static Event* worker_detach_event(Worker *worker) {
+-        assert(worker);
+-
+-        Event *event = TAKE_PTR(worker->event);
+-        if (event)
+-                assert_se(TAKE_PTR(event->worker) == worker);
+-
+-        if (worker->state != WORKER_KILLED)
+-                worker->state = WORKER_IDLE;
+-
+-        (void) event_source_disable(worker->timeout_warning_event_source);
+-        (void) event_source_disable(worker->timeout_kill_event_source);
+-
+-        return event;
+-}
+-
+ static int worker_spawn(Manager *manager, Event *event) {
+         int r;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch b/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch
new file mode 100644
index 000000000000..733ba25eb3a0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch
@@ -0,0 +1,286 @@
+From 4fa4b289f6002a02aae0f4e4358a27204c39c3b2 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sat, 17 Jan 2026 04:14:05 +0900
+Subject: [PATCH 2/2] udev: do not build full list of dependencies
+
+Suppose the following dependent events are queued:
+
+A(1000) -> C(1002)
+                   \
+                     --> E(1004)
+                   /
+B(1001) -> D(1003)
+
+Here, each number is the seqnum of the event, and A -> B means that
+event B depends on event A, that is, event B cannot be started until
+event A is processed.
+
+In this case, to know if event E can be started, we only need to check
+if event C and D are processed, and not necessary to check the state of
+event A or B.
+
+However, the commit e1ae931064be9483aa98249294f6e195537f43d1 introduced
+full dependency list (in the above example, all A, B, C, D are listed as
+the blocker for E), but it is overkill and most information is not necessary.
+Also, before the commit e1ae931064be9483aa98249294f6e195537f43d1, we
+found blocker from the beginning of the queued events, but that's also
+not necessary, as even A is processed, still C may be queued, and we
+anyway need to check if C is processed or not.
+
+This makes each event only stores the last blocker event for the event,
+and finds the blocker from the end of the queue. With this change, the
+memory cost can be reduced from O(n^2) to O(n). Also, as previously we
+used Set for managing blockers, but now we only increment/decrement
+the reference counter of events, so the speed should be also improved.
+
+Fixes #39583 and #39817.
+
+Upstream-Status: Backport
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ src/udev/udev-manager.c | 107 +++++++++++++++++++++-------------------
+ 1 file changed, 55 insertions(+), 52 deletions(-)
+
+diff --git a/src/udev/udev-manager.c b/src/udev/udev-manager.c
+index fa0a5f11cdea..6f75756e0757 100644
+--- a/src/udev/udev-manager.c
++++ b/src/udev/udev-manager.c
+@@ -53,9 +53,14 @@ typedef enum EventState {
+         EVENT_QUEUED,
+         EVENT_RUNNING,
+         EVENT_LOCKED,
++        EVENT_PROCESSED,
+ } EventState;
+ 
+ typedef struct Event {
++        /* All events that have not been processed (state != EVENT_PROCESSED) are referenced by the Manager.
++         * Additionally, an event may be referenced by events blocked by this event. See event_find_blocker(). */
++        unsigned n_ref;
++
+         Manager *manager;
+         Worker *worker;
+         EventState state;
+@@ -76,9 +81,8 @@ typedef struct Event {
+         char *whole_disk;
+         LIST_FIELDS(Event, same_disk);
+ 
+-        bool dependencies_built;
+-        Set *blocker_events;
+-        Set *blocking_events;
++        /* The last blocker for this event. This event must not be processed before the blocker is processed. */
++        Event *blocker;
+ 
+         LIST_FIELDS(Event, event);
+ } Event;
+@@ -101,21 +105,6 @@ typedef struct Worker {
+         Event *event;
+ } Worker;
+ 
+-static void event_clear_dependencies(Event *event) {
+-        assert(event);
+-
+-        Event *e;
+-        while ((e = set_steal_first(event->blocker_events)))
+-                assert_se(set_remove(e->blocking_events, event) == event);
+-        event->blocker_events = set_free(event->blocker_events);
+-
+-        while ((e = set_steal_first(event->blocking_events)))
+-                assert_se(set_remove(e->blocker_events, event) == event);
+-        event->blocking_events = set_free(event->blocking_events);
+-
+-        event->dependencies_built = false;
+-}
+-
+ static void event_unset_whole_disk(Event *event) {
+         Manager *manager = ASSERT_PTR(ASSERT_PTR(event)->manager);
+ 
+@@ -140,6 +129,10 @@ static void event_unset_whole_disk(Event *event) {
+         event->whole_disk = mfree(event->whole_disk);
+ }
+ 
++static Event* event_free(Event *event);
++DEFINE_PRIVATE_TRIVIAL_REF_UNREF_FUNC(Event, event, event_free);
++DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_unref);
++
+ static Event* event_free(Event *event) {
+         if (!event)
+                 return NULL;
+@@ -156,14 +149,25 @@ static Event* event_free(Event *event) {
+         if (event->worker)
+                 event->worker->event = NULL;
+ 
+-        event_clear_dependencies(event);
++        event_unref(event->blocker);
+ 
+         sd_device_unref(event->dev);
+ 
+         return mfree(event);
+ }
+ 
+-DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_free);
++static Event* event_enter_processed(Event *event) {
++        if (!event)
++                return NULL;
++
++        if (event->state == EVENT_PROCESSED)
++                return NULL;
++
++        event->state = EVENT_PROCESSED;
++        return event_unref(event);
++}
++
++DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_enter_processed);
+ 
+ static Worker* worker_free(Worker *worker) {
+         if (!worker)
+@@ -176,7 +180,6 @@ static Worker* worker_free(Worker *worker) {
+         sd_event_source_unref(worker->timeout_warning_event_source);
+         sd_event_source_unref(worker->timeout_kill_event_source);
+         pidref_done(&worker->pidref);
+-        event_free(worker->event);
+ 
+         return mfree(worker);
+ }
+@@ -200,8 +203,8 @@ Manager* manager_free(Manager *manager) {
+         udev_rules_free(manager->rules);
+ 
+         hashmap_free(manager->workers);
+-        while (manager->events)
+-                event_free(manager->events);
++        LIST_FOREACH(event, event, manager->events)
++                event_enter_processed(event);
+ 
+         prioq_free(manager->locked_events_by_time);
+         hashmap_free(manager->locked_events_by_disk);
+@@ -467,7 +470,8 @@ static Event* worker_detach_event(Worker *worker) {
+ 
+ static int on_sigchld(sd_event_source *s, const siginfo_t *si, void *userdata) {
+         _cleanup_(worker_freep) Worker *worker = ASSERT_PTR(userdata);
+-        sd_device *dev = worker->event ? ASSERT_PTR(worker->event->dev) : NULL;
++        _cleanup_(event_enter_processedp) Event *event = worker_detach_event(worker);
++        sd_device *dev = event ? ASSERT_PTR(event->dev) : NULL;
+ 
+         assert(si);
+ 
+@@ -647,17 +651,21 @@ bool devpath_conflict(const char *a, const char *b) {
+         return *a == '/' || *b == '/' || *a == *b;
+ }
+ 
+-static int event_build_dependencies(Event *event) {
+-        int r;
+-
++static void event_find_blocker(Event *event) {
+         assert(event);
+ 
+         /* lookup event for identical, parent, child device */
+ 
+-        if (event->dependencies_built)
+-                return 0;
++        if (event->blocker && event->blocker->state != EVENT_PROCESSED)
++                /* Previously found blocker is not processed yet. */
++                return;
++
++        /* If we have not found blocker yet, or the previously found blocker has been processed, let's find
++         * (another) blocker for this event. */
++        LIST_FOREACH_BACKWARDS(event, e, (event->blocker ?: event)->event_prev) {
++                if (e->state == EVENT_PROCESSED)
++                        continue;
+ 
+-        LIST_FOREACH_BACKWARDS(event, e, event->event_prev) {
+                 if (!streq_ptr(event->id, e->id) &&
+                     !devpath_conflict(event->devpath, e->devpath) &&
+                     !devpath_conflict(event->devpath, e->devpath_old) &&
+@@ -665,22 +673,16 @@ static int event_build_dependencies(Event *event) {
+                     !(event->devnode && streq_ptr(event->devnode, e->devnode)))
+                         continue;
+ 
+-                r = set_ensure_put(&event->blocker_events, NULL, e);
+-                if (r < 0)
+-                        return r;
+-
+-                r = set_ensure_put(&e->blocking_events, NULL, event);
+-                if (r < 0) {
+-                        assert_se(set_remove(event->blocker_events, e) == e);
+-                        return r;
+-                }
+-
+                 log_device_debug(event->dev, "SEQNUM=%" PRIu64 " blocked by SEQNUM=%" PRIu64,
+                                  event->seqnum, e->seqnum);
++
++                unref_and_replace_full(event->blocker, e, event_ref, event_unref);
++                return;
+         }
+ 
+-        event->dependencies_built = true;
+-        return 0;
++        /* No new blocker is found, and if set, previously found blocker has been processed. Clear the
++         * previous blocker if set. */
++        event->blocker = event_unref(event->blocker);
+ }
+ 
+ static bool manager_can_process_event(Manager *manager) {
+@@ -737,14 +739,10 @@ static int event_queue_start(Manager *manager) {
+                 if (event->state != EVENT_QUEUED)
+                         continue;
+ 
+-                r = event_build_dependencies(event);
+-                if (r < 0)
+-                        log_device_warning_errno(event->dev, r,
+-                                                 "Failed to check dependencies for event (SEQNUM=%"PRIu64", ACTION=%s), ignoring: %m",
+-                                                 event->seqnum, strna(device_action_to_string(event->action)));
++                event_find_blocker(event);
+ 
+                 /* do not start event if parent or child event is still running or queued */
+-                if (!set_isempty(event->blocker_events))
++                if (event->blocker)
+                         continue;
+ 
+                 r = event_run(event);
+@@ -920,11 +918,12 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
+         if (r < 0 && r != -ENOENT)
+                 return r;
+ 
+-        _cleanup_(event_freep) Event *event = new(Event, 1);
++        _cleanup_(event_unrefp) Event *event = new(Event, 1);
+         if (!event)
+                 return -ENOMEM;
+ 
+         *event = (Event) {
++                .n_ref = 1,
+                 .dev = sd_device_ref(dev),
+                 .seqnum = seqnum,
+                 .action = action,
+@@ -936,6 +935,9 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
+                 .locked_event_prioq_index = PRIOQ_IDX_NULL,
+         };
+ 
++        /* The kernel sometimes sends events in a wrong order, and we may receive an event with smaller
++         * SEQNUM after one with larger SEQNUM. To workaround the issue, let's reorder events if necessary. */
++
+         Event *prev = NULL;
+         LIST_FOREACH_BACKWARDS(event, e, manager->last_event) {
+                 if (e->seqnum < event->seqnum) {
+@@ -947,8 +949,9 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
+                                                         "The event (SEQNUM=%"PRIu64") has been already queued.",
+                                                         event->seqnum);
+ 
+-                /* Inserting an event in an earlier place may change dependency tree. Let's rebuild it later. */
+-                event_clear_dependencies(e);
++                /* The inserted event may be a blocker of an already queued event, hence the already found
++                 * blocker may not be the last one. Let's find the last blocker again later. */
++                e->blocker = event_unref(e->blocker);
+         }
+ 
+         LIST_INSERT_AFTER(event, manager->events, prev, event);
+@@ -1207,7 +1210,7 @@ static int on_worker_notify(sd_event_source *s, int fd, uint32_t revents, void *
+                 return 0;
+         }
+ 
+-        _cleanup_(event_freep) Event *event = worker_detach_event(worker);
++        _cleanup_(event_enter_processedp) Event *event = worker_detach_event(worker);
+ 
+         if (strv_contains(l, "TRY_AGAIN=1")) {
+                 /* Worker cannot lock the device. */
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index fdf4dc5bdc65..729450b60469 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -33,6 +33,8 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0001-udev-move-functions.patch \
+           file://0002-udev-do-not-build-full-list-of-dependencies.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


