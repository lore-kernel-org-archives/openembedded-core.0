Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC3C6B005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 22:45:29 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id u89-v6so11231391lje.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=zG09sZrqyHb9CBE7aeGPlzpX7RJ0NhFygnqnNYn6764=;
	b=cY3U1ay7Rp9lgyUsZA/i2sOnNrguqiNzz9msEVHBP7V0eeHqgJwtpbh5Ctk/tgQzw4
	zvsoB8if5vQUTjMPLdld/4ey4jlBI8AzylsLWv14P/oCElJY6RSLmFrLhNyEpXFKEThc
	XQPpKkRb4wmoifN3flIijs+aYsOgnDqoqOG/fzU9YC35FXK8O0+qQzUcjqSreqpxjKuZ
	ukwNNFDwWkuulCWPx3SOwmu5wa/EzjA3Tskxd2br17/f8jQT4Ha1sP29X5qn+MaXLtOU
	rGnvgn2ftPYNQFookVTugOy1KkN5rt9vas26WVt5ZA/4ZTjdAp/gsAk+NaF1P/gdpov2
	AgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zG09sZrqyHb9CBE7aeGPlzpX7RJ0NhFygnqnNYn6764=;
	b=aB9ho/tw6s+/K9w3Zw8sODLkbdyTBvzHfKeXDQjs+ahIyYLUKndil8jbXSIZDp6AW5
	DOolpIJ7Swxiy3IPcV5+UyE399Sn9+wvf2nr7hwiLpBc+dpbg8QwG03ikP2reQKkr7Oi
	5Yd7bXdd9jU3AqiaZw+SjdHGK3b7kVEXKPtcc4wu0lu4P0ZDAjSbEYlGJSbj6LlLK+yF
	jPJtG6cjJfI9LAg28aW2s7/qN3fX99kvQONOCX/Gqa6To3cJr2v9lS8iXP8LrRJAQNl3
	iAshiwRevj+HY0hPDXxagHIvja5uJDlu0amQ93vNHErQTwBwKHfGviBIi6hwgVa8Dhnj
	VFHw==
X-Gm-Message-State: AJcUukf5+bFUyK8lFBEXU+t74itd2pSkFDexYnDCT8vEfcEY0sJhd+vY
	KO+BucERUaYOdNO2PR7dM5KRIoafjH0=
X-Google-Smtp-Source: ALg8bN7u37GpnVmTupMnH58jFBtLszBdwjY8ePeDRz4HimKOWHEHKjNRja20GuxoPNhX51pBmwQZ5Q==
X-Received: by 2002:a2e:5356:: with SMTP id
	t22-v6mr6749250ljd.26.1547160330160; 
	Thu, 10 Jan 2019 14:45:30 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	y24sm14016702lfj.17.2019.01.10.14.45.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 14:45:29 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 23:45:16 +0100
Message-Id: <20190110224516.11775-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package.bbclass: Make package output files more deterministic
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
X-List-Received-Date: Thu, 10 Jan 2019 22:45:30 -0000

Observing depsig.do_package for packages inbetween rebuilds indicated
that the following variables/files content was changing order randomly.
Make them deterministic by sorting the output:

 RDEPENDS_<pkg>
 RRECOMMENDS_<pkg>
 FILERDEPENDSFLIST_<pkg>

 packages-split/<pkg>.shlibdeps

The following variable was not observed to change, but it is
assumed that the same situation can occur, so do the same
sorting for consistency:

 FILERPROVIDESFLIST_<pkg>

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 322c4ec77f..9585835279 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1561,12 +1561,12 @@ python package_do_filedeps() {
         if pkg not in requires_files:
             requires_files[pkg] = []
 
-        for file in provides:
+        for file in sorted(provides):
             provides_files[pkg].append(file)
             key = "FILERPROVIDES_" + file + "_" + pkg
             d.appendVar(key, " " + " ".join(provides[file]))
 
-        for file in requires:
+        for file in sorted(requires):
             requires_files[pkg].append(file)
             key = "FILERDEPENDS_" + file + "_" + pkg
             d.appendVar(key, " " + " ".join(requires[file]))
@@ -1867,7 +1867,7 @@ python package_do_shlibs() {
             os.remove(deps_file)
         if len(deps):
             fd = open(deps_file, 'w')
-            for dep in deps:
+            for dep in sorted(deps):
                 fd.write(dep + '\n')
             fd.close()
 }
@@ -1988,7 +1988,7 @@ python read_shlibdeps () {
     packages = d.getVar('PACKAGES').split()
     for pkg in packages:
         rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
-        for dep in pkglibdeps[pkg]:
+        for dep in sorted(pkglibdeps[pkg]):
             # Add the dep if it's not already there, or if no comparison is set
             if dep not in rdepends:
                 rdepends[dep] = []
@@ -2021,7 +2021,7 @@ python package_depchains() {
         #bb.note('depends for %s is %s' % (base, depends))
         rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
 
-        for depend in depends:
+        for depend in sorted(depends):
             if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
                 #bb.note("Skipping %s" % depend)
                 continue
@@ -2042,7 +2042,7 @@ python package_depchains() {
         #bb.note('rdepends for %s is %s' % (base, rdepends))
         rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
 
-        for depend in rdepends:
+        for depend in sorted(rdepends):
             if depend.find('virtual-locale-') != -1:
                 #bb.note("Skipping %s" % depend)
                 continue
-- 
2.11.0


