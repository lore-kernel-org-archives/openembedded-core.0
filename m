Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29F2EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 14:28:30 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.41194.1688999307749804476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 07:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=0TDG4TJ0;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76714d3c3a7so464666485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688999306; x=1691591306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKVERhI2y8W1jGer6IqIW7ykBr9bHoNGMNZMhXJL7mE=;
        b=0TDG4TJ0tLgp1meWsDyNMlvKKpoI07l0pL4ARMP/W8m2GuSim70pFvFPO0L7DoT3Bl
         aBnzmzOncXJ5fQ3dHcJdPaTaHE0mIf9f3/ke8XzTw+NiINhzctXwoVrzm+h2c47+0R4d
         QH7+WQ3yuzTwt16rO8QbfvjiI/uZvXp+Hl8QfOCR01YatDN+wDG6yTAi0uNPTF9hA7zi
         XRgiEnzyTF2kmgndMYqMvVvOh44kcINsA4DP3D2NA5mgjhHqQIWBFF3DpO6rVUFdQAjm
         FdhYvype8t9v4ckrDGRHV8kGoGUh1/cHlxQZM37CKXFuI8sjLat6xjTG/MwCR04kUIEc
         WBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999306; x=1691591306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKVERhI2y8W1jGer6IqIW7ykBr9bHoNGMNZMhXJL7mE=;
        b=TpjxREuRBhf+yAm3RSJxxIpThGLwj/KhIyCKG9NoHS+Ti/XClVd9Oa1gJok7Utt4sr
         cXvPtC/F7KmtegFFSrAzCnfGyEYOs3yHhncQIw+7EX+hcwRi259dSAf4twRu3KKUu8BQ
         CDU/BMjpGwmCc+rw0LPol6n7s3DtUH00Kq+xI8V7Kd25V5DW/qDPel8sX5ZzlHMI1E4v
         //daLX/QItYTBryNwZD0ht0eIlHL7CfsFSV5nBjsrHwLM94b83pZImw3Tjz8fVp3B/ID
         fLsBepVUqsVkcQKCnW+1iXCpbDGskdaJOkhOlsrwwvwN/kKEx7xTbTmpavQZHfH1LltM
         J6fg==
X-Gm-Message-State: ABy/qLbwGmTnsuONFPh+XtiOFQSDkrKndZbneS9Mk4F5PTFT2ekjvf8y
	6q1axFFt4busgwtIiz7p1BpLwZ87dBP4rGq+hZE=
X-Google-Smtp-Source: APBJJlE3jkDs7cqnybldrIr5tFQ2dSzZKHar8qWsSp5CKMnuhjTn2F8ppRe0EPNvizPXU20rw+DmTw==
X-Received: by 2002:a05:620a:6597:b0:767:17a0:e83c with SMTP id qd23-20020a05620a659700b0076717a0e83cmr10395547qkn.70.1688999306369;
        Mon, 10 Jul 2023 07:28:26 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b0076772ab6937sm4869362qkf.114.2023.07.10.07.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 07:28:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] diffoscope: add missing RDEPENDS and alphabetize
Date: Mon, 10 Jul 2023 10:28:24 -0400
Message-ID: <20230710142824.1646924-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710142824.1646924-1-tgamblin@baylibre.com>
References: <20230710142824.1646924-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 14:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184078

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-support/diffoscope/diffoscope_243.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/diffoscope/diffoscope_243.bb b/meta/recipes-support/diffoscope/diffoscope_243.bb
index a73ad6da9e..5cdc2caf10 100644
--- a/meta/recipes-support/diffoscope/diffoscope_243.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_243.bb
@@ -14,7 +14,20 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "3ce7ff00d72ffd9c904d1d93a4a147208878f56e8f0286073533615689d840b1"
 
-RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
+RDEPENDS:${PN} += "\
+        binutils \
+        python3-curses \
+        python3-difflib \
+        python3-fcntl \
+        python3-json \
+        python3-libarchive-c \
+        python3-magic \
+        python3-multiprocessing \
+        python3-pprint \
+        python3-rpm \
+        squashfs-tools \
+        vim \
+        "
 
 # Dependencies don't build for musl
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.41.0


