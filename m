Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10CCCD492B
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3185.1695249080463097151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vPWLSwG6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690f9c787baso240578b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249079; x=1695853879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzK4Yu8pKLDXuGsyJgK1k4spjRZUQakBENcmzlcVW4A=;
        b=vPWLSwG6/wOOOhsr5c0QjEgNo6RdDah/s1fp7LilyGhNXKS0P4D+qg3NIMITMrl03S
         biKuwj0XefA3OexpSm8GHqKXz5JmcD+FUgkvetoLxXPCUNHhWx3c3TkbiSNZfDbW96u2
         vv25t3a36rycEzFyUdQgMC0/V+NlOgUuQEa1EHZK/is4VuKy4wX5c96VF2d1x39ScbLU
         PNKw0iU4iqMhfC3o8w8Ud1RGAKqCv9/BvajmsFn//C6JAr+efkrulsr5r0M+NF1n0GWu
         fcZul5aMWjFkRoprqAwTvicy1ZwoaS8Sk3Z/dNDGoMBmEE/HAfYeBU2UI28p0eBiCGvD
         WAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249079; x=1695853879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzK4Yu8pKLDXuGsyJgK1k4spjRZUQakBENcmzlcVW4A=;
        b=S+uxE8Sh06+aKu9NLRi7KRvDXX42HFOtl9j91dKYlmUJ8f/+F4rTPPhu13+SunElgW
         WHBEyiUYQ4wEmpZJL1FH0zhswlfwNwqRAG2cRuRP/ki/Lrv3/Bp+ix1Fjg4fo65oggGQ
         N2NodKggdbJtuvsbgawrlmYqT7qhsftClrnW7Cj5FQxxc5CIROdQaeaGWLs9ywy+x+cI
         dQIwEtIoLzTw36ojKeJr2+dym3Y8e0PfQgRJFufDKiNVkWyjM1ycnnZmD82501YIUkgE
         152S0cjSY1p6MQDCKnryEErMqYZqqFPYXMsTH7odFywRGIuDYku100zsfpjrjz/67xmw
         Rg0w==
X-Gm-Message-State: AOJu0YzBw2qXcEAGKdJhA4hs7/4VOLDRKjpSDGAy6Ber+AU6wphCc9Fk
	chSxZg2yQPdInr7L/2PZo+F7ror2lKlwmGh4SNc=
X-Google-Smtp-Source: AGHT+IFFU9XJ0ix8SxupUawQWz0fsl1b6AzeNaDVlaKS6k8ceu/mrP3P1N5zJPjWL6fm2doqa9rrgA==
X-Received: by 2002:a05:6a00:1a90:b0:68e:3b0b:8192 with SMTP id e16-20020a056a001a9000b0068e3b0b8192mr4017257pfv.21.1695249079600;
        Wed, 20 Sep 2023 15:31:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/20] vim: Upgrade 9.0.1664 -> 9.0.1894
Date: Wed, 20 Sep 2023 12:30:47 -1000
Message-Id: <5f78a010a4ff53f4a216ec2ebe9b7a44c5c88790.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187958

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes multiple CVE fixes.

The license change is due to changes in maintainership, the license
itself is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91e66b93a0c0928f0c2cfe78e22898a6c9800f34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8a399cd802..5f55f590e6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1664"
-SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
+PV .= ".1894"
+SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


