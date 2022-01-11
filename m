Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3880AC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:24 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.12243.1641927743231129439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gTl5a9u5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so523179pji.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tWaa5nZnEX9YOLU7ViQiDbTx77zcRPq+rVNelFyVLR4=;
        b=gTl5a9u5iry6jZDaSwlAvxr3dIfXy1RLagpYo1aZcztYRvwcyMBf7yWMVv1+4GYHZq
         EaTatPDHoEmqnH8aeim3xNB+xyrS7wRfVYQVLEPo7radB9ubZEz8LlxGmw5CYFSb5xGi
         erfo8h9vzhQlu67IM4RxCQPCxVUv42Z5RX5FGvZp2E2QAERIup8bXjr1ZsTNwdXbjxKk
         OW48G4Esn0JmECU/t6lQPS5GTmDxffFR8zWWWuRjrqORWYTais09c1rP+Zv4ZBqbOnHK
         ytMvTJVxgLX1GNkWVBSu36ltp7SNURKaWilSNwCkuqFP4AIXGofOiW7sEFO8z1MNAp7V
         jAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWaa5nZnEX9YOLU7ViQiDbTx77zcRPq+rVNelFyVLR4=;
        b=ghnhK80xRKsxxuqqbzgdbf8osYF3aTaCwqcgAmVRpwP6y7WsIhMJ6NUiWEEGQS7qNA
         N5pHM72+rmjKrJDkqmJpkKx0NAjTcdgYaEZbHthhyRJGxFO600Qs2qWccJYZEC1y4eer
         q6lu6UUtstiR/7JbYVqaTkbaUHyiv1xchNy+4mLoixfZPEuAlMtMAq07R+RYzhFrHIxY
         wwCGc7vxnKrvyuWbqjKa5ZZgtJUXcCNVXXZowxI2Feq4nmerAQSjDVl0I3nhKtapt8d8
         +sbns7l2d3SpnD1/sre3uH9ZMs+c8CftnZZMgzr1PyHVIsenPETSZjPfb4bFOd4gqYkp
         wwsQ==
X-Gm-Message-State: AOAM531vyvKeFn9YBWEPSNrhoBzjwMOPYlYazR9k/SNGvkN6pAGn6aoz
	LNkGvLZxh4hmhWlV3EnZMup5JSIZL4A=
X-Google-Smtp-Source: 
 ABdhPJw+6ZusXeOqI/+5HFD/NviDNBsiYacpoTO/k75/WrQOov8vwZaF0RnqSuKffA71sfJXYboONQ==
X-Received: by 2002:a17:90b:384e:: with SMTP id
 nl14mr4725603pjb.243.1641927742559;
        Tue, 11 Jan 2022 11:02:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/22] python3-pip: inherit setuptools3 not distuils3
Date: Tue, 11 Jan 2022 11:01:17 -0800
Message-Id: 
 <0aa91a35d2e5cfb2455f7123f9364f4e268dd481.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160444

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pip_21.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_21.3.1.bb b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
index 6ddb1d62966..c893135059b 100644
--- a/meta/recipes-devtools/python/python3-pip_21.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c4fa2b50f55649f43060fa04b0919b9b"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-inherit pypi distutils3
+inherit pypi setuptools3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-- 
2.30.2


