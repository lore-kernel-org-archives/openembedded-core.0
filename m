Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54ED56E614
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:13:55 +0000 (UTC)
Received: from sangmingze-mail.local (ip5b42f21c.dynamic.kabel-deutschland.de
	[91.66.242.28])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 380A9ABB08
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:13:54 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=sangmingze-mail.local)
	by sangmingze-mail.local with esmtp (Exim 4.84)
	(envelope-from <holger@moiji-mobile.com>) id 1YPGQb-0005Ib-Ae
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 21:13:29 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 21:13:08 +0100
Message-Id: <1424549588-20334-2-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1424549588-20334-1-git-send-email-holger@moiji-mobile.com>
References: <1424549588-20334-1-git-send-email-holger@moiji-mobile.com>
Subject: [PATCH 2/2] busybox:udhcpc: Remove the routes from the right interface
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
X-List-Received-Date: Sat, 21 Feb 2015 20:14:00 -0000

When using iproute2 to remove the route all default rules
will be removed. Scope the removal by interface like it is
done with ifconfig.

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
---
 meta/recipes-core/busybox/files/simple.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index b294d57..22168b0 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -46,7 +46,7 @@ case "$1" in
 		if [ -n "$router" ] ; then
 			if ! root_is_nfs ; then
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        while ip route del default 2>/dev/null ; do
+                                        while ip route del default dev $interface 2>/dev/null ; do
                                                 :
                                         done
                                 else
-- 
2.1.4


