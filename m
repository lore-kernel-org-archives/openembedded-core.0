Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEodR-0002Dn-2A
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 23:22:30 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so3046385pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2013 15:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=DeUvDpKO8Ubj/Wl0jTtHdAdIgxO8PrDfGpgkwHGOZvI=;
	b=c3pEbDzhIc4CCX2CSJ2FxyhSQZqGJdf75esKgCF4rqTKxibu95SSsLznNoeo2ZviND
	jxtKwBpZFabO7rAlskXI6EUVrwMVUAGb+PKo2UwHYB6mLetxg9j0lVgZKYfTQOaQCIF8
	rHPpxmZJUeovrvTm6QiTYjWrXhKxgiXLvLgZFzh/oPvQjX9FZMO6EV0PBXaXPdC9Dimx
	ccOYBCyb/nZ63IncYS8Y8B1ms0KM20jWn94ruyrtYj88ATiWWD0bhCuf9+sQ1V8/MaeA
	V6n3HNEoXfZ4yv3idk0RoFVVsD7/xpVqAPzEaJUpbj4hXXEuvVTeDW+zBQU8qVNgVGdW
	F5xw==
X-Received: by 10.68.190.99 with SMTP id gp3mr22913645pbc.117.1362953150817;
	Sun, 10 Mar 2013 15:05:50 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id 1sm17141192pba.32.2013.03.10.15.05.49
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Mar 2013 15:05:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2013 15:05:18 -0700
Message-Id: <1362953118-14668-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sudo: Compile mksigname and mksiglist for build host
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
X-List-Received-Date: Sun, 10 Mar 2013 22:22:33 -0000

cross compiling sudo doesnt work well since it uses
mksigname and mksiglist to generate C sources which
are then used in sudo build itself. With this patch
now we make sure those hosttools are compiled for
build machine. It fixes the build failures like

./mksigname > signame.c
/bin/sh: ./mksigname: cannot execute binary file
make[1]: *** [signame.c] Error 126

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index babea37..b8796e4 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -21,6 +21,11 @@ do_configure_prepend () {
 	fi
 }
 
+# mksigname/mksiglist are used on build host to generate source files
+do_compile_prepend () {
+	oe_runmake CC=$BUILD_CC CPPFLAGS="$BUILD_CPPFLAGS -I../include -I../"  -C compat mksigname mksiglist
+}
+
 # Explicitly create ${localstatedir}/lib before do_install to ensure
 # the directory is accessible by all users. Otherwise the mkinstalldirs
 # script (from sudo) will recursively create ${localstatedir}/lib/sudo
-- 
1.7.9.5



