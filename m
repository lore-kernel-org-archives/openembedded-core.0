Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DD5C25B0C
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.6782.1659705187235305448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CdCJigfe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n4so1463416wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Wzb8J8ky9isqgGk0tt0WCT8QETut2REefbZkobgzND0=;
        b=CdCJigfemzavJZvwzKRoyC1YEhqaAJtzX3H2PmliNDMIojuAjOZM1pv9WPzXROB3pz
         LozxsagEBG56M8o8rE6F4nyghPYdGv8v/N8MFZIzX5KRam1pTno3+vCaR0/pqfc/edAy
         zv2OEwqCsI2hD1ECguebgLgHNn5nhiEjNogi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Wzb8J8ky9isqgGk0tt0WCT8QETut2REefbZkobgzND0=;
        b=wQSgpuo+9bN4XBqAwtgRkdH7fhJS3WniIOvwNGYzE9zzEJlcMOLVxeXt1h+EzFx4jY
         CV1wEICkMP0FTfGAQ4GwdG5wVBz0RAwHF632ksJNZIJgMIsDeuC4Ole/EjW0JM392Ny/
         LmhdSTcSAUxTQ8/tYi/5mCD8dwHITefKmWMaluTd/WWWMXhZtxchwkh/LEUzHrawm2b5
         RHOAX+IFnQuT1j7hWZ3wILDYinJu6LCUw2XvpjgtWoI5RwiRY0IIdkMK1PpFF12mjfaY
         NK8Z9hS8UkHxzzDrIOjIKdHB/cVKATNsp3GijVIqHLucNEUUKPCn8cFGbsv/SXx1Hx8E
         Uz8g==
X-Gm-Message-State: ACgBeo2L/pHD27F2klR17aGkpn/jOar/6Y/wx3guDv8M1Ajm2iavazG7
	D/af/wPux7BfWacOwNdGWw2uDmzpOF/F8Q==
X-Google-Smtp-Source: 
 AA6agR7KyS1zUffYW7Rv+OXgYVDi2dTDPtPwzwOt8I0iyN/28C6PprcgspKb6gulsD1rSNnpquCuYQ==
X-Received: by 2002:a5d:6d49:0:b0:21b:a3ba:30b5 with SMTP id
 k9-20020a5d6d49000000b0021ba3ba30b5mr4434953wri.513.1659705193584;
        Fri, 05 Aug 2022 06:13:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/29] rust-common: Update to match cross targets
Date: Fri,  5 Aug 2022 14:12:43 +0100
Message-Id: <20220805131252.3706794-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168954

Tweak the armv7 workaround to work for cross environments and as a host
triplet and not just as a target.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index f2e99493fef..7c432ed131b 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -63,7 +63,7 @@ def rust_base_triple(d, thing):
     '''
 
     # The llvm-target for armv7 is armv7-unknown-linux-gnueabihf
-    if thing == "TARGET" and target_is_armv7(d):
+    if d.getVar('{}_ARCH'.format(thing)) == d.getVar('TARGET_ARCH') and target_is_armv7(d):
         arch = "armv7"
     else:
         arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
-- 
2.34.1


