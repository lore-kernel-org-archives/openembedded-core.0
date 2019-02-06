Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 397AA7C3A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 08:44:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u6so2767140pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1iBb265PAU/siJrfS6xv2rU50ijYT+bMLG6G2Wiv/Nw=;
	b=HM8+kSY1m9KEc97STqAwnCuZ7erPrib5OVVfFnTxgJrshz09qrOTpsKzNNEQW0J40Z
	APBeoJrCStpdxprIhrI1zTdHoyJW26a7xI571hrrNCHzMQKbYvyRsgApjJsvxOXL+gOI
	b1s7fuw+fDXnFA4UtQfJ9X4TAgJ0DJEpQ0kWcA2pDmSWzdqg3kw9UQsoM/DmmwynEMSX
	ZkatY10jeGLrMyp8TgfRhmZT32Xw+PudBxZECpdA89egOB8sjcRHJiIhh2XVH2xkcCgW
	cgihuZDLlRJtpAF0148OgUn4lIEIx15tTChITkDxfAvXMBBA9zZg8vePsHuWREUHFBnS
	bAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1iBb265PAU/siJrfS6xv2rU50ijYT+bMLG6G2Wiv/Nw=;
	b=ZDOFWTgfqMwowP+IYlnuEZvBUBklrg5Dk2i4vxfu8w8qFejM7AcwvLGq9gW6r6dAz2
	UA6BepeJehzxRfm3XnvsEnpy3xlGzpBNj5sBhSYK4Srm9jF3jmjjp3L7t9VZNHpKiK92
	a2BIq/E6Xt3W5P7ZWH2K83YXz9OY9twpv6z84kI0N+otlEj+SGH81g/Ms4oYvFl48Fac
	RSniMD4EK+jDnQT2p0aEquZRCRH3ou9/jYqlD/wN0e4RpEHt01U9CiPSNaswveyj6oUL
	nJPM8neFPzoEGG/Yb9IlZqzotq1u+G9AokwRe3LzN8Nsxq8AC2Vw/Bwf+OP5KFk8QWtS
	l0yA==
X-Gm-Message-State: AHQUAubAumnnYrCn/gtnGx2c0agZf3ACB1GiRNAz/ITcSPemoiw2UXUl
	hO3RbPhknkg7YCdWldpDVzvSMJ3V
X-Google-Smtp-Source: AHgI3IbjgGBmJUjidAnb7ayJv2V2fJy/vrUaXkFWeeuNPlAj7AX3AyoVwTlWOfzzOFxLe8Ic1bJNOg==
X-Received: by 2002:a62:37c3:: with SMTP id e186mr9597583pfa.251.1549442692048;
	Wed, 06 Feb 2019 00:44:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	u137sm7819839pfc.140.2019.02.06.00.44.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 00:44:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2019 00:44:44 -0800
Message-Id: <20190206084444.16250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] grub2: Disable address-of-packed-member warnings
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
X-List-Received-Date: Wed, 06 Feb 2019 08:44:51 -0000
Content-Transfer-Encoding: 8bit

gcc9 has turned this warning into error when -Werror is used, lets paper
it over by turning it into a warning for now

Fixes
error: taking address of packed member of 'struct head' may result in an unaligned pointer value [-Werror=address-of-packed-member]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8e0f86217c..28e1c210e8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,7 +60,7 @@ BUILD_CPPFLAGS = ""
 BUILD_CFLAGS = ""
 BUILD_CXXFLAGS = ""
 BUILD_LDFLAGS = ""
-
+CPPFLAGS += "-Wno-error=address-of-packed-member"
 do_configure_prepend() {
 	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
 	# for its own purposes. Remove the OE versions from the environment to
-- 
2.20.1


