Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0C8C7EE3A
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.27558.1677860270170731301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ti0ZLz7D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6624073pjg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxxanPs1WVfZKo4qep5G5+ElH9neRAKtIzQm1g6Ws5E=;
        b=ti0ZLz7DU5yTVF0Fkw2bR0iGZhfSerFQJQKh20cii6/GyP/xhu9vcg/vTz00gtvFH/
         hiBLGxwURMfuJAGMasdvv4uSMhoJZ3jkbDaexJeTsTklcZbvbMryK6LsTMqIMB4QL/nL
         B46s3nTG69zdO1eqVSD0bYwmcWllqZv+QvA0EC3qnjk0pUqyVN0j0n62dLVFATU6DVYJ
         Pt8rjk88m3Oj2vyg3N8xWj4E9Ej/8nsW5vMEaDGe1SM59uttgpOLGfgE5LLYprfhttKo
         lO4lizc0EaZ4dp19Eui0ex9hYPkW3jiFWNUT8/L1S0HV5IezJ5OTjYlNdpHFEk5BT4Y8
         N1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxxanPs1WVfZKo4qep5G5+ElH9neRAKtIzQm1g6Ws5E=;
        b=gjNOOwZ3c7kYeg3ZGMGOMG5MACq57mm2Fp4Dz3l2vIlCj9UZGExtcS5ARPYLMhA+Ix
         oiBQyb9xSzXzWLo2XI2IHiRT503c3CTEWoQIPmiPJ/9FbIruK8cP4od5gR5bHu2rUIUi
         DyMyuPAghL7r3sOoByhTZ5fteCdP41vZZSGCJB+TOxdYOlAXKJrR8P7yagO3n+n5fIqW
         Ej2+jJ48CmbNJF03Ly4rZLfaoeOSKNIxh9FS4D+gHOGgo+TdJA/YeciQrZbn+VE45Ctw
         ez0Hq38YpGxP7MGa6YoKvxU+bZudufDimOzmypgtIg+VRE9NUvhwBN3CF4++1rp1eDvs
         IUYg==
X-Gm-Message-State: AO0yUKVwCharci+1PJxEHzG9380jQSHabCvkxaT0nCQJuVYEcvZj6Z86
	1ZG5WUMNFyL2nqdJrlWhb558vBJ7Bl3xYYN4FrU=
X-Google-Smtp-Source: AK7set+W79p+qYh9mI8hNl6IETmgO50XRpynnTZQR61nvoP8eKMHeP/70JKCsUHw6jLgnAc/EkTWHA==
X-Received: by 2002:a17:903:32d0:b0:19a:a810:542 with SMTP id i16-20020a17090332d000b0019aa8100542mr2649548plr.61.1677860285240;
        Fri, 03 Mar 2023 08:18:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/29] sstatesig: Improve output hash calculation
Date: Fri,  3 Mar 2023 06:17:17 -1000
Message-Id: <7b1f82d53901fc9d485756ff4acf34fce4154a91.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178008

From: Mateusz Marciniec <mateuszmar2@gmail.com>

Symbolic links to the files are included during the output hash
calculation but symlinks to the directories are missed.
So if the new symlink to a directory was the only change made,
then the output hash won't change,
and the Hash Equivalence server may change unihash.
In the next run bitbake may use an older package from sstate-cache.

To fix this followlinks=True flag could be set for os.walk
but it can lead to infinite recursion if link points
to a parent directory of itself.
Also, all files from a directory to which symlink points
would be included in depsig file.
Therefore another solution was applied, I added code that will loop
through directories and process those that are symlinks.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee729163f31f26b1462a47e1e53f7a0f9de9b464)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index bbe28efa81..30f27b0f4f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -660,6 +660,10 @@ def OEOuthashBasic(path, sigfile, task, d):
                 if f == 'fixmepath':
                     continue
                 process(os.path.join(root, f))
+
+            for dir in dirs:
+                if os.path.islink(os.path.join(root, dir)):
+                    process(os.path.join(root, dir))
     finally:
         os.chdir(prev_dir)
 
-- 
2.34.1


