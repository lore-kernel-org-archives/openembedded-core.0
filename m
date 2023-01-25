Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48DEC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 04:04:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.37732.1674619450334472505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 20:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WWaASjDB;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id g23so16721704plq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 20:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5z+1FN2cRGuBI3htZHWRD1E1UAm7K7REwNyHmn7Hw4=;
        b=WWaASjDB20Fr7/qWURoNdirt//SzsvG9C9m+9XzA94RLJutQSionRxQidYzR0G+Qlr
         vDU8EbIYPfJ0yFKyV+axu+5YhotAUkCT4T5BCsuv54Oc1KeVmup+wr159eUNRwKzjSsF
         yRyKXhINS0zNLUsIzLYTw53MBnhqUhmHcHVGvoQCWFo8QcxSjloegIK59E2qwlMRNp9f
         0Ks8jEbftdTptgLy7iakUtiWLO4J1K7IZrkZL1lcihdTyBbxuXEQoMtMQSLMFlorm8Vb
         OLotfHxr4Q932d7PQG6ruELA5Aj/aJYgaUizp/2ZAFnzNDeHY+Ru3dEdnxS0Ua8eDjlN
         Dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5z+1FN2cRGuBI3htZHWRD1E1UAm7K7REwNyHmn7Hw4=;
        b=vvzFKJQx7tqtkBJRCxUjQKWKgq4qeooVBIac78SRiNReOClNuAl8lV+G+AWIQFGQrC
         g2bCNLXsNsw3GXURD4rtIQW0YRzgfjPU3M9W9THfPQCxUVhmoOiFyq8opJxtGzXPbhO7
         qPPtFnV3ptr3IoLCDsFol5viLvlxSOl29Akfrpmampn8Sts1APJYn63c925qLUuWLoEB
         pD1CJ2NQDSRDOqiZjIG13gcSORbDtjnk7NM3OZuqb9ne+mvIVwJYk4NFgGVHfKe/JnwY
         Hu/7bQ2hGrjyqHyT927RvEjTcBYbOtKUQSBcZ6LetZYYUiALW58r9X5WSQ/XgJkbFrRV
         sYpA==
X-Gm-Message-State: AFqh2kpFV1RdiDXwB+BoyILg0Z+EHbuGg4WNFwgfwnxOWCjGF1j6J8gA
	1eOApNYlLNOAEOwvnOuZyH1BbIagHZkURw==
X-Google-Smtp-Source: AMrXdXvbNTrCOX51MAUGCK4AUwUdp0jj3N3/G/tBSj6P+mP+VtdGJrkqcSxukOJjLN7mlAhdxrseKQ==
X-Received: by 2002:a17:902:c401:b0:194:dc73:5cf8 with SMTP id k1-20020a170902c40100b00194dc735cf8mr29552945plk.39.1674619449497;
        Tue, 24 Jan 2023 20:04:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b001947222676csm2462714plb.249.2023.01.24.20.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 20:04:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] texinfo: Add missing rdep on needed perl-modules
Date: Tue, 24 Jan 2023 20:03:57 -0800
Message-Id: <20230125040358.3573537-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125040358.3573537-1-raj.khem@gmail.com>
References: <20230125040358.3573537-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 04:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176339

Fixes
Can't locate Encode.pm in @INC (you may need to install the Encode module) (@INC contains: /usr/lib/perl5/site_perl/5.36.0/x86_64-linux /usr/lib/perl5/site_perl/5.36.0 /usr/lib/perl5/vendor_perl/5.36.0/x86_64-linux
 /usr/lib/perl5/vendor_perl/5.36.0 /usr/lib/perl5/5.36.0/x86_64-linux /usr/lib/perl5/5.36.0) at /usr/bin/makeinfo line 29.

The slew of indirect dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/texinfo/texinfo_7.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
index f0f9211594..4c8608b745 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
@@ -76,7 +76,9 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
                   ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
 
 FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
-RDEPENDS:${PN} = "perl"
+RDEPENDS:${PN} = "perl perl-module-encode perl-module-encode-encoding perl-module-locale perl-module-integer \
+                  perl-module-if perl-module-unicode-normalize perl-module-base perl-module-feature \
+                  perl-module-perlio"
 FILES:${PN}-doc = "${infodir}/texi* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
-- 
2.39.1


