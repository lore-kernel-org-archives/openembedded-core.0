Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA6C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 11:49:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8337.1715255333742297816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 04:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DhpjxO0q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b7a26326eso5659655e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715255332; x=1715860132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=17xfJiFCwY8QFVBMj81lDq/N/u+zm+bZRWgvJxPcz/8=;
        b=DhpjxO0qn9FcTTS4F+7MgzFcc0Wh+AHp3jMPVdjM7JSRtZOWBKPoEl3GBGXlaSncmA
         4cJCkcOZjFrEwfzwlsiAmmOYYKwb1j+7ZmpkELnIhGFkLX8o2/A1h59yHZlmVZrvZM4W
         UlNjIPmPBHLiMv21zOJGaAntEPXlH/itMz2bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715255332; x=1715860132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17xfJiFCwY8QFVBMj81lDq/N/u+zm+bZRWgvJxPcz/8=;
        b=afyytIPkRt2pDJUq8cUW9a0TbARMaq2Qf+Jkup7HI6NTVNYjUnr4yAWvD9EDn2g1u3
         hPGQLesS2dOQ1HMmVhjVcDXB9jPXhGg0ab9mhHvIQeOWsrwQG7X3O8oUFL41ykKAKiz+
         alNqpXZ5AZqMFU14LUL9wZ6Xhj5rPV+IfiYEkMITwNxC6kei1neH+VN8MtY8E87t5qda
         8QSS4PhPF+xKHcUy4XTpEcpJDL0xhTjg/NdQ0fZHqa5Je1seKTfVM7y9NuEhXzlnVeS4
         y9Uic/fkdxDjB8By7rKvp/2A8TKP0CVG/iD9HtlzJu6B1YScO2qZJvxEw10slf9JvKDy
         ez2A==
X-Gm-Message-State: AOJu0Yx4Nvfv+SFSGnhFzw0nVyAEKkq/R/gYYwycl1aCEJSXPlY2qCxj
	IkYB32Do6eIiL+2MVYrRklxuufDC/TuR/jOkWhQNkrHrRjRbOHmYTA55fi/bgB22g7FYOovULV5
	MAuk=
X-Google-Smtp-Source: AGHT+IH2NuVombFXcmiMFk7AE1ODeaquRlXkVw/oeizzNl3iPDf5mYOMj2oK4PjnHrKdHRYsmne8kw==
X-Received: by 2002:a05:600c:450c:b0:418:fb6f:5f59 with SMTP id 5b1f17b1804b1-41f71cc25a8mr44264205e9.2.1715255331569;
        Thu, 09 May 2024 04:48:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a95b:1bc1:5128:ffbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896a89sm1486085f8f.31.2024.05.09.04.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 04:48:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ssh-pregen-hostkeys: Limit to qemu machines by default
Date: Thu,  9 May 2024 12:48:50 +0100
Message-Id: <20240509114850.3922334-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 11:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199145

There are potential security issues from using pre-generated host keys. We made
the recipe available for autobuilder testing purposes but concerns remain about
how easily this could end up in production.

I thought we'd already done this, but limit the recipe to qemu* machines,
which means any real hardware trying to use it will need to be a bit more
explicit about it and specifically enable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index ede18a00317..4a62ddacd5f 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+COMPATIBLE_MACHINE = "^qemu.*$"
+
 do_install () {
 	install -d ${D}${sysconfdir}/dropbear
 	install ${UNPACKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdir}/dropbear/
@@ -16,4 +18,4 @@ do_install () {
 	install ${UNPACKDIR}/openssh/* ${D}${sysconfdir}/ssh/
 	chmod 0600 ${D}${sysconfdir}/ssh/*
 	chmod 0644 ${D}${sysconfdir}/ssh/*.pub
-}
\ No newline at end of file
+}
-- 
2.40.1


