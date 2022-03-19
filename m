Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B66C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.4912.1647674181802545534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=APqGc6bv;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 o7-20020a05600c4fc700b0038c87edc21eso1541920wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6tJDnC3ga9OVo9fqJV48NZcNrXjpoe2tCxTomy/AbQ=;
        b=APqGc6bv/m5k5rkcsDxFsjBwe7yyjHBe2vsnRwcZXhy1Gjrsn6wa0MH6kWRp8R9TuA
         Enf3dt6AguJxBid/SU6nAtb2HzOUipO2eGz4ADuq3Aee6lCQV+uiL0aXtf5GjCqmXZSj
         /yNrxCtOstHnvkWX1xJTM7USweQ1ZcJW2ZAjNgeq+s4nPtgM5tgR1SNs+nyOUwLL5NNd
         vNIAszLCzx/gT0FUL7+mqq7/xEjbd6cw62mg5zk8x7ccTXhPg5aWgglgASrG9OXIUFdX
         H4/YgM2LQodHcU/D6s2Zu0rBNyJYvar8cCbLIzIOlYVbCmsuwAvrvS8RnDUU6MgdwN44
         wCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6tJDnC3ga9OVo9fqJV48NZcNrXjpoe2tCxTomy/AbQ=;
        b=JrHYzBnwNiR7Q0CLCSyrBhhz6nimBGIPL9VUZMldFR3b22g/hKAcIDMuMhnE5lzIg5
         X6m90g0s6oJFaxF+brnE3cJHd3Nay9UITqazyS9VLcdqbpsieiAOo7pmAV20kNvfOUyW
         lzHqV+URx8OojEoiJ5/xUS7Q1IdwjZU+u0kuBaEZwD5BiOI1b5HbbHRzLRPfHXEf06lQ
         6q/NMrNBXu2i4qYkk41B9EsUInDQs+H/bJGNOvJR5L/IesDBUVRVIBZB+/N9nnkID6hO
         3qVDfUj/WwhxugrM2nRQZaE9n6ICm0F9lUyCFu4QhGYVU0KpdeftejwUFYkKND/1UYtX
         ELmw==
X-Gm-Message-State: AOAM532Zkn7MkQOQwyej2mwZyYQYbpNgT4Rvaw42GR9yBSy502GNr/dB
	btkw6s2Uc4O6b/wBW0gXVtBBVQVTsTo=
X-Google-Smtp-Source: 
 ABdhPJwb2igFKpPU0+ppGUh0A2YvyvhC28BWQL1ohCCWk9Xn29f/hgVrD+2oAB1WohijV4ekQ3+iKw==
X-Received: by 2002:a05:600c:a0b:b0:389:dd65:66f1 with SMTP id
 z11-20020a05600c0a0b00b00389dd6566f1mr10956988wmp.95.1647674180415;
        Sat, 19 Mar 2022 00:16:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/11] gtk+3: upgrade 3.24.31 -> 3.24.33
Date: Sat, 19 Mar 2022 08:16:02 +0100
Message-Id: <20220319071605.152904-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163464

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.31.bb => gtk+3_3.24.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.31.bb => gtk+3_3.24.33.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
index a53cd7a45e..fb9e29dd8c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9"
+SRC_URI[sha256sum] = "588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.30.2


