Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7F2CF6498
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.45299.1727661493670591996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AZFuTC9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so2751438a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661493; x=1728266293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69wV1diN+LPY3/BHRgTI0+GjFOvjLkZQwYn04EXAVgo=;
        b=AZFuTC9l46lRjArG+eAxZ9UgkSJuNZKSxOXHdwYuPeNF6MlHdxoll3tR2jAAiDvwKc
         ick2eJ08w6b1Tok0uLRzB8aAox4pTnwvtGg7TEqkCnPU+QguIgYkXguaUsAm3cwqb5uA
         kBow94JflKISLaDty7QbTuxMC4ORAQtDJbPZAQS8IC2WM0MhvFHT9juh26YMz6RFoGc7
         OLzmBG5CmLcS2s6alC14+RHN66ZCWZWt9fj4oQZ66+JWSta+wggJ284gWnDomwhtxNUl
         zaaEKmFlr2i4L8HR8jpdAuITQldFyvOZmtZCKBOG+lXsasTxT0MHqnl7JsxWk2/n9Xy+
         FI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661493; x=1728266293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69wV1diN+LPY3/BHRgTI0+GjFOvjLkZQwYn04EXAVgo=;
        b=iEu4ivvr58fC65EAyl6c+BFSunbiFhR8qVgYAZOD6N+yqGGpu8KRkx03TkVmHQcavR
         m7ulup1N+KWnREKpdTM9LcaRa1/EDblBQHENaYvDOWjox5F6ETXndA0LfkVXPg08gAXm
         symVcuSISeR6WN6Aqfa+KP2YIEPSHJED/wGIcJp9fEhp1nuc7SQKl3taK+cY1e+jJ3he
         hV/dI9XEXU0AV0jjnb910oGkxJhVowDrflFF8kyi9sORMfM/E/rVz1cBGgajXrBpWW49
         hcYywSqco3lkO/KG3k7aEhfASs0WhSByGSuZ/lPWydZ6gaRliDUafUNnh0MN3cIBgoGq
         SdXA==
X-Gm-Message-State: AOJu0Yyi1koEc9/+n3N2NSZhoeEGPmR6DAzbpm9Q49InhpqMBd2Muztg
	OIgi8y1u/DNmIeRmp8nqGtI4FDNA33qPDJ9MVj3b/PCNthFk3xLXD0Rs6p9PdFcuUZniEkTK9b6
	vZps=
X-Google-Smtp-Source: AGHT+IFuiLqhsooteOtXCV/3t8k78cvFhhLgrulRSNQ0Qcfonvip3o0gLStnETGEZNO9R2F/q0SP0g==
X-Received: by 2002:a17:90b:f90:b0:2d8:85fc:464c with SMTP id 98e67ed59e1d1-2e09113c9d2mr21797255a91.11.1727661492923;
        Sun, 29 Sep 2024 18:58:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/27] bitbake.conf: Add truncate to HOSTTOOLS
Date: Sun, 29 Sep 2024 18:57:21 -0700
Message-Id: <85451cdaee4718233211da1e43db01f5cd2b1aff.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205088

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some wic images need this command. Since it is part of coreutils, it doesn't really
cost anything to have in HOSTTOOLS and it avoids signifiant build dependencies on
coreutils-native.

[YOCTO #15571]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 522000ce5c4f0201cbe42d7826b6a8489ed10117)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ba8bd5f975..78f15b76ae 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -521,7 +521,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-    sleep sort split stat strings strip tail tar tee test touch tr true uname \
+    sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
     uniq unzstd wc wget which xargs zstd \
 "
 
-- 
2.34.1


