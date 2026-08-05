Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A15FC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 13:38:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40512.1785937096484458845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 06:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PFINolHQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so755894f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785937095; x=1786541895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSqh/1cNoppHbNDDu0yKHAguXyGBxJA8IQTMdDu59G0=;
        b=PFINolHQ2aL7PvuWs1iiy22IfR35gQoBzbDKomfvsIuuzUM3dWFfiV2biazUUwkBb8
         bc0RGukMr/Tmmn3Cu5WXRTq5PdbPRtOr+bOPP5R/+RLuJxTU3EjbNyg/W7o8SgwWfeVK
         Z8a1DpbQMIY4oQEyONMXYpGngmhCob2OpTbpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937095; x=1786541895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VSqh/1cNoppHbNDDu0yKHAguXyGBxJA8IQTMdDu59G0=;
        b=TXNOkXhDNijU1wKH91UebXLC04cBQir/KZL1TTPl/WTgfyMLwNr6vO/rHigmXllIFS
         kAdWfdUIwuDHhrrOC8gFA8Jg6sfGSTZGtmT7hQd7R6FaLEjWO1waFvplITYSHlrWVV1d
         C8NnlhD2WalwXjaMeMKevaMsTrb8ke9TJGuV/CWUWyaB4CdZqtwo8BSV4JkyC2ISuMD7
         w5g+6eXgzFtAcLG/EK7HjAQEtVKOrLZNAO5N4xHKBqeU9z49HbAInIIkFA8381AsAUc4
         +86Yx60sUvIwQRPgdl/LWXeAUArctgykxorCHnWmMgQ0duDa469LekAZA776eMcT++S8
         d4Sg==
X-Gm-Message-State: AOJu0Yyv9B3t4D/l6sW2ZIsdNLuJR8pvX+lLsu1xNdXu8THQPDK2OAjs
	tDnfPmH3eCEVzMCkcDSmKaGyVwPf2K1BtCPYB06eH/KDGTdNK9zYuSBfSUM9Oxuw9yLq1KUBk5T
	clLJtS68=
X-Gm-Gg: AR+sD10CQwH8kYI/Z/Q5E07Y//WHTxW/zLWjcsH6ICFCK/VfQBVtEKuvMb2rr2pqcjB
	sVwLEpeRBKP2wPd7EsWpLii4BkI/7Rw64gQ70QOYOVBnWf/s53ebzW1+Cm9FzywMz1G2ptRRLUx
	erB8TSAMHHZBiLlOT27W5O9hV5QEl4lPlcvk7pC/Mxms4wgpqm6wmUImi8ws0S2TK4JVvmZ4y4u
	05T/kOZn10WqHjXJqnU+UIN+jamSSDtPrkGCDD5MYYQK7EDMXG4VvK+KSabf/+U8XAdWYw5NEV4
	MMPBmmfD3/e1J5ISkVdrxhU4bJnQVO2+5OhxwKsQn+Hva4eDb0revpTy6t2XTDe4Hsu7Xim9vRm
	TDoNjhGtQRknHs0/ABHlml9057f2H+6zbnylD0rPM1YHgXMp3RLOnCK065nnI0SEd2brdVBpQrr
	QVjLREIeicnREAAKZ+wQjEWC/OY0ZNuf8lD+Dl5eHOJUrxe5ANML4By364e3POpnl3O33FtEN2j
	ZaMPqbtSQU+6kkx
X-Received: by 2002:a05:6000:29cc:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47fec502189mr8804219f8f.3.1785937094590;
        Wed, 05 Aug 2026 06:38:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acb0:465d:83cf:164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec249a78sm8460760f8f.34.2026.08.05.06.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:38:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libunwind: Disable cxx exceptions for riscv64
Date: Wed,  5 Aug 2026 14:38:12 +0100
Message-ID: <20260805133812.630440-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 13:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242869

With the newer libtool, libunwind fails to build on riscv64 with an error
about the WCClinker option. Disable those exceptions until a better fix
is identified.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libunwind/libunwind_1.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
index bc1a108e427..1a3a816d785 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] = "--enable-zlibdebuginfo,--disable-zlibdebuginfo,zlib"
 PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, latex2man-native"
 
 EXTRA_OECONF = "--enable-static --disable-tests"
+EXTRA_OECONF:append:riscv64 = " --disable-cxx-exceptions"
+
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 = "arm"

