Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE952EB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7349.1686734973965123086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VTmbFdaU;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-977cf86aae5so70802866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734972; x=1689326972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CuZDXk2I8SW2MvWP4rVzYn7UxVuQ/5djKtkxtr/N48=;
        b=VTmbFdaUJcTokq/m2l3tDLw5OR0JB0QtMyAxFqxzkSdhLZI0dEBZPvJ2o0jFfBqphA
         ORisaJ1fsD1BYZdMyu2hWOrmuXYMNaeGZm19PWCDYFuLEPSvK474mnkVbqH7cSznQsjO
         TvKkryNxpfbZArt66OF2A2kor/szAf0oaHHtKOtLQwWg+6t/urhSXRqGHsTc2UVkGPZG
         EO60An2f0cjw/mBjqJ+WkPLlNNgiqf8PiS4oMvL4LErCvW0DgtxuQNo9AKjXkzq67qhr
         0vz+d7M/vzx4A2wiB0dx3hfUtYlkCh36IXK4LYuN0ovsXiwJznJDsl9M7LtU+Xt9Yasp
         ymGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734972; x=1689326972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CuZDXk2I8SW2MvWP4rVzYn7UxVuQ/5djKtkxtr/N48=;
        b=fDgRGevkZ6ESQXtNyO5BCak8qj8GjWlyoWxJvpkglNMWfCLQ5oXLpvCjMRSkqpLDkU
         CJd7zUMpuQmCkPiY4NvUjFHfuQ/7i5ZZlsTA8KkAbDJk2P2yzdBCF3Xr2fbMXLMLSFPF
         WTQn0xLOT0GZuTLwdL17u0cOu0v3d+6LWXX1Do70nAkOhBW4hRh0QY9cqcDTak+g10DW
         wlWrlajMq6ILVmGdZHleb+jOFlmbZaDjxYjRBlNN9I+b881Zq4Il8X+wY3d0iTS4F/JZ
         jrkr5S1j3PyaBEQiaE/aWA/H0699uYdL+Xd2z1cH3e2uO4Bq8XXJs5XINuQUs+J0ficD
         hPdw==
X-Gm-Message-State: AC+VfDwp/z1j7MvCEZK2sZeoZO2VZAM4X0qoA28L4TGqFwaw1SzkUTYI
	smqBPI/ORIWgwYXamOK20LJVQbcHBKo=
X-Google-Smtp-Source: ACHHUZ5TNF2caKSQ7SSluAkaj+28Lz6iBwkjKSnAayTlDyhOuttWpDtXYVuJjmZrY+QYROQD7aQa9A==
X-Received: by 2002:a17:907:97d6:b0:978:6be4:7efa with SMTP id js22-20020a17090797d600b009786be47efamr13415121ejc.18.1686734972380;
        Wed, 14 Jun 2023 02:29:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/55] btrfs-tools: upgrade 6.3 -> 6.3.1
Date: Wed, 14 Jun 2023 11:28:34 +0200
Message-Id: <20230614092918.4065570-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182756

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../btrfs-tools/{btrfs-tools_6.3.bb => btrfs-tools_6.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.bb => btrfs-tools_6.3.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
index 5c43d951c48..0bdf48ded2b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "fba31d634e3bc658e7d42a6c00f31ebb60adf901"
+SRCREV = "9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.30.2


