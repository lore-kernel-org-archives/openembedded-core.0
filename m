Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A83C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.2232.1700120220180821750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nf/Sw84z;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9f26ee4a6e5so68448966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120218; x=1700725018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIZ9YIZo4vN46yUefJ4elVL0vdBpr8ZYtP9SFe4JOmk=;
        b=Nf/Sw84ztvsghf2IsXt+OiUUI/1CQ+94+eDFliHhRU+G+Ojuq5TcoWWt19P+jCT9Du
         rbrzZh4ppSmrURy2tVDbAZzrymkqfa/ykSqxz3hshMGlQFjJp0pDhC53CsY8kHDyT3+a
         utBRkSZcK1GhUSWZpIk1rUq8zzGF0OM5fJiJolFE1Z+CU/XIxszDr5OLzrFbBGAocOCK
         0wENHVIdpZujRQOO7OPYXYVSc/nA0R1kbgWeMJnHZ2GP2HMmoG/YHGkcHZkFTVre6sq8
         xO6rcnL5MHdZY+z54FWxyXlo6nPPKfpTXB891xNPt8jO8midIC2eKVPDXc90z1dyKaQ5
         8JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120218; x=1700725018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIZ9YIZo4vN46yUefJ4elVL0vdBpr8ZYtP9SFe4JOmk=;
        b=BUQINnIjAwkEqdyYYY7Sb0+QBtHEPkkiFejizXONLgPZG01W5QPWQXPuP615ZiAGme
         A3p32Ujmmiv9IJtTBNwjmhUinHMTZsWvoVKNz8kEF+bE4I/MqTs208m/jpybklD0xvEG
         V0AoDAU333x9+x5QO8Uf6o1v1czvbSvoPm1LdEhgSN+IXBPIAg1ezmSHBGSCtgwpzyPA
         G7wIyJrIMNzpX55LOCcVq3iSct3Hgjr4bwkn+Ougl2ygnX9uCDofuj70DZNMixiBiCh0
         pasZqMC9XIc34Px2tDvsSe7IktiYSdBPT8wZusw0Lc8rsszEwhA8N/TnWUvfV8bl4lxp
         GCJA==
X-Gm-Message-State: AOJu0YxPO3bSq59Ld/HTBPKm80nJqU49x4OytdI0iYq/BUJTpGLbetWS
	lz5f8cmRuK5G4L1Cl87eraIcSCrE9XE=
X-Google-Smtp-Source: AGHT+IGk4Lencj34hVlguDa7QnQKSzMWw3OQDoAM1OECKgExT7no6lJ43GWdCBddxS/Mwfei3zVKdQ==
X-Received: by 2002:a17:906:350b:b0:9e0:2319:16d4 with SMTP id r11-20020a170906350b00b009e0231916d4mr11749600eja.40.1700120218525;
        Wed, 15 Nov 2023 23:36:58 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lc25-20020a170906f91900b009e621705878sm8123071ejb.147.2023.11.15.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:36:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 04/11] acpica: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:43 +0100
Message-ID: <20231116073650.2710535-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190756

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index b7921516a2..8ca1f0892f 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -36,7 +36,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 INSTALLDIR=${bindir} \
                 INSTALLFLAGS= \
                 YACC=bison \
-                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
                 "
 
 do_install() {
-- 
2.42.1


