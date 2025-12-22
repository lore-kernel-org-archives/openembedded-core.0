Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EB8E69172
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87770.1766434071214349248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhNHHHoX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b728a43e410so790109466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434069; x=1767038869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PVVhjQH6FyuMU+YtCV9FBiFRRX9xNUpj+oTH1e2zak=;
        b=mhNHHHoXDTRCBr1v/DaNhIUDZO07jCyVKGksWcFJu38NsDFLo0jPRLdhiToxwyelwF
         tPyNlq9pEegfGN/jXCZUUwV0+IiHM/3pB8ym9agSune/q4vXVinQT5rRnLfVzIdbRXnB
         Rc6L5KmhwskIi6HThvLJjGbMGXzXWd72wxhcmCY6obkJWiUhSSM81i8zRJcclXv92xhF
         I+zEuvXJeK36z/tUM2aByIGAsfKzBC5LvBBQHfMJxRaihoWzRc1Na77/BcpAE8HNgGKk
         E33OU139ShITn9HLpRsdgeClf/DKrO+4jOs7BYWMF4UOTU9dsJr25SXpHVVaWSF65KfO
         ZIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434069; x=1767038869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2PVVhjQH6FyuMU+YtCV9FBiFRRX9xNUpj+oTH1e2zak=;
        b=wi/vD5q1dlAeyCONnWuhykHOS8TxPcePXDBC9aIjfrHnB/IiWWkuv1NATBtHdN1nFP
         jNu6FfF6Gr4mqUoC/4N/QOQGoAQa26ZQE8Ws+mQCdgRV58jSaM6Ru5h15FREKPyTHhzb
         +yicKUfZ+ceqV/Z0pBEU/QJt+3Umff125gyjWIn2/LZE+IaWsEUS4f2VY3FH3GGt/F5Y
         ZqmCGmxFKizNc+jhUMqqoRKwblM6kPwbs+4jnmAvbHy65lLNruQiGot9+UMKAidLzah1
         xuEt7gaHBOhbCNEi8VQxPmtdwJrljrqPxvjjnAwa3MJJHfb9Y74xzX9mItvdk+Ss8ANe
         ondw==
X-Gm-Message-State: AOJu0YwDogzMFXbjA+CY5eP0dkXopKpY1s0cMRgjMlpgu1Dhfja9xqCw
	RRPi4l3xHUm5Vo0F0RV4C4c6Y4LAGe9QkDwHvAbcaEE5Ddd8NYBsMZQ7aur4JA==
X-Gm-Gg: AY/fxX5vKMcYy56pgyMvsQHtyESmTexpX98MaTaVVvfzpGmgFE8ILN0dklS5H7NJ3zS
	Jaj+V7AMaHE+DlJTgaGpdyMHZAs0qGVXms/PFx3C7U6Xd+ZDJ7IS9izk2LJQ6+TGB+KLB4ktqEp
	ZV0jPKuaf7tx2zuCC7U+tvQ93xKFciYi+lreMoaKbqwB66UnwUyBHhYkfl5Gls1LHpakVrdapgh
	nENRJZ2pCtxLp0SZT7DOGuRv8W2ENBxgi+eBwlVogKp9Y7gOZytasZPUKZiPowEgjFUUepK5t3+
	HciXCyApT1q842ubWFtTQVvNVuvl4Ru4OpP6vnp6vX+PNcn0rsY5bbcgQJ0LK3sUZDqWxccXpei
	p0XzvtGIebvuvfX2a24Dd2TXB4/XfVV+ALv+SbBrmDmsL8AIK1ZNmQu2U/F6mGPrAF7djcKzsxs
	3P69j/kYjstOKP0GhJePJDyUGz0/Kgf/YPPl+SuUHlEZ4cqAX4C4EC8/OuVg==
X-Google-Smtp-Source: AGHT+IGeaqSejQvRhe4hWDjJOMoNpciIKNBh4R+9lonC0HYzkNIApV7NjiHVjSUFtR/PQdcmUf1Rmg==
X-Received: by 2002:a17:907:6d21:b0:b7d:36bc:5fbe with SMTP id a640c23a62f3a-b8036f1128emr1210120566b.23.1766434069388;
        Mon, 22 Dec 2025 12:07:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 006/114] bash-completion: upgrade 2.16.0 -> 2.17.0
Date: Mon, 22 Dec 2025 21:05:48 +0100
Message-ID: <20251222200739.2278706-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228331

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
index d1a8f5e0cc..843b5b831d 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a"
+SRC_URI[sha256sum] = "dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.47.3


