Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68260FBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 22:55:25 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d62so11178484oia.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=6pESJudeLsPKqzMNRHEahGi1xyQgl5v16ftb0dzgfOM=;
	b=uVuTKWFMx3IrcfYo+4pFVN1b+JU+lz2fzc0R1+NdLkixNRLoL65u3oUtjWThz0+SvE
	0V6YUXXH7bhUXrcGlkP7nMtOI0mMdQN327LOn5MmRgXkN+sBemuug2mDCDwkJ24U6Guk
	OOtTCa+V9YLWq1NyW9ffclrsv1Q9XSbfWsPk6TykEKk8bcHYzhOSQQGZuWqP8zwBA8mP
	vpqiHYVOgSI+oCUMP2AyENypcylUX/05AcDXhsivu2V27q4m4rSwJJhYPI8K+qMLDQL3
	EjXov4zjPZwGVrwfct2g8R5aKUEFhDN8TBLd/xdJum1VCElfRkcuRG7lP2j8X831jBdN
	rdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=6pESJudeLsPKqzMNRHEahGi1xyQgl5v16ftb0dzgfOM=;
	b=YMzEQ2JpuoMPG5aVPdam4mZKQs56tecd2CxcN3ACe8AgQFg8eIi2g0iAiRe/9HF3Zn
	asf4EvHYkpyRem6sJvll9wZhjySWHaoQ3PAw8ApgaEPd7L3HCFbQaAcJE9pMepIfNmnc
	C4JzA1wMZYmpK1vFz0L07ptJGmGvsf/8tAFgUZAvfH3lkkbPyarnnm5SSE071xgD67AN
	gJdrWZ9Nh99iHsUf/G33mpDTn4vOETfQSMXINoEIYdZ/ocOMAlVmsRPeuLE1bgMKyYJo
	CO7oJ74JPTOt3RfGI7Tm2whHi/NT11/bZ8GtguVYTXDi0ieoTreRT+amzdjWO7YfGu+4
	b98A==
X-Gm-Message-State: ANhLgQ3hZJPZPdgHzw3rjh9VJyPWdoKqxvnwy1Upb+Fp9v+WcX4k7VV3
	p0fWXVkOXkf0J5w6Mn3DMjjeFs+ydhQ=
X-Google-Smtp-Source: ADFU+vsERZ8/cdKwnE85GqtLQum5cYAsbJR9yEV2N19dvRuS/ICZ0lr2bGjSYT3LaJDsizS4X8WAhQ==
X-Received: by 2002:aca:af97:: with SMTP id y145mr8628671oie.24.1584140126549; 
	Fri, 13 Mar 2020 15:55:26 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	202sm2507908oie.38.2020.03.13.15.55.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 15:55:25 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 22A602A0404; Fri, 13 Mar 2020 15:55:24 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 15:55:22 -0700
Message-Id: <20200313225522.24175-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] ltp: make multilib installable.
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
X-List-Received-Date: Fri, 13 Mar 2020 22:55:26 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Many of ltp's tests are of syscalls and libc content. Enable installing
mulitpule abi's.

Use prefix consistently rather then hardcoded /opt/ltp everywhere.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-extended/ltp/ltp_20200120.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index 3e6cbc63f3..deac3917d7 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -45,8 +45,8 @@ inherit autotools-brokensep
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
+export prefix = "/opt/${PN}"
+export exec_prefix = "/opt/${PN}"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
@@ -55,7 +55,7 @@ EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite --w
 EXTRA_OECONF += " --without-tirpc "
 
 do_install(){
-    install -d ${D}/opt/ltp/
+    install -d ${D}${prefix}/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
 
     # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
@@ -64,10 +64,10 @@ do_install(){
     # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
     # http://khack.osdl.org to retrieve ltp test results run on
     # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
-    rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
+    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
 
-    # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
-    cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+    # Copy POSIX test suite into ${D}${prefix}/testcases by manual
+    cp -r testcases/open_posix_testsuite ${D}${prefix}/testcases
 
     # Makefile were configured in the build system
     find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
@@ -101,10 +101,10 @@ RDEPENDS_${PN} = "\
     tar \
 "
 
-FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/* /opt/ltp/testcases/data/nm01/lib.a /opt/ltp/lib/libmem.a"
+FILES_${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
 # Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
-INHIBIT_PACKAGE_STRIP_FILES = "/opt/ltp/testcases/bin/nm01 /opt/ltp/testcases/bin/ldd01"
+INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
 INSANE_SKIP_${PN} += "already-stripped staticdev"
 
 # Avoid file dependency scans, as LTP checks for things that may or may not
-- 
2.13.3


