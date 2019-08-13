Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D09627DE82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q12so18381392wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7ab2KbnVsZUsm+qN8p08eu7JdQQImS2cb62e+UyXhyo=;
	b=rvQubdjbTjLggxfhGy1WfwUcVvF5iLZO1XrC1NzuXcSo69H/1E1+fc95YvPpgzASzV
	fb1UseAUT3mnlerwO8h3WozluO6Ja0P7GBGPPSRh3WYKrY8Kc8JwiekAU1VHm09Y1rsn
	krEGVWy6ImnjHcUbDDvtmyk/2ZEA+aH34u3tH5nawSJ+3OIsr0c/ZTw12lmqJDNFT5UD
	aDu7lxgF2zwuwhOtEogS4OXWcQcScCjGXe7eVsSp8hRBQNoG2IjRjN5as+G1bv7LxE9A
	AtWuN/63Fw9qk5LvDYh51GpG3AcKrJOJUqzzegyUtD2oeqwCpKT/p0b+XKttsO3BGDYH
	8X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7ab2KbnVsZUsm+qN8p08eu7JdQQImS2cb62e+UyXhyo=;
	b=loXaFvD/AfSEH7yKj+xJNPjbaumGarqMFY/Xj+jmtBrOYpehNwHCjnRlOiaMAvQKfP
	LqFVIaKuxiFm9C0MqSkxqyI0P6XFPlWatbYw9/OnCbWbi/iuSMyHBVxRHFVx6Iw/hv9n
	FJHiNzaRrh24sxj/YSWnKyEhPJow2AJLx4eCsk8t+0NYuBRMJHyU9NFqEOzJ6ETQoug6
	ffmhO0/9hV/xLUsGVG3cJQN1z6QK90lep7x/7FC82uIcXPP2wD2bBF3/ollcAjBY+s+l
	KU/q7yrt3ntaZ90k75aYif1Z6gtxl+X5On+rwnRJzwzkQVCO/uIvttpYKYwzURS6QWG6
	AXOg==
X-Gm-Message-State: APjAAAVUgd8pCUMB/NQyqVBmi8oTq4s2HnJ0cdccMpZ4Ji53ENifpJFk
	+g/Mb9iowZIK8b/F5WAkLudyKhAebj4=
X-Google-Smtp-Source: APXvYqz1LKvdUI1wa6eveGN5MIPHV0ql/U/fLlxEVzkcLyg/CMJScZdFuCKPV78ER92dZPETZGYFGg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr26946935wrs.23.1565720661239; 
	Tue, 13 Aug 2019 11:24:21 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c6sm3218230wma.25.2019.08.13.11.24.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:24:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:10 +0200
Message-Id: <20190813182414.2952-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:21 -0000

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


