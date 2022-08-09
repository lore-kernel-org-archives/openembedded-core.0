Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E66C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 15:00:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.12970.1660057205010776389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 08:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hi/oduWR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso335294wma.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=Kq649DeHe5PfqeF3msY+vR301tYJ8dy1LZY4EIYExY8=;
        b=Hi/oduWRSlxZOIt1wHT/wtIq37Da47X5Lzk7ZqxP6nIJxhazX3JkvivEcgcl6x60Hx
         jsFfqB6UpDDN1dYSD05CVEic38moAoZVNN75FB5aVHfsg1XxqYOuCFB3qnU75S2TA7JM
         zCfXX2SPwrlendZtlcWcs1cqTwFfwwnnYgKW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=Kq649DeHe5PfqeF3msY+vR301tYJ8dy1LZY4EIYExY8=;
        b=eBqvuUhDOse7ckQ0qP2Awdl1NtEu/tzLapSG9XcHl9rksILuCVpBY+VZ2KWo4SdyHv
         C36jB1WlFR/HBKind40ouXMW9GZy1IgbHLa3G4us3v2d9dlISD0s33mVA3iN04UJ+p/V
         czQNfZ/q+U5mUIxRdSEgdIaGKljx7EkRIZtpRe9lEthUVj/0AlfQPyF96JfZAerkQ19y
         niVWJ0CDzinaCoBCrW+wQECE67noX3RygHQwVv9Gs6vme6+uyrHxj6DkA3horMFeamzy
         qDsG65HQGJfiFDzv9RLlMFQK0NYEELjZcODSkryOIyW3thS6tQBxZ+sKuvtNKoajqbTN
         MsXw==
X-Gm-Message-State: ACgBeo0wlKBBXhVUft5IWENyPqD0VlXx6L7mtMHQaJAUxoTvKsMnx27p
	5xoWEHD1YrT/hbCwtQVMQmMMwUp/vjQVQg==
X-Google-Smtp-Source: 
 AA6agR560JLehAnf4LHKaK2TdEPh6xma9F2zyKHwKDEeohssa0ML1uQAk0pjJDeXNN4ijH6f6rucFw==
X-Received: by 2002:a05:600c:3b15:b0:3a5:49e:81a6 with SMTP id
 m21-20020a05600c3b1500b003a5049e81a6mr17626386wms.49.1660057202970;
        Tue, 09 Aug 2022 08:00:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b0039747cf8354sm17971854wmq.39.2022.08.09.08.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 08:00:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-cross-canadian: Use shell from SDK, not the host
Date: Tue,  9 Aug 2022 16:00:01 +0100
Message-Id: <20220809150001.224634-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 15:00:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169157

rust sets LD_LIBRARY_PATH which causes a lot of problems with host
binaries conflicting with SDK libraries. By using sh/bash from the
SDK we avoid those issues.

[YOCTO #14878]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 2b09661542d..77d45a37a31 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -7,12 +7,13 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
+# Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
         shift
 
         cat <<- EOF > "${file}"
-		#!/bin/sh
+		#!${base_prefix}/bin/sh
 		\$$1 \$@
 		EOF
 
-- 
2.34.1


