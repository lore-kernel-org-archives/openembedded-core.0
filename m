Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4FC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:57:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20193.1702033017774798856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A96011FB;
	Fri,  8 Dec 2023 02:57:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10A603F762;
	Fri,  8 Dec 2023 02:56:56 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] insane: ensure more paths have the workdir removed
Date: Fri,  8 Dec 2023 10:56:55 +0000
Message-Id: <20231208105655.3986590-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192042

From: Ross Burton <ross.burton@arm.com>

When showing paths to the user we don't want to include the whole build
directory.  Passing the package name to package_qa_clean_path strips
this completely.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index b78bb6f445d..72fcf6b2544 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -104,7 +104,7 @@ def package_qa_check_shebang_size(path, name, d, elf,=
 messages):
             return
=20
         if len(stanza) > 129:
-            oe.qa.add_message(messages, "shebang-size", "%s: %s maximum =
shebang size exceeded, the maximum size is 128." % (name, package_qa_clea=
n_path(path, d)))
+            oe.qa.add_message(messages, "shebang-size", "%s: %s maximum =
shebang size exceeded, the maximum size is 128." % (name, package_qa_clea=
n_path(path, d, name)))
             return
=20
 QAPATHTEST[libexec] =3D "package_qa_check_libexec"
@@ -116,7 +116,7 @@ def package_qa_check_libexec(path,name, d, elf, messa=
ges):
         return True
=20
     if 'libexec' in path.split(os.path.sep):
-        oe.qa.add_message(messages, "libexec", "%s: %s is using libexec =
please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
+        oe.qa.add_message(messages, "libexec", "%s: %s is using libexec =
please relocate to %s" % (name, package_qa_clean_path(path, d, name), lib=
exec))
         return False
=20
     return True
@@ -208,7 +208,7 @@ def package_qa_check_staticdev(path, name, d, elf, me=
ssages):
=20
     if not name.endswith("-pic") and not name.endswith("-staticdev") and=
 not name.endswith("-ptest") and path.endswith(".a") and not path.endswit=
h("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.deb=
ug-static/' in path:
         oe.qa.add_message(messages, "staticdev", "non -staticdev package=
 contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d, name)))
+                 (name, package_qa_clean_path(path, d, name)))
=20
 QAPATHTEST[mime] =3D "package_qa_check_mime"
 def package_qa_check_mime(path, name, d, elf, messages):
@@ -219,7 +219,7 @@ def package_qa_check_mime(path, name, d, elf, message=
s):
=20
     if d.getVar("datadir") + "/mime/packages" in path and path.endswith(=
'.xml') and not bb.data.inherits_class("mime", d):
         oe.qa.add_message(messages, "mime", "package contains mime types=
 but does not inherit mime: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+                 (name, package_qa_clean_path(path, d, name)))
=20
 QAPATHTEST[mime-xdg] =3D "package_qa_check_mime_xdg"
 def package_qa_check_mime_xdg(path, name, d, elf, messages):
@@ -239,7 +239,7 @@ def package_qa_check_mime_xdg(path, name, d, elf, mes=
sages):
         except:
             # At least libreoffice installs symlinks with absolute paths=
 that are dangling here.
             # We could implement some magic but for few (one) recipes it=
 is not worth the effort so just warn:
-            wstr =3D "%s cannot open %s - is it a symlink with absolute =
path?\n" % (name, package_qa_clean_path(path,d))
+            wstr =3D "%s cannot open %s - is it a symlink with absolute =
path?\n" % (name, package_qa_clean_path(path, d, name))
             wstr +=3D "Please check if (linked) file contains key 'MimeT=
ype'.\n"
             pkgname =3D name
             if name =3D=3D d.getVar('PN'):
@@ -247,8 +247,8 @@ def package_qa_check_mime_xdg(path, name, d, elf, mes=
sages):
             wstr +=3D "If yes: add \'inhert mime-xdg\' and \'MIME_XDG_PA=
CKAGES +=3D \"%s\"\' / if no add \'INSANE_SKIP:%s +=3D \"mime-xdg\"\' to =
recipe." % (pkgname, pkgname)
             oe.qa.add_message(messages, "mime-xdg", wstr)
         if mime_type_found:
-            oe.qa.add_message(messages, "mime-xdg", "package contains de=
sktop file with key 'MimeType' but does not inhert mime-xdg: %s path '%s'=
" % \
-                    (name, package_qa_clean_path(path,d)))
+            oe.qa.add_message(messages, "mime-xdg", "%s: contains deskto=
p file with key 'MimeType' but does not inhert mime-xdg: %s" % \
+                    (name, package_qa_clean_path(path, d, name)))
=20
 def package_qa_check_libdir(d):
     """
@@ -321,8 +321,8 @@ def package_qa_check_dbg(path, name, d, elf, messages=
):
=20
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            oe.qa.add_message(messages, "debug-files", "non debug packag=
e contains .debug directory: %s path %s" % \
-                     (name, package_qa_clean_path(path,d)))
+            oe.qa.add_message(messages, "debug-files", "%s: non debug pa=
ckage contains .debug directory %s" % \
+                     (name, package_qa_clean_path(path, d, name)))
=20
 QAPATHTEST[arch] =3D "package_qa_check_arch"
 def package_qa_check_arch(path,name,d, elf, messages):
@@ -371,7 +371,7 @@ def package_qa_check_arch(path,name,d, elf, messages)=
:
                  (elf.abiSize(), bits, package_qa_clean_path(path, d, na=
me)))
     elif not ((littleendian =3D=3D elf.isLittleEndian()) or is_bpf):
         oe.qa.add_message(messages, "arch", "Endiannes did not match (%d=
, expected %d) in %s" % \
-                 (elf.isLittleEndian(), littleendian, package_qa_clean_p=
ath(path,d, name)))
+                 (elf.isLittleEndian(), littleendian, package_qa_clean_p=
ath(path, d, name)))
=20
 QAPATHTEST[desktop] =3D "package_qa_check_desktop"
 def package_qa_check_desktop(path, name, d, elf, messages):
--=20
2.34.1


