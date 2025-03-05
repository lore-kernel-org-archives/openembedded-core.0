Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1150C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6427.1741212710475163223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NW+ODfx6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2235908a30aso137276415ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212710; x=1741817510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOs1upxweooqO71rb2FBnkDCKGISmF6bpjgnR4/WHjU=;
        b=NW+ODfx6RB0ewanOWk5SBG0Yg931qAAnhWipD65JucTyKX0fprVE7O2IqmmOiiQ50X
         yVa5F9pcdwYohQEt9IXZPIVSbSiwvofS7tvE5AKmeRftGXQqH/lDfcjeX061FRB+wIb5
         O9woroWwXgvfH7ClSpDSgEk3X9TAzQ5Efev0KOjPBnf6wK4NYeTsSlFqUGxhX30T85v+
         rnKVRG/wV4UH/7qQ1IgNPB3oY0vQwqlNNDVX1Yhr2DzCyk+adk/sWZd20ASLuz3fP2w8
         OuaOjpwmFmbNXXyZn6FXZnk368zkBzOfTsyKEQNdIMQdHPtpOOci9mt/W61XDfORCRka
         MarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212710; x=1741817510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOs1upxweooqO71rb2FBnkDCKGISmF6bpjgnR4/WHjU=;
        b=Iwhy7pG/TtRTJeSjHCFRHKrbrmBYpV125Rz1tRYq3bx1CLt/Yx1pxtwsMQVgY2USG7
         j8bqdObyk5E1j5+XCU/0gWmprD6GrK4E/mFvXB+mTxZmk+01TEXfYzrm+uXFKknbvYsO
         D+Cge+9kwWFAXiQfFXW7molXEBIoEGHb9/EVpdN0Pd5t4YUBKPSxeCQ+z+LRiUoA3fsb
         apuXXjFymLjIraNCjCb1JM/cKaUY9zd9ktcvGUVyUsG0UZ7tdc8kxem5OOe91+irGVKU
         L1PWHmHRdJEt2H5zDVXUmIfJb+jfsosreATTgxYNfpsXeSzkywM4m7fcbZSD8cJi2HC3
         91Uw==
X-Gm-Message-State: AOJu0Yy6bEQF19cWRAdcJXufBvfu09zo6eu0EdM4ByCl6LPBPeLp2h3t
	0gM0E6O6Nm7f+74hS1ALAeuS1K6IHXsZDvwx4sJIe514nE5DjLB4p/niH46iRr+IozD5Trq0eQe
	7
X-Gm-Gg: ASbGncsxaLB7H5NYsdAgettMa//Q4f7M0EPEg8oQm7OUVW2gdYjFkX1Pfynq3rLeWyT
	Ig4m8Hz+GeVgUWXlujRBfm6lQipwv0GXtfoW8ycZJTf12+nNVaSdctvkPiGOlOOjz89BDqnL3VX
	pqnFOMAnijQHqzZRU2G6bJmbAonK1ZJdopqkQ4sG0k5QYqCNh7QEk/iLjVnANHpS13hqnTowCzK
	32I05TlhipLvcdVZ1AsQPkWdFFldCfYAD7SMmBu49X7HreP+PCktKvzBzZg6SWJpIUgj4iDfM5z
	tlRj6oYwtrG6fjwW5X5b+0vZYMZFDJUU+lY=
X-Google-Smtp-Source: AGHT+IHIm8t4AsruD+2wgn5WNUTEl7pmoPGA+bKPDi1hGgOtbXz9/33YdOcY+V2cQOu5ff8CP7eINg==
X-Received: by 2002:a05:6a00:188b:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-73682beb998mr6152547b3a.11.1741212709711;
        Wed, 05 Mar 2025 14:11:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled
Date: Wed,  5 Mar 2025 14:11:15 -0800
Message-ID: <5bf46aececa6c9175e7a98beca0e3848200f80cb.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212366

From: Alexis Cellier <alexis.cellier@smile.fr>

The libpcre2 is now dlopen'ed, so it is not automatically added to the
RDEPENDS anymore. Add it to the RRECOMMENDS list (and not RDEPENDS as
systemd tags the library as "suggested").

This issue is not on master, the systemd v257 recipe uses a tool that
systemd provides to get this kind of dependencies. But this cannot be
backported to scarthgap as systemd v255 does not have this tool yet.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-core/systemd/systemd_255.17.bb
index 8f5170929f..f85ad61080 100644
--- a/meta/recipes-core/systemd/systemd_255.17.bb
+++ b/meta/recipes-core/systemd/systemd_255.17.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2,,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this option and
 # using dbus-broker will allow networkd to be authorized to change the
-- 
2.43.0


