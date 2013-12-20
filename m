Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9875C60DFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:06:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKC6AAH005345 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:06:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bkuBvjNCXqge
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:06:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKC66bq005342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:06:07 GMT
Message-ID: <1387541162.6402.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Dec 2013 12:06:02 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Convert to use ':' as a filename sperator and use SSTATE_SWSPEC globally
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
X-List-Received-Date: Fri, 20 Dec 2013 12:06:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the code has problems differentiating between "gcc-cross" and "gcc-cross-initial"
sstate files. We could add in a ton of special casing but tests show this isn't scaling
well. Using a more unique separator resolves the issue.

The choice of which separator to use is a hard one. We need something which isn't commonly
used in PN, PV, PR, *_OS and *_ARCH which rules out '-', '_' and it needs to work ok with
webservers/http which makes ';' and '%' harder.

The change also sets SSTATE_SWSPEC globally since writing out differently named siginfo
files for the fetch/unpack/patch tasks is a waste of diskspace, the hashes match for
all PN in the majority of cases and if they don't, its not a big issue as the hash is
different. This makes the results from sstate debugging more understandable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 199a5b3..324d1c1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -9,8 +9,8 @@ def generate_sstatefn(spec, hash, d):
     return hash[:2] + "/" + spec + hash
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
-SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
-SSTATE_SWSPEC     = ""
+SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
+SSTATE_SWSPEC     = "sstate:${BPN}::${PV}:${PR}::${SSTATE_VERSION}:"
 SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index e49d724..112e8ce 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -95,7 +95,7 @@ do_patch[stamp-base-clean] = "${SSCLEAN}"
 
 # SW means Shared Work directory
 SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
-SSTATE_SWSPEC = "sstate-gcc-${PV}-${PR}-${SSTATE_VERSION}-"
+SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 WORKDIR_task-unpack = "${SW}"
 WORKDIR_task-patch = "${SW}"
 



