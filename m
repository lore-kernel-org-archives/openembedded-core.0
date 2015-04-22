Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CABB4605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 09:49:55 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YkrI3-0000pn-Vp from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Apr 2015 02:49:56 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:49:54 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Apr 2015 12:49:52 +0300
Message-ID: <1429696192-2392-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] icecc.bbclass: blacklist libgcc-initial
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
X-List-Received-Date: Wed, 22 Apr 2015 09:49:57 -0000
Content-Type: text/plain

Building libgcc-initial with IceCC enabled can fail with the CPP sanity
check error in the following case (using ARM for example):
* sysroot contains cross gcc built for another ARM variant
* sysroot contains initial cross gcc built to suit the target machine
* bitbake tries to configure libgcc-initial
* libgcc-initial calls icecc wrapper
* icecc wrapper calls non-initial cross gcc via the full path
* non-initial cross gcc looks for the headers in the wrong place
* BOOM

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/classes/icecc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 2f9e3cf..529b097 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -117,7 +117,8 @@ def use_icc(bb,d):
     # system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
     # when adding new entry, please document why (how it failed) so that we can re-evaluate it later
     # e.g. when there is new version
-    system_package_blacklist = []
+    # building libgcc-initial with icecc fails with CPP sanity check error if host sysroot contains cross gcc built for another target tune/variant
+    system_package_blacklist = ["libgcc-initial"]
     user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
     user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
-- 
2.1.4


