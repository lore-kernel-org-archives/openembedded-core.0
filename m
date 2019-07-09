Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE7E7E1FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 16:40:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id i2so10387200plt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jSbvcvtEyF8T75AFnbnpsluRGyEbasyz3RzBr1CEUgY=;
	b=NkaRZwZmBtbOVXVH0p3FfPi0ThlPSLccWgHxNOcodS1OgoXXn9huM1Rq3RaSKInt7B
	KNWwi2/jTzdAEbO7uaoky79AqErIVTv0u7UOsvgKwwbmqpw/5rZ6wHlfYIthGcGf6lc+
	vbZALI5/Y7R2QOf86DQpK1+F9j6VZ7V2x9h6VoJ8GJDkMJ1DGV/7FJhtpI6rtfyiW68w
	STT7P3e+tw0PT0acxKkRHXEc4tyNYg7zSi6lm/E3Aco3Rbzz0fvL2nRwXv5OT1yEe+X0
	CW2gDMR8B6klASHOmqueik+xGrgzFKezwi66XZQsZGr2YbVUPCLGbGjrlOXPrhYeZzFs
	GPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jSbvcvtEyF8T75AFnbnpsluRGyEbasyz3RzBr1CEUgY=;
	b=TVN6MzVnWv2fxAMywM6Py4bmLM4HOpJEPl7mFmMhWi5S7I4wzENPQ6w2zpMFJ0Rq0M
	gz1V/5vc7XAaBeWbhT2u2TAEQRpOxirm9rp3jrqtzL+1gs0h5j793zEFS42rcAPU0uqb
	fOhuImXysHGdtNU8j3FCcheD7wMLuB4EaciJx4ce4OK96eGP4SbCaoe7knSPSOuXsHJ4
	iLrikPJCERpM/dwhZVFHyhQjftrWU4l+kMSUXVx0kcc4vMKZfPpXL6X32Tw095OClYPS
	In42n3D4AWCymjnaJ3Y/hVy9IuTqwkMu0UNYxwmd0wj0nWqibeUvYUEtpcS/jNeyz3ji
	5tHQ==
X-Gm-Message-State: APjAAAWBz8Gp6lSh/3dJmg1dmjT8n2JpUHr6HKbwvWMPbg4BZMMkVFCu
	Rx813rXIoEke/z0nmh7HYgrmsvXg6ec=
X-Google-Smtp-Source: APXvYqxDaSihzuXy8jaUq/IOU2cUB5p4P1r33Ube79Hfu9+JLl/gNn5e+FQzmJ+YwsihPWPd3N8ESQ==
X-Received: by 2002:a17:902:aa8a:: with SMTP id
	d10mr33875316plr.154.1562690406103; 
	Tue, 09 Jul 2019 09:40:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j13sm20732835pfh.13.2019.07.09.09.40.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 09:40:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 09:39:58 -0700
Message-Id: <20190709163958.26825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH v3] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Tue, 09 Jul 2019 16:40:05 -0000
Content-Transfer-Encoding: 8bit

efivar.h is in usr/include/efirvar directory so it should be
added to include search path via -I to compiler cmdline to fix

make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
| make[1]: *** Waiting for unfinished jobs....

When running clang to generate dependencies -MM -MG -MF it still
parses the compile unit and complains if certain header is not found
where as gcc does not do that, hence the compile error is only seen
when compiling with clang.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Use a backported patch instead of workaround

 ...8ae0bce776a36ea2001dea63d376be8274ac.patch | 83 +++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
new file mode 100644
index 0000000000..9525ed8c54
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
@@ -0,0 +1,83 @@
+From 97668ae0bce776a36ea2001dea63d376be8274ac Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 6 Mar 2019 13:08:33 -0500
+Subject: [PATCH] Make sure PKGS= is propogated into the submake for "make
+ deps"
+
+When we're doing make deps with "$(CC) -MF", gcc and clang have different
+behavior, both broken in different ways, which we're hitting because of a
+missing -I argument for libefivar's includes.  On clang, when a header can't
+be found, it emits a rule with the header as a prerequisite without a path,
+such as efivar.h here:
+
+efibootmgr.o: efibootmgr.c fix_coverity.h efivar.h efiboot.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+  error.h
+
+Then the build that utilizes that rule will fail to find the
+prerequisite and tell you something like:
+
+make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
+make[1]: Leaving directory '/home/pjones/devel/github.com/efibootmgr/master/src'
+
+With gcc, when a header can't be found, it emits a rule without that header
+as a prerequisite, as such (again with efivar.h):
+
+efibootmgr.o: efibootmgr.c fix_coverity.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+ error.h
+
+And then your build will fail if you haven't adjusted CFLAGS to tell it
+where to find the header.
+
+Both of these would be better just erroring, but at least gcc's doesn't
+insert a *wrong* dependency.
+
+This patch adds "PKGS=efivar efibootmgr popt" for all deps under src/.
+Technically that's overkill, as efibootmgr itself doesn't need popt, but it
+doesn't hurt anything to have the extra part there.  The resulting
+.efibootmgr.d file has the prerequisites expressed correctly:
+
+efibootmgr.o: efibootmgr.c fix_coverity.h /usr/include/efivar/efivar.h \
+ /usr/include/efivar/efiboot.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+ error.h
+
+This fixes the issue described in github PR #96
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Upstream-Status: Backport [https://github.com/rhboot/efibootmgr/commit/97668ae0bce776a36ea2001dea63d376be8274ac]
+---
+ src/Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 258bac1..32fa188 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -31,8 +31,13 @@ efibootdump : PKGS=efivar efiboot popt
+ efibootnext : $(call objects-of,$(EFIBOOTNEXT_SOURCES))
+ efibootnext : PKGS=efivar efiboot popt
+ 
++deps : PKGS=efivar efiboot popt
+ deps : $(ALL_SOURCES)
+-	$(MAKE) -f $(TOPDIR)/Make.deps deps SOURCES="$(ALL_SOURCES)" SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)"
++	$(MAKE) -f $(TOPDIR)/Make.deps \
++		SOURCES="$(ALL_SOURCES)" \
++		SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)" \
++		PKGS="$(PKGS)" \
++		deps
+ 
+ clean :
+ 	@rm -rfv *.o *.a *.so $(TARGETS)
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 0e5a81e316..5d6f200a73 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
            file://0001-remove-extra-decl.patch \
+           file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
           "
 SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 
-- 
2.22.0


