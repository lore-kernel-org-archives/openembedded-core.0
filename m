Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A9C74A5B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.55941.1678574519710474310
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FCZB8RTY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so8487639wms.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMFQDI8hi7wxCu7s3HCiQHxs9Tx9fbrcEMlmRvrljAY=;
        b=FCZB8RTYxMdZLN1jywCexvpK504AhXxdD4AUqB5EQlr5194D7WbbmZ5Ib49rGj18Ux
         IbFfH3qis8s/nhAB3wMA9INnI7lQBd/oi+GVidgB3XA9voHq7GPnFapDv/wvlMiyDUAE
         2AGdNUp/qmFmIx3QifTLYpHc/qvV5IdXXfMPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMFQDI8hi7wxCu7s3HCiQHxs9Tx9fbrcEMlmRvrljAY=;
        b=vHZsFWrhKgss7+E6kxtiV+CKnFY6qYAwHi02YCsQV0m2Ys4516ZQrobIKau11h16LA
         f+QqNtHgSwTgBBsg2zSLwr+U37Iqv9y63g8jhjifsfGlbdIvl682E28OUqis2oaaAGVg
         nDRjibBduKufLVDCOBxCFiblz95UHvHHh85ofp/Tu3MoJSwZfP6BskEf0rq6KbGuzsPu
         jHY2rMukA+vpCe06LRIW7sM8Tk4/Am3aW/XGBlv3PiBuDdSqhA/BChLx4QHbV31LaMmY
         745zYJQ019NtG7V7dmMSJAg5+CgyG7EkVqHqtAUZ2RInEUoNj+HJvOjIKhgynY3NHcjm
         0C0g==
X-Gm-Message-State: AO0yUKV9LWFHOZSYYXwKe0F3K8zfdd58w3FWgQCRJt21ApyJzqQnfzN5
	alHZsVNg5Rn002zobuv4Njg/ogduO+NDPBVb3kE=
X-Google-Smtp-Source: AK7set+aC7jKOHAXJB41o3NVJkbNE1w4L7JfL7SpA2KnLj84HgfnqQuvE+xOpt5261rGsmDJ5b+qfQ==
X-Received: by 2002:a05:600c:3ca7:b0:3da:2ba4:b97 with SMTP id bg39-20020a05600c3ca700b003da2ba40b97mr5181532wmb.19.1678574517789;
        Sat, 11 Mar 2023 14:41:57 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] opkg: Add missing python module ptest dependencies
Date: Sat, 11 Mar 2023 22:41:50 +0000
Message-Id: <20230311224155.3442306-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178369

Add dependencies on missing python modules to fix execution in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg/opkg_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
index c3f4a7dd575..4c25fe963a3 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -65,7 +65,7 @@ do_install_ptest () {
 RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}:class-nativesdk = ""
-RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression bash"
+RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression bash python3-crypt python3-io"
 RREPLACES:${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS:${PN} = "opkg-collateral"
 RPROVIDES:${PN} = "opkg-collateral"
-- 
2.38.1


