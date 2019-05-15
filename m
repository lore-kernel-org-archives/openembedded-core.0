Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 92D326D666
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 16:52:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f2so720271wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xc78NcHcEgAhndj7jVh9908JEWWty75GUBCBn9Hd03I=;
	b=X1I+NvPIBmIk/xXjp5nmvPh6qWxTbSx2SIYOT9PDB5Zc8gRaFUg37VcwjGkt646bMU
	KzsGCU+ZjhGHyY/a7RJHM0DK2iztwYjKhiknNMp8JxlUZcz4P2W0KB26SpvEnSpoHNFW
	JKfO3DeP2D9xeJ+IPfKIdThADvhur65f1vgms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xc78NcHcEgAhndj7jVh9908JEWWty75GUBCBn9Hd03I=;
	b=oXwoCEaY1sqjbf8X/szfOTCyi3+u+57IAuvjLjAECk//QmEmsxi+tGHHmByehZgUbf
	pW+98qwFqBwzTWKt9fga84asw/5typDkbBe9O++4PJY2+GfBvT2cfjREgT+trEiaxB9v
	z3z2JKrN0jeApxkZPY8rBqD8XX0z3w5YbAqbIM7W1VkNuFgTkS/jI5gFDkRZKNIz9vTy
	XwxY/vHIg/VuWd439MxwYJw8a0oNfE0lK9uQdQtXca2kw5xh8aSeMxp8BPW6AhhyA009
	wA8K2aPiXCfGwRukttzxoa2vy8GtLNCqJIflRLwivBmf3s+kEGyBdUAsL43V8L98+xCT
	To+Q==
X-Gm-Message-State: APjAAAX1J6WV04ONPQrXYfyHf0JbdLQbLd7N5kaAe3R2QUMCQtwfIXD8
	9XkPsXKE5ayp3Sx/yECToDOKo4uNy6E=
X-Google-Smtp-Source: APXvYqwYp9fgv9XOb12S6L5LXusV/rx8b4B4JGiUuULiNoyPS+kQZQxG5eYVZ/HLDOx9O6dC6snqvA==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr16942381wma.6.1557939145839;
	Wed, 15 May 2019 09:52:25 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u14sm2444679wrr.1.2019.05.15.09.52.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 09:52:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 17:52:23 +0100
Message-Id: <20190515165223.10152-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] core-image-sato-sdk-ptest: Tweak size to stay within 4GB limit
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
X-List-Received-Date: Wed, 15 May 2019 16:52:25 -0000
Content-Transfer-Encoding: 8bit

Adding the valgrind debug symbol information caused the genericx86-64 image to
overflow the 4GB boundary. Tweak the sizes to avoid autobuilder failures yet
leave enough space all the tests still run successfully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 2497fc42aee..e84beda6ce1 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -12,10 +12,10 @@ IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
 
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1300MB.
+# box) and explicitly add just 1200MB.
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1324288"
+IMAGE_ROOTFS_EXTRA_SPACE = "1224288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.20.1


