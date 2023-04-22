Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB21EC77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:55:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.10323.1682178902317085064
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=G8cwwbMW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a66b9bd7dfso34676365ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178901; x=1684770901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTOTDB7XEAqViUkxWYNGvLVB+/hrlrK8hB9lw/W5nt0=;
        b=G8cwwbMW7vrsgR2OjGhmJCU/qz/eLr7HJMmcGI7cWnjr1eVGT2zNCOsXt7Yf9TJYw1
         hNRNADK/nWuXt3UUhQIe/FV1eHCflHjp3zhxgyMqL6pJQD8gCfJB4sYO7M1GGTpld8ju
         mzdnJ/5FOU30hKe8Z9UBhkHq27dTiFqTiKhA0AS2sEIKsC/6GqELuxvKkqusLSHSbgPo
         tRrO2V9bmYsWBKTmDEit5q5it21DIAANQZo/PEu8eOxVurw6eYbwg38jn1NrJANyrRHt
         AxuAk7Fa458r1XufIKlUIRal0P1mDlxz9tra3DBf1mNJFaS9woRIuR61FNXE4/WPN0FS
         0z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178901; x=1684770901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTOTDB7XEAqViUkxWYNGvLVB+/hrlrK8hB9lw/W5nt0=;
        b=jDb2O4PeV9Na2ZZETuKsEKFU3srAYbH+9fS53KS7guuK0hcknUAckoPCa8VbEMRqX+
         vQY/rnKsBGzFg27rkoEjrsIZpj7C2zuFEdQDcBh+LZTaLu8o+sDEgukyS4F+hd+Pvudb
         vl6f795ET35FcP0vRj7I1IJPdmiMcFN2BSDjIc0zbM5Zx4P2j2uJ7jlcQNYbmvYSkHNV
         Ecgusx0/ja9sw0MQmHq1F+cwiKUNjZ4VVyiQsJm2mh+K/J0KucY9CfCj5xzjtiKYOJXT
         zxTgHEW0xkBoJvTKC5r2I+g6nq05EMkylXGSuM6I0XJyLtFT1sMqQeGzWL440QRfwxLc
         aGMw==
X-Gm-Message-State: AAQBX9e9krexORoQ7ESxR18gf09uuyiCZH3ZIz9qcOxVWEqTUZwfsQvW
	SgecyUgckwu+81N5TE9MiJhypfYln9+E1vn4i9I=
X-Google-Smtp-Source: AKy350YRw+XZ0vZlxU1Op10GrMCn62/xymW3ZDJMRmhFpZOx1vpOaJERWYWngxFVBCVZ7Eet12VooQ==
X-Received: by 2002:a17:903:1cf:b0:19f:a694:6d3c with SMTP id e15-20020a17090301cf00b0019fa6946d3cmr10265453plh.55.1682178901411;
        Sat, 22 Apr 2023 08:55:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.55.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:55:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] go: ignore CVE-2022-41716
Date: Sat, 22 Apr 2023 05:54:38 -1000
Message-Id: <ae8167754ff1c02f2d92af03de804754ea77a3e5.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180308

From: Peter Marko <peter.marko@siemens.com>

This CVE is specific to Microsoft Windows, ignore it.

Patch fixing it (https://go-review.googlesource.com/c/go/+/446916)
also adds a redundant check to generic os/exec which
could be backported but it should not be necessary as
backport always takes a small risk to break old code.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 15d19ed124..34d58aec2f 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -34,3 +34,6 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # fix in 1.17 onwards where we can drop this.
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
 CVE_CHECK_IGNORE += "CVE-2021-29923"
+
+# This is specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2022-41716"
-- 
2.34.1


