Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4C67825F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 23:05:45 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o63so2683198qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 16:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=QEaBU94RyuliBw3ioh7mK/4cojMbIUiUCOtqnNj7GFw=;
	b=RGHB3xEZVU7hdYAtQ9qZArrqQLr8nFPdltyKZW1q9/JToQalL0HMA+6moOa8lJNcw6
	nNmEMRfhdKiXzitERsz01QS1pSOeCU2zqWhjoqK84SxtQGAK80cx6LDe73uQEU9XITw/
	z+1LXADbc/ryvK9StADbMNiARJXTatGWopBOsRrquL8/1QxBOl05rvmvf7OU8qYEXIJC
	a0lO79uIOpPOLrb4eplkNZ4feue5NPJunc4U8psrNkzcjs7I2KiVVR1uHOzp/t7JQyG4
	Vd9ZfyeKA2lYhiYmBGNM5jZ//hbxTpPBQuuD2qSRVtBEuxj821zuinB94STX6f2BSD+P
	4H1Q==
X-Gm-Message-State: AHYfb5glaqw1p2+7mREX0bYxTsmqov2mMHYK7B12l0Zac4/dXSjH5Rqa
	TdyPp1YfTZr+kRJK
X-Received: by 10.55.112.66 with SMTP id l63mr4012245qkc.302.1503788746691;
	Sat, 26 Aug 2017 16:05:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	n40sm3152997qtc.97.2017.08.26.16.05.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Aug 2017 16:05:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 26 Aug 2017 20:05:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Aug 2017 20:05:37 -0300
Message-Id: <20170826230537.26171-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sat, 26 Aug 2017 23:05:46 -0000

There is no COMPATIBLE_HOST in the recipe neither it makes sense for
this to be machine specific.

Possibly, initramfs-framework's based modules may be machine specific
but if there is the case they can just RDEPENDS on
initramfs-framework-base and provide the specific module as another
recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9d69a696f1..94bf1756e3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,12 +3,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r2"
+PR = "r3"
+
+inherit allarch
 
-# While the packages maybe an allarch due to it being a
-# simple script, reality is that it is Host specific based
-# on the COMPATIBLE_HOST below, which needs to take precedence
-#inherit allarch
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://init \
-- 
2.14.1


