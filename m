Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu5K-0005YU-3R
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:36:10 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qYxPaoixGbTgeSkc/hSFTHE/Y/WhSXpU12NcbekplB8=;
	b=GCGcdUSJ+JKsSo5g0taGVKXd1zZkDQ0bzyejlZCLuAHO1KO1XxBQQSS9QQYFnTCR8s
	/1dZl9eUu0JTch+b/UubH2ldrnqVU61Hf9GYeqnRKaZs8DpcWryEHYtnKyi395pXmuJ1
	D6N2azxRWBjNllPKFhraf9zP73uQXHiacrL18=
Received: by 10.205.132.69 with SMTP id ht5mr1180679bkc.115.1321028994446;
	Fri, 11 Nov 2011 08:29:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z15sm11731914bkv.4.2011.11.11.08.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:43 +0100
Message-Id: <529800a4e5b856350190662884bcf7483d7726c5.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 07/22] base.bbclass: add subversion-native to DEPENDS if there is svn:// in SRC_URI
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
X-List-Received-Date: Fri, 11 Nov 2011 16:36:10 -0000

* in some cases this could cause circual dependency (ie if we decide to
  apr_svn.bb or something like that before subversion-native in dependency
  tree), Saul said he had such case, but I wasn't able to reproduce it
  here (here it builds subversion-native-1.7.0 fine).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f3f798f..ba1f230 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -401,8 +401,14 @@ python () {
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
-    # Git packages should DEPEND on git-native
     srcuri = d.getVar('SRC_URI', 1)
+    # Svn packages should DEPEND on subversion-native
+    if "svn://" in srcuri:
+        depends = d.getVarFlag('do_fetch', 'depends') or ""
+        depends = depends + " subversion-native:do_populate_sysroot"
+        d.setVarFlag('do_fetch', 'depends', depends)
+
+    # Git packages should DEPEND on git-native
     if "git://" in srcuri:
         depends = d.getVarFlag('do_fetch', 'depends') or ""
         depends = depends + " git-native:do_populate_sysroot"
-- 
1.7.8.rc1



