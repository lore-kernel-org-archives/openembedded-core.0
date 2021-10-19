Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F1C16AB3
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.11514.1634657678846665466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f7LgiGrK;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id p21so12443966wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31UjGbv62+PV38NE4HYIFKMjjW+u2Y12rdyaYF6GRWQ=;
        b=f7LgiGrK9qIbn0mTkW/gDVR5X35dOBsmtm/ktdItfrW4dOZFe5xjsc1XPLVX5uFZcc
         wrH/HjUuHz3AF08pARBy0Ajy2uC+TLtCZsAxtr7a8/PSMhxt4zox+KMZOHpQFDrQG6Su
         MP9TpIvmR8jPplP6O5Gi7Bq15U/EefPJdBAIAezHehQN4/zC7nXfTyUur8rF/jKoZgD7
         6rXNaxk4id2eBt+nxFq4ddowgafDx7WDIefpYw/CqHx8Tg4ebvIGT61VEgs7U05R+aDK
         y0NNVRYquvzt9ZbBrJ+d0BmQwJPBbuYmu4hhpbTUYpcxWoaMHGPYViLfDm1q2LExm8u+
         h1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31UjGbv62+PV38NE4HYIFKMjjW+u2Y12rdyaYF6GRWQ=;
        b=DuQhZRBr3zg/ntSM6Frp12qXHEPe5OmwXIjGKhZdRmGUACa0yaWYRAl/OGIktiaSkI
         cFTgCeK+2jIA3k0Qpz/S/DltRsdlMNlIX+bi7GiKFnUwRYEcYQJw1lXkLzX8uOR729eH
         WVYRdMNfDpSH0XIXbfNajwe+NRe3XcNykZbT4/3PuTHhHoX28rAOZVpUKupHr/B7S9BU
         HPjMsdTdKcadJ+fxoPJ2I01eGnnx309C00bzGXAsv/KkdlYagG+Vei3YEr8hhvQxAuvW
         LnzkvciH17pPqWnCdiPWsp+2f0f5KgcyXd4t0LywkhJV7wQ6sX+6BPGKLU5A7CksJdfy
         NjcA==
X-Gm-Message-State: AOAM530atK5TNGSk0EBqiltbOUWniygUchs4etWB9sWySPSMiHpPPTwn
	SwfQblTNq6EbDm5BCa/2SzJD8HfbEoQ=
X-Google-Smtp-Source: 
 ABdhPJz8qmlB1PUUYlp/TcjIyTW9IOV1yfwQaFRyykPIV6g/dywH1cABLYsuRrvUnsO1tTpSfhJKKQ==
X-Received: by 2002:adf:979a:: with SMTP id s26mr44728108wrb.2.1634657677457;
        Tue, 19 Oct 2021 08:34:37 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/65] libxcrypt: upgrade 4.4.25 -> 4.4.26
Date: Tue, 19 Oct 2021 17:33:33 +0200
Message-Id: <20211019153419.3319802-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157138

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional copyright holders
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{libxcrypt-compat_4.4.25.bb => libxcrypt-compat_4.4.26.bb} | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 ++--
 .../libxcrypt/{libxcrypt_4.4.25.bb => libxcrypt_4.4.26.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.25.bb => libxcrypt-compat_4.4.26.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.25.bb => libxcrypt_4.4.26.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.25.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.25.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 29b941d380..ea877bbbb6 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=29c5f9af198623cdce52a77f85695164 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "b9116ef2245abb128a22a975d187b1272312a80c"
+SRCREV = "8ff7a8c5019cbd50419f7d0a8cd691eb99d6b086"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.25.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.25.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb
-- 
2.20.1


