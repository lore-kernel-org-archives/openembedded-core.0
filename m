Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6773E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 18:17:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.18642.1733422659181864582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 10:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jgXkjbSj;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e35912f1so960098f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733422657; x=1734027457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TaJTkyw/wI8LXEvDVHPkF/K6mGuugqxzNk3K3yA75Ok=;
        b=jgXkjbSjkJ39DPJr7ARhHrK3AxGGOc8I/eULQ+nCfKAoCeit7KIlso891Bhku5vnPw
         z3IljTsm9hyxM4L7KaDoKOG4G8nt/e70hG/DmlnGlEexjA2O4u0cfiYMO2rMApVhkweN
         Gtx99HlLpCY3YU62YUP9CSo1fsb3J2ZCkaWFR0VuKj76NPH/Rxx6jDMfFUlyb6Fe2/7G
         almaynFD7crCtKF8lf37iOwiBjdqD6IyOEbTiNcgv0CarUWWncGOK+K/uKEYpT0EoBqt
         FG0yUYOULNtZuqo35m5OceQYtnNj3JIJOj2VYKTHUI6/vBVWbjT2xCbySZZvGPT7AB17
         4Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733422657; x=1734027457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaJTkyw/wI8LXEvDVHPkF/K6mGuugqxzNk3K3yA75Ok=;
        b=jGBFFIIVavPvjDJN9F9ykrsh4eVuOj0Nc678R8O0QPuC46NhhvDqhb1svSAzYMUesi
         9PtN/E3R47u+/ID2RCoyvyGDdq34dZR1IiE4B6beK9YWAvfARCofqaLJ6lCGHo5ciwgZ
         8cd1TFUs7BK/rspyiSxmtNmWSY94hWOJUdyD2ELt8Tv/eCbcHENixayj3D7xQ1AaAAUx
         WARbR4LxnAZQGC1GA7dJtORuuiBplNIo+kMou5hcUEat7ZZSLjWCvtzcGD/woWqMeUtq
         p38odBoIksg8g+m6rqCWVj27BCHzh2VvJ8zHto9cEW08gH9ViYAJBRCUfztOoqjaHhZv
         PbjQ==
X-Gm-Message-State: AOJu0YwV5O0HY/wD1myhcUtPtEMwq9kXNJvMcY/AbRISt9Ma/cSBlpL6
	VNoFZ5ukaSJMqBnL1gvm3m5e8IuDg1DXN92uTnMnh89N1jPTvKVo760S6w==
X-Gm-Gg: ASbGncty6IF6FCDLr5ZXlxWm6vtS5Go2HCnHhjedehjJf6W7diVxDgohyR+uylUxLfS
	Hh/FZpoWrsk77A5pBB5G3FTE/l9d/Swe7yB8A34YkZBEcZ9WOr9J0kvTcU+/N2NKHxnS0M0cLEu
	C8Pfq0usch0bqLkD0W5g0nk73PKVjwICoPvHWMPAQs3n4BQE1t+joJtz2t420JIXLppgn4uJeuB
	ZFJDP+rBN3WlXoYyoX0sTWZ58yOlsLrUO8t6bBdQxPGVOdOmUNL837ZkCRMze07DMUzPn+oexQp
	a8qSeAmuQUg=
X-Google-Smtp-Source: AGHT+IEnX+3HR/yxxHnWuUK7ZzJPWtVUn5BBysxVKfNDvrg1XCr+o8pJskRsPtOznNnXB9dbkV7neg==
X-Received: by 2002:a05:6000:1846:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-3862b38cd62mr70277f8f.35.1733422657434;
        Thu, 05 Dec 2024 10:17:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190964fsm2522898f8f.65.2024.12.05.10.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:17:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] dtc: correct the tests option
Date: Thu,  5 Dec 2024 19:17:33 +0100
Message-Id: <20241205181734.1767363-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 18:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208388

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/dtc/dtc_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index b17cfa85e79..3df95ec1ee3 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -22,7 +22,7 @@ inherit meson pkgconfig
 EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
 
 PACKAGECONFIG ??= "tools"
-PACKAGECONFIG[tests] = "-Dtestss=true,-Dtests=false,"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
 PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native bison-native"
 PACKAGECONFIG[yaml] = "-Dyaml=enabled,-Dyaml=disabled,libyaml"
 
-- 
2.39.5


