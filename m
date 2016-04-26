Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 22F22606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 04:56:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 145so448545pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YNMd+bxDqRyhDuYhS1Kq/jWsiDqJZTAZEy/DS3/221o=;
	b=V3UPhs/55Wm01ffPu/yC+gD8bGuMuTaw4AyfHLt7vF47fZb5EHfYCMA1kC/QkuRdAw
	ZOpf72ARiat2GEXbD+3lQX1Lz4mFreDEbEYK8GcDWbi+oq/K4qlyFF4WM5ROS7PWvW8g
	pJjPrDexXW0zm7vsH8Hh2UqxXvSi4omL/KFbImm9c90OQwFa9Y0Go/NCmSNL9fEQmUTv
	OFMScEuE8b03ynqSBHkxDHC2bGzBHDxxkuZfREZ0KGrFhl5q24J6zD/m4K+axDb6xUZ7
	kLQbIbkeWypVYhqjdClmwWYfpYKCSbetFgxB0CD6HZ1qjTpMHiLbqQHVxwL2Y9wF0UDp
	qR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YNMd+bxDqRyhDuYhS1Kq/jWsiDqJZTAZEy/DS3/221o=;
	b=hQO7mzTLMWj3Qk1Ujj+Y/ckc9NEjpM7ujPZkViu022WTlfhrxU+L/2FgT0h2dqC5KC
	v1cHfA5v2L0kCWyoU7DFk9/jjqRK4Fk+9G3U7pyEMm74cltp+m34QWn53Qif1idF1RsZ
	6m4bwSvA7s3gOPlgL90FlylOMyIKv+Z7sUhwM+ndlKAS9buA4vQnXHiY//dp0YX/B/Fs
	4SB6VRuAHI+3z0z5bSWS0U6H8ZX2obicihxj43GXyshCfuJ9oWoz+h0yQbN0ETnkUhdR
	6uF6X0vcBr8YtdttpSh33TfffwuJnTN3e2mod9n4SSgisPFlQyLMtO8u7YllIYH0DaFY
	gKwA==
X-Gm-Message-State: AOPr4FVqwA6gKZjF4HSSoXr64qR+c4A7q/blmrYgjTc7qxiumdWIJ/VfBGmhq2u9thY8HA==
X-Received: by 10.98.81.195 with SMTP id f186mr809284pfb.30.1461646583690;
	Mon, 25 Apr 2016 21:56:23 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	y128sm1022774pfb.13.2016.04.25.21.56.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 21:56:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 21:56:18 -0700
Message-Id: <1461646578-13426-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] ddimage: if 'pv' is installed, use it
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
X-List-Received-Date: Tue, 26 Apr 2016 04:56:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

This gives us a progress bar for the image write, which is quite helpful. See
https://www.ivarch.com/programs/pv.shtml.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/contrib/ddimage | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index a503f11..ab92995 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -100,5 +100,9 @@ if [ "$RESPONSE" != "y" ]; then
 fi
 
 echo "Writing image..."
-dd if="$IMAGE" of="$DEVICE" bs="$BLOCKSIZE"
+if which pv >/dev/null 2>&1; then
+	pv "$IMAGE" | dd of="$DEVICE" bs="$BLOCKSIZE"
+else
+	dd if="$IMAGE" of="$DEVICE" bs="$BLOCKSIZE"
+fi
 sync
-- 
2.8.0


