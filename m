Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3232671A8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:15 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id a124so235479470ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UrDr7AMy/+ODoNa91JKuu4lLPVpCUFuDK9wgPMDN5xg=;
	b=arC7iFHxtH228J8Yl6fqOaBJL3jrdDUuVXGw5UlXtFJoFqNahDnji1M9HVLfBlK7++
	bJmfLMFm4uALXczZsmb2FA5b1z9ZPs6P8VK7XKW1y/zgvKreLpjTgHV6n9Z2XuaZiDAX
	cbYFgkUK4JwHqunaAdPWsnjPDIzGa3zSXrnSJKAmiAT4i0R3xOziYrMgB66u4Ea2iP+t
	0q8zIWUg57EsoQETuVGDLMWzL0tS0GTQ5UyY9Rhi+Gp2M8lEIR3Ft7WVimEZ4ayNqS7w
	TKR4io84zfZXB1JJtVclezR6TRANF2ipD/rkcFAK/K5kzibL29FqU777XH1uoppxy111
	Bs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UrDr7AMy/+ODoNa91JKuu4lLPVpCUFuDK9wgPMDN5xg=;
	b=m6rv2XEjKFldcQdZrSdWbCnTxbFcRq0jgmyOaHzEJsB/EQSsMzpeDddpOPvFTULDa0
	/+0YBcVkzyGkhuN+K91xybxKWrStaslSKM1v4mfWhNXm/tFQPArZsUXi6/icrWBB2MD5
	//XNR+jrFBxaVHwLuDIhGijiOnwyhwattrl2kmcU33XGhEjT3y4o+Yi3l0wj8dBPVGhR
	NU9pwkOjc0ggry8gV6x9YuP/YsiG9pt4e2gTD0dmXbi9OmyVESE8zoFUMOmGIaO6i7KJ
	Ns3TcZlKbxMYJoSA7KZpYvC2C/ZhE9aRhgZCxQqA0BhR2qhKR+THoiYqd4LAZLUl/ywH
	ZP7g==
X-Gm-Message-State: AKaTC02ituHf6OBdL1/SHRaW+1ZYcOuq1emb2zDnVDFqeMgY6p6kkpGvU7IvsAbB4IV7f5CH
X-Received: by 10.36.181.83 with SMTP id j19mr18201220iti.13.1480347197044;
	Mon, 28 Nov 2016 07:33:17 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:16 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:02 +0100
Message-Id: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 01/11] buildstats: add system state sampling
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:16 -0000

/proc/[diskstats|meminfo|stat] get sampled and written to the same
proc_<filename>.log files as during normal bootchat logging. This will
allow rendering the CPU, disk and memory usage charts.

Right now sampling happens once a second, triggered by the heartbeat
event.That produces quite a bit of data for long builds, which will be
addressed in a separate commit by storing the data in a more compact
form.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildstats.bbclass | 16 +++++++++++++
 meta/lib/buildstats.py          | 50 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/lib/buildstats.py

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 57ecc8f..2abc1a7 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -188,3 +188,19 @@ python run_buildstats () {
 addhandler run_buildstats
 run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
 
+python runqueue_stats () {
+    import buildstats
+    from bb import event, runqueue
+    # We should not record any samples before the first task has started,
+    # because that's the first activity shown in the process chart.
+    # Besides, at that point we are sure that the build variables
+    # are available that we need to find the output directory.
+    init = isinstance(e, bb.runqueue.runQueueTaskStarted)
+    system_stats = buildstats.get_system_stats(d, init=init)
+    if system_stats:
+        # Ensure that we sample at important events.
+        system_stats.sample(force=isinstance(e, bb.event.BuildCompleted))
+}
+
+addhandler runqueue_stats
+runqueue_stats[eventmask] = "bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted"
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
new file mode 100644
index 0000000..1664c52
--- /dev/null
+++ b/meta/lib/buildstats.py
@@ -0,0 +1,50 @@
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
+
+_system_stats = None
+
+def get_system_stats(d, init):
+    global _system_stats
+    if not _system_stats and init:
+        _system_stats = SystemStats(d)
+    return _system_stats
-- 
2.1.4


