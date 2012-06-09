Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdUBJ-0000Ta-EE
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jun 2012 00:30:53 +0200
Received: by pbbrq2 with SMTP id rq2so3747291pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CgetlzHOfmUeTOz/c7B6WmUuOV7Jgi1bsTeQFVtMGNg=;
	b=UmrZPv3DGQo2tOW36ky4VU6S9qWulyQxoVkAayST1LnIvxpceghy8Dz/qMS3Gwfhy3
	rp/IogOcaqqBYhDQExY6tdb48dizWFioy4dNJeRHzAZkZi41qHGa+eGv20GQt2lkSM9y
	ImI5qLO/vr7iwoa0oXIBCFFTNlIsre5nDLO5Z8no9K65sDnesHXzByuWwK+KkudUrNqR
	cFKynF+plpCsNAHKstKjfRSatZxLPTecUqeiAiPxUv2L/IC/vgiFxxwePp0nl2XQOaS9
	O2OkDt4mJzBmDqQJQwYF4XJB0VTyDmPceru85rl7fQhqRcRbWCYA5WxqGp0aDnIzGMXd
	usfw==
Received: by 10.68.234.35 with SMTP id ub3mr10509431pbc.8.1339280421158;
	Sat, 09 Jun 2012 15:20:21 -0700 (PDT)
Received: from localhost.localdomain (garnet.openembedded.org.
	[140.211.169.180])
	by mx.google.com with ESMTPS id ru4sm12673107pbc.66.2012.06.09.15.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 15:20:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 15:19:24 -0700
Message-Id: <1339280364-22585-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1339280364-22585-1-git-send-email-raj.khem@gmail.com>
References: <1339280364-22585-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc-common: Replace use of TARGET_ARCH with TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Sat, 09 Jun 2012 22:30:53 -0000

TARGET_ARCH is poured into TRANSLATED_TARGET_ARCH
for gcc-cross family or gcc-crosssdk family
of recipes we have to check for TRANSLATED_TARGET_ARCH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 7911ceb..45828bb 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -19,12 +19,12 @@ def get_gcc_fpu_setting(bb, d):
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):
-    if d.getVar('TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
         return "--with-mips-plt"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-    target_arch = d.getVar('TARGET_ARCH', True)
+    target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     multiarch_options = {
         "i586":    "--enable-targets=all",
         "powerpc": "--enable-targets=powerpc64",
-- 
1.7.5.4



