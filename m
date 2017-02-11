Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id AC2CD606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2017 03:35:57 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id j13so64524048iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 19:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sy91vedMZINkLiclTb8md5Tm1r16S4vWU3AsqZHAHKQ=;
	b=SYzvKzqjCrDkmTqRVpajuJpYA3kSxpTU/vMW852yURUeP+nDnWWf2mPZZe/gXxUm/y
	U5gOmcBwy652XNk/hCwkHgFNZOw5rEM9cElm4nhlh7RkUu0KmHDYBkgrsdC0rEoIWdCp
	7fpqxetGdMX+uNyQ7LkBjyDmdXcoFtCFKmbwfhfn89B2HekeBsBZqe1wr1FbdqwA0UUb
	DTU9z2kCSoAXMsb5P3fWGXCch5pL51oGoGBbOOWh1ieNaF8oArH816uI/tPjpeW2/jk0
	qMd4qwqE4fmX+FlDmxSjEY146SoI/q1aQKQvQW+KDztNkfAX90euZooCR1NB0fzqYlpr
	zTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sy91vedMZINkLiclTb8md5Tm1r16S4vWU3AsqZHAHKQ=;
	b=UIfz746DgqFG4okwvCXtUhEigZZvka06R7VwvHfN9ZaQKuO2ejsh9X2mQa5C+AyiF9
	f8avMUrMVHwGYYW5wYwnRbywi34kNbbohjAIWDIa8nX8kLhz1uw7t/cgDRJs4DRR+paw
	DTNYLEKKNYi1JWT3I1zkJnP9EJDwyB07WvtdgQSI+VtwPu68rDetFRg+3HDGw9+LHVU5
	HszugregsHOCk5hZ0ztnNDIckafMRG5khpmLxQmgKGUU2QwrMin7F0sTNwH99Zpw/zAv
	ToMituGAz0goqkfyfKaR9z2TnvRqz5ZmHSOjH5OP7jl925WFe7VOjvxw9A1GXMEhMAIu
	xcVQ==
X-Gm-Message-State: AMke39k+gPEGGifkOQ1OjIudkIum4vKDyJqED9QfvNrb9qT1+Bq3HmlGIGt5j0TQKQHyBw==
X-Received: by 10.107.142.205 with SMTP id q196mr12521664iod.147.1486784157940;
	Fri, 10 Feb 2017 19:35:57 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:a83:3700:5a7:7786:a857:6cb2])
	by smtp.gmail.com with ESMTPSA id
	78sm1173496ity.7.2017.02.10.19.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 19:35:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 21:35:37 -0600
Message-Id: <1486784137-17010-1-git-send-email-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] classes/license: Respect beginline and endline
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
X-List-Received-Date: Sat, 11 Feb 2017 03:36:02 -0000

Recipes have the option of specifying a 'beginline' and 'endline'
options in LIC_FILES_CHKSUM which will cause the license bbclass to
only extract those specific lines from the license file when generating
the license database.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/license.bbclass | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 44467d0..9923aac 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -345,7 +345,7 @@ def copy_license_files(lic_files_paths, destdir):
     import errno
 
     bb.utils.mkdirhier(destdir)
-    for (basename, path) in lic_files_paths:
+    for (basename, path, beginline, endline) in lic_files_paths:
         try:
             src = path
             dst = os.path.join(destdir, basename)
@@ -353,7 +353,7 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.path.islink(src):
                 src = os.path.realpath(src)
-            canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev)
+            canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev) and beginline is None and endline is None
             if canlink:
                 try:
                     os.link(src, dst)
@@ -377,7 +377,15 @@ def copy_license_files(lic_files_paths, destdir):
                     else:
                         raise
             if not canlink:
-                shutil.copyfile(src, dst)
+                begin_idx = int(beginline)-1 if beginline is not None else None
+                end_idx = int(endline) if endline is not None else None
+                if begin_idx is None and end_idx is None:
+                    shutil.copyfile(src, dst)
+                else:
+                    with open(src, 'r') as src_f:
+                        with open(dst, 'w') as dst_f:
+                            dst_f.write(''.join(src_f.readlines()[begin_idx:end_idx]))
+
         except Exception as e:
             bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))
 
@@ -447,7 +455,8 @@ def find_license_files(d):
             # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
 
-            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic)))
+            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic),
+                                    None, None))
 
             # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
             # and should not be allowed, warn the user in this case.
@@ -458,7 +467,7 @@ def find_license_files(d):
             # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
             # of the package rather than the license_source_dirs.
             lic_files_paths.append(("generic_" + license_type,
-                                    os.path.join(srcdir, non_generic_lic)))
+                                    os.path.join(srcdir, non_generic_lic), None, None))
         else:
             # Add explicity avoid of CLOSED license because this isn't generic
             if license_type != 'CLOSED':
@@ -476,7 +485,9 @@ def find_license_files(d):
             bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
         # We want the license filename and path
         chksum = parm['md5'] if 'md5' in parm else parm['sha256']
-        lic_chksums[path] = chksum
+        beginline = parm.get('beginline')
+        endline = parm.get('endline')
+        lic_chksums[path] = (chksum, beginline, endline)
 
     v = FindVisitor()
     try:
@@ -488,16 +499,17 @@ def find_license_files(d):
 
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
-    for path, chksum in lic_chksums.items():
-        lic_chksum_paths[os.path.basename(path)][chksum] = os.path.join(srcdir, path)
+    for path, data in lic_chksums.items():
+        lic_chksum_paths[os.path.basename(path)][data] = (os.path.join(srcdir, path), data[1], data[2])
     for basename, files in lic_chksum_paths.items():
         if len(files) == 1:
-            lic_files_paths.append((basename, list(files.values())[0]))
+            data = list(files.values())[0]
+            lic_files_paths.append(tuple([basename] + list(data)))
         else:
             # If there are multiple different license files with identical
             # basenames we rename them to <file>.0, <file>.1, ...
-            for i, path in enumerate(files.values()):
-                lic_files_paths.append(("%s.%d" % (basename, i), path))
+            for i, data in enumerate(files.values()):
+                lic_files_paths.append(tuple(["%s.%d" % (basename, i)] + list(data)))
 
     return lic_files_paths
 
-- 
2.7.4


