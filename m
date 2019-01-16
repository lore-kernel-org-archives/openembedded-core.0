Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC227C1AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:42 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id h32so2415001ywk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bCUSYyHFruxYqKeC5ien3uhIdhqFYn4QjTwpXXVa5ls=;
	b=pSm6Y9i3GuGKukKO8E0b8e65XSaTKycKCvCS7R4Cc9tbYjZ8mouaC4XkkdHvAg9gia
	y3fH6Q6gQ57ouiQLnfNKqnx9bACpIkb0AXv6+MY3T3bOL/l8Ks8xFjlWq34z11+DgCIo
	KP41Zrkyetkd8CjZNqqEFWKKSysvce0HBnAgSPwNdxvihaAH2LIKHt3CSMChr0byFXNl
	2qrzHXfC8vT45lmEt02v3ElIooF9u896POcDXcVEvAuYILx7xjVTVjDo9OYkjTQYGbrt
	nYp3lbjxoqDAiN6uECmfX32Ys5Ez0q5FpOrVkNNjZFpdv1BixVvFRQMB3ArH7/+zsbrZ
	6GNg==
X-Gm-Message-State: AJcUukeVQW2xO/3WA8+rmpumgcVz2xckFDDTuOB8otEkfyTA54dMtdx8
	P3tPN4/quz0WxZRDMf+aqOG2Y0gW
X-Google-Smtp-Source: ALg8bN4XPZyOB6QDux/eEmmQNczyjB9jr9T/GKzJukyBDVc5StZKScGsuEsRznKTWQ469/WZUU9XwA==
X-Received: by 2002:a81:4641:: with SMTP id t62mr7423087ywa.261.1547643103290; 
	Wed, 16 Jan 2019 04:51:43 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:21 +0000
Message-Id: <20190116125124.20177-13-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 12/15] util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The util-linux meta-package now simply RRECOMMENDS all
subpackages created. There is no distinction between what
it previously recommended or depended on for existing
packages.

This is to streamline the dependencies and to make things
less surprising.
It also stops the -dev package from depending on non-existing
packages like util-linux-losetup-dev etc.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v3: update commit message
---
 meta/recipes-core/util-linux/util-linux.inc | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7e3887dc92..000db880a1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,16 +33,14 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pyl
 
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+
         if d.getVar('ALTERNATIVE_' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
-    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
-        pn = d.getVar('PN')
-        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
-        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
-
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
@@ -54,11 +52,11 @@ python util_linux_binpackages () {
     do_split_packages(d, root='${sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='', prepend=True)
     do_split_packages(d, root='${bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='', prepend=True)
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -111,12 +109,6 @@ FILES_${PN}-setarch = "${bindir}/linux32 ${bindir}/linux64 ${bindir}/uname26"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
-
-RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
-RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
-
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
-- 
2.20.1


