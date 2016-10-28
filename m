Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8116F71A07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 07:23:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2016 00:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,556,1473145200"; d="scan'208";a="184873599"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2016 00:23:04 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 10:22:35 +0300
Message-Id: <1477639355-28937-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] openssl: rehash actual mozilla certificates inside rootfs
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
X-List-Received-Date: Fri, 28 Oct 2016 07:23:03 -0000

The c_rehash utility is supposed to be run in the folder /etc/ssl/certs
of a rootfs where the package ca-certificates puts symlinks to
various CA certificates stored in /usr/share/ca-certificates/mozilla/.
These symlinks are absolute. This means that when c_rehash is run
at rootfs creation time it can't hash the actual files since they
actually reside in the build host's directory
$SYSROOT/usr/share/ca-certificates/mozilla/.

This problem doesn't reproduce when building on Debian or Ubuntu
hosts though, because these OSs have the certificates installed
in the same /usr/share/ca-certificates/mozilla/ folder.
Images built in other distros, e.g. Fedora, have problems with
connecting to https servers when using e.g. python's http lib.

The patch fixes c_rehash to check if it runs on a build host
by testing $SYSROOT and to translate the paths to certificates
accordingly.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 .../openssl/openssl/openssl-c_rehash.sh              | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
index f67f415..25ea729 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
@@ -114,11 +114,11 @@ link_hash()
 	LINKFILE=${HASH}.${TAG}${SUFFIX}
     done
 
-    echo "${1} => ${LINKFILE}"
+    echo "${3} => ${LINKFILE}"
 
     # assume any system with a POSIX shell will either support symlinks or
     # do something to handle this gracefully
-    ln -s ${1} ${LINKFILE}
+    ln -s ${3} ${LINKFILE}
 
     return 0
 }
@@ -142,7 +142,19 @@ hash_dir()
 
     ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
     do
-	check_file ${FILE}
+	REAL_FILE=${FILE}
+	# if we run on build host then get to the real files in rootfs
+	if [ -n "${SYSROOT}" -a -h ${FILE} ]
+	then
+	    FILE=$( readlink ${FILE} )
+	    # check the symlink is absolute (or dangling in other word)
+	    if [ "x/" == "x$( echo ${FILE} | cut -c1 -)" ]
+	    then
+		REAL_FILE=${SYSROOT}/${FILE}
+	    fi
+	fi
+
+	check_file ${REAL_FILE}
         local FILE_TYPE=${?}
 	local TYPE_STR=''
 
@@ -157,7 +169,7 @@ hash_dir()
 	    continue
         fi
 
-	link_hash ${FILE} ${TYPE_STR}
+	link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}
     done
 }
 
-- 
2.5.5


