Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25DCD58090
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.17223.1732536107631253782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=in/11rB9;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so8044631fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536106; x=1733140906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wI0aVydvTBc26hqQ7exJBLS2EvBKWX0hvajk8Kqefuw=;
        b=in/11rB9zfDYqfpTJvOJWrOYMd/O3OsTfkMRM7JMaOP8dAbgmeRVvCalFDO3OXH3ay
         kXF9isCj8XF+RuWrxv0uo5n0hEnXZtT+YItE/E8vlsmzXVD5L4vWUFLzp3fccmC2s3yT
         JSisYpCA0yt9kY6fcQ5EXPUqg8DdSlzmh+lFkyWFE+7H1VBuJtQ60FTSXVgecvtGwwbU
         G4rKuM91EP2uCGjB3179uHrovaYL8YiDBMjoxTBA4WAkby80yJZBxEbr1vh75Zuhe30v
         abpmKMLwzGXUckJeW+VfMGWge2c65dpLr/fJoRs8ThQIfGa9bny+1kGjf3aNpHbWe3SK
         BI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536106; x=1733140906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wI0aVydvTBc26hqQ7exJBLS2EvBKWX0hvajk8Kqefuw=;
        b=L+KTaNCZtIBw7H6Z1eHPpvtJ/USK9tBiAfXpRbSyJZDzUheH3gBix/+3LArvmBg928
         Viia5IxQGnKEidmi352bBjOWppboDv2xZ7KqpVIl7Mvam7V8CoE7Gmlcq5cKBx99f1Tt
         9BNE+UUcKbpRci+b084IKcScJXSG086tfzA1I1yYVmL9yukuIzedSUEPzAUtC2rr/chD
         KxHV6ybSb6TqaXt6qQKfI0Zcxj4JmXzmQExVCWCsSufO6I0FmcvhfN72BYOirjKzngI/
         WC9E+CBX8D3iLgoAcek9q4skUG5IHT5HWxdMkk51WWcr390sfQ0/GGn1FzFKXHJhKEuj
         04ZQ==
X-Gm-Message-State: AOJu0YyOf/5Xj32QphYe5cV+FhulZ6ozULO9j/REdnkubpLqOKrb+QNT
	7GZuR7iEd9g/geQjo511meJjPAd1SjoKRdqnufRwDJqnrIaWJPF4WiwAYA==
X-Gm-Gg: ASbGnctxlZnVKC4pI0iQEMuAjiQjS5wyZ1ZD/WcbKf4yHA7RuUaqMmKj6xbrBpqlRsQ
	co1v7LKz8OnNQTlbuNAngQ6y2Ut6o8Uit/rl051+17QlYOk8i0ESgJHa3EKg0q8R/3oEz4Ro4gI
	3UiLiCqGLpty5rFlvma/ud6l+3irLY2/b2ZMP6K0p9Rr1WVpmBUpiNH2aGkw3VG8WyXZZz2EW+x
	GR9wt0b01BhTOWCVG+Ev0X6utSjDlaBAsgxtj4+EQmMSf6pH3ME6FNTrauYGKRhNwOzmcV4u107
	fw4JRSgojsE=
X-Google-Smtp-Source: AGHT+IHMf12AzI21n4BXtZnGXK2s1fsF+qh0afBy797/79UyDrxA7pGx09dJv49SFKs6A7dT+rR2OA==
X-Received: by 2002:a05:6512:1055:b0:53d:df50:5a24 with SMTP id 2adb3069b0e04-53ddf505c84mr2543539e87.16.1732536105560;
        Mon, 25 Nov 2024 04:01:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/35] python3-dtschema: upgrade 2024.9 -> 2024.11
Date: Mon, 25 Nov 2024 13:01:12 +0100
Message-Id: <20241125120127.2205232-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207767

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.9.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.11.bb
index 5a159297fbd..8d052d69108 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2"
+SRC_URI[sha256sum] = "bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.5


