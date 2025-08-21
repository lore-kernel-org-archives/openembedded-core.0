Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8E9CA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.2501.1755816212659003394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AoS9C+yD;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61a8c134609so2082058a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816211; x=1756421011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujTdbXD+4+W3nZeZVWZX97AMfej7AXyd2WFL95+en9A=;
        b=AoS9C+yDBv0D2u6mwDBjyFRox1Bg/1YnhJP5+jGX6ZLlDZQMklWtHGLZXpHNrXcyFn
         ci7gjAVm8YEqdtawAuHFHQYeoe9VPqC3tC5dY+dWflYs80ouE5bOpDmw9SVK9tN5iKHz
         spGTi6YLGvWDTWrIcse4PTrfc1kmX/mJtoGaLjdrvnxzXIWhZgesBZoVOya6jxJOF7Gq
         Y96RCxuUiXJ+cjO0dCBg0RGr7GKqfLkOKREKgihLkk7e+L4taYG0QBpO46ck7vdAvovY
         R0AFoRDO/oF8sIL5797dovOhFbkEmz/1wZpD2y9cKTTdSFCLXuVtNYnPLtkbJ+TSiimG
         H1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816211; x=1756421011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujTdbXD+4+W3nZeZVWZX97AMfej7AXyd2WFL95+en9A=;
        b=scDMQnjs34b4K1PcJ5pc60ptO2BCbcMyNpaSmT3bC5x3/nY4mwSyRTUMF0trtwhBzx
         ZO5gQ9SFNGHC8Z07Ji22X5RMClAIGBbCnzdMFaj08+V6xHX04twvA8tz2BeuzJfgAtcP
         KllCKxh34a8pJ/JFebgAOp7lQOyzEAW7ZhysIbWNzBSQuITsa3wtNfDsx36QYeEEJ8Y9
         cx3QmQ7D1hhWvm/1CRnzeKZM1FTYOBm2tgPJ34iQ+kjo6PbBm3jM1JWtW+PXLbTbGSdr
         1JghrLbmJreJ1c/hNFrhNVVBv8rJ3zXagwf9+TdAng/VKMH2bKqMOgBwNBbRInBbWg/d
         AGcg==
X-Gm-Message-State: AOJu0YwjYsp8NwJThmRXEKSuVnBTuwKAjhbLRDXBdm83tcTsq7jhB+Kc
	ESV6XbkgTRde+HICaxlWJKixPvHlmIxA2EfjVQ++U8lOu2EOW/eBvABQ/hIclQ==
X-Gm-Gg: ASbGnctlU597Nm3LxwQfYXwLRWbvjZttoVX8XLoWUDj4BM5VTNarZoquxy2Rn6nl9dR
	R61hsH5sSX46LOQxV3BveFJmj9JOgA8ba9mC1XjcwC4JhwZXnD57ukrfFi8pl02HLJ/KNuTtBXH
	HLphJXaTWC/Hi7PE91qmE9TG3y77xvNfZkMrMO8v550kixe3IkNKACwAMeCXEeY47Id2can0p5u
	fygujagkY5Qcw0iMQld4hzML3TZq1+RoDHlsDwrcHzEQqmdja9y4NkZ/Vu1CTsG0Cr1TZSLsvMJ
	25WEYVLvmTU2GyQK1KoubQXW9e1CiLgdgBc3CpUR8NyxndM/FwQ8e+YLtYn3rVHhg0a7aY/4c+K
	zlxLxYD50pMw+g1UlJInZ4/PlWEApYs4wLNpnbxAZXHTGJXIXaL0w+XeTbm2KurTos+4=
X-Google-Smtp-Source: AGHT+IH5BTrOhP+6zpdimhxpjln0JeMFt3dkKREoQr3KMe1i7BeWAZWpAwY4wx/qbu7B4+brByHI2w==
X-Received: by 2002:a05:6402:1ed3:b0:618:40ef:fa47 with SMTP id 4fb4d7f45d1cf-61c1b3bb508mr616562a12.1.1755816210982;
        Thu, 21 Aug 2025 15:43:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-61a761f2599sm5899062a12.5.2025.08.21.15.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 11/15] elfutils: fix build with gcc-15
Date: Fri, 22 Aug 2025 00:43:05 +0200
Message-ID: <20250821224314.1690103-11-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222296

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../files/0007-Fix-build-with-gcc-15.patch    | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index bab3d94d12..fcb91e41aa 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1371.patch \
+           file://0007-Fix-build-with-gcc-15.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch b/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..8f5c7e4421
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch
@@ -0,0 +1,72 @@
+From 7508696d107ca01b65ce8273c881462a8658f90f Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Wed, 17 Jul 2024 23:03:34 +0100
+Subject: [PATCH] backends: allocate enough stace for null terminator
+
+`gcc-15` added a new warning in https://gcc.gnu.org/PR115185:
+
+    i386_regs.c:88:11: error: initializer-string for array of 'char' is too long [-Werror=unterminated-string-initialization]
+       88 |           "ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "ip"
+          |           ^~~~
+
+`elfutils` does not need to store '\0'. We could either initialize the
+arrays with individual bytes or allocate extra byte for null.
+
+This change initializes the array bytewise.
+
+	* backends/i386_regs.c (i386_register_info): Initialize the
+	array bytewise to fix gcc-15 warning.
+	* backends/x86_64_regs.c (x86_64_register_info): Ditto.
+
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=7508696d107ca01b65ce8273c881462a8658f90f]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ backends/i386_regs.c   | 10 +++++++++-
+ backends/x86_64_regs.c |  9 ++++++++-
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/backends/i386_regs.c b/backends/i386_regs.c
+index 7ec93bb9..ead55ef7 100644
+--- a/backends/i386_regs.c
++++ b/backends/i386_regs.c
+@@ -85,7 +85,15 @@ i386_register_info (Ebl *ebl __attribute__ ((unused)),
+     {
+       static const char baseregs[][2] =
+ 	{
+-	  "ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "ip"
++	  {'a', 'x'},
++	  {'c', 'x'},
++	  {'d', 'x'},
++	  {'b', 'x'},
++	  {'s', 'p'},
++	  {'b', 'p'},
++	  {'s', 'i'},
++	  {'d', 'i'},
++	  {'i', 'p'},
+ 	};
+ 
+     case 4:
+diff --git a/backends/x86_64_regs.c b/backends/x86_64_regs.c
+index ef987daf..dab8f27f 100644
+--- a/backends/x86_64_regs.c
++++ b/backends/x86_64_regs.c
+@@ -82,7 +82,14 @@ x86_64_register_info (Ebl *ebl __attribute__ ((unused)),
+     {
+       static const char baseregs[][2] =
+ 	{
+-	  "ax", "dx", "cx", "bx", "si", "di", "bp", "sp"
++	  {'a', 'x'},
++	  {'d', 'x'},
++	  {'c', 'x'},
++	  {'b', 'x'},
++	  {'s', 'i'},
++	  {'d', 'i'},
++	  {'b', 'p'},
++	  {'s', 'p'},
+ 	};
+ 
+     case 6 ... 7:
+-- 
+2.43.7
+

