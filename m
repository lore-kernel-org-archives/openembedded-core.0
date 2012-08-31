Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T7MCW-0003Px-Lu for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 10:03:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7V0RNwi006136
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 01:27:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05772-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 01:27:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7V0RBKP006130
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 01:27:13 +0100
Message-ID: <1346372831.16485.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 17:27:11 -0700
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Remove hardcoded task mappings
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
X-List-Received-Date: Fri, 31 Aug 2012 08:03:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've not idea why this got left in but as per the comment, it needs fixing
and we shouldn't have hardcoded mappings like this. Lets remove it
and dynamically generate the data instead.

[YOCTO #3039]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6762e32..e4b70b3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -519,16 +519,9 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
-    # This needs to go away, FIXME
-    mapping = {
-        "do_populate_sysroot" : "populate-sysroot",
-        "do_populate_lic" : "populate-lic",
-        "do_package_write_ipk" : "deploy-ipk",
-        "do_package_write_deb" : "deploy-deb",
-        "do_package_write_rpm" : "deploy-rpm",
-        "do_package" : "package",
-        "do_deploy" : "deploy",
-    }
+    mapping = {}
+    for t in d.getVar("SSTATETASKS", True).split():
+        mapping[t] = d.getVarFlag(t, "sstate-name", True)
 
     for task in range(len(sq_fn)):
         spec = sq_hashfn[task].split(" ")[1]




