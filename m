Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BB86576802
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 14:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35EkOpQ001476 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 15:46:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qJ3G7pRHzK-f
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 15:46:24 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35EkLPZ001472
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 15:46:23 +0100
Message-ID: <1459867581.7348.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Apr 2016 15:46:21 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sanity: Increase minimum git version to 1.8.3.1
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
X-List-Received-Date: Tue, 05 Apr 2016 14:46:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The kernel tools assume git > 1.7.9.5, I'm unsure of the exact version but
the oldest in our infrastructure is 1.8.3.1. The git fetcher also currently
has nasty workarounds for git < 1.7.9.2.

Moving to 1.8.3.1 as our minimum version seems sane at this point as the oldest
we're testing/supporting.

[YOCTO #6162]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 662f764..d229938 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -531,14 +531,16 @@ def check_tar_version(sanity_data):
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
+# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
+# The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
     from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
     if status != 0:
         return "Unable to execute git --version, exit code %s\n" % status
     version = result.split()[2]
-    if LooseVersion(version) < LooseVersion("1.7.8"):
-        return "Your version of git is older than 1.7.8 and has bugs which will break builds. Please install a newer version of git.\n"
+    if LooseVersion(version) < LooseVersion("1.8.3.1"):
+        return "Your version of git is older than 1.8.3.1 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
 
 # Check the required perl modules which may not be installed by default



