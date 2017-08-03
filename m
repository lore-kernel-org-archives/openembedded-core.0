Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 84C8B6006E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 14:03:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t83so1598337pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SRS+636WT+orJ87pXJ+2eGzub5o1h0fOcbfXPy4dpcs=;
	b=Pv+KyEnodiajdeDy409HrfNjW/aLnpj1DjGcyVABvPbEg35oceleFO9xKPTZhEddOm
	VuGAkdch+i/9DgzLUNLBYUvIXAY2NwGPk+2FkAnalAZcI9/d4hTB/uNwpme94ABWyV2d
	+heEZbAIs6iriFXfTaTxq8daS0m08mDeBjlDJJ0RJlvImM0X2BI+agY4SWLbbq1S7HCh
	3Iap4jSZ+en9383AZXWE9GFu8VBeD7MaMXN/m+hAUiZ6Qakr8y/6NjYzl0uoFdKMwrol
	0DvAktSuKLNe+x8V+VicLZKa87vLLfD6XSCiqQql1MCrZq+Nb9luQCu5rg6xTaMMIrnw
	g48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SRS+636WT+orJ87pXJ+2eGzub5o1h0fOcbfXPy4dpcs=;
	b=e637kvcv47xfJr9CX/01XrK4hJ5+dRIr5e+DVhA3ybkzx/97RF26frk0JqhVrqLpPX
	KXxMIFS1HH5Gi+pQaIfGm2kq0u+LrY7Iix+2yQq3PxlTWpiF9P5jlfaBbVzk6lxw6Ho2
	6XnjlOQtLe9Aid0irWpP9iTLq7EMGjuh8Aizz+VDEa7pr1srvRoUEGY5SNUsLxlKE6SY
	UoxCRSMKwBpStlYyA/wjm5MiFkBS+T5dAKMCFE3HvJr7P354TtNWyPB1yLfZaNVNB43M
	9AUHWOGOi+relgqzkk0l+f8DY6gnSgRA+QoaxxDgckTfwZZKcjLYO94WJQZWljcGS8oE
	yO7Q==
X-Gm-Message-State: AIVw11336IsgwMNqwnnY3F9SBg+QPzzlASyEWEZ14+q2TDsoqbCCoGXG
	gxtPO0e1gDRHOaqv
X-Received: by 10.84.136.135 with SMTP id 7mr2151805pll.356.1501769013389;
	Thu, 03 Aug 2017 07:03:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	p10sm15894175pfk.103.2017.08.03.07.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 07:03:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Aug 2017 07:03:19 -0700
Message-Id: <20170803140320.21404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/2] llvm: Keep llvm-native dependency with clang toolchain
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
X-List-Received-Date: Thu, 03 Aug 2017 14:03:32 -0000

This was needed when we were conflicting with clang-native
but this is solved via append PN to binaries of llvm-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 722bc53aa1..15152dc1ff 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
 
 DEPENDS = "libffi libxml2-native zlib ninja-native llvm-native"
 
-DEPENDS_remove_toolchain-clang = "llvm-native"
-
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
 inherit perlnative pythonnative cmake pkgconfig
-- 
2.13.3


