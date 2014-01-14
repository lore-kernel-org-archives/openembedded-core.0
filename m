Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 6419E6D8FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:15:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,658,1384297200"; d="scan'208";a="39471817"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 14 Jan 2014 16:15:04 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	id 14.2.318.1; Tue, 14 Jan 2014 16:15:04 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Tue, 14 Jan 2014 16:14:53 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 16:09:45 +0100
Message-ID: <1389712187-28648-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 14 Jan 2014 15:14:53.0439 (UTC)
	FILETIME=[605B90F0:01CF113B]
MIME-Version: 1.0
Subject: [PATCH] util-linux: add reset.1 manpage in update-alternatives
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
X-List-Received-Date: Tue, 14 Jan 2014 15:15:06 -0000
Content-Type: text/plain

Adding "doc-pkgs" to IMAGE_FEATURES (in an image recipe) reports a conflict with reset.1 file, present both in util-linux and ncurses-doc packages.

<log>
| Collected errors:
|  * check_data_file_clashes: Package util-linux-doc wants to install file /home/matt/tmp/oe-p/build/tmp-eglibc/work/qemux86_64-tiny-linux/test-image/1.0-r3/rootfs/usr/share/man/man1/reset.1
|       But that file is already provided by package  * ncurses-doc
|  * opkg_install_cmd: Cannot install package util-linux-doc.
| WARNING: /home/matt/tmp/oe-p/build/tmp-eglibc/work/qemux86_64-tiny-linux/test-image/1.0-r3/temp/run.do_rootfs.13877:1 exit 255 from
|   opkg-cl -f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version install `cat $1`
| ERROR: Function failed: do_rootfs (log file is located at /home/matt/tmp/oe-p/build/tmp-eglibc/work/qemux86_64-tiny-linux/test-image/1.0-r3/temp/log.do_rootfs.13877)
</log>

Same issue already occured few months ago:
Re: [OE-core] Clashing man pages
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg38590.html

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index aaa7ec3..8b39240 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -175,11 +175,12 @@ ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
+ALTERNATIVE_LINK_NAME[reset.1] = "${mandir}/man1/reset.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
-- 
1.8.2.1


