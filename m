Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHBnj-0005p7-0S
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 11:54:07 +0200
Received: by bkat8 with SMTP id t8so4899466bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/Yg7aWCf2EbPuUM1zrPGxSYlXVQJr3wKgJnaby6rwxo=;
	b=gtJMobYMtfjU6HDb5vst2coT43Eo5UOXqCoyH39rTncR/Dr2J02pxpgTuh0rw6DHGX
	wxw0FNMBU3u5jzE6mjvmFNRE1cZKE7D29Y1LI8Mqp4teiVFTgCuOr80QuB0oB0B0RpAd
	YoVoOYOHLplSxHFTbSmB/0TGqwkKIsoEO+JFI=
Received: by 10.204.8.24 with SMTP id f24mr10109475bkf.6.1319190493748;
	Fri, 21 Oct 2011 02:48:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm12798332bku.9.2011.10.21.02.48.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 02:48:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 11:48:03 +0200
Message-Id: <1319190483-5637-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bcdfb52940fbceb12549f4725ad808ae496afdb3.1319184832.git.Martin.Jansa@gmail.com>
References: <bcdfb52940fbceb12549f4725ad808ae496afdb3.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH] base.bbclass: add subversion-native to DEPENDS if there is svn:// in SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 09:54:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f539744..bced226 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -401,6 +401,13 @@ python () {
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
+    # Svn packages should DEPEND on subversion-native
+    srcuri = bb.data.getVar('SRC_URI', d, 1)
+    if "svn://" in srcuri:
+        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
+        depends = depends + " subversion-native:do_populate_sysroot"
+        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
+
     # Git packages should DEPEND on git-native
     srcuri = bb.data.getVar('SRC_URI', d, 1)
     if "git://" in srcuri:
-- 
1.7.7



