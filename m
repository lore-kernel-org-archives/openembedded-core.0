Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F33B06AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 12:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TChv4r002252 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:43:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lnUBVCb5VEgQ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:43:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TChjoc002237
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:43:56 +0100
Message-ID: <1443530625.5162.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 13:43:45 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] toolchain-shar-extract: Correct environment-setup script names for multilib
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
X-List-Received-Date: Tue, 29 Sep 2015 12:43:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently a lib32-core-image-* SDK prints an incorrect environment-setup-*
file name when installing the SDK. Instead of printing the wrong thing, list
the environment setup files present in the SDK.

As it happens this fixes the message printed with buildtools-tarball too
which someone reported to me about the same time as I finished this patch!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index dd92d0e..2ffc2d1 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -182,7 +182,9 @@ fi
 
 echo "SDK has been successfully set up and is ready to be used."
 echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
-echo " \$ . $target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@"
+for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+	echo " \$ . $target_sdk_dir/$env_setup_script"
+done
 
 exit 0
 



