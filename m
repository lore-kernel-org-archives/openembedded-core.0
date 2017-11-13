Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id DEC0678558
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:25:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id 5AA64260FE3
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 19:19:47 +0000
Message-Id: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 1/2] package.bbclass: add prohibited-path qa test
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
X-List-Received-Date: Mon, 13 Nov 2017 19:25:48 -0000

Sometimes we wish to ensure that packages don't install files or
directories somewhere that may prove detrimental to the operation of the
system. For example, this may be the case if files are placed in a
directory that is utilised as a mount point at run time, thus making them
inaccessible once when the mount point is being utilised.

Implement the prohibited-path QA test, which enables such locations to be
specified in a "PROHIBITED_PATH" variable. This implementation allows for
exact matches and simple wildcards (paths ending with an asterisk. An
error will be raised should a match be found, or in the case of a
wildcard, for any files added below the specificed location(s).

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---

Changes since v1:
 - Correcting author and SOB.

 meta/classes/insane.bbclass  |  2 +-
 meta/classes/package.bbclass | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index def9c70..fb10681 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -33,7 +33,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
-            license-checksum dev-elf file-rdeps \
+            license-checksum dev-elf file-rdeps prohibited-path \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46..721ca1e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1162,6 +1162,17 @@ python populate_packages () {
                 continue
             seen.append(file)
 
+            prohibited_path = d.getVar('PROHIBITED_PATH')
+            if prohibited_path is not None:
+                for p in prohibited_path.split():
+                    exactmatch = True
+                    if p.endswith("*"):
+                        p = p[:len(p)-1]
+                        exactmatch = False
+                    if file[1:].startswith(p) and ((file[1:] != p) or exactmatch) :
+                        msg = "%s is in a prohibited path.\n" % file[1:]
+                        package_qa_handle_error("prohibited-path", msg, d)
+
             def mkdir(src, dest, p):
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
-- 
2.1.4


