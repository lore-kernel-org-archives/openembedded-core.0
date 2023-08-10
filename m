Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF82C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:57 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.21420.1691683552256484209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0badRq+y;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.179, mailfrom: steve@sakoman.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34978cc9e53so3823705ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683551; x=1692288351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbhlJ47FMbGfTAGbH4QcSuqB4UMj44NSwO54KZFOHlo=;
        b=0badRq+yHTCum8p3bidIsY3nKozKPgVavz4tf9fld27iVHU2andgt+w/of2DTXkIGO
         DDzELQg3+fS3xcwgY7gLLtFZ3+deFnSD0rAtE01SLPXTiDr/MPUBbkUzzOUQGQN/TPF2
         3sf8S2HmvFx/tj9bL7okJPCqH1EtccjsvLIyNCQZzdCJrheFN+r2b3ISkMaXG5iNDxAI
         5eioBQNrR/nX0AUiCi4ySnZXNjoWIabzvftOolUClPegwfW3X1YyJNOdqJSJjvKuUme8
         Dd/enXEbVFWpq8UObyHk6+RrZ7M0QLGYhjb/uGZ5iWqyTjmDjMWajDYoEFNwT2L0RL9+
         MsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683551; x=1692288351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbhlJ47FMbGfTAGbH4QcSuqB4UMj44NSwO54KZFOHlo=;
        b=e9IBlOAHgj4oSdBhePNFdP+oPRpT/adXPws3ramXZpHofHvtMAEW3BsWdxtxxTxZJT
         sMVfnuwzIOR8bp12bYRKlyINt892X4zNMC+oDi+vBMf144ro32sqzHGd7Rxj8ILOIWNd
         4rNXtqNyanwKhb6hNMicXim5FfljeB9/y+1rr9TX0YI/2CSyjqRNdDxZK8RvvNBBad19
         0xwY+Cs6NNFZSbhgAYATSrBOWMlGr7fG2lCFe/1jVLMCLCws22G8WUkewi/JKUZSJeTe
         v4f9MHNr8d6goEs2eqHibj7c6c1KU2YZPWin7SZ+e495aIJZqw0HPYanSEpEzzAvsdcj
         alrw==
X-Gm-Message-State: AOJu0YwXCAv8XN6PyJ9dcizAES3yeviRA95iKnBmfRyDPeumjL5gCij6
	JLoVmxZcUzSLyEf6CTrLUxQip9BIzhE6il7sLtw=
X-Google-Smtp-Source: AGHT+IGwCe+lSPW5Io4HGzM4A9SbZzXGcekaqJpVe3CYmFJdtHax4hqFqESgmOqLhUs8gnyzLvWzug==
X-Received: by 2002:a05:6e02:1d10:b0:348:f6cb:e585 with SMTP id i16-20020a056e021d1000b00348f6cbe585mr3687212ila.30.1691683551040;
        Thu, 10 Aug 2023 09:05:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/37] selftest/cases/glibc.py: increase the memory for testing
Date: Thu, 10 Aug 2023 06:04:29 -1000
Message-Id: <b4e7158aca35235c86afee2b68236e250488ef98.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185792

From: Anuj Mittal <anuj.mittal@intel.com>

Some of the tests trigger OOM and fail. Increase the amount of memory
available so we dont run into these issues.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d22dba482cb19ffcff5abee73f24526ea9d1c2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 4ec4b85d67..c300aef913 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -65,7 +65,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
-- 
2.34.1


