Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBC8C04A6A
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.83602.1691927654524780898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eQM8c5dH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31965c94001so1277436f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927653; x=1692532453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGuBrJzGy6IK6snCy+OddKh0yl43pkybGz4ZekrR7kw=;
        b=eQM8c5dHGktfPYUXKfo4uiMgDFRDyN+lQifjeZhM/ZrjU/efBXwjbw5q41WfaECuPE
         i2iTDfPaaNBYsS/CoumnHDiDeN+T551FwJb+K7pEcB6cCNvZxD72BZ2QizLLtbJ5Eisn
         62VHGNJGwRsjjk2P0BUgG1HGOTKwy/wg15mKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927653; x=1692532453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGuBrJzGy6IK6snCy+OddKh0yl43pkybGz4ZekrR7kw=;
        b=ZSk+4867B9NSPqhyLWRT0yvCLKOd4Wwb1KrBd4ZT6sXEXCWU7GtbaPk55tBBUPUoVh
         48XdRPvbV7Vvn4dwrlGMqSUIRWD0JvxkvouT9CMhmpXgaTT5L+GPkn9r7CwFLJK1iGKd
         G7qJJprihOwufcyuAymRiqfjcBIZGwOV1L5u1WWaH0wpKidVpFTIjdfrmg2WYyTnMBNg
         5OeT69Sx5az0XPLBmGbQR6bjQVw6Rhud9b6HFQFpz7IWNui9vg9lglFAi0tXIw7FsccI
         JqL/T9hqsBZzyH/IBhvP2lqJ3bZx4o9us+/kcx/IqRPfWc/7Q1NYLB5Hl/PnlAqhTPCd
         x8mg==
X-Gm-Message-State: AOJu0YzbzJfqY9czyXI+hgavUhP0FYYSygmjejbCmi6qp8S2mkq7r0gY
	K1U/Snfrm5d8HZSAZ9FcxGxdSK9h7u9hvn7Nxyk=
X-Google-Smtp-Source: AGHT+IG4EUCURlNQarzBt/NbOTCEB4p7tP4QVzsjM1wbNFv3qbMMx819L6QaIsLn6gqlVW1v6Ho+lA==
X-Received: by 2002:a5d:5443:0:b0:314:4925:1704 with SMTP id w3-20020a5d5443000000b0031449251704mr5481820wrv.6.1691927652291;
        Sun, 13 Aug 2023 04:54:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/8] gcc-testsuite: Fix qemu binary filtering code logic error
Date: Sun, 13 Aug 2023 12:54:04 +0100
Message-Id: <20230813115410.163212-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185874

This code doesn't do what it first might appear to, it would for example remove
'm' characters from the left side of qemu-mips leaving 'ips'. Fix it to stop
anyone else being confused by the subtle logic error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 64f60c730fe..a8299fa7aeb 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -51,9 +51,9 @@ python check_prepare() {
         # enable all valid instructions, since the test suite itself does not
         # limit itself to the target cpu options.
         #   - valid for x86*, powerpc, arm, arm64
-        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
+        if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args += ["-cpu", "max"]
-        elif qemu_binary.lstrip("qemu-") in ["ppc"]:
+        elif qemu_binary.endswith(("ppc")):
             args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
-- 
2.39.2


