Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7420BC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:56:33 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.56101.1711382185757410148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i30tUs8Q;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36899d11c2cso1195745ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382183; x=1711986983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HbueVoS1eI1OxfpaSgZ2pfVxHLTDgN/YMuIfltFV8ME=;
        b=i30tUs8QykOtGaDP98YwYBjSYZVlfpJ3hFDnJjRR17jw0zT6DDnht4P19ej3kM6OnG
         lrmW3Y5vTsXSb/daAok48kAABLSri0X07j3aq6dBJLSsTa7SZJ8cLt27xK4NBaJslsMl
         f8TnN1iK1lvB+vYuO1cv6pEr9NE+3F3lNmAq7IIVo/dWcpTydandBeeortmheU+hqtEx
         NyzL2T2EUIBkxVnXxaZkoITCNDd2faz2Eg75aBnzWGbLqQU4Mr6YrWGubntmAZHYYtiB
         eZopREB5vD1XeEuJnLHyYAzit4I3MY08H4XJ2w+6NXIXM1ACX8HdG5MpwRGI/AJkIWNX
         QH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382183; x=1711986983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbueVoS1eI1OxfpaSgZ2pfVxHLTDgN/YMuIfltFV8ME=;
        b=RNXhrk9Jrbl/SneKcaHOLZ9hgFdxNlgQL1PHkFVCTpuZHsdwUrEIJussDl5TjDAQLN
         xeFUYj5p/AeKrC0S/nZwOlZ8EM8LYC02+1zxU00X8MuZ7rsYI3n57c1+NUHD83eJ4Dqj
         +vw7JPQpNMShOdqtrLUmQPs6CiBBFsSEnN8MA6Ns0VSiI6IJY4vf8HLepBNJ4HCt1mac
         92iFTbSvEjSZzE/Hu9A66nLrXH7iSbeuxQ8GFZ8YKYOk8x7yMMfVTa8ouqNS4riECGlb
         0dVTMzFSqUbUj8Jp73oKwsjeWnWRiuZjS/QfXFf5zKpxfp2Udc9TTjpcboyAb8wKp6xb
         Sapw==
X-Gm-Message-State: AOJu0Yxs6Lg6hMFE7vVS9e5unx6G5D3r9U6S6sXo0V8hqgXSmC0q9+G4
	4dKPCPOHkxKxCcdce43pPZVh0y8ten63hlF687Yq/1TuwoKM7fgkuH4F2jn+
X-Google-Smtp-Source: AGHT+IEuljWJ0v8DTDdAONpZ0M+/wNt0Xoe+Tz5BATYMBUMYspvhissIkjNpJtpCBFnF4phTVGvKfQ==
X-Received: by 2002:a05:6e02:b46:b0:368:662c:b767 with SMTP id f6-20020a056e020b4600b00368662cb767mr6535245ilu.11.1711382183422;
        Mon, 25 Mar 2024 08:56:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::78ab])
        by smtp.gmail.com with ESMTPSA id eq27-20020a0566384e3b00b004772b93a134sm2230258jab.3.2024.03.25.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 08:56:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Warn on bad .netrc
Date: Mon, 25 Mar 2024 09:56:04 -0600
Message-Id: <20240325155604.2002925-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 15:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197489

If there is an error parsing .netrc, warn the user

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b867e2a0529..b9aa39cdccf 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -338,6 +338,8 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
                     self.username, _, self.password = auth
             except FileNotFoundError:
                 pass
+            except netrc.NetrcParseError as e:
+                bb.warn("Error parsing %s:%d: %s" % (e.filename, e.lineno, e.msg))
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
-- 
2.34.1


