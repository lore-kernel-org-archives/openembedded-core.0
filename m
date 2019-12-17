Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECE57F298
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 12:50:24 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z3so3632935wru.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lknmbuucN9RjXxBDYJdAZRWYFc1f9RSPFLyG+uVkKmY=;
	b=nTG+S8oXR67bBzXGz6ANT8q/FgyEJ5WSm5C9LMQaRKFgy2zzV6Q3/y5fcE7YEIJFCc
	RRHROiQSZDumPcbVwBh484DgHW/7+rFmIwDFd8FRnBTj6O4VBOCH4Qf9Bk2nLvTIpXLb
	4GsgCVaUjBy3LRaCPP4XCJllSQ+eeM7W2VBVCdFMxo7ms73/ppmo9/ZqxkZIaj74NQAs
	TUdRK/eDIKXS7b0bZDe3mWVa2Xg71VCkPR0hZl+B+7g/PsSWQ0Hxe8lsVmiUYaHdHeSZ
	9C7bR4sZS9e1FdTirSzmsEi3o1DI72ytVikB/o3RTVum4AQ9smcIzr561QXjy+qIVR6q
	Fwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lknmbuucN9RjXxBDYJdAZRWYFc1f9RSPFLyG+uVkKmY=;
	b=EBh7tyBEX6/VdYAp5lJtmlpRDBXwN1uSnjzChPURXsIbaELHjY5YuLatq89jijo5vU
	Ol/xwt7ZI9UVf0/8JhTySFRrwbinJP+nqtmQ25GrRdzFiQQnUjI3dS29UqIyZFO7CJUM
	2Au2Qq6FDYjnVHqWDawfS72NVsuSET3hwxx5q/hSMkYFm85vfvIYZcoXQOyU9c+5yca8
	BK3B9rMfJogxl05B0dahiP7Y6XCBuyiHgRPf2GR1yZTrS1gCZhYLGyavzacUGzecpvMb
	5IJjNEV1Y1QfpEnt7RLwaUxMysm7DL3hprnTTDA3mS7UVNLQGEfJ2lNR6KRJb9g35Zez
	/bZw==
X-Gm-Message-State: APjAAAXF9ETnGCPg8oYvc1SdP+TKn2pi/nrs5mUzi0nRGGj6CtEhDR/j
	AV4zGWfZn1K3OQ/3K+1tMSFDc+dIPcY=
X-Google-Smtp-Source: APXvYqwwtvy7pA3CZaUJpfWv9es2AqsUnt1q07FEl9rvDFJkAVTcakkccNNnhN2jGqxdy5VGKBYgzg==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr36332996wrn.133.1576587024523; 
	Tue, 17 Dec 2019 04:50:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m21sm2783149wmi.27.2019.12.17.04.50.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 04:50:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 12:50:20 +0000
Message-Id: <20191217125020.25932-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] chrpath: do less work
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
X-List-Received-Date: Tue, 17 Dec 2019 12:50:24 -0000
Content-Transfer-Encoding: 8bit

Instead of trying to change the RPATH in every file under the binary
directories, check that the file is an ELF first.

This means that we don't attempt to change the RPATH on the entire
Python standard library, for example.

Also return early if the directory to iterate doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/chrpath.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 2870c10d515..67b197ec228 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -2,7 +2,13 @@ CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
 def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = False):
-    import subprocess as sub
+    import subprocess as sub, oe.qa
+
+    with oe.qa.ELFFile(fpath) as elf:
+        try:
+            elf.open()
+        except oe.qa.NotELFFileError:
+            return
 
     p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
     out, err = p.communicate()
@@ -72,6 +78,10 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardli
         out, err = p.communicate()
 
 def process_dir(rootdir, directory, d, break_hardlinks = False):
+    bb.debug(2, "Checking %s for binaries to process" % directory)
+    if not os.path.exists(directory):
+        return
+
     import stat
 
     rootdir = os.path.normpath(rootdir)
@@ -80,10 +90,6 @@ def process_dir(rootdir, directory, d, break_hardlinks = False):
     baseprefix = os.path.normpath(d.expand('${base_prefix}'))
     hostos = d.getVar("HOST_OS")
 
-    #bb.debug("Checking %s for binaries to process" % directory)
-    if not os.path.exists(directory):
-        return
-
     if "linux" in hostos:
         process_file = process_file_linux
     elif "darwin" in hostos:
-- 
2.20.1


