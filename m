Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2F76BD5A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 15:19:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r81FTFLm021089 for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Sep 2013 16:32:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mkq4s6dLLozS
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 16:32:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r81FWQDr021112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Sep 2013 16:32:27 +0100
Message-ID: <1378048772.1059.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Sep 2013 16:19:32 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity: Don't make assumptions about cwd
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
X-List-Received-Date: Sun, 01 Sep 2013 15:19:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When using the recently fixed out of build directory bitbake invocations, I was
puzzled why bitbake seemed to be pausing. The reason was due to running the sanity
tests each and every time. This was due to current working directory assumptions
within the sanity test code. Fix this to use TOPDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4df3ca8..feffed9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -694,7 +694,7 @@ def check_sanity(sanity_data):
     last_sanity_version = 0
     last_tmpdir = ""
     last_sstate_dir = ""
-    sanityverfile = 'conf/sanity_info'
+    sanityverfile = sanity_data.expand("${TOPDIR}/conf/sanity_info")
     if os.path.exists(sanityverfile):
         with open(sanityverfile, 'r') as f:
             for line in f:
@@ -715,7 +715,8 @@ def check_sanity(sanity_data):
     else: 
         if last_sstate_dir != sstate_dir:
             status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
-    if os.path.exists("conf") and not status.messages:
+
+    if os.path.exists(os.path.dirname(sanityverfile)) and not status.messages:
         with open(sanityverfile, 'w') as f:
             f.write("SANITY_VERSION %s\n" % sanity_version) 
             f.write("TMPDIR %s\n" % tmpdir) 



