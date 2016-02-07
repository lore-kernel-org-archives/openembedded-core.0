Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16B877653B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H9k54000391 for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:09:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BF3aLxEFCb1a
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:09:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H9ffX000388
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:09:42 GMT
Message-ID: <1454864981.27087.319.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2016 17:09:41 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Ensure populate_lic sstate objects are cleaned
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
X-List-Received-Date: Sun, 07 Feb 2016 17:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

do_cleansstate wasn't cleaning do_populate_lic sstate objects in the
native/cross case since the wildcard path entry wasn't being cleared
at the same time as the path extra prefix. Fix by clearing it at the
same time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d606c02..7c7e024 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -124,6 +124,7 @@ def sstate_state_fromvars(d, task = None):
     if task == "populate_lic":
         d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
         d.setVar("SSTATE_EXTRAPATH", "")
+        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")
 
     ss = sstate_init(task, d)
     for i in range(len(inputs)):



