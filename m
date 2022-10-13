Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1046C43219
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.99.1665679040425115657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=d1Q3sYNk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id q9so1998136pgq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sQFI7zHg3r9Cygft81jQbjxjdmuJgNKsH6y+ID50nw=;
        b=d1Q3sYNk6ruftPa7u59aWF/y1tXTmd46eXaWhSZA45Vn0fIZOMqMNif+NY93dLFXKf
         hQu2zAw4VBOXO4Gj4YuqJweTSzcT20XLkCDUDLIU6P60gd1cf8aD3Q24XqQYDRH5EwNH
         aYztkyNM0fdgN4ZD/GfDsI3Gv+JQbBxYg2fwU5vkGAH6KX+AafwjIju+XN3vsyYXN7uv
         aME9pED2FGUZ1JR13qwp1/VgIuhhDRdMNH5VdNm3M41OZn1m5W0YQpoKdRnc1J+LRsa1
         JARXBZQb8jd6Hal+s9rwr+UeDKAUGdBDp2b9fENqAGr+4a096FVKXmqFviZLf30BEyCs
         gaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sQFI7zHg3r9Cygft81jQbjxjdmuJgNKsH6y+ID50nw=;
        b=nAlGorwPG1WAxpRw21U9jc4diKNBzu5YSTBVNPdz6R4IUB/YenOlaBw/1QAEGoJqiq
         brwVtdg+ZLt0ENezLNd0JndC57+4I5tRIgpc21+SqHAH4TWjzv4Vb5jDs6VJdJz3EsDq
         PpouKaB5axZh2ujTF++RBZJ4LfhqRfYiV5GqKCoNFhJGKAs6Ui2hyeCjQdRwreJXGLtY
         fhk8sFkjE9SllLJCku47r9AS90RPhPRNJt9e6MNT70/2pQmCRgkafWTPrk6hEkSJgnbl
         INq5tiXSrVaBqv/qNgD6FLIWhNZBf6S4SCDxX/D4eI46+bw/jI5j0r+88oWIVUzD2li+
         3W9A==
X-Gm-Message-State: ACrzQf10kzFTdJXqi2XX8+PLWRvezsE6XbGM7QIyrlLo3RXKpkJlU4lp
	yCHGcjf9Tr5Cnda2MobErm4+JE3doR1/ZtmI
X-Google-Smtp-Source: AMsMyM4nCwZg1MSR1Qdsfja7BCidc9fgtFXby+G5aq5dxaXxcANOvK91fvbNeQe4rtj7UP+W0/GsEQ==
X-Received: by 2002:a63:715a:0:b0:462:e812:b54f with SMTP id b26-20020a63715a000000b00462e812b54fmr638117pgn.556.1665679039453;
        Thu, 13 Oct 2022 09:37:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] uninative: Upgrade to 3.7 to work with glibc 2.36
Date: Thu, 13 Oct 2022 06:36:52 -1000
Message-Id: <1ca9b676175d7efc72185fed5b09aba40ac0f669.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171713

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.36 version

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 410226b053e14e32add1f9b4b811f84a1c445a7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 411fe45a24..7012db441b 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.6"
+UNINATIVE_MAXGLIBCVERSION = "2.36"
+UNINATIVE_VERSION = "3.7"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
-UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
-UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
+UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
+UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
+UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
-- 
2.25.1


