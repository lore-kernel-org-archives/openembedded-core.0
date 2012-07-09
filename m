Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoHh2-0006gz-BE
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:24:16 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:45600 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoHWG-0001U3-7n for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 13:13:08 -0400
Date: Mon, 9 Jul 2012 13:12:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207091310550.23920@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: core-image-*.bb: Remove usage of EXTRA_IMAGE_FEATURES from some .bb files
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
X-List-Received-Date: Mon, 09 Jul 2012 17:24:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Replace the usage of EXTRA_IMAGE_FEATURES in a small number of .bb
files with IMAGE_FEATURES, and leave the use of EXTRA_IMAGE_FEATURES
for developers in their local.conf files, to avoid the possibility of
undesirable side effects.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i *think* this should do it ...

diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 047d66b..7601410 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
 (LSB) implementations. It includes the full meta-toolchain, plus development \
 headers and libraries to form a standalone SDK."

-IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
-EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
+IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh \
+	tools-debug tools-profile tools-testapps debug-tweaks"


 IMAGE_INSTALL = "\
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 29512e3..e89b574 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -8,8 +8,7 @@ tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
 DEPENDS = "linux-yocto-rt"

-IMAGE_FEATURES += "dev-pkgs tools-sdk"
-EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
+IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug tools-profile tools-testapps debug-tweaks"

 IMAGE_INSTALL += "rt-tests kernel-dev"

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 39742ef..733ef7f 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -5,8 +5,8 @@ DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."

-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
-EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
+IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs \
+	tools-debug tools-profile tools-testapps debug-tweaks"

 SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


