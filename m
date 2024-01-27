Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EC9C47DA9
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:19 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.8379.1706323089798828860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WL7ld4Xb;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-602c91a76b1so11492417b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323088; x=1706927888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFBHvevhfBuLqHFqiFcLGo1/hmuQuRk5el+zDcT0acI=;
        b=WL7ld4XbkJ6mmpmNPkwNdKTjjBsOM/cNsiXupW5birYIQGaLPwrK4Y7FYQihLHCBhJ
         12PdBQ0+ABjEvlMTAmxhDVxZx5qkGXB9JT9aO6OWhPPgUSj5z2kdvlYReLOx3/BkT5MN
         94uMib9zH5yjkEk9uLIMwCGl2Tg24DGuXS2tkF1UCG6KNiF/J/OYps+SoPEaV/SBSF/d
         BSe1IP3YrNLD9TgepkwL8BNQeEVBv5Yg6Z7k/P4crdaiRXeVaeRISOU2aOmEU8GbUGOf
         /SOFwYNotwIFJ4+vcejw9QPkGAnn0pGQZPtTNF9nolRiZBEnkgia+gimWOjG5PVWIg48
         skPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323088; x=1706927888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFBHvevhfBuLqHFqiFcLGo1/hmuQuRk5el+zDcT0acI=;
        b=XCjfSaDZfszNv/LxaW5xmtTafsVLUzkRX+duLTQoNgoOulgav/hWeED9E+yh5VWBwT
         W7InPtFKJPtxwl5Af6b0fjI6V2Gglygjv04b6YCKLg77x2nHHgo1Z5826qBIKCCXkFgq
         6RxzQADAeE/CPvOj5MFmSH1RfpiBAPhfp2fwl0IoELCz1DA+I97oXfbCXPzytI50/8WA
         9X1uzSE3mMZ1QEAwONsDy4TItFlfNMJ070FiKd9oTo9SFx75QgTPI44oC3Cb5kQzXPox
         /9FAR5zY2mYoxp96AgLAE44rRW6xmocyz3oYE6XoLXaZqlHb4Lfw+3mXqWyqzFKrAFjq
         ulZw==
X-Gm-Message-State: AOJu0YyP4tnr3jZS/4WFSjw5yZV5VZG4iLdL8Zd55Fn18g6/fUlP/Qyj
	FTC4OkP4I9BlkCgsZDHwxc2qx0N+lhLlTiTBq46lz+s03sPPtB7UpXzZ+KDlrBS/iPiLyXeswf+
	lZ5oW2w==
X-Google-Smtp-Source: AGHT+IGUGyA8LF12VV2SCWUC166V9htQNYZGBInb7EIEgG5grCuVY69EoIxLcC+DqWG0rzuvSwA9Bw==
X-Received: by 2002:a81:b103:0:b0:5ff:9ac1:570b with SMTP id p3-20020a81b103000000b005ff9ac1570bmr956424ywh.50.1706323088229;
        Fri, 26 Jan 2024 18:38:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 16/23] curl: Disable two intermittently failing tests
Date: Fri, 26 Jan 2024 16:37:24 -1000
Message-Id: <aa52e8fe6f53c5e3e5466385b683ea209d833845.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194425

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These two tests seem to fail semi-regularly so just stop running them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1bfa564f1aa8b865f6c3ae3501e6d5f6cc0542eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/disable-tests | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index fdac795662..3d792e5f15 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -1,9 +1,15 @@
+# Intermittently fails e.g. https://autobuilder.yocto.io/pub/non-release/20231220-28/testresults/qemux86-64-ptest/curl.log
+# https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+337
 # These CRL test (alt-avc) are failing
 356
 412
 413
 # These CRL tests are scanning docs
 971
+# Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+1096
+# These CRL tests are scanning docs
 1119
 1132
 1135
-- 
2.34.1


