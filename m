Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94CFFF6E72
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86046.1773779366930695313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HkpRb+kT;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so2159720a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779365; x=1774384165; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpL3PvOqNge6/0QBSs6ccdGqgW0U61BJq9ErIVqcoGk=;
        b=HkpRb+kT6F8h1egZcZcdXx6WAoPr3aAzwCWkezLcKrMbDuBf/3cHExjkX30W8rRsPR
         eON+tcseIfAO5lV4QpbeL+baC8s306p1VNBi7LnwQS93EaARE7U3X00FKchQsNz3+Nbj
         /4V9mur6UG+WiU+K4moi7cjw8y/yqMAIdGhW1dV7J05U0fDBINKk79zPdvOYWV0IR2/o
         f4Z5IKe6iHCECN5Io2711OUbTRWD2a2KTr0iHIOguFSwpCJ7SnZiX1uZ89mfWleLHy3q
         piccrD82i0BL22Rpx+JLg3HhB9IpDgvr8RHJJ3YgSqW78Mf3Zn0uXwsu8mZh584qs7qy
         K3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779365; x=1774384165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HpL3PvOqNge6/0QBSs6ccdGqgW0U61BJq9ErIVqcoGk=;
        b=BJH8xFkldyDKNS9bApJb6wBW6iY8Hh/6y1PlcljAzmmSzYZ5P8CmuZyi96wLvMuvzM
         EbtUnSvFnjVsfHfWbePwe8MUV7O8Dl3mb9gGF0JHVkUissEUmXDAUs5Ijgrhadjnd60i
         goaqhi9i8fDU2nweJSmnD5Qjh4IfrmpRUtwCxDn03WlUmJdM0jY/JSJ25Im6xzyLPqNJ
         sST0H5+kHVEtbl3tan5tiRhzKSQfva68lr/Zr3GRZyJJdVqc8Mqx6AsOziEftQPSmZLW
         VJrdY7qqkdO2n8W0mxYs8LJJs1/BUS5uOagFvS2U1m8FJgIvmf8fpq7Fw851TilRvFBZ
         3E5g==
X-Gm-Message-State: AOJu0YwzvazaMMO3d8wAlyp4YShft8+ip6YqAHZvVAJ/j3noPQafp9HA
	gFFAFTDnlOyfEU8eoxtRq98X5ph2StueA3ffnevDMl/MiZG1T2St/4yXpd1kEg==
X-Gm-Gg: ATEYQzwpAN8zx2+6wz65bX42NvM8h2wABKBHtulMJq9gni5dZH2hMdi2aBdHbniu7Pu
	++VJ+tz5bG4r8tum+BLIVlnLJA2+mKwfargh2Mgr8pMTJycNKEnnJrp4hHOfiOZzX9up8CmvA9n
	Jx/hPqOADci1KrJTZdfy8s4pV0iytJRi6s4PQX//7jR+Xh5jGcjBtcd+qheQ0UmyOhmZHynwnV7
	IMBd5YdPJJAuMZyeyN6nHtCCSDCrPJ9uSwHssuNft478v+0Rk+HKky8CqBfaFM2/yDvqeTboC0t
	L1P+ncTRvW4fG1dcL2eBwINTCaDB9GOLZMJZC50w358piC5QlLkZc9Sn7LLRdO4+p/RZfpHgPoK
	RtX7EzQKbphrLIEDuJ5mfON4oKYvJ/5H7+HW5YGzX30I7pKjPtpPIvT+7N01kiaN6ElVjAKct13
	+q923M+jWSK41Qk6pLS0ToeAro2QIaoosXbKJYLu5fyLJTe1MaEfwzAbrkUM6L4L4=
X-Received: by 2002:a05:6402:5203:b0:65b:a2b5:5320 with SMTP id 4fb4d7f45d1cf-667b2c0bf49mr635284a12.26.1773779365174;
        Tue, 17 Mar 2026 13:29:25 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:24 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:10 +0100
Subject: [PATCH v3 11/13] qemu: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-11-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233346

While in this case `RDEPENDS:${PN}-common:class-target +=` wouldn't
result in any unwanted override, there is no guarantee there won't be a
change, which would be hidden by this override. To avoid any surprises
in the future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_10.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
index 5d544d8d13..1abc035a47 100644
--- a/meta/recipes-devtools/qemu/qemu_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl = " libucontext"
 CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 LDFLAGS:append:toolchain-clang:x86 = " -latomic"
 
-RDEPENDS:${PN}-common:class-target += "bash"
+RDEPENDS:${PN}-common:append:class-target = " bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"

-- 
2.53.0


