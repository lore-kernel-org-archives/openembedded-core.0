Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C4EC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.4736.1642588913760904001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vn+tKZRj;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso13523921wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZAy2q/OhMQmOF6mKw1x+63/xq5xXDVgqo+i0EpzjfjI=;
        b=Vn+tKZRjCQIznUBcZdX6FNLgykz9QTgRWFklhqeiVHJRmrwQdJJrQtuV6kokrTln4j
         PBHncYSkbj1ork5WE2/XKj8QLLRdzGvoLFD+M1LXU9D29cPfmtTMDf3L9FLzwv8iI71+
         krcCyYS/Xmzx1eAJHmGXWsSq12wPSheygETTxrUGdKpdEQLECAfD/Hr1ScIF4jxbEoJ6
         CaNUz/uFfcn7lMoYOR1gHR2ErY530KrCQmvYcpkHdFmxMrCmDSE/f8DwR+xVDQ7uJM/V
         +VpyNyBO6txkBhq40mHBAJSCPRrS34vls3E3toEE8er2l3sNMfPf9/xrJseBZv+rIqhc
         uGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZAy2q/OhMQmOF6mKw1x+63/xq5xXDVgqo+i0EpzjfjI=;
        b=0I26j/sDpijCflsu/cToAubWxGRBiDHAdFF+9EXnFnNOgyKNFea9Y1o/JliEkeNaEH
         9T4gVZtshTj+ucw6qPVkBDhZwPwpRwHCs3qOfQZpokjxo7/bvym48m1zWQDI8+hbfyUE
         Dvkg0fyl2y3Gx64d5xgVGK/tzuGB8zZZ90CFt4XX0OqyDA1A8rdtwosrh6BOcvmnwHhr
         Oj8+Snns+DWL7e6pXjqtqELpk3cBxpD6bLRdUjdrKlrsroDVnpsDSPNklZY6+cWi/Kc7
         zbc31A1Mvt/uKcInI2INraKe9W+mJ0MCQ7z0tBgS9R5oaDtcdCCRyXjqqnyf1jEuPJdw
         RWVw==
X-Gm-Message-State: AOAM531nNwfNbnra0gueTtMXjKQkeltaCnly+uhs9W2L+l0ecW68lR2R
	erB0WnHxpecQbEUV9e7SdMHcjsOJdCQ=
X-Google-Smtp-Source: 
 ABdhPJzZbR4UARGCwwT+obju9650ipqBF5N0BHNg/ElCI7Rv8lH3BMbvFx5CSWhQDsdnfAeiMlfW1w==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr20156722wrd.267.1642588912394;
        Wed, 19 Jan 2022 02:41:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/39] libsoup: upgrade 3.0.3 -> 3.0.4
Date: Wed, 19 Jan 2022 11:41:14 +0100
Message-Id: <20220119104117.2120127-36-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160728

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup_3.0.3.bb => libsoup_3.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.3.bb => libsoup_3.0.4.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.3.bb b/meta/recipes-support/libsoup/libsoup_3.0.4.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.3.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.4.bb
index d169810e27..ad35e0cdb9 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.3.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5165b04dadae3027e9a2882d868694b4586affd778c194982ae4de2373d2e25e"
+SRC_URI[sha256sum] = "5bd38b5e091f707fd7fa3ed7c37aacca3f8e16c65787f1cc17dc38d1dcde567b"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.20.1


