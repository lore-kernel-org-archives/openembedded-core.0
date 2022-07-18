Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E34C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.28252.1658155837057166483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bHefzCzz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b2so9230472plx.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ba/c/kLw3NkqSnPJ8ANIcsoklydR7zyymTvSxA54BCg=;
        b=bHefzCzzuEjhpYkgDyGDYzZwe6aby7JsA5UF2batdwIe/IDRu5asrAVxmyX4I922E4
         YWTOtDB/inh7ReJQSIqu/RdIg0g7Ck4EllfV4dRckOphbXoNmp70bTO4MC2PPf+B+W3b
         qx9VOlaOjkaczgSjZR+5tkWnP49XFLx6r4/Nv5lIJfyzIPLqYeGoL0QLZQJ8fOYZm41z
         vJNmBiofvgdFZ0qKtKWgLJ5G2xVoeTGOtT9x2aEiiJIHJoabAhcIa9jaLCmsu2Eytgsa
         wl+QEMOMZvodgSr11fr7REz+4W/tIUMNqjaOJf9rdEaepfgGC4lIILFFxOvp2AKjW6n/
         yVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ba/c/kLw3NkqSnPJ8ANIcsoklydR7zyymTvSxA54BCg=;
        b=DQqX7XpL/zIvmNYSOriy/Z0zFMLvRuTOAtmCgVAIz/kDxqM1o2/9SKeRpQRv5OfINM
         jS4YcArOtPltKtOe7hpQAN0OfIv1kFfgiwd3rJ2kwGC3CNvkIBmVDtpVdNHzjvpsEMR8
         52806c+855r8bDx0vbpNj5Q+SfEAWclM+Xtp63vwFRW9swxV6V/iA/lI2urNrsqT4SBN
         GKUlkvbEFmmb4Nig5kj0nioKcRtbJhMnBBmZ+FKR8tPHQ23BByyjcMaRvxnqxTCSMD+z
         RJth7ZOalQdvadot1YkqIyFwDSQKhObhAArkm1x1Ray+wcCDq2yj7vSwb9FKbnay8V41
         /TjQ==
X-Gm-Message-State: AJIora/UiP7ne+nIVfI1S+EgZG6WyZbc52AJxa316fyz8FzG5abuIuvN
	jsqgmm8BofN7P97nvmzheBpC9pt+MV6hq8VF
X-Google-Smtp-Source: 
 AGRyM1uW+wBJ55fKhlIWPUlS21NmLvb9QLO+cChWGi+/A7dIxc4f7AodpSXy+VsFsKEAI97FUGuXRg==
X-Received: by 2002:a17:90b:1b4f:b0:1f0:e99:ecb0 with SMTP id
 nv15-20020a17090b1b4f00b001f00e99ecb0mr33679841pjb.204.1658155836048;
        Mon, 18 Jul 2022 07:50:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/35] bin_package: install into base_prefix
Date: Mon, 18 Jul 2022 04:48:51 -1000
Message-Id: 
 <58029ca7beb6cda1c7a97f2f2cfae64888587cd6.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168226

From: Pascal Bach <pascal.bach@siemens.com>

This makes the bin_package.bbclass work properly with the native class.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad330b6d4b6e2ba051b5c6c437e07a183831f757)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/bin_package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
index c3aca20443..f0407e1329 100644
--- a/meta/classes/bin_package.bbclass
+++ b/meta/classes/bin_package.bbclass
@@ -30,8 +30,9 @@ bin_package_do_install () {
         bbfatal bin_package has nothing to install. Be sure the SRC_URI unpacks into S.
     fi
     cd ${S}
+    install -d ${D}${base_prefix}
     tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
-        | tar --no-same-owner -xpf - -C ${D}
+        | tar --no-same-owner -xpf - -C ${D}${base_prefix}
 }
 
 FILES:${PN} = "/"
-- 
2.25.1


