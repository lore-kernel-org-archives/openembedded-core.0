Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 726496C1BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 02:27:34 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id m141so1832528ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 19:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kkynqg7pLGmcm+0+qfUTqhENU8JZ1Llo6rcXHx4CczQ=;
	b=op3edzNCZbA5hVcANQDayV7sCaPz7nZnr4sU5eDkHqXTPyko0elyzL7sLxCI4Soq7L
	xxi6iIgO7nKJPUe13HaA2xu8P1dM2AZcMuAhUvwU3th1bckQTQWwJGWBP1+Q72eDtddz
	8OFbDEjX63hwaEXb096HH19pX8V2yLYv7AgEwHMrVVCFl+X4DkVd6/beWHdF11gjs7sL
	Bw3oFDEUMyinpR9bu4pZBuFQnxrppXaMiD/ixt/Gqaniany+KPkmYXZVPDJlCnjgyGrZ
	2oIE9ZLH+coMS1EZ1Mm6TsaUmMbSMakI4sH+7ouKl9r/Q+FSoYuKwcBSdCxxmCdDoUKC
	Zx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kkynqg7pLGmcm+0+qfUTqhENU8JZ1Llo6rcXHx4CczQ=;
	b=p2YVpOeBjgjzp0HlorsFbYUIPOKUVkU2eBrgmq7Vn1Q5f7wEhatcNRffOtLFilUfJ5
	1iz9i4DyHmfrC6u9X4ho4szwoDcaDzz1RIDkSy7qIkJZJ0Mj5qjq3bEJ2BBBJPYbbJef
	xE6+HwdR3gUvDiEaUx+IxRnZvaYwa9ezFzYN1driDDdnRXVgQTFfUGTZ9CqGusbE0Vq2
	YeGbhz6GMuEN3mn9so578zElHnvXjeLrlrGg7hHdpcsvYm8DJImlzXgf393Zhs95vbVh
	zITwkdVMk4WUafG7+LulkWvuyH0csF4+VeU+0wfClEtbfck5sHdk76dshaoygpSfrqLr
	QWAQ==
X-Gm-Message-State: APjAAAU6qX0602aO6YBU710a1D4ESwFSfnYdSSu9fmQRkophOFykwW2S
	tHPB5q1HC4F7P0+cNe/3WY1v5qki
X-Google-Smtp-Source: APXvYqzslK9vBjtrIn6zpt15Jrwts065mT+E7KPdF0BuTm+WqMX6tor2N3++jW+Yr/BhvMGeg0jUeQ==
X-Received: by 2002:a24:6f14:: with SMTP id x20mr1559979itb.24.1559010455133; 
	Mon, 27 May 2019 19:27:35 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id s70sm656303itb.16.2019.05.27.19.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 May 2019 19:27:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 21:27:32 -0500
Message-Id: <20190528022732.1961-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] perl: Preserve attributes when applying cross files
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
X-List-Received-Date: Tue, 28 May 2019 02:27:34 -0000
Content-Transfer-Encoding: 8bit

The file attributes (specifically the timestamps) must be preserved when
applying the cross files to have reproducible builds. Otherwise, the
cross files get the timestamp from when they are copied in the do_unpack
task, and the reproducible_build class uses this timestamp since it is
the youngest one in the source tree.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
index 12b220a4d80..f175e87a12e 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
@@ -43,7 +43,7 @@ do_unpack_append() {
 }
 
 do_copy_perlcross() {
-    cp -rf ${WORKDIR}/perl-cross*/* ${S}
+    cp -rfp ${WORKDIR}/perl-cross*/* ${S}
 }
 
 do_configure_class-target() {
-- 
2.21.0


