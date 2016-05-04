Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA3A70016
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 19:28:25 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a17so111723122wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 12:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JVwQ0qLm7L3R9X3lnxwB2ddDbc8j53fNjvymNn7U05Y=;
	b=z3MbcdroHmMoHG1fcjOT+2jggauEKoPQLAErUwd2FXDmLjVyS44rib9DOwJLHCt8j7
	eYxrktbw3LRoiHe0s0uwgWbov41zcGRanxj/TS+XE7h3AkKovlPgRdDvS80x1t25HT8u
	8vKaMd8zMyI6iCvt6j5RJczTxHwLh+lQ/zYLsarwikwB6nQ467jAzQvkycXfCle9Pls+
	RR+qUY4xGpxk+jizL2DeHLcpiSFC46CQiL6Trts5ykG8M/P54eIz8fPJ12R76Ay5inCJ
	sP5O5tlghEQW1H24RWotgpS6qAm5piCp7iAA8Y9AMMzFqlwMUCuv0hzQ+anKzJEXOIPV
	p94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JVwQ0qLm7L3R9X3lnxwB2ddDbc8j53fNjvymNn7U05Y=;
	b=baxmR69P1bRKFV+9INNMRd9I4VCDXJewGr/gYfzq3cD5k+G6iQFhI2xuu2kFML9NnT
	IfPtObefuEqD1tpn8vEbtuzCSt4gigRpXqhiwzFKOStQQnnApwPVex2ekuSLZbRrwcj9
	VdTGrcc9cZr+k90uI1R1OjHzTHEdkGseFqhrt3ki9daAaGbOg3NPhIazLkbPHqXTseZC
	7kxwkZe3wZLZqAZ1ezu9Ok9RhCw4ZBsy/Q2uWlCdva3vu0iDaHA3BL46XJcS6pvjl/WD
	lS0kmeRs+eFXqA3IJoQpG2RrcLhMjEhPFpccxVnrSyyWIy4IBslRZ+tjNABQRpyetafA
	ivHA==
X-Gm-Message-State: AOPr4FUT2/mlZhA6RBFjmnkhNvyOUbPqoeMc/56w9RdfMBr5o/XE5D6UwswBHt8m205BdrDs
X-Received: by 10.194.223.41 with SMTP id qr9mr3278595wjc.61.1462390105473;
	Wed, 04 May 2016 12:28:25 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ck9sm5860245wjc.22.2016.05.04.12.28.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 12:28:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 20:28:22 +0100
Message-Id: <1462390102-32254-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] image_types: fix image/compression dependency collection
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
X-List-Received-Date: Wed, 04 May 2016 19:28:28 -0000

As compressions can be chained (i.e. cpio.bz2.md5sum) we need to walk the fstype
list to collect the dependencies from each step.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image_types.bbclass | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0b9758e..9ca157f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -11,32 +11,29 @@ IMAGE_ROOTFS_ALIGNMENT ?= "1"
 
 def imagetypes_getdepends(d):
     def adddep(depstr, deps):
-        for i in (depstr or "").split():
-            if i not in deps:
-                deps.append(i)
+        for d in (depstr or "").split():
+            # Add task dependency if not already present
+            if ":" not in d:
+                d += ":do_populate_sysroot"
+            deps.add(d)
 
-    deps = []
-    ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
-    for type in fstypes:
-        if type in ["vmdk", "vdi", "qcow2", "hdddirect", "live", "iso", "hddimg"]:
-            type = "ext4"
-        basetype = type
-        for ctype in ctypes:
-            if type.endswith("." + ctype):
-                basetype = type[:-len("." + ctype)]
-                adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
-                break
+
+    deps = set()
+    for typestring in fstypes:
+        types = typestring.split(".")
+        basetype, resttypes = types[0], types[1:]
+
+        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
             adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
-        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
-
-    depstr = ""
-    for dep in deps:
-        depstr += " " + dep + ":do_populate_sysroot"
-    return depstr
+        for ctype in resttypes:
+            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
 
+    # Sort the set so that ordering is consistant
+    bb.warn(str(deps))
+    return " ".join(sorted(deps))
 
 XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
-- 
2.8.0.rc3


