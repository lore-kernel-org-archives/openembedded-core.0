Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43AAC48BC0
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:50:29 +0000 (UTC)
Received: from 19.mo582.mail-out.ovh.net (19.mo582.mail-out.ovh.net [188.165.56.177])
 by mx.groups.io with SMTP id smtpd.web10.8078.1707749422149444775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 188.165.56.177, mailfrom: jonathan@joggee.fr)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.95])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TYS701Jvdz19pH
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6l449 (unknown [10.110.113.115])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F095A1FEF6
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000 (UTC)
Received: from joggee.fr ([37.59.142.101])
	by ghost-submission-6684bf9d7b-6l449 with ESMTPSA
	id oGMNOiswymV36wAAKvzQ+Q
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004c67c8071-65b5-4266-bb6b-064aa42ef912,
                    C9F09FF139978B9C7604C68D153D486573A97FEF) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CZ36N8IH0R6J.ZIQATXFYOO0W@joggee.fr>
Message-Id: <CZ36N8IH1M2X.3592B6MOWXLE9@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:03:47 +0000
Subject: [PATCH v4 2/3] lib/oe/package: add LOCALE_PATHS to add define all
 locations for locales
X-Ovh-Tracer-Id: 3471149416112524411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecuffgrthgvuchinhcuphgrshhtucdlvddumdenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeegveehtdeggfejtedugefgieevtdffheeufeetgeejgeevffdukeekgffhteeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuthdpughkihhmpehprghssh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195340

Some packages may contain localized files not located in default path
${datadir}/locale. Add the new variable LOCALE_PATHS to allow a recipe
to define extra paths or even fully override the scanned directories.
LOCALE_PATHS is set at ${datadir}/locale by default to keep the exact
same behavior for the recipes which did not need modification.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/classes-global/package.bbclass |  1 +
 meta/conf/documentation.conf        |  1 +
 meta/lib/oe/package.py              | 24 ++++++++++++++----------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index f56bca3542..aa1eb5e901 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -335,6 +335,7 @@ python package_convert_pr_autoinc() {
 }
 
 LOCALEBASEPN ??= "${PN}"
+LOCALE_PATHS ?= "${datadir}/locale"
 
 python package_do_split_locales() {
     oe.package.split_locales(d)
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 486c62b6e8..90d8e82932 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -271,6 +271,7 @@ LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
 LINUX_VERSION_EXTENSION[doc] = "A string extension compiled into the version string of the Linux kernel built with the OpenEmbedded build system. You define this variable in the kernel recipe."
+LOCALE_PATHS[doc] = "Whitespace separated list of paths that are scanned to construct locale packages. The list already contains ${datadir}/locale by default."
 LOCALE_UTF8_IS_DEFAULT[doc] = "If set, locale names are renamed such that those lacking an explicit encoding (e.g. en_US) will always be UTF-8, and non-UTF-8 encodings are renamed to, e.g., en_US.ISO-8859-1. Otherwise, the encoding is specified by glibc's SUPPORTED file. Not supported for precompiled locales."
 LOG_DIR[doc] = "Specifies the directory to which the OpenEmbedded build system writes overall log files. The default directory is ${TMPDIR}/log"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index cb6893f3c2..d1738d3b61 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -639,11 +639,6 @@ def split_locales(d):
 
     packages = (d.getVar('PACKAGES') or "").split()
 
-    datadir = d.getVar('datadir')
-    if not datadir:
-        bb.note("datadir not defined")
-        return
-
     dvar = d.getVar('PKGD')
     pn = d.getVar('LOCALEBASEPN')
 
@@ -653,14 +648,20 @@ def split_locales(d):
     except ValueError:
         locale_index = len(packages)
 
-    localedir = os.path.join(dvar + datadir, 'locale')
+    localepaths = []
+    locales = set()
+    for localepath in (d.getVar('LOCALE_PATHS') or "").split():
+        localedir = dvar + localepath
+        if cpath.isdir(localedir):
+            locales.update(os.listdir(localedir))
+            localepaths.append(localepath)
+        else:
+            bb.debug(1, "No locale files in %s" % localepath)
 
-    if not cpath.isdir(localedir):
+    if len(locales) == 0:
         bb.debug(1, "No locale files in this package")
         return
 
-    locales = os.listdir(localedir)
-
     summary = d.getVar('SUMMARY') or pn
     description = d.getVar('DESCRIPTION') or ""
     locale_section = d.getVar('LOCALE_SECTION')
@@ -670,7 +671,10 @@ def split_locales(d):
         pkg = pn + '-locale-' + ln
         packages.insert(locale_index, pkg)
         locale_index += 1
-        d.setVar('FILES:' + pkg, os.path.join(datadir, 'locale', l))
+        files = []
+        for localepath in localepaths:
+            files.append(os.path.join(localepath, l))
+        d.setVar('FILES:' + pkg, " ".join(files))
         d.setVar('RRECOMMENDS:' + pkg, '%svirtual-locale-%s' % (mlprefix, ln))
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l))
-- 
2.43.0



