Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABBF73A01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:15:11 +0000 (UTC)
Received: by padfa1 with SMTP id fa1so7216272pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aNLVcMyTyJ11FoNg02F7ceKK0aIckULBrKdJyMOfFbQ=;
	b=hgpwSsG3sAeAdePBP6k1jxTkVe0NoQAYJxluedjfImbOzGtAqfZ+6tmH+SWLaU30gM
	GCtX5MqXlCUob8kL9ij/CknzYfqgTGWJRl7N7SaJ2ARNcU6FEEwrwgp6869/9b2Ofsw8
	Qdv06T4M3kTiG3z8Vvox/nvmHGNeulCbpFYGxOGH5mEOehCB1BWWkNVVw17aXErCcqyj
	AA91VgnDPlX/S60vP8jWZv98fE1z+nf/hSXwHa29VN2awG4xWbbd7R+12d8B58AtcTWd
	FEL/ZaR5ilkJ2YT2PWM/lUtuLTuJP/wwIp81W8UqZSdyg0S3GXcSuXY9XgsvqypN/mR1
	rEbg==
X-Received: by 10.70.108.195 with SMTP id hm3mr72332344pdb.105.1426040112567; 
	Tue, 10 Mar 2015 19:15:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	fz15sm3103158pdb.54.2015.03.10.19.15.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 19:15:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 13:14:54 +1100
Message-Id: <1426040094-26174-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [daisy][PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Wed, 11 Mar 2015 02:15:12 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_211.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 567c323..a808f3f 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -124,6 +124,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:root ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 }
-- 
2.3.1


