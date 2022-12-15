Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CCEC4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:33 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.143576.1671132092006139649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=41SBT7JJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so166009pjd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU5v1UsCvvSpH/wuq00fPN5OorxwYf6XtzoWzrqOrG4=;
        b=41SBT7JJDXZg89PuJLa90orMPcP3Pf0k+PhNFUURR3SJhpH3FxlRqPDdHcESZLg4Kj
         IxZwqZb8fH+V4S7grZ+1VVF7XNhG+dPVIJddc5JQhvhyo6hK7qI+46oxZL2i3T3TA8w2
         S7Mgu7ds1uJKZt7AAmy312SaY4ZPPgddrvUPj/7+bRqlmhIoeYuK14WKiqu/r7veXdpx
         Mv6kO+LjXaTvkf8Cah5oakGd2A9Ws6hCTO88Hne/9ELhtjkNn8/Pzg25zPiVTRy6f0/A
         0VRUZ+1SDuufnsitTAAndpz/D9zOpDR/NaHGTwt55b4uj1W4ZvwVUfH1Ivhn12GMfh6G
         BemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU5v1UsCvvSpH/wuq00fPN5OorxwYf6XtzoWzrqOrG4=;
        b=boDNfty4H6LGvuXnpy7dXGzQ/5vARi1Rs5Gi2ETtAeQKCmQsD3jLqfPQWvWNiZZuJa
         hYyT2olxPiYgDhggA0DZGA2VQPUhd06nQqRl1gnFR0Tk/2L/mbYkfRTFZpi2iI7nUY8y
         Snceb4j75Aq5W3fLoewfNfXUfqR6F5t00wocy6toYvynaitiHIjMcrT1irNm+TWF52z3
         pm5DA64li8GZuBMgUk8ysBjyyO6lq2kNWvGhMKs+SGMQ0aUz0jk5sKUBT0OvF1owvU+n
         lJgBCrjOl1VX/aYit3mOcWv2RHAbjB/IpEbNxjg/PjCwqNifTR6KE/cmLYslBnXwP5SC
         abmg==
X-Gm-Message-State: ANoB5pmFk/lJFeJVh2E2IQBp57uq4qaBfpa4J8YUDaUBgs42jtwrxLjt
	jnNPwtxXvEvC70jnRuILDbOr5zO9zGWMhQBV2IM=
X-Google-Smtp-Source: AA0mqf5FFbbKeTX1fFahlYuMdULLouLku89JNWtvUEv7nq9MyLc3xOxUyKxn5jGF1ky4Kf8K6XBwFQ==
X-Received: by 2002:a17:902:f2d4:b0:189:c57c:e048 with SMTP id h20-20020a170902f2d400b00189c57ce048mr26179131plc.27.1671132090864;
        Thu, 15 Dec 2022 11:21:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/30] bc: extend to nativesdk
Date: Thu, 15 Dec 2022 09:20:41 -1000
Message-Id: <1f4236ab94524457a4121c3f75714fe5af129946.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174609

From: Chen Qi <Qi.Chen@windriver.com>

bc is needed for compiling kernel modules, more specifially
whenr running `make scripts prepare'.

In linux-yocto.inc, we have bc-native in DEPENDS. But we will
need nativesdk-bc in case we compile a kernel module inside
SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 95b5c89066baccb1e64bfba7d9a66feeeb086da9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 1bec76bb2a..5a03751304 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -32,4 +32,4 @@ do_compile:prepend() {
 ALTERNATIVE:${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


