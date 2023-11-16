Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBA1C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:16 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.2318.1700120227649310872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeFEO4xw;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso703960a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120226; x=1700725026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uKWYuSdp0+qUxubFZR+SjoW6jRwamdHhjNcJ0SKVgw=;
        b=eeFEO4xwvGCYMzAZ9vwya3nFgX8bN0SWxZ7dQXJbuZZ0K/irXQ10Iz97yjvKA29EMv
         Z4qx2kA7FLltABEPGYhNdCduQpuEu5BHJOE+YRkpBsKU9GUHpNuNI46FDN4mHAhts/9+
         msgNI7laNqGiX3pxmBN2UBPDWRahWKGe94oHd9Npr+nnAU1QU8nwMvfeSMh8D7E57zgD
         0lq555MpV5hHTebW5xFj+dYBLy9ahobjtiMos3zEkwagK01EDW7ERn2J/CVk/97e5FEa
         zjhJgFjNZDsbKJZMNtVdW9qd6YRjtw/eBM+LvwPxm2gYgt+/SINo7TTfoTrLriixcnwm
         OC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120226; x=1700725026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uKWYuSdp0+qUxubFZR+SjoW6jRwamdHhjNcJ0SKVgw=;
        b=OQgrhNCqwDdOEnVNlzQE3uV0UhG5uMMe1IsJcOPcSKmJfpCyj8IlGHv76EOfoy6ysO
         e+1CMvmm7qMQXiF2LdvwD+9QgjLCvDVS4fLWJH/A2n0oNSJNC4cm0Ct381nf27ZrVYTM
         xf134Ol5Cg2PW1Qi8htSYjDagiZjq5aten4nubsEOGAk49vevOccxpfu0vp0Lrtylpv9
         X6853mMDSqq1l4IJYYcfDIZTz6uw/3Xxsv7X5H8vXZv8j++Saf5x1/MVllv1kMgbDn2/
         7DJo7Vy01VkShxA3pqVnp6rJSONsvLRSOJ/6/UjlrrpS7YTmskb9fecJN/PJXrGmP1vc
         WiLQ==
X-Gm-Message-State: AOJu0YzZL9WPwxMTfWKlUk1bAR2K1wyq6MNT6Ea1M6x9Q8/DMR0157mw
	pia7IWy6itCSjQO0Qij7XfnPdc4BmKg=
X-Google-Smtp-Source: AGHT+IF3XJEoMV4MZUAqIg0KPtUjlMuTRHdWytfZ9TmjZhGwBxQngw+kw3wNdKITjLiOoG6hrrqToQ==
X-Received: by 2002:a17:906:f0c9:b0:9f6:15ad:cbf5 with SMTP id dk9-20020a170906f0c900b009f615adcbf5mr324142ejb.15.1700120226020;
        Wed, 15 Nov 2023 23:37:06 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906408a00b009e5d30422ebsm8012560ejj.101.2023.11.15.23.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 10/11] valgrind: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:49 +0100
Message-ID: <20231116073650.2710535-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190762

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 68ab319a1b..d098ae08fc 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -239,8 +239,8 @@ do_install_ptest() {
 
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
-    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
-    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
+    mkdir -p ${D}/usr/src/debug/${PN}/${PV}/none/tests/
+    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${PV}/none/tests/
 }
 
 do_install_ptest:append:x86-64 () {
-- 
2.42.1


