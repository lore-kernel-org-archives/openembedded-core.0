Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417FC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.605.1700498363678163872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vwW9EpKU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5be24d41bb8so3144110a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498363; x=1701103163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrKyqOlYOL06cWz5acqC7XdnCpeaww+W6vd9DmNmHWE=;
        b=vwW9EpKUscJ8P5OwbGe/9lYutMSXZBwGALgNuHx1PlVdnIrGF9+CGtg9CMzdjOCwGz
         VohESsCvJfQVkUe8HTYAl94Udl80JTylxHGa93PxXnGPM1dEItLgGijrFxWPym0II8QI
         rD0MiFBSK+iXhCDPBRwuSS5Up+B04UvObo5DMDqI6aVD6hk69kGWZTO1IrrkpRWYMRYy
         zmvJ9rDKHGzkCzfdnBtBZMleRKOOHKZ58lh/GJSf/HPAZopU/LqaBOua14FNf7/S6uT+
         4gsqbzFDysgTYT+bdpxlxw2RlZfBTWm2M95xLFq8XAUEdK52Lf0/b55h5qnfm+p9LDdr
         m5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498363; x=1701103163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrKyqOlYOL06cWz5acqC7XdnCpeaww+W6vd9DmNmHWE=;
        b=h3ZD+Vi22bYAmQf3fOFk8q3aRHmqM0vc8e86q3hy7Y8SV5tptIVIIqGFJYEuH4RIL8
         GqGK+pfM92gZS7sp51W2PeFpC1J6TsweDasz2onI6zocMNXeT209HXNEX/yltDJLZgdO
         dXi5jy+1/kbzHzc7EIYpBjoE77Cq3UEzNExZhBqBk785kBsDK3BRQTcPdWM2MB4Cfy9j
         GDrSemquDna5iAElEZylC5O7Ehc8YbCai+yqlVF/iAvI5s85OzHUGo5H1jdOFaeHHx92
         W+beav3Z+8xBrKcTVdf+tP/WO3N0R1NioxbBM6WV0GIdl336Og8TPa5+ASphTEEeJ9uH
         1pNA==
X-Gm-Message-State: AOJu0YzoynNdFsykN1DGvRo1yYbv8FGDbtaz8FsozcPprP6fG+nEdahR
	t2T2+3qH9Ajyi6/RVuDIPudwy1EsMCcPBSqEP8x63w==
X-Google-Smtp-Source: AGHT+IEm2aRk/XImfkbfbyFnAGVuL2arTRqiNkkbZcO2KewslvkBDUyGRichWP4B4MOp6nXxgLNxGA==
X-Received: by 2002:a05:6a20:e118:b0:187:3765:1798 with SMTP id kr24-20020a056a20e11800b0018737651798mr19209442pzb.22.1700498362782;
        Mon, 20 Nov 2023 08:39:22 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/33] base: Ensure recipes using mercurial-native have certificates
Date: Mon, 20 Nov 2023 06:38:28 -1000
Message-Id: <667d02c729fe882a414d09f5b4d4279aabd24b5c.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190903

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you try and fetch using mercurial-native, you see certificate errors since
it is configured to find ones in the sysroot, not the system. Add the missing
dependency so that mercurial recipes using the native tool work.

Found trying to make mirroring for old meta-oe stable branches work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc567e35b374f8b08975602609ee71e64357fb3d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index f57f9cf827..ac84312a87 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -634,7 +634,7 @@ python () {
         # Mercurial packages should DEPEND on mercurial-native
         elif uri.scheme == "hg":
             d.appendVar("EXTRANATIVEPATH", ' python3-native ')
-            d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
+            d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot ca-certificates-native:do_populate_sysroot')
 
         # OSC packages should DEPEND on osc-native
         elif uri.scheme == "osc":
-- 
2.34.1


