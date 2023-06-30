Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB34C0015E
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3848.1688092168219910554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HaCsOhEk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666eef03ebdso880559b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092167; x=1690684167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjowsV/GvbiRthp6+t6obPA8fNZBJkNVpkJnLG+Y2Yk=;
        b=HaCsOhEki7tWxiOM9CIiS5LkL/HtJwtPFwW3jFTM1hsI05nssMNglcRkHhxzqb/4Kt
         lXZTGVuGRRsDqrHLfoGuQMUX5cn897ji5Z/rbQ6SicSBBkrG+/BvUar+u22Ujn3Be+Hw
         E1NWkI17yHbBPd1SN70q0u0vKT4N02aGM1Zzl+Bh2cZKVXiw6Udm1fV1EScKPJCF08ue
         auHLLis1SwIXuFXOOC/KBl44ukvajk33teY+c82PaJh9Q8Aq7gXUAtL74gtDv1v9U+jy
         hcbmgVWkmhBcoDq4HifrX2qoVqXR4rp0nM5O+2v9sDuDdZ8y/1+RO7m49bw3mkGIQPyE
         RYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092167; x=1690684167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjowsV/GvbiRthp6+t6obPA8fNZBJkNVpkJnLG+Y2Yk=;
        b=GXUwfhP+NOPhzJxmUbh2STkLjn7hOOhSsBgTQBQ6wG9TQ71qjXMizaoPicStiaAf7d
         XJJyojATMujwj+hwpHgwS8/Eqw0n/nUONhR0nNtzruTHabhJaglt8l9f5w1FWD+KV1iz
         3SokPY28JCflzagRe9sNrrw9MMIeQr3suwrRILKpZF93Im7StDBesKhuW12ejgaTb1Et
         AioN4n1+MXAEtvKQCLzjSWuzh/srwSCvgWNGbvd6wBNwN26ec+pXZAPUj1zdabKBgdT6
         8VAdhx2CCxwTcvSZwqKLhnABKaxzOqtj4tjIJJhoZqV+7cgcFfX7EBq5HK0JBehfQoSM
         gE8A==
X-Gm-Message-State: ABy/qLbA7iac2bzZ3q9zaPXHkEqeHgkA4oHx/Yp6Jo3uaCwVOTbtxx3b
	GsY3LrjJErirWVcitxKFOJl8vM4B3HDGbxJBiWhtow==
X-Google-Smtp-Source: APBJJlHCuBeweHDzPv/Vao9HAf204rZeuXfE18u22VEfzRnr3KL6YIGl7+7c4IzuoCVOhNYXjW0hGw==
X-Received: by 2002:a05:6a00:1791:b0:681:d5c4:4973 with SMTP id s17-20020a056a00179100b00681d5c44973mr2145207pfg.22.1688092167361;
        Thu, 29 Jun 2023 19:29:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/30] weston-init: add weston user to the render group
Date: Thu, 29 Jun 2023 16:28:45 -1000
Message-Id: <814ee7ad4f54f5a17e0822f06059a2fe95bebfc4.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183649

From: Randolph Sapp <rs@ti.com>

The weston user must be in the render group in order to access render
device nodes for standard user-space graphics.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1cba8aa3c5e0635d7b89222d9ccaf889954fe0c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 2b32bc4a08..82dd9a47f0 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -92,6 +92,6 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.34.1


