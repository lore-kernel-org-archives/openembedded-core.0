Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3D88C7CE5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:18:32 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id q128so4559172ywg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a/Rf/qXp8R0NcDpAikGWE20Vg0EAn+tMyIW962xD6Fo=;
	b=K/wbDXhvsrRaDtGENCJ0VprI3EJCBCVdmYewmqeErnU5PUNCLv5yrzhB6Q7wX5R1BN
	RhYbgur5tVCq0yzrzV9ui43z2lwQOs6Th3NCM3HbuklnHtGPpj4cqVUtnJQrCH7DV3MG
	pkn8/KLXOaluGJI17hJN9JkwMRlBFY58KWChD1kJQN1HfMAa71I8cwjchaEWiRimO1nm
	7/fmnf5mtviBhEkfYXUfTW44RoHgGxpX9PIiIZAltbEBYh2zsjcdPhqZVkIwvdLcnoWp
	6Nn4K+UnCwGfGZ9iDtMpv3rTEkGIXdLpCNRjfzPCIbPxfdANDHHdtNzV41Mod+Cusisl
	Ll6w==
X-Gm-Message-State: APjAAAW29kJPqW6TQnog3jy+FXyg0lqFzOm3QLq7hEs579GzUKX/kC0T
	guWkqsc+T4KHKsWFOWjBRcy7yy3M3uM=
X-Google-Smtp-Source: APXvYqx6LsWlnK3hi1vN7JUwVaLAXmyX+uRLq/JUpi6tcvVskUK51DACtd3xi1pH693quyNPCNWhaw==
X-Received: by 2002:a25:8751:: with SMTP id e17mr2531542ybn.160.1553170712912; 
	Thu, 21 Mar 2019 05:18:32 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d9sm1559028ywd.82.2019.03.21.05.18.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:18:30 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:18:28 +0000
Message-Id: <20190321121828.11445-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [RFC][PATCH] package.bbclass: allow additional implementations for dependencies
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
X-List-Received-Date: Thu, 21 Mar 2019 12:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The existing code in here is pretty much hard-coded to
extract package RDEPENDS based on information obtained
from elf files, i.e. by looking at the NEEDED entries,
and it appears pretty much impossible to extend this.

There are use-cases, where automatic inter-package
and recipe dependency tracking is useful for other types
of files, e.g. in Java world one could parse the .jar
files' MANIFEST.MF to extract information very similar
to that extracted from elf files, and then create the
packages with that information applied. JAR files are
simply another form of shared library.

Currently, it is rather hard to impossible to add
such functionality to be executed at the right time,
i.e. before read_shlibdeps() is executed (which itself
adds that information to each package's RDEPENDS).

Introduce the infrastructure to be able to do so. The
expectation is that some filetype specific additional
bbclass (e.g. a Java JAR file specific one to stay with
above example) extends PACKAGE_DEP_FUNCS with a function
to ultimately create files with layout/contents similar
to what is already done in existing files matching
PACKAGE_LIBDEPS_EXTENSIONS during the package build
process - based on the interdependency information from
that specific filetype, e.g. JAR - and store that in a
new file in the same directory as existing .shlibdeps,
.pcdeps, etc. (pkgdest) and whose suffix is to be added to
PACKAGE_LIBDEPS_EXTENSIONS.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/package.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4c0a859536..0af282fbef 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1970,12 +1970,13 @@ python package_do_pkgconfig () {
             fd.close()
 }
 
+PACKAGE_LIBDEPS_EXTENSIONS ?= ".shlibdeps .pcdeps .clilibdeps"
 def read_libdep_files(d):
     pkglibdeps = {}
     packages = d.getVar('PACKAGES').split()
     for pkg in packages:
         pkglibdeps[pkg] = {}
-        for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
+        for extension in d.getVar('PACKAGE_LIBDEPS_EXTENSIONS').split():
             depsfile = d.expand("${PKGDEST}/" + pkg + extension)
             if os.access(depsfile, os.R_OK):
                 fd = open(depsfile)
@@ -2156,13 +2157,19 @@ PACKAGEBUILDPKGD ?= " \
 PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
                 populate_packages"
+# Functions that generate dependencies based on
+# elf NEEDED, pkgconfig, etc. This can be extended
+# to handle other file types.
+PACKAGE_DEP_FUNCS ?= " \
+                package_do_filedeps \
+                package_do_shlibs \
+                package_do_pkgconfig \
+                "
 # Functions which process metadata based on split packages
 PACKAGEFUNCS += " \
                 package_fixsymlinks \
                 package_name_hook \
-                package_do_filedeps \
-                package_do_shlibs \
-                package_do_pkgconfig \
+                ${PACKAGE_DEP_FUNCS} \
                 read_shlibdeps \
                 package_depchains \
                 emit_pkgdata"
-- 
2.20.1


