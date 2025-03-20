Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1F4C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:55:40 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.12943.1742489730957231562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kAQuHkDt;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac345bd8e13so187110466b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742489729; x=1743094529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9NOa3WN8s8gBUHr9+DxgX45yzEQH6Nq0pv4BlC7MYI=;
        b=kAQuHkDtFXu1DSek9TwhztmQD+nXd5IfEdDAOZI3kGNQe6rTVhqWokLI8u3hFwrtSt
         BofOSesuygQzpj90OJGprgYyYQ2Woig2bMDDTPdWIGNBQyHZWP/i35sllnKZQSZ/W5Go
         0m5ZxNmOWuiUa6X7LGDbXVw0tFbUcKR98pyIOZbEeu+2daoUD4TDtb0hj9e4YeJkcn0j
         Vh+WJQDYiOpAn3t6vFmGa9DkwBNRqq8zk+0nmTnGJrP7eW3vfiKnAq7PmhP7xZVFpy+V
         a18X3o1L+bZcRLon//r2DSPiBwbWl7KKrSkES2ZXV+6E+Gy5HoRp6XD3/emKTmXICzes
         ZsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489729; x=1743094529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9NOa3WN8s8gBUHr9+DxgX45yzEQH6Nq0pv4BlC7MYI=;
        b=AFWksnQILtO1x3yrg8k9eeakqe+/HJdl3nqFNb7ODjLMsXnFbsYFn3vnrTihXzKsF1
         /Y6oRh2S7T+U7JHYE6Rgmwdl3Gqrohd1W5pEsHrl8AoxUfvGEcZKIRIwWNTnxUx9xc2I
         WhCy5Q/7hxvnHkqHTAakV13kZZ5vWylT7mT1OPu/1yT83dFMZB1O85OtDH0c+NzCc7yu
         I6Baxj1dpPlPDz/ydqNuiq1ewmoqeFuyQ7vko78UfsNJ8IHI78J8HvVJpUkD6GAMFxxQ
         4fqWmz2WN2J/aZk6WvwcK8AE0mGcWxC1BgnZg1vaagaByNGzGzUmpDKtWy1yprN4tCdW
         AiQA==
X-Gm-Message-State: AOJu0YzDbPebG1WEgZnB0NGgRK36C0/sYgOypAgDsu+i3IEj9eNTQt0y
	JvVKoTCs7xDYOhwlGNhVyKVZjCYjftvrzpqYphnanjPHyGCxp5QEdZH/1Q==
X-Gm-Gg: ASbGncspPwg1xAaCrWWUsgPMdPPhbMY0kxLdsBKoShXPiLobymoNahg58HOPiPY5Z1b
	qrvK9VhrCvy7B9kRAUJKg27UVwFRMVpzCcThS35L6DbT9DQjJMI1XVaE17wgwG1SWOuZ+75rOg4
	n2YUQVFvNwVzyGKKvMrjmcPRLKatOLIlOku7iTpYus+BVeTzUT2f24L8QMeeiE7QS5fgG+hAip4
	rxhuXkbZ4BgnmdJM3GhYIwMIVWRpLQ/4CVNDllQ6kA4OjSlkC5M1c5bQ8tNNyZXj1lxmFq7zbEr
	F1fK78g6ZT9py4c66CNsw9A1f+RUFBbngmPuKQmq3ZQGCno=
X-Google-Smtp-Source: AGHT+IG1XA/zqJak0IXeNdJllT1lhPNrdsJs5ADqQaZ21rvgCpoYkEPG8FXv/0nd5Sd6ZIBHM8Dg3Q==
X-Received: by 2002:a17:907:728d:b0:ac2:4b9:dff8 with SMTP id a640c23a62f3a-ac3b7d98db7mr823910066b.32.1742489729027;
        Thu, 20 Mar 2025 09:55:29 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5ebccf67591sm51499a12.3.2025.03.20.09.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 09:55:28 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jean-Pierre Geslin <jarsoper@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/2] cargo.bbclass: show PACKAGECONFIG_CONFARGS in bbnote
Date: Thu, 20 Mar 2025 17:55:16 +0100
Message-ID: <20250320165517.129442-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213417

From: Martin Jansa <martin.jansa@gmail.com>

* PACKAGECONFIG_CONFARGS was added in:
  https://git.openembedded.org/openembedded-core/commit/?id=16745b20452de60ae2474433cc1a2fb1ed9f6a64
  but it wasn't added in bbnote above which might lead to confusing errors like I got now:

  NOTE: cargo build -v --frozen --target aarch64-webos-linux-gnu --release --manifest-path=.../git//Cargo.toml
  error: unexpected argument '--cfg' found

  Usage: cargo build --verbose... --frozen --target [<TRIPLE>] --release --manifest-path <PATH>

  and was wondering where --cfg came from.

* it was from recipe where we already use:
  RUSTFLAGS:append = " ${PACKAGECONFIG_CONFARGS}"
  it will be difficult to use PACKAGECONFIG for RUSTFLAGS and prevent
  them to be used here for cargo as well, what about the recipes which
  need them to explicitly append them to CARGO_BUILD_FLAGS ?

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 461d100dd9..2dd28e95d3 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -47,7 +47,7 @@ oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
-	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
+	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} $@"
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 

