Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2663BE7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:15:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.78560.1733663749155972890
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f9fH/Lqy;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434f7f6179aso774145e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663747; x=1734268547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0Hf3rJ1P06Vm5kqG6mv/vxe09fWWobHP8ZcOju95wk=;
        b=f9fH/Lqy+nvg9U06NiWWfBZyH1aJZjeBMo1EqJr8pba5O/YdesmYVeMVxAo9UDV0YD
         1v48f9uxuObMZKFLmIeAx2jRn/cMtIK5hMK4ZBM+Dj1XJImYK5cwS+iiVf+s6JdX1Y9s
         kdzFrBuvWy5JuuAtc/Nt/Fb9IU+i/VGJJkEitZb5H0s2s4Co798F7TsGOWmfpYI0ddQ5
         bDufUFpSctQkOt4eVEgXS7oC8+1bo532ZL7Wb1CoTZpSMdzXz8oqReDj8b4NSMhSZQLP
         R/6pUCR2wHKusLcWPV+IvKEv7HQ3yp5zvTv2J5co2VS8h7lu9R2j1EoZ3bygByFVEHNf
         2ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663747; x=1734268547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0Hf3rJ1P06Vm5kqG6mv/vxe09fWWobHP8ZcOju95wk=;
        b=tjxn+phrI8d6DczmZxcWMaWDv3Cb0YLdERSZZYH4GH6Fe582vNc6qui2LmyD2JMJBX
         NZAJg+TPJi6vWuFi5QtChSJDkK4iol1YIKbDaLzLaVXEtn+QN4ECcyS/JqlSnSWqFyjM
         XFDtuLVB1ENRueWUKYERzum/DkI9GSzWmpvs7EhApv27FGl9nHQOg/eGRHqkr3opp0Xc
         HjIgjOMOqEaobZdv0GwtU5eBwNwL6kkm6/1Qy9NOyat/M0fwS1IHSS8wsKoiB/SP3Ghy
         q2+61Xf1IWIzTZk9UrYKahVZOqr0eG+jYFyKFYP820zKvlqo0kvOeXNpKeYAgJlkkWFO
         XOdg==
X-Gm-Message-State: AOJu0Ywlpoqakx1aXM2GncnPcVXB7tloH1QB1+kRGfk/1Qe6QSD7CBDw
	OnOJaSKU0dIZh+KPMfUp4xw/ufTRbsFLZ2DdQkU68yExli3QaNw6V+i2q2Az
X-Gm-Gg: ASbGncvkKPNodkjQPwrrwLPqVx4MrSL4IfmyI2lwkd2aDXDSmgVrY5WRVKJcM14TZp6
	n7AELOJ2KSOl/zOP+4Xpzh55VP389Kh7k7YXU/qBz0tlYpfoYW0dKskqgSA+4jkepr5jOSokiC8
	xmzg6xGjBetBXmSposT548+PH2C34Z6aCOfbLAwuSMHrewGmn6Pg7pJUkNbnzMKKKcZZNh8PqA1
	Dig0UqESZL6e8b2g1G1z8KwK+7LP0IZWMkiVDILaPhXC28y9vzahabVuAQDRd927pOawYNxA+w=
X-Google-Smtp-Source: AGHT+IGncwUYa4+5cVLQAF/ZOt46ZyfXfdO2f10ep03Isuz2FY4128lY6hxQU2Q/BTzDbYJdDff1wA==
X-Received: by 2002:a05:600c:c8a:b0:434:9c44:678b with SMTP id 5b1f17b1804b1-434ddebaabfmr72665895e9.19.1733663746908;
        Sun, 08 Dec 2024 05:15:46 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm9807830f8f.38.2024.12.08.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:46 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 1/4] systemd: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:15:32 +0000
Message-ID: <20241208131535.5397-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131535.5397-1-gudni.m.g@gmail.com>
References: <20241208131535.5397-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208461

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index af810c0fcd..ca164657bc 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.43.0


