Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2196EC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.5729.1645406898295613853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OjWavFDG;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id p8so7319766pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=OjWavFDG0sTfZgVPGmqMfhZbdXd5E07C9vjtEvyRj2jkKOSyd2Embiytuz/XsbQiOH
         ejx/0KOD6+2pFqRqKVxZrReTySEGyFuHyhpH2Jl3lXVkUDGxzkf1oTIiMjyv+k6LOY1q
         7VDjCIUa7Bxmv7N1r4lGEP9Cw+2TNy3qa6uNgxP8enW6MA4OL+ODqq8zrUkBGU1uaOM7
         JvwnKzxHcJj4fObeuPPlzHCJLtLSnVz+slIsOGu5zoDzVb4wJUyOvc+95xf6Cm3jEUJs
         sk82D0l9TcpZiOBggNiy8M0/K62TYoOQOYmNp3n1UbRwl6yHXiS9dYa4/UtrVzuxqJV7
         3KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=A102VjGF6xxp4FZiT8mvyAVSb6ww6CO6EGd9d/NaAesnwsiefjIXEOmdOmiiPLgCLf
         lcICzR35mccf6PO9pIi44Ypu5EuSqDayrL3ERz1XzFgCexGgacn7F3AnnYTrLbyNALeb
         JAD6C87XvDfWQhLRTTfqWIfkoUKa2HZQ+50ByYREs7YhW3frP9Qt9bkQqJS+Lto+o5dI
         mDOC6wjsBNwJeZiX1eYV1njUL+AcsWaWpY1+AkGfMDo1qqGA4dre0dGazNZHVJTYsiMm
         2+FqMID5BGj885D6LBHMo5cjCZhTQxcI8ujPbAK6l6z881LXW3jz/SpsLfxSaPDZBY8G
         gtKw==
X-Gm-Message-State: AOAM533LWzoQDjm0LyeRaRwCV0QeJkuMaCnqLwFF1lNd+RnoH1iOyP/z
	Ug/1qoUhSSX70gAftx96vCfkjrkcW9eqBg==
X-Google-Smtp-Source: 
 ABdhPJyVpgxxEoYHkH25hJFow5oZGB1qVUI8SqKXCsEpsh40Lhu0p7JiYrMUXwTAlcgW+CGkBWNofA==
X-Received: by 2002:a63:f555:0:b0:373:9ad0:ca08 with SMTP id
 e21-20020a63f555000000b003739ad0ca08mr14292308pgk.315.1645406897365;
        Sun, 20 Feb 2022 17:28:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/19] python3-pytest: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:40 -0800
Message-Id: 
 <79e409c48bc68e918a5a7522788c3f6c3f8d1807.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162003

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pytest_7.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
index 25014064890..ea6ba80300a 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
 SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
 
-DEPENDS = "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
-inherit update-alternatives pypi setuptools3
+inherit update-alternatives pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-atomicwrites \
-- 
2.30.2


