Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199AEC4167D
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.53359.1699714997844278449
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EzTQlA1L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc938f9612so20980635ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699714996; x=1700319796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4Xwa6amq7gvdpVEjohCCw5Gbba03O0wSQwv9U8y4JM=;
        b=EzTQlA1LJ4ghUbcOgwP6gzH52RJ6pdppYWLSWaBtqGidqKZoW9YbxwmZqaUAem30eS
         q6aBQzJV/Opsm1XXwl2uwHKMnUG+9NgxYvZvKDo4AK5LX7V2Hpx0vKHCmb78WRDUng35
         ciacCKdpabAJeBNUWFyRqdz/XMKDmV76aUkORvjKYXmTz9Rv9CknRJziP8K6M+Bd03su
         VAmFAfjgYrHnObzjfWCYlSq8zbUMhyyLH7mHxTM2LIZoDYncaK6rrWsBpu+iHk3+dvue
         Z35Gxo6XwYXgbGbSUQ/XjeW/vPpoq/mw+H9JZIMCW2+Jq3XWLBTIkXf8ezXBBBcnYA8w
         lHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699714996; x=1700319796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4Xwa6amq7gvdpVEjohCCw5Gbba03O0wSQwv9U8y4JM=;
        b=Z0xHU5xLL7Ashevjf5cStRe9n7qHn55+BgU8ZVfE5bqCsQe9GDF1VsUmTLekSypf6J
         on0YXcoD14H3LEtKNULJlBLAUs5/4hk4/EDY75GTQ0yw17op1gf6sEgugywQdfbwcqCS
         xuwlVpTU26eykRJyAssNsEZERzkvnb3HsmWMUQBbr0DxzYczfvPB0LtZLnTMyi4UykCd
         s5S9OjiAWDRZ2ULy/+EBEZMqLpYXUcsMPOPofeTjFyXWZa+Rl7C7gug+l8ft2J5L7605
         H+LZxTeDg3g/5WGEpn8p7sH8lZaO497hu/rfIPGpzU8uH/EPm4YNHC+adufcuiMODqUq
         Lzeg==
X-Gm-Message-State: AOJu0YzWzXHvNPrPq+avK8Oh8qt6bMbhACn4J1rdE5hW/96aRsFcQHH/
	GT4zOkwwQCuJUWzqPaCdEQWfGxEoVSNCLN18woKwQQ==
X-Google-Smtp-Source: AGHT+IH2ytWnc6JBpdP6E4hqs/g+wnr+pQsaimfnWJfJ+1N5nqxK36MzcrMKKg8CFIN27HTSxdNFUA==
X-Received: by 2002:a17:902:e5c7:b0:1cc:5db8:7e92 with SMTP id u7-20020a170902e5c700b001cc5db87e92mr2137256plf.58.1699714996313;
        Sat, 11 Nov 2023 07:03:16 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/15] glibc: ignore CVE-2023-4527
Date: Sat, 11 Nov 2023 05:02:52 -1000
Message-Id: <d298a116ac7e9c7546f3ffc046bc807c2de19469.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190418

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 2.36, so 2.31 is not vulnerable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 1862586749..8298088323 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -29,6 +29,13 @@ CVE_CHECK_WHITELIST += "CVE-2019-1010025"
 # https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dunfell&id=e1e89ff7d75c3d2223f9e3bd875b9b0c5e15836b
 CVE_CHECK_WHITELIST += "CVE-2021-35942"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527
+# This vulnerability was introduced in 2.36 by commit
+# f282cdbe7f436c75864e5640a409a10485e9abb2 resolv: Implement no-aaaa stub resolver option
+# so our version is not yet vulnerable
+# See https://sourceware.org/bugzilla/show_bug.cgi?id=30842
+CVE_CHECK_WHITELIST += "CVE-2023-4527"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.34.1


