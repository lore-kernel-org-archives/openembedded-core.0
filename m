Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbehJ-0000pN-28 for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 22:52:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMLcTBs029673
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:38:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27637-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:38:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMLcKuZ029667
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:38:22 GMT
Message-ID: <1353620300.10459.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 21:38:20 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Add a rule for target sysroot requirements from cross dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 21:52:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For example gcc-cross depends on linux-libc-headers and needs it to be present
to build/work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 470e0ee..b8a766b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -663,6 +663,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         # Native/Cross populate_sysroot need their dependencies
         if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]) and taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
             return False
+        # Target populate_sysroot depended on by cross tools need to be installed
+        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot' and isNativeCross(taskdependees[dep][0]):
+            return False
+
         # Target populate_sysroot do not need their dependencies
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
             continue




