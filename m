Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885EAC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 14:12:02 +0000 (UTC)
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net [87.98.165.38])
 by mx.groups.io with SMTP id smtpd.web10.54764.1704377519328940713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 06:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.165.38, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.2.210])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 2905B2BE7D
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dpg4v (unknown [10.110.178.62])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 062631FEBD
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:56 +0000 (UTC)
Received: from joggee.fr ([37.59.142.95])
	by ghost-submission-6684bf9d7b-dpg4v with ESMTPSA
	id MJfgNKy8lmUrPAAAEbo37A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:11:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001acccf431-b4b8-441f-a817-29bfdb52e099,
                    E96084CFC6176DA275D818C0F1DD071750B22EF1) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CY5ZELISQPXO.2972IEN5YAX6A@joggee.fr>
Message-Id: <CY5ZELISRCAC.YYJ5RA7Q61I0@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:03:47 +0000
Subject: [PATCH v3 2/3] lib/oe/package: add LOCALE_EXTRA_PATHS to add extra
 locations for locales
X-Ovh-Tracer-Id: 13595522852516859003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucffrghtvgcuihhnuchprghsthculddvuddmnecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepgeevhedtgefgjeetudeggfeivedtffehueefteegjeegveffudekkefghfetieeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193326

Some packages may contain localized files not located in
${datadir}/locale. This new variables allows to add these directories in
dedicated locale packages.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/conf/documentation.conf |  1 +
 meta/lib/oe/package.py       | 23 ++++++++++++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 486c62b6e8..336bddc9d8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -271,6 +271,7 @@ LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
 LINUX_VERSION_EXTENSION[doc] = "A string extension compiled into the version string of the Linux kernel built with the OpenEmbedded build system. You define this variable in the kernel recipe."
+LOCALE_EXTRA_PATHS[doc] = "Whitespace separated list of paths extending base ${datadir}/locale that are scanned to construct locale packages."
 LOCALE_UTF8_IS_DEFAULT[doc] = "If set, locale names are renamed such that those lacking an explicit encoding (e.g. en_US) will always be UTF-8, and non-UTF-8 encodings are renamed to, e.g., en_US.ISO-8859-1. Otherwise, the encoding is specified by glibc's SUPPORTED file. Not supported for precompiled locales."
 LOG_DIR[doc] = "Specifies the directory to which the OpenEmbedded build system writes overall log files. The default directory is ${TMPDIR}/log"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2f7a50e144..4718082bcd 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -653,24 +653,37 @@ def split_locales(d):
     except ValueError:
         locale_index = len(packages)
 
-    localedir = os.path.join(dvar + datadir, 'locale')
+    localedirs = [os.path.join(dvar + datadir, 'locale')]
 
-    if not cpath.isdir(localedir):
+    for localedir in (d.getVar('LOCALE_EXTRA_PATHS') or "").split():
+        localedirs.append(dvar + localedir)
+
+    locales = set()
+    locale_found = False
+    for localedir in localedirs:
+        if cpath.isdir(localedir):
+            locale_found = True
+            locales.update(os.listdir(localedir))
+
+    if not locale_found:
         bb.debug(1, "No locale files in this package")
         return
 
-    locales = os.listdir(localedir)
-
     summary = d.getVar('SUMMARY') or pn
     description = d.getVar('DESCRIPTION') or ""
     locale_section = d.getVar('LOCALE_SECTION')
     mlprefix = d.getVar('MLPREFIX') or ""
+    dvar_len = len(dvar)
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
         packages.insert(locale_index, pkg)
         locale_index += 1
-        d.setVar('FILES:' + pkg, os.path.join(datadir, 'locale', l))
+        files = []
+        for localedir in localedirs:
+            # Remove dvar prefix
+            files.append(os.path.join(localedir[dvar_len:], l))
+        d.setVar('FILES:' + pkg, " ".join(files))
         d.setVar('RRECOMMENDS:' + pkg, '%svirtual-locale-%s' % (mlprefix, ln))
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l))
-- 
2.43.0



