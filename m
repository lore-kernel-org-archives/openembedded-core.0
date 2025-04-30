Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D88C3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.8389.1745982027266313376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CyDfi+uH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22d95f0dda4so97598695ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982026; x=1746586826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LKFgFrlyxF4M8dCEIQYQSCXVpc9kD3+bl6H8Udeh2I=;
        b=CyDfi+uHeLzFPrRr5aB+jGgoUOjcJmkofBqjvyxqcp636COSpJF+WiNThIbLZ2S7Fw
         /TQsHIdq0k15eLXMjItH1lZvDksl/vIIAHPSSPtlXf3M2OLWuqpl9AzhF2rRy4sIGiIk
         k7z6BCVW6c28tAdBqI+2r2hl0YpKX2cQY+JukBckzcihAslWJEsoZdjPc06ikvu9tuO6
         V3h8KIqPSyIUkLbw/Gqy49bklomUTTq42xZaWa9nStaTJO1Vv5UGfGgjw0pkMSItqX/w
         ACGyas45+IMDc98vL3ACiyKFSqs+Jf+GOUBrUwPxizP6YPCTe8+2bhfojVzcKP5AoYpe
         jnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982026; x=1746586826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LKFgFrlyxF4M8dCEIQYQSCXVpc9kD3+bl6H8Udeh2I=;
        b=WMLebZaGh3HIWuWS9Ws0ASpjQQcy4vWg7h1OzDaTk4xBNG3WIavFpp/bYqj5voCQgk
         qDx2YjVuUekja2r3WykZwmX6RCdiaBvGZOsGAlx8o9FZ/pXo73Kv1DYHXH8Bhd0Jasxv
         DifuN/yYsLZTG/9Dua0qShjhNd23IE09GuBRX5N1xiy+1pyytUBBKTWUC1EHT9mqKSlE
         6L+Bkl82Hycra2mPsVOb2bRqKIGpi8CKr6BVUbELak63OnpvvioNUicH2Bwwr0s7hqtM
         pIEnBOMvP+yw9oZDlETbAnmqiqLHVi/HHcJXCpogC08yPuOHfdLZKrGUMLn3EiK7m9pP
         wSzA==
X-Gm-Message-State: AOJu0Yz6r7/9bjfuZTJhYTckiNk3WmMeUiG+NnD60F9TjGsCR2/tC7e7
	D37AmGHby86BossTbm9U6O1UM4/uSoY90BtyUjIpOS5nKzlXYSXlEaPR35nyjnnmyfi/Kn94AzI
	8
X-Gm-Gg: ASbGncuX74/2dUF/jrH+7GwJhpF+gGHvURz+sPdoy35DYG4daqko8Vna1tqccHI76w7
	FpRGfPABRJzfTsLpg8xRJxx7F0sUU1Qwvj6qv6UfLMJt0fTDCRskUpdFeLorYLhNicS/VmLRH2y
	bbCCaYRqOPkPJvXA4JxfeWCEPL+igX3z/VrhTJn0rvf4Pysc1wSX0MRCEHm+X9e6NFllCo6TJQg
	9yO51eTKpYdQeKapmTdKKEq1pBak5nE+SQavUWP9AA8Kfm0qMR1yJz/pJpTobE1co9PvFZ+AxlF
	DazGBfSR+kg3e7psMnPN4sKeQCputLw=
X-Google-Smtp-Source: AGHT+IE6NBpJ9Pz0ic/GExp2CucGvVZw8AeaT4cfWoJbaUY+glkHsprMnS4X+Nj+/rUncunJfosmbQ==
X-Received: by 2002:a17:903:1984:b0:224:ff0:4360 with SMTP id d9443c01a7336-22df35ffbabmr27118695ad.53.1745982026383;
        Tue, 29 Apr 2025 20:00:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/15] perlcross: 1.6 -> 1.6.2
Date: Tue, 29 Apr 2025 19:59:56 -0700
Message-ID: <53dc46381ee3c8b04e507707d96f048b8a31e709.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215714

From: Archana Polampalli <archana.polampalli@windriver.com>

https://github.com/arsv/perl-cross/releases/tag/1.6.2

Provide support for Perl 5.38.4

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 295dd0cfc1..e4bd90c572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.43.0


