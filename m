Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
	[209.85.219.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB4E7C119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:01:01 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i6so2400507ybo.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5Mp2jMtdFkarTAl1NDy7ElGDvPrciUU6pLnfUKX5ecM=;
	b=qhLdBjcKQeo1tIOGGGvNF8DMvjvVrC2sZKL89t5akRhyZ7CboGTITrwY/iMnKZVB20
	p4hvVDTnP/a/8oqAOabDW0BhFeM5on2sddmWPmcBmHUl5ZMBI9j4XCGAseeRUPVDyUiy
	ZWre2SrNmRY+46cgRBUlz2bLwSnje9PJWikI8W2b3v5dUMgjvSkjWX2URfVhiyUZ91oK
	oNL4557QwfYtD3JQaRHAEscsVDDSykMsn/9JA5CZea2PHADLDAnUw7PZ5kRStwTy5gTC
	Pf81llfGqInDKptF82Lqb1hG30gSQil+1HT/zZzZSlH/hZhR1J9Pwa+a3HQPfXWcDHUm
	Zdvw==
X-Gm-Message-State: AJcUukd/CIyKvjmxexBoZmd4U9a5d4xeVDYpOt5M3UMtbXnKoIlqRdz7
	+HHGyBCw+qGnyWrOHq9a9D19o9Ds
X-Google-Smtp-Source: ALg8bN4DU9jxzfx8GLnWZmBof/AoL2ppSxxSqrj1VLijMz7l/uuMcGnR4BPH/9UOguP7uuONRSA1nQ==
X-Received: by 2002:a25:424b:: with SMTP id p72mr6892365yba.19.1547640062251; 
	Wed, 16 Jan 2019 04:01:02 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.01.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:01:01 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:41 +0000
Message-Id: <20190116120051.12182-6-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 05/15] util-linux: fix the su and runuser packages
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
X-List-Received-Date: Wed, 16 Jan 2019 12:01:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The packages get an automatic RDEPENDS via shlibs, no
need to explicitly state it, so we can drop those
useless explicit assignments.

su is moved into ${base_bindir} in do_install(), so
because of a mismatched FILES specification su is
actually packaged into the main package at the moment,
not into the -su package as likely originally intended.

runuser needs the pam configuration files, so they should
be in the -runuser package, not in the main package.

While fixing this, we can simplify the update alternatives
processing for su.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e479fc24e1..4a72e3d40e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -96,7 +96,8 @@ FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
 FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
-FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
+FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES_util-linux-su = "${base_bindir}/su.${BPN} ${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
@@ -122,9 +123,6 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid.${BPN}"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_util-linux-runuser += "libpam"
-RDEPENDS_util-linux-su += "libpam"
-
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
@@ -228,6 +226,7 @@ ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
+ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
@@ -235,6 +234,7 @@ ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
@@ -263,6 +263,9 @@ ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_util-linux-mount = "mount"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 
+ALTERNATIVE_${PN}-su = "su"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+
 ALTERNATIVE_util-linux-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
@@ -305,15 +308,6 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 
 BBCLASSEXTEND = "native nativesdk"
 
-python do_package_prepend () {
-    if '--enable-su' in d.getVar('EXTRA_OECONF').split():
-        d.appendVar(d.expand('ALTERNATIVE_${PN}'), ' su')
-        d.appendVar(d.expand('ALTERNATIVE_${PN}-doc'), ' su.1')
-
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su", d.expand('${base_bindir}/su'))
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su.1", d.expand('${mandir}/man1/su.1'))
-}
-
 python populate_packages_prepend() {
     do_split_packages(d, '${base_libdir}', r'^lib(.*)\.so\..*$',
                       output_pattern='util-linux-lib%s',
-- 
2.20.1


