Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 308737E6EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 02:14:43 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t3so3610797ioj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hYU82N4LgOLZdYQWCO7FOZYcH43MIxRy2bEDVSoS2Nk=;
	b=cFObnfX9rKU26qkuM8XN+s+qzyc9PhLq51km/bFoLHu1rJ9T0fLSCcPUxhOlDzpaZE
	IiQNRR4oLdJYHK/d+jfeZ7q0+C35egBHGZ9xPKkWegF2BJqVUX5oTWZEeGFFcSSYzOZd
	PhfVG4uOdWQIa1gd7ahJ0BXyIIRXQMrYJmQJxCxCt4CxFIbq+lNyxFiLoTb1HPirtgDg
	RuiUButWwYr14lX3eNydEl+Ne57Opt3I5Ysyu9w4sGcq9nTkRBzYE3dygOK2h9/5LTgx
	jxnRHt8a+ggTVSKIw/cZ4nRmLvu8rhGavWbdL/lRUscJmXWqOJbek01em0YznpWyRUVp
	40bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hYU82N4LgOLZdYQWCO7FOZYcH43MIxRy2bEDVSoS2Nk=;
	b=dqUWNZqvrhmFGZrVeOtgxyOtMSVxwB/+tD6JQLyyQXjuersNy7HIMVMUMwFsa/5ZZX
	W3C1CL7379MQr3c9TiN56turr2JnxUSh4JXtrB1Vl02EqoHxWS/WBgj7b0H71SzjTyaq
	RL7WMghf/wA8qSLzbq7U7ygcHLb2NKUW2LcLjXTT/ujcW5fALn10/GCyrmWM/POBY9OM
	R54sBWuVHl5YvcIu/lo/cviIB2PCfLt9rspHniegJW4nScOQ5lngmOWn9QqYpXFnt/vY
	6JMVqX7UUVOeSh2dMlnhB9RKori+2Mpby9WuaK5MakdR4PtwPmFAhT0qohtTWHLWqiVg
	IrKA==
X-Gm-Message-State: APjAAAWAMNbjU7RKhqISERSlKJCNFHWzt4jcGBWPzb5ur44C4CjwHhns
	T6iXMxQYbliiIbH4a2zm8gI=
X-Google-Smtp-Source: APXvYqw/WX8ELh0TfogOLsbLexRi39lvIrGvMkfuOR0x9Q0vbT8SQ7TlthRCrGDhmsb6OrxUkWEtFw==
X-Received: by 2002:a6b:e317:: with SMTP id u23mr9059648ioc.38.1567044883851; 
	Wed, 28 Aug 2019 19:14:43 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id w14sm638124ioa.46.2019.08.28.19.14.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 19:14:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 22:14:41 -0400
Message-Id: <20190829021441.32058-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 02:14:43 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The upstream kernel can now handle python3 for the perf scripts, coupled
with the impending EOL of python2, we switch the dependencies in perf
(scripting) to python3.

Outside of dependency changes, we also pass the following two variables
to the perf build: PYTHON=python3 PYTHON_CONFIG=python3-config. To
ensure that our python3 components are used.

For configurations that disable perf scripting, there is no change in
behaviour.

[YOCTO #13358]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2:
  - tested against 4.19, 5.0 and 5.2+
  - broadened search path for scripts
  - added /usr/bin/python to the fixup list

 meta/recipes-kernel/perf/perf.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4e603f1a32..af0410c88d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
@@ -44,8 +44,8 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
-inherit python-dir
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
 #kernel 3.1+ supports WERROR to disable warnings as errors
@@ -94,6 +94,7 @@ EXTRA_OEMAKE += "\
     'sharedir=${@os.path.relpath(datadir, prefix)}' \
     'mandir=${@os.path.relpath(mandir, prefix)}' \
     'infodir=${@os.path.relpath(infodir, prefix)}' \
+    ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'PYTHON=python3 PYTHON_CONFIG=python3-config', '', d)} \
 "
 
 # During do_configure, we might run a 'make clean'. That often breaks
@@ -132,7 +133,7 @@ do_install() {
 	oe_runmake install
 	# we are checking for this make target to be compatible with older perf versions
 	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
-		oe_runmake DESTDIR=${D} install-python_ext
+	    oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
 
@@ -232,8 +233,10 @@ do_configure_prepend () {
     fi
 
     # use /usr/bin/env instead of version specific python
-    for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
+    for s in `find ${S}/tools/perf/ -name '*.py'`; do
+        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
@@ -252,9 +255,9 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
+RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =+ "python"
+RDEPENDS_${PN}-tests =+ "python3"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
2.19.1


