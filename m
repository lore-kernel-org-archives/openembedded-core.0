Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 2B8DB6CEE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:13:20 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 8BC1F1C003E;
	Thu, 29 Nov 2018 10:13:21 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:13:12 +1300
Message-Id: <20181128211319.16648-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128211319.16648-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128211319.16648-1-douglas.royds@taitradio.com>
Subject: [PATCH v3 1/8] ptest: Reproducibility: Strip build host paths from any installed Makefile
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
X-List-Received-Date: Wed, 28 Nov 2018 21:13:21 -0000

A common pattern for ptest is to install a Makefile that provides a make check
target. These generated Makefiles are normally full of build host paths, to
hosttools, and to files and scripts within the source or build tree. They also
commonly include the CFLAGS and CPPFLAGS. None of these build host paths
can possibly work on-target, so stripping them has no effect on the success of
the resulting ptests.

Stripping the HOSTTOOLS_DIR has this effect, for instance:

    -MKDIR_P = /home/douglas/workspace/upstream/build/tmp/hosttools/mkdir -p
    +MKDIR_P = mkdir -p

The curious WORKDIR/*= pattern avoids non-parseable -fdebug-prefix-map patterns
in the CFLAGS by adding an arbitrary ".", eg:

    -fdebug-prefix-map=.=/usr/src/debug/rsyslog/8.37.0-r0

In all other cases, we simply remove the WORKDIR, eg:

    CPP = arm-tait-linux-gnueabi-gcc -E --sysroot=recipe-sysroot ...

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/ptest.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 9d8a79854a..fa518f6d45 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -3,6 +3,8 @@ DESCRIPTION_${PN}-ptest ?= "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purposes."
 
 PTEST_PATH ?= "${libdir}/${BPN}/ptest"
+PTEST_BUILD_HOST_FILES ?= "Makefile"
+
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
@@ -45,6 +47,17 @@ do_install_ptest_base() {
     fi
     do_install_ptest
     chown -R root:root ${D}${PTEST_PATH}
+
+    # Strip build host paths from any installed Makefile
+    for filename in ${PTEST_BUILD_HOST_FILES}; do
+        for installed_ptest_file in $(find ${D}${PTEST_PATH} -type f -name $filename); do
+            bbnote "Stripping host paths from: $installed_ptest_file"
+            sed -e 's#${HOSTTOOLS_DIR}/*##g' \
+                -e 's#${WORKDIR}/*=#.=#g' \
+                -e 's#${WORKDIR}/*##g' \
+                -i $installed_ptest_file
+        done
+    done
 }
 
 do_configure_ptest_base[dirs] = "${B}"
-- 
2.17.1


