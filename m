Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QTsqn-0006qW-Ay
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:45:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p579g8LQ003374
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jun 2011 02:42:08 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 7 Jun 2011 02:42:07 -0700
Message-ID: <c4843aae9f9db2aab1529918b54cbab8fe7a7ec4.1307438945.git.kai.kang@windriver.com>
In-Reply-To: <cover.1307438945.git.kai.kang@windriver.com>
References: <cover.1307438945.git.kai.kang@windriver.com>
Old-Date: Tue, 7 Jun 2011 16:02:53 +0800
Date: Tue, 7 Jun 2011 17:42:05 +0800
To: <richard.purdie@linuxfoundation.org>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Kang, poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake: add another local configuration file
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
X-List-Received-Date: Tue, 07 Jun 2011 09:45:29 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Add a new local configuration file local.conf.sample.extended, and more advanced
settings what user can configure could put in this file.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta-yocto/conf/local.conf.sample.extended |    5 +++++
 meta/conf/bitbake.conf                     |    1 +
 scripts/oe-setup-builddir                  |   19 +++++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-yocto/conf/local.conf.sample.extended

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
new file mode 100644
index 0000000..048d641
--- /dev/null
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -0,0 +1,5 @@
+# eglibc configurability is used to reduce minimal images's size.
+# the all supported eglibc options are default enabled by adding
+# to DISTRO_FEATURES in default-distrovars.inc
+# put the options what you want to enable below and uncomment it
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index de94316..1b1cf6b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -641,6 +641,7 @@ CPU_FEATURES_arm ?= "vfp"
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
+include conf/local.extended.conf
 include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 5fc8b19..7af2373 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -55,6 +55,7 @@ if [ "x" != "x$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECORELOCALCONFEXTENDED="$TEMPLATECONF/local.conf.sample.extended"
 fi
 
 if [ "x" = "x$OECORELOCALCONF" ]; then
@@ -79,6 +80,24 @@ EOM
     cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
 fi
 
+if ! (test -r "$BUILDDIR/conf/local.extended.conf"); then
+cat <<EOM
+You had no conf/local.conf file. This configuration file has therefore been
+created for you with some default values. You may wish to edit it to use
+different eglibc configuration options for example. See the file for more
+information as common configuration options are commented.
+
+The Yocto Project has extensive documentation about OE including a reference manual
+which can be found at:
+    http://yoctoproject.org/community/documentation
+
+For more information about OpenEmbedded see their website:
+    http://www.openembedded.org/
+
+EOM
+	cp -f $OECORELOCALCONFEXTENDED $BUILDDIR/conf/local.extended.conf
+fi
+
 if [ "x" = "x$OECORELAYERCONF" ]; then
     OECORELAYERCONF="$OEROOT/meta/conf/bblayers.conf.sample"
 fi
-- 
1.7.5.1.300.gc565c



