Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60CCC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.3411.1652871544803547190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYqey0AA;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id m12so2479007edb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n0Tl/b6B/+ZU3AIbbgR4Ha3QIN5EZNlxuBwcmuCTODQ=;
        b=UYqey0AAqDuzLEtZQ8/qa+zNKNjQFNMShnmit9sBcMlwB3bApJwLAUWoYvGoqICClS
         xu1Tp+fNZhsKrKM869V3EhQzuYyJY30cr1giFnwNr7YJ/xQTzNk19GmxLlhlpsRJFHQ7
         6gVkBjQxZ+nX0Av7Jx09upgqZS+GFNEBMfxlmYpJxfGYeQNkHqcpD5kOrqgUyns8tVNq
         1WpY1vV3+2C7m4Wp8kCcMJJaSs5Bv6ggfpwiXD3KuQ2GhA3b/IbFj/9hnTnihGyziw7o
         MhRcDn7FC/lu37g67kIZ1NKiVoPNCaExd1yCUbNBpgRYDQTsEZz9otK97lqjoSMjMT+d
         Xs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0Tl/b6B/+ZU3AIbbgR4Ha3QIN5EZNlxuBwcmuCTODQ=;
        b=ze4uFJHO7rYac7Zw0MGHASybjgQ8+NK+xMdsuGlaXLwCshGQkchrrK91kJm7RYwgop
         +N0PhDtvxoI5Bxw3RQ4u4njylKucUd2grY9Jqt/h7Wf/nA/0w0xLUpFEdPHHC4GwejQ4
         G4YXcACp4NZw6qng4OLx95ZhfrfBJUWMjFA3VVyhRs6Ocd+oaHyOE9W5y3StYtbMf/NZ
         msnL5nsmHxVkEW6MhMCUOzH7CqjaWXbM0gaTM9L3CKaGlsNDSuQW8J/Xx1rMiHE9fYv2
         cmApk0jePFQ6IC8QBlnoTiIQoW2wMC2F4lZ/5Sr1GvxVNX42vfEEoTfCf09RyXj5VzjU
         Rb+g==
X-Gm-Message-State: AOAM5339JbjOTliYuTMDjqnv2HyZeNceOStDpa8stclpGYe2oSgKWk8q
	QqcjHWWvc7PjWbzLGpLJP66yRhjw+O4=
X-Google-Smtp-Source: 
 ABdhPJyIat8H/mgnalX2cXIsoIyB9vV5bXofoJQUvjtldTmGQTmcczcMD/mcS29/JZcNCxmmogPD4Q==
X-Received: by 2002:aa7:c3d2:0:b0:42a:b39d:b30c with SMTP id
 l18-20020aa7c3d2000000b0042ab39db30cmr15472731edr.368.1652871543413;
        Wed, 18 May 2022 03:59:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/49] gnutls: upgrade 3.7.4 -> 3.7.5
Date: Wed, 18 May 2022 12:58:10 +0200
Message-Id: <20220518105843.3299331-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165813

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-support/gnutls/{gnutls_3.7.4.bb => gnutls_3.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.4.bb => gnutls_3.7.5.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.5.bb
index b34eb7f5f0..5feedb7fdc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
+SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.30.2


