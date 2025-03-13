Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56885C28B2E
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:58:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10302.1741856327459913873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SnAhkwLf;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso5934995e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741856325; x=1742461125; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=SnAhkwLfA9RILmda6rB2NQZQUf2JY/c4PE4ZSJLvQSpNCrXPhcERB9YOc98ktzLzs5
         ibiOYCmsNR1/czm7yXkJehiB0ugnQzz/i0EgNfmA/pMhup6yIf5AoXVZ8ARxu52vcqeb
         7asbb7Vb8hUXMYSiwsWDjgFLp35FKjpVFC3kQ1m4qBXm4kar642/4F8XgC/FzcdRvnn1
         3RY9xFqnxiwbCkXpt1uwAd1FJei35iAVNmFCEoxiaTBbN+k/q84vVNYCoGIrbUvjhx5Y
         HLwsGNlnjOhGFL0bt6C5szhTc7h40yim7qrkd4Du4gdrKSWapKOkzhsYxtAtGU9a2qn+
         tWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856325; x=1742461125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=nnhp7rmZFmydiV1xMNFkAQPrmKC+ytTGct3Jxm/ci0QeEF975APo40sfOM0TnkRyYT
         AV9/825XHh5SKISakACZkvY/j7s+CQRFxR7RsXedIIhUvl/4P9k70m8ynfzhvMKRMVUG
         ynqTj3Ej/9g8/PRW6pJ2IOaQvtb2pg4J5zKM/RlKwQY5ytE/1UtDThIh3qKXvvc4Zu7u
         XmRuJGNwUF+W1P2cKDRpRl6tJofhUhMbm+cEOaJUjOzsL1+0VveEEk0xf9kU3JlnR8B4
         acdN3P6U6Th4+v6TpGByatSaXN3ccaOIrsc2Ju6u94APyQMBvytd0cWP0rZV0/NnZZwJ
         X4Tw==
X-Gm-Message-State: AOJu0YwTN4jA+UxtdX+GtxUZYcQKbADtEkBlON4DVjBNfztP2kVNMeBH
	k45fs3t+9DiiviW9LE3jD45ofR17skpMkQeDSzDpSmmlpDcw0m6zd6p93fdF
X-Gm-Gg: ASbGncsYSpTmWjjHFyPoS1vdLWZfMQjaN22W/92UMdgXmit/sjaqLeqPSrDzaY/EsbA
	Yg2p2FZCF4EGbv5OuP483UynDuP7bBcV/yMP+UbsWX1N/lCO8xx+yEMdhrzZNJiHhX8UEWOqCcY
	q62o7hLo9UHdSCq/ozWGjsL3c/A4PIcSNPZMQCg6OSLf+kpK6l+2zpdSpF9EYmMsvT4YLAsXTsU
	zyTiFdflT8IkvIPcA9qmis1qAGGME+1MDJRsQ2AwmtGinRJ2LsF4fM9ner3YmteHOdqM3xkvQCe
	Yj5ZMxWEG3jCn7sQSsjqvIfnQ9CrCnDEtg/NrvPXffnpjjIeg8xueo2KkpWZp1cjSs60qhRzEMD
	+UjeYIIlRTc7xQC9SMUQYXQ==
X-Google-Smtp-Source: AGHT+IH5PEe7wSsUcLOVGLF3v5VBFB/IORNB1udIQBhNkBQi+tXCgQWPx9wtGYwxIYg2kc++5g1/WQ==
X-Received: by 2002:a05:600c:1e8c:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43cfc0c92bcmr142887905e9.2.1741856324977;
        Thu, 13 Mar 2025 01:58:44 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c2dasm12978845e9.33.2025.03.13.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:58:44 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 08:58:36 +0000
Subject: [PATCH OE-Core v2 4/4] eudev: Drop --output=... from kmod call in
 init script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-upgrade-kmod-v2-4-2103ca9a26ad@gmail.com>
References: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
In-Reply-To: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212753

This awkward invocation is no longer required as kmod just uses the stdout file
descriptor, rather than explicitly opening /dev/stdout.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev/init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 477a525b21212ad72d2661e27e1218fca9fee5db..790cd3b9339b6334dbab1feaa65f8948d72c76ea 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -27,8 +27,7 @@ make_static_nodes () {
     [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
     [ -x @KMOD@ ] || return 0
 
-    #output to /proc/self/fd/1 since /dev/stdout not created by udevd yet
-    @KMOD@ static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
+    @KMOD@ static-nodes --format=tmpfiles |
     while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
     case "${TTYPE}" in
     'd')

-- 
2.25.1


