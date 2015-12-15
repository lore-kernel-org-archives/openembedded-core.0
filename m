Return-Path: <fabrice.coulon@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 94C3B6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 09:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C17372E11E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:15:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5ZHnkZJ3XPg9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:15:43 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E557A2E131
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:15:41 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 77C191569
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:14:27 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 686311558
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:14:27 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by thoth.se.axis.com (Postfix) with ESMTP id 65CDE3425E;
	Tue, 15 Dec 2015 10:14:27 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id 5A5B780033B; Tue, 15 Dec 2015 10:13:58 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Dec 2015 10:13:56 +0100
Message-Id: <1450170836-9539-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] useradd: Allow overriding USERADDDEPENDS for native
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
X-List-Received-Date: Tue, 15 Dec 2015 09:15:54 -0000

If I want to be able to override USERADDDEPENDS from another bbclass,
I need to give USERADDDEPENDS a default value and use DEPENDS_append
for the different types of class. This is one example of what I need
to be able to do in another .bbclass:

USERADDDEPENDS_class-native = " base-files-native base-passwd-native...
DEPENDS_append_class-native = " pseudo-native"

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/classes/useradd.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4577e56..ca31616 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,11 +3,8 @@ inherit useradd_base
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append = "${USERADDDEPENDS}"
-USERADDDEPENDS = " base-files shadow-native shadow-sysroot shadow"
-USERADDDEPENDS_class-cross = ""
-USERADDDEPENDS_class-native = ""
-USERADDDEPENDS_class-nativesdk = ""
+USERADDDEPENDS ?= " base-files shadow-native shadow-sysroot shadow"
+DEPENDS_append_class-target = "${USERADDDEPENDS}"
 
 # This preinstall function can be run in four different contexts:
 #
-- 
1.9.1


