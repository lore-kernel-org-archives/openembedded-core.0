Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C145F71AB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:32 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j65so339557719iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P1XRMikDAtpqBj2T5qWpOu07HVwrF286Bscc4EpMF0M=;
	b=ObmbadzCx5EUkzDiRh4ArN+qZhSOC8pGWYbbzUKv+8uqRyKPPOJ1ZVOa+XyjtQLkLk
	cb+XKeses2pwZQtCgY9WelEXRDL17T54aNjz6EvUq2Dq8WQJWkTI18216nVpBnHE0CNs
	nrjRhFnHLrNRSCHfGzaXtC05Xqs3z5px6ORR7bts6JHiLMhpBMP0acjQCPjB+LtXBeAe
	BaK6yzH3A1kqr2VQujQZwJKEToPlW7LbkY6oSj0wvWyiBFbg5c9Dyc+0U0fwCPxDYlk/
	Dkn12ERv8WCtFM0dhLXQffuFypvELgiwOoDP1lViv7iq/PrJ3LwWSknH/RdioTrMxtia
	VowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P1XRMikDAtpqBj2T5qWpOu07HVwrF286Bscc4EpMF0M=;
	b=E4SmOC89lZpo7cD9FZKR61H/K3TKHHZha0+KIy+QDO1vfo8EfxIalEwBBrTB5yiZK/
	AvxwepU+BzAyb2dnvGL/qAJ4dCkMQFrc6CjA3pdyu3OrM6644xoaccxBWB+owhYu2Sma
	wuEBc4XxbWNFxYLi1w8hCJn1CO7nQxUW2CPwrtN8d4M7sqTkhqVgETxg98GALlA7i4Ea
	p5Rf1/P+2+JERBrQCfuFN6HxIebhlYoLzGZQUVCqGog0UJnlzC3KRedpe7PlZ56Jx9US
	e8WHgwm7gxlwq74fcP+zM6vMvChFI1rLcyGCjag3w9YlRRyhvQu1u+odn2doQ1wO+P+1
	Orzg==
X-Gm-Message-State: AKaTC02CeIs3kX2R/pFAZDLaEpCgZ7Vm3BPUcGbzx6u3hgBzX51TIYDjdXulj8ubRLIIWDgw
X-Received: by 10.36.155.194 with SMTP id o185mr27748294itd.71.1480499433993; 
	Wed, 30 Nov 2016 01:50:33 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:33 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:10 +0100
Message-Id: <2af32381c19ecbb6e822b8dfbbc7c5784f292d0f.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 10/11] buildstats: reduce amount of data stored for system utilization
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:33 -0000

Pre-processing /proc data during the build considerably reduces the
amount of data written to disk: 176KB instead of 4.7MB for a 20
minuted build. Parsing also becomes faster.

The disk monitor log added another 16KB in that example build. The
overall buildstat was 20MB, so the overhead for monitoring system
utilization is small enough that it can be enabled by default.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/buildstats.py | 114 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 10 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 7c8b352..9e5b6be 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -3,6 +3,7 @@
 # like open log files and the time of the last sampling.
 
 import time
+import re
 import bb.event
 
 class SystemStats:
@@ -12,14 +13,18 @@ class SystemStats:
         bb.utils.mkdirhier(bsdir)
 
         self.proc_files = []
-        for filename in ('diskstats', 'meminfo', 'stat'):
+        for filename, handler in (
+                ('diskstats', self._reduce_diskstats),
+                ('meminfo', self._reduce_meminfo),
+                ('stat', self._reduce_stat),
+        ):
             # In practice, this class gets instantiated only once in
             # the bitbake cooker process.  Therefore 'append' mode is
             # not strictly necessary, but using it makes the class
             # more robust should two processes ever write
             # concurrently.
-            self.proc_files.append((filename,
-                                    open(os.path.join(bsdir, 'proc_%s.log' % filename), 'ab')))
+            destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
+            self.proc_files.append((filename, open(destfile, 'ab'), handler))
         self.monitor_disk = open(os.path.join(bsdir, 'monitor_disk.log'), 'ab')
         # Last time that we sampled /proc data resp. recorded disk monitoring data.
         self.last_proc = 0
@@ -30,23 +35,112 @@ class SystemStats:
         # depends on the heartbeat event, which fires less often.
         self.min_seconds = 1
 
+        self.meminfo_regex = re.compile(b'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
+        self.diskstats_regex = re.compile(b'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+        self.diskstats_ltime = None
+        self.diskstats_data = None
+        self.stat_ltimes = None
+
     def close(self):
         self.monitor_disk.close()
         for _, output, _ in self.proc_files:
             output.close()
 
+    def _reduce_meminfo(self, time, data):
+        """
+        Extracts 'MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree'
+        and writes their values into a single line, in that order.
+        """
+        values = {}
+        for line in data.split(b'\n'):
+            m = self.meminfo_regex.match(line)
+            if m:
+                values[m.group(1)] = m.group(2)
+        if len(values) == 6:
+            return (time,
+                    b' '.join([values[x] for x in
+                               (b'MemTotal', b'MemFree', b'Buffers', b'Cached', b'SwapTotal', b'SwapFree')]) + b'\n')
+
+    def _diskstats_is_relevant_line(self, linetokens):
+        if len(linetokens) != 14:
+            return False
+        disk = linetokens[2]
+        return self.diskstats_regex.match(disk)
+
+    def _reduce_diskstats(self, time, data):
+        relevant_tokens = filter(self._diskstats_is_relevant_line, map(lambda x: x.split(), data.split(b'\n')))
+        diskdata = [0] * 3
+        reduced = None
+        for tokens in relevant_tokens:
+            # rsect
+            diskdata[0] += int(tokens[5])
+            # wsect
+            diskdata[1] += int(tokens[9])
+            # use
+            diskdata[2] += int(tokens[12])
+        if self.diskstats_ltime:
+            # We need to compute information about the time interval
+            # since the last sampling and record the result as sample
+            # for that point in the past.
+            interval = time - self.diskstats_ltime
+            if interval > 0:
+                sums = [ a - b for a, b in zip(diskdata, self.diskstats_data) ]
+                readTput = sums[0] / 2.0 * 100.0 / interval
+                writeTput = sums[1] / 2.0 * 100.0 / interval
+                util = float( sums[2] ) / 10 / interval
+                util = max(0.0, min(1.0, util))
+                reduced = (self.diskstats_ltime, (readTput, writeTput, util))
+
+        self.diskstats_ltime = time
+        self.diskstats_data = diskdata
+        return reduced
+
+
+    def _reduce_nop(self, time, data):
+        return (time, data)
+
+    def _reduce_stat(self, time, data):
+        if not data:
+            return None
+        # CPU times {user, nice, system, idle, io_wait, irq, softirq} from first line
+        tokens = data.split(b'\n', 1)[0].split()
+        times = [ int(token) for token in tokens[1:] ]
+        reduced = None
+        if self.stat_ltimes:
+            user = float((times[0] + times[1]) - (self.stat_ltimes[0] + self.stat_ltimes[1]))
+            system = float((times[2] + times[5] + times[6]) - (self.stat_ltimes[2] + self.stat_ltimes[5] + self.stat_ltimes[6]))
+            idle = float(times[3] - self.stat_ltimes[3])
+            iowait = float(times[4] - self.stat_ltimes[4])
+
+            aSum = max(user + system + idle + iowait, 1)
+            reduced = (time, (user/aSum, system/aSum, iowait/aSum))
+
+        self.stat_ltimes = times
+        return reduced
+
     def sample(self, event, force):
         now = time.time()
         if (now - self.last_proc > self.min_seconds) or force:
-            for filename, output in self.proc_files:
+            for filename, output, handler in self.proc_files:
                 with open(os.path.join('/proc', filename), 'rb') as input:
                     data = input.read()
-                    # Unbuffered raw write, less overhead and useful
-                    # in case that we end up with concurrent writes.
-                    os.write(output.fileno(),
-                             ('%.0f\n' % now).encode('ascii') +
-                             data +
-                             b'\n')
+                    if handler:
+                        reduced = handler(now, data)
+                    else:
+                        reduced = (now, data)
+                    if reduced:
+                        if isinstance(reduced[1], bytes):
+                            # Use as it is.
+                            data = reduced[1]
+                        else:
+                            # Convert to a single line.
+                            data = (' '.join([str(x) for x in reduced[1]]) + '\n').encode('ascii')
+                        # Unbuffered raw write, less overhead and useful
+                        # in case that we end up with concurrent writes.
+                        os.write(output.fileno(),
+                                 ('%.0f\n' % reduced[0]).encode('ascii') +
+                                 data +
+                                 b'\n')
             self.last_proc = now
 
         if isinstance(event, bb.event.MonitorDiskEvent) and \
-- 
2.1.4


