Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23D2C54E5F
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.14878.1709739741892789057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JkXjGaH2;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-565ef8af2f5so8892260a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739740; x=1710344540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nns6MffFpazIO5pjwUdDFazWUJG/k17oZfKOMqNVP28=;
        b=JkXjGaH2nb1BthHVmeIRqgHbErz1JsUf4ZM3URz7dzKgvPtDjaaG3QiOoCuxruoLCH
         3keSju8t5tZHPqRx1HogPzlzGd2iXxhmhHmTUp7RpmVLngPcaJUdmeg59BJSJD4pju6f
         8TlC/Bh1MTSB1qeC+Al91cPa/Nc4X8tEzzVQyPfLO3qz9JK49851Dpx3f5QsJUlKvFAz
         wCOG00rC0jnESzmYQAE1fzu/h8n8EQlT7mmfxFIjlJ3TApsGikA0j3ijcEUGiZLB8xkR
         7F0jkGRQdsJxR1wb/d+XG0s2bbXvi7ln1N7SwdflhsF0hL9Kmt93Hj6E0qg/wet2/UKj
         r1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739740; x=1710344540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nns6MffFpazIO5pjwUdDFazWUJG/k17oZfKOMqNVP28=;
        b=izfPZw+YHPkAyrQsNAPiNdtLtNYxc1XES/qtIuOpU9vqfUDk48c5HCuvJEdR+WCo7/
         fd37KjdGTDwVVMeYFCiUAUiGOvHj2qbUob52HRwcncBn4l7eNkAWM+2Fb59bvQksVlOH
         CTgg53jarRumu11DvcospACRilkNapuCMfh4VPV62adcNK8coD5A2XJtTjurYeJElY3V
         d7pZvc63xSCuVjNfF+eZPq8bJOyf0Eu9izyPCbIEI6TQMm/a+jmvUT43QRdOBErU6oTr
         ptZN4aqhoW+hExEuaq5ggB1lmi59VUWIakIab/JuXZT9mPkpeQZOYSyU5MZ6tTLGdVGo
         11sw==
X-Gm-Message-State: AOJu0YxpJ4AyTKGcpk5yzlAdnTIEgE1zddX5mjgXrorX8SyKVpGHNJeY
	Ya2VZgGr/FOmCS3nUD2+A4sm4xuaTczkW+b8H1sHRqkOMPSNuV78n/4vN9Rk
X-Google-Smtp-Source: AGHT+IEMnMeXENnCQ1RZtonHeYJWy8m20QJV9UBTzaHtctUQSesaWj2QG1jMg8xj+gGE2DuzPROgng==
X-Received: by 2002:a17:906:792:b0:a45:ab1a:4c31 with SMTP id l18-20020a170906079200b00a45ab1a4c31mr3414017ejc.56.1709739740167;
        Wed, 06 Mar 2024 07:42:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/47] python3-ruamel-yaml: upgrade 0.17.35 -> 0.18.6
Date: Wed,  6 Mar 2024 16:41:40 +0100
Message-Id: <20240306154151.3741709-36-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196719

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.6.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
index 02911ebde0e..197bf91d6cc 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
@@ -2,13 +2,13 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
 HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5f41db57c3a8d3584b450d35985ad1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=30cbbccd94bf3a2b0285ec35671a1938"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
+SRC_URI[sha256sum] = "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.39.2


