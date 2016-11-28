Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3FB71AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:41 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id a124so235502126ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NlgwRuNRGjbB3eIJhDx3QqEsUg9TlnSBdAK/4ffFBN8=;
	b=cMtOgeoxkDTw+JF/4qnIGbJxXJcEyX1pgkzUJZtKeJKYlusGkfggIqKeuvaccW70bj
	j2xNTuB+IOAhrT0utTr5YsYGR0Ghf+iid2fIBj0lrQF/R5SY1aay7pXGkxBJm72QXQe/
	8dWSKAzXTVNEDWwvq+4mbcYwYxn7qjgQtWoguDrnSuhi/7dTPn+qIqspskXldr7AU1Jl
	nwPgffTJisYweyHbB7UEJs9ITxessCqnq4/IWhaMovyguC0w0JECT5taJddStH6FhWfu
	0pQCP1QtbEB0z5EhhX5NKTpC3CAdaUpEB2XR9oLeN4PPEToY039I5tBWYNiXtPutrq4S
	24MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NlgwRuNRGjbB3eIJhDx3QqEsUg9TlnSBdAK/4ffFBN8=;
	b=HkN/xMruHOOBbhH7NMeosJNiXGITTRhdIOJwtWcc57PbS9m+h2GaP9Sa7DGOXaMaxc
	hEGJKatb4M/IdVWqV10q0tVM+rPgKhO2BgvKKRVWteXcDT4DTtxRUWfZ6aVrKyS6sHbE
	hpckKJPUr1205d5WjbYyyknRXPr9BNwlOK6dtJJMt2WKUHsCUxNV5FQI6wxEwfoKMvQF
	fufSR6gPi4Jp/z1gMh2sCSnx7NZonBh0vQ3in04k9fcUCrOaepxrH9H54W6Lh17QgBVc
	NKC8F+OWXjpFWWw+9aAMsaimkTdVwVtpehpDRIFrgvmBDXKHdpFxyFCXvNtIjerZajwA
	+AgA==
X-Gm-Message-State: AKaTC02EExlbHCGGZ5YaIzXUMuUVCjG1jJLnUUp9a9n5QBMBK0vUvWB/RME5NIJWqLIo1S4V
X-Received: by 10.36.120.131 with SMTP id p125mr18814227itc.15.1480347222313; 
	Mon, 28 Nov 2016 07:33:42 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:41 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:11 +0100
Message-Id: <bf30d8b7f832d691b32a55c2ce9171cfac9d0402.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 10/11] buildstats: reduce amount of data stored for system utilization
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:41 -0000

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
index 2499fb1..3cd333c 100644
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
@@ -30,18 +35,107 @@ class SystemStats:
         # depends on the heartbeat event, which fires less often.
         self.min_seconds = 1
 
+        self.meminfo_regex = re.compile(b'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
+        self.diskstats_regex = re.compile(b'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+        self.diskstats_ltime = None
+        self.diskstats_data = None
+        self.stat_ltimes = None
+
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


