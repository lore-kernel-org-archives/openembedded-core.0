Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGHHg-0002S8-EV
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 00:37:48 +0200
Received: by pbcwy7 with SMTP id wy7so13143040pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2UyALEW+P6ytlgfB6hnp3HpaCx2lUAY6nNvP4QL0GGQ=;
	b=ecvjlQOe7M6EwwYw52j29mNPNFkFVGDqQ9ThOACApHhcA+mkvS+B1tnH5fFWmXtwHv
	wWZbsEDUOr0KGAwPu++RQXCm440OvaaNcOjQLcafe1snRg0MWMDdw9gy88axchDJfzNa
	w6ClFdDykrlOLh0tEZ8jKiBbT9mKtZ92TYlVYPHWHPZBcmTJ+lOowJfT+L6lw2lxcHcU
	S/FCiMOPLyADG/qHlRBHU6pUHZO7h5E2ooXxzrq4aHxZ1FN+E6mkINd1ZoGvGJGvp3xz
	Nw1LQ46XcpiEB6wgT6c7VUmiwl2reGfUU34JU/eMfeQdPsEFWmHApHr9efg6cOJyDGh9
	PMlQ==
Received: by 10.68.135.39 with SMTP id pp7mr40335888pbb.127.1348525499223;
	Mon, 24 Sep 2012 15:24:59 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qf4sm10245796pbc.1.2012.09.24.15.24.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 15:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 15:24:42 -0700
Message-Id: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-common.inc: Consider multilib when renaming libgcc for debian'ness
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
X-List-Received-Date: Mon, 24 Sep 2012 22:37:48 -0000

When doing multilib builds rpm does not find libgcc1 for lib32
multilib because its not honoring the debian renaming scheme for
libgcc-multilib. Lets add MLPREFIX to fix it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 3b00017..38f3b7f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -40,7 +40,7 @@ def get_gcc_multiarch_setting(bb, d):
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
 
-DEBIANNAME_libgcc = "libgcc1"
+DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
 
 MIRRORS =+ "\
 ${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
-- 
1.7.9.5



