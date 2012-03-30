Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDhKT-0002Tv-8e
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 21:17:45 +0200
Received: by pbcum15 with SMTP id um15so1906192pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=osazO3FVpFS7Mn3KS4ln2c/dOBZoqvCTY0N/ulrrWsM=;
	b=GvE2qzlwFZpW2vROa1tvoP+ib4ItOQGsYZDNnVNYPYrF7h1HeQnOmtv5FCGsVE6VKt
	23uSeOxru+PbtHqj6qAsalX2a2Grx6eGbUqn6rDK9vWgn+fY/Y+KJvfaD3iyZBB3KzDY
	lMvdJQmgAEQ8TXkb2PzMwdzqfrnq/o0IbRGUOUlsGQarX+noYooeBNTKFW4NvoeK0ySj
	IBwawyI5i9aD4LwdQFtohvriS331pkrd0cl1sgAEJka1mUcyV0IgqpNpZKzzC4GKergI
	fBNs3zmnqguc6+G+1Gx50SypPSqNaOa3k2KChrvl1JiYi26tLV6HoumT8/D3ISvyPvYJ
	mOGA==
Received: by 10.68.131.1 with SMTP id oi1mr11986696pbb.102.1333134517999;
	Fri, 30 Mar 2012 12:08:37 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id l8sm7933943pbd.62.2012.03.30.12.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 12:08:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 12:07:38 -0700
Message-Id: <1333134459-13057-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] apt: Fix a latent bug exposed by gcc 4.7
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
X-List-Received-Date: Fri, 30 Mar 2012 19:17:45 -0000

Further Details are in patch itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   57 ++++++++++++++++++++
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    6 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
new file mode 100644
index 0000000..68cb0b0
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
@@ -0,0 +1,57 @@
+Fix build errors
+
+deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
+deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
+deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: apt-0.7.14/apt-pkg/deb/deblistparser.cc
+===================================================================
+--- apt-0.7.14.orig/apt-pkg/deb/deblistparser.cc	2012-03-30 11:17:09.112456632 -0700
++++ apt-0.7.14/apt-pkg/deb/deblistparser.cc	2012-03-30 11:25:40.484481643 -0700
+@@ -209,18 +209,18 @@
+       /* Strip out any spaces from the text, this undoes dpkgs reformatting
+          of certain fields. dpkg also has the rather interesting notion of
+          reformatting depends operators < -> <= */
+-      char *I = S;
++      char *J = S;
+       for (; Start != End; Start++)
+       {
+ 	 if (isspace(*Start) == 0)
+-	    *I++ = tolower(*Start);
++	    *J++ = tolower(*Start);
+ 	 if (*Start == '<' && Start[1] != '<' && Start[1] != '=')
+-	    *I++ = '=';
++	    *J++ = '=';
+ 	 if (*Start == '>' && Start[1] != '>' && Start[1] != '=')
+-	    *I++ = '=';
++	    *J++ = '=';
+       }
+ 
+-      Result = AddCRC16(Result,S,I - S);
++      Result = AddCRC16(Result,S,J - S);
+    }
+    
+    return Result;
+Index: apt-0.7.14/cmdline/apt-get.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-get.cc	2012-03-30 11:28:56.048490824 -0700
++++ apt-0.7.14/cmdline/apt-get.cc	2012-03-30 11:32:00.248499740 -0700
+@@ -1752,12 +1752,12 @@
+ 	 if ((*Cache)[I].Install() == false)
+ 	    continue;
+ 
+-	 const char **J;
+-	 for (J = CmdL.FileList + 1; *J != 0; J++)
+-	    if (strcmp(*J,I.Name()) == 0)
++	 const char **K;
++	 for (K = CmdL.FileList + 1; *K != 0; J++)
++	    if (strcmp(*K,I.Name()) == 0)
+ 		break;
+ 	 
+-	 if (*J == 0) {
++	 if (*K == 0) {
+ 	    List += string(I.Name()) + " ";
+ 	    VersionsList += string(Cache[I].CandVersion) + "\n";
+ 	 }
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 8464b7f..6354f8e 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,10 +3,12 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://nodoc.patch \
-            file://includes-fix.patch "
+            file://includes-fix.patch \
+            file://remove-redeclaration.patch \
+           "
 
 SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
 SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
-- 
1.7.5.4



