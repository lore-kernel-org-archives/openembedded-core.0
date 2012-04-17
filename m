Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SK6az-0008P6-O8 for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 13:29:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBJpGG012428
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:19:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11972-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:19:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBJhFB012421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:19:44 +0100
Message-ID: <1334661587.616.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 12:19:47 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sanity.bbclass: If the sanity tests fail, don't mark them as complete
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
X-List-Received-Date: Tue, 17 Apr 2012 11:29:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From adf7a93daf5b648972b8d059cba49f28a64efe82 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Apr 2012 11:16:18 +0000
Subject: 

If the sanity tests fail, we still were writing out the stamp which means
they'd get skipped the next time we run bitbake. This is clearly wrong
and we should only write out the stamp file if the sanity tests complete
successfully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1b941ac..4d4abd3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -378,7 +378,7 @@ def check_sanity(e):
         if last_sstate_dir != sstate_dir:
             messages = messages + check_sanity_sstate_dir_change(sstate_dir, e.data)
 
-    if os.path.exists("conf"):
+    if os.path.exists("conf") and not messages:
         f = file(sanityverfile, 'w')
         f.write("SANITY_VERSION %s\n" % sanity_version) 
         f.write("TMPDIR %s\n" % tmpdir) 




