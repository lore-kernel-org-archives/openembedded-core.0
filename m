Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6C2C5AE59
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 03:07:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.7670.1749006447893020410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 20:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gvGQzg0w;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso4735556a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749006447; x=1749611247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25aJTwdsEqNLrJzVQfr1zUs0DbNm8TE4ph6ySJtYE7Y=;
        b=gvGQzg0wr293Tby+Ev4EgRCHwqneA7TwTRF7ko+hqHWPS1B+Czmnw6qt13Kx3sq55w
         B8oRGKAw7aZuinwsX5QIfFeMjHFavGJiwcO27/Ed8hF+MfXXOapVrxiif0FazihTTcmJ
         4In0svr4Ot0ED+9zaGvBf1uIJSY4Y1llJguifVe8SHp0QLz/PPtXLE1GRWUTfvP/ZvOD
         QDbqrFFUV0APhSwWjA81rfHukVqUbgPtENWvI/FQxd+Yd46qqFegmoqUg6jwcdxdrnuH
         /A20g5jqsVcUWk9f3OAPQvG5jfbBiON6mhYOkbcMrJXJoKHW2AO+cSLovtcgnC/XgFbY
         q/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749006447; x=1749611247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25aJTwdsEqNLrJzVQfr1zUs0DbNm8TE4ph6ySJtYE7Y=;
        b=aMXHOK7HM0aMs+TNGGJh/e12W3t53eH1IGXlB8C82+34NkfVp5dA9Hj6hJSLuBJ6eU
         4Bwn4GRmTckBy73A9knUkLPFwgVSPOW7b4jf9r9EAnG1L+JmjDx1qadTGkKEAM/4I3mS
         cdyDa5Qtx1LjUvHgoxVbbgVcpvuKy0pP1IuKVQ3PfasGoaqKGHn0H75O/ewp5pzqAF5t
         axwZn9UybaenHWrrArnkom//csT6fP8/9yecnYRx2wPETXDCDW8OXWjz0k5a3oOTl2AG
         g8zhWE3kEeiLM00/ldg4Z6dIca4p/RdJhXBGJb1aO4qqmw4iXsMRdYTXJSJT3ZDv3Gat
         K0RA==
X-Gm-Message-State: AOJu0YywoANrqyk8MPA7ieSX73EYynVx2BiN1+Iln1pOLrWmAgcCmSfe
	1vfvXFWxZI/7RO6oC2W1ELg7r8d65t/1fa4LwQbR1gV5DcWASxSoKAkNBatxJM/9
X-Gm-Gg: ASbGnctG3R+oRDKJJdJfB2I5hRRLjVRdPc+F72OI10WejPnsR5VYcnO4T4YZ+yIte3X
	YI4u/IT70Ofzp4Hp39ED9VOla5us/to+6dIcjfi0WyAmt3HuUH7ZU79FsRNzczVqSn8eBJS9rD/
	Ba986DbE6SMbcxqr8jirgI9LvYnv6JMdftlEzzMD6q3B+a8UCKyh4BpxhVi0UDpkrRvmvQ8I8aU
	yh7TYsK7xuwd7UzziL1PbT7EOvF/GpM7IWKKgvf2vtnWZSrNvrt+FQKNt3RHwWsWoicyajqYFrI
	tg1pqksnjFwIydXaMjGVIxi3KLYget+MW9h2YPbb5g==
X-Google-Smtp-Source: AGHT+IGW4S49SMcupeZ89vGTaAHLngJev7d/QkMqgatIRbLuT/iI6XDpYNZH32+l22jtLXZt2KuqyA==
X-Received: by 2002:a17:90b:17c9:b0:311:baba:bb91 with SMTP id 98e67ed59e1d1-3130ccbbf51mr2102793a91.10.1749006446859;
        Tue, 03 Jun 2025 20:07:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b544asm8743934a91.2.2025.06.03.20.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 20:07:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl-locale: Recommend musl-locale in every locale-base package
Date: Tue,  3 Jun 2025 20:07:23 -0700
Message-ID: <20250604030723.1509609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 03:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217834

musl-locale installs a profile fragment in /etc/profile.d/
which sets MUSL_LOCPATH in environment. This is required for locale
to work correctly. e.g.

root@qemux86-64:~# date
Wed Jun  4 03:06:25 UTC 2025
root@qemux86-64:~# LC_ALL=fr_FR.UTF-8 date
Mer Jun  4 03:06:29 UTC 2025

Works out of box now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-locales_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 1373c60daf4..2815e2ddf08 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -82,4 +82,21 @@ FILES:locale-base-ru-ru += "${datadir}/i18n/locales/musl/ru_RU.UTF-8"
 FILES:locale-base-sr-rs += "${datadir}/i18n/locales/musl/sr_RS.UTF-8"
 FILES:locale-base-sv-se += "${datadir}/i18n/locales/musl/sv_SE.UTF-8"
 
+RRECOMMENDS:locale-base-cs-cz += "${PN}"
+RRECOMMENDS:locale-base-de-ch += "${PN}"
+RRECOMMENDS:locale-base-de-de += "${PN}"
+RRECOMMENDS:locale-base-en-gb += "${PN}"
+RRECOMMENDS:locale-base-en-us += "${PN}"
+RRECOMMENDS:locale-base-es-es += "${PN}"
+RRECOMMENDS:locale-base-fi-fi += "${PN}"
+RRECOMMENDS:locale-base-fr-ca += "${PN}"
+RRECOMMENDS:locale-base-fr-fr += "${PN}"
+RRECOMMENDS:locale-base-it-it += "${PN}"
+RRECOMMENDS:locale-base-nb-no += "${PN}"
+RRECOMMENDS:locale-base-nl-nl += "${PN}"
+RRECOMMENDS:locale-base-pt-br += "${PN}"
+RRECOMMENDS:locale-base-ru-ru += "${PN}"
+RRECOMMENDS:locale-base-sr-sr += "${PN}"
+RRECOMMENDS:locale-base-sv-se += "${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

