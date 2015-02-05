Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9BC72701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:43 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so8533181pdj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eSHoHhqCaI7Q1ifiXoqdoxQ9NwbLoAJmxM6oCN7kUY0=;
	b=m/TycgM3Jymq8kDShfsCZiAgl092xrsQybImLf218l1ePQYXo5ZY/fqSs2UEsmX6HV
	gtSIqm9/nwXqxgIzitFvzDG13GQB2kzBXWN/91/PWipaRQdwkrsmAtkAK6Ex2QYqOaaH
	q9rEcCSNqaH1A335w2yTC3cMpKXIonLgIUSqHLlj4BnKhlKsEcAAK8o0aowb8VUdVTlm
	q4IzLN6VSCFrY5Wuaj9/3G88XXy3c3dPIzplHLMoOAqhWECH97P3jdX+DpzCJCm2KqbT
	a3L58AzaYx3FUH4P0g5zAE2VRbBgZHVcd18xpc+ro4a28wUuAR3SrNFPQMTpAoFFsbYC
	5Ejw==
X-Received: by 10.66.190.163 with SMTP id gr3mr6106652pac.117.1423152284806;
	Thu, 05 Feb 2015 08:04:44 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:24 -0800
Message-Id: <2e33ad91a83bbbf7356fba057f056551a89a8af5.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 16/61] systemd: add missing RDEPENDS
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:43 -0000

From: Ross Burton <ross.burton@intel.com>

systemd-ptest also needs a Python interpretter.  Also remove the redundant
comment.

systemd-kernel-install is a bash script that can't be trivially ported to POSIX
sh.

(From OE-Core rev: 9f6b34493d332f9eff54c3eb2da9483a344e6d3c)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 8e1b5aa..5e76f7c 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -192,8 +192,7 @@ RDEPENDS_${PN}-initramfs = "${PN}"
 
 FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
 
-# The test cases need perl and bash to run correctly.
-RDEPENDS_${PN}-ptest += "perl bash"
+RDEPENDS_${PN}-ptest += "perl python bash"
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
 
 FILES_${PN}-dbg += "${libdir}/systemd/ptest/.debug"
@@ -204,6 +203,7 @@ FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
                               ${systemd_unitdir}/system/systemd-vconsole-setup.service \
                               ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
+RDEPENDS_${PN}-kernel-install += "bash"
 FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
                               ${exec_prefix}/lib/kernel \
-- 
1.9.1


