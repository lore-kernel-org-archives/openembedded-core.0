Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B38FC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.2779.1750806845542458952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Oxvei0+B;
 spf=pass (domain: konsulko.com, ip: 209.85.210.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so617922b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806844; x=1751411644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymmdh/w3XFtoTsG1qNm70E8dMmUSBnAP6hS18RBqLE4=;
        b=Oxvei0+BofmJfWrR3nIf3cChGjtL9tWqbQvPNrksv3oN8qhIjUYezBjIVCg1hb+86V
         KUHiYCoGmMxXKflk8scmOTtLyRXiO7h+soh2ipbCP3grimjNkpAA6JMYsB0zdty/wxEi
         Lk2aw6jhIU8bVMSRZLeP1eL1dS/DBbvnSC5vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806844; x=1751411644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymmdh/w3XFtoTsG1qNm70E8dMmUSBnAP6hS18RBqLE4=;
        b=tM94gc+Dt7b8ycoURTGO0AsqZBMY7v7JyRcNKwsQpI/Ro0uACxl8Y7Q/Gca64EM+xT
         aeUbj8WJUjP/DdSEJ/24zemKs+E9Xcer162ItjRhF1NW0wOpr743x84cCnwB04QC0kL8
         77SGThC3ZWVhDqQQ1LYWXZ88nzwib2d5/ipDAy/2I2LOL2l/6K6vn2xCn1FFS+xmqPyi
         D36HJuOt5qJwSl6oS6r5SjzkYQT6xsu/+m+H1jXiC9ulFhCf0of4UcgZGFQkRfygHhFk
         IUVm364/9MozeOkiPQcu88jMgOY43tRbLF2C4vFzYv/x58dIU+qipDIN26Srwr1DOk1p
         sqrg==
X-Gm-Message-State: AOJu0YznNyDIbTmXaM4ZKkbWdGCuAJaUaTpq0qGli3TBvcKggh2Au/CV
	iSApfjKkJHMpXB6ZiljFzxMLd8I9x44AXeGIQlVpfS2AkIBf8KzHHFT8Jq/UWHx7NzfJOzCBUGc
	P8U5dnco=
X-Gm-Gg: ASbGncsNaCMQIOmNs77wbdhYTPyg3/H7Dy1RsDhqK5Iv8gtUj8ybLGTerGTSusqette
	LvP3mn1czl3W/fskAUc6OEmEnkzZF1oGwB2I3zrUjTm6zVdFaRxH1dqWRBme4KwBd5OLodZRIs+
	OCGsjCrRC+f6DiMBoaqyzjv63SPXuJxw60KZRT9mp4vqoL1LNw4OtpLLRZv90s37FVSKlZjSf+A
	RWchg/jLTEmSOCEPTIfoAkrzXo/Ks3WCKfrlUf24HUTCg+JwGn/zgytMo8ZYrw4Y7VetKhhrNYs
	k1yZZSVATzZT5MuLvlLfvAdMLOz9ccMa1xru7kEde6qZEEWmhqOWm9azhpWbjp8cZG4yREoNtCL
	YZ+uNtSlvV5DOhFw0onZj8PwqHg==
X-Google-Smtp-Source: AGHT+IHcugk6Xi1xiaoIwhV3itu7h3yhyv7rONgbDayBY2+8gHaFeTIjhVUxxgs0GT2woM/gQPMmhQ==
X-Received: by 2002:a05:6a00:4b16:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-74ad43d7db3mr1344840b3a.5.1750806844533;
        Tue, 24 Jun 2025 16:14:04 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e09e1csm2700178b3a.5.2025.06.24.16.14.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:03 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] python3-wheel: upgrade 0.45.1 -> 0.46.1
Date: Tue, 24 Jun 2025 16:13:51 -0700
Message-ID: <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750806216.git.tim.orling@konsulko.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219290

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 0.45.1:
https://github.com/pypa/wheel/compare/0.45.1...0.46.1

Release notes [1]:

0.46.1 (2025-04-08)
* Temporarily restored the wheel.macosx_libfile module (#659)

0.46.0 (2025-04-03)
* Dropped support for Python 3.8
* Removed the bdist_wheel setuptools command implementation and entry
  point. The wheel.bdist_wheel module is now just an alias to
  setuptools.command.bdist_wheel, emitting a deprecation warning on import.
* Removed vendored packaging in favor of a run-time dependency on it
* Made the wheel.metadata module private (with a deprecation warning if
  it’s imported
* Made the wheel.cli package private (no deprecation warning)
* Fixed an exception when calling the convert command with an empty
  description field

[1] https://wheel.readthedocs.io/en/stable/news.html

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-wheel_0.45.1.bb => python3-wheel_0.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.45.1.bb => python3-wheel_0.46.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.45.1.bb b/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.45.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.46.1.bb
index 8274e83747e..f0065cf098e 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.45.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
+SRC_URI[sha256sum] = "fd477efb5da0f7df1d3c76c73c14394002c844451bd63229d8570f376f5e6a38"
 
 inherit python_flit_core pypi
 
-- 
2.43.0


