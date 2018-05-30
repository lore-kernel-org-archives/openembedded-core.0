Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBE61748CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 11:28:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m129-v6so46924864wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rxVadPVj9E65f/hrkNar9Kztar+zfMvKJhQt+CsHIv4=;
	b=Rp3Lmo1YRJuYzB9VDqtsD6U5w2uLFhHhzX4JYSz0FZgNq4exEvrVQHdkxkK/TJFL20
	SnfuoQVXTK1zTJ44z3nfHx66Fgb3dvDyE+fJsLhDFfmAWjoQlf1bH7ipVdVvNqkHlB5P
	GKFmsJJX9w6PMcW4Na7/w0d2WDPjXYWOOPKKuNWE990wp0tSim/XPpFb1UQnVmUMSlLf
	fRS3clhdfZbPBTLL9A1YPshRC3mDQJthg7wtIuGhMZ9ZvXHhtsxQrEQaLfifBvXe5rTE
	oaprrFa82PcnXFtciSb8a9cfu9dUXeKwSuI3aogld3GNCaK4CDGbQRj5zlH+5iSJBEYw
	kWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rxVadPVj9E65f/hrkNar9Kztar+zfMvKJhQt+CsHIv4=;
	b=MCIScqW5gHHsX1JXrseOAfdHSomKqG1Z/unqEJiIaT3ZFdIMpRewZNMq1PyJe+7IvW
	p9R86vM4o2GaQSYWGzejBcdzBb5iYC1oVlrmMMv7sPl9hkUK7wAyIdiaiXgyyidbuDNy
	NdfRi623Opyu0DIItuEBpI7Koiw6W4GOgSWNuw/k4ZWZDsyP4IbVjTO0bCPYM3FNjIef
	iViRj0Ek9M41DN1JmkHdTWWmO69/x58w8biMiW24I6HuT4NXDLeSpui6WrRLHWT/LIbJ
	ueagP86mbCVpYjgvhhPI0Q6RcETFccoNs6iUsBilxOskmF1R6aK9grONJ/ab7syzli78
	T4nw==
X-Gm-Message-State: ALKqPwc6awWhjTGxkDEZBObOT4E7B/kvYXdNPrzMd+I1vwTtRdYZYA8N
	RBJyApHK2KcTAuAhH3kau5lJrA==
X-Google-Smtp-Source: ADUXVKJMlMP6brvuKsOWbfiMo+/yWon94POwUJ/5r571SQoWyemDngcibBFikPNQpQllGgDp46i/Jg==
X-Received: by 2002:a1c:ea9b:: with SMTP id
	g27-v6mr1119864wmi.21.1527679712039; 
	Wed, 30 May 2018 04:28:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i12-v6sm19345703wrn.55.2018.05.30.04.28.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 04:28:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 11:28:29 +0000
Message-Id: <20180530112829.1944-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] gcc-sanitizers: don't use thumb for armv[45]
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
X-List-Received-Date: Wed, 30 May 2018 11:28:32 -0000

* otherwise it fails with:
  sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'

@ 1538 "../../../../../../../../../work-shared/gcc-8.1.0-r0/gcc-8.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc" 1
        swi 0x0
cmp r0, #0
bne 1f
ldr r0, [sp, #4]
ldr ip, [sp], #8
blx ip
mov r7, #1
swi 0x0
1:
mov r0, r0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
index 601f666023..f3c7058114 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
@@ -1,2 +1,7 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-sanitizers.inc
+
+# Building with thumb enabled on armv4t armv5t fails with
+# sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.17.0


