Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC8E078490
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:03:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so3315911pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QNsiTYWut7FzNS4KhtHrHP9ToDyry/IHhYY/hQTOpZo=;
	b=VIAqn/ciyYGvfcZ2jRY3DtwM5A/hSM+7aFjx1Bm37CbRef0bjfJm1wipiA3dHvwcPd
	KgwHxDGUYmp5UDpFosYnXcm6IMlD9njPEyRpT53Ys/va6lbdM9gBd5Gmq0JB3hNCgw+0
	AFeAozkPEqK7hWnHPRK3m8ZqC8wEtExyjl/3I5cyBu8/6d3sVIEavxHC4UPQTjTrWVUF
	+qh7fLXdVLyP8tVJ4Lw73VyZbRt7XQUhBK+42P6Gt7QnbIw+ZsM3p/1eOcTEv1DTpQQj
	ZljYepyn+0eJ5168hIJqVSs6Z9zAJZhRavGPVncYVTYw5bQXde0ROhmVQny8FHH23Fyx
	vn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QNsiTYWut7FzNS4KhtHrHP9ToDyry/IHhYY/hQTOpZo=;
	b=fX/aZZT2LBAhXbOoy0jNavYVss2cTfeory/xNqLmhOHpMw4peR1oFUG7W3Km3TLwIr
	2uWOW0jwX/bKpaTlW4a5qiOk1gizbCgSW2T9mqBupj6pRZhRQpTv1Tftj2oBsIO2ixGj
	A9uPsvltAjjoTJNtgF1cxOOuuzmk8SfZBlMGn3qCuh4J2DVyHFhlFFNAf0kyhwjFlmrj
	wvhKgsr1ILQM5v1syo0VUUatI4+Uipebph91R8o0KjbXFdRvtjxHbt2w4jdlXBU6dJ2H
	/9+9jS3BaOcp+lJtLZvfeAloXrBo5wrzKwUsxX0zAS6BePL4c2Ij/BjyGxnRcSzx3lwT
	CIFQ==
X-Gm-Message-State: AHYfb5hRuihWTbc95v7YK+ZfI+2yhR/OyaIgxdKTcuDjrmyWtJVOW1ER
	ZTwBGtcrP9b6aK/Z
X-Received: by 10.84.212.150 with SMTP id e22mr32802679pli.398.1502834618632; 
	Tue, 15 Aug 2017 15:03:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	z189sm15329782pgb.12.2017.08.15.15.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 15:03:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 15:03:30 -0700
Message-Id: <20170815220330.36316-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] llvm: Swith to ARM ISA on armv5 and armv4t
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
X-List-Received-Date: Tue, 15 Aug 2017 22:03:37 -0000

When Thumb1 is used as default ISA, there are linker
issues, therefore always use ARM ISA

Fixes
relocation truncated to fit: R_ARM_THM_CALL against symbol `__gnu_thumb1_case_uhi' defined in .text section

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eb2049248e..bf4aeff164 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -51,6 +51,9 @@ LLVM_TARGETS ?= "${@get_llvm_target_arch(bb, d)}"
 LLVM_TARGETS_prepend_x86 = "AMDGPU;"
 LLVM_TARGETS_prepend_x86-64 = "AMDGPU;"
 
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4t = "arm"
+
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
-- 
2.14.1


