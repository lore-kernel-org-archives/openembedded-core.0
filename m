Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2E7601D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 16:44:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LGoaDA005337 for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:50:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XgqUITJ5Qi7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:50:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LGoc0n005332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:50:40 +0100
Message-ID: <1371833048.20823.304.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 17:44:08 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Drop horrible obsolete minversion hack
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
X-List-Received-Date: Fri, 21 Jun 2013 16:44:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We once needed to do this, things seem to work fine without this now,
thankfully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3b9934b..7e61daa 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -369,15 +369,8 @@ def check_sanity(sanity_data):
             print("WARNING: sanity.bbclass can't compare versions without python-distutils")
             return 1
 
-    # Check the bitbake version meets minimum requirements
-    minversion = sanity_data.getVar('BB_MIN_VERSION', True)
-    if not minversion:
-        # Hack: BB_MIN_VERSION hasn't been parsed yet so return 
-        # and wait for the next call
-        return
-
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", sanity_data)
 
     messages = ""
 
@@ -392,6 +385,8 @@ def check_sanity(sanity_data):
     except ImportError:
         messages = messages + 'Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n'
 
+    # Check the bitbake version meets minimum requirements
+    minversion = sanity_data.getVar('BB_MIN_VERSION', True)
     if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__)
 



