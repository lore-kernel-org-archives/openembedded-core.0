Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A54C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.21293.1691683529093333953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hsqRatZY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso792879b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683528; x=1692288328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRKJgOO+U7QjRkXnsLRuc5yIYYOGlWZKFSqwUAbn9hM=;
        b=hsqRatZYptzBmtldgkfM68zINe8bDSjJ185FXIKs/MD73FH20rt4eLhxt9bFUabixn
         70PStnmGEt1iLAzNBBHdEqPtimZqChYmP1+je525rpFiFT+E09RsHVZnU8XVVeb6bs6t
         TIU5QVBBxCzixFesQfAtl2KWHzBt2HICHYA8WKOotRLT8Q02obJieWAC3pNq+WI7Z2af
         FWkYXUoBG8jb7qG5Y+2j9Rw2LYnXIfMYTqm8Ck3vsbyXbEan6VhslQVNA3/gjjHXN3ut
         qJ17elgtNFOBSuJzW5iWRv1CwIi3RgOCNuHZwZP4SSah67Kxhg9nUU5QxMhhLi0k5yVB
         UWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683528; x=1692288328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRKJgOO+U7QjRkXnsLRuc5yIYYOGlWZKFSqwUAbn9hM=;
        b=fJcWCs+eVtl6jxVfr99nz/zHQrJeGr3/rIKsXXOaVJXNFzaXltD2sjjeAfI0wrjw4C
         p0O0hkllJehrpqdMz4z/JwiRm6NHv0OCCjRJG3KYrL7OF3g9EcSWoRz6YpTK0/T4Mil1
         84cRK0zLvcBJXrkxxXkO/nCaPDpK3c5oBev0ETotdVgJRWfhKHv3Nrf69Z/kHW1RNX6r
         DpXosz3cw8Jtf0VC6BmivxbFInL7gmZgDmO5EueyFK0LrnUN7jfy1pzVyo9qMwKVQRIv
         M2vLAwPOZ1U+JS2wMCfTdu5vadF7bTOV6Y5Dn2A5wgh2NSqWc1kPd6SK7PJA/C0Le1uN
         OSVA==
X-Gm-Message-State: AOJu0YzcQnTzPw6poa2M/MbZJubrRsJImWW+KZri53VWyYZFwx/mhLoZ
	iFzwFWovZJD43Bx05sDL2SMvdYwB6eC3oTRmCUg=
X-Google-Smtp-Source: AGHT+IGp9zxT2VrU7zaBxB0GldF5md2wbr0ggWqwiwJhPqjwwfCxThlJt+aXHYLMa7B3RGBIcq7fOA==
X-Received: by 2002:a05:6a20:f39f:b0:142:8731:bed1 with SMTP id qr31-20020a056a20f39f00b001428731bed1mr2642934pzb.41.1691683528104;
        Thu, 10 Aug 2023 09:05:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/37] glibc-testsuite: Fix network restrictions causing test failures
Date: Thu, 10 Aug 2023 06:04:19 -1000
Message-Id: <b3b73520296380e78e084918d5c5fbd6c7c50c9b.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185782

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The check target for the glibc testsuite uses networking to access
a QEMU in system mode. This was resulting in large numbers of test
failures for the x86 targets that use it.

Enable network access to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 088e022f80e57ca345838bf57df9abad3d8b9313)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.37.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.37.bb b/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
index e8ad2a938b..2e076f4b0f 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
@@ -16,6 +16,7 @@ TOOLCHAIN_TEST_HOST_USER ??= "root"
 TOOLCHAIN_TEST_HOST_PORT ??= "2222"
 
 do_check[nostamp] = "1"
+do_check[network] = "1"
 do_check:append () {
     chmod 0755 ${WORKDIR}/check-test-wrapper
 
-- 
2.34.1


