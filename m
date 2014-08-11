Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 57ECF60169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:50:17 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id F379CF811EB; Mon, 11 Aug 2014 14:50:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 27166F811DB;
	Mon, 11 Aug 2014 14:50:18 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 14:50:35 -0600
Message-Id: <1407790235-12665-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] populate_sdk_base.bbclass: Limit xargs command line
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
X-List-Received-Date: Mon, 11 Aug 2014 20:50:24 -0000

It's possible to generate a command line in the relocate_sdk.sh script
which is too long (long paths, many files).  This change limits the
xargs command line by breaking it up into smaller pieces.

One necessary side effect is that the -0 option is no longer used as it
doesn't seem to work properly with -n, so the file name arguments are
now quoted explicitly rather than \0 terminated.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 06112dc..f590564 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -276,7 +276,7 @@ if [ $relocate = 1 ] ; then
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "%s\0", $1}'|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "\"%s\"\n", $1}'|$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-- 
1.9.1


