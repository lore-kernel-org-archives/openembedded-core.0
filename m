Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 262B660670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 11:59:30 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so14059406wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 03:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MuFkbnrJUuWAJHH//s//MUhnDdQE92bvse/HDWYZIsE=;
	b=WiAm8TrwGyij1Vl+8kvkQxP47/344p+E1hQV1vHrWZ7TbtLPcnr8EQ4vfGShPU9odC
	6VJkzbV98Luu8WN2OcrrjnIu0bzU3BAC63E0H21t3ydoQeiqENNGDIyVUE+mWM3YfLEN
	ypFzCa+ESdpbUw+/L06dEmlBHcG+d7XjuVJ95KlymqGul17//O8UZZbKMzPSCqxdLhsg
	84HVwHp3PoxVH1/jpT1kzP4KZ9SfvDLbt8Vz4cHoxWjmVcl4f7JiRzj5NRqt15bQ8oQs
	0YgOA+syCT4nIUXX9njzcCus4kQGvU9Witn9NAzX9Hk4EvsSEs/qyJOUJrIshDuqSLO5
	eUqA==
X-Gm-Message-State: ALoCoQlckfVBTOsVr7lppB4x2vL5t+wbpQeHViyb4dhdRI3Hb/fm4/iTQW7X8jtg/W2Uin0rIA3P
X-Received: by 10.180.7.201 with SMTP id l9mr29097842wia.80.1421063969257;
	Mon, 12 Jan 2015 03:59:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dp8sm9901400wib.20.2015.01.12.03.59.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jan 2015 03:59:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jan 2015 11:58:09 +0000
Message-Id: <1421063889-28362-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: add missing RDEPENDS
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
X-List-Received-Date: Mon, 12 Jan 2015 11:59:32 -0000

systemd-ptest also needs a Python interpretter.  Also remove the redundant
comment.

systemd-kernel-install is a bash script that can't be trivially ported to POSIX
sh.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_216.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index eceead9..bfd5544 100644
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
1.7.10.4


