Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862C7D58075
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.17100.1732536112910016758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1RgLM2S;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so43258261fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536111; x=1733140911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA+eehsEDm1VJJ5jh8PwvRi971/B/pknphrs7E9VAVA=;
        b=R1RgLM2SRm2C16UrhPgTka16rw0t993sHhtFE12KFJdas3OzgwOE8IHUv1sl+P8NEo
         xuEsddUcSHokAQ7dEDfPmcI5sEOjIJ1MoSstQO0OvkUBdqUEjxqwVuizIqnWhuhmAtmX
         n5hbTOpsz0QP5P4F07T8fD3ez8GgtzxuI5GVuYfmOVWV5gII677PDpr+bRVpNksp7MHv
         iG+MhBOnfa1elOQf9hb8eB5lW6EpDRklaF6qai+Ql4PVjwVL0HTayKJrpgxeBjUW7+Gx
         Ehb2eUxxWq4lKUtFLihPHpmGRP1gaTBHpoe6Ld3cF78ursMZKcg9dMCfwm4FN2cxKY7g
         gciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536111; x=1733140911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA+eehsEDm1VJJ5jh8PwvRi971/B/pknphrs7E9VAVA=;
        b=qK5OFtitkM1pULFVu7rneeZZHMsnXZ7/IUpbkwzWV1FXAmLiaD2kBz2dDm0ZtsYPZ2
         /vOywVX0S8aHWZCZY3GhQ/zY4wbcO1wFc39SPZhEvgYnHaEeLWht2oOLULOY3smseUdO
         OunoYvZr9+HA9oDxmyqCT8a0LS+z8rX1Ddv3TJrtjcL3nLLmx6RiWCKzf4nD5Jg5Gxc3
         cD15HasFz/vFKViGvIuU1Z5ar5gJ8tzuYQ6I8Qj7vhKQNS4SKXHam43WaClr9fixMVG6
         aAJsaET7oWs5YqCeOPJYrnaaBOJvhlCV+3OkxHzSy/7c5c3AqhpjMZXhnm0NpNC1LjpR
         VlKA==
X-Gm-Message-State: AOJu0Yw/TseHUx3p4Kb9iAXfS4hmqW0yydsAWIo05nPvJWigS/Iky3gE
	P5jIV1n/4t7yWqn77z5tuqbTzDlI8T/ZGImKPDETAEx6Bh+QsTMrJMyK/w==
X-Gm-Gg: ASbGnctMC62XqeMSrlC+TxQ+Vh4vSaKbOqHodYvTc5tIUtZ1tbAk6Z+8YToJsyMh++J
	YPRVfEjXQ8K7gdg1ijwEdxKHVovkPYL5qoAa9J1xENzqtGBTvzwMVCSI15hnagIImLfLyfeunwT
	PANyFK+nFzGIXJQo7z3PVhWRWrVIaxTppv8soOd1Z32aA+ZmvxtMYQnH9gy7DS06bMfaceybuc/
	8mMX5OzDtCrzXA1zjRoI52SmxB5x1UdKL3VRiLzXADbp+8Fhre9hU2wKwmiYMZsxxUnSmIP1DpE
	VZVzTblbvrI=
X-Google-Smtp-Source: AGHT+IGOq9vsFV4O+YtibY3q0RBkqSPoFjJ2bTQj4v3i2YLYXKEZn6GyVPRAJiWy9OxL5pDzbLUtag==
X-Received: by 2002:a05:651c:211f:b0:2ff:59fa:44f0 with SMTP id 38308e7fff4ca-2ffa7100270mr48885351fa.3.1732536110719;
        Mon, 25 Nov 2024 04:01:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/35] python3-zipp: upgrade 3.20.2 -> 3.21.0
Date: Mon, 25 Nov 2024 13:01:19 +0100
Message-Id: <20241125120127.2205232-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207775

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-zipp_3.20.2.bb => python3-zipp_3.21.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.20.2.bb => python3-zipp_3.21.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.20.2.bb b/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-zipp_3.20.2.bb
rename to meta/recipes-devtools/python/python3-zipp_3.21.0.bb
index 4ab3464471f..135a1ae5337 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.20.2.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "bc9eb26f4506fda01b81bcde0ca78103b6e62f991b381fec825435c836edbc29"
+SRC_URI[sha256sum] = "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


