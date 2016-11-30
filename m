Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E35471A98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:25 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m5so201449525ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qUCi8T1YDTcRff1lTSrknAQMmA9iz5Xj75aT47l+VNI=;
	b=Pu8J9jFh4FNSgMi2p4AExdoUbRLCtlABQPgiq9Pzcz22yoB7jgE1NfaDlJvBJ7MZN9
	UpcIT8b7XkVePvfos1wkuEhBXPL38MIgbtOgkkcSick7nEklJnBX5SWoIldtGRA8kKUS
	0SXASA7ffjEyU32+dEPaZr0pW/JboWGQfxosn2x5U94fJ0QHAwtwAORl7TGJeq/YXOxJ
	5nI0I696CVZ93pgrarEKyb3k2WyD92HAq+idDImTzVkCOkPbgcUG45d6n+cZwhj5XRTr
	nTQleBFNMHrTDdO7GDeSesHa0dBFPfOgONECO6E55tN3SYdBvvZ0UeTUnOtp/3GESV1Y
	AK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qUCi8T1YDTcRff1lTSrknAQMmA9iz5Xj75aT47l+VNI=;
	b=IwT3HMIV4w2Eagw9whDgq2G7qfbOjIHq1AywbvjztPL5WYm7kJPESPNamfo3ubQ4P+
	UiQpW7Dv66kjNPCUtWkJm3bHQv4n/ukc3e30qDBj/BFiRbmfB8IpZ5XH+s7o3ULvzUHm
	JKXxyGXdjfnYvl80rZkFsr5GdP5n49ynNmyGtle45QQhW6silw1b3EjRuVC+3i4JktYZ
	Ty075qNV48ZFsBOdlik1W7UpVu57txR+bRUfylPwsbGlPyB/cNmfP5draZ0zE+5452n+
	J9wlOkBxhRQIqr4f8HukzdWlJRkpNyIhIJ0jUBJjRmro2cKFuCjscExuaEPsXjVNX8Iu
	ILxw==
X-Gm-Message-State: AKaTC01JLBTTshnqqkfZMueDV2IWrKhQu7TDHNgK0EfbpCG/l08q52VSCMp4/qScUSnHz8Oy
X-Received: by 10.36.101.5 with SMTP id u5mr27771898itb.45.1480499427028;
	Wed, 30 Nov 2016 01:50:27 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:26 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:06 +0100
Message-Id: <96bb83a34741f60727d5d2741731a16b0d4c14a9.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 06/11] buildstats: record disk space usage
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:26 -0000

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
index 9c0c37d..c6b77e6 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -204,11 +204,11 @@ python runqueue_stats () {
     if system_stats:
         # Ensure that we sample at important events.
         done = isinstance(e, bb.event.BuildCompleted)
-        system_stats.sample(force=done)
+        system_stats.sample(e, force=done)
         if done:
             system_stats.close()
             d.delVar('_buildstats_system_stats')
 }
 
 addhandler runqueue_stats
-runqueue_stats[eventmask] = "bb.runqueue.sceneQueueTaskStarted bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted"
+runqueue_stats[eventmask] = "bb.runqueue.sceneQueueTaskStarted bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted bb.event.MonitorDiskEvent"
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 8ce4112..7c8b352 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -3,6 +3,7 @@
 # like open log files and the time of the last sampling.
 
 import time
+import bb.event
 
 class SystemStats:
     def __init__(self, d):
@@ -19,8 +20,10 @@ class SystemStats:
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
@@ -32,9 +35,9 @@ class SystemStats:
         for _, output, _ in self.proc_files:
             output.close()
 
-    def sample(self, force):
+    def sample(self, event, force):
         now = time.time()
-        if (now - self.last > self.min_seconds) or force:
+        if (now - self.last_proc > self.min_seconds) or force:
             for filename, output in self.proc_files:
                 with open(os.path.join('/proc', filename), 'rb') as input:
                     data = input.read()
@@ -44,4 +47,13 @@ class SystemStats:
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
-- 
2.1.4


