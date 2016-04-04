Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 44C12770C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:42:46 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id gy3so29652280igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tQjou/eTczImSke2jtK7hehiW+PoZbPtMORhkS8Ta1w=;
	b=GyYKy6MxqgiWJjNwbTbbpw5fX98f0CVP9/kxKRcBckRItRv5OpTraoNPqagcmIOVRb
	dPHXN9fTmQWV0kQQ0jf44OBaISd5T3VZfAaBnY/yobXXR1Q4vw+97J2iuLSMpKMi1+Ov
	gdSsEXzPVQ1xY5IyoXnL1ImZmwHlK/pagr3uaghoEBk/vpgAgQqs+gtd75b1lhqAIEZO
	a5Abvxvm7D/ooMPuLP8gdt3b0m2SAju9tdHxBrWSV85hO65ZSKjRzGoqHp++OpsfbMX9
	VNmHRBkwiIm4UoXzOxn4mSxRFVMt/mdmMB1e5YKIz0uCq/U7kqSROtqHQY8sQYBa46MM
	U3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=tQjou/eTczImSke2jtK7hehiW+PoZbPtMORhkS8Ta1w=;
	b=cSDW0fkBz586q1RVcD4e8mkjZtg29Fn2SjzQx1cJib5mYO3PDbcoTE1V8U8RNgFzv/
	frjSPS+Y7xFjnZkLeosnkaybmji1SCQ8m6+7nart4yftUXYd60UYfYs5QXbWliD3VPWR
	XapiMre/lUrhox2SZinZh52oXPGitM0Sp4hMVm6zXRg5t9ixH69LlLEhxOQQtshw0Rld
	EykRvXlCsTYXccTE2MlPW5bJMnP08NV2J3qdAcakMw66y+12MdR/mhjhrWK7DT1hL0NJ
	xPG66tLuQc+GPRtsyuuY7Jhc1cEbj1jHJ2HaptL3VDrmSyP0A11oUr7K+2jyuwlMQAlC
	mRBw==
X-Gm-Message-State: AD7BkJJWESYXHv8I7WmARzcSfy3/iv7DkNb6Uu41eMZBZ+jysUBzba+1VSTeF41MtBnqwy8S
X-Received: by 10.107.166.72 with SMTP id p69mr6066142ioe.100.1459777330026;
	Mon, 04 Apr 2016 06:42:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g67sm11657048ioe.34.2016.04.04.06.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:42:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:41 +0200
Message-Id: <2e83e470a0ff6d5bba926ade6fdb9c2bc0acdadd.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
References: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Subject: [PATCH 3/5] systemd: make systemd-serialgetty optional
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
X-List-Received-Date: Mon, 04 Apr 2016 13:42:46 -0000

Some distros may prefer to use the upstream systemd support for
starting getty on serial ports. This is now possible by adding
"serial-getty-generator" to PACKAGECONFIG.

The default is unchanged, i.e. systemd's own serial-getty@.service
file does not get packaged and instead systemd-serialgetty is pulled
into images via RRECOMMENDS.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index 309a4c3..c23c749 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -96,6 +96,11 @@ PACKAGECONFIG ??= "xz \
 PACKAGECONFIG_remove_libc-musl = "selinux"
 PACKAGECONFIG_remove_libc-musl = "smack"
 
+# Use the upstream systemd serial-getty@.service and rely on
+# systemd-getty-generator instead of using the OE-core specific
+# systemd-serialgetty.bb - not enabled by default.
+PACKAGECONFIG[serial-getty-generator] = ""
+
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
@@ -204,8 +209,10 @@ do_configure_prepend() {
 do_install() {
 	autotools_do_install
 	install -d ${D}/${base_sbindir}
-	# Provided by a separate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
+		# Provided by a separate recipe
+		rm ${D}${systemd_unitdir}/system/serial-getty* -f
+	fi
 
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
@@ -455,7 +462,8 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)} \
+                      systemd-vconsole-setup \
                       systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck \
-- 
2.1.4


