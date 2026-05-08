Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A418CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8222.1778224335475484795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wVlFTG2d;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-452169ae568so1266780f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224333; x=1778829133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5i4FASJM5UrUSvkZaEwviFd5SrPTkl5qVLTTJc/Jac=;
        b=wVlFTG2dgKX3zclLwC2PgFuBXQ3e7+ler45SJrdnEC0k40uilgUBBoBchMd9n4pcbQ
         plYxZfF/zDZbwTyXvoh3fosUSP747diyJBqtBzBTjpqxYBkSkHzVp+n1pt2pM5PU1oyD
         u+PaBgIXtkxTzDZA2cFsbsN+iQdzmpGrWOzwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224333; x=1778829133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5i4FASJM5UrUSvkZaEwviFd5SrPTkl5qVLTTJc/Jac=;
        b=DOiqbJpQ/3OueZHmQEjL+3R3nTkBSRHwCJmHhcRcA6q5/bbETSg9UVWUWoHsfU/b6D
         PePJC9yPTV1KNGvx3n3l1Hso9DCx091QfR8/goKj4BSUlVxHtpktP6mqf242MWzCwW1e
         G0rrV/WtkAYNOdq4tMt/0o9wGDzoNvAxR7BMkZBzTIwtQtUVOv3V4PWoowAq61lQaCPd
         cy5eMREsAoHOhgCy3Cf+4jSumY0zevl3aqewcgzPmNgRFvO1X1UzWnZhhxPgz+6hPmF6
         TPDx87AKSyzRzrrLu+apuYtXwQxyu2cWP9G/6MUQ1j2vqwpi3SpGYaD7zWRVGnoLkDsj
         oxKQ==
X-Gm-Message-State: AOJu0YwGJO4bDYWHOHxpiaKmZMNFBqvYoHmDi7WxRjNv/ws4emtGwfp6
	gC9O0V+tkIvrBL74sS86tRGyLLJlnOyzE+ut2tWyV+ibkhvA9QTMOb/blrVxySrhRaat2m5nUeN
	QMRCfgCE=
X-Gm-Gg: Acq92OFQ4s7EkR0QX3NnIdEWK51dkEQLcFaJnzae53b0tyx9zby/uA/JMfA6malUt3l
	LD6f65ZdAzAY3bIh5GW9glkSkbIM3yEZCAVg+u42DhwbP1tSQMDPNcJxHP46RZUvfiGfUMQr4Gb
	SvMhieJUc4QbpBHfDAluiM1ndljrrQHeMMvQuR/wz6e8y5wg7xiJBJK69B0eFQagC5uZXrFmUNF
	KiQAGeH7lWBSEr9f19I0fSDsSU7WoQUaWlrWdPfDEgAH4ckXDAHVvMUZ0V1ycMTgYOySpyvGt6I
	rtWN892F2QIK558bpieBqtwCOrYMLuUHF3d3pG5XQNvdNHXFvT4U6ul12Rnfm2sixJyGya++eTl
	bYLUt1HeMmTFL6letSfdw8iSzFT7rY9sz67kfCk4NvSsK1UgXrTUiHFPykHhkgIuTLuPJep73JP
	Mx4oUyEZ7URZbM8mj8lOderETT0LpahACkiNhfpqE25ubZra8CD9PDFjqakUpkPXjz5dImTWJhO
	T3Xo5SDNLHGDca4Rvfw+RA4to4=
X-Received: by 2002:a5d:64c9:0:b0:43d:7d24:b510 with SMTP id ffacd0b85a97d-4515ce1c3f0mr17420826f8f.22.1778224333234;
        Fri, 08 May 2026 00:12:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/52] harfbuzz: set status for CVE-2024-56732
Date: Fri,  8 May 2026 09:10:59 +0200
Message-ID: <2e95f4be90916b10c6ee15245cd0937323169254.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236648

From: Peter Marko <peter.marko@siemens.com>

This CVE does not have cpe in NVD DB.
In cvelistV5 it shows "version": ">= 8.5.0, <= 10.0.1" which is not
parseable with our tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5a3d5d58f4886d5c6334c3e8046ac4fe9b8eed6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index 12bebc4bee4..6ce275acb59 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -50,3 +50,5 @@ FILES:${PN}-icu-dev = "${libdir}/libharfbuzz-icu.so \
 FILES:${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-56732] = "fixed-version: affected versions are >= 8.5.0, <= 10.0.1"

