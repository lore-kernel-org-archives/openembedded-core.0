Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B50CC4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6615.1635842595202800013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkSBu9h/;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t30so7186213wra.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3JEDKBImdd++++Flsujn3n+R5HU70Pfig8bXJgg4vqo=;
        b=jkSBu9h/Nzxgmg2r4Ky1waflvaQzIN6bSbOF/rgGLKdkEMy4vnALLGWaUPPn6LLHT5
         IHRKXqeulgtloTuPvcwQ6qCBnOfE/Vlrb2qKp3BkVKijGAyyjnJogsqx0OdFpYfqyF2T
         cGiyDnTMB25IeA/OrRNSiKVcItz2WHOfkimyU5Lr7Q3BoJjJtVjkcpDImMgkQGRmHpq/
         Zh7fp4S1eo/SBHUfzaKnyvnsC/uGC6EgoGsJZOxajZlxhQSbc/1p2KGBq0ibgAad3c1e
         gOFXuoKoASa00iqdPo6iseGRE75glzO6siCfUN+hXF7bKXSEbKdOIijaY7PYSuPXKdah
         BvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3JEDKBImdd++++Flsujn3n+R5HU70Pfig8bXJgg4vqo=;
        b=uaskufRcQeqKqSWrT7PU3VPG1nD4C2162a53xaSGSGKCEvbn3jXq2QdRl550p6ASD2
         4s8cIQKFzZOQ19g+a8HCx7bAvJvIcpClt7A94mgtR2y+1hFZtBjPHZAz+AaGZA7CzUeg
         dWmTCIRYm5LYm82Nx8aR39b9Q6hrk5qKMsZVaG8VJHGx+6UMn13gdsoBsUIyeu/Qz89v
         rtkGDGbqvOVrj9Uef4s+Agu90JrNeCPGF6BnwilQ96AM5byIGnasxxiwdpgM+kmVe3fu
         oluPssmRX9kbkw/vLePoNwBZeTiwyRkOdqUUAHXxcqbuPqtJWDvlHP2KbRwaPfArASH8
         cPTA==
X-Gm-Message-State: AOAM532DxZpG6yIJr03PP1zNsNJ3IWv2RcKDKczVpg9aCu5Tt3aYw4gQ
	4YNku8DQDqR5pijz6jWQkLcQP0sruDc=
X-Google-Smtp-Source: 
 ABdhPJwlVoTKzjJ4713J/fXsmimrq6TAAZ3nEEUBAqL4M4dx9plnn9RwrWpGanMjx8Uh1XwqGTSB6w==
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr30810776wrn.49.1635842593873;
        Tue, 02 Nov 2021 01:43:13 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/33] mesa: upgrade 21.2.4 -> 21.2.5
Date: Tue,  2 Nov 2021 09:42:44 +0100
Message-Id: <20211102084303.2974802-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157752

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_21.2.4.bb => mesa-gl_21.2.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.2.4.bb => mesa_21.2.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.2.4.bb => mesa-gl_21.2.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.2.4.bb => mesa_21.2.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb b/meta/recipes-graphics/mesa/mesa-gl_21.2.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.2.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f1a1e57062..cc71114992 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "fe6ede82d1ac02339da3c2ec1820a379641902fd351a52cc01153f76eff85b44"
+SRC_URI[sha256sum] = "8e49585fb760d973723dab6435d0c86f7849b8305b1e6d99f475138d896bacbb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.2.4.bb b/meta/recipes-graphics/mesa/mesa_21.2.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.2.4.bb
rename to meta/recipes-graphics/mesa/mesa_21.2.5.bb
-- 
2.20.1


