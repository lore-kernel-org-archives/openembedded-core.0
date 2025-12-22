Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F54E6916E
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87773.1766434075202722504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exUryk44;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so985541066b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434073; x=1767038873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUQxN2P8tiyj6juCh+9D6Zw6vprUEhGnYM8SlhoRdqo=;
        b=exUryk44GGUCmIQxHRxVua8QvCBUXwd352T9zqF642JIxzzsS0NYZm5Yt2qzKhM4HJ
         hcE8UDdwM6nhFaPonlcX5MauUU5YtvtYczKiPvixUyd6B7aOABI6jgxkgJ1hS51Ut2X1
         5RW2O+OaTv+QkzA6+suH5Jka25+voBWNlSkAmGkn4xuPmRswOMgZV2ZPCcQgLoa6w7Gp
         BpDxOPJADI3HSXue3YOVCie2CtWEvU+AfzRYkuFcy33ONuEJ4idKneyY5G+t/zj4B6Ib
         jPRFzJ9tONIVep46Nf8+592vTjzn8qkVRJ+s4f9uFEYYRsUR+a0KdFKi+eqSfmHxrYxA
         teEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434073; x=1767038873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pUQxN2P8tiyj6juCh+9D6Zw6vprUEhGnYM8SlhoRdqo=;
        b=py6I+hJUFgOwPHXHOc7W+b9BLobdYu9MaZC1Ln+ghaE5D6qxPRD06zmBrH9UxkruKl
         HQ1PoenuQPLjSfQg2xBkCEhCsLjR4P/4b1oK9gISAF5EiVn7qhcmlSyI11z+yRdV/EpU
         d7+KBycUf808WtdrKZM96fn9vB2lkJqcpxxdwhEZpSmZ5F7NobHU2w/sr5C2BIW7dwYY
         rEjvNgMR8IPjY7w4fkLjZ/MdID9l8KAevWE3RzgAob5IG+gj78iP4Nh0FNS+3rOm8F3z
         3SvDZM9CkBInhZBEUBdt+/wvNwOaahefxWgn7/R6jBF81JTRo+p9bQ2pgwSBQgyU6nuX
         rS8w==
X-Gm-Message-State: AOJu0YxBgRKsIEXxTPUvtoMNlDswaE0gBxEtMuv8jk9A6tMI0gjDCR2j
	Gs5bbDrv/gKI5LCwkCdVXiG2EG/2QXPMi1W2o4lln6k9FgoAqu29bxjMunwSsw==
X-Gm-Gg: AY/fxX49Fiu12NlwhqQCl5kfuNhiwAi/hPf4/7Acy0+NZ7qSjh0ruD9nSkCaSfhJZIP
	ARIhBAUqItWXv5yhgVDdOAb+HSXjAER8LnBRdrASr72GPT1slTCm6oSh6WBro+cKzIjdFKyQeiT
	CQ0mtqcJ/tnjL4pV65ilVqSPBihOhwXKi/hG4i30/PuyfrP1NL1xUl1zQltCM1F4ImNpSVPEq+z
	MdC1Pa7KcYE3kwAzhITbTCh0gpYTyypzqcINcvulOFj7VH9FMQ7ey7ol+VthqjFva67aGadt+3/
	cKQQS+62Otc6mP+QDjeYEqVRyvLjk4gBlcpoXgwUm7GyLQ/utO+9zkTG/tHWwlnF7yasiYTIiHN
	W/bDtAw+shR8uM53H+JRolbmoPATBz1uqBKYbHkWCxs1SUpQZyyIZOhMsyktDqNA7avb5WlKyYu
	bQs/t1Ytjb1eeR9DW11hLYyIiyi22VJirp1a0oA5YsrCJakbk=
X-Google-Smtp-Source: AGHT+IHbMGaqGEMJavxmCNS97aeSiD0b/3jfdEJhqX8LowZ6FGkBhpoU0pfbiB6gDLyswYE3cT5HcQ==
X-Received: by 2002:a17:907:968d:b0:b73:9a71:13bb with SMTP id a640c23a62f3a-b80371533d5mr1431304566b.32.1766434073364;
        Mon, 22 Dec 2025 12:07:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 012/114] ell: upgrade 0.80 -> 0.81
Date: Mon, 22 Dec 2025 21:05:54 +0100
Message-ID: <20251222200739.2278706-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228337

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.80.bb b/meta/recipes-core/ell/ell_0.81.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.80.bb
rename to meta/recipes-core/ell/ell_0.81.bb
index 90474dadae..f9b702531a 100644
--- a/meta/recipes-core/ell/ell_0.80.bb
+++ b/meta/recipes-core/ell/ell_0.81.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"
+SRC_URI[sha256sum] = "672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14"
-- 
2.47.3


