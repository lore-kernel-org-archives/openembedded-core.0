Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 82BCD6006E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 12:43:51 +0000 (UTC)
Received: from hundeboll.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 18FB91C098A;
	Fri, 13 Jul 2018 14:43:50 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 14:43:48 +0200
Message-Id: <20180713124348.5067-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH] initscripts: remove warnings on read-only-rootfs (again)
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
X-List-Received-Date: Fri, 13 Jul 2018 12:43:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the populate-volatile.sh initscript tests if a configured symlink
is already in place, it uses readlink with the '-f' (follow) option:

> [ "$(readlink -f $source)" = "$dest" ]

If the test fails, it proceeds to delete the exisiting folder/file, and
create the configured symlink.

However, the '-f' option to readlink makes it follow symlinks pointing
at symlinks. If the $dest argument is a symlink, the above test fails,
and warnings are printed due to changing a read-only rootfs.

This is the case for /tmp, and /etc/resolv.conf:
> /tmp -> /var/tmp -> /var/volatile/tmp
> /etc/resolv.conf -> /var/run/resolv.conf -> /run/resolv.conf

Fix the warnings by removing the '-f' option, so that the test matches
the configuration.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 35316ec2ba..e1fce02906 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -80,7 +80,7 @@ mk_dir() {
 link_file() {
 	EXEC="
 	if [ -L \"$2\" ]; then
-		[ \"\$(readlink -f \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+		[ \"\$(readlink \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
 	elif [ -d \"$2\" ]; then
 		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
 			cp -a $2/* $1 2>/dev/null;
-- 
2.18.0


