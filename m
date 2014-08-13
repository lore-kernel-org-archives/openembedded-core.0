Return-Path: <aymeric.dumaz@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id DE4E660CFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 00:18:00 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so6643362wib.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=i9mF4OnjJshZCeyQHdCg9Thz3BxuFzFPtkZZaNhwyW4=;
	b=rrl5BEEYod0vhChMP9NzlnH9D3qUeNMRwrlw7zR5Dg2sE1DikeGP1a8cH6MuzNo116
	lHYmd9ik2sRcsTpGyqbrSTvqQ5tpyJtRD1EJB/qQJD3H/YkRjsfH3AeYwxAoW7XsTspW
	9TXxXOQueW/c62cv3ykpKu9Rk8YXricLr55CGoZlkkNHAJxiWELHeV7XwPdnQ8VDlwQV
	6xozEE4j9lgyyCvI2ZnH32WAoGLiJTE/MMy3kUfstPoB+MfSLAqJEEOrIuQI0XFoUYb8
	WyZDxIaensTibPeJUrbTC9iKpqnFduF1+htfDoySQnc32EvCDq5efFzJKPd9JzBaJzfp
	Mv2g==
X-Received: by 10.180.38.39 with SMTP id d7mr1762204wik.24.1407889081861;
	Tue, 12 Aug 2014 17:18:01 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id bv16sm2194730wib.2.2014.08.12.17.18.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Aug 2014 17:18:01 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 02:17:55 +0200
Message-Id: <1407889075-22290-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [dora/daisy][PATCH] package.bbclass: Add ASSUME_SONAME variable
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
X-List-Received-Date: Wed, 13 Aug 2014 00:18:06 -0000

When libraries don't have a SONAME in their section, their name aren't added in
the .list/.ver files generated during do_package.
Other recipes are able to build against them but are not able to find them
afterwards, leading to missing dependencies.

For example, with qtbase and proprietary libraries for the OMAP3:
NOTE: Couldn't find shared library provider for libGLESv2.so, used by files:
[...]

This patch add the possibility to manually define a list of librairies that will
be exported in the .list/.ver files.
A hack in a lacking-SONAME recipe can be made on package_do_shlibs_append to
copy .list/.ver files manually made, but files from others PACKAGES in this
recipe will produce similar warnings during their creation because their name
aren't in the shlib_provider variable.

The darwin_so is not patched because it isn't relying on SONAME.

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 meta/classes/package.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5b1e902..9471e90 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1353,8 +1353,15 @@ python package_do_shlibs() {
                 if m.group(1) not in needed[pkg]:
                     needed[pkg].append(m.group(1))
             m = re.match("\s+SONAME\s+([^\s]*)", l)
+            this_soname = None
             if m:
                 this_soname = m.group(1)
+            if not this_soname:
+                file_basename = os.path.basename(file)
+                for s in assumed_sonames:
+                    if s in file_basename:
+                        this_soname = s
+            if this_soname:
                 if not this_soname in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or -1 == private_libs.find(this_soname):
@@ -1452,6 +1459,7 @@ python package_do_shlibs() {
         needed[pkg] = []
         sonames = list()
         renames = list()
+        assumed_sonames = (d.getVar('ASSUME_SONAME_' + pkg, True) or "").split()
         for file in pkgfiles[pkg]:
                 soname = None
                 if cpath.islink(file):
-- 
1.9.1


