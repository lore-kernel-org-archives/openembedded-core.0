Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rlk5l-0000vh-BE for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 17:35:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0DGRT14023177
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 16:27:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23039-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 16:27:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0DGRJB2023171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 16:27:21 GMT
Message-ID: <1326472043.15389.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2012 16:27:23 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function
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
X-List-Received-Date: Fri, 13 Jan 2012 16:35:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

People have noticed that sstate is now getting invalidated very readily. The
issue is that the code using these variables was factored into a new function
but the variable exclusion was not. This patch moves the variable exclusion
to the correct place allowing the sstate checksums to work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 335d02e..471c32b 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -105,6 +105,8 @@ def should_apply(parm, d):
 
 	return True, None
 
+should_apply[vardepsexclude] = "DATE SRCDATE"
+
 python patch_do_patch() {
 	import oe.patch
 
@@ -155,7 +157,7 @@ python patch_do_patch() {
 			bb.fatal(str(exc))
 		resolver.Resolve()
 }
-patch_do_patch[vardepsexclude] = "DATE SRCDATE PATCHRESOLVE"
+patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
 addtask patch after do_unpack
 do_patch[dirs] = "${WORKDIR}"




