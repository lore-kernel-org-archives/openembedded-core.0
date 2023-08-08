Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA79EC04FE1
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:09:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.65670.1691510932365534507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=phGAH/Lq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe5c0e57d2so19038835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691510930; x=1692115730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ccI2qMHk4zVP52mhdw3szGa2TOGlDKUB5MVLMlxbovw=;
        b=phGAH/Lq2t3uz8+01kEDL8KvlID3DJUxq8WuZ5Bddr/PST4NZqzt30H5y8cYgJHWck
         TWKeWNUmL91R9SisOZgrxQ2/xhrgdIclvj8pwf6g2judkGLyOdNTF1I0mjEcaPq7a8Xg
         rhtV1RmESQkhJqtA6iBnHPRvoMPCRW14qJs2BpSQOkDyk03kJeUqhDpJtccPqyBKIaSR
         3DAb7ydw9rOAduYv6HhOMFKwRGirx+do8kYiyqUFCVYnNzdXqE/7EvLVoUgKVpPGW4mN
         FDyCJMnjuX96WJZLkwtx3pSLfZNCuPGy3HwQxDxGHBdIMGI1zPpnooNyW47j+8Gpgbij
         Pk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510930; x=1692115730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccI2qMHk4zVP52mhdw3szGa2TOGlDKUB5MVLMlxbovw=;
        b=QbIX1Q9P0lFi/5HAycGAxyh+q6iyBs3grQ0FnWpUB7MYWcUQSgYO8C6ApwVEIGgtWi
         6dtKK9QHSkX89frF4JXqID0f4hTj/lPoDWOByBsTl9W2byg4qLJTArCgoNVVl9qk2UZ7
         ItK9yqiR8GZgr5O3OjlY4AZPcso9z5NKyGR1UjDfC+DjJ6TUUT3tN+gasWtoJ/MM6w38
         c0AAqCIuv1TfYybB7DQ5fqRdN0G9N15OFjtQ2r+OD2bujKbZ404NlD3baJ58GekdDu94
         lKMGZFEFGaUc4DHZQ2IZdz+m4x5cshA0/72YW30Z4aM8NA9ZeX3XWUDPsPuJKTJRi3l7
         aloA==
X-Gm-Message-State: AOJu0YygX+xfgpStzT7hQBTtC3JxxD1V1xbgeUEgWvceYyjIODUpELa3
	UpufTz4V8OWiTrbglvid3DrfhmvTG5RN1w==
X-Google-Smtp-Source: AGHT+IHQprdGKLaDnFYJFGvAfpc0vqHIEbtbCToP1Iewc/ga4ITv7jBzSIBmYLh6azMjdU5GXiME3w==
X-Received: by 2002:a05:600c:204b:b0:3fe:16f4:d865 with SMTP id p11-20020a05600c204b00b003fe16f4d865mr201101wmg.23.1691510930290;
        Tue, 08 Aug 2023 09:08:50 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c298100b003fbe791a0e8sm14234925wmd.0.2023.08.08.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 09:08:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
Date: Tue,  8 Aug 2023 16:08:27 +0000
Message-Id: <20230808160828.3045524-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185665

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd-boot_254.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
index 5d69cf83ab..b91bbfe485 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -53,7 +53,7 @@ COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
 do_compile() {
-	ninja systemd-boot
+	ninja -v systemd-boot
 }
 
 do_install() {
-- 
2.34.1


