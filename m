Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F78FC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:55 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.12235.1641927774030752858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/+jy3vb;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso7132261pje.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CGdJRAR8rUZmM2Q9UsoPWiavUTGi9YNOk5OXTR3PqzQ=;
        b=B/+jy3vbd5RLgd8pTbum8Sj9E2HO7xMRmydLUXzA3QTXMORDTBDxDrlIotOGudV2L1
         mEXjA80PzCWj7RKwFka4ua0AlaVUNCWXelaNYd/8PlE6zR+syBECJYIowCHSKkYE5CUu
         Z6i/T/Q/XU45aPw495+nat/fev+eKgHAVXpsH0vZzMJ17S2MF7EKtPmK2toZq+uxyC3f
         FHB7mVTr520lo4WP9ShifvBosofaU6KQfI9R/tj0GtLmHWfEUIGeh6P+H+6/iWyeJ086
         +DdaV7/WULfhOGQ5D1kOC2jtYMn21vU2vidCtKvqqWfvziVlrrNoMPejVfgO6LREkcoU
         EFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CGdJRAR8rUZmM2Q9UsoPWiavUTGi9YNOk5OXTR3PqzQ=;
        b=2swue8Il/AHTd9qSEDQ358z/96KBb/b3rbqDgsaBx6IDrfmgapoZDAtf+b1efLfJ4L
         WTu81LtEsDExCv5KNv5NiCi5p3Zfjt4WW0X79IKfu3+ziVrsU/kTGM1z+q5s0his7NUG
         10AuOq052whXC6sEQQ5KPXp2l6TNxcuxbcTfcfrLEipAb6Vax2BwJ3T2dE+gc15rRsdh
         lxZMVR7SyTgNA8FRxLFHVDtmS/0JC9BLS+LhsUMQbK5kxdnVPlFWlOVYrW28RkU7IE/q
         iwAQbAZnLDgkzADh0oWVaQn/r2V3+szP80If96mihLQbzl+dsGO9UiNYItbKI4EA+SaS
         zVtQ==
X-Gm-Message-State: AOAM532QueOdTWygwwSIs1MoOyj+YT6GG4xnH0XnXmWm0en0EIwRFa1I
	LeAeEscjzRibJsxfaWuMVA08M+Nk42I=
X-Google-Smtp-Source: 
 ABdhPJwY/g+vKuqSD8ZWNxgbQ3+FOcNKYbcL/TjfTaehC75dCBz/pjX7OWnrZCev6Kv8ihykELUw7w==
X-Received: by 2002:a17:902:bb87:b0:148:a2e7:fb52 with SMTP id
 m7-20020a170902bb8700b00148a2e7fb52mr6029294pls.147.1641927773272;
        Tue, 11 Jan 2022 11:02:53 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 17/22] gstreamer1.0-python: inherit setuptools3-base
Date: Tue, 11 Jan 2022 11:01:26 -0800
Message-Id: 
 <e21a3e85b59b4c13649bb56390b2f54f59ddd0a9.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160453

Drop distutils3-base usage as it is now deprecated.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 045aea44099..1dd7d0d09a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -23,4 +23,4 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
+inherit meson pkgconfig setuptools3-base upstream-version-is-even gobject-introspection features_check
-- 
2.30.2


