Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 08C4D71AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:44 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id a124so235504770ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GWhB4RXq1mkcOE3+dn2RqB9K6j/Is79kfwRHfnyO+RE=;
	b=h79e/wBLFGvXUYUMt9UnRHh0gBLYJL0MbxfA+J+K+Zo6dNm1W9gBTW/b1MCU2mjEHk
	rKJV1PgWyy5F0QV1slMPyEVsMKx+fqObMet/9bpPF+XzS1pSTFJKElxZogP7eHC7e5wV
	46b4/8gQ1PUtAcZ2RWx4Jmb0NnAqHQ8eYxC+pYbzhQ2OcV7ZOnuMpEkJ+U8zEWJhpF1L
	9smRYVdhiP3xMQesmaKFIwx51V3t0BBJDczUNyntd2xWpOgf+BmrX0BeIdS3Hz6ypL+c
	DYBstsRhGkvJELRFDCNRjTuNC5W3TP8klpMPtZQ9yDswq7k5ICqsdtD2o2KXYnq9rHd6
	rR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=GWhB4RXq1mkcOE3+dn2RqB9K6j/Is79kfwRHfnyO+RE=;
	b=NEbalV6OXysKl0FbK44+buFVUz2ctuRr8EPBwOnr4JHsqP0snNmrJK1kDXBtmvz0+K
	s37cCwcQBs699TcMkFP8NbF3OhPrPbVK18xv7XEGQnoJLmplg10D+/MDyYgBu+EEKrs1
	97WwdYdILZoqFsAqIXw/xRZg2Tga5TF8SqPNq/Orj7HnuuKtlIEE0tHciTQE7tdmZ/dw
	Yo7r/TkFJWd+lalXQ4jmb5n9mBI16psdBrQNP/+sUFeTnqhX1hE72ZtXLRZSTWGMwN5D
	Wa/YWfcMerlcsNFrI7T+uMl5umjYACVIA6EB7iPbG/2wwh/qCMaJTZ8lj/B6qYGj9I0M
	oW8g==
X-Gm-Message-State: AKaTC00hUOb0i5PxmpzpGxjZBFKDtYdgiQGZFOa+rIN74TjvXvIYem6Yiiqs5xGzQTihjCgC
X-Received: by 10.36.216.70 with SMTP id b67mr18626440itg.5.1480347225371;
	Mon, 28 Nov 2016 07:33:45 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:44 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:12 +0100
Message-Id: <ad76ac24df385125678c323eb7df085f8baadc9d.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 11/11] pybootchartgui: support reading reduced /proc logs
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:44 -0000

Pre-processing /proc data during the build considerably reduces the
amount of data written to disk: 176KB instead of 4.7MB for a 20
minuted build. Parsing also becomes faster.

buildstats.bbclass only writes the reduced logs now, but support for
the full /proc files is kept around as reference.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 1c8d8ef..bcfb2da 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -442,6 +442,12 @@ def _parse_proc_stat_log(file):
         # skip the rest of statistics lines
     return samples
 
+def _parse_reduced_log(file, sample_class):
+    samples = []
+    for time, lines in _parse_timed_blocks(file):
+        samples.append(sample_class(time, *[float(x) for x in lines[0].split()]))
+    return samples
+
 def _parse_proc_disk_stat_log(file):
     """
     Parse file for disk stats, but only look at the whole device, eg. sda,
@@ -483,6 +489,25 @@ def _parse_proc_disk_stat_log(file):
 
     return disk_stats
 
+def _parse_reduced_proc_meminfo_log(file):
+    """
+    Parse file for global memory statistics with
+    'MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree' values
+    (in that order) directly stored on one line.
+    """
+    used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
+
+    mem_stats = []
+    for time, lines in _parse_timed_blocks(file):
+        sample = MemSample(time)
+        for name, value in zip(used_values, lines[0].split()):
+            sample.add_value(name, int(value))
+
+        if sample.valid():
+            mem_stats.append(DrawMemSample(sample))
+
+    return mem_stats
+
 def _parse_proc_meminfo_log(file):
     """
     Parse file for global memory statistics.
@@ -702,10 +727,16 @@ def _do_parse(writer, state, filename, file):
     name = os.path.basename(filename)
     if name == "proc_diskstats.log":
         state.disk_stats = _parse_proc_disk_stat_log(file)
+    elif name == "reduced_proc_diskstats.log":
+        state.disk_stats = _parse_reduced_log(file, DiskSample)
     elif name == "proc_stat.log":
         state.cpu_stats = _parse_proc_stat_log(file)
+    elif name == "reduced_proc_stat.log":
+        state.cpu_stats = _parse_reduced_log(file, CPUSample)
     elif name == "proc_meminfo.log":
         state.mem_stats = _parse_proc_meminfo_log(file)
+    elif name == "reduced_proc_meminfo.log":
+        state.mem_stats = _parse_reduced_proc_meminfo_log(file)
     elif name == "cmdline2.log":
         state.cmdline = _parse_cmdline_log(writer, file)
     elif name == "monitor_disk.log":
-- 
2.1.4


