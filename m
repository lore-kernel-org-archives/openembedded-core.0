Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A22860030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 18:00:40 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so5354698pab.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+96Kkq7g1J/DPCMddZVWfrSnSzJB00El1BCmC5afj8E=;
	b=WhVfLwGsjvMxRbxSRrzts+rw5yISw4VltgpCags8+tmvPb5JKPKbIS5aTIoRA8BAs3
	hHp6rlCj3Hmh+q+QvvvN9PdulxB28WL3g/fCJqYFD1AA8nXYcsX5dfM3eVpS/fLYyiid
	Y7KBxyYIXzoKxv5g+n47qmyK5l9yTjbGXHTmhwidqdOCOnQ0ZyTpEu2JO4T9UiUQPP82
	oOF8NlbEcre1JHhc/t1mENJSbH2vBLn/j+0TZRbCWloSQZ7yZBXskuDjCIB4ZHbusobs
	MKCcjwzbOfgIWraKFIJsNnce3SQde+euqcpF3EzV535L9qnrN7XpcIlneLNJajgVQlk/
	KM0A==
X-Received: by 10.66.163.71 with SMTP id yg7mr9527345pab.110.1416592841226;
	Fri, 21 Nov 2014 10:00:41 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id ov2sm5380069pdb.91.2014.11.21.10.00.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Nov 2014 10:00:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:05:03 -0800
Message-Id: <1416593103-15033-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] package.bbclass: Create empty key/value if not there for shlib_provider
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
X-List-Received-Date: Fri, 21 Nov 2014 18:00:45 -0000

When we use ASSUME_SHLIBS,e.g.

ASSUME_SHLIBS = "libEGL.so.1:libegl-implementation"

then we end up with errors like below when using shlibs2 (dizzy+)

File: 'package_do_shlibs', lineno: 216, function: package_do_shlibs
     0212:            dep_pkg = dep_pkg.rsplit("_", 1)
     0213:            if len(dep_pkg) == 2:
     0214:                lib_ver = dep_pkg[1]
     0215:            dep_pkg = dep_pkg[0]
 *** 0216:            shlib_provider[l][libdir] = (dep_pkg, lib_ver)
     0217:
     0218:    libsearchpath = [d.getVar('libdir', True),
d.getVar('base_libdir', True)]
     0219:
     0220:    for pkg in packages.split():
Exception: KeyError: 'libEGL.so.1'

This is because the entry which is being populated does not exist
so lets create it if its not already there.

Change-Id: I9e292c5439e5d1e01ea48341334507aacc3784ae
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2aec3e6..696d173 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1554,6 +1554,8 @@ python package_do_shlibs() {
             if len(dep_pkg) == 2:
                 lib_ver = dep_pkg[1]
             dep_pkg = dep_pkg[0]
+            if l not in shlib_provider:
+                shlib_provider[l] = {}
             shlib_provider[l][libdir] = (dep_pkg, lib_ver)
 
     libsearchpath = [d.getVar('libdir', True), d.getVar('base_libdir', True)]
-- 
2.1.1


