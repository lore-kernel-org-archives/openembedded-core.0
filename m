Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA300606D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBUG9M004297 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:30:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fl1sPB7lLeWF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:30:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBUBPK004294
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:30:12 +0100
Message-ID: <1463830211.4578.174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 12:30:11 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: bitbake.conf/toolchain-shar-extract: Use en_US.UTF-8 as locale
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
X-List-Received-Date: Sat, 21 May 2016 11:30:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Under python 3, if we spawn python processes, we need to have a UTF-8 locale,
else python's file access methods will use ascii. You can't change that mode
once the interpreter is started so we have to ensure a locale is set. Ideally
we'd use C.UTF-8 since OE already forces the C locale but not all distros support
that and we need to set something so en_US.UTF-8 seems as standard we we can get.

This matches the change in bitbake revision 8902c29638411d312e6fc4a197707e5742652e15

Also set this into the environment used when installing SDKs since
python can be run and we need to ensure we use a standardised locale
which is available from things like buildtools-tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8a84e53..acef30b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -488,7 +488,7 @@ export BUILD_NM = "${BUILD_PREFIX}nm"
 export MAKE = "make"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = ""
-export LC_ALL = "C"
+export LC_ALL = "en_US.UTF-8"
 
 ##################################################################
 # Patch handling.
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 397be11..d1ce86d 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,7 @@
 #!/bin/sh
 
 [ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
+	LC_ALL=en_US.UTF-8 \
 	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
 	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
 [ -f /etc/environment ] && . /etc/environment



