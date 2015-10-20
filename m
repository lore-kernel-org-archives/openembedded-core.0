Return-Path: <matt@madison.systems>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 46C717680C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:28:42 +0000 (UTC)
Received: by pasz6 with SMTP id z6so23218347pas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 07:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IfizaqiY2cp9+lNGNeXN8p6ZQDgWq+Ask09MueC2L5E=;
	b=AJgrGWTAWwGop0dDG5TLxuABDVvVGSpzIFXBrMu5k4EbaIG9WBxFhYXwF8d2GAGsnO
	FNLW6KbUxoBndGiPgQRP43N4hzYjZ6k7KSUnQQvrTKth2dzCKq1UCay8SQ43s83pLtFa
	78TNlNbnWYqcyVsFdvslxothg95ZpU18R0ehUzx5ljReXrZXaBLC74tEi9Gufe4Lkl2z
	ZQNDBLYrnQ91pEgAQU2m5tTfKSwJ0Ftm0Snx32x58dH6QEY9dQ4UNsBnP49uys8HcmfG
	02yz+7md0CTLE0kz+CEybOxe6YAf1zgAJWs5OtHjfKynnxKqTUQa4INM51+HJ/SssxC8
	xEPw==
X-Gm-Message-State: ALoCoQln611sketSqOoBbLAc+krvO8Wy81QgCqbifBEnqgBS5UF8bGqrYcfgRZjovcNOPRIW/vTn
X-Received: by 10.66.222.70 with SMTP id qk6mr4446534pac.68.1445351322498;
	Tue, 20 Oct 2015 07:28:42 -0700 (PDT)
Received: from workhorse.athrat.org
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	ir5sm4173775pbc.13.2015.10.20.07.28.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 07:28:42 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 07:28:05 -0700
Message-Id: <1445351285-32645-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] i2c-tools: fix inverted RDEPENDS
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
X-List-Received-Date: Tue, 20 Oct 2015 14:28:45 -0000

The runtime dependency between i2c-tools and i2c-tools-misc was
backwards when the packages were split.  With this change,
including i2c-tools in an image no longer drags in perl.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
index 92f4d69..042695b 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
@@ -30,5 +30,4 @@ FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
                         ${bindir}/decode-dimms \
                         ${bindir}/decode-vaio \
                        "
-RDEPENDS_${PN} += "${PN}-misc"
-RDEPENDS_${PN}-misc += "perl"
+RDEPENDS_${PN}-misc = "${PN} perl"
-- 
1.9.1


