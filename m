Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0q-0005nY-1G
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:48 +0200
Received: by yxi19 with SMTP id 19so1518882yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SPbHVmd29MsVrhntVxAnaRQshSJYk+8201csI/lplx8=;
	b=oXKsqVyaOVXzYqsDScpIUN+S7MR430I+rFaFW5YzNDlSpC5tFftpJkB7RrQk8cHkdH
	62tJha9ZXRYNLdAW7q5zeWmTnF80DiBA7uo/oyDTFY6XM/GZzYlde9mkAWYFEY28jfyy
	v1APnBfJBZfrvZZOzwdU80SuP+vDXvuiQyC1Q=
Received: by 10.151.1.32 with SMTP id d32mr1013625ybi.26.1313087112979;
	Thu, 11 Aug 2011 11:25:12 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:51 -0700
Message-Id: <67dc21f29be5212be0051342e3a06adcae58b3cc.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/7] sanity: shift the required utils into a variable
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
X-List-Received-Date: Thu, 11 Aug 2011 18:29:48 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 999e15d..d50c843 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,6 +2,8 @@
 # Sanity check the users setup for common misconfigurations
 #
 
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk chrpath wget cpio"
+
 def raise_sanity_error(msg):
     bb.fatal(""" Poky's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
@@ -213,7 +215,7 @@ def check_sanity(e):
     if not check_app_exists('${BUILD_PREFIX}g++', e.data):
         missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", e.data, True)
 
-    required_utilities = "patch diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk chrpath wget cpio"
+    required_utilities = e.data.getVar('SANITY_REQUIRED_UTILITIES', True)
 
     if "qemu-native" in assume_provided:
         if not check_app_exists("qemu-arm", e.data):
-- 
1.7.4.1



