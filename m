Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61FF9781F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 10:25:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5CAPSDX007082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 12 Jun 2017 11:25:29 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dKMXI-00041A-Eq; Mon, 12 Jun 2017 11:25:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 11:25:27 +0100
Message-Id: <1497263127-15406-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 12 Jun 2017 11:25:29 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] native/nativesdk: Ensure DISTRO_FEATURES is determistic
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
X-List-Received-Date: Mon, 12 Jun 2017 10:25:30 -0000

set() order is random and hence the filtered native/nativesdk DISTRO_FEATURES
could be set to random ordering. We've been lucky so far this tended not to
cause issues but some queued changes highedlighted this. Thrown in a sorted()
so the order is deterministic and we get consistent hash checksums between runs
and between machines.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass    | 2 +-
 meta/classes/nativesdk.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index b8f839a..6b7f3dd 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -129,7 +129,7 @@ python native_virtclass_handler () {
     # from modifying native distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
-    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
+    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
 
     classextend = e.data.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 655b456..69fb45c8 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -74,7 +74,7 @@ python nativesdk_virtclass_handler () {
     # from modifying nativesdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
-    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
+    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
-- 
2.7.4


