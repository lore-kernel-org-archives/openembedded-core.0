Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14D7C3DA49
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 08:22:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.88654.1722586951853098464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 01:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QFbFa2+d;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428178fc07eso48588415e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722586948; x=1723191748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8REyxzKHtMPnkcnnaJFywbMxmW/DIvD/fFYxlC3XFJo=;
        b=QFbFa2+dx1in72jHFM8hi0ppChbRMJV3pHXDj792SMwHxgqeNB2B7RGQmmBJZ2aHyr
         fYfKObvlSRpZLLkGzylNhX3wnnsFF+EP/ioYZh63z8ZfEHBAxRJTHRIWDqCK361T+8DF
         5FMA61Pb8ZpKppJhM9ov1LXvVeirTi6+WFMNF+Ry8UKo5PTXM47tpoKRYh49EAezY21h
         u88sNXOlHR41//aWFGFxBmSCWpHi3KUiRzc9qh30EVfKxBtDHPOnO80rQqEozBQ3TCAl
         Gc96/oQqxaf97ddUi6V6HStK957z5kvdHx4AjVA6YiEY2dXWCp9yjnS9zfw6xBQupT+L
         U+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722586948; x=1723191748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8REyxzKHtMPnkcnnaJFywbMxmW/DIvD/fFYxlC3XFJo=;
        b=huMvmK2H7naGcFsPtRTqY1aSmza+dORX8J0j1WzIrfQ4KM0rKfu1pDz0CR//YmOoE/
         nAjIbHS7ndRdHRuCLukuBCYqAVMqrbxqti0Cc6FoVCC8G1BEgjo5WvtDQTguEB4TcWkH
         KHV1/HUBHDaC/RgJzvtPo8UycY1xfKe09+/lXA5ndww1sTsG0Em4jZrKoxKBC9jdKKVv
         CLC1CS44muYxzlU7wXy0OvmrfYWRUc4NgsRrHTQAu+bwuZmsTEwVaImwtCCuOx5Kxsq4
         Q/IAeZqUZzBRsbtIu74u5tVGm8Yn6yEpgv5nGA/RnShRFgh1rFiLvsEnBTJeCR9agETP
         ZSFg==
X-Gm-Message-State: AOJu0YxUnEYOEtPqXEOuAiTBftjgjLTlq7TmMqX+zYlW0EKfyF6YY5Ol
	+6KWLkn8PEK8P448qIk9dyaPdLMhL1SFYd8pyZNZxAIMS1Hw5fl/Tpkl/Yer
X-Google-Smtp-Source: AGHT+IF6cVaq2G0zR6FxOQoLbQas+W1gOHPQMALZxT2l0mxxC96fxG+9t0FEvRMRQJVR770WfHp5PQ==
X-Received: by 2002:a05:600c:4514:b0:426:6000:565a with SMTP id 5b1f17b1804b1-428e6b07ebamr15289465e9.16.1722586948254;
        Fri, 02 Aug 2024 01:22:28 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd020c3bsm1330650f8f.49.2024.08.02.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 01:22:27 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH 2/2] busybox: Add fix for CVE-2023-42366
Date: Fri,  2 Aug 2024 08:21:48 +0000
Message-Id: <20240802082148.30512-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802082148.30512-1-gudni.m.g@gmail.com>
References: <20240802082148.30512-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 08:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202890

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch | 37 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
new file mode 100644
index 0000000000..282c2fde5a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -0,0 +1,37 @@
+From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
+From: Valery Ushakov <uwe@stderr.spb.ru>
+Date: Wed, 24 Jan 2024 22:24:41 +0300
+Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
+
+Make sure we don't read past the end of the string in next_token()
+when backslash is the last character in an (invalid) regexp.
+a fix and issue reported in bugzilla
+
+https://bugs.busybox.net/show_bug.cgi?id=15874
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+CVE: CVE-2023-42366
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ editors/awk.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f320d8c..a53b193 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+ 					s[-1] = bb_process_escape_sequence((const char **)&pp);
+ 					if (*p == '\\')
+ 						*s++ = '\\';
+-					if (pp == p)
++					if (pp == p) {
++						if (*p == '\0')
++							syntax_error(EMSG_UNEXP_EOS);
+ 						*s++ = *p++;
+-					else
++					} else
+ 						p = pp;
+ 				}
+ 			}
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 86dc9e86bf..bc1619d1a8 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42363.patch \
            file://0001-awk-fix-precedence-of-relative-to.patch \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
+           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


