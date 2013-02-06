Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2tYe-0000ZI-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 02:12:17 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so339189dak.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 16:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yjNdCm36c6pzIdgEIv9gmURNLMvCd8tNns9KdUcU95I=;
	b=Uh67aUCtT88Z56A+XeOeuMeonDTZPB6BcMqHaHOQN+vUtetVexLHTRymrZMrx6Hfjy
	FktckVTzkPfeHkqNlU8kfd013Y8QPLfMWhTELiMCC27QsIJoSzp0lVWtzw2qX+e7TzcI
	cDzVddyT++btn2e+t7Njax7wraomE72Wod+rcsUNkpKE4dwNOHl/p1j+ZURRQqdNqVJJ
	n+aO2sqBwTyPPMwBxbLScHXumyiKyO+PzJ1Hrblp0G/mnkw1WPa5hNmDg+0aOP2UMP6q
	1Zmn8oL3RrmDOd7Udu/B2mhnGcBrfQL2bqpGT6feZkVEI9bnvnY2lmL6agydE65prVME
	2maQ==
X-Received: by 10.66.73.5 with SMTP id h5mr69488262pav.11.1360112185718;
	Tue, 05 Feb 2013 16:56:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi2sm33304596pab.18.2013.02.05.16.56.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 16:56:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 01:56:14 +0100
Message-Id: <1360112174-25363-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] package.bbclass: return list of packages created in do_split_packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 01:12:17 -0000

* sometimes it's useful to do something with packages created
  by do_split_packages later in do_package_prepend, e.g. in:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043824.html
  I have .bbclass which adds some postinst, postrm and RDEPENDS,
  but ttf-mplus is using do_split_packages to create those packages

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2fbd260..8ddaf3a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -139,6 +139,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 
 
     packages = d.getVar('PACKAGES', True).split()
+    split_packages = []
 
     if postinst:
         postinst = '#!/bin/sh\n' + postinst + '\n'
@@ -172,6 +173,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             continue
         on = legitimize_package_name(m.group(1))
         pkg = output_pattern % on
+        split_packages.append(pkg)
         if not pkg in packages:
             if prepend:
                 packages = [pkg] + packages
@@ -206,6 +208,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             hook(f, pkg, file_regex, output_pattern, m.group(1))
 
     d.setVar('PACKAGES', ' '.join(packages))
+    return split_packages
 
 PACKAGE_DEPENDS += "file-native"
 
-- 
1.8.1.2



