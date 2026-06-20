Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7309DCDB477
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5965.1781960430410565683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RG6q/cLs;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4923139e940so17439695e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960429; x=1782565229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX8OA6bqAfCoCMMzgKN4YKqN3lmJux3OfZqUGX/ZcGU=;
        b=RG6q/cLs6sS/IhAzO4hdGW9DZFGDdKnF67DbRRdtYMzsO3YIT2Ut0j98Oal1TpvRcY
         JifSEfwwYJ4XFLkKCGTSAJMQKj41FfwXHy7ZTGqBPIeCeMm/y0oPNQIkMx2IxcRC6PKS
         hseLmG1CPN3ODTQSPEC2gOdeS+cuCAnRt00h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960429; x=1782565229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX8OA6bqAfCoCMMzgKN4YKqN3lmJux3OfZqUGX/ZcGU=;
        b=Kez3mUBlF2bqAx75pgpZe0/gzuGYvXADL1YSYKuT4Lan0YmBYptm/617ZMp/aoInGM
         6xGQ+f0smHcWpJfS+aMpEaAHq3n5SdiA90yXDhud0d848urhcHTG7m33/bKUrUm0M0cx
         7A35L8Re4Hb45HESYBqBffCO0m1Gcc5b8IUhBc/KJvxXWcdDh03tO3VJvSThDXyshL0s
         Wt7yZtpPuWdX/sV938+LKSrm+gA17OuTsC3y2OpO9YKpvUbbgoMTk8I8EIrqPuz91pSm
         qB6SQApoIEnT9bYmnvHAuCPfbLrGGokeanQoubxMDKDPKgwEMuzrxe9ZRFzhqnyn4H2K
         4VIA==
X-Gm-Message-State: AOJu0YyOVqyZoxphySJU4oEeMIISelSxcR60CBRZsu/dvnDluNw6GVVG
	QulRPha61iQ5pkbsmiRy+jXmk6b+qRz3haad2SIeo+CvwV2veXsbDmXBIk31kk0XHvl5C/KbibZ
	inXs1
X-Gm-Gg: AfdE7ckHjmUv/SJj+8sBH8k6ZOfbsKiTAB2glYujKVLnS/gk9j7HcH6SuZP8WanNfqE
	Bebs8sOP6JArlwd13Ghr5ZyzIUi0ZjGtFmocOGbMfl819ldiJ4bDF2uFi5Jh76numhB1YFjeUbu
	YlAAwQCnMqZsHJffsnHIHFeaapoT2WSx36qq2ILGH+UdWBKz8PEy5BOGWna8HAogSiTyz/cpXM2
	y82v3mXPNXMUnwGsy4lrcnYV7woXFHF88Ydoja4C2/GKeFAb3yci+fGPeTD6iTvcktU9ap0ZmeY
	SsGBfgpUM93Kk0rZJM+KlfxVLFXGWrutZuXPY3CcXX0QVj7AgqwLDOb+UAUCFRAhS1CdvUQpxqe
	ihG+lpPDdOZwaHujxuOpHOWAWuArC2kSbTNYkVIHP24lt3LqHJ/2GrFRACN7ZS3g/lM8oGIfaw+
	nl5YpS4xfzWpvj90c9fflccbFmRVKrGcOyXoEYrJxaaFSPhnQGeC1AFUhlmlaKKVWi0GMcHmsoE
	cM6AQfunqBGj4Ru
X-Received: by 2002:a05:600c:b8d:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4924258f73amr91819315e9.33.1781960428671;
        Sat, 20 Jun 2026 06:00:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/36] util-macros: Remove redundant MIT license
Date: Sat, 20 Jun 2026 14:59:44 +0200
Message-ID: <744c331a4e5bdbacb1c759a0ee58d9720e9ab21e.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239239

From: Joshua Watt <JPEWhacker@gmail.com>

Removes a redundant MIT license declaration

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 941dc1fb5074d6d194d0c0bd4b585a773961683a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
index c8e0b8d4904..7cd774bac66 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "M4 autotools macros used by various X.org programs."
 
 require xorg-util-common.inc
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42ba50748cb7ccf8739424e5e2072b02"
 
 PE = "1"

