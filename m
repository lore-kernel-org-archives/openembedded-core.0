Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2592782CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:25 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id x128so7475987ite.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bsda0URUY7BHjY5r8q0T3vFaNRIerbL1pxlOkxTNEUI=;
	b=f8O6y+hQD6fz2o/eo1iqvcokTpu3qjl4OprcHiR2CmqxbhpCBknogmpPVNvZwYALWN
	NIL7nhsVi4xMqjcNdCDJqO7rlXMW8eVB7mYpCL7R5rBt8HYN5JwZ6ZHsqDf7INT2ZN4F
	TtMLF6dyLliSy06gbQQNnQwES92K5sSTgDlfzHnSSsrBuEYfZF0UJZBeHmONutPIcyoS
	zjk7mEkathrpsx5BTAgebw084WriVMFU0cwzCA97nb+rKRCWCuFzbuDoKKzIkGIOncYe
	qoiTmILB3D96t5Bami3SP++XRAXkwXj4zTQCeRe+FWdf1gkAi4h/QR8O988Eopp4PMrt
	yRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bsda0URUY7BHjY5r8q0T3vFaNRIerbL1pxlOkxTNEUI=;
	b=BUGV8DEgy5zuvhtT/B9QDyFEao/I5cxNfFK0BMT/Wm48e0sNJYpXiCBc6RfgLVJBWE
	Ay6wAAo8z1jodWSkrF/KbuZb/f/NZhoMxHKytCwM9BtHa+qAVQ+SHyfKqf4rKUgiRrQv
	WTQ2qwnFx2eA8+mMQwyKWzZesLrl6+Jh7wfdKsQnL7rJHjnjVKjkxaRRvuAbwCQ/2sTb
	wjri1GPmD6+ofHrcnJHTqhvlWoVsAnIFs4aJvHFDF0aBHfaamRWUl4wjj+Z66/+ZDlnt
	aTXRrI4+t+UV2X3OqPO3SeUzXdQyUS0LKyZSp14Vd6ZIwyh1UB8QLJmhN4/10swBWspv
	itlg==
X-Gm-Message-State: APf1xPD0WUpaqLYMJuDyhHAVJ4q+RPd7A8ZEaEU9KxUfkStZ7k8CTenM
	uSDGMnYfbpiXO3tzHNIQffpXravO
X-Google-Smtp-Source: AH8x2261MUInQynyVVmrfJZxSove4OT9phMOPxNZurreYlCK56MLIxuIo+336J3mUZnMEYoZSHXLRA==
X-Received: by 10.36.107.22 with SMTP id v22mr5768009itc.119.1518454346592;
	Mon, 12 Feb 2018 08:52:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:51:58 -0600
Message-Id: <eb39ffb5fdf03dbbb74701bff478f8162f880c8b.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 03/17] icecc.bbclass: Skip canadian-cross compiles
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:25 -0000

icecc.bbclass will no longer attempt to distribute cross-canadian
compiles. While it is technically possible to generate a toolchain that runs
on the build system and generates executables for the host system, this
is not the normal way that icecc operates. There are so few of these
recipes that it is probably not worth maintaining a distinct code path
for them.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 35a1aaef86f..9d5eaed57ce 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -101,6 +101,9 @@ def use_icecc(bb,d):
     if icecc_is_allarch(bb, d):
         return "no"
 
+    if icecc_is_cross_canadian(bb, d):
+        return "no"
+
     pn = d.getVar('PN')
 
     system_class_blacklist = []
@@ -151,6 +154,9 @@ def icecc_is_native(bb, d):
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
+def icecc_is_cross_canadian(bb, d):
+    return bb.data.inherits_class("cross-canadian", d)
+
 def icecc_dir(bb, d):
     return d.expand('${TMPDIR}/work-shared/ice')
 
-- 
2.14.3


