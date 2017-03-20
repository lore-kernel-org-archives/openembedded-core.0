Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5D22F779EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE428208FB;
	Mon, 20 Mar 2017 17:38:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NBX5idlWZEOJ; Mon, 20 Mar 2017 17:38:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE1C1208E3;
	Mon, 20 Mar 2017 17:38:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3161C1623E9;
	Mon, 20 Mar 2017 13:38:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 13:38:20 -0400
Message-Id: <1490031500-38242-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 20 Mar 2017 17:38:28 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

.siginfo files are not being accessed from local or NFS-mounted
sstate mirrors when sstate package is installed, so their atime
is not updated. If sstate mirror is cleaned based on access time,
they get deleted, even though they are still being used.

Updated atime of .siginfo symlinks with 'touch -a'. This command
dereferences symlinks pointing to the local mirror and updates
atime of the .siginfo file on the mirror.

[YOCTO #10857]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8643f3d..4fdfcc8 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -724,6 +724,8 @@ python sstate_sign_package () {
 #
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
+	# update .siginfo atime on local/NFS mirror
+	[ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
 	# Use "! -w ||" to return true for read only files
 	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
 	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-- 
2.7.4


