Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbZ-0001Lp-A3
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:09 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 803DC303EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:23 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:01:57 -0800
Message-Id: <1a6f61d9493bdbade256dc6c19bbffe75a2684a4.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 803DC303EB.65115
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 04/16] bitbake: compile tar-replacement firstly
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
X-List-Received-Date: Fri, 07 Dec 2012 05:36:09 -0000

From: "Roy.Li" <rongqing.li@windriver.com>

Compiling tar-replacement or not is decided by version of host tar,
if the host tar version is lower than 1.23, Compiling tar-replacement
is needed.

When doing popoluate tar-replacement sysroot to write the tar to
sysroot, but writing is not finished. other packages probably
use the being written tar to unzip file, which will lead to failure
and report the below error:
"bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy"

Now we compile tar-replacement firstly to ensure that a being written
tar command will not be used.

(From OE-Core rev: 3c1c4719fc96f6f1fbb257413d6baf3d91fdf4e8)

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/bitbake |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 3772d82..c52d5d2 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -134,7 +134,12 @@ if [ $buildpseudo -gt 0 ]; then
             fi
         done
     done
-    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
+
+    if [ $needtar = "1" ]; then
+	bitbake $TARTARGET -c populate_sysroot
+    fi
+
+    bitbake pseudo-native $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.9.5



