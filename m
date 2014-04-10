Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03BCC65E7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 12:50:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3ACo7uS022515 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:50:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lZlxM3Qo55xS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:50:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3ACo1fW022504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:50:03 +0100
Message-ID: <1397134195.24597.256.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2014 13:49:55 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Silence warnings when switching machines
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
X-List-Received-Date: Thu, 10 Apr 2014 12:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We recently added multiple provider warnings. These could get issued 
from -cross recipes due to the way these currently overlap in the 
native sysroot. Filter out these warnings for now, until such times
as we improve the cross recipes so they don't have an overlapping 
namespace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 297e29f..5f560e5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -25,6 +25,7 @@ SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
 # Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
 # can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)
 SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}/usr/libexec/${MULTIMACH_TARGET_SYS} ${STAGING_BINDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}${includedir_native}/gcc-build-internal-${MULTIMACH_TARGET_SYS}"
+SSTATE_DUPWHITELIST += "${STAGING_DIR_NATIVE}/sysroot-providers/virtual_${MULTIMACH_TARGET_SYS}- ${STAGING_DIR_NATIVE}/sysroot-providers/binutils-cross ${STAGING_DIR_NATIVE}/sysroot-providers/gcc-cross"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 



