Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id CA44C79368
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:46:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t15so15534083wrx.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QwpJz3kZkE9n22K6N4Q7ftHpvk6u5h6TxiDnKWfZCxo=;
	b=g6nYfwpTZNLIjm5x6g6azK5b1nOvhgNRqfBd5C5BjlSE974PIRO2A6M8TytiBIDHm7
	362D4ZETmx3FhKUJPy5dh5ojmBuMUIxydqKlXt3XuDP9kXmcOSckwlMz+GZn6kRzlDqh
	Bt9N6hJ1kDxeJb4NPPwhM6HhfORTZVCF8ryUIB8sgpUZDOJNgTtrmApTbSCWuV5DatPS
	ribSXi0w4RVrn7O0Ut5oPhABfIZj6TlE20PXHO5BYtOGLOnD7VL1iKYcToHRnTr0aG1s
	Nn4dAR3xf+xOVFYwMNNs5dhCgUV/nRATQaa1I51MN36QIiStXTgxx2wC6YxeSBAP2sT4
	oJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QwpJz3kZkE9n22K6N4Q7ftHpvk6u5h6TxiDnKWfZCxo=;
	b=JxDTsyjFDkHc+oTBrPLh9UBVA9BEQknKK+kEY2CPLEin/rEp8fW39fGBIr04EYkOt9
	t1nBFb0WCdtzjq0ME2l5bVk1aB5Ufi7G4KLj+F53USC5set8g7EppzRwgs+wrNj5tQAW
	1LEbLi0nIbzxXJHQjpcY+A4zG+rnFqqPMckHOqztmLyeZiCikOSMOuWF2MjzFbrvMrPW
	kveuRl6ec6glPXJy1t4ZvsvZrFpZg1ln2fTbUeuJVkuCAVDjzZvfyDn4ycJ8r+yUaA1P
	SvmX7DkMFKRhSfMMTX38EMkZ4X+iYzbI4ozKYFHnMPhBj2f/mZ0urwNASZ9033yGtf0u
	x6Xw==
X-Gm-Message-State: ABuFfoieLRls865vECRRyGU/UsN24DAM1XmC6GtNhgcem69O6A0g57Df
	N47aa0uz1s0T2UViNPTFeP/tkd5e6t0=
X-Google-Smtp-Source: ACcGV61QqwFmYhaXtZeyJ50A8RSdxO3NE7qnAh4IdVzLC8hYkm8HHcIdcweqCbimf3FQn6ODkKs/gA==
X-Received: by 2002:adf:ff08:: with SMTP id k8-v6mr1175852wrr.15.1537883181310;
	Tue, 25 Sep 2018 06:46:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j27-v6sm2664020wmc.17.2018.09.25.06.46.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:46:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:46:16 +0100
Message-Id: <20180925134616.9366-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH V2] siteinfo: generalise siteinfo
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
X-List-Received-Date: Tue, 25 Sep 2018 13:46:21 -0000

Add a function siteinfo_data_for_machine to look up the data for any arch/os
pair, not just HOST_ARCH-HOST_OS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/siteinfo.bbclass | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 4698e6e474d..24585d58427 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -15,7 +15,7 @@
 # It is an error for the target not to exist.
 # If 'what' doesn't exist then an empty value is returned
 #
-def siteinfo_data(d):
+def siteinfo_data_for_machine(arch, os, d):
     archinfo = {
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
@@ -131,15 +131,13 @@ def siteinfo_data(d):
         locs = { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo" : targetinfo, "d" : d}
         archinfo, osinfo, targetinfo = bb.utils.better_eval(call, locs)
 
-    hostarch = d.getVar("HOST_ARCH")
-    hostos = d.getVar("HOST_OS")
-    target = "%s-%s" % (hostarch, hostos)
+    target = "%s-%s" % (arch, os)
 
     sitedata = []
-    if hostarch in archinfo:
-        sitedata.extend(archinfo[hostarch].split())
-    if hostos in osinfo:
-        sitedata.extend(osinfo[hostos].split())
+    if arch in archinfo:
+        sitedata.extend(archinfo[arch].split())
+    if os in osinfo:
+        sitedata.extend(osinfo[os].split())
     if target in targetinfo:
         sitedata.extend(targetinfo[target].split())
     sitedata.append(target)
@@ -148,6 +146,9 @@ def siteinfo_data(d):
     bb.debug(1, "SITE files %s" % sitedata);
     return sitedata
 
+def siteinfo_data(d):
+    return siteinfo_data_for_machine(d.getVar("HOST_ARCH"), d.getVar("HOST_OS"), d)
+
 python () {
     sitedata = set(siteinfo_data(d))
     if "endian-little" in sitedata:
-- 
2.11.0


