Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49CED71A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:16 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m5so201444041ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=noJPyAgOrT38RvI6Pw9hXa0Z4rAJK1LM2GpIGlOX0qE=;
	b=Nk6a0+SEU8WzokHSq9M5L+MbTgU20pYJoYLM88qwCOWMB86lF4fLgWXH+cXK0MamMb
	8yOPah7RHC6LfU8IoeZ9e44h5zP+wsd7chTCQpR2c9IxTQPsQdyhS8T0zKM4GhOuCwgm
	NVTW/K5DYBPoJXtrGW4/x5JSgRKRUayUKt1MO4h9k1jX6gI1jYUumAiZERYZ7ZZWafra
	MPCPwecVsiHfPPwyI2LYUFjLNTXewdaNMaVRNlG+sYb1Jyj6ua3lJ/GLwcEorUY1NQTp
	1U8wxD76mnuOyLSr4Seig8VlHPHy6Fz694SZE0Oihr0PfcRBZL1zLdoH6VCf8a2WGKCI
	XusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=noJPyAgOrT38RvI6Pw9hXa0Z4rAJK1LM2GpIGlOX0qE=;
	b=GAilbC34FQ51qhduleJoAeQDc8e6zGm07FNGOhLeioZ7WSJljz+O9ndV6+lHVj/VaY
	D8QFdhYDx05pQbNZjmnxZPWpGCaFqHDygBLonKbe1eZ6d3F0zsvDQp20FiFZlpIO42aD
	lzB184dnpmT35Uz6tGMuHiM++yHWeWMk8DasiNZKX3QQnAHRFFqUc9vAM6tqC4aXWQAp
	0M/FPj4Y1q+h2/qInrTgO9BHGjh1Ngj+AdT5qTckTJWUdC+eCCuqWixk1/0PyvBTi/bt
	gsnNI/s4bD2/3Bd31Gl2txm7++X5mSv8aO0z7+89+KDJMiraHLG05Fgm2kX6APxznZ/q
	QmnA==
X-Gm-Message-State: AKaTC03ix9J4nBjKCbmW7ZdfG0ddNPRV+5MWbqCLmL4lwme1r0mZzq/5g2HmzuPG567LpPeM
X-Received: by 10.36.215.197 with SMTP id y188mr27797814itg.71.1480499417961; 
	Wed, 30 Nov 2016 01:50:17 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:17 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:01 +0100
Message-Id: <68f96732bc0ab4a3fc227235d035f6cc6daa78ff.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 01/11] buildstats: add system state sampling
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:17 -0000

/proc/[diskstats|meminfo|stat] get sampled and written to the same
proc_<filename>.log files as during normal bootchat logging. This will
allow rendering the CPU, disk and memory usage charts.

Right now sampling happens once a second, triggered by the heartbeat
event.That produces quite a bit of data for long builds, which will be
addressed in a separate commit by storing the data in a more compact
form.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildstats.bbclass | 24 +++++++++++++++++++++
 meta/lib/buildstats.py          | 47 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/lib/buildstats.py

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 57ecc8f..9c0c37d 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -188,3 +188,27 @@ python run_buildstats () {
 addhandler run_buildstats
 run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
 
+python runqueue_stats () {
+    import buildstats
+    from bb import event, runqueue
+    # We should not record any samples before the first task has started,
+    # because that's the first activity shown in the process chart.
+    # Besides, at that point we are sure that the build variables
+    # are available that we need to find the output directory.
+    # The persistent SystemStats is stored in the datastore and
+    # closed when the build is done.
+    system_stats = d.getVar('_buildstats_system_stats', True)
+    if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStarted, bb.runqueue.runQueueTaskStarted)):
+        system_stats = buildstats.SystemStats(d)
+        d.setVar('_buildstats_system_stats', system_stats)
+    if system_stats:
+        # Ensure that we sample at important events.
+        done = isinstance(e, bb.event.BuildCompleted)
+        system_stats.sample(force=done)
+        if done:
+            system_stats.close()
+            d.delVar('_buildstats_system_stats')
+}
+
+addhandler runqueue_stats
+runqueue_stats[eventmask] = "bb.runqueue.sceneQueueTaskStarted bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted"
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
new file mode 100644
index 0000000..8ce4112
--- /dev/null
+++ b/meta/lib/buildstats.py
@@ -0,0 +1,47 @@
+# Implements system state sampling. Called by buildstats.bbclass.
+# Because it is a real Python module, it can hold persistent state,
+# like open log files and the time of the last sampling.
+
+import time
+
+class SystemStats:
+    def __init__(self, d):
+        bn = d.getVar('BUILDNAME', True)
+        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
+        bb.utils.mkdirhier(bsdir)
+
+        self.proc_files = []
+        for filename in ('diskstats', 'meminfo', 'stat'):
+            # In practice, this class gets instantiated only once in
+            # the bitbake cooker process.  Therefore 'append' mode is
+            # not strictly necessary, but using it makes the class
+            # more robust should two processes ever write
+            # concurrently.
+            self.proc_files.append((filename,
+                                    open(os.path.join(bsdir, 'proc_%s.log' % filename), 'ab')))
+        # Last time that we sampled data.
+        self.last = 0
+        # Minimum number of seconds between recording a sample. This
+        # becames relevant when we get called very often while many
+        # short tasks get started. Sampling during quiet periods
+        # depends on the heartbeat event, which fires less often.
+        self.min_seconds = 1
+
+    def close(self):
+        self.monitor_disk.close()
+        for _, output, _ in self.proc_files:
+            output.close()
+
+    def sample(self, force):
+        now = time.time()
+        if (now - self.last > self.min_seconds) or force:
+            for filename, output in self.proc_files:
+                with open(os.path.join('/proc', filename), 'rb') as input:
+                    data = input.read()
+                    # Unbuffered raw write, less overhead and useful
+                    # in case that we end up with concurrent writes.
+                    os.write(output.fileno(),
+                             ('%.0f\n' % now).encode('ascii') +
+                             data +
+                             b'\n')
+            self.last = now
-- 
2.1.4


