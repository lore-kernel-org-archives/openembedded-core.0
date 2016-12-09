Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DFDFB6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 08:40:27 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id h30so45361435iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2016 00:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IINLhwO9fnED79spmiNZh4tFqrZR9WS5kgNtTLyiu5Y=;
	b=S1//TllNsVCTBvtIUgvJbTOJMfwroe0FVX7wjw+FmeaumZ28Pb7zVVKoTZXEQ5U5hN
	kQOq+wT4wUZrwpJnNNBj/dhugnUX2tOY8XhBli/QbIkLYOFyVVvFuGWEXUBHu2kxLah3
	Z5fZuo8ITro/p4nNSjqCiJZV1HKgpjFoux2LnMPfxpq1Fb64e9P5Uol54fT0OzDiY3rA
	+8nA6GGc8u8tlVoHuZfvyKhh32bkiAKekmFnJp7GHL2Ps+l4pfrmM6Vhgvt5JM2DEzka
	sE9tfZynnglDomiEvNWsR4uTc4gTTiTDB6Qtng2UI3yBjPDXvfbujsp64V3x8LM4eZiF
	p6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IINLhwO9fnED79spmiNZh4tFqrZR9WS5kgNtTLyiu5Y=;
	b=cqW4rQX2TmIWQp85dVTot6iNFCwfp4nWdxeyVQ5sIx5bMSCMdZC5lkL1VMCJQsB6ma
	512m007IbfGSnitYfE1eqUOj20l6cwqgo5OgBAjvUDLaH4zlSrTQbytidhLMUPEBL7B0
	6e9deRRRYBEf+WaT1c523rY7M+M7w0WRpjTDoLAt16PHXIlbeZ9OgsmS5nfBmAcxm1Mq
	m2Bewqd2W8O5MF5v7pihs8nBiSAglXnDf+nps6IHrIBRIp/nPXtzyAec8DwmGBPxL1wn
	BhS1hLBVliGE5LWEs8C4TE0UO3S+dt8E34Cdiq5MZuF1Ds19VhNKZuKOO4HGyA9wJleC
	gzBw==
X-Gm-Message-State: AKaTC02f5d5TIit0awWa+q3qOf7nx/V+kMoXFcdOoDCcGOv5JQmONy1cCXFf9dpUoGRpVK0N
X-Received: by 10.107.17.38 with SMTP id z38mr69727105ioi.48.1481272828725;
	Fri, 09 Dec 2016 00:40:28 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56203.dip0.t-ipconnect.de.
	[87.165.98.3]) by smtp.gmail.com with ESMTPSA id
	i196sm6853053itf.8.2016.12.09.00.40.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Dec 2016 00:40:27 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 09:40:20 +0100
Message-Id: <1481272820-28188-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildstats.py: skip collecting unavailable /proc data
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
X-List-Received-Date: Fri, 09 Dec 2016 08:40:28 -0000

Some virtualized environments like Linux-VServer do not have the
entries under /proc that the new system usage sampling expected,
leading to an exception when trying to open the files.

Now the presence of these files is checked once before enabling the
corresponding data collection. When a file is missing, the
corresponding log file is not written either and pybootchart will not
draw the chart that normally displays the data.

Errors while reading or writing of data samples is intentionally still
a fatal error, because that points towards a bigger problem that
should not be ignored.

Reported-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/buildstats.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 9e5b6be..854c387 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -18,13 +18,18 @@ class SystemStats:
                 ('meminfo', self._reduce_meminfo),
                 ('stat', self._reduce_stat),
         ):
-            # In practice, this class gets instantiated only once in
-            # the bitbake cooker process.  Therefore 'append' mode is
-            # not strictly necessary, but using it makes the class
-            # more robust should two processes ever write
-            # concurrently.
-            destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
-            self.proc_files.append((filename, open(destfile, 'ab'), handler))
+            # The corresponding /proc files might not exist on the host.
+            # For example, /proc/diskstats is not available in virtualized
+            # environments like Linux-VServer. Silently skip collecting
+            # the data.
+            if os.path.exists(os.path.join('/proc', filename)):
+                # In practice, this class gets instantiated only once in
+                # the bitbake cooker process.  Therefore 'append' mode is
+                # not strictly necessary, but using it makes the class
+                # more robust should two processes ever write
+                # concurrently.
+                destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
+                self.proc_files.append((filename, open(destfile, 'ab'), handler))
         self.monitor_disk = open(os.path.join(bsdir, 'monitor_disk.log'), 'ab')
         # Last time that we sampled /proc data resp. recorded disk monitoring data.
         self.last_proc = 0
-- 
2.1.4


