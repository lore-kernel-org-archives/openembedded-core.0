Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B792C3A59D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:07:23 +0000 (UTC)
Received: from 2.mo581.mail-out.ovh.net (2.mo581.mail-out.ovh.net [87.98.143.68])
 by mx.groups.io with SMTP id smtpd.web11.37992.1702480039990511146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.143.68, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.148.7])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id BEEFF27611
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s8sv4 (unknown [10.110.178.109])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 53E121FEB6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from joggee.fr ([37.59.142.102])
	by ghost-submission-6684bf9d7b-s8sv4 with ESMTPSA
	id mDfHE6XIeWXXtQAAm3lx3g
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004167ac1bc-b648-489b-952d-e8f283d508ce,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr>
Message-Id: <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:03:47 +0000
Subject: [PATCH v2 2/3] lib/oe/package: add LOCALEEXTRADIRS to define extra
 locations for locales
X-Ovh-Tracer-Id: 14457962179031469179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192302

Some packages may contain localized files not located in
/usr/share/locale. This new variables allows to add these directories in
dedicated locale packages.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/lib/oe/package.py | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2f7a50e144..fc8b20324e 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -653,24 +653,37 @@ def split_locales(d):
     except ValueError:
         locale_index = len(packages)
 
-    localedir = os.path.join(dvar + datadir, 'locale')
+    localedirs = [os.path.join(dvar + datadir, 'locale')]
 
-    if not cpath.isdir(localedir):
+    for localedir in (d.getVar('LOCALEEXTRADIRS') or "").split():
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



