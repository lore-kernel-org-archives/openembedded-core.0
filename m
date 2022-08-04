Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9A5C25B07
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:15 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.712.1659653889758066870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hXeVJu/M;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id i7so682926qvr.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7U5/saFmKaO4bDoM1bY5zc4p+oaENtFlxwCYcSjcYzo=;
        b=hXeVJu/MLkX9iZzq2OMXFVHYljbQFURFhbLm2VwQXTqoNHtXf1SFgV+SSv0841iDYz
         12hQjTS9iETqCvCnFutVKy5on3yrXJC5GX8nhY9COTYY0P6NpAyRyoAjpVS+tkWcQFOH
         Ck6r5hKwayPLMgBGZr0voLgzMChSl+zugR1QHGeE/DYIVUR7VzshLGVWT/rDjs1T4S/H
         wcxQ2B5+prvEtAqBJYRTkUkqCotnT5pKayAHqUuHbZGch6rUZ1SrARIePNW+zC4oee3n
         8n39T/jPkQPolCeMVSlNe9GkiHor//u8fIR+rM1bRjz5eOhZCCOdl+GkwtRiS4vwq7w2
         iH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7U5/saFmKaO4bDoM1bY5zc4p+oaENtFlxwCYcSjcYzo=;
        b=4F90JNSHCZ4QYaOENtF8Cl6CseMaeL9ek/FxKLjibtiyEsjUyNItouN6JE0M1oVz+z
         sVNuOQ/fmPsqNSZ6bdZ3Jd7CxHqRZ5z8DaOGWCTbcPI+U0QxWvjDZblrLZq6IhYUQMtV
         5wV2r7WQjNYpqbbX9ajmfR76WsfBOhrh4e96aKvKEJo0Rgmn9aAHyX4wxdvfp9o82sRr
         tyvjcZq65/B8gbodLOcERId/o41/HeD3P1BJCD+lYBRtw60Ky4xIOUnxiqH+EPJaqV9C
         bSurpM5cMSvLqoZcdvIlaf1gZJIO74pMAdQbpruWH4d0K22zqQEVcCQ3ypx3xhhx2vLI
         At3A==
X-Gm-Message-State: ACgBeo08fS29JFBHK4GxLfL1Jp2sV8h7vKz3T6WJpfzoZOd5uv9Kjc+Q
	XzqSJ6L2nvX3NWvGC7z+V66+jPTXkEm1gw==
X-Google-Smtp-Source: 
 AA6agR5wL/taAy+iET1r3aEV2vl8ko/2iSyFctFVNaRK1ZQKCDmsh2HHJpF8mc4k72P2QufiO7+fWg==
X-Received: by 2002:a05:6214:20a5:b0:478:bb0b:d0a9 with SMTP id
 5-20020a05621420a500b00478bb0bd0a9mr2482498qvd.55.1659653888777;
        Thu, 04 Aug 2022 15:58:08 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/13] kernel-devsrc: support powerpc on v5.19+
Date: Thu,  4 Aug 2022 18:57:45 -0400
Message-Id: 
 <20ad22c572dc7e0111e112c8ab0500400ba033e2.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168872

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The on-target/scripts requirements have expanded for powerpc on v5.19+
we copy the required .S and .sh files as part of devsrc to support the
archtecture.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 165589bf36..a38d35e82a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -119,6 +119,8 @@ do_install() {
 	if [ "${ARCH}" = "powerpc" ]; then
 	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/powerpc/kernel/vdso64/vdso64.lds $kerneldir/build 2>/dev/null || :
+	    # v5.19+
+	    cp -a --parents arch/powerpc/kernel/vdso/vdso*.lds $kerneldir/build 2>/dev/null || :
 	fi
 
 	cp -a include $kerneldir/build/include
@@ -199,6 +201,11 @@ do_install() {
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/vdso64/* $kerneldir/build/ 2>/dev/null || :
+
+	    # v5.19+
+	    cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
 	fi
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
-- 
2.19.1


