Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T5Wo4-0007LG-IH
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 08:58:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7Q6kcGT002988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 23:46:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 25 Aug 2012 23:46:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 14:51:58 +0800
Message-ID: <fa69b01c295bbcd5e02f9a03c550bbc97b7614c6.1345963712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/6] archiver.bbclass: fix the fakeroot and other issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 06:58:48 -0000
Content-Type: text/plain

* Fix the fakeroot issue
  The archiver.bbclass is used for archiving sources, patches, and logs,
  it uses the "rpmbuild -bs" from the package_rpm.bbclass to generate the
  .src.rpm, but it didn't work (it's not easy to explain it clearly):

  Reason:
  - It directly used the "fakeroot" command, we don't have such a
    command in native tools, so it would use the fakeroot from the host,
    and it would fail when there is no fakeroot on the host.

  - The "rpmbuild -bs" doesn't need to work under root, but it is in the
    function do_package_write_rpm which is running under fakeroot, and
    "rpmbuild" needs to know the source file's user/group name, the source
    file is the tarball which is created by the postfuncs of do_unpack
    or do_patch which doesn't use the fakeroot, so the created file's
    owner would be the real user, e.g.: robert, but there is no such a
    user under our native tools' fakeroot(pseudo), then the rpmbuild would
    fail. It worked when use the host's fakeroot in the past was because
    that the host's fakeroot knows the users on the host.

  Fix:
  - Remove the incorrect "fakeroot".

  - Change the source file's owner to root.root under fakeroot will fix the
    problem.

* Other fixes:
  - The typo: "do_remove_taball -> do_remove_tarball" which will cause the
    tarball is not removed.

  - Add the _sourcedir defination to the rpmbuild command since the the
    SOURCES would be added to the specfile when archiver.bbclass is
    inherited, otherwise there would be errors when "rpmbuild -bb", though
    the build is OK. It only added the defination to "rpmbuild -bs",
    didn't add to "rpmbuild -bb".

[YOCTO #2619]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass    |  2 +-
 meta/classes/package_rpm.bbclass | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b01b078..7056714 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -573,7 +573,7 @@ python do_remove_tarball(){
         except (TypeError, OSError):
             pass
 }
-do_remove_taball[deptask] = "do_archive_scripts_logs"
+do_remove_tarball[deptask] = "do_archive_scripts_logs"
 do_package_write_rpm[postfuncs] += "do_remove_tarball "
 export get_licenses
 export get_package
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 58a9aac..b999c28 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -585,11 +585,17 @@ python write_specfile () {
         if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
             source_number = 0
             patch_number = 0
+            workdir = d.getVar('WORKDIR', True)
             for source in source_list:
+                # The rpmbuild doesn't need the root permission, but it needs
+                # to know the file's user and group name, the only user and
+                # group in fakeroot is "root" when working in fakeroot.
+                os.chown("%s/%s" % (workdir, source), 0, 0)
                 spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
                 source_number += 1
             if patch_list:
                 for patch in patch_list:
+                    os.chown("%s/%s" % (workdir, patch), 0, 0)
                     print_deps(patch, "Patch" + str(patch_number), spec_preamble_top, d)
                     patch_number += 1
     # We need a simple way to remove the MLPREFIX from the package name,
@@ -1142,8 +1148,9 @@ python do_package_rpm () {
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
-        cmdsrpm = cmd + " --define '_sourcedir " + workdir + "' --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
-        cmdsrpm = 'fakeroot ' + cmdsrpm + " -bs " + outspecfile
+        cmd = cmd + " --define '_sourcedir " + workdir + "'"
+        cmdsrpm = cmd + " --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
+        cmdsrpm = cmdsrpm + " -bs " + outspecfile
     cmd = cmd + " -bb " + outspecfile
 
     # Build the source rpm package !
-- 
1.7.11.2



