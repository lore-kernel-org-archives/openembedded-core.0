Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80261C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 23:19:10 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.3236.1636586347739549709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 15:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EfpwMWDf;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636586348;
  x=1668122348;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LZpoeIm0HJ9rj34/R/5JAp8Gk7sgnObA7gqtM9PHe7s=;
  b=EfpwMWDfELJQDqosWf0wg1ONzR2nsA672EqEspjH9UIOVV76CI5GG37Y
   X4ZkPK2Tuqxr5JfKAL9YPjivXJ9QVMbcEjlClhYlVq1FO3FmX5BMOZu5m
   EVL4dbi7GpZFAFerHGvcfhd7NtYsR/0BU/VjeqZQByn0/0TIsQbh6UgS1
   zC/4Ju6ih77NOw4gHa6cDAlvNg+Y3WxqW9QKPJER74V2jWB1bUwdTy/Be
   bER+sEivLgLg3CkCAWeVyr37+bk/6wz/jEL43ElwwJ0ibofPh9ZiII+Vu
   GNoRrLv7lwjJQy7CXaN0xVlLUdhgKxwV3GtvAfpi00uhejhKflC5FJib4
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] mirrors.bbclass: Clean up the additions to MIRRORS
Date: Thu, 11 Nov 2021 00:18:52 +0100
Message-ID: <20211110231856.5799-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 23:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158116

* Since commit ce0579dc in bitbake (fetch2: Revert the regexp removal
  for the type field and instead anchor regexp) the type regexp has
  been automatically anchored at the end.
* Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
  entries) there is no need to separate the entries in MIRRORS with "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/mirrors.bbclass | 134 +++++++++++++++++------------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 08abcce52c..dc95cc1174 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,75 +1,75 @@
 MIRRORS += "\
-${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \n \
-${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \n \
-${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \n \
-${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.de.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.au.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.cl.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.hr.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.fi.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.hk.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.hu.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.ie.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.it.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.jp.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.no.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.pl.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.ro.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.si.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.es.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.se.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	http://ftp.tr.debian.org/debian/pool \n \
-${GNU_MIRROR}	https://mirrors.kernel.org/gnu \n \
-${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
-${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \n \
-${GNUPG_MIRROR}	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \n \
-${GNUPG_MIRROR}	ftp://mirrors.dotsrc.org/gcrypt \n \
-ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
-ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
-ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
-ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
-http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
-http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \n \
-${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
-${APACHE_MIRROR}  http://archive.apache.org/dist \n \
-http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
-${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
-${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
-ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \n \
-ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \n \
-ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \n \
-cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
-bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
-osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
-ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
-cvs://.*/.*     http://sources.openembedded.org/ \n \
-svn://.*/.*     http://sources.openembedded.org/ \n \
-git://.*/.*     http://sources.openembedded.org/ \n \
-hg://.*/.*      http://sources.openembedded.org/ \n \
-bzr://.*/.*     http://sources.openembedded.org/ \n \
-p4://.*/.*      http://sources.openembedded.org/ \n \
-osc://.*/.*     http://sources.openembedded.org/ \n \
-https?$://.*/.* http://sources.openembedded.org/ \n \
-ftp://.*/.*     http://sources.openembedded.org/ \n \
-npm://.*/?.*    http://sources.openembedded.org/ \n \
-${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
-${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
-https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.de.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.au.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.cl.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.hr.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.fi.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.hk.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.hu.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.ie.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.it.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.jp.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.no.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.pl.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.ro.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.si.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.es.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.se.debian.org/debian/pool \
+${DEBIAN_MIRROR}	http://ftp.tr.debian.org/debian/pool \
+${GNU_MIRROR}	https://mirrors.kernel.org/gnu \
+${KERNELORG_MIRROR}	http://www.kernel.org/pub \
+${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \
+${GNUPG_MIRROR}	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \
+${GNUPG_MIRROR}	ftp://mirrors.dotsrc.org/gcrypt \
+ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \
+ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \
+ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \
+ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \
+http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \
+http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \
+${APACHE_MIRROR}  http://www.us.apache.org/dist \
+${APACHE_MIRROR}  http://archive.apache.org/dist \
+http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \
+${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \
+${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
+ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \
+ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
+ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
+cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
+bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
+osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
+ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
+cvs://.*/.*     http://sources.openembedded.org/ \
+svn://.*/.*     http://sources.openembedded.org/ \
+git://.*/.*     http://sources.openembedded.org/ \
+hg://.*/.*      http://sources.openembedded.org/ \
+bzr://.*/.*     http://sources.openembedded.org/ \
+p4://.*/.*      http://sources.openembedded.org/ \
+osc://.*/.*     http://sources.openembedded.org/ \
+https?://.*/.*  http://sources.openembedded.org/ \
+ftp://.*/.*     http://sources.openembedded.org/ \
+npm://.*/?.*    http://sources.openembedded.org/ \
+${CPAN_MIRROR}  http://cpan.metacpan.org/ \
+${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
+https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
 # where git native protocol fetches may fail due to local firewall rules, etc.
 
 MIRRORS += "\
-git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \
-git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \n \
-git://.*/.*                   git://HOST/PATH;protocol=https \n \
-git://.*/.*                   git://HOST/git/PATH;protocol=https \n \
+git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \
+git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \
+git://.*/.*                   git://HOST/PATH;protocol=https \
+git://.*/.*                   git://HOST/git/PATH;protocol=https \
 "

