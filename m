Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1858BC001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 16:41:33 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1373.1689612087840473400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 09:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=a1fBqF4p;
 spf=pass (domain: baylibre.com, ip: 209.85.167.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a412653335so2854274b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689612087; x=1690216887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyPbyhxdk3Ua2yFWeyB4xwNwf0t09HEG8Z3zDNdIgRA=;
        b=a1fBqF4pIxD+Hi1HnFqSTrHl3yM2RJcTIg+fYeqEU1LAAldGYgm4OADQLm/x+b8Hn1
         u7At+ud5/BkqG8QpObW4a4RAbl4U9IZHzf9Bv9H90DIMTonxy1xCpnx+9qt5qta0D+NP
         u4EsxWxjLC5Ts6Mq3eg1aQrYg7KvjI2RZy+ZxCaQrpCkwAncEAm+3aFJO4ZUsKWXjI4C
         gzKvPE+sobrVoKkrTXTz2f4CUMUpNNsHC58I4LRf3UUztfxxfjtuRWA5Qw2hi1UmhAoM
         z+FjNX5mn/V5FkxzXaVw3N/+G2X55kuv/qp5bLlo5gghFP7mLVo28ejHHqWONRl0EByf
         O4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689612087; x=1690216887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyPbyhxdk3Ua2yFWeyB4xwNwf0t09HEG8Z3zDNdIgRA=;
        b=lRinQ9dHkMUVCG/jzKK3+hRRJYMkv994rlvQK3xlS5flO+gcl6U8uBE+MfEDDBvIAy
         MaRdermr6xmAxy+3fmtGR2nt18LNjWP0NMjPVmfbNYxR5M1QIIeKR+t5/7c+Rn6XnO/W
         aYX7o4r9M0G3ITv7Cq9yRXfZS/NKXSusCiyGudb3fbsgrP+KadaLY3s6nVijEjf+Kzxy
         w6NNz2YqnYj29stUn7rw8G5z/ZQQjwEIlCJip5podOOISwrO4KkwLUNu/Ar6PPcldFQ6
         maT1DFiKzxzlXmktEpyET1Syfdhv2nJC+0sLmSyWi2Y0FxR3kR8scq4yoC7rRGjzHlc4
         x6FA==
X-Gm-Message-State: ABy/qLZLyQ250VJiFK6nRHK0Hynd63RGfEW7xXnV41jc6C4xyM/R3XxN
	9p7tUvIdns4khnufzub4MBTJ+UK76oM8mNdf1d0=
X-Google-Smtp-Source: APBJJlFPa59nqlWevkX3l59qfycT1i9MyboqVR104xcFy1PXfIl0o/cbwCY4VUT9HD2ugndAYhCPlw==
X-Received: by 2002:a05:6808:199c:b0:3a3:ac49:77dc with SMTP id bj28-20020a056808199c00b003a3ac4977dcmr13682409oib.1.1689612086984;
        Mon, 17 Jul 2023 09:41:26 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a24-20020a0cb358000000b0062dfdafa0b7sm9189qvf.136.2023.07.17.09.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:41:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-dtschema: add python3-dtc to RDEPENDS
Date: Mon, 17 Jul 2023 12:41:24 -0400
Message-ID: <20230717164124.1026028-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717164124.1026028-1-tgamblin@baylibre.com>
References: <20230717164124.1026028-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 16:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184476

Also reorder the RDEPENDS to be alphabetical.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
index 38ff2714f2..0c2c156ec4 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
@@ -10,6 +10,11 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+RDEPENDS:${PN} += "\
+        python3-dtc \
+        python3-jsonschema \
+        python3-rfc3987 \
+        python3-ruamel-yaml \
+        "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


