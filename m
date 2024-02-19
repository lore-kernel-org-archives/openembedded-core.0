Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F297DC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:40:47 +0000 (UTC)
Received: from 17.mo584.mail-out.ovh.net (17.mo584.mail-out.ovh.net [46.105.41.16])
 by mx.groups.io with SMTP id smtpd.web10.10697.1708695645761539553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.41.16, mailfrom: jonathan@joggee.fr)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.139.54])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4ThB3b6p7Nz1GX3
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ts924 (unknown [10.110.113.248])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7B3531FE99
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000 (UTC)
Received: from joggee.fr ([37.59.142.109])
	by ghost-submission-6684bf9d7b-ts924 with ESMTPSA
	id iMxIHFug2GWH6QMAedmf+A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003eeb77a97-7154-4d71-8886-2f806d151977,
                    ADCDE1ADAEF6B8451492E3DEBD29E66FF06048D8) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CZCI1W6673HU.X4JQRJW1T18X@joggee.fr>
Message-Id: <CZCI1W667E6F.2JH6O5TBHTIES@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Mon, 19 Feb 2024 16:19:28 +0000
Subject: [PATCH v2 2/2] lib/oe/package: fix LOCALE_PATHS scan to create locale
 packages
X-Ovh-Tracer-Id: 11554829269857406075
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeeigdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepgeevhedtgefgjeetudeggfeivedtffehueefteegjeegveffudekkefghfetieeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhesjhhoghhgvggvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196081

split_locales() must only check subdirectories in paths added to
LOCALE_PATHS to avoid creating weird packages based on filenames also
present in paths.

Without such a filter, cups recipe adding ${datadir}/cups/templates to
LOCALE_PATHS creates the following incorrect packages:
- cups-locale-add-class.tmpl
- cups-locale-add-printer.tmpl
- cups-locale-admin.tmpl

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/conf/documentation.conf |  2 +-
 meta/lib/oe/package.py       | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 90d8e82932..b0591881ba 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -271,7 +271,7 @@ LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
 LINUX_VERSION_EXTENSION[doc] = "A string extension compiled into the version string of the Linux kernel built with the OpenEmbedded build system. You define this variable in the kernel recipe."
-LOCALE_PATHS[doc] = "Whitespace separated list of paths that are scanned to construct locale packages. The list already contains ${datadir}/locale by default."
+LOCALE_PATHS[doc] = "Whitespace separated list of paths that are scanned to construct locale packages. The list already contains ${datadir}/locale by default. Note that all subdirectories in these paths are assumed to be locales."
 LOCALE_UTF8_IS_DEFAULT[doc] = "If set, locale names are renamed such that those lacking an explicit encoding (e.g. en_US) will always be UTF-8, and non-UTF-8 encodings are renamed to, e.g., en_US.ISO-8859-1. Otherwise, the encoding is specified by glibc's SUPPORTED file. Not supported for precompiled locales."
 LOG_DIR[doc] = "Specifies the directory to which the OpenEmbedded build system writes overall log files. The default directory is ${TMPDIR}/log"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d1738d3b61..587810bdaf 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -652,11 +652,15 @@ def split_locales(d):
     locales = set()
     for localepath in (d.getVar('LOCALE_PATHS') or "").split():
         localedir = dvar + localepath
-        if cpath.isdir(localedir):
-            locales.update(os.listdir(localedir))
-            localepaths.append(localepath)
-        else:
-            bb.debug(1, "No locale files in %s" % localepath)
+        if not cpath.isdir(localedir):
+            bb.debug(1, 'No locale files in %s' % localepath)
+            continue
+
+        localepaths.append(localepath)
+        with os.scandir(localedir) as it:
+            for entry in it:
+                if entry.is_dir():
+                    locales.add(entry.name)
 
     if len(locales) == 0:
         bb.debug(1, "No locale files in this package")
-- 
2.43.2

