Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B4134613AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 23:48:49 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z7so6492471wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pyJjY7vPjIqz/qDbg8TDM078dPTUXYTRxrA2yw+lFvE=;
	b=NEZOQCD2Gwxx7OMcAE7EX2uS6nsFHV1o5/rdR/ofFS3sG8PVV4IFHQ6cz/sAmXHXmN
	n1CLSFVsN+mSXifOoqJ8rHI5oGmEgb6+/Qfrnyw1pV3tosEVGfIs/UbC87dy4NEcJokI
	QRWkD3IxeOJXZJCdDDsrqz9cu8bsW6lk8zCT85t+k8QBvboU2dJdoMA08nTcZrgrQc2e
	xWeNYjmNpvbqit0wzznO8xngwb7E8VGEKfdqIvdfRN7Bd0vpwGkqiI/JcxQqGrHuH74P
	PjpMr5OBbR7og9pYJWQeGfvoxe4bFRH8QyS062hD0bQsmyzbwCgJQm2P/gHS5q4L7dSH
	Gh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pyJjY7vPjIqz/qDbg8TDM078dPTUXYTRxrA2yw+lFvE=;
	b=L2pLHo/IIyWHDDQyNPdJ0jUaopzUSV9cSNuRJB81ld2Zobg7KcRjWT7FMZCEKpT2+5
	a+Fg9XgwQPv2Qzs/+6WROqu83IA3mMq6qB6zlH5zbeAbjV+rZJExcW1UO2LaA/TaUBHi
	goOFY80Du5HXB24CyNp2LHZkb0Ah/RXgNw4YqBVPXv8iTRejG6c65mOpUP7zVva69hQr
	iHi4CWD87o/PqFpVIhZAZWMuc5772dIgL2rT5jG0+7NjNVMfI4eqYphEJFrtb4J+NWCt
	k+tvFlEfGpB+fouHAKd47CBTYdxz5g5Sa9fEd63kXiqv7Q3KDyXm1ebJOnNp0+OehG7D
	1dAw==
X-Gm-Message-State: APjAAAXoXdT4Pgs+5Am6dq17btfPlkkdhtkC3LSHwEfbmjyoO9mZYTDf
	WgSwBPmRgEHd86A3vxBe2XBNTP72
X-Google-Smtp-Source: APXvYqxtcnxqdbuycu/d3n2MAvvvifJSyKabCDq4TbtcblSb/xXPPH7SWmbXU7oDEiyBmr4/5yTUdg==
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr42776088wrs.270.1582242530122; 
	Thu, 20 Feb 2020 15:48:50 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F063D08DABBBE70F130126B.dip0.t-ipconnect.de.
	[2003:f0:7f06:3d08:dabb:be70:f130:126b])
	by smtp.gmail.com with ESMTPSA id
	a198sm1185361wme.12.2020.02.20.15.48.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 15:48:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 00:48:28 +0100
Message-Id: <20200220234829.12306-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2][master-next] webkitgtk: fix reconfigure
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
X-List-Received-Date: Thu, 20 Feb 2020 23:48:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ln: failed to create symbolic link '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/webkitgtk/2.26.4-r0/recipe-sysroot-native/usr/bin/python': File exists

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 585723772e..fa109446d1 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -61,7 +61,9 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
 setup_python_link() {
-	ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
+	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
+		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
+	fi
 }
 
 EXTRA_OECMAKE = " \
-- 
2.21.0


