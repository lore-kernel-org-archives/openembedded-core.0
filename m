Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1TwaR2-0003hh-Gl
	for Openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 16:34:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0JFIrFt012117
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 07:18:53 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 19 Jan 2013 07:18:53 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Sat, 19 Jan 2013 09:18:50 -0600
Message-ID: <1358608730-45776-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] populate_sdk_base.bbclass: Work around bugs with gnu tar < 1.24
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
X-List-Received-Date: Sat, 19 Jan 2013 15:34:25 -0000
Content-Type: text/plain

The gnu tar versions less than 1.24 pose a problem with the SDK
extraction.  A typical SDK will have hard links.  The SDK is created
with a newer version of tar but extracted with the host version of tar
which may be much older.  The specific defect is that older version of
gnu tar do not properly handle the "--strip-components=" argument when
processing hard links and the paths do not get properly truncated and
hooked up with the corresponding real file payloads.  This leads to
errors like the following during the SDK install:

tar: sysroots/qemux86-yocto-linux/usr/bin/getconf: Cannot hard link to `./opt/yocto/SDK-qemux86/sysroots/qemux86-yocto-linux/usr/bin/POSIX_V6_ILP32_OFFBIG': No such file or directory

The simple way to work around the problem is to just not save the path
information that is going to get chopped off anyway.  This has the
added benefit that it saves a small amount of space in the tar archive
as well.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c1756e8..da846b4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -113,7 +113,7 @@ fakeroot create_sdk_files() {
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
-	cd ${SDK_OUTPUT}
+	cd ${SDK_OUTPUT}/${SDKPATH}
 	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
 
@@ -130,7 +130,6 @@ if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 fi
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
-COMPONENTS_LEN=$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
 SUDO_EXEC=""
 target_sdk_dir=""
 answer=""
@@ -212,7 +211,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
+tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir
 echo "done"
 
 printf "Setting it up..."
-- 
1.7.1



