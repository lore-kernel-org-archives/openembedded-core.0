Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id C368671E4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:51 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j5-v6so10848708wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YRn3BzjFIhN+w3/8v0BkRavH/RHSNo4H9N+YKJ7qI+E=;
	b=d2Pg++iK5caJhy7h57vbO7/F9JdNNDJhjKVDivROeyv9aVNz50SD3hUyDH27xv2a0W
	+81pxvRaZpt3inIpjAKa0f6ZI2ht+5rltZ8vIGez3YFqk/IBk5scfQx4u73sBHo0SjWn
	P1GyactVW12zST/ENxZKWqAqCESynF+q9cZFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YRn3BzjFIhN+w3/8v0BkRavH/RHSNo4H9N+YKJ7qI+E=;
	b=JkfCrN+IW0IhXH1sw3aYUwdm2NCgSjJblDMrZfqoplz8z66YMsGffkCj/z+gfzPQWP
	wc0N3rDZISaiXvJx8Ha9gcq9odrUFsiLD1GEdHTDNwkDihhd1l8z58Ef/iRnAPKs5K91
	zHG92qEF9wvF06pydbb/oy8zxrEPq9ztIrW11h78pTVK2Lr/l+VyzCk6JOsJgNQ3loIv
	o+2NLEimMKt6I1UFG6GRbuuxEqxn7l1Tcx1A2/I0CujGeFP7d39nrHp7BDRq4pqRpHJ3
	JGleoDcvDs5GB6HfXhGZJ8mL9us44KUfB6yc2loqiVBLjv/xJCmBktdq5yWkkR5FSWx9
	8z2Q==
X-Gm-Message-State: AOUpUlEBd/jvRmwpZtbhwVGY5VGqxG0uV2tIh7DPjmGZ0hgVRYJ5Tc24
	vjzVHZuJ98E8Fh86H8E1H2vtAYsX7wCDxA==
X-Google-Smtp-Source: AAOMgpfF+iSL8Gh0PcGXH21TezH20dBErvK4m6WzFXRDcxMJW90gN6rxz66G7GTwU+CL6yP0Jc4r1w==
X-Received: by 2002:adf:adc9:: with SMTP id
	w67-v6mr1059115wrc.135.1532083192287; 
	Fri, 20 Jul 2018 03:39:52 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:40 +0100
Message-Id: <20180720103948.30044-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/10] package: Rework PACKAGELOCK based upon sstate for do_packagedata
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:52 -0000

I think this lock dates from before we had sstate for do_packagedata.

Since WORKDIR is recipe specific and we write into WORKDIR, we no longer need
any write locks in the do_packagedata code itself, its handled by the sstate
task lock for the final copy in at the end. The final write lock can be simply
removed.

The only time we need read locking is when actually reading data from the
shared directory. We can therefore reduce the window the lock is held
significantly as well, hence improving the speed of packagedata tasks running
in parallel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 07bc37879c6..6f7015d9129 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1411,9 +1411,6 @@ fi
     pkgdest = d.getVar('PKGDEST')
     pkgdatadir = d.getVar('PKGDESTWORK')
 
-    # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
-
     data_file = pkgdatadir + d.expand("/${PN}" )
     f = open(data_file, 'w')
     f.write("PACKAGES: %s\n" % packages)
@@ -1518,7 +1515,6 @@ fi
     if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
-    bb.utils.unlockfile(lf)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
@@ -1629,9 +1625,6 @@ python package_do_shlibs() {
 
     shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
-    # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
-
     def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
@@ -1744,7 +1737,11 @@ python package_do_shlibs() {
     use_ldconfig = bb.utils.contains('DISTRO_FEATURES', 'ldconfig', True, False, d)
 
     needed = {}
+
+    # Take shared lock since we're only reading, not writing
+    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
     shlib_provider = oe.package.read_shlib_providers(d)
+    bb.utils.unlockfile(lf)
 
     for pkg in shlib_pkgs:
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
@@ -1800,8 +1797,6 @@ python package_do_shlibs() {
             d.setVar('pkg_postinst_%s' % pkg, postinst)
         bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
 
-    bb.utils.unlockfile(lf)
-
     assumed_libs = d.getVar('ASSUME_SHLIBS')
     if assumed_libs:
         libdir = d.getVar("libdir")
@@ -1914,9 +1909,6 @@ python package_do_pkgconfig () {
                             if hdr == 'Requires':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
 
-    # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
-
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
         if pkgconfig_provided[pkg] != []:
@@ -1925,6 +1917,9 @@ python package_do_pkgconfig () {
                 f.write('%s\n' % p)
             f.close()
 
+    # Take shared lock since we're only reading, not writing
+    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
+
     # Go from least to most specific since the last one found wins
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
@@ -1940,6 +1935,8 @@ python package_do_pkgconfig () {
                 for l in lines:
                     pkgconfig_provided[pkg].append(l.rstrip())
 
+    bb.utils.unlockfile(lf)
+
     for pkg in packages.split():
         deps = []
         for n in pkgconfig_needed[pkg]:
@@ -1957,8 +1954,6 @@ python package_do_pkgconfig () {
             for dep in deps:
                 fd.write(dep + '\n')
             fd.close()
-
-    bb.utils.unlockfile(lf)
 }
 
 def read_libdep_files(d):
-- 
2.17.1


