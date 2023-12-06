Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC66C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:15:12 +0000 (UTC)
Received: from 19.mo583.mail-out.ovh.net (19.mo583.mail-out.ovh.net [46.105.35.78])
 by mx.groups.io with SMTP id smtpd.web10.37075.1702476904410644216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.35.78, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.140.200])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 390D02AE64
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-j56hl (unknown [10.110.178.147])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CF2AA1FEC6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:01 +0000 (UTC)
Received: from joggee.fr ([37.59.142.106])
	by ghost-submission-6684bf9d7b-j56hl with ESMTPSA
	id iF/rMWW8eWWtJQEAcHI1ww
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:01 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R00684b68b50-265d-4978-ac94-cc38708cb65c,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr>
Message-Id: <CXN9OZ7FYWAD.3TQW2L7K56C6D@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:03:47 +0000
Subject: [PATCH 2/3] lib/oe/package: add LOCALEEXTRADIRS to define extra
 locations for locales
X-Ovh-Tracer-Id: 13575538126771719291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192294

Some packages may contain localized files not located in
/usr/share/locale. This new variables allows to add these directories in
dedicated locale packages.
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



