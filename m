Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 05AE579133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:00:02 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id u24-v6so7212136pfn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hlOu/LqJXrQmznLLLaunjMMCkg8wJHX/AM4qVPbpTL8=;
	b=f2hG+TQ4L7Hqi6aZRb30l8pavInD3mvT2/VYU8q+2WLhxrM9Lfyz+bV8pSTbAp9y23
	Kxf8SrljfSi4paLVUYFBi2sV3mKM9Rj0Lu7tAL9lBb0j1DUlTYNkvzlebYnUA/h2HdGr
	nHu499YNr8nuN+Su/O5eat2kGSslX1gFHS3iAgO71UadsZic9ZIpyW3ezaXllykXthqc
	ee1dC37Fgu/6VxwQhc+YER1J54ge485+9GCBwbCX2zrnSJQ/FG5KExcGOP9ZreXGdzJP
	HfZHyZwFRHtK7SCR6FSmMp6x18E8ShoN3pPQnMP4DaF8x+mxfhKrj6PldBW7hDehflf5
	u9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hlOu/LqJXrQmznLLLaunjMMCkg8wJHX/AM4qVPbpTL8=;
	b=ouOXAy54dopZkZQ/aZBPjTRsJLeRyfJ0+BH6VFJGNVfh0IxbGefkGMxY39lvsTg+/p
	X+mFgb4r9/tGlIP8QlqleBh/t0DncR73XJWhjFF8iX/furANzTzecWo9J3754aw5JSP0
	odei7YKfrCwkUysXBN9dgjiq0dBPIEua0SfeShuaBF14qLhtpi6XP1fcigMfhqF4gPXk
	E49ZqBRfGssIrp80U9ZPpUrh/1Maaf/1vyQ+7LS0WR+a3JF9DLRMELNX8fhv4TXeVZ69
	iYKXAqY/QiFM1n62V29RAEHFXa4uRJrTb+ykKLsAU4+WBGDEEa5MpwwJBwzVoiDiSbuk
	xujQ==
X-Gm-Message-State: AOUpUlFd5sDugiQwMLnH+SipiXhgNna/3668QKDgMIs8CwU46K5Y5cPt
	zJbWGYGCUxZcahRx97v8KQuIuW15
X-Google-Smtp-Source: AA+uWPx/r3cn4FxPaz2KVfFfYlqoeVsRwq/DGgZ+wZGmCCViOgpbFDRsaVQlep8T4oK9r+EUXhwBhA==
X-Received: by 2002:a62:2ac8:: with SMTP id
	q191-v6mr49555902pfq.139.1534791602912; 
	Mon, 20 Aug 2018 12:00:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm18773223pfj.91.2018.08.20.12.00.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 12:00:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:51 -0700
Message-Id: <f4d69d8921ff500772915415680a92d31fcf2d74.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] llvm: Use HOST_ARCH in LLVM_TARGETS_TO_BUILD for builds
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
X-List-Received-Date: Mon, 20 Aug 2018 19:00:02 -0000

LLVM_TARGETS_TO_BUILD is needed to represent HOST_ARCH for
builds and target specific additions should use class-target
override

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d853d4151d..df7c1dddd3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -44,14 +44,15 @@ def get_llvm_arch(bb, d, arch_var):
     else:
         raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
 
-def get_llvm_target_arch(bb, d):
-    return get_llvm_arch(bb, d, 'TARGET_ARCH')
+def get_llvm_host_arch(bb, d):
+    return get_llvm_arch(bb, d, 'HOST_ARCH')
+
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "${@get_llvm_target_arch(bb, d)}"
-LLVM_TARGETS_prepend_x86 = "AMDGPU;"
-LLVM_TARGETS_prepend_x86-64 = "AMDGPU;"
+LLVM_TARGETS ?= "${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS_prepend_class-target_x86 = "AMDGPU;"
+LLVM_TARGETS_prepend_class-target_x86-64 = "AMDGPU;"
 
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv4t = "arm"
-- 
2.18.0


