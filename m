Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RIUwJ-00006z-0n
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 02:32:23 +0200
Received: by wyg19 with SMTP id 19so7028862wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=meCFbG38E6e3XWRwDM0rSBaVPEIL9u4gUHnzda4PRmM=;
	b=L+jTwXQQV2S34e7TssUq9y4exEJbJov8SwFdqZFYh9Bqs4vt8BumI+fTZHM19rWVtn
	qriUGHHLN0+Lfdyv5xyqu4WqLYTNDjIH1H3yuywAplKC4DI1lkDQMKBV0yMjK7QRinKI
	Hb0olF10rT6uYuZqWEDwgCGfKSyh8sRukzvHg=
Received: by 10.216.5.18 with SMTP id 18mr3900488wek.0.1319502384616;
	Mon, 24 Oct 2011 17:26:24 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id gd18sm41982592wbb.5.2011.10.24.17.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 17:26:24 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 02:18:52 +0100
Message-Id: <1319505532-23199-2-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Tue, 25 Oct 2011 00:32:23 -0000

The coreutils configure script is unable determine how to get free
space from the Operating System when cross-compiling. This patch
gives it some extra help by setting the fu_cv_sys_stat_statfs2_bsize
variable to yes before invoking the configure script.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index f3b7af7..3c75ddf 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -27,7 +27,7 @@ bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirnam
                 join link logname md5sum mkfifo mktemp nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
+                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes df"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
@@ -35,6 +35,10 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
 
 sbindir_progs= "chroot"
 
+do_configure_prepend () {
+        export fu_cv_sys_stat_statfs2_bsize=yes
+}
+
 do_install_append() {
 	for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
 
-- 
Julian Pidancet



