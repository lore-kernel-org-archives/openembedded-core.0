Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TDxWf-0005bT-AI
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 15:07:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1986; q=dns/txt; s=iport;
	t=1347972903; x=1349182503;
	h=from:to:cc:subject:date:message-id;
	bh=I9EI45U6XI1xUhEoxGfAg9Z1b6kj4y6WLQ2HCAVrm4o=;
	b=fKJFGyZBP9/laSWDPnDhM0/SYLBIB1eH0P3GzTh7YKfTYjfzliSOiDbm
	fUNWMDW8/Xpf/JH/v/dr7Rz4TzucTxHaXYv8tXLMqdpWOL5aGmvPF1kN6
	YXPnsBskFyGxHWAxiuC1WYKturAjSoP2+gZUmUXPI+tylkS1MmjWFRGy8 Y=;
X-IronPort-AV: E=Sophos;i="4.80,442,1344211200"; d="scan'208";a="143982730"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-1.cisco.com with ESMTP; 18 Sep 2012 12:55:01 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q8ICt0mX005493;
	Tue, 18 Sep 2012 12:55:00 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 14:52:27 +0200
Message-Id: <1347972747-7040-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] bash: Make it possible to run bash 3.2.48 instead of 4.2.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 13:07:41 -0000

bash-3.2.48 did not provide the linking from sh to bash, making it unusable.
This patch fixes this. The reason for using 3.2.48 is that it is GPLv2 licensed,
which 4.2 is not.
---
 meta/recipes-extended/bash/bash_3.2.48.bb |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 509d7a0..bab38a1 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
 DEPENDS = "ncurses"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
@@ -25,16 +25,18 @@ SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede
 SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
 SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
 PARALLEL_MAKE = ""
 
-bindir = "/bin"
-sbindir = "/sbin"
-
 EXTRA_OECONF = "--with-ncurses"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
+ALTERNATIVE_PRIORITY = "100"
+
 export AUTOHEADER = "true"
 
 do_configure_prepend () {
@@ -43,6 +45,14 @@ do_configure_prepend () {
 	fi
 }
 
+do_install_append () {
+	# Move /usr/bin/bash to /bin/bash, if need
+	if [ "${base_bindir}" != "${bindir}" ]; then
+		mkdir -p ${D}${base_bindir}
+		mv ${D}${bindir}/bash ${D}${base_bindir}
+	fi
+}
+
 pkg_postinst_${PN} () {
 	touch $D${sysconfdir}/shells
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
-- 
1.7.8.6



