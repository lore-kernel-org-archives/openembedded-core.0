Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RweW3-0006rL-8L
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Feb 2012 19:51:15 +0100
Received: by eekd41 with SMTP id d41so1334937eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 10:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.14.120.74 with SMTP id o50mr1567677eeh.18.1329072186571;
	Sun, 12 Feb 2012 10:43:06 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id c16sm51644430eei.1.2012.02.12.10.43.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Feb 2012 10:43:05 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Feb 2012 20:42:58 +0200
Message-Id: <1329072178-18881-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkMGKBJ8xjWQJAlDqmqctj2UaSNKRCJVANDKMz3sm86BsgttlhmRc6M9SJRKbrTs6AvuK0q
Subject: [PATCH] nspr: Compile nspr with tests 1. Compile package tests suite 2. Add patch for removing rpath from binaries 3. Add tests to -dev rpm as it needs dev libraries
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
X-List-Received-Date: Sun, 12 Feb 2012 18:51:15 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../nspr/files/remove-rpath-from-tests.patch       |   21 +++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |  134 +++++++++++++++++++-
 2 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch

diff --git a/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
new file mode 100644
index 0000000..819c784
--- /dev/null
+++ b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
@@ -0,0 +1,21 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Thu Feb 9 00:03:38 2012 +0200
+
+Avoid QA warnings by removing hardcoded rpath from binaries.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: nspr-4.8.9/mozilla/nsprpub/pr/tests/Makefile.in
+===================================================================
+--- nsprpub.orig/pr/tests/Makefile.in	2012-02-11 00:01:10.476220505 +0200
++++ nsprpub/pr/tests/Makefile.in	2012-02-10 23:57:40.000000000 +0200
+@@ -379,7 +379,7 @@
+ endif
+ 
+ ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
+-    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
++    LDOPTS += -Xlinker
+     ifeq ($(USE_PTHREADS),1)
+         EXTRA_LIBS = -lpthread
+     endif
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index da324fc..c68599c 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,17 +5,135 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+           file://remove-rpath-from-tests.patch"
 
-SRC_URI += "file://nspr.pc.in "
+SRC_URI += "file://nspr.pc.in"
 
 SRC_URI[md5sum] = "60770d45dc08c0f181b22cdfce5be3e8"
 SRC_URI[sha256sum] = "ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c333e692650207103d1cce"
 
 S = "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
 
+TESTS = "runtests.pl \
+    runtests.sh \
+    accept \
+    acceptread \
+    acceptreademu \
+    affinity \
+    alarm \
+    anonfm \
+    atomic \
+    attach \
+    bigfile \
+    cleanup \
+    cltsrv  \
+    concur \
+    cvar \
+    cvar2 \
+    dlltest \
+    dtoa \
+    errcodes \
+    exit \
+    fdcach \
+    fileio \
+    foreign \
+    formattm \
+    fsync \
+    gethost \
+    getproto \
+    i2l \
+    initclk \
+    inrval \
+    instrumt \
+    intrio \
+    intrupt \
+    io_timeout \
+    ioconthr \
+    join \
+    joinkk \
+    joinku \
+    joinuk \
+    joinuu \
+    layer \
+    lazyinit \
+    libfilename \
+    lltest \
+    lock \
+    lockfile \
+    logfile \
+    logger \
+    many_cv \
+    multiwait \
+    nameshm1 \
+    nblayer \
+    nonblock \
+    ntioto \
+    ntoh \
+    op_2long \
+    op_excl \
+    op_filnf \
+    op_filok \
+    op_nofil \
+    parent \
+    parsetm \
+    peek \
+    perf \
+    pipeping \
+    pipeping2 \
+    pipeself \
+    poll_nm \
+    poll_to \
+    pollable \
+    prftest \
+    primblok \
+    provider \
+    prpollml \
+    ranfile \
+    randseed \
+    reinit \
+    rwlocktest \
+    sel_spd \
+    selct_er \
+    selct_nm \
+    selct_to \
+    selintr \
+    sema \
+    semaerr \
+    semaping \
+    sendzlf \
+    server_test \
+    servr_kk \
+    servr_uk \
+    servr_ku \
+    servr_uu \
+    short_thread \
+    sigpipe \
+    socket \
+    sockopt \
+    sockping \
+    sprintf \
+    stack \
+    stdio \
+    str2addr \
+    strod \
+    switch \
+    system \
+    testbit \
+    testfile \
+    threads \
+    timemac \
+    timetest \
+    tpd \
+    udpsrv \
+    vercheck \
+    version \
+    writev \
+    xnotify \
+    zerolen"
+
 inherit autotools
 
 do_configure() {
@@ -26,12 +144,20 @@ do_compile_prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
 }
 
+do_compile_append() {
+	oe_runmake -C pr/tests
+}
+
 do_install_append() {
     install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
+    cd ${S}/pr/tests
+    mkdir -p ${D}/opt/nspr_tests
+    install -m 0755 ${TESTS} ${D}/opt/nspr_tests
 }
 
-
+FILES_${PN}-dev += "/opt/nspr_tests/*"
+FILES_${PN}-dbg += "/opt/nspr_tests/.debug/*"
-- 
1.7.5.4



