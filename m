Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F70B73ABA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:44:10 +0000 (UTC)
Received: by pdjp10 with SMTP id p10so7201122pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V/yaMtFUArrU/nQfuWyHg9QcaW9NDvD5xDC/IweBMPM=;
	b=J+VFED08vi5UoLKy3Jaa5u8V9ryEIsUFBZUHN+bT+ujUhS+/FER94R+K4x5lB768Mn
	htdfmBg0oep9n8XWyShe0xXMs7y5axvrR5pwBVb3mqfLSzwLUOGgXCu5uKfqCvU1H3Z2
	8tRlX67jtsAaGljqekfVW9tQcEpwTc7fAvBHDiASNm1GHcIqPSiHNZR5nkLAU5z/Lo7V
	WstMO7eskuSOeYnSvbJyxLkj6Z6su3FqUVnbvp35+DITj0Er5FDCvilRWVKB0fgjWxH4
	ViKorEhKuDOPeVXLQjA1/RUr96YyySNBa/dyMsVJkifoyU+Lyobpzb93h6jp802yERv9
	v/YQ==
X-Received: by 10.66.132.6 with SMTP id oq6mr74192403pab.29.1426041852205;
	Tue, 10 Mar 2015 19:44:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nw3sm3128778pdb.71.2015.03.10.19.44.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 19:44:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 13:43:49 +1100
Message-Id: <1426041829-28814-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [dizzy][PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Wed, 11 Mar 2015 02:44:14 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 3852841..5df8a1a 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -136,6 +136,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:root ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-- 
2.3.1


