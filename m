Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdUBI-0000TZ-5E
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jun 2012 00:30:52 +0200
Received: by dalh21 with SMTP id h21so3578165dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 15:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8woVSDECUyq6HoDsMyt0YRnioycbMjWS1PgWs2HOrj0=;
	b=CFeCIEPqULdVMMOH6DhHJQPfp3VfvQdvIbik4lkV8ss6IFJ7HWLvPmvG3uqEOThIL/
	9w9nzp3ZP5giwlIJQS1LrxsasTCswwqT2F1LsoHvhkrZiwey+mQUdT/bTzUvTS9r2a1w
	113acHpHIivnE56augae1mJi0DLg4TUOmy043/JN3NjtnCEvTnLEAyu6z4ReA0Fbwz1r
	4AHTlIszupOK4tXu6fCVfNlaGZJG+mE/0mv4VT8K/Is6wCZ4+CK7EqNLxFi9UCPPpxUx
	k1l/4yX2Bt+vy3wea3pxl5brnfxu5oNdXc6fsuabmVjqoIAhQmf5u1Un9T3n8NkLEgue
	iMfQ==
Received: by 10.68.200.197 with SMTP id ju5mr10323160pbc.19.1339280419666;
	Sat, 09 Jun 2012 15:20:19 -0700 (PDT)
Received: from localhost.localdomain (garnet.openembedded.org.
	[140.211.169.180])
	by mx.google.com with ESMTPS id ru4sm12673107pbc.66.2012.06.09.15.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 15:20:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 15:19:23 -0700
Message-Id: <1339280364-22585-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] gcc-common: Enable hardfloat ABI when target is arm
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
X-List-Received-Date: Sat, 09 Jun 2012 22:30:52 -0000

We need to check target to be arm before enabling hard-float
ABI. There are crossdk targets or candian-cross targets built
for arm and we should not enable it for those class of recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index c479403..7911ceb 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,7 +10,7 @@ inherit autotools gettext
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
 
 def get_gcc_fpu_setting(bb, d):
-    if d.getVar('ARMPKGSFX_EABI', True) is "hf":
+    if d.getVar('ARMPKGSFX_EABI', True) is "hf" and  d.getVar('TRANSLATED_TARGET_ARCH', True) is "arm":
         return "--with-float=hard"
     if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
         return "--with-float=soft"
-- 
1.7.5.4



