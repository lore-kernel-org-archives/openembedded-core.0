Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF57BC0218E
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:42:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.12346.1737819761405975074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7QsnUwL;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso19554315e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819759; x=1738424559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll5BCb3VAFBxrHo3wFvR5xTxZH0WdvyIGf8kNeUNopc=;
        b=N7QsnUwLVkPJFaAUYIBeFcMOOzytuCw0c1rvud/PTa1Qu+knc641UU7SLJuRSpweTJ
         xNGFAKj/bQPyuuU9qby4lqxwbqe9IoDKw1JvhjNe8Mu7qBqNkxy03Ua8rzDJkul9YTdM
         dLsylPrmVVkqN62p6K2QAncUcxc91QqyMbPkW4Ui+lRaU6q5eULuGm56lsWGyIctZwaO
         yXhhsclwsOk+UE0Qqu6Mly5ph9jwD3/sZJ5Io5otoKdIO2i9tus8I10EvYyQvf0pUdmS
         XUHDevetRYlHigRDGeEKGNC7HAIyM+eFwV+UZxEb4/l1tJaex1SDLuPhMFu0kw4bGxpj
         7xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819759; x=1738424559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll5BCb3VAFBxrHo3wFvR5xTxZH0WdvyIGf8kNeUNopc=;
        b=dMqL3JrlI2mk6wKnqZq22CEK1sP7uzf+SVFgi4NLnxe8UFMgcz/05WhdTA4J3YGly/
         ADgbeYQ9FHx/QV/JknqfcU2yIBSvT3uXz0ISUE7Tce1ti7G4QAmPVH8GlIjP3+JcDM6n
         P+nvnCB4fZ85T94Vk/Vks1Bw5etydNKmFrpSaG5QpP3XesVuov4uvdRnytU3/BmxQyRE
         kFFew05LNW7DGI33qa9l/0htHbHI27l+rrzLRNI0UD+ViRfMWk0SKJQI0OPCy6k/GhtE
         fbpfcdbY/PKNj+E7ajU2ILpsTyki73qrfC4R4fncWXjpWyw5DQLss2Y2F602UHLKVNKV
         s8Yw==
X-Gm-Message-State: AOJu0YzN8Ztvhjo3u+D8ByA6iKUS6RTcrVn/M47ZbC4wBx5jBUEiq6H8
	8QkfQCxwaopjWhfo79qjs49hhTfFoHoDvfSjWwmYydCoaJpsquh5fcSLmg==
X-Gm-Gg: ASbGncvKYq3XfFBz8mbII6KvY1Gk0g5l3zBW1acollLwNwx5NHDt8n9khPomzpXrmuJ
	OmEbD9PzLhp9PatR4Z91ryRlTwcO7HAY6tUFijs4AMQejUJqBHXQvFFpEXOsK7qVZZQ38rA9r0k
	/p8xK0dg02GjeTMxwiT2xOJHoUcEQDDMzUi0I2O8oYvfLbqFaz0DXuryk88HJToZfplL2MUfXmn
	PGlUJusCXP1VrtdZt3f3zFnSWJX+vr94RlVjnSletwCMrK0Q4LfHxXyLHcSaM0NHR0QaO5Xw9CS
	ZCazowpFHAlC2wdllqVIFmF6Zfg2Ug==
X-Google-Smtp-Source: AGHT+IFe/GhCrL+g9btzsXMOzrfjPosgIGRKzb9xSO5At6oQI8wylOqO7EEIcWL1hseIjueEEHcupg==
X-Received: by 2002:a05:600c:4e07:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-438913bec32mr309936365e9.4.1737819759405;
        Sat, 25 Jan 2025 07:42:39 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4c6fadsm64063345e9.32.2025.01.25.07.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:42:38 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [styhead][PATCH 0/3] Cherry pick commits from master to sync styhead's gnupg recipe.
Date: Sat, 25 Jan 2025 15:42:12 +0000
Message-ID: <20250125154215.3316474-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210265


Guðni Már Gilbert (1):
  gnupg: remove obsolete patch

Wang Mingyu (1):
  gnupg: upgrade 2.5.1 -> 2.5.2

hongxu (1):
  gnupg: upgrade 2.5.0 -> 2.5.1

 ...erride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 .../0001-fix-compile-failure-with-musl.patch  | 36 -------------------
 ...use-pkgconfig-instead-of-npth-config.patch |  2 +-
 ...h-fix-find-version-for-beta-checking.patch |  2 +-
 .../gnupg/gnupg/relocate.patch                | 18 +++++-----
 .../gnupg/{gnupg_2.5.0.bb => gnupg_2.5.2.bb}  | 15 ++------
 7 files changed, 18 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.0.bb => gnupg_2.5.2.bb} (85%)

-- 
2.43.0


