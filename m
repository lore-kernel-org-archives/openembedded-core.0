Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EF61E6C1BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 11:01:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so493255wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NvePpQUN+9/CTTC1TZhIZGBTR8JG1e5qW3IMe3l1YF4=;
	b=cEXZi9fj7EnHnrqgcNqyMpgzzBo2A88pXkFWyG07pO0RNuHwgr3CuWiYv/awWEZOlC
	z1JEWQPk8X1mTr3i/10n43elTr7rcmsCIxvW5bg1IVTZNY+8HrWsoaORE6ILGenum+zd
	nfybvWEttOUiZpxXYFdiUMQFp+66UT3N5Iv/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NvePpQUN+9/CTTC1TZhIZGBTR8JG1e5qW3IMe3l1YF4=;
	b=iWWVAsM20kcsfDjn/odVV6iE/hOVa+xkKExv7q/gHQ4YyndcsxetIRgPywUyfoCd1p
	xdfS3jKf4S854+8hF8sZsz1wqWltjME6AvPjmCttYo9I+gLFKlysb5pmUiXhRvULy2K6
	AJCOp5PlpLHOUKYzXmn7KuZx6tBkixWWwOHnbD+kxJnaiOk56J7B4/AUxLlfhvH+Mt/P
	RxCf8wvVZfKcsVWp3qrmuuafN6VW9mjWxU/qt1QXkkZbisTJTao2zzlPOlZWe7MBEqdX
	S/cuNY5UE7YzoVYTmzRsyXZpHuatDw48uiOiyWtqGEebN2qJYm37uLnKD3xisfGAucI/
	hdcQ==
X-Gm-Message-State: APjAAAVBEZwYeDpL0+5YHpnzHsqeFZ8MquyaYd3E5nPweNolYgDPDmc5
	AWD1TGMeuT738XbjSpbUd6ZFCz4HosQ=
X-Google-Smtp-Source: APXvYqxRROGZOSGUgB1zyi3OhBJ8ga/Q+keiMOK7j0ABHldzdcsKqKxXG4buja+WIRLF1kvOfQAyeQ==
X-Received: by 2002:a1c:7614:: with SMTP id r20mr3298960wmc.142.1562065307351; 
	Tue, 02 Jul 2019 04:01:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b8sm1956736wmh.46.2019.07.02.04.01.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 04:01:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 12:01:45 +0100
Message-Id: <20190702110145.11980-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] grub2: Drop unneeded code
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
X-List-Received-Date: Tue, 02 Jul 2019 11:01:47 -0000
Content-Transfer-Encoding: 8bit

We no longer export these variables into the environment so we no longer
need this code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bac2d7d4149..20877e77355 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -63,10 +63,6 @@ BUILD_LDFLAGS = ""
 CFLAGS_append = " -Wno-error"
 
 do_configure_prepend() {
-	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
-	# for its own purposes. Remove the OE versions from the environment to
-	# avoid conflicts.
-	unset TARGET_CPPFLAGS TARGET_CFLAGS TARGET_CXXFLAGS TARGET_LDFLAGS
 	( cd ${S}
 	${S}/autogen.sh )
 }
-- 
2.20.1


