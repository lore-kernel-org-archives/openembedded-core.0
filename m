Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AD67D78493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:58 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id y22-v6so9350553wma.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YM8QMpsDwCDue8WF3sazyUFKcjvF84DriTx3mJMzn3E=;
	b=T9oYC0DN+w/MYNtDooGYhKsdkRjuK6eDUr/fZ4awGazVnD+NZC8nD/5pbAKJIL8LwC
	U7GmZBtxCXGSvMsKTWCsAQ9NYpnM5pKJNyaH5QZSA6d/a695mGY5M7JxoYpMQmB4IAaY
	haZGivTV2iSUS8oID4mpm0ZA9kYXdmq4MjEIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YM8QMpsDwCDue8WF3sazyUFKcjvF84DriTx3mJMzn3E=;
	b=TRUmf2pG8tlgKN3YU9jF/7Az6Kc6IJCmYL3/sNV25sBjwu0JJltp1BT9cSrL+dZzFn
	ySmAFB7Djk5cL0cqsg6HtN4mZyolTR8X+72roWvUwkL1TVyWoYVJYzb4+f/qcI+Ye7j4
	gb6qOaP8qMALaNuZbpzF1EQAHHmxCAlUCv2+A+rxCZzcEbE9Lacg34/MOSqH/IdlX7nE
	0sQ69FVCTBjkynnA2yHOLEQMxdA8bFXQI+ozPljs3TirDxPoNmv2gJMpxO3xnTdQG38b
	F/i8QYSDz2RDH+RqEIKUgClovnt4Vx2uAtNuyy+rhJVXlhQbsUOThhjPWbqLzYBVI0Cc
	+dlw==
X-Gm-Message-State: AOUpUlEGI4A8tlLH21hWARXwmdkmTRn6DRd/HfhZqZ+WryC3PAfsXH8q
	WeZb1t1dUQ1Yc2ma15Y9SaKPdnCA8h0Drg==
X-Google-Smtp-Source: AAOMgpef6wVN0WUfChdmd++tsjcXj3WbWgs1t2SR5nK1Xxr1xvoql/vgssPXkKOUAMRiyAuA2jzV/g==
X-Received: by 2002:a1c:ed07:: with SMTP id
	l7-v6mr1242075wmh.139.1532083199321; 
	Fri, 20 Jul 2018 03:39:59 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:45 +0100
Message-Id: <20180720103948.30044-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/10] package: Allow parallel processing of shlib analysis
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:59 -0000

This function is a bit more invasive to add parallelism to but
allows the shlibs analysis to happen in multiple threads. In order
to return values correctly/safely the data types needed tweaking
to avoid lists and use immutable objects.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 39 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 03fe18de580..74c96b9b725 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1631,25 +1631,28 @@ python package_do_shlibs() {
 
     shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
-    def linux_so(file, needed, sonames, renames, pkgver):
+    def linux_so(file, pkg, pkgver, d):
         needs_ldconfig = False
+        needed = set()
+        sonames = set()
+        renames = []
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
-        rpath = []
+        rpath = tuple()
         for l in lines:
             m = re.match("\s+RPATH\s+([^\s]*)", l)
             if m:
                 rpaths = m.group(1).replace("$ORIGIN", ldir).split(":")
-                rpath = list(map(os.path.normpath, rpaths))
+                rpath = tuple(map(os.path.normpath, rpaths))
         for l in lines:
             m = re.match("\s+NEEDED\s+([^\s]*)", l)
             if m:
                 dep = m.group(1)
-                if dep not in needed[pkg]:
-                    needed[pkg].append((dep, file, rpath))
+                if dep not in needed:
+                    needed.add((dep, file, rpath))
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
@@ -1657,12 +1660,12 @@ python package_do_shlibs() {
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or this_soname not in private_libs:
-                        sonames.append(prov)
+                        sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
-        return needs_ldconfig
+        return (needs_ldconfig, needed, sonames, renames)
 
     def darwin_so(file, needed, sonames, renames, pkgver):
         if not os.path.exists(file):
@@ -1761,9 +1764,10 @@ python package_do_shlibs() {
         if not pkgver:
             pkgver = ver
 
-        needed[pkg] = []
-        sonames = list()
-        renames = list()
+        needed[pkg] = set()
+        sonames = set()
+        renames = []
+        linuxlist = []
         for file in pkgfiles[pkg]:
                 soname = None
                 if cpath.islink(file):
@@ -1773,8 +1777,17 @@ python package_do_shlibs() {
                 elif targetos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file, needed, sonames, renames, pkgver)
-                    needs_ldconfig = needs_ldconfig or ldconfig
+                    linuxlist.append(file)
+
+        if linuxlist:
+            results = oe.utils.multiprocess_launch(linux_so, linuxlist, d, extraargs=(pkg, pkgver, d))
+            for r in results:
+                ldconfig = r[0]
+                needed[pkg] |= r[1]
+                sonames |= r[2]
+                renames.extend(r[3])
+                needs_ldconfig = needs_ldconfig or ldconfig
+
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
             os.rename(old, new)
@@ -1840,7 +1853,7 @@ python package_do_shlibs() {
                 for k in shlib_provider[n[0]].keys():
                     shlib_provider_path.append(k)
                 match = None
-                for p in n[2] + shlib_provider_path + libsearchpath:
+                for p in list(n[2]) + shlib_provider_path + libsearchpath:
                     if p in shlib_provider[n[0]]:
                         match = p
                         break
-- 
2.17.1


