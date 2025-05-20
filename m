Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AA9C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.421.1747770511958812411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hVycwweV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30e9a44dbb9so4863282a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770511; x=1748375311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gm+M6z3y7HNY/vgX2pnl/p+YYR7Qz5nCLzyjlAuzzs=;
        b=hVycwweVbImbj0CmqZob10PorCdWKRrsv18IbXBaau5oUlBt9lLrYKV0VdwVmg2X0x
         0KFe7DiDHbkbuBX3Bc2EvGX2UMr7iBWvZVsu1DLAWqaBsesbLSaembYTNgyQEnai1Jkr
         RCWIER9bh8w3ih7n77Rt7QJMQmKrvqsOXFs3nFJ4IsoOcyRHmatxJP4zhyVirQD/hcpS
         12b+8gDnfR3Lf/T9ih7M+RxyaHILolVdKgWGTMxdYgVewJ3i1N4bBsmJct8qKLv/dvik
         54esMdNz1S+2ZLgbClzbxFFXPdYKy5E7w6E8Oq+xAa8dAEfzKQwtbDNicW5PMVj5a0/w
         WIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770511; x=1748375311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Gm+M6z3y7HNY/vgX2pnl/p+YYR7Qz5nCLzyjlAuzzs=;
        b=nVvkQcNZC4pvGstVvp0MwjdQEAJJPMX/iSZAg6l4c7JCV9T0qVbTJRUVasKiDYbEti
         o1ZJ1+Gy3AtulXi/fdFsI08TfHW85jO9L8sz7aTYJ0/FjbsZDIOZq6FueKN4/HpVGVXZ
         RM7oTgcOKs803FCPAcDbuSCZy+6aCrxQebi948sTz/IckWYfRgdAXL7MuGl94z5rLxjs
         IYEtNmBON2VJRYBVZvG8980xEkOPVyqVciQeY11A0ErpGryd1yk2emafDqXViFeyCGHc
         nHsiNWgSboQJU0VZTbSUDf3J731NF15JQ63QLcgQLBvfjuMtktgDLNRf4WssN+slMAZp
         uxBw==
X-Gm-Message-State: AOJu0YwaCWjoZ5FcdisxNEfmKa10GoJk6xs4AS67iAxRUZEidA0miGcN
	dxus64iEdWD3QwTMzA/seN4HpWZ7qzzO2d2CVKJifo3LIV2fAB/4Ul7hAoGn09TyPybMqp5Ixjh
	nSVe1
X-Gm-Gg: ASbGncsg+bRDTHrAKFLdmdzkAY+WuocSvaduZyyj7a/Q/82qqhLF020fjMv73wcrSuo
	6CuUe+oB+COd/F3guW39rbUY2hoN9Mz0xSqizXYwzn8fKQEUm12BB4l2TEBGx+GYXjtvZMHl1RD
	BLFhiCnBwh566T5v7j59pUYfF5msZqfGwO2OSTLJqG8e2xhq2bLGKQ7tjUHzTxGFGTx1nZ6mqMc
	KSCWAqvKJEGUyOhuimntzcfXvNPcSKQ4Y4lOpo99hSpIaQlmNdsAKhMYu53otVtdZlk8GtUoeqf
	QE9RSp/MFTwIfV7hMvEzaB3A7EYLf4SwhGm3tVFQow==
X-Google-Smtp-Source: AGHT+IGfAPLIcHbdO1HFbrB8rpVmIW4fA/8JfdcMbEPxERUE5b6BmC6oymlbwohOeuORwTkmL6bi4Q==
X-Received: by 2002:a17:90b:2882:b0:310:7485:e3ba with SMTP id 98e67ed59e1d1-3107485e4ccmr3561062a91.28.1747770511216;
        Tue, 20 May 2025 12:48:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/8] ruby: upgrade 3.4.2 -> 3.4.3
Date: Tue, 20 May 2025 12:48:12 -0700
Message-ID: <dc8c85d975cfad10abc6a16a73534101e3036bb6.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216938

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-27219, CVE-2025-27220 and
CVE-2025-27221

Changes between 3.4.2 -> 3.4.3
==============================
https://github.com/ruby/ruby/compare/v3_4_2...v3_4_3

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d739c52558af986c2ce4c65e1197e8d524d14d22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.4.2.bb b/meta/recipes-devtools/ruby/ruby_3.4.3.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.3.bb
index aa22ef3992..45047b8859 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.3.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "41328ac21f2bfdd7de6b3565ef4f0dd7543354d37e96f157a1552a6bd0eb364b"
+SRC_URI[sha256sum] = "55a4cd1dcbe5ca27cf65e89a935a482c2bb2284832939266551c0ec68b437f46"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


