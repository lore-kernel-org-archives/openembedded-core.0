Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D878C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:23 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.4747.1645478662889552470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+vpeOfR;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so428633pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=Y+vpeOfRdABhKrHwHm6AgcnVy6KqFWrURSIuctJwvpbYz8JxdebLDdCXV2Jf7UGjw7
         yumt0CtHkKkgYACKaKZLhX5rhQNUwLFFJ0r1zG7cO7G1/hOkpwdAtOXTiYklWO/J5UOf
         hKVX2rXbkuZvT2bqOvMAH5Z5WbaXPSLpyGo6dD0QSEz8uxQ2UFqGa1bjr2UciU+fI9xe
         yeHjPami6VA2C6VZCzagn17Y/p3sxzQCMdKYbx+1lUe6O5sGjVGRDnSvoZ2schDpTv/h
         dAbAb84PsV+h54yDKNglWSHkckxfUXTdMPsRYF0GnpvdFA1506GAwgFf6uDdSZfMYm6r
         LgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=1avbix1It06hhZ2HTxlDP048h+qVWjGoi5OJtRlQz888AU66OkTrvWj9N2mz82GEBb
         8fkeL9TtYMlSz1p09hl5ZZhe/o/j4BRtOknGl5F29QbOP/j9NioIZu8CzQgKMz/d+f0n
         oH3e61aEQB/QLoMEWdkwPP3ItBYx1S6JHiSoOXSbfhNzZMi/g2lFO0BYAVVd32YczMy/
         w2BvFHCkvNjVnnk0VKWKnNFC0KmBpwDOU7qQqByuAxelIwcKmFglcOTEIJk/LnzekVEg
         IpZ+IEyxTo3pB3JRsXRdB6I1zlzfklI3+16iEFneEKXi7jTSssnJCvjQ1MTLhWxbyp8I
         AcKg==
X-Gm-Message-State: AOAM533fl5wmi/moL2gauc/sGgZGI8HeYB0XRat7JdW0cbZmojMCxFD7
	8GXQ2AfXS6wE4KE77/H/B4p3lgvNxD6U/A==
X-Google-Smtp-Source: 
 ABdhPJyQEeyia21gKxd22ZYxdjn6hTXFKbvf2vBJH7QuTBieJ7W511v9W3zj7XeG3qAf/fQnLDimWQ==
X-Received: by 2002:a17:902:ed83:b0:14f:c969:7669 with SMTP id
 e3-20020a170902ed8300b0014fc9697669mr4073715plj.96.1645478661918;
        Mon, 21 Feb 2022 13:24:21 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 13/32] python3-iniconfig: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:28 -0800
Message-Id: 
 <ddb1580bf546f98c76e75fab2dbfe9fa736d4fad.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162089

Upstream provides a pyproject.toml which decalres the
setuptools.build_meta backend for PEP-517 packaging.

DEPENDS on python3-setuptools-scm-native (as declared in the
pyproject.toml build-system.requires).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 6b3359712f5..5338980e699 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -7,4 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
 SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi setuptools_build_meta
-- 
2.30.2


