Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95718CA0FE0
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:14:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6829.1755774833620892156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SvPZA84z;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so515988f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755774832; x=1756379632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n719LzZgq6BMejCpU/qxVZmRf7DIHn6BPSts3Xdb9Jc=;
        b=SvPZA84z3B4inJbqj3qZUXVLBaZS7EibEMLguAZuRxO4FkFCA5inVWMYAteSR+RGRi
         Zo6bAMJOGdt5JVqEmn65nZ9bnt9HdCV8qsG481hQxcqy/eoZTLtYMNVxX6j0micVUlAj
         in7YvQfIcJgBq/oNKUyNnyFcypGUwHAm2zps7fr6fNMHQWuhVZokkh5b/lFKrPI3euZw
         C4KIM/u1j5vXf5Dbt7ep/23pn+W7gFmiyucvxmYtIrRW/nSlz62vHilg664+r3p6g11s
         rE0f/covRcL7aLyNfa5wtI4ujhU0ftkLG/xL71+c/RZJA5W3yBEqbmVfvhL50ptBuM0t
         6beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755774832; x=1756379632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n719LzZgq6BMejCpU/qxVZmRf7DIHn6BPSts3Xdb9Jc=;
        b=KjD4WxkDujAxqzhv/RAePqFvhYOc1ysMCDlaQ0aDPn6XeD2tMCN0SA8jcaaVzakNHJ
         UAaD01IVh+rp6hHiIK72DiQPpeO+5fDJwD9MH/Xg2oS/R/l4yDYRxQ76uvGBKrLc/O9Y
         0t35FfOyy0unmtAQ7xswE9rBOWfZWWNDiVOCl65DzLNH6yK9fJG6P/M0NPOogSVEgnU0
         ggXqINhdy7y8FEeqmkYVmXYkwdzdBQHD6w0Y/byVC7BJC7cw4Td5EtdrU7pFB7FV9vsN
         rYVqDbDc90CxOC1ejmkRVIZ+o6kwvpoeJMBIX0Yq3f7x5HWkXuveilVpe7Tp5tbk+gID
         g4EA==
X-Gm-Message-State: AOJu0YyU0t/SSIM9UbO6J6g2KWKhQU83FNgXs6jzDSqWZHF78z5UYliD
	J7vUwPBmx+NQinLbDuttK10kkkQ2qzjzD7CONJ1659iW4pttSOHgBSgLkYx5VA==
X-Gm-Gg: ASbGnctDLSbPMWH8G3rsDAfg54XgbjvfEMxACvWfs8Z9IZEfOvtZgVZSRlxJkLLf6Jc
	RLMsDol3YwZcVN853f0kmng/FeSL06un8mmXF0fXDduzPkUi5xyCd82x3j4a07zX226oxH7V98D
	v1d+9cYUaxhPR3Rj135h4TYXHFjB6rxr/HIurCmGr497t448hmA2oyf9WGkzvNzR/0Idwe8pqgM
	FoDebtsvn+zcMziihhQty2rXJRzDaXqRp9mZfsMqYpGJ7KQRpiqU1IiXSDn4ille4K0fdyr+ivO
	hfxi3dkIYmGKKBmBNkrN9hpyTEdj8mtKZGiVWc7C2digXIRuGjqQuM+jF428IrcaD+xZq00y5zY
	xoI8w9Vq4GgT6sY/VJ2q5kwCEdys4jTo/8Cm5HZoDS7PCMZ0nmjrR8v8A
X-Google-Smtp-Source: AGHT+IE2v5MHADTLQnOHUIabfuVqyVkZeXJdGUZUFZOcj01chdAUHNl/UW+bs0vi79JhMP6GJF1APQ==
X-Received: by 2002:a05:6000:40cc:b0:3b8:d082:42a with SMTP id ffacd0b85a97d-3c49727452bmr1507426f8f.45.1755774831819;
        Thu, 21 Aug 2025 04:13:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074e38d7dsm11146952f8f.26.2025.08.21.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:13:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 1/3] ncurses: Pin to C17 standard
Date: Thu, 21 Aug 2025 12:58:38 +0200
Message-ID: <20250821105840.3045170-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222227

From: Khem Raj <raj.khem@gmail.com>

Newer snapshots of ncurses have the fixes but they are many needed to get
C23 going. Until next release lets stick with C17 even while GCC 15 switches
to C23 defaults.

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3b72f3efdd..5ef735fcf8 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -30,6 +30,10 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is not detected automatically
 CPPFLAGS += "-D_GNU_SOURCE"
 
+# Check if we still need it when next release (6.6) happens
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
 

