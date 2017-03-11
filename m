Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECFCA77316
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CFA4B18408
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id z-IfAQGc3--l
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:56 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A43F518271
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8783E1A077
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C5841A075
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 6E5C25D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B5StUW021344
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:55 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B5StKj021343
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 06:28:55 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 06:28:52 +0100
Message-Id: <20170311052852.21281-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] openssl: Disable make's -e flag without breaking ${AR}
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
X-List-Received-Date: Sat, 11 Mar 2017 05:28:56 -0000

From: Olof Johansson <olof.johansson@axis.com>

The OpenSSL recipe tried to workaround the -e make flag (overriding
variables from the environment). And when the -e flag was dropped as
the global default, it was specifically added for OpenSSL. This is
unnecessary, as only the value of ${AR} seems to be affected, and that
can be handled correctly by OpenSSL's build system if we just let it.

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 9afa5bd567..28421dab33 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -17,7 +17,6 @@ S = "${WORKDIR}/openssl-${PV}"
 
 PACKAGECONFIG[perl] = ",,,"
 
-AR_append = " r"
 TERMIO_libc-musl = "-DTERMIOS"
 TERMIO ?= "-DTERMIO"
 # Avoid binaries being marked as requiring an executable stack since it 
@@ -28,7 +27,6 @@ CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_END
 export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
-EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
-- 
2.12.0


