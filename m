Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA9C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 13:57:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13136.1715176662371179642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 06:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h3/GkRm1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34dc129accaso3297680f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715176660; x=1715781460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0w9JvYjJkcZgKpsRLEwXSd2rRs8DFc1skAGrvGzTuo=;
        b=h3/GkRm1lXjoLue4kawEAt4JkWjPahFh1dTtLGvOlc90BrmVC0vcbusCSKjDyM0yod
         v/rW5OBm/j3ypeasi8W3J8V9OQWZRyamfC3yFQXupn1YnBRn7owN8jhstRWzjHzegR3I
         0kKGyK2ZB94qepQAr2EkRoH23ZDDXveFGpACI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715176660; x=1715781460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0w9JvYjJkcZgKpsRLEwXSd2rRs8DFc1skAGrvGzTuo=;
        b=v8CJnkO9kSmDWuEPnv9wxVYdG/JuTWqceLKgBZJr+/Qx7gH58WtEUK06YkYlUpKKnK
         MOZ+wO+rsiPjscMuYzztHqIS24QeUkCrIrAxkU3/CZOhuIwBEbIWaUxMoul+4G8OW+hd
         6yxf3y3+F7zW9UUsEWbStf5Odv24v1aO/z1/J4743yh2Oj/ijC9yn6W7Y3oX7btzQBoq
         GCQlrlfvRXMtOIPx7+4WZqMdVf+9eg+pZttn5Tdk48iKVzGVo2X6svTdw0Yhg2pacVIr
         o9WPyhO1x5xqeZi9PC9IrAhqxqCd/dn+Tbr5RDgkRq7V+lT20euVfJcqncVZTQ2H/yxU
         dYkw==
X-Gm-Message-State: AOJu0YyDPTwnSco+LrItL1Al74XPmjHF2x0qk88hcDUebXC98lt2vj5B
	kC1dBck2DkD3hxrRBlajkoYy5KMHunP2ndcAJSf1F/ySEoDyw2A3PJAq/MTB7A2b40qNaxwZwM6
	BJTk=
X-Google-Smtp-Source: AGHT+IGx/1VH6qvBTi3J+c8Jf30/1yOO8ILP/2js7wvIutCS24pNDQ701fjnKeeIiIfuUx6tzEaNgw==
X-Received: by 2002:a5d:4045:0:b0:34d:7e73:2db1 with SMTP id ffacd0b85a97d-34fca6213demr1941655f8f.49.1715176660368;
        Wed, 08 May 2024 06:57:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5b88:fab8:c8fc:9dd2])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d4ed0000000b003436cb45f7esm15376020wrv.90.2024.05.08.06.57.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 06:57:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.conf: Require bitbake 2.9.1
Date: Wed,  8 May 2024 14:57:39 +0100
Message-Id: <20240508135739.3848839-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 13:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199121

We need a recent siggen change in bitbake to allow SPDX to work
better.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index d2f56a3fb00..02775970aee 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.7.3"
+BB_MIN_VERSION = "2.9.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.40.1


