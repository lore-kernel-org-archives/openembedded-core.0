Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFDDC4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.7185.1667530912783221368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iQ89r2bg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id g24so3729966plq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmNAz8zOH9ZD78RDX5/Pfwxdn7HuUdEuDtsNpv040QI=;
        b=iQ89r2bgusUcPD05WtwIOT1MIgSW5ZBud2YTTaP034lmOQIQlV/BvkzQ5kmTEyhZDC
         E4g3uWtjqLD5t5RpeKulcPQOHAaPRcN0CfnvHtsn4UwHr+KNscS/bgzjH0zrosg7zm3n
         xMfOqEDZck11JkcduCgkrBWDr6DXrvVUPteQ3AyYQxirM0zIKQRKoxEC7eNwVcZsqzZ+
         IHrA5x2e6JKkjuaDjSAq2Wt9UssQdyD72C4WFwtK2Cngk1qmHbCCerFJoTwm4WOu/SSA
         0F2fmXzNSrlVIyYyooec88Bl2iGRBFdvH77K096zILVXTgrDbKci4EjH7kyxLPE/DSsJ
         PafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmNAz8zOH9ZD78RDX5/Pfwxdn7HuUdEuDtsNpv040QI=;
        b=zBHtukE6NatOGudttgKNt1ygTZPVYX0TN4suaeHQXR7c/XwOMVSmgQR6QzphfjbbFZ
         OMwuffyil9ayr7dqdCpOLsosja7GjPF6qbUCb4k5oSG20g0mmwQy/hACqK5zTd4a+lo4
         0AHrdy7tt78NQZ20080JPT65DQ3WwpvZxYcUmZgruyTKmjKI/Dd7+C+xU3jEzl7VJotm
         Wieh+xobf9H6vr3dRZFe8XU0IU54M8Nmu06hfRoybZbAkGrr064byzEJ3LIwPmChSYHb
         u7ba0uruhTP+2T5WqMRHJ5silvILM21djTuaIeRRT8/teraOJVKIUHAfLPZSJPD7NjfE
         pcUg==
X-Gm-Message-State: ACrzQf1Voz6cqIzZ8fv9+iJ49GeuXJuemQg8WsRyB9/1tF7wMmYqh/RH
	ZR2Rw1ccuiPmPY7Q84ndaBfsEHR6OwyPAq57
X-Google-Smtp-Source: AMsMyM7o3eNvzXvOyZeQ+mO1dfx816OOAljEoGaxIgnnh3o6NPpAAfRvCbP5h7a861TrIs7rf6vS4Q==
X-Received: by 2002:a17:90b:3b88:b0:213:1849:ea33 with SMTP id pc8-20020a17090b3b8800b002131849ea33mr52582251pjb.78.1667530911903;
        Thu, 03 Nov 2022 20:01:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/31] insane.bbclass: Allow hashlib version that only accepts on parameter
Date: Thu,  3 Nov 2022 17:00:52 -1000
Message-Id: <4b847bc337fe9e800168851e7fedf8d8972d40c5.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172678

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Some versions of hashlib don't appear to implement the second FIPS
related argument.  Detect this and support both versions.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bbabed51e3aca138486d3feef640f5d3249be40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0d93d50e58..dfda70bad6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -552,7 +552,10 @@ python populate_lic_qa_checksum() {
                 import hashlib
                 lineno = 0
                 license = []
-                m = hashlib.new('MD5', usedforsecurity=False)
+                try:
+                    m = hashlib.new('MD5', usedforsecurity=False)
+                except TypeError:
+                    m = hashlib.new('MD5')
                 for line in f:
                     lineno += 1
                     if (lineno >= beginline):
-- 
2.25.1


