Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB128EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:22:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.174.1687796526991626744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 09:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=L5CWHKDQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fa9850bfd9so10700855e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687796525; x=1690388525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4wgWuw8DNMA+81ujorWFcn4qClTG0Umr6hqVuTgwOQ=;
        b=L5CWHKDQW/IiHHMf05GWWx0fpgr0p4+5zUag/LMaVu9gRbtbu+glmfZb49vQfbHmaU
         e0TZaX8x3I/BZSH7kIi70eQgk+1YHfNwyFYVItWj7Qe5BsHGonGDHm9srXPCOZ4tc4Mp
         +ttWxhUgoFli4AtzG4PxUZoFN/WsgqCkXrgto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796525; x=1690388525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4wgWuw8DNMA+81ujorWFcn4qClTG0Umr6hqVuTgwOQ=;
        b=c2kCLW7TqR0DUeBsuoWAN8CPr78MDE3THQGTOfWPZvExHPC88RtCazCRIWyD4HPnGG
         uuETnZ0uzMxgUmek0NFfCfGrXPOkumhiTH6iFKpEwlrpNg1FMuId4gUpHoaVugkExMLV
         4xEIeNJN4uS9h7A2NZzdwl0I70eqN71s1xjvUs6B5gqIUcMs/4TwQ92uIsazua/N1af6
         aH/vJVbuCncODRKNBTrd0wgld4oVrgooURFfsA5Rw3B6XWe3+YeE0rvkSI70EQB9WPiV
         pAXaE3jMoQrivAJ22QNJVjdw8K+TEbHe42g7IgZuSI6r+Q7AX+9jB+RSYCVuq9Qe4Vmh
         2Z5A==
X-Gm-Message-State: AC+VfDyzUwwoht8Y7iTL3xll0Hn9tDQFYmXjH5nEdI5olj7HJIKgRKJ4
	cXUiVG0vGRI0oyQg8DWxUPAUGT6fPz5XnaKRkc4=
X-Google-Smtp-Source: ACHHUZ76uSL0AQXri5TC5qzEOlibX1NJ4pCA7uXF31qMgMtAXUdQaj49NQkvAGl02mOBRmt6YoK6Tg==
X-Received: by 2002:a05:600c:2201:b0:3fa:7869:4dbe with SMTP id z1-20020a05600c220100b003fa78694dbemr8075373wml.12.1687796525042;
        Mon, 26 Jun 2023 09:22:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f54:77a:5419:fb87])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fafe32c8f6sm1945600wml.10.2023.06.26.09.22.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:22:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] time64: Disable CFLAGS for strace
Date: Mon, 26 Jun 2023 17:22:02 +0100
Message-Id: <20230626162203.3643572-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 16:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183424

Until strace can handle the interface with glibc correctly with those flags,
disable there for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/time64.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 78569de4337..a0cee4fad67 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -29,6 +29,8 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
 # undefines _FILE_OFFSET_BITS, which wont work when _TIME_BITS=64 is set
 GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
+# https://github.com/strace/strace/issues/250
+GLIBC_64BIT_TIME_FLAGS:pn-strace = ""
 
 INSANE_SKIP:append:pn-cargo = " 32bit-time"
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
-- 
2.39.2


