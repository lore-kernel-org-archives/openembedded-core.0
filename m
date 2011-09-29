Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9I3S-0003G2-2d for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 16:57:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TEwbEr003263 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:58:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XksUpsDpuj6k
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:58:37 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TEwYLv003248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:58:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 15:52:08 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317307935.12332.89.camel@ted>
Mime-Version: 1.0
Subject: autotools: Remove help2man dependency
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
X-List-Received-Date: Thu, 29 Sep 2011 14:57:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The help2man script is pretty useless to us. It requires to run the target
binary to extract help information which is not possible for any of our
cross compiled target binaries.

We're not interested in man pages for -cross/-native tools.

It therefore makes no sense to have this as a core build dependency.

This patch removes the dependeny and replaces it with a script
returning false. This will trigger autotool's missing utility
to use the copy of the man page included with the sources which
is what would already happen when we tried to run cross compiled
binaries anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index f213c18..c05ab4b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -7,7 +7,7 @@ def autotools_dep_prepend(d):
 
 	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
 		return deps
-	deps += 'autoconf-native automake-native help2man-native '
+	deps += 'autoconf-native automake-native '
 
 	if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
 		deps += 'libtool-native '
diff --git a/scripts/help2man b/scripts/help2man
new file mode 100755
index 0000000..2bb8d86
--- a/dev/null
+++ b/scripts/help2man
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+exit 1




