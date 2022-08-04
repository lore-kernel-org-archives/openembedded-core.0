Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5D3C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:09:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.5163.1659622174975499027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1o5ZGWG7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x2-20020a17090ab00200b001f4da5cdc9cso5454160pjq.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VC8WL8DonGfLOSXiTf7ZcRSAVpL0nBylmnLpByqwTMg=;
        b=1o5ZGWG7CBfrLrPewl/RDPGratKO6e2Ft//imIFkO2V2eQgmmE0DcIhAZb2zRnabtM
         llTRQVRTrWQ42uCYbJI34B4NgaChljv2uQzvS0DnLlDMFYMS1InOCLZmbksx0BvzC7DT
         lOPAMpLtP5jbWKP1pqgAi5HQExDcjADWpcO8oSw7qWE5EnE9qGRyyJs9AFiCLf1Vy9YN
         JVGmKffjKIVlQ41UjAu7NW83XVRbB/dIvRoUpTFXemeX/tT74RtHqYfrYG4Dvx4wMygt
         z44GaZZ3yuxeb/MQQh/FuveYF8j2EIjfslrr9uLty0QoF82Td49HhfvHaiXZGNRdYZt9
         gOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VC8WL8DonGfLOSXiTf7ZcRSAVpL0nBylmnLpByqwTMg=;
        b=K373rnaE7FK/j5PQdXWVzephdw31PNykkQWkKA0FAuwYmZSH6D9XRswZ9fr5SyeCN9
         NbHYVT0XBiT1uzUE9VzzmDccMjzTkpDvx4f4tSNDKTEHwFrL5lZrcc2DxUnQIu2IFSDC
         F5QU7hpWqt2NhohnmnziO2S6DBJQE3RE3Y/VewbpLxIsSwMsejvv8MagWAHfOwAVcR+Q
         5RGU57mSqHc2COLgS35jVd01m45BzQXuic2gxvhIz0AsDhlNFGMY+cXjSFwBT8M+STOy
         bn8PIVn2/Wh8USyXMN7jkBHDt6T5YuqxB4rAQMku+Q0WkYlgMNL3ErzIrlsMLdZTmLGI
         ZoFA==
X-Gm-Message-State: ACgBeo0KcXTNt4TII9mwAz8lfg9x0w8zGqdfaBj4YA6ZEz3Qublyq9en
	UPuYqXWB05jZB4uc1DWQRUxgPJQgu+VP1xvb
X-Google-Smtp-Source: 
 AA6agR5cv1KBx9JWri2v7pjsiqZ6iWcSU0ASjzLhPeGFZdKwkstZ6RfF8PFU72ciaw7FvPGFz0hY3Q==
X-Received: by 2002:a17:90a:e58a:b0:1e2:fe75:dd5f with SMTP id
 g10-20020a17090ae58a00b001e2fe75dd5fmr10969976pjz.138.1659622173517;
        Thu, 04 Aug 2022 07:09:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.09.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:09:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] kernel.bbclass: pass LD also in
 savedefconfig
Date: Thu,  4 Aug 2022 04:06:08 -1000
Message-Id: 
 <9d2f5c11c71a39db8d488644e9d3c338811e86d9.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168854

From: Martin Jansa <Martin.Jansa@gmail.com>

* similar to:
  https://git.openembedded.org/openembedded-core/commit/?id=66c1f4b0abd3483759f9e4141a80f982eaf8ccfd
  https://git.openembedded.org/openembedded-core/commit/?id=36fe2efc91fec5a52374a2dc4814a69076a2d28e
  but for savedefconfig task
* otherwise with ld-is-gold it will fail with:
  gold linker is not supported as it is not capable of linking the kernel proper.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0c9e1bf35289afa63f040bbc13ca1755e4db0f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8299b394a7..c29bd3d5f3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -629,7 +629,7 @@ kernel_do_configure() {
 
 do_savedefconfig() {
 	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
+	oe_runmake -C ${B} LD='${KERNEL_LD}' savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-- 
2.25.1


