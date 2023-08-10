Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31242C04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.21332.1691683564530442502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gcHwbg7U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686b643df5dso804012b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683563; x=1692288363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Vta3thGjhOJLOQ4kMYHuPvwrqfTSTOBEHvGXv4Cv6w=;
        b=gcHwbg7UiKlu1X8UXhhH25rRFWm6DqTNhNcc04wWMoMFCPcOvFgGS3lbQiEG0m2ADH
         ZhJ7QU2UE1qe5lKnD3++Ssy4+AGuY5xdvOxGkg60G1JlFPOMpqvr8NZQqi3My8mnqED6
         RDKIr43O29hu4u1dd/fzdpkLkV+GeGYcvVj6ILMxIECDtBEmN0JjoNf5BZkS9BcjDX5d
         gpWOJJpBR9OnGlD9cEvwqVTsUtX3ZjsHimsjl+C3RIbx0URc4VS1Z6rHIdL3bnz8FHxs
         4u21wL+tnMA0vx0mQC52qc3LexToVgiYEXt4IWOOqEFUwqSR7QpGgqUZLGwWyU8OkRVi
         aD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683563; x=1692288363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Vta3thGjhOJLOQ4kMYHuPvwrqfTSTOBEHvGXv4Cv6w=;
        b=Tdhow9lh6cR+bV3FHQZHgK720qnmvA/s4jl93aJVkBF3ufNroIt1ubQDHxpWGRiQh8
         C5XI3aQ6mrSb37W1apNUc1qyjLPb77l1ggMmnRCIRe2Ks6bsSP0chCC6wxR1dRYBnBh2
         3WF8usTTmesccUALgwgIdGF1YuBt+ubrNpKqqvSsEQ7hWDrLNsc/TegZfu9Sn4elNjiJ
         Gg+FoFjykt8jME//vsfbiAsz3Xh7w11+v+36MB3g7aozwZdgrYxBiMXvulc+6B1rpckL
         di4gI2Fye0x8vRlqQxK4NAo3etZ/FMCk9HX3N7yaRkkljTKkLdZkl933JN2vugZJL8kN
         PO8g==
X-Gm-Message-State: AOJu0YyiRVMenQKIZ5x+FyWBAFQQLa7pOk9rhfoMEDJqMrxSFx8xMWVg
	a9uWdmgtSG2WOeXiqlc8pMoVOLGsIYW3AdsZ7AM=
X-Google-Smtp-Source: AGHT+IGrzAS00y7ipiYxGkVIa7yuXvZry39adMTgv9khVwZRsdzTi6enb9Vtd7KxgEIFENE579P3CA==
X-Received: by 2002:a05:6a00:1952:b0:686:be77:4311 with SMTP id s18-20020a056a00195200b00686be774311mr3223841pfk.4.1691683563620;
        Thu, 10 Aug 2023 09:06:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.06.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:06:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 36/37] ltp: Add kernel loopback module dependency
Date: Thu, 10 Aug 2023 06:04:35 -1000
Message-Id: <5273868106b46cd330e15f36f4592f05ca9e3feb.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185798

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The qemuarm64 kernel builds loopback device support as a module and it isn't included
in the image leading to ltp test failures on that platform.

Add the missing kernel module RRECOMMENDS to avoid this and fix those errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8691020f33a644d52b7d867376ef3c85be84abf9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ltp/ltp_20230127.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20230127.bb b/meta/recipes-extended/ltp/ltp_20230127.bb
index 58a267fc2a..79c64ca579 100644
--- a/meta/recipes-extended/ltp/ltp_20230127.bb
+++ b/meta/recipes-extended/ltp/ltp_20230127.bb
@@ -111,6 +111,8 @@ RDEPENDS:${PN} = "\
     tar \
 "
 
+RRECOMMENDS:${PN} += "kernel-module-loop"
+
 FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
 # Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
-- 
2.34.1


