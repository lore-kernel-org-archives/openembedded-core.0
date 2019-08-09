Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1A87E553
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 11:15:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id t28so91736915lje.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7ab2KbnVsZUsm+qN8p08eu7JdQQImS2cb62e+UyXhyo=;
	b=FVWFchQ80GD0Tmi/fphYA8t893sZMHLmAteiNbWA5E1J9WI/RjnUr51KnvgZ7egZK3
	QLQ5eFXD6mG6s2kXcIXY81H0pXguE1goZ/b56aMXWdxIbbZcSdm56xdRaaFWVCysdlwH
	vGNVBQMVOmxg68FnPINTauRfBA4W8zlYxXtuD/uRmtBoQ/xiikvpUahUuUf1ZaVH1m4d
	Zv6BtNk5XBo1AJoavmEk5sxbRO+weKObH8HS7sYftd/NqQ6+ad8JrD/6p6naHbYAb7Xz
	VV5AAoTCtEqYYFO4ipq0CnABB8BXqLF2LErBC5zrLQzo8cNvgHU+PijuLYGWCnzYbt/Z
	dQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7ab2KbnVsZUsm+qN8p08eu7JdQQImS2cb62e+UyXhyo=;
	b=hoqDhmMvyJ1R9u+SEG/6k5xBcWITUfIdogwqKtWj1BGABGGDYDDZH+qIbAD6NqLXdU
	91Vy8ZzUHRXyClL0lVqKQL2edOtYDU6DWThO0z8GFmjMsIEkRvwKnDfvRB5LsQhMm9AG
	JRFuSV2IwenuePQdlUHYGDfrkR43ypxQLwA0wVCc/dLq1+oLFz7tVzUyzetxmI/iBW4l
	3zyZrwG1IoPVbVHAtqYhysHKZ0EJeI+OHycGQcn5dGi97CRC5Anl/FegTmbUT/EOWkLx
	PiPLKbkDixkKmdnqMfflUQ84e1abAfD2muPXYt6JZUEde3ffAT9rZC7Ak06Zv9RnRYNe
	JJEA==
X-Gm-Message-State: APjAAAUahJk8RwR2HY05wg6Ap3rp+opDQgsJ0YimZ6xVgMWtmxZBKdZt
	E258XhZsh/4x/QimdilHp2SyUnoXc0Z+AA==
X-Google-Smtp-Source: APXvYqzlswkinanIG/WIAvqlJmdYvKvYT6CLxl+jWgzBKmf+x7UjBsLgTd7+SPFsHTV5D1t7DS/wYw==
X-Received: by 2002:a05:651c:c6:: with SMTP id
	6mr11252268ljr.127.1565349326507; 
	Fri, 09 Aug 2019 04:15:26 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id y5sm19265313ljj.5.2019.08.09.04.15.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 04:15:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 13:15:18 +0200
Message-Id: <20190809111519.54789-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Fri, 09 Aug 2019 11:15:26 -0000

The recipe is special in that it does not auto-detect them
at packaging step (via EXCLUDE_FROM_SHLIBS). With the recursive
RDEPENDS qa check gone they need to be listed explicitly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 807e47e0ee2..0e626172b5f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -152,7 +152,8 @@ do_install () {
 
 ELFUTILS = "nativesdk-elfutils"
 DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
-RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib nativesdk-gmp"
+RDEPENDS_${PN}_remove_sdkmingw32 = "nativesdk-glibc"
 
 SYSTEMHEADERS = "${target_includedir}/"
 SYSTEMLIBS = "${target_base_libdir}/"
-- 
2.17.1


