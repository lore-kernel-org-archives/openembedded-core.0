Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC4EC54755
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:21 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.105643.1747238295578087650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l3oLJHuJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e4d235811so99708665ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238295; x=1747843095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRCBM/yj8GS4J4YGIt3cHcpvYQUzOSCRhP8h6A076EQ=;
        b=l3oLJHuJldYvkyfANWteRQcu7flpeiVq9fxMD/F1NKnBO0M+gEVZ7QEdpO0F3N5a+X
         yQFd9UpGGKhGI7np3Tvl6JIvIH8zrAwQs375NZl1uJxxZsxbd3F73tYBTKhEjMhHjmg6
         4iXlvSCJVpY8xhrwsYCAbX5PP66ASpA10Ed7NXoOHg3R9u+iMgMd5GXOSp9a85D+KqML
         F1DWvLt/T3d1KJGGesky9VYjSmzzPE7HxU/j/KbJJ015SfiptRb1AO7KSe1CzCnmu+ie
         fpQ0Xs8R1t+BWdLzBCPsWPlF0Rp7D+RpA634Nmiomnp9syhv157GHJx3jBI2q8gOgq+3
         1Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238295; x=1747843095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRCBM/yj8GS4J4YGIt3cHcpvYQUzOSCRhP8h6A076EQ=;
        b=FXoeq/Qg0IIgjvRnXznNmpExv98MozUTTtmVO3jZOiw2FOLwsGgUDO6u72FTHJAU3O
         DZa9nUo1ONf+h9iUQfF+KQlZJMUfZ87MKnqMnx+hosWF90wYBgcyXwhFzYhLAxfn9bgb
         ydEnehVfBCZmp1+mS/1ZZmXUTvZprZX9vxmaY8BhcmXDi+bM4misVNpG1SQKA0BEcWLC
         6jxW62abl+9uQ7enMa1OGvcOOEi/f4j4xMkPXVfyVj9UQO+e+ekgR9JtN5AkhSsM99r5
         Gg9xfZj8cnb2/MMPXnNPEloUPx/MxOoikRcSzKpk4aU5TEaD3GsBghHg7sbuxkv2B8MK
         XGyg==
X-Gm-Message-State: AOJu0YyFB4Vy97xF8AO7opwSXOQNY0amflAIFi6MFtA8hBTKvZDJVIX7
	LB+QGWZEqUsPc2mixEAcJYYHXFYO+/LZJi1423dbDeAy6A7xyFCKE6hjrY9kb4relkRnluenz7l
	K
X-Gm-Gg: ASbGnctO0NBF8nm6XHSRUNFbzVXJxifJyVAetiNXyqqf73X4Kwz3vguKXFZrP53DaYB
	3l+NLxe1W8MiXERnZ2jYNbePFsh3zfSsKD4m90JfLxEBUR/bP8K28weGksd70PTVzp9S4LUY0ip
	TLylb3k2JthAHGf7Y6IOwmhwYonIL/SptiQkkcdE+AwQHOp18Hl1j9cPUrVOppL5pP5GAM9yZA3
	+RTJtTpMW5Tsmyx3CaycWdBYXbiVlOsarSZ0jzRDooPUMjex3FdReKSzGb7Th1ASeh+ZtaKRmle
	Ka3Ud35axaw46pYpTzCXbn1dltCviZEP0VZNK0tq/iv+ZIg9wGI=
X-Google-Smtp-Source: AGHT+IGOFgKeQpOa+BImC8k5F5vJ502hrVQYC3R3HiX6bd36i74WteiBvmyEvy0km6N7nuKdlgEfgA==
X-Received: by 2002:a17:902:ef45:b0:22f:f747:8fbe with SMTP id d9443c01a7336-231983de15bmr67654295ad.53.1747238294855;
        Wed, 14 May 2025 08:58:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/12] perlcross: 1.6 -> 1.6.2
Date: Wed, 14 May 2025 08:57:53 -0700
Message-ID: <9fde5d3657a5842dcdac20eea140077b1e8ae06b.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216509

From: Archana Polampalli <archana.polampalli@windriver.com>

Provide support for Perl 5.40.2

https://github.com/arsv/perl-cross/releases/tag/1.6.2

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
index 34d9236cab..42ba15a572 100644
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


