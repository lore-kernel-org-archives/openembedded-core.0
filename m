Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F57CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9517.1777739469861910387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LfFDcZrw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso176714f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739468; x=1778344268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36VmNf+bTvAUEY/luWK/998EZTUvcmOiYnpRTnFCuJA=;
        b=LfFDcZrwg5romB5ui56Z4TARFIfGdR1jlWDjuMAy+DZtmXZkgU5E81MSjrSgMnPcpX
         zfquK8YwUyE8qY4shapwmiE+5DskeOODolE2ewGDTflxzSneGxp7ocezFtvkCRnvis+L
         Gmezcvku2WF4L5YdjCIj7q66B3u34sAfCJCHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739468; x=1778344268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=36VmNf+bTvAUEY/luWK/998EZTUvcmOiYnpRTnFCuJA=;
        b=OPM3BHAZsrgdrzrQ/PXAGXVnWyZBqF5rx5JS0g2g8o3Cceoo+MFOfAkI/wgpEUBWG0
         Z9ypdTZh4riQlcKVLrF/mYNIl5sVPNhL6L8QW5vX4LLSp4n8FTXgPNkHqM6LnYw0DqwT
         aQP0wI5akr79tziMmiEZF0SIb+zQZ5oJnEy0QuuqCIhg665oehk+vEMGI3IQ170mv3Hi
         /EFzsmuW6yNqNtdLKJJhokTO6BmmaNWf/LHeyugkdmsuu4pPeBMajy+n56HesSa1xOfP
         IMM8SVDdxGZAH9uL4hU0OFXSeR68wqUdfCBI3rdosW+TUM6auIK00IBzWVk+5Ju+CjRb
         6PfA==
X-Gm-Message-State: AOJu0YwLrprdIyMpNqkDlVIgS+fva+SVleov7D3EYkZdXbi4t4Zquebw
	LpUfVhzTYROQVq47gZ+SK87gucLCpc8Rk3Da6ClnV2IK1wuxI1He2DaUyXbN4kgh2CWVJQeXQiN
	egEEyrGZ14kkz76TEeabtcL6sz5WC5YjlTb1AKQ9PFWkXGXKFX4LylGwQu/pHXTqdUcoHgSCHCI
	VcZwTH9F49BkvEjnw=
X-Gm-Gg: AeBDieudN+Otofl8p0cy/JAGaGmliJuKIxs63Nrgsjy9opDskoktro0IzKZlmamaLj1
	CwQXYM7cWbiFlXitOIMN3cRU34RKStkDc1H1txr4BFbgsMLxM8pZ4gjs4IoxAV30BCXJ5xC1ewO
	ERY7bI3jY4a6jpWtL/radQWySWQ6pQleeuxEiRJ1NbM9+yG70/gEpcTkDIN9m8krADiI7p1upVd
	StYh/XIZyDPFUB27mAAL2IpKV7kx22dYx/TjbzjomSiJP63xB+gpIjos6Ubi0Qiu+CdzXLQrySB
	EIxsNckyB6YIwGBJKD/KuODJbDoFft9ZJ6nqXHM10ktMuuVLTVo6ECd7vhitTEJ9KOnf9CzJ4kB
	tKoiQnQ+4LPRPyxtVG0FlvGrOOJJ8swTJsI5ibCMq4NaivyQ9tY+7uHV2NC8VB4UiKXS5w5wPzS
	9RBQeF2cEXHOMfBQ9HEfa9+01z9GEAlEbRqLX8XCVWPshwqs5qLR19MW0tgGuJngo=
X-Received: by 2002:a05:6000:2387:b0:43f:e721:76bf with SMTP id ffacd0b85a97d-44bb6e8e0d4mr5531255f8f.41.1777739467790;
        Sat, 02 May 2026 09:31:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 47/62] python3-testtools: upgrade 2.9.0 -> 2.9.1
Date: Sat,  2 May 2026 17:29:07 +0100
Message-ID: <20260502162929.1377831-47-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236356

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-testtools_2.9.0.bb => python3-testtools_2.9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.9.0.bb => python3-testtools_2.9.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.9.0.bb b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.9.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.9.1.bb
index a7011acd78a..0c7f6221781 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "eb562d1a2157c6d443c8c118861eb452b3655d1842f9b61b8567ad01b32826e3"
+SRC_URI[sha256sum] = "39ad9eb9e1b935d6838f4b3aee4d6e72db65df5602f6feda998dbb4fe8de0b19"
 
 RDEPENDS:${PN} += "\
     python3-compression \

