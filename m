Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0B4E77180
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.78448.1733663211152945971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtWmR213;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1899329f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663209; x=1734268009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWhR6ta7ARaKY7e0/uxCseGpMy3+a6dqCGSpTbwVMRk=;
        b=dtWmR213uqL3xInF+kasOOn4Il5MiyGfRdEvqNpCXPKR8NJrFdFyjo7CNLokxO2Q6J
         soacvYpb2VDqE1a2RJ2JdRMYW80cwNJZSGpfyhRTJCRA/JYIDtiOEJbvs3CvZ/7J1d/F
         qWMuI0V1YS71ZZ0b8O9MK2NaXajoWgyYyvy71eXDASTiKb4sPt+Vhx1oHBAtF7fOe1ZE
         9wpGg9PvSzILipPkHW00ehlwXomeTQ1yDiibBv3L5EWa6NJ7mMnme/JeMN+HjlFn5qsm
         R/O6UUlGQdGw8+4OLdIsiM4sbD1Y0KpKMP5+PZjqSq1ATL2A5z+qXX8efLNdtey6Iphh
         x+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663209; x=1734268009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWhR6ta7ARaKY7e0/uxCseGpMy3+a6dqCGSpTbwVMRk=;
        b=NYQdCesOWladYWIVUQ6QrRWj+UiYbQGwvyUT+exFmKcv39h4EuFxqSIgvyuSintJzm
         0lgghOm0F1vpsvbokxOasfrRjZVyBs4hPXTQv2i1MBVzbGN9VH96aT0K1RHjVD5kujiI
         HjN0Os7Fpogi+dDwrWEkc+J3i7YFRPq0DATgmNHhUtziZTAjZXS80EbRt1qyC95810fU
         yVEZKBwQBS7GfzKJPPWJP/yzRFNGX/mkHATbvJ2m5sT14qG83+Zf9Xsya0JR4+prK2r9
         nuK6K4eraj/70fPpiQHX5komM0+FTJFJWf59s+dp5X9PVIhZKb6Oa/ngWzuO+IM8VXRb
         rwMw==
X-Gm-Message-State: AOJu0YzANPYwRjRRE8kx3huocrYJ482YkcE+iEL2v9j8Edgizlhc3UBi
	nr/LC/ox7OJ3Qk3+WTmGXDhLku79rZ7+nh6BTwAyqSU+5Tta1vf3mIahKwUC
X-Gm-Gg: ASbGncvbJqSEwWTyfIdm97dzXyUW/ey8StURUcXOhZOaJOMiMlgbJUmR7KhgZoZc81T
	tk6LAglJ8SoWCfeKsCsEkgLpUTK37fSopWSdgc1lI2VLPoYdOWb+9MR257owKFlB3AKZ9p6w9NE
	WruDeSRYFS2Un22KjLVS7sVsjbrjru+B8k9IG3BMbLjP17XMuVmULrP1C1S0RitUdPVQ2m0ms0X
	VZTH5zpWfA6/3AE5S9ymKQIVR/OKZOcIOW18Ywse7yS5K/6Q5Nwt2+gNlI42imNOoyqEhmmtv4=
X-Google-Smtp-Source: AGHT+IE2Urb4XNdvgr0qTPOvLP+ypBJTJt8F+p4rgwPa0YE7BEfHaWZnFz4LjVGywv3tigkZeAhH/w==
X-Received: by 2002:a5d:5f8c:0:b0:385:f38e:c0c3 with SMTP id ffacd0b85a97d-3862b33eda1mr7265069f8f.6.1733663209131;
        Sun, 08 Dec 2024 05:06:49 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386257de681sm9745476f8f.30.2024.12.08.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:06:47 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Sun,  8 Dec 2024 13:06:17 +0000
Message-ID: <20241208130617.4032-5-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208130617.4032-1-gudni.m.g@gmail.com>
References: <20241208130617.4032-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208453

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dnf/dnf_4.19.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
index 37a2cc7de2..9c7c59818e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
 
-DEPENDS += "libdnf librepo libcomps python3-iniparse"
+DEPENDS += "libdnf librepo libcomps"
 
 # manpages generation requires http://www.sphinx-doc.org/
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
@@ -49,7 +49,6 @@ RDEPENDS:${PN} += " \
   python3-sqlite3 \
   python3-compression \
   python3-rpm \
-  python3-iniparse \
   python3-json \
   python3-curses \
   python3-misc \
-- 
2.43.0


