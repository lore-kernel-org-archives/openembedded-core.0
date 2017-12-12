Return-Path: <allenwild93@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 120E26E5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 02:49:20 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f2so43938673qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 18:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+sqLktLP5pWsCGDPDJTgju14JZC61XmCGignrBF8ETY=;
	b=Jy0BQhlzsL5laakcyEXiK8rlskNWHon4USNh+tWIlDY14/5NLayp9FOdigBcDeHuRR
	WTDd/RbYlAfIERihLtDIVrgpmLbhqnXKmIeIBpNWGj5mB06fdgLdcKzaP6U3joyHwmVV
	HYyY9cCWt3EVWmqHltxJ4Hs0921TfO3D6MY/qCHK04pzi0tnjClXCJCOJ5IAGbo1Hug3
	Ouq4dqXCH9Q5EftgbXkkLc7kLsv5BuD+ofbDrlzJJoEAOycyJBUMbMWvlM7ot+JZKM0U
	CDmTniueTu2Prg3cRLfzxtOfkiVAUjnKbWsi1kQxI7/0kDuNRJesugYZHHsWbtvagPFD
	eECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+sqLktLP5pWsCGDPDJTgju14JZC61XmCGignrBF8ETY=;
	b=gT+OsXIW8rHfi9UNXRwfZTMbGk+ujAV10SXMOGJeHR/lvbl7A3NKiqSjRJpwAS8hhQ
	vkFEWzHF3HSaGFbM6rqL3jbQB6EhL57vZAJpCTWjTkXaewhQDsK0G7NEEsrjecfegg7z
	SQ04s/2Ec9qMX3oVXRJM+45bp2oH8hQgDmgyiKKVRqsydYXD0bFmeVxcjyc6ldcXHVC6
	Tnm/kvCGJQKTLk5AVyC7PmsyrzNaKSdKNBOHw2eNj3FfC7noSybLUfpePoMFtPZ9WkTo
	/xK9IGKUUYPlRDuUJIV1aX4w74sfZp3trObSIH1pemGwW3yI6JrKuD9mEbUaqL2T/TpG
	6NlQ==
X-Gm-Message-State: AKGB3mIRP/VpcUddaj/blADcLlrzmGvBFqBEtfwI8uhzAFywPf8Z8C9M
	UhqLR4NHeJ7AlSM6h32vpMzGAl7+6x0=
X-Google-Smtp-Source: ACJfBouk+FMEHbuYWFe/i9Ht4FRcOVY+nlssGpCVR1nJg7dGRBUvdXk9BC8wFUBD6xK2PxzitsmFJg==
X-Received: by 10.237.39.155 with SMTP id a27mr3660940qtd.201.1513046961707;
	Mon, 11 Dec 2017 18:49:21 -0800 (PST)
Received: from cloudcat.ec2.internal (ec2-52-7-41-62.compute-1.amazonaws.com.
	[52.7.41.62]) by smtp.gmail.com with ESMTPSA id
	v17sm5034257qkl.36.2017.12.11.18.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Dec 2017 18:49:20 -0800 (PST)
From: Allen Wild <allenwild93@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:49:17 -0500
Message-Id: <20171212024917.14550-1-allenwild93@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Tue, 12 Dec 2017 02:49:21 -0000

Syslinux compiles successfully with Gold, but at runtime Isolinux fails
to boot, getting stuck at the version screen without loading the menu.
Forcing the BFD linker fixes this.

To future-proof, use an inline python replace rather than duplicating
the definition of LD in bitbake.conf

Signed-off-by: Allen Wild <allenwild93@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index f8b1094096..c61adec577 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -34,6 +34,11 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 INSANE_SKIP_${PN}-misc = "arch"
 INSANE_SKIP_${PN}-chain = "arch"
 
+# isolinux isn't compatible with the Gold linker, so force BFD
+# some python replacing is used here to avoid getting out of sync with the definition in bitbake.conf
+SYSLINUX_LD = "${LD}"
+SYSLINUX_LD_class-target = "${@d.getVar('LD').replace('%sld'%d.getVar('HOST_PREFIX'), '%sld.bfd'%d.getVar('HOST_PREFIX'))}"
+
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
 	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
@@ -58,11 +63,11 @@ do_compile() {
 
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
-	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${SYSLINUX_LD}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
 }
 
 do_install() {
-	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" install INSTALLROOT="${D}" firmware="bios"
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${SYSLINUX_LD}" install INSTALLROOT="${D}" firmware="bios"
 
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
-- 
2.14.1


