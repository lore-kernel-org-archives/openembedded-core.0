Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7286C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29732.1644427845846956676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23C65ED1;
	Wed,  9 Feb 2022 09:30:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5633F73B;
	Wed,  9 Feb 2022 09:30:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH 1/2] package: add extra_recommends to do_split_package()
Date: Wed,  9 Feb 2022 17:30:35 +0000
Message-Id: <20220209173036.3823144-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161575

It may be preferrable to add RRECOMMENDS instead of RDEPENDS to each of
the split packages, so add extra_recommends to do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/package.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f4a661ba25a..2143abca0d1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -79,7 +79,7 @@ def legitimize_package_name(s):
     # Remaining package name validity fixes
     return s.lower().replace('_', '-').replace('@', '+').replace(',', '+=
').replace('/', '-')
=20
-def do_split_packages(d, root, file_regex, output_pattern, description, =
postinst=3DNone, recursive=3DFalse, hook=3DNone, extra_depends=3DNone, au=
x_files_pattern=3DNone, postrm=3DNone, allow_dirs=3DFalse, prepend=3DFals=
e, match_path=3DFalse, aux_files_pattern_verbatim=3DNone, allow_links=3DF=
alse, summary=3DNone):
+def do_split_packages(d, root, file_regex, output_pattern, description, =
postinst=3DNone, recursive=3DFalse, hook=3DNone, extra_depends=3DNone, ex=
tra_recommends=3DNone, aux_files_pattern=3DNone, postrm=3DNone, allow_dir=
s=3DFalse, prepend=3DFalse, match_path=3DFalse, aux_files_pattern_verbati=
m=3DNone, allow_links=3DFalse, summary=3DNone):
     """
     Used in .bb files to split up dynamically generated subpackages of a
     given package, usually plugins or modules.
@@ -108,6 +108,8 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
                       all packages. The default value of None causes a
                       dependency on the main package (${PN}) - if you do
                       not want this, pass '' for this parameter.
+    extra_recommends -- extra runtime recommends (RRECOMMENDS) to be set=
 for
+                      all packages. By default no recommends are added.
     aux_files_pattern -- extra item(s) to be added to FILES for each
                       package. Can be a single string item or a list of
                       strings for multiple items.  Must include %s.
@@ -222,6 +224,8 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
             d.setVar('FILES:' + pkg, oldfiles + " " + newfile)
         if extra_depends !=3D '':
             d.appendVar('RDEPENDS:' + pkg, ' ' + extra_depends)
+        if extra_recommends:
+            d.appendVar('RRECOMMENDS:' + pkg, ' ' + extra_recommends)
         if not d.getVar('DESCRIPTION:' + pkg):
             d.setVar('DESCRIPTION:' + pkg, description % on)
         if not d.getVar('SUMMARY:' + pkg):
--=20
2.25.1


