Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C13C47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.23026.1706104901401304934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iJ4Iuvdz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6daa89a6452so3821612b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104900; x=1706709700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoP3m6ziCWKgFaRYsu7BNQVvJW5hArMPv+iWO1zlrJ8=;
        b=iJ4IuvdzXhXjW9qWhq/tPIPfBy48Jdl/f+unigokEizUeGkOQAL86g2U+B/8PUbTx/
         RDenB4C8gfRT6CX7Iauk8o51CV8KLz3YTxtzbrH7kRXTA28lQ0Fm/ShfU2GDnW7Fx71c
         AF+3O+yqcrJXB36OyzWx8DhPZF7WlfVvMrKT2NnV0zxbXyKYr0AkHOE/SHyc5LPl171y
         JeLIzL5Epq1huwbl75Wl0HR1eo1i7cwX4bet3vshqxDhfvpewUewniV5Yg5+9xbCzUqT
         FxAtkALh3OvvMPqG/n8ViftCLybIMNQM3t4uQoPmyqGlqalz8uuVF30RuGqGubr8+0h+
         XadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104900; x=1706709700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoP3m6ziCWKgFaRYsu7BNQVvJW5hArMPv+iWO1zlrJ8=;
        b=CV6midKQXFm5NiriANJ4Ryr6fe+X4TPMdCJdI7UijmIDXBRxmxdMkpIkfrON9WML6H
         i9YgZgw9XbsBsxU7icy5cDasOjC7a2vwjTUE9GObl3Ey1CJR9okAS3ax6HKc0PbitGxG
         g872BAqFmBJpIhSGGudGfoTAlCr/CpRNwu/x2zK1lVPisacJNWa4RK1W0oItkfohEmIP
         HBoLXi0xUTfKk3+Sm8KJQG0TcnJZQ43RJIHGKWIvFbwUF7uKCOyANZ1pJUuPxeMn4Xhc
         ZU2cE2VVEP4Zn9yY9Ccc/2fTm9V2IiYUnkjl6Xk4ze9rw3/VDHeKhnPRQ2rb80sY9loR
         LRnQ==
X-Gm-Message-State: AOJu0YxPo/29cByHSwrR7qy6nx/zlpdGey1IonNLmV7BMATGdxcrozAG
	2yz2GetQTEzEJEJkwhmPomoGI4cjIjpsviPWjGihowibVhanCBc1QxDRBJ1vUNwfjuZuhi0fB5Q
	zEj0=
X-Google-Smtp-Source: AGHT+IGPeDP7QcxnhgTMOqLhmlphqaAnNrLSHHVvScr4pSYWtOP0VC9Zu33KQCT8f2/9IfWLuJ+Utw==
X-Received: by 2002:a05:6a00:1146:b0:6db:605c:b9e4 with SMTP id b6-20020a056a00114600b006db605cb9e4mr5146695pfm.31.1706104900279;
        Wed, 24 Jan 2024 06:01:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/12] sudo: upgrade from 1.9.15p2 to 1.9.15p5
Date: Wed, 24 Jan 2024 04:01:11 -1000
Message-Id: <e2cb6c1b5e90822bf9e73f43f8bb30259d2b75f6.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194284

From: Chen Qi <Qi.Chen@windriver.com>

(cherry picked from OE-Core rev 4b2eccc0ee3f2906f9b04de194b9df6e24c2cdf4)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


