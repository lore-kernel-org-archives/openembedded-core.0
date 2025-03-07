Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D814AC28B26
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:58:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.11556.1741355936249558004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tvM6IjyG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so3421827a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741355935; x=1741960735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=tvM6IjyGTVmHZKQ6M55czOWtbudE049h3zBs8Ia3Yf8vOnkhEwepm5eirKowW/vvg7
         PtXwJ2h+z2beCRqKEXEACawzHmsDWaWpQHkNvDLvik5WPsKtnTIxsNqG1h1RuuSlhJFc
         zdUE9DyEAQX657x8lkuZl+MUWsj6r2hQy6FrTA/aSSwBuN1YSaAxPX/KmdCPN/z1hlxr
         6MuEDq6asiURy/Jt5cujRrAh1VLz6FHcgD2syss8AJaEvdm8BjPipqrTFkGXMEE2V3jP
         5o3zy5Eha/wHepgwZ6oJMl6g58dpzjRnMA2En4C7xtme1qoyOY4VKQM0vwRU6ozhgfxp
         8P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355935; x=1741960735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=PcW6iuoharq0fxk+cE6CQuYCh4yusnXkejQ5Jcj2PbItUQkMqbsM35r4bbxQWyUUsR
         ZtQ746rHwBOMYk/yfyEmcntydDaw0S2g6IomfwtD9YkqCptr7sbyydW92eqeKo9SR8ko
         QVAGy8+7pz9Jh6UJQsRsU/YkfI/mgMfpVXQh1E0+xmSocNIx9/S8Wxf2Gmxw/azj4ykf
         vv1xnxcACLar7lMIhHEYvssrxUD2JXXl+0I8OIrAqynaJAlMqrOaarAd/qJD07BoEBMt
         38k7pJQaxo8S2PAC6HI3zhsS5Hp6BglLRAtsCQcx01QVHOThTViMcnnV/dUMXybfbHmJ
         BK/g==
X-Gm-Message-State: AOJu0Yye69QiqfbQxUn/YejVC/nYdTYLaAABJTD5IkWFzefIsHnd0cia
	bWBPORkZxzrlf5Fqfrsa9bYBShplifhp5/HtV6j+Hv8xpjctnRqIw++WstWjxpKNeMBkYevyFJt
	u
X-Gm-Gg: ASbGnctb/1It5W3m7hZ7ZOD7hkN+qwO7kfScSnQ+UwdZIbl2GwZdDTJff3BuNXqUo6I
	uQRxXF5aOqd05s6V/LuhoA6bQuMtv1Nfby7AAEodGyqBGsKJb53qL09nw07qgaPv2ovkx1aoDbX
	xFwWLCTt89T3n4Sd76SOVTs2yVhihGzotc/N8v5KZU96KaCxEsVPWGslRJc2GYBir8sUIGio+R1
	yAiIbvkfZWTmcHWtGkjQ0Mh5xt0iY53xuoramt85Ag7vDiBAt+w0SMKRn45hxpwvNwY0ovdZ6aw
	sTPxV77tCY9xU7Ox4wWptqrccm2gwooA6CQl
X-Google-Smtp-Source: AGHT+IFXrLa5R1vNTTLdmdXK4lUZfMEK6WqziY0EWgicJ8a8nwlsxsz9Z2wRcXd87HPkexf/uoT8Og==
X-Received: by 2002:a05:6a20:7f92:b0:1ee:c390:58ac with SMTP id adf61e73a8af0-1f544f3dc31mr7709453637.34.1741355935504;
        Fri, 07 Mar 2025 05:58:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfeesm3230656b3a.77.2025.03.07.05.58.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/4] tzcode-native: Fix compiler setting from 2023d version
Date: Fri,  7 Mar 2025 05:58:40 -0800
Message-ID: <7adb3079430af789f73550eba2da2495b30e78a4.1741355808.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741355808.git.steve@sakoman.com>
References: <cover.1741355808.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212442

From: Alessio Cascone <alessio.cascone@vimar.com>

Starting from 2023d version, tzcode makefile does not use anymore "cc"
variable for C compiler, due to Makefile refactoring.
Replacing "cc" with "CC" fixes the issue.

Signed-off-by: Alessio Cascone <alessio.cascone@vimar.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3cdfca5ef84ed2054faef9abddef3aeed930e17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzcode-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index d0b23a9d80..dc9f076377 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -4,7 +4,7 @@ SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
 inherit native
 
-EXTRA_OEMAKE += "cc='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.43.0


