Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AC2E98FB0
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 05:56:29 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125820.1775714182395097530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 22:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R16MRzO0;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c25b90264so2397343c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775714181; x=1776318981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5o5yRno5rSiMHUC3lCWkfS1EA7OrUGySJ0srgM2vCls=;
        b=R16MRzO0gyE6Z566YJ0FOy77rW8JXu3BDfvNY7LVpivX1IEZyE6I7E1R4CHI9P4eFW
         vgxcsqpfqJf6kjQJENYmbaKFyegDdTUaSa3z2evSb2YVSpbZodrwyhKiS8vW4PsFM/ex
         NrQwEwQXK7BwyCGYgN7fgKDHXyXx1tvEaob3FCwaqfEodcmDqK0DyANqm7lXyhvC1ySl
         XjR6X3YzsjQi3q/ntXBpPitG7D3hh2OlipGz7esvMp4x+Id6tx9AJ5j7BKIDFIa24kMO
         8SwcuCUdX2kny5ZsX+7gfLA0Rr2Tys6nzGPnvHNlAl7Mnip4e0U2pqH8I6q05YL7gmyS
         3MMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775714181; x=1776318981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o5yRno5rSiMHUC3lCWkfS1EA7OrUGySJ0srgM2vCls=;
        b=R12Vyr28D452DblS1J7FNEJmBhhHfldFtsEWdMS3HSx0se9L6CoPonKSDwb0OS/Eul
         RZrXYWch6ZP5DTMSFD62HNPc8OFm2LCJo1W2orRgYXB1H9IXlpKpFJFLKMmyecJHSXK1
         V2Sq9kNwrHQnUNHlCdtAQeaceB5s08+TlBe0hGinc8aNexeBecIYf4ECkEmWoEbQuj5C
         fHWzMNzA4Bp31aLMsKYLbwX/40ddp5L1tLwU9jGZ1jwYo8YcWT0FaZNQHR70Re/mDQXD
         axqT2zjLFdzIK9bp8Mv7O4NkDnbWUgpbfiQ+xZhFz8xmJ5/h30x/9L0pcRyMHyJ1zmnJ
         4gRw==
X-Gm-Message-State: AOJu0YwIjALXEny7qdfrQ6eOtBXfqp39CZeonIbptgQ/lFqk7/hXxt3A
	k4psbmjaDgE/pNB8wf08t2VaaXWnHH761mvctEHqxN+pjHhdwhZA8nU/TaFowA==
X-Gm-Gg: AeBDiet+okXpi+JZ2eAlElvSSCYwJvR0FdSrgpuWB9qrBHiWeAtS7K/DHO/ytZQ6tT+
	JaVK/b4Q935OCRx0m+4RhCFYSrZta7fUaelkkrPOkYkGWhLNA91vzxLx6wuj0RitG9dmAVSOlZk
	6CZJE4NZhqhupk+nK0uLpny1NRhXGQpg9P3PC2N1asiCQ7GV7qsFWbw4RQsxs5+4ZMsqcFMdyXl
	4VYdumKg7EK9BHGIEBZyk0lJ/omFeHMGgMDKhxDz7DDo0NO8NIBwW0yDanndtRN7bAW8kAwplhZ
	MtT38xnMWqI3MY6qfkiUJ27L3pWtTBBqwrILr+nYYwLbFCcRK70nr4KUJ9Xm0Upvk96yFz84Xan
	k+GLUEAX14jrnM8XY8yAHdOVm9nIXs8ua54mMqQEmVJcqMDVv8s0u6srVE4NZ2QYY4Hce9t3hPf
	XtyXPgik4Sl6CE4w/axLdmJQr3OlE5e8SLYZuu33Hn2ncKDeEYhvkXbBeITs3JlANZgazTPiry+
	UDtUT6DlM/KWvTJcTwcAu5VY6yHb9Bg3y6xTKheOfT7jDnWuoMo465xNFJDJ3PEgrq0N4M=
X-Received: by 2002:a05:7022:23a4:b0:12a:7165:7405 with SMTP id a92af1059eb24-12bfb6ec47cmr13618447c88.8.1775714181361;
        Wed, 08 Apr 2026 22:56:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28032586c88.10.2026.04.08.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 22:56:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] flex: Keep it at C17 with clang
Date: Wed,  8 Apr 2026 22:56:17 -0700
Message-ID: <20260409055617.917253-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 05:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234875

autoconf 2.73 enforces C23 and adds -std=gnu23 but it leaks it into
CC_FOR_BUILD as well, which bites on systems with GCC < 14 where this
option does not exist.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index fa8c0fb6fd..0507d4e300 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -36,6 +36,11 @@ inherit autotools gettext texinfo ptest github-releases
 M4 = "${bindir}/m4"
 M4:class-native = "${STAGING_BINDIR_NATIVE}/m4"
 EXTRA_OECONF += "ac_cv_path_M4=${M4} ac_cv_func_reallocarray=no"
+# Don't let autoconf smarts to detect C standard, flex code does not need C23
+# which is what it will enforce see
+# https://savannah.gnu.org/support/index.php?111401
+CACHED_CONFIGUREVARS:append:toolchain-clang = " CFLAGS='${CFLAGS} -std=gnu17'"
+
 EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
 
 EXTRA_OEMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', 'FLEX=${STAGING_BINDIR_NATIVE}/flex', '', d)}"

