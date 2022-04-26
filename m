Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378E0C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 19:46:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.2067.1651002413737302896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 12:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t05jh0ne;
 spf=pass (domain: linaro.org, ip: 209.85.221.43,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id b19so26877346wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D/mkBaLq2baUMYGmJQy3dUP32SZ47E1EoAbPENlO27E=;
        b=t05jh0ne3iK7BmK5bHAKch5otYqa4i3sjW9yV3l8GM0dr+J+sXQU7kSwIUJvex+8ec
         Amt7aPxnhv9euKpgEhy7+vZRADFv7ZCQnslgj91+SuHiDOMhW9Df8EXLZbyZu0Z1gwQK
         ZzikJy4vXYx8z/Qr91RehnQB+1fPJyxJKImxmtoNIRs+CTGz7LV0sZHqQVojSgfIZR3N
         ASlTN8lgPyRImU/xdmRVnStlcZQsO66qYHR+Gv2X2wBDddb2zumx6fGvKXgKQZm1VtHU
         k7A+K5KZnLZTEUXVE4FkGXniQyZIa8rsr5Gpf/qMrTwBPENOJhplB0HirQDSpQ61rQAz
         6bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D/mkBaLq2baUMYGmJQy3dUP32SZ47E1EoAbPENlO27E=;
        b=G4+tBqKKsfh9drqzuKP/U9pVeNkKb9DZWwwEYC58f2kFBULbaQrij8EmRmT5TRJ0XZ
         VsRXwv8g0KedR5UwNqbML7j/ZlqcFc0JpepVM/dERfet/T5eqDiotFAcs7lAk85NjkFR
         nFFHrWsaDtlXGaHjKpz1zw3olAkQ23Of7RkCvqYv0yiUHm1CeSuSvwuDYVl+WrBadWs8
         TEdDiH+zdl+2yzbMzOo/hzjHocrcJ6Pu9ZA40LPX7m/JgVyy50FoDDjlyevOIzC93okT
         SpE8VkJ4M/QqzqUPWlk/iw5Q0DMsZwa91dOiJwPerp813SqzgIc+7lpvURHzJF/Rht+G
         prIg==
X-Gm-Message-State: AOAM530vZ0xl3jbWQWapnMCGjHa4swUDvwIvvBTb4r//mj3CHq3RcDYF
	LFqowAReZ0Qi6FA9YNZbCOmem8aAFJ1SzGQW
X-Google-Smtp-Source: 
 ABdhPJy+Y3pvMBht2HV2OBwNlszGObqJGBm7fs3BDwz3/bNux5Y/EbUuUHMcqkmbTOrQo5jZpiDq2Q==
X-Received: by 2002:a05:6000:144d:b0:20a:a188:7b28 with SMTP id
 v13-20020a056000144d00b0020aa1887b28mr18969003wrx.643.1651002411846;
        Tue, 26 Apr 2022 12:46:51 -0700 (PDT)
Received: from matterhorn.localdomain
 ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a05600002aa00b0020a7cc29000sm13833124wry.75.2022.04.26.12.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 12:46:51 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sanity: skip make 4.2.1 warning for debian
Date: Tue, 26 Apr 2022 21:46:18 +0200
Message-Id: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 19:46:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164881

This is a follow up patch of:
ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)

Debian10 has the exact same version/sources for make as Ubuntu
(focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
https://packages.ubuntu.com/source/focal/make-dfsg.

As per the corresponding changelog, the patch mentioned in
ad5829aa1f8a, is included in both Debian and Ubuntu in make
4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c385d92e8b..c72a7b3ed3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -470,7 +470,7 @@ def check_make_version(sanity_data):
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-        if "ubuntu" in distro:
+        if "ubuntu" in distro or "debian" in distro:
             return None
         return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
     return None
-- 
2.36.0


