Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5003.1628670638011960669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 01:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B8UZK2006536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 01:30:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 Aug 2021 01:30:35 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 Aug 2021 01:30:35 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] util-linux: add back manpages related settings
Date: Wed, 11 Aug 2021 01:30:35 -0700
Message-ID: <20210811083035.57126-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There was a time that util-linux requres asciidoctor to be there
to have man pages. However, now the tarball ships generated man
pages and will use them. So add back the related settings. Otherwise,
we get the following error when enabling 'doc-pkgs' image feature.

  + update-alternatives --install /usr/share/man/man1/kill.1 kill.1 /usr/share/man/man1/kill.1.procps 200
  update-alternatives: Error: not linking /.../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/usr/share/man/man1/kill.1 \
  to /usr/share/man/man1/kill.1.procps since /.../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/usr/share/man/man1/kill.1 exists and is not a link

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/util-linux_2.37.1.bb           | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.1.bb b/meta/recipes-core/util-linux/util-linux_2.37.1.bb
index b67c3dcb53..9351595144 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.1.bb
@@ -1,7 +1,7 @@
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
 
 PACKAGES =+ "${PN}-swaponoff"
@@ -92,6 +92,9 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 #
 PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+# inherit manpages requires this to be present, however util-linux does not have
+# configuration options, and installs manpages always
+PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
@@ -263,6 +266,32 @@ ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
+ALTERNATIVE:${PN}-doc = "\
+blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
+mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
+"
+ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
+
+ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
+ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
+ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
+ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
+ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
+ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
+ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
+ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
+ALTERNATIVE_LINK_NAME[setpriv.1] = "${mandir}/man1/setpriv.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
+ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
+ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
+ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
+
 BBCLASSEXTEND = "native nativesdk"
 
 PTEST_BINDIR = "1"
-- 
2.30.2

