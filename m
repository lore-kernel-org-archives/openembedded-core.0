Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680B6C77B60
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:57 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.14400.1679408449784850357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=agl3ILfO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id h31so8648403pgl.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCFMZamgVyUIlbj34pQx4H0V8pcgEEWjGT7XKV7OrVc=;
        b=agl3ILfOtVm7Mdr1CNEd4F0OgA85sCkASGQneQJimlybPwTWsVuSn7ExFzWB4lBruX
         45KFbsadSlCKqoKNHb69P75Kt+j2X8KNu5dpYktekTDHyNgbkKYgj+nLPSIfzdA1uj4E
         lcMXmB0/JFSxqOnhMwmMlR2MBsIj52lFe/gKVnE0mByUDrVwy/IhkrVndSTlW6QEyK3t
         kF3CEJPFDRnNrA1YqUcqtOaMde3kVIO5J/b3FXiwn3wjX6JxezZPXhTLgtYomUtqRrw6
         rfzms1qQK4f7teRo51pw3Nu/OYA82tdHjA+5Eso0zfxpcmtJ2bxt61gy0blXUUb/HC/S
         sKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCFMZamgVyUIlbj34pQx4H0V8pcgEEWjGT7XKV7OrVc=;
        b=DMhzO72jxt4DORRQSg689gZz2VGnVBpFOZlNvL8kdpUeyI6wwksy3nxxyCO2Vbo5DI
         9+KovYw+gEAB/5XBrKnfKgaLSFve5ms6/iV6Jhd+U+pXOGSn5rpsdfDWYTxkieZUHXEb
         o4OKdjmNNAMrQDiV5kQYn3Cg0h18P70TPBw2VDWQz5U4r4zcczJV/fdJ9lkcNHQYHW1a
         DX9IRNe95u4842WaBGj+Z41VlnSJ8DcFQEREQ2yL9YbmL2otEUcvGNj1jXyyIpvPb8dV
         4WeyZYV3/+OHRFjcT03tBo9xOMwKupdov0SKCKNj58/M1kPUYGIMZKSKwYFSkrf2qwcX
         mcXQ==
X-Gm-Message-State: AO0yUKWNS5CHoLLZI90W4KmaZN1M4pNfluR51fhTsr2l1yuTpYz+Bk+1
	izDov2u/6ndiGqsaUDSzPhAh4DHcLm1ZFdmTlPs=
X-Google-Smtp-Source: AK7set/DnByOBkgnuN9VbSuABZxRxAFPURa04QttrhY/gQe7UamtMLQ24/yhz/8OE8wDIXUCeuwIvA==
X-Received: by 2002:aa7:9e0a:0:b0:627:ff1d:db6d with SMTP id y10-20020aa79e0a000000b00627ff1ddb6dmr2181477pfq.21.1679408448637;
        Tue, 21 Mar 2023 07:20:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] glibc: Add missing binutils dependency
Date: Tue, 21 Mar 2023 04:20:15 -1000
Message-Id: <ea6d768d0910e2076a971bdba57605dd9d68763a.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178881

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc has it's dependencies handled more manually due to it's place
in the toolchain bootstrap. It depends upon the compiler and indirectly
through that to binutils. This did mean that if binutils changes and the
compiler does not, sstate and hash equivalence could mean that glibc
wouldn't rebuild.

Add a direct dependency on binutils that if it changes, it forces glibc
to rebuild, as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a7b3decff636292f5e76e95406a22b6fe4a994)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 23a6ca99ae..e42040f3dc 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,9 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils${BUSUFFIX} libgcc-initial linux-libc-headers"
+BUSUFFIX= ""
+BUSUFFIX:class-nativesdk = "-crosssdk"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-- 
2.34.1


