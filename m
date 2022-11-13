Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC44C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2802.1668348797758512347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1kJh5RdW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id f3so1748228pgc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgFpGZ3Te5RqE1A7psiXjPNMiYQbYjTzSzXPN1mfgbU=;
        b=1kJh5RdWm2/DPQjgOmqMjnpP4Ureiql05P/Yr4QRRtOtOozVxQ190UqSMfW7DzziGu
         ieMSn/NxHFKtD3iV/75VzemWbCHhWNBH3DoKoC4mid7KSu7ky6Z8vYwvXEOHcC7EWbPG
         4reEX3dGxSU3GZNxTiRFej+S+D+p4EwBKk7G0hN0YZJbvLrnmapblsbt8dmjLzo5cAOi
         4h29maciVk+joSha67F0JhD0Kn4MxlNLpdyyYg1iVzGTjf1Rl40kIYqDOCzBMH8R0i/9
         VM4YLMhogQr8PinJAdR0nE4b0n+71OtPr+ZInyWmraAr05x3RAy3Zh3PxsZZt3gz9w3O
         MaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgFpGZ3Te5RqE1A7psiXjPNMiYQbYjTzSzXPN1mfgbU=;
        b=CAj2skMqYbMQ0WbRlWnU3TwCqrkGW1tKJGLkcOcQLD764dOO75n0aDjr97xykOxRpr
         iXVKJzcw8pAjyE7IZ+DGAUxSdPDXs5MPLET4R9On9WH1T2nUbwqtR33Qd4x3BAj4OhMM
         /AcYTfdZvUCdxE8UrtWiWBHF6V0b8keP0ZVRa3okUsdCabhbGEQ22LVaBs5BG8Ro/6ma
         h6wHnYWRrrmhGOkvXe0USftA7Shr4ZF5ipQEqi23vMTL01zAUGXC9gh62rlRf81mTsE/
         SWwRzuhe1QGxKPMyvoLLTxAzcVenvXcjMifyp7HlHcTV/mvKvVe0C6rDLJr1wPu7vbhi
         NbFw==
X-Gm-Message-State: ANoB5pkxqPkR4qo5QBk1rgQZOB+OqPQKrU/NlwKIa8tE5OaT7+PGYkjD
	28pXpK5zF5vXGm6M/HAaHmFPjTU/DqXzkJR7
X-Google-Smtp-Source: AA0mqf6+WzsfpJ6K9D8+/zi+eTD0RCW2uvlOk65hiy16V6GwK9zRR1fGFgp+0ukVXdgIduTKA3GJgw==
X-Received: by 2002:a63:5023:0:b0:429:8266:b617 with SMTP id e35-20020a635023000000b004298266b617mr8919923pgb.136.1668348796700;
        Sun, 13 Nov 2022 06:13:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.13.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] qemu: add io_uring PACKAGECONFIG
Date: Sun, 13 Nov 2022 04:12:47 -1000
Message-Id: <3243b069db7629d15e4b8c25b4133f824d18520c.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173203

From: Ross Burton <ross.burton@arm.com>

io_uring is enabled or disabled depending on whether liburing is available,
so add a PACKAGECONFIG to make this explicit, disabled by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit daee79639c39ac6278855b35e0ddf71e52dd13f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6a49dc53e9..cc9681fb4b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -210,6 +210,7 @@ PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[uring] = "--enable-linux-io-uring,--disable-linux-io-uring,liburing"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
-- 
2.25.1


