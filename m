Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 148D571AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:31 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id c21so228976735ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1YX7mSy2nOxgBEkxfoXcNObtyFnrEAJ4dQn6tvliVxA=;
	b=eelYa9Yi7aRi23HqoawYNdE7udA+At0TYaznFTnoPEEyhF1mJE9biTlhVgErkAAJrs
	6yBC3hmcgcW6tGA7TcoNt0oiVbKQ2+owWZIzLGdtOmiuVXpBW7R3RIQTskTLdnwVCMLN
	L8LYQqg5kFbobKPlWYCXfvAUOpRN0FxjxoHyK7rpnY7e13IUAsB3Owx9OS+X0DqY51P5
	3PRE7+YOYl4YcvR6KCmeHt/gIamrD1Ar401GnR5QUEFmKkg6JtdjZIfi6D4apsZqxAsi
	gRxlQLHn5usZu91omqUxO5FY+FNB2lGXUKM41FQ4IZUmuf4+LHWP3VXRnqUaP4CFk/Vj
	hlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1YX7mSy2nOxgBEkxfoXcNObtyFnrEAJ4dQn6tvliVxA=;
	b=lQbUeputWijdHrquBDFu+uKANhPwM6S7AsZkQnVeew9KaXy/xSQ1miLaJrtKI/zL3c
	9bNR/66lFPfrYukqlURXuYlbpH0KcHpzZMsFlE6H7gD+eflUsFKO7B1uy2Ns4jkkBU1s
	cDKCJfz8RWGYnhOpb+34h+691KFvd39c2kvcMA4I6GWerdJqj4PfbDu1nAvw/ycAiKV+
	waXLAoAe+Ew/yycGMxvrkSGUiZYFF88CZCClWQfrT04fRKgWTy5yumrRGcDH/xsQLgXm
	eSAt0POhubwyAc+2C+Ktr4SWlU0raVH+Anul1TRwz4ee1ABo6WsAMahBpsZ3LQWuQt/C
	FFgQ==
X-Gm-Message-State: AKaTC03lcwxdpwO0MnXQbsHFkSsyTqfUfzKwanh4edjATxVIBp7maRqjvYBUX7Qu54luyX6Z
X-Received: by 10.36.69.1 with SMTP id y1mr19079156ita.52.1480347211004;
	Mon, 28 Nov 2016 07:33:31 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:30 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:07 +0100
Message-Id: <e9c6970aa53b426346b511a674fe7a3f9fe36458.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 06/11] buildstats: record disk space usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 15:33:32 -0000

Hooks into the new monitordisk.py event and records the used space for
each volume. That is probably the only relevant value when it comes to
visualizing the build and recording more would only increase disk
usage.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildstats.bbclass |  4 ++--
 meta/lib/buildstats.py          | 22 +++++++++++++++++-----
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 2abc1a7..113a246 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -199,8 +199,8 @@ python runqueue_stats () {
     system_stats = buildstats.get_system_stats(d, init=init)
     if system_stats:
         # Ensure that we sample at important events.
-        system_stats.sample(force=isinstance(e, bb.event.BuildCompleted))
+        system_stats.sample(e, force=isinstance(e, bb.event.BuildCompleted))
 }
 
 addhandler runqueue_stats
-runqueue_stats[eventmask] = "bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted"
+runqueue_stats[eventmask] = "bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted bb.event.MonitorDiskEvent"
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 1664c52..2499fb1 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -3,6 +3,7 @@
 # like open log files and the time of the last sampling.
 
 import time
+import bb.event
 
 class SystemStats:
     def __init__(self, d):
@@ -19,17 +20,19 @@ class SystemStats:
             # concurrently.
             self.proc_files.append((filename,
                                     open(os.path.join(bsdir, 'proc_%s.log' % filename), 'ab')))
-        # Last time that we sampled data.
-        self.last = 0
+        self.monitor_disk = open(os.path.join(bsdir, 'monitor_disk.log'), 'ab')
+        # Last time that we sampled /proc data resp. recorded disk monitoring data.
+        self.last_proc = 0
+        self.last_disk_monitor = 0
         # Minimum number of seconds between recording a sample. This
         # becames relevant when we get called very often while many
         # short tasks get started. Sampling during quiet periods
         # depends on the heartbeat event, which fires less often.
         self.min_seconds = 1
 
-    def sample(self, force):
+    def sample(self, event, force):
         now = time.time()
-        if (now - self.last > self.min_seconds) or force:
+        if (now - self.last_proc > self.min_seconds) or force:
             for filename, output in self.proc_files:
                 with open(os.path.join('/proc', filename), 'rb') as input:
                     data = input.read()
@@ -39,7 +42,16 @@ class SystemStats:
                              ('%.0f\n' % now).encode('ascii') +
                              data +
                              b'\n')
-            self.last = now
+            self.last_proc = now
+
+        if isinstance(event, bb.event.MonitorDiskEvent) and \
+           ((now - self.last_disk_monitor > self.min_seconds) or force):
+            os.write(self.monitor_disk.fileno(),
+                     ('%.0f\n' % now).encode('ascii') +
+                     ''.join(['%s: %d\n' % (dev, sample.total_bytes - sample.free_bytes)
+                              for dev, sample in event.disk_usage.items()]).encode('ascii') +
+                     b'\n')
+            self.last_disk_monitor = now
 
 _system_stats = None
 
-- 
2.1.4


