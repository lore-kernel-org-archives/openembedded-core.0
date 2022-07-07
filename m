Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84545C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 12:14:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.4739.1657196082656469857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VDyDuuaa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a5so11351970wrx.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeOgMf+Zvmvemx+x3+I/OFvKKPrO+f6rnOCgghFM06s=;
        b=VDyDuuaaBJBWeHXLaGH77ckFuIejfbadI/gkZgEDkuynzeDelMHkPjzKg6c0HnNf4b
         99HruBcU0jsDdh1mtg2mXHrlaioL6n3YI4AI/jw5ebOxxADmmE+vmCIvhDRr9NzZDnpg
         T9MRo029InYYM9ojH1gHR+i58lS/zzBmZg+gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeOgMf+Zvmvemx+x3+I/OFvKKPrO+f6rnOCgghFM06s=;
        b=d2vY5KzFamEYQjBAojYMX/Cxb0Qr/XihnFRYuV2rvuA/RdktfC1bLVgnoOM/cV6ji+
         a9HlTQrsakXkx+thLtVYOhzUVEIdScWn1pN+Yzwkm9ff0PFlIjA5Noft2N07Egtyk1UI
         XSEyGies9hxhUloBwLDyknX/gGASenP8URjX//grWlPUpwaOr0f5YIYIMA3YYQyBjcKu
         lq8bi1Osw/+/wDh3jR6PH/fcLtFzhutzAwMfPNnGOX0Pm7k62/cSrj1b9U5jiUWcKe6z
         nbDGxgc5wvLKSNv+vcTDMDPBnlMNHZ5TzlBNCXHWebmKCP2hV605c3xF00+6zkrJRbHo
         YbxQ==
X-Gm-Message-State: AJIora/YXpzi04JrbbpGllYqQy69ArS7B7T/j3BWRGhjL7hE0ny+Fdms
	0gQB4er1a4JeEOm5QPEAzICRuEudFuvewQ==
X-Google-Smtp-Source: 
 AGRyM1vn2k2NlVHNffVBZ4Scot3wHaEeKDqf0jgUc3d9hMK5DXOqBH/yNlRzz6dTsV/6fW0Qxiphiw==
X-Received: by 2002:a05:6000:10c1:b0:21d:76e0:c6de with SMTP id
 b1-20020a05600010c100b0021d76e0c6demr11126099wrx.623.1657196080533;
        Thu, 07 Jul 2022 05:14:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:638d:2ed5:49c5:993f])
        by smtp.gmail.com with ESMTPSA id
 m124-20020a1c2682000000b003a2cc290178sm2138404wmm.46.2022.07.07.05.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:14:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gtk-doc: Remove hardcoded buildpath
Date: Thu,  7 Jul 2022 13:14:38 +0100
Message-Id: <20220707121438.1061593-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 12:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167772

When api-documentation is enabled, we see a hardcoded build path to xsltproc in
the target python configuration file. We curate PATH carefully so we don't
need the path there, tweak configure to remove it and solve the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 392913fcc65..150eca92747 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -18,6 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
+
 SRC_URI[archive.sha256sum] = "cc1b709a20eb030a278a1f9842a362e00402b7f834ae1df4c1998a723152bf43"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
-- 
2.34.1


