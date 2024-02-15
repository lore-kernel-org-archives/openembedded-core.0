Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F161C48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.18130.1708013914615357329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gLW4RSrz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d70b0e521eso8309775ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013914; x=1708618714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+ytji5JAhKAjL8rE+ej4yrdyRzmUZ4bj5SmxjQ8yic=;
        b=gLW4RSrz51gP07Hgk6G8BFqNpZ+d/j8xdutYMLtNcRVE68pRXgzIj/6ExiFzeAwIeM
         YMpa5BMnij+dUXUj192CYP133bS1U6MFh/gvl4L/6WT6beMbmF+lEWuzlG5yW4S/J2XC
         yvUiX9s/2K1vjDPvPCpua+nkEWT1SPApG71YmR1vzVW8BUzc3lyD6fIaHm7sNbArnpVs
         awg+HHqRDtTCU+jcOf3XTKEvp+2oO9J+Tk+Hmil+/psFB3SqylsI7otnZFbPJ4oC+6mM
         U/+6REEZsXTQhf/uYgSwFxPbGhbmvKqS+LaUPW81lvBR+8nlNa7+wMt8aPF5xwxm1OLr
         78nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013914; x=1708618714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+ytji5JAhKAjL8rE+ej4yrdyRzmUZ4bj5SmxjQ8yic=;
        b=Hm0HfYsCc5wvxePtojPKzDaHEOgmCBXVjb9OYpuXBHpPaV7lNhQQYB3YSeeMTdqQnG
         aYFWhOmcyJlG+GGlVfVx7rpNIA8NgKyHr1LCJ4X1uZa8hFmsBDd6Qrq/CCGg6pXG8Sed
         SywMCpWfcPrcs/XztuvO0J4J3CIGhP386ZejQfpcLlSaU+YRhmsP82O0tEXH3irgE+Zf
         PdoSRWRDruh5hr40Ck/Q6+D6rzAPw51GJx76MxnXvXqNFwe9bi7knuPqaQmeynaB2XMT
         jJozCKavxu7sOrEFLrykM73yUJKiy8sLeToD0B2yzbfiAk9oyIJ6qpErpm0HyT2LVrtp
         L6Aw==
X-Gm-Message-State: AOJu0Yy069Bxf9rinuX7YL8HIgKsNRGkoW/pesnXpfkw45HQDagqJY18
	W40VR4/gyq5I2c35itC34ZmPjqtkI2fwBIqQoDKJq1FxTZHvCI7JtyfE5yalXQaA08vTYA5WHiU
	EVOc=
X-Google-Smtp-Source: AGHT+IEykFay9CQqq7fKnKxeN2nGx9BIpUBwGHsYGiS6otAVuxx41pTnYa7cwHrej6t80SRML0qYAg==
X-Received: by 2002:a17:903:32d0:b0:1d9:ec0e:2db2 with SMTP id i16-20020a17090332d000b001d9ec0e2db2mr1897631plr.3.1708013913945;
        Thu, 15 Feb 2024 08:18:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/21] at-spi2-core: upgrade 2.50.0 -> 2.50.1
Date: Thu, 15 Feb 2024 06:17:55 -1000
Message-Id: <e742e3bdfbcb7cbbc7c4a3e26151b5ee3aa291e2.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195532

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 atk-adaptor: Fix critical when no table cell array is returned.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bed9f07aea6c425748c8908641ce8a99fd5162f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../atk/{at-spi2-core_2.50.0.bb => at-spi2-core_2.50.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.50.0.bb => at-spi2-core_2.50.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.50.0.bb b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.50.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.50.1.bb
index 57958fb7f5..6996ebebcd 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.50.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc"
+SRC_URI[sha256sum] = "5727b5c0687ac57ba8040e79bd6731b714a36b8fcf32190f236b8fb3698789e7"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


