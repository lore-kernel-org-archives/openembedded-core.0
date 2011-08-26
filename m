Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QwzOi-00020X-7i
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:36:48 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QwzK2-0005tC-SO from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:31:59 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 26 Aug 2011 18:31:57 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 21:31:53 +0500
Message-Id: <cd76d454663469daf196ebac80eab51de527f19c.1314370503.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314370503.git.noor_ahsan@mentor.com>
References: <cover.1314370503.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 26 Aug 2011 16:31:58.0178 (UTC)
	FILETIME=[ACB4BC20:01CC640D]
Subject: [meta-oe][PATCH 2/4] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Fri, 26 Aug 2011 16:36:48 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id bac6441118e0b78d55c98afdc108f03b6c655909.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../lmbench/lmbench-3.0-a9/obey-ranlib.patch       |   30 ++++
 .../lmbench-3.0-a9/update-results-script.patch     |  160 ++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench/lmbench-run  |   23 +++
 .../lmbench/lmbench/rename-line-binary.patch       |   19 +++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   56 +++++++
 5 files changed, 288 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
new file mode 100644
index 0000000..41a3b32
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
@@ -0,0 +1,30 @@
+In some cases the host may have too old of a ranlib to work.  Since it's
+not exactly a great idea to not be using the cross ranlib anyhow, fix the
+Makefile so we can override ranlib and then override it
+
+Upstream-Status: Inappropriate [build system specific change]
+---
+ src/Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: lmbench-3.0-a9/src/Makefile
+===================================================================
+--- lmbench-3.0-a9.orig/src/Makefile
++++ lmbench-3.0-a9/src/Makefile
+@@ -38,6 +38,7 @@ CC=`../scripts/compiler`
+ MAKE=`../scripts/make`
+ AR=ar
+ ARCREATE=cr
++RANLIB=ranlib
+ 
+ # base of installation location
+ BASE=/usr/local
+@@ -217,7 +218,7 @@ $O/lmbench : ../scripts/lmbench version.
+ $O/lmbench.a: $(LIBOBJS)
+ 	/bin/rm -f $O/lmbench.a
+ 	$(AR) $(ARCREATE) $O/lmbench.a $(LIBOBJS)
+-	-ranlib $O/lmbench.a
++	-$(RANLIB) $O/lmbench.a
+ 
+ $O/lib_timing.o : lib_timing.c $(INCS)
+ 	$(COMPILE) -c lib_timing.c -o $O/lib_timing.o
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
new file mode 100644
index 0000000..894f146
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
@@ -0,0 +1,160 @@
+Now that we have our binaries in /usr/bin rather than the normal
+lmbench hierarchy we need to update the scripts as well to behave well here.
+
+Upstream-Status: Inappropriate [This is related to the OE-specific behavior
+of installing into /usr/bin, etc, rather than dumping everything into 
+/usr/share/lmbench or similar]
+
+Index: lmbench-3.0-a9/scripts/results
+===================================================================
+--- lmbench-3.0-a9.orig/scripts/results
++++ lmbench-3.0-a9/scripts/results
+@@ -8,11 +8,11 @@ RESULTS=results/$OS
+ BASE=../$RESULTS/`uname -n`
+ EXT=0
+ 
+-if [ ! -f "../bin/$OS/$CONFIG" ]
++if [ ! -f "$CONFIG" ]
+ then	echo "No config file?"
+ 	exit 1
+ fi
+-. ../bin/$OS/$CONFIG
++. $CONFIG
+ 
+ if [ ! -d ../$RESULTS ]
+ then	mkdir -p ../$RESULTS
+@@ -23,11 +23,9 @@ do      EXT=`expr $EXT + 1`
+ 	RESULTS=$BASE.$EXT
+ done
+ 
+-cd ../bin/$OS 
+-PATH=.:${PATH}; export PATH
+ export SYNC_MAX
+ export OUTPUT
+-lmbench $CONFIG 2>../${RESULTS}
++lmbench $CONFIG 2>${RESULTS}
+ 
+ if [ X$MAIL = Xyes ]
+ then	echo Mailing results
+Index: lmbench-3.0-a9/scripts/config-run
+===================================================================
+--- lmbench-3.0-a9.orig/scripts/config-run
++++ lmbench-3.0-a9/scripts/config-run
+@@ -132,20 +132,20 @@ export LMBENCH_SCHED
+ ############################################################################
+ echo $L; echo "";
+ echo "Hang on, we are calculating your timing granularity."
+-../bin/$OS/msleep 250
+-ENOUGH=`../bin/$OS/enough`
++msleep 250
++ENOUGH=`enough`
+ export ENOUGH 
+ echo "OK, it looks like you can time stuff down to $ENOUGH usec resolution."
+ echo ""
+ echo "Hang on, we are calculating your timing overhead."
+-../bin/$OS/msleep 250
+-TIMING_O=`../bin/$OS/timing_o`
++msleep 250
++TIMING_O=`timing_o`
+ export TIMING_O
+ echo "OK, it looks like your gettimeofday() costs $TIMING_O usecs."
+ echo ""
+ echo "Hang on, we are calculating your loop overhead."
+-../bin/$OS/msleep 250
+-LOOP_O=`../bin/$OS/loop_o`
++msleep 250
++LOOP_O=`loop_o`
+ export LOOP_O
+ echo "OK, it looks like your benchmark loop costs $LOOP_O usecs."
+ echo ""
+@@ -177,7 +177,7 @@ then
+ fi
+ if [ X$MB = X ]
+ then	$ECHON "Probing system for available memory: $ECHOC"
+-	MB=`../bin/$OS/memsize 4096`
++	MB=`memsize 4096`
+ fi
+ TOTAL_MEM=$MB
+ MB=`echo \( $MB \* 7 \) / 10 | bc 2>/dev/null`
+@@ -205,9 +205,9 @@ fi
+ # Certain machines tend to barf when you try and bcopy 8MB.
+ # Figure out how much we can use.
+ echo "Checking to see if you have $MB MB; please wait for a moment..."
+-MB=`../bin/$OS/memsize $MB`
+-MB=`../bin/$OS/memsize $MB`
+-MB=`../bin/$OS/memsize $MB`
++MB=`memsize $MB`
++MB=`memsize $MB`
++MB=`memsize $MB`
+ if [ `expr $SYNC_MAX \* $MB` -gt `expr $TOTAL_MEM` ]
+ then
+ 	MB=`expr $TOTAL_MEM / $SYNC_MAX`
+@@ -223,8 +223,8 @@ then	echo Warning: you have only ${MB}MB
+ fi
+ 
+ echo "Hang on, we are calculating your cache line size."
+-../bin/$OS/msleep 250
+-LINE_SIZE=`../bin/$OS/lm_line -M ${MB}M`
++msleep 250
++LINE_SIZE=`lm_line -M ${MB}M`
+ export LINE_SIZE
+ echo "OK, it looks like your cache line is $LINE_SIZE bytes."
+ echo ""
+@@ -479,7 +479,7 @@ EOF
+ 	then	
+ 		for i in $disks
+ 		do	if [ -r $i ]
+-			then	../bin/$OS/flushdisk $i
++			then	flushdisk $i
+ 				if [ $? -eq 1 ]
+ 				then	echo "Must be root to run disk benchmarks."
+ 					echo "Root is needed to flush the buffer cache"
+@@ -584,7 +584,7 @@ fi
+ echo $L
+ echo ""
+ echo "Calculating mhz, please wait for a moment..."
+-MHZ=`../bin/$OS/mhz`
++MHZ=`mhz`
+ cat<<EOF
+ I think your CPU mhz is 
+ 
+@@ -689,9 +689,9 @@ esac
+ 
+ INFO=`../scripts/info`
+ if [ $MAIL = yes ]
+-then	if [ ! -f ../bin/$OS/$INFO ]
+-	then	cp ../scripts/info-template ../bin/$OS/$INFO
+-		chmod +w ../bin/$OS/$INFO
++then	if [ ! -f $INFO ]
++	then	cp ../scripts/info-template $INFO
++		chmod +w $INFO
+ 		REUSE=no
+ 	else	
+ 		REUSE=view
+@@ -705,7 +705,7 @@ then	if [ ! -f ../bin/$OS/$INFO ]
+ 				;;
+ 			[Vv]*)	REUSE=view
+ 				echo $L
+-				more ../bin/$OS/$INFO
++				more $INFO
+ 				echo $L
+ 				;;
+ 	    		*)	REUSE=yes
+@@ -733,7 +733,7 @@ EOF
+ 		then	EDITOR=$TMP
+ 		fi
+ 		if [ X$EDITOR != "none" ]
+-		then	$EDITOR ../bin/$OS/`../scripts/info`
++		then	$EDITOR `../scripts/info`
+ 		fi
+ 	fi
+ fi
+@@ -750,7 +750,7 @@ EOF
+ 
+ VERSION=`../scripts/version`
+ 
+-C=../bin/$OS/`../scripts/config`
++C=`../scripts/config`
+ echo DISKS=\"$DISKS\" > $C
+ echo DISK_DESC=\"$DISK_DESC\" >> $C
+ echo OUTPUT=$OUTPUT >> $C
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
new file mode 100644
index 0000000..e904c75
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
@@ -0,0 +1,23 @@
+#!/bin/sh
+# Wrapper script for lmbench written for the 
+# Debian GNU/Linux distribution by 
+# Javier Fernandez-Sanguino.
+# Distributed under the GPL
+SHAREDIR=/usr/share/lmbench/
+BINDIR=/usr/lib/lmbench/
+SCRIPTSDIR=$SHAREDIR/scripts
+RESULTSDIR=$SHAREDIR/results
+CONFIG=/var/lib/lmbench/config/`$SCRIPTSDIR/config`
+runuid=`id -u`
+
+[ $runuid -gt 0 ] && {
+	echo "You must run this as the root user"
+	exit 0
+}
+cd $SCRIPTSDIR 
+[ ! -f $CONFIG ] && ./config-run
+./results
+
+echo "Benchmark run finished...."
+echo "Remember you can find the results of the benchmark "
+echo "under $RESULTSDIR"
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
new file mode 100644
index 0000000..9a40521
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
@@ -0,0 +1,19 @@
+Both lmbench and util-linux-ng packages provide own /usr/bin/line binaries.
+Even though the binaries name is the same, their functionality is different.
+This patch renames lmbench's line binary as lm_line to avoid conflicts with
+util-linux-ng.  script/config-run is also modified (patch) to call lm_line
+instead of line.
+
+Upstream-Status: Inappropriate [build system specific change]
+
+--- patches/scripts/config-run	2006-11-26 15:11:04.000000000 -0500
++++ patches/scripts/config-run	2011-04-01 09:35:50.000000000 -0400
+@@ -224,7 +224,7 @@ fi
+ 
+ echo "Hang on, we are calculating your cache line size."
+ ../bin/$OS/msleep 250
+-LINE_SIZE=`../bin/$OS/line -M ${MB}M`
++LINE_SIZE=`../bin/$OS/lm_line -M ${MB}M`
+ export LINE_SIZE
+ echo "OK, it looks like your cache line is $LINE_SIZE bytes."
+ echo ""
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
new file mode 100644
index 0000000..cc04792
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Tools for performance analysis."
+HOMEPAGE = "http://lmbench.sourceforge.net/"
+SECTION = "console/utils"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"
+RDEPENDS_${PN} = "debianutils"
+
+PR = "r0"
+
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
+	   file://lmbench-run \
+	   file://rename-line-binary.patch \
+	   file://update-results-script.patch \
+	   file://obey-ranlib.patch \
+	   "
+SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
+SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
+
+EXTRA_OEMAKE = 'CC="${CC}" AR="${AR}" RANLIB="${RANLIB}" CFLAGS="${CFLAGS}" \
+		LDFLAGS="${LDFLAGS}" LD="${LD}" OS="${TARGET_SYS}" \
+		TARGET="${TARGET_OS}" BASE="${prefix}"'
+
+do_configure() {
+	:
+}
+
+do_compile () {
+	. ${CONFIG_SITE}
+	if [ X"$ac_cv_uint" = X"yes" ]; then
+		CFLAGS="${CFLAGS} -DHAVE_uint"
+	fi
+	install -d ${S}/bin/${TARGET_SYS}
+	oe_runmake -C src
+}
+
+do_install () {
+	install -d ${D}${localstatedir}/run/lmbench \
+		   ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
+		   ${D}${datadir}/lmbench/scripts
+	oe_runmake 'BASE=${D}${prefix}' \
+		    -C src install
+	mv ${D}${bindir}/line ${D}${bindir}/lm_line
+	mv ${D}${prefix}/man/* ${D}${mandir}/
+	install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
+	sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \
+	       -e 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \
+	       -e 's,^CONFIG=.*$,CONFIG=$SHAREDIR/`$SCRIPTSDIR/config`,;' \
+	       ${D}${bindir}/lmbench-run
+	install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
+	install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
+}
+
+FILES_${PN} += "${datadir}/lmbench"
-- 
1.7.0.4



