Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63355C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.13865.1676902758807710705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xTWe4Fcb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id g12so648966pfi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyqWoa3xzLASBdv0OFKUSWEn2FogIu3JhAgLX68lQos=;
        b=xTWe4FcbWFLE+Cg3tso+mKev+/9esdY38VAlkcqQPYdxnZCbn9PR8Eg4E5xuduP8Wa
         Bhv1p8DgHiHuV5+ecUa5b17iuaT5kjzSlAzw3XFDmRqFrTbau9UyGC/Ngsyy8NoZJfDU
         5KsdEYaiD4LxwIkgje5fZQOuo4IaErqWRM6KT3jSJF9y0e0SyT3Ou/QLToxtQiteR/Px
         IL++oIC9CzEXf12EWhRu6274/o6DWnkB4/c7VeHG1qFg34a9NI9/Jyemcz3021/f6gxV
         b6XL8Bowwsvm5Lji6u2Ok2bb1RjEvrfjb98lq5RQMHA9xq/+JNoWczFufoT+fvLouasg
         SBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyqWoa3xzLASBdv0OFKUSWEn2FogIu3JhAgLX68lQos=;
        b=VcEFVr5bVPeSebJkcZgp60uImskWAxxA/z+GhY6eqq8cCbbgYv8rrOULq9hFzlPoTe
         4gUnn3RuIR4j6WxD0tguZ/bDDvLIUfYbrg1CNlei4y3gEbS8ngzG1DbUPlS3EEkNETe5
         yWe3xHFOWp1yFh0gV35LfRf67zxmXskGPgtvoDbn5auxx+daIcMkvChy/EhekGBFDkrK
         D0wKatbilqHYucKlYhh1UY42CUPn9DzLfVW7ZSngfbhnPoiY9XYSS/3t7/4sr3xnzs6Z
         BQY27GfGc9ezOGLZz77voK1B2p6QgoSCwSglMyxgLE2m8JjxT7gn93cn6bJzcp94RIDQ
         /9sw==
X-Gm-Message-State: AO0yUKV0nYyTuBR37vcevAFukr3W3FStNNMEm7lk+vVOnt1yhP/lgfwq
	D1lUkrg6Ni9D5BrP1RYntbWdZq5jONvKaok0IQ4=
X-Google-Smtp-Source: AK7set+RkU8fBAkUKFv7j8dgTSu++M1u1X6HvNFMeYIlxVECOHWmBwn+b5OrpyKoPxMuToSbLHUvtg==
X-Received: by 2002:a62:1d4e:0:b0:5a9:c75f:bcbf with SMTP id d75-20020a621d4e000000b005a9c75fbcbfmr955594pfd.34.1676902757851;
        Mon, 20 Feb 2023 06:19:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/22] oeqa qemurunner.py: try to avoid reading one character at a time
Date: Mon, 20 Feb 2023 04:18:29 -1000
Message-Id: <ab1e3000cee9f5f3496a7e67cc59b2e08a681a89.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177428

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Read from serial console with a small delay to bundle data to e.g.
full lines. Reading one character at a time is not needed and causes
busy looping.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 0049f6757f6f956fb4cc77b3df6a672c20b53cf4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d21b0a275f..1aaba02bd8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -653,6 +653,8 @@ class QemuRunner:
             except InterruptedError:
                 continue
             if sread:
+                # try to avoid reading single character at a time
+                time.sleep(0.1)
                 answer = self.server_socket.recv(1024)
                 if answer:
                     data += answer.decode('utf-8')
-- 
2.34.1


