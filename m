Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596F2CD13DE
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.27412.1694943553559933828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rn7sFUDE;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52a4737a08fso4178493a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943552; x=1695548352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj8aSFgsMwq5FCqB8fDWKaW/Xd1yr3A7voiVOYAk/RI=;
        b=Rn7sFUDEK3/Gn1xe6ExUuAfQUzSGl6fdUnHD/dHjxQL2qSR7Nkxe0RTlX4TG4WHvCf
         exrNEujHYmsbAKD/S9lx0O+2vPaGyiFhMW89+2/5Y3KN1ZfIuaFn+z2sjkMRprqG/HBJ
         3YWoBYWUxi4lc/hz5v1paVL33ekMoG/Wz63cXrQ/fMrBJOrn1VJNg6y7z4UwVtJSWrY2
         4+yyRmzcyRSYafGXXpC1bWfpFfWJMfv0CGiunJrsZhfHcc9HMAOoZJWBgkMpeKCQeA2k
         imWVmKaNUYHIyK2giwgDLUqO9tNP2S4LFo6lD70UZmF5+ph92t1tjE0S/nlyZSq66Tng
         skcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943552; x=1695548352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vj8aSFgsMwq5FCqB8fDWKaW/Xd1yr3A7voiVOYAk/RI=;
        b=tnMU8t+onZFSGJBcCW4+2J5aSu2yB1NyjCrQGJy3yXmGUMrE4ccQT99ZypE3s1KoB2
         qMx5y7zCLbrGRHoQM4B9jJjcppi4f666Fbp5dMbHYLASnyUD0VFwgenDq8JMtt3S9okJ
         lgQLL8+h9lUfpAZZqJLv4ScfixzWEIuG95ILfA5dPfebo0ULpneq7Bdogat9gMxKc6+b
         4+q7Vzy0lr25TIEbo2nSls5doGXdzMS+hIP9gGoDv7vyEsLbKGeZdrhIinc2krmkvBJf
         nJNtQNG3a35LBh3Vu9ogP1wt2R1gPqBYeTZVtVLBxgXj0x/WuIHLHzbGZad4aiAAfzie
         g7mw==
X-Gm-Message-State: AOJu0YzE6sY1bCsRDcSFB2iep47ljLbiJh9LUBhRqsKKpxeBg6J4A1gG
	z4u+qh3AWpTNhzFatL8Ytny2YYZwfnE=
X-Google-Smtp-Source: AGHT+IHBD7l6nnAOqQTdc3KylvYALgjYxMNfB3FHdFwMcRMqPQW89osfiKUwkuj0qE24DO8CNn0rGg==
X-Received: by 2002:a17:906:2921:b0:9a5:8eab:49da with SMTP id v1-20020a170906292100b009a58eab49damr5573687ejd.19.1694943551853;
        Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/29] openssl: ensure all ptest fails are caught
Date: Sun, 17 Sep 2023 11:38:44 +0200
Message-Id: <20230917093901.428214-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187785

Piping results through sed may mask failures that sed isn't catching.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 10c9b49e4ad..c89ec5afa1b 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-HARNESS_JOBS=4 perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+{ HARNESS_JOBS=4 perl ./test/run_tests.pl $* || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
-- 
2.30.2


