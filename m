Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C71C773175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7EwNd025222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:58 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:23 -0800
Message-ID: <b901a3057ff511f4c8bc730b37b967a93995de2f.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/40] uninative.bbclass: Choose the correct loader based on BUILD_ARCH
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:58 -0000
Content-Type: text/plain

From: Randy Witt <randy.e.witt@linux.intel.com>

Previously UNINATIVE_LOADER was always ld-linux-x86-64.so.2. That is
incorrect when the host is 32-bit.

This change also changes to using ?= so the user can override
UNINATIVE_LOADER if so desired.

[YOCTO #8124]

(From OE-Core master rev: b78fa0bcadd54bb29b6f1bb3a9308d4c454bf4e2)

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/uninative.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 51391db..0cd27db 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,6 +1,6 @@
 NATIVELSBSTRING = "universal"
 
-UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
+UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64', '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2', '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
 
 addhandler uninative_eventhandler
 uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
-- 
1.7.9.5


