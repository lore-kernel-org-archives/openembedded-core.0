Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id C87DB60167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 15:52:09 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so11022182wid.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Oct 2014 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ZG+PfOkB/qrkZWpD07QcL8r7HmRsC4na13UNx/CTSq4=;
	b=e42py/tr+7E5nW2lR5UkmgoMXfYFnV3S+0DQGqL23cK0c5WiCshUw5qpZcfSGfj1Ah
	PkhhPgnRIcCTv5ir+UM0CEmU87TpzM3aUB/flu9E0ehS7pUsilx0Iu9VZFQKO2feb76L
	yifp2qAYzboBrWyi2yfs9wWClX3kyy/lLtN1MCs8i73wl20Dx5M86tRco5Ggwd/8Q27I
	pD6n1eC3ZjpsX/SWuBoPVWYh000EScX1lfv3d+nRguveVb2NF1+eFV3wANcAdKzZAcYl
	VLlNc1GhUXXizKTd+uld74qo4LQZQxBVPMMs78+Q/mfzStNxHdJfntTsUHH+yesQf3l8
	ePyA==
X-Received: by 10.180.184.225 with SMTP id ex1mr24363402wic.22.1412783530337; 
	Wed, 08 Oct 2014 08:52:10 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id pk9sm527948wjb.16.2014.10.08.08.52.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Oct 2014 08:52:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 17:52:00 +0200
Message-Id: <1412783520-14196-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412783520-14196-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412783520-14196-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: systemd: make symlinks for gudev instead of moving around
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
X-List-Received-Date: Wed, 08 Oct 2014 15:52:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

alternate solution to Martins's approach in [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-October/097713.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..c655f9a 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -129,8 +129,15 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
-	# Move libgudev back to ${rootlibdir} to keep backward compatibility
-	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
+	# Make symlinks for libgudev in ${rootlibdir} to keep backward compatibility
+	if [ ${rootlibdir} != ${libdir} ]; then
+		for file in `find ${D}${libdir} -name 'libgudev*'`; do
+			filebase=`basename $file`
+			linkloc="${D}${rootlibdir}/$filebase"
+			relpath=`python -c "import os.path; print os.path.relpath('$file', '$linkloc')"`
+			ln -s $relpath $linkloc
+		done
+	fi
 
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
@@ -171,10 +178,10 @@ python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
-PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
@@ -188,6 +195,8 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_libgudev = "${libdir}/libgudev*${SOLIBS} ${rootlibdir}/libgudev*${SOLIBS}"
+
 # The test cases need perl and bash to run correctly.
 RDEPENDS_${PN}-ptest += "perl bash"
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
-- 
1.8.3.1


