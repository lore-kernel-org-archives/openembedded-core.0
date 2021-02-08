Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web09.35221.1612792420632932594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LMfchckD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id s107so14184698otb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3HqoJXq+fwliolM1grYMbLpN9FX0DloA9wmNGIP4Tao=;
        b=LMfchckDAKthADcbhat7klBQcpPWXBgUY04n7IGMS+njhR0VneZOSu/LRSH43hxikQ
         aJvH0eWqzEYtq2BEUXOn1t8c9t+ktDh6NS6UH0f4I/i5/qZ0gV0/IUxMh3B5X5eytTGb
         Uzp5qPI4OxQbXCxZSKsMUVVfHnsYh8beEM5hXRu5of8xXAxZrvim0fRH+BLmNGYUxuAb
         kxYG/FArxolX3ooJXeU4f4XUwIpJxd2cYgsym45c3K/t3idrhx7Nh+9im0WXugL8Ud0h
         KanNpNnlxdXAC01OxzmqojZR/8u+FaqroR+3ZNY8nrSnoSnwKTzYZ8sMYHOz+xaonfEV
         phBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HqoJXq+fwliolM1grYMbLpN9FX0DloA9wmNGIP4Tao=;
        b=JvAMlYT1wEUv9PdnbWKIeVGxmr0WgY93D+YjGtjkCVHtpNbaoYlmt8GScw/yUAReeW
         M4qy3v/XwXbWWMLMkxRwWXGnF0Donjo2yxsq0r76fKJkwR0awFY+t7BWFq4sa8WOXs0D
         J7/vWHibBS7Im4gGK2BX8ZFVfx3lb08n5v+PfSvoXzVTRyP9TJlOUgr1gP4igydwRZQN
         S3sGm63s6xBW58EIKDTyTCHwhS192YEW1RNemKUIhykRRN+0eDMEPjgIF0wRyPP9B1Ua
         71tl1+xVQDplL0e5czqkD7FN6CAynYew/EvRNGPTuqQL6vgGgs8/Z3P/MQic0Iv76KEo
         0tNw==
X-Gm-Message-State: AOAM530peqmHXBS9byHfA4fzvPtfBjv15lvlZDGl5SRRJV/PXTJU1I9k
	v2/BkYBX3x2QZZDAM5LgFdeSfR2tJH/+tTjw/J0=
X-Google-Smtp-Source: ABdhPJwMkG5zVTprBzlQSsDcc5rKLXK908JWlHrMhS7JJXSp10otjwTM06WWVRSUGy03UDa/phqpBg==
X-Received: by 2002:a9d:6f03:: with SMTP id n3mr11394431otq.295.1612792419336;
        Mon, 08 Feb 2021 05:53:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/28] package.bbclass: hash equivalency and pr service
Date: Mon,  8 Feb 2021 03:52:01 -1000
Message-Id: <0c28edf4bf0d2f92bf3a47406041c63acd90bacf.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Hatle <mark.hatle@kernel.crashing.org>

When the PR service is enabled a number of small changes may happen
to variables.  In the do_package step a call to package_get_auto_pr
will end up setting PRAUTO and modifying PKGV (if AUTOINC is there).

PRAUTO is then used by EXTENDPRAUTO, which is then used to generate
PKGR.

Since this behavior typically happens BEFORE the BB_UNIHASH is
calculated for do_package, we need a way to defer the expansion
until after we have the unihash value.

Writing out the pkgdata files w/o AUTOPR and PKGV (AUTOINC) expanded
to placeholder values is the easiest way to deal with this.  All other
variables are expanded as expected.

In the next task, typically do_packagedata, we will then use the
UNIHASH from the do_package to get the PR (AUTOPR) as well as
generate the AUTOINC replacement value (now PRSERV_PV_AUTOINC).

The do_packagedata then translates the placeholders to the final values
when copying the data from pkgdata to pkgdata-pdata-input.

Also update the prservice test case.  With unihash, just changing the
do_package (via a _append) will not change the PR.  So write the date
to a specific file that is incorporated into the unihash to ensure it
is always different for the test.  Various assert messages were also
updated to make it easier to figure out where/why a problem occured.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e32f37b0e4abc438c8f60e673cd18a5cc110768)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass              | 58 +++++++++++++++++++----
 meta/conf/bitbake.conf                    |  1 +
 meta/lib/oeqa/selftest/cases/prservice.py |  8 ++--
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7c252dd46b..f8074d866c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,7 +7,7 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) package_get_auto_pr - get PRAUTO from remote PR service
+# a) package_convert_pr_autoinc - convert AUTOINC in PKGV to ${PRSERV_PV_AUTOINC}
 #
 # b) perform_packagecopy - Copy D into PKGD
 #
@@ -585,12 +585,20 @@ def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s after: %s" % (varname, d.getVar(varname)))
 
 #
-# Package functions suitable for inclusion in PACKAGEFUNCS
+# Used by do_packagedata (and possibly other routines post do_package)
 #
 
+package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
 python package_get_auto_pr() {
     import oe.prservice
-    import re
+
+    def get_do_package_hash(pn):
+        if d.getVar("BB_RUNTASK") != "do_package":
+            taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+            for dep in taskdepdata:
+                if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
+                    return taskdepdata[dep][6]
+        return None
 
     # Support per recipe PRSERV_HOST
     pn = d.getVar('PN')
@@ -602,15 +610,22 @@ python package_get_auto_pr() {
 
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST'):
-        if 'AUTOINC' in pkgv:
-            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        d.setVar("PRSERV_PV_AUTOINC", "0")
         return
 
     auto_pr = None
     pv = d.getVar("PV")
     version = d.getVar("PRAUTOINX")
     pkgarch = d.getVar("PACKAGE_ARCH")
-    checksum = d.getVar("BB_TASKHASH")
+    checksum = get_do_package_hash(pn)
+
+    # If do_package isn't in the dependencies, we can't get the checksum...
+    if not checksum:
+        bb.warn('Task %s requested do_package unihash, but it was not available.' % d.getVar('BB_RUNTASK'))
+        #taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+        #for dep in taskdepdata:
+        #    bb.warn('%s:%s = %s' % (taskdepdata[dep][0], taskdepdata[dep][1], taskdepdata[dep][6]))
+        return
 
     if d.getVar('PRSERV_LOCKDOWN'):
         auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
@@ -628,7 +643,7 @@ python package_get_auto_pr() {
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
+                d.setVar("PRSERV_PV_AUTOINC", str(value))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
     except Exception as e:
@@ -638,6 +653,22 @@ python package_get_auto_pr() {
     d.setVar('PRAUTO',str(auto_pr))
 }
 
+#
+# Package functions suitable for inclusion in PACKAGEFUNCS
+#
+
+python package_convert_pr_autoinc() {
+    pkgv = d.getVar("PKGV")
+
+    # Adjust pkgv as necessary...
+    if 'AUTOINC' in pkgv:
+        d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
+
+    # Change PRSERV_PV_AUTOINC and EXTENDPRAUTO usage to special values
+    d.setVar('PRSERV_PV_AUTOINC', '@PRSERV_PV_AUTOINC@')
+    d.setVar('EXTENDPRAUTO', '@EXTENDPRAUTO@')
+}
+
 LOCALEBASEPN ??= "${PN}"
 
 python package_do_split_locales() {
@@ -2251,7 +2282,7 @@ python do_package () {
         package_qa_handle_error("var-undefined", msg, d)
         return
 
-    bb.build.exec_func("package_get_auto_pr", d)
+    bb.build.exec_func("package_convert_pr_autoinc", d)
 
     ###########################################################################
     # Optimisations
@@ -2323,9 +2354,20 @@ addtask do_package_setscene
 # Copy from PKGDESTWORK to tempdirectory as tempdirectory can be cleaned at both
 # do_package_setscene and do_packagedata_setscene leading to races
 python do_packagedata () {
+    bb.build.exec_func("package_get_auto_pr", d)
+
     src = d.expand("${PKGDESTWORK}")
     dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
     oe.path.copyhardlinktree(src, dest)
+
+    bb.build.exec_func("packagedata_translate_pr_autoinc", d)
+}
+
+# Translate the EXTENDPRAUTO and AUTOINC to the final values
+packagedata_translate_pr_autoinc() {
+    find ${WORKDIR}/pkgdata-pdata-input -type f | xargs --no-run-if-empty \
+        sed -e 's,@PRSERV_PV_AUTOINC@,${PRSERV_PV_AUTOINC},g' \
+            -e 's,@EXTENDPRAUTO@,${EXTENDPRAUTO},g' -i
 }
 
 addtask packagedata before do_build after do_package
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01020c9823..6ada0099eb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -208,6 +208,7 @@ PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
 P = "${PN}-${PV}"
 
+PRSERV_PV_AUTOINC = "AUTOINC"
 PRAUTO = ""
 EXTENDPRAUTO = "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO')]}"
 PRAUTOINX = "${PF}"
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 85b534963d..578b2b4dd9 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -23,7 +23,7 @@ class BitbakePrTests(OESelftestTestCase):
         package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
         find_pr = re.search(r"PKGR: r[0-9]+\.([0-9]+)", package_data)
-        self.assertTrue(find_pr, "No PKG revision found in %s" % package_data_file)
+        self.assertTrue(find_pr, "No PKG revision found via regex 'PKGR: r[0-9]+\.([0-9]+)' in %s" % package_data_file)
         return int(find_pr.group(1))
 
     def get_task_stamp(self, package_name, recipe_task):
@@ -40,7 +40,7 @@ class BitbakePrTests(OESelftestTestCase):
         return str(stamps[0])
 
     def increment_package_pr(self, package_name):
-        inc_data = "do_package_append() {\n    bb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
+        inc_data = "do_package_append() {\n    bb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\" > ${PKGDESTWORK}/${PN}.datestamp\n}" % datetime.datetime.now()
         self.write_recipeinc(package_name, inc_data)
         res = bitbake(package_name, ignore_status=True)
         self.delete_recipeinc(package_name)
@@ -63,7 +63,7 @@ class BitbakePrTests(OESelftestTestCase):
         pr_2 = self.get_pr_version(package_name)
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
+        self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
     def run_test_pr_export_import(self, package_name, replace_current_db=True):
@@ -89,7 +89,7 @@ class BitbakePrTests(OESelftestTestCase):
         self.increment_package_pr(package_name)
         pr_2 = self.get_pr_version(package_name)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
+        self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
 
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
-- 
2.25.1

