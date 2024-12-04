Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E26E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8163.1733294994185416138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eOuFncRQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385deda28b3so3109231f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294992; x=1733899792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98y6NtjSEHrpd1OBDNw40zsXQQ47ywIMdt1gxrMwNrQ=;
        b=eOuFncRQcTkpMBSnIepHT64TsxvIpFrCDk5MJJ6aOWMq/a9rixHC5IhbKqSbpjSxn4
         8muqAb3APcGxmTIFDV0qItURb85dY4a1+sZuXKwsvuFmd8qYJCnBvvfPX2YIE2wwW9a0
         gScutTumnJMeyjHNMrjxLebVe62gLkW0AJ6MM66QuR2Y6yttupCQsQEHJc5lR+v8m+RL
         F/YRf1VWFQ1dMXV0NN26e2IEg8Cz1zmEcl7k+sGmtvXa22aeKoY4/qajcTxRTS68TxEf
         G/naOnJPW1ztl35+kbIHVBzQEckg9FO4uuw3tjQp3oldwxFgCUSrwRgOlmpteOISYON3
         wsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294992; x=1733899792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98y6NtjSEHrpd1OBDNw40zsXQQ47ywIMdt1gxrMwNrQ=;
        b=FONgmSvcAIC4wvnCPLEGwEf9L03QJqcZh4rjfA7dqFzqngMPuCvOJQ7OQ5FKLaKJR5
         YQESFoApdDKPQELb4uYVymVk9gqoGdmDUt0vde9mzPNF1pd1V8MWiSRXiPw8mIjuaVyY
         xpvNGtKJ4Ce8B9P7lPf69SuyEbxTm0yW/UJoxXgGYvJGn0vSGX61KGlijckJHc52LHRa
         L/H2j8qSAcWOpOADeO6UuN2Vl0FpcP0yAv4ZMaqQM6idNADIWcLGkT5rgc8yMpvZAZa1
         w3QT6MpJ06GPrkVu08coW3FIh55YDcZY1tH4uRZQpO3jIQtmdew4KbRspRFnYqlgeSoi
         0p8A==
X-Gm-Message-State: AOJu0Yzoqpd9rZOvzETBfGMv0klP0bml9i2Oep/M9UCe1pmEAnvC09me
	88ZQoa1P+w3vc+D75TQbPpucuPHCfRcbrLGKWuDdG+YUZuJFBaPT10IAig==
X-Gm-Gg: ASbGncsn67Mdxp9LgPZMoAoMr4mEjr95cT6TeUf+r6YoQj39IQAf6lShmYxnx2yL2lP
	R3kghCJdmf77wg7AiboqgTQ/FDePoaYjAtQSkrMGqu1V6rp97MQLiKdZKCi2LEPKhGjaiWeDaMT
	8UCYvkRgj5hHnUAsjgTf+ifISo8/DZX4sms0d6RUQe7y33/Bd8NlYUqYP+d5TDmcAdbGjQJqyfu
	KQ8o78zNAtFHCavmqFrHVwupKPpopj42m6XV/yA/73mXFn6BOKWBdy3YuMOiQKQ0JZmRweR8B2a
	Qo/aEUnoFqk=
X-Google-Smtp-Source: AGHT+IGERSfwDe56aZ8Mi2t9+LSf1MFn1++7VRUWJ0E30V14vG0v9g0gT8MV5f1JwwszGL3UOWAc8A==
X-Received: by 2002:a05:6000:2aa:b0:385:f349:fffb with SMTP id ffacd0b85a97d-385fd42a35fmr4242206f8f.45.1733294992549;
        Tue, 03 Dec 2024 22:49:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/37] utfcpp: update 4.0.5 -> 4.0.6
Date: Wed,  4 Dec 2024 07:49:06 +0100
Message-Id: <20241204064920.817016-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208251

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-support/utfcpp/{utfcpp_4.0.5.bb => utfcpp_4.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.5.bb => utfcpp_4.0.6.bb} (89%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
similarity index 89%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.5.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
index 5ac6fd369ae..21f1879c4fb 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 
 SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
 
-SRCREV = "6be08bbea14ffa0a5c594257fb6285a054395cd7"
+SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


