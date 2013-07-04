Return-Path: <Bernhard.Guillon@hale.at>
Received: from mx.inode.at (mx06.lb01.inode.at [62.99.145.6])
	by mail.openembedded.org (Postfix) with ESMTP id 83EDA6AFB6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:20:14 +0000 (UTC)
Received: from [83.64.51.210] (port=7878 helo=gateway1.hale)
	by smartmx-06.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1Uufi2-0001Gz-W3 for openembedded-core@lists.openembedded.org;
	Thu, 04 Jul 2013 11:20:15 +0200
Received: from mail.hale (mail.hale [192.168.100.5])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id r649JtuG009252
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2013 11:19:55 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.hale (Postfix) with ESMTP id 408B6661FE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:20:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at hale
Received: from mail.hale ([127.0.0.1])
	by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQ1kCPqsvIll; Thu,  4 Jul 2013 11:20:03 +0200 (CEST)
Received: from entw48.HALE (entw48.hale [192.168.100.102])
	by mail.hale (Postfix) with ESMTP id CBF58661957;
	Thu,  4 Jul 2013 11:20:03 +0200 (CEST)
From: Bernhard.Guillon@hale.at
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 11:16:30 +0200
Message-Id: <1372929391-26767-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: r649JtuG009252
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1373534397.80585@arg+ZrQNfsOrhS1sZ2kiIQ
X-Spam-Status: No
Subject: [PATCH] populate_sdk_base.bbclass: allow $OECORE_NATIVE_SYSROOT in sdk_env_script
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
X-List-Received-Date: Thu, 04 Jul 2013 09:20:14 -0000

From: Bernhard Guillon <Bernhard.Guillon@hale.at>

Only grep for 'OECORE_NATIVE_SYSROOT=' otherwise things like

toolchain_create_sdk_env_script_append() {
    echo 'export MY_DIR_FOO=$OECORE_NATIVE_SYSROOT/my/dir/foo' >> $script
}

trigger the following error while executing the install script:

find: `$OECORE_NATIVE_SYSROOT/my/dir/foo': No such file or directory

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e5bc0b4..cb3a211 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -243,7 +243,7 @@ for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
 done
 
 # fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
+native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
 if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
-- 
1.7.1


--
Scanned by MailScanner.


