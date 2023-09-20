Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B5BCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:47:40 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.30729.1695188857337009276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4MAGSVx;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68bed2c786eso5612579b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695188856; x=1695793656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZXDAkj5skCR3oTQl1peSdLckwqjCWRy3whPOIppJTQ=;
        b=K4MAGSVxcfMgvfJRrgZtJcKZK+v6u+dJemQ2iFQR2wO2H+RgMhyhT7tT5YmP9TJ0h0
         fucjVu42Nh1YRvrjShIun/uF2Jto281DdlnOXaXGHGsaBP7X21FnJEd+YPdiNgPTcSSM
         AJd0JdfQhLVnQTe3YrX9u4VUddzhGMPz0z+pcKZjmqGukNsJ7d+rouCAgYe0rxL1qCZV
         p5wpL7RyCfIueGUgF2pdS/npfULfdvL9sk2qIbXlTOwqDTOcP8kBqXxGkGo+jPmO6d60
         lRrBL2FpermdEQnR1k58NdtaMmAv+tUc10VXs/zJUfaQYzM6qk29isiNZ1BWsS8C42Az
         ZChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695188856; x=1695793656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZXDAkj5skCR3oTQl1peSdLckwqjCWRy3whPOIppJTQ=;
        b=ploi7lvpycqKxXPMzkPP63eXVnxDBUKr2eJwGbPeD1miciRmnrSrlJUKzRb6c/1lho
         pO2TaNTiMKF86oPXawh5gJ4cv1CZaviEiocH4H3syPbT0MoOmqOEd1pwmhTW9HzK/BU5
         qrmrAbF5IfIL+xg2N9VukcOD4gcsButozPiyzHNTTFuLlep3hRWfn+wlt5Iq7pK9mxv6
         oQkILqX2ImWZTqNkd04e6XjIu9Tiy/WimjqV1DD+Q+HML9FBbeqiqdP2TbDVND5mqHWn
         jhhnlJufP4prOF5eO+2wcYOl5Yuk8oENiIGBxQ+vV+e4rTUC+HqR/neYcTdkbI72aOkG
         0N1g==
X-Gm-Message-State: AOJu0YycFnSKqK3xJY0W7TRRoBKEkqZPOPnk6amjkVGE1XJTc6BLEssW
	0j4YL5yNOAd1ZK7MMjG+ZdZJeueRIcs=
X-Google-Smtp-Source: AGHT+IF7OUkXi7uPbX2pBanqH9dRGbOgxJWGWv/xGYKtjd0g2bZdbPRBIHXUhDCXJc4j6MFWNhmfcQ==
X-Received: by 2002:a05:6a20:a10e:b0:14c:e8d4:fb3e with SMTP id q14-20020a056a20a10e00b0014ce8d4fb3emr1893220pzk.43.1695188856534;
        Tue, 19 Sep 2023 22:47:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f7ca00b001c46f1e15edsm5563288plw.271.2023.09.19.22.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:47:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gettext: Disable error_at_line detection for musl
Date: Tue, 19 Sep 2023 22:47:33 -0700
Message-ID: <20230920054733.2852549-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187893

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.bb
index f5290ac0e44..91db6627748 100644
--- a/meta/recipes-core/gettext/gettext_0.22.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.bb
@@ -53,6 +53,7 @@ EXTRA_OECONF:append:class-target = " \
                  gt_cv_locale_de_utf8=de_DE \
                  gt_cv_locale_de=de_DE.ISO-8859-1 \
 "
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 PACKAGECONFIG ??= "croco glib libxml"
 PACKAGECONFIG:class-native = ""
-- 
2.42.0


