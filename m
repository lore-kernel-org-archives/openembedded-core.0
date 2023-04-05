Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849FFC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:30:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.121142.1680661803427752932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=awovqEAh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id le6so33091345plb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661802; x=1683253802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vvVRqvC7jgHP0G0D6lLd9oe0furQGXQJvOFGnqMNbQ=;
        b=awovqEAhA1BiDQDHN85Jxc9xzJ1l6qHi6yvgWok1Q+obyagPlJavZyUh4UFrv1hWlc
         4oVgiPNdymVybqcGouMx7yvdqMXdlGu6YKn8ew5QuoZt4EgA6Tismt4xp/fDF3lLfZ//
         Ll//Dv0JzEi1sQNkEjjfMQM3WgxlWkgty5Vob0MP7ztm6Bi4HouHSwRcBDgRBIems9GZ
         k0b5Llju5hfjCmOG7oaCHlLqtOFWzJvCjB0v1OKsbRU19xVMPZ6xqgjCavKriUdUG0gO
         99dRyMNJ1dBdPvcn/LDXvVWDS4qkO68dg6DLtZ91ydZCvCNyKYTJw+XHKsRGZfGtn5Y7
         8+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661802; x=1683253802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vvVRqvC7jgHP0G0D6lLd9oe0furQGXQJvOFGnqMNbQ=;
        b=pTGfJVjE6dGaZYkuau9gdr7oCRKaFS4UQsmVxvcT2sIATfm1YhFxVsWFmUyNrg+Rzl
         yLQZcPUaBOWW4MvVBD/U57P6JXcC5Paw1n960HL2PCNl2FkabCB4Ik2y4ozuNDYQRwWK
         9zVSsXwwAnjyL3k01A87Yk8bkslR0Y8OXPMY6z7/KjO/Jtf3T8e+wJl4qiXRLJmXEEJD
         9d7c+NOL8Nk8LdB/jSdCbtirJZF9aGLBiRnQVD9uTdl+D8cL53hSqMpmQKmwohLrvQsc
         RbrmgGazZYGdT6avHEo+uc6PU0+jRRcis+U95JEiHIeHQBLqPxMBFojLaEKu9oDh4Sqo
         dzcQ==
X-Gm-Message-State: AAQBX9fEMC/gvwfellU7to9PbUaX90h9YakMFRHHjNEdnhHMnpjP+qoV
	nC1XepD04SzH7oSgpIewvSWHKcJr/anMAXczgiQ=
X-Google-Smtp-Source: AKy350aAxtHGHQHd7tums9xjm/V7+DTTTkHWz1LGmM0Prh/pzbqwWEc0lLEXs9PoJVrFaVUPuvd4ow==
X-Received: by 2002:a17:903:1c6:b0:1a1:cb18:7f99 with SMTP id e6-20020a17090301c600b001a1cb187f99mr985980plh.30.1680661802538;
        Tue, 04 Apr 2023 19:30:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:30:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] uninative: Upgrade to 3.8.1 to include libgcc
Date: Tue,  4 Apr 2023 16:29:33 -1000
Message-Id: <6c58a2a36d9f39c219503ed921f42063727164db.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680661617.git.steve@sakoman.com>
References: <cover.1680661617.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179718

From: Michael Halstead <mhalstead@linuxfoundation.org>

Including libgcc solves issues with libpthread.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7012db441b..51c0cdee43 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.7"
+UNINATIVE_VERSION = "3.8.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
-UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
-UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
+UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
+UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
-- 
2.34.1


