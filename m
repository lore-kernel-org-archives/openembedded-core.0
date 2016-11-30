Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 419F171A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:34 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id c21so321035095ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GWhB4RXq1mkcOE3+dn2RqB9K6j/Is79kfwRHfnyO+RE=;
	b=jz6YQKBqpaMz2VTxW5aPWIKRyjw3ISTTy0k94wK7mfg54B1LJcJZxgh6/Ce0fvIBWT
	bZEuMbudPryaw0u+Uqu7IZjOI4ysrDPb9d4fpBaFBnmfCDqy7wkrHTUikLA09E62ix9Q
	Pbieycll1eQNLfWEi77EdY+bxpPaesBekglEdvQ9MYqpLlVcC6rHH9U8E8DqYk2bOW9H
	vie0+PsL5k9Ov4bnRtMrfFS0yx9UNsucFgjxebhtRwpxpLzTqayIk3JLR/vJN1Y2C0Um
	hkSO/I386Zn0D99YJL5ktWmrQlpHMo1pcK4lD+Cm5y+xjEQD91h4PPxel6z46C+0aLyA
	JYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GWhB4RXq1mkcOE3+dn2RqB9K6j/Is79kfwRHfnyO+RE=;
	b=U4Hawb8F0ulihoYglH6qqdfvxhFwLs9RB59GmAII+fj2U2JLNWDPD6xPh5mE+FZpoF
	z8UEAFhDavLZ1Dvy5vUtuMdX44bNhav4RMSUe3FwmpBE1l6Ss7T06SANCMrTEb8SbxpF
	w8ZVVz6TO+r4yK5Yj4Cm37xTA6cf35lCrIzJs24lTI4rnAkfbzKrOawjZI6jXmWJXVNp
	8/zuunicvT1lNC/mHqgf+xiXfQ/7078PnA/wJxt6hID4hlZDUEKiLrLO01KcrqiKgCob
	rgdlHb57ie3re8xpnOUuS9RJk+k6ObueBu0kVvbiZvNQAN3jiETN7Zsqo2kpyP6/C1k1
	BJ8Q==
X-Gm-Message-State: AKaTC02f6+ahXHbBD8jdFuCnrRJvYvjku1zNmr1qC8MV3k0MkQfQ3YOcDC7feCWMwAxG8ZDB
X-Received: by 10.36.83.15 with SMTP id n15mr27554333itb.79.1480499435655;
	Wed, 30 Nov 2016 01:50:35 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:34 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:11 +0100
Message-Id: <ecd1aa712f8114d055a854f8dc883f72ed8034db.1480499134.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 11/11] pybootchartgui: support reading reduced /proc logs
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:34 -0000

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


