Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 32317780F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:44:18 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id v202so8276425itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E8I89qwFvhv8jH2+XANbjoAXHc9qSF2HWk9A9U99Gkw=;
	b=CmmLtLYEp3W99RnNnEZAVg7LUQw/V1jHIAQ4hDSKFPhQ5hIpjff4joWPsecDMSqXKh
	5br1gvn6BtN5zWOgnTRxwV3qUrYa/lPXIqgSQCtDQTPRDvJ0rLBfCy2q5aEZANJt/WQY
	W1nrozqdayxsAJNcqgwellCuLAne8Vu3J713SsVIY+eXmm+FYaSWwdPHTNzAEoJJ/kzQ
	u6TPbD3Pu9Xe5W04qRldjfZqtqeXyzHqmgiWLxm2IaJRaTFFQbMLaxX5gy6cBtgyCJT3
	i8Fl0slGoOL3xgAtjj3RdH/5qSp11qj6o9+nePKEwCeRTH67To5c6PBcgS8Y/BEO6BqX
	4+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E8I89qwFvhv8jH2+XANbjoAXHc9qSF2HWk9A9U99Gkw=;
	b=H/LlmE5Mr/gLCegazmw0b2XiPJsNrH7oEXdj8wKgxVFIH2zEAR1BWUEiYlHkCLw7CT
	qple3l2hyY0qrUArX/jmLmHhXSYgbWx4RhNAHqDZRr0cNDad0gvKjZSB2AGNTxnqm2lC
	/8SWA+kUyavRIv3+022pgSQWxgwGv7easR0jx0n5hxItF7bzqrm3GsHdU+RSkQhu+4b8
	qOMRNZb7Bjw0Yq3A2X1sZA+kw0cJTlaVEsShtCvp1oyMgKCYuim6xidbMHZUz37fNski
	XQuq+xsm5vOqhIvai4u3+es/M25fi/Xu4ohUSNc3ejGtCNug8qL+CxSGPTuV5tWyovrv
	x/KQ==
X-Gm-Message-State: AIVw113CNJmHOHtp8jN1exac6LytWLlCGen9y3NsMPrtEUFK6YTd/Acz
	ftiI3f0B+hFUR36V3kQ=
X-Received: by 10.36.54.205 with SMTP id l196mr21073752itl.94.1499849059671;
	Wed, 12 Jul 2017 01:44:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F424.dip0.t-ipconnect.de.
	[93.232.244.36]) by smtp.gmail.com with ESMTPSA id
	j96sm1248695ioo.49.2017.07.12.01.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 01:44:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 10:44:11 +0200
Message-Id: <6051ac9166771c12ddd02dd094d065ee5114869d.1499848992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.295e104beddcf41cf864decc94ea28047dd54ec1.1499848992.git-series.patrick.ohly@intel.com>
References: <cover.295e104beddcf41cf864decc94ea28047dd54ec1.1499848992.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] util-linux: fix "su -" and package su separately
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
X-List-Received-Date: Wed, 12 Jul 2017 08:44:19 -0000

"su -" == "su --login" was broken because it uses /etc/pam.d/su-l and
lacking that, falls back to /etc/pam.d/other which denies the
operation. The fix is to symlink "su-l" to the normal "su" pam config
file.

Because "su" usually comes from "shadow" and has been broken like this
without anyone noticing, it probably is not used much and thus should
be packaged separately so that it can be installed only when really
needed. For backwards compatibility, "util-linux" still pulls it in.

It is a bit strange that DISTRO_FEATURES are getting checked when
deciding whether the packages should be defined. It is not wrong, the
packages will be simply empty and thus probably not created when the
distro feature is on and the package config is off. Perhaps there is a
reason, so this is kept unchanged. The symlink however only gets
created when su.util-linux really gets built.

[YOCTO #11126]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1656e92..47c2839 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,7 +35,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
 PACKAGES_DYNAMIC = "^util-linux-lib.*"
 
@@ -91,6 +91,8 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
+FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
+CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
@@ -116,9 +118,10 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_util-linux-reset += "ncurses"
 
 RDEPENDS_util-linux-runuser += "libpam"
+RDEPENDS_util-linux-su += "libpam"
 
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
 
@@ -182,6 +185,12 @@ do_install () {
 		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
 		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
 	fi
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
+		# Required for "su -" aka "su --login" because
+		# otherwise it uses "other", which has "auth pam_deny.so"
+		# and thus prevents the operation.
+		ln -s su ${D}${sysconfdir}/pam.d/su-l
+	fi
 }
 
 # reset and nologin causes a conflict with ncurses-native and shadow-native
-- 
git-series 0.9.1

