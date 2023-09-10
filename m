Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32457EE14D8
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 08:26:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.32634.1694334359281207133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aINbdwNw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-401b5516104so36575455e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694334357; x=1694939157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6BOonMfwRjDM63f4qR371Mak2Az8tHOMeNdirnxkfs=;
        b=aINbdwNw2hMk1t7jvedgyAjiB4lYBDo/RqIk9CK+69FONzVUWQfOB5c172YfNG634E
         +dPvSQEoN929c35jWzXgmlI0UE8MZvPK1HkSDTbXLpRvAw6FzDBwGxk7A5mpDmxPa0XQ
         JRAanhqWNDjTalzzEUQ2hXG8/m8eBmJ+f476w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694334357; x=1694939157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6BOonMfwRjDM63f4qR371Mak2Az8tHOMeNdirnxkfs=;
        b=VzfAKB20iB7psq9XAKNXnLdZRRV9X9V/tIqsssKfZkEIs+q6Gs47/Vyj5rnEljA3FD
         a8wk9cUh3oUCzct11H1c/2C4vaqeVUymnM97PF6XxA0HR45UgCq0rii8BDfRjoKBrd9a
         R94SOVzbVhnOHeNjUMqQpz5PKDv/Kjr3R4d6s4KRdWL1LmUor2qWbzSzPlL4u+fm6THd
         WVjmWVFYNtGD4vPx5ldQBinRv5Wx+NgBu4Q5jSkG7CT4Cs64Cv2ifr0wwAJhPMoC1mBC
         j1RBs55WNOGkMIbx0i+PUsdNfxUi5gVUAl6XK+/GFPbJeB1yhAVyNBxzgprGjoXuiVN9
         68yQ==
X-Gm-Message-State: AOJu0Yx5hbJ6iMVJaTijbfpz5cv8l7M8LG2zelwbE8fBHpj8wNxtbn9q
	cndqTYMxRMhov7Ed6BnLD45CAXwyJuqEAmT8dL8=
X-Google-Smtp-Source: AGHT+IEciBwlDJClGmACDF4YmbdgOa36wpr5tXfYKjM1jA0YNN7hQAfwg+S8UhxInIYeItZsj3b7Mg==
X-Received: by 2002:a7b:cd15:0:b0:401:cb45:3fb8 with SMTP id f21-20020a7bcd15000000b00401cb453fb8mr5709935wmj.38.1694334357456;
        Sun, 10 Sep 2023 01:25:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5580:ed73:9c6:f365])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c294a00b003fefaf299b6sm6574657wmd.38.2023.09.10.01.25.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 01:25:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] defaultsetup: Inherit create-spdx by default
Date: Sun, 10 Sep 2023 09:25:56 +0100
Message-Id: <20230910082556.3593410-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 08:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187451

This has been tested in poky by default for a while and ew've hopefully resolved
most of the gremlins. THis is the direction we're recommending for license/manifest
requirements so set it by default for OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 1abb5096293..90b68057ad4 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -14,7 +14,7 @@ TMPDIR .= "${TCLIBCAPPEND}"
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
+INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
 INIT_MANAGER ??= "none"
-- 
2.39.2


