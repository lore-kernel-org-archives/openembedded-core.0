Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4305F730C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 10:21:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so1466428wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4cshn76LPRK1ssFBYdGZQAyoROQhnWdO7D6QIkMThDo=;
	b=bICWZdlGbWYMAFppY/EK2iOErxdLb6QNbrRjpd/DrwJdiMhHZ0K0Vw+lh+qUIG1Bze
	2SY4HZrxMmV9GSmEoW/uBHoc51XkTiZfizwTrgnf25N9oLFqyz+JIYEru6u5V7z+BOrc
	avtPlS0oVlDbzlm1E1/l26P2phK5H8olmlOeV3Rb1D0X87bPsXe/k56lj9v/xvB1l6au
	bRDmY5dr/IP8lmCOnfRR9eHx3Z7i3hXX2auMaPJr2EEADfo032nBjJ5N6qZtN3/Ct/0b
	otFSsFIrBq50SVUOUbxfX74Y2FsYSsiWqUkEfX1x5rGXxxc1PUuXICIMeEWTD4Y74eO3
	EMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4cshn76LPRK1ssFBYdGZQAyoROQhnWdO7D6QIkMThDo=;
	b=iKGRp5dJeaX9rj4Wnhr+5+Q/t5smA3F5lex4ywCTU/tF5Ae+90WiXgQ2qJJ58Fbq6f
	Fe0oIMDhTnUciMXi7az8z/cN3yO+fhdxsMWm4QMv7f2/8VMunYxdLojsgHvpIsq9KTM1
	CRnIheOCPpCMSFQZ8P2LFVH5MP8qS8Nl4lzI4FrrsXF7jcH8cf4bUgHthchCgecAzqSR
	whg6glbqaDRWQXGXPe1U72wZd4dS6P/WuLpmosNfonE3Y772HPyw/Lwm/K0h5CxzIEwN
	3f4TLVWzCOj2frxaG/OIrx3rinct54KQ+GSLZhxmqFIBwn3yV4kgjVE9hWhe90v+hMzl
	UiMg==
X-Gm-Message-State: AMke39kzX623eE9y0lvZDe38Ic+RZPNFdnOprKOHVUwM9i6UyGeFDMMFWcBxdXK4iZTl0g==
X-Received: by 10.28.232.90 with SMTP id f87mr1620961wmh.35.1487758908818;
	Wed, 22 Feb 2017 02:21:48 -0800 (PST)
Received: from localhost.localdomain ([62.179.106.250])
	by smtp.gmail.com with ESMTPSA id
	w51sm1150532wrc.12.2017.02.22.02.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 02:21:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 02:21:42 -0800
Message-Id: <1487758902-11574-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: fix ineffective include conf/target/${TARGET_SYS}.conf
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
X-List-Received-Date: Wed, 22 Feb 2017 10:21:51 -0000

TARGET_SYS is defined in terms of TARGET_ARCH, so it's not valid
until after TUNE_ARCH has been set by the machine config. The
original order of includes resulted in an attempt to include
non-existent files such as:

  conf/target/INVALID-oe-linux.conf

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e421650..18d1cfb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -705,9 +705,9 @@ include conf/auto.conf
 include conf/local.conf
 require conf/multiconfig/${BB_CURRENT_MC}.conf
 include conf/build/${BUILD_SYS}.conf
-include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
+include conf/target/${TARGET_SYS}.conf
 include conf/distro/${DISTRO}.conf
 include conf/distro/defaultsetup.conf
 include conf/documentation.conf
-- 
1.9.1


