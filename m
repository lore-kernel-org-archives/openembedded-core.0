Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E50EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9025.1689690425267173596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=upmf5yY7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso3648667b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690424; x=1692282424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dic2zELmVIDXD1cJG7n49VfpnTb4+RceaHOLwG+kVbA=;
        b=upmf5yY7BUtgrg7prF5zP07Cj0tM2vf0oKLmcHp04OCnrD1y5VQkGgrYPl6YgGwgL+
         pC56P5prvzD0TpXH7WRsE7EwNhd3H27ra5uarhWbS78TxFu3pGrbD2oeOn4O2Wa6H8eM
         c9aDW4Gb4CyujwlWYKiBzcr9nokBh6Pfk2sm3b0MVilSfLnb7+MS/+I/dZKngyfKtFIC
         WPFHiAngWQCADN/rwjzKiJCr1rJRc5ParfmWlmx0URDMsMMSICh6JvXNE32+b4BrsKQy
         c65M82BFkWxJtpEn3C+QPFUKkyZfhDu5FujUXGXF2JxON2p3GQjXD2CihlhZc1ntsnsU
         MtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690424; x=1692282424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dic2zELmVIDXD1cJG7n49VfpnTb4+RceaHOLwG+kVbA=;
        b=REKPxH/ijZvOxLqyymkhlTpzCrjmk0orA7HGbmLq7hSqmwwlrdqk6Nv2+WJSD4RPvc
         4ZLK5P016IdvK9LR6sgH80RdyM99rc5z+sMBeK9edtOVGCkxPFzmAsmDbpz82uE4Shhx
         IKtRvwPNHr0ONKj5/RzkzPhyOK+x9aP+MhpxI6AKRxMJS63iK6deIEgCpZqieqvQNfLi
         hzRr2VszE7Mt4psr51Y134lCs3KxP7g/Q2frXN6wBmzwcXZU5nBX8gJQexx40FEc2QmK
         Xai79A2cg69vgDcYGDbz1Gby3B/Fo5vgU++vfPRaMjmAqsMP7IT4vuZcKLPi8Da9SiqY
         6TOw==
X-Gm-Message-State: ABy/qLbkUEQipM+S0IpEyApz+amd5OVV2io6PeSdFyFBOhi0515LCnnM
	kGbAqx3goV0qgNLI8b3O6SKl9YNOsDxLc1Vet5w=
X-Google-Smtp-Source: APBJJlEjzjbHmOsHi54KjHOiyz6zRr9iXJUohOOO6tMPSK9fehYncWNjIChTaDmzLUle+RYxv0xevw==
X-Received: by 2002:a05:6a21:32a4:b0:132:cb97:83e2 with SMTP id yt36-20020a056a2132a400b00132cb9783e2mr13853167pzb.50.1689690424280;
        Tue, 18 Jul 2023 07:27:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/27] bitbake.conf: add unzstd in HOSTTOOLS
Date: Tue, 18 Jul 2023 04:25:54 -1000
Message-Id: <5cee002e34d16e9d82045d3e8e3931ba046403d2.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184524

From: Alberto Planas <aplanas@suse.com>

rpm2cpio.sh can make calls to unzstd to uncompress the RPM payload that
conform the cpio file.

zstd is already part of HOSTTOOLS, as a link to the system installed
zstd.

This patch add unzstd in HOSTOOLS list as a non-optional binary, so is
available to rpm2cpio.sh when it is required.

Signed-off-by: Alberto Planas <aplanas@suse.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bff58d337890e804d33d7decbaa46065a4d3bba4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8ef4b00d08..290dfda6c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -523,7 +523,7 @@ HOSTTOOLS += " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs zstd \
+    uniq unzstd wc wget which xargs zstd \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.34.1


