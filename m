Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuV-0001fg-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:43 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElxmf002925 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:59 GMT
X-Quarantine-ID: <SkLw5IngwUUM>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SkLw5IngwUUM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:59 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEluiq002912
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:57 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Ysh-0004f5-KE
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:38:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:16 +0000
Message-Id: <7e0f1eb177221ab37feb1e21e1b83a798963f4c4.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/16] dbus: Fix unpackaged files warning
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:43 -0000

WARNING: For recipe dbus, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/dbus-1.0/test

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a25256..1306450 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -94,6 +94,9 @@ do_install() {
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
+	
+	# We don't build tests, don't need the empty directory
+	rmdir ${D}${libdir}/${BPN}*/test/
 }
 
 do_install_virtclass-native() {
-- 
1.7.5.4



