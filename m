Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD45CC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:45 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.15193.1638555704659196812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uAnBtnbw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id f125so3934574pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A5obEuKwshNqzdDVagNWFjPScVatytDfgPUaM8XbUyU=;
        b=uAnBtnbwVgK+0JcMzicTlkM3RjUxH0xYfRslHFnBcMQobAbfqMcg/AYyOZRxiQgwB7
         AtaVRoUiRiBlm6lOmZYHK6Kwc9lBd2hmyvkXMqLpkUzlrqiO+/RVe1NWElGxsIzWEySh
         Nw7P/Y30D1dSYVb3QhW2VUJnYmGpfqyob9EK8x263IDXSJ1nQtcW86SdMQhrb85+oP3s
         gCHpnCUMDWvmDMBOYkHDBMlHJOVIb8rF5L4UJVcaS7iaiyd9IqWuAJJSrR9JdylIlcQp
         Ei+qlDZv5G1U+XrJdJ875D/F+liVnS+HTyM42+hUNhXvEGWBUOu901YXfEuDyUOTNUU6
         OZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A5obEuKwshNqzdDVagNWFjPScVatytDfgPUaM8XbUyU=;
        b=YMJniAgBxbDBaKsrYaUrTNOVNXskC+oliYZ2UM15TXASE77cK854VqF9xh7o7CvYEW
         6gJcDFj8d2XOMEYRlzbzVDkhmnyegKUVBlxiqFBEuX7nQMLltuTKjeqMvLFEqJR87Nou
         +fxQrWQAktvhaXhvFfZbkyIlXDYAHXPLX+OAyvRjeOaGRqqtN09+IQ5udsYXbm7SKXOM
         ZYKulK8VwXzv4nIDf/A82SIxpS+F0+TRHU6DY4cOMKkEuKq18h50z5yzbaABU8Chdzs9
         I0WZCm3ZHheL+cjbmuLNDKFIB3DScikId5KgJZKSIUJQJRr6vAj4yJ0F/6q8eHi+hLdu
         fqgQ==
X-Gm-Message-State: AOAM532MpguWz7pY0pg78y7SfDGH29IDU2M36DPmZ8yE3uv9c81/3403
	z1V6i9QeOWTZi4OplatRTL1A0B5oJgHInuU1Kns=
X-Google-Smtp-Source: 
 ABdhPJziLu/dSctpe7gTmv0//o1ExFVfa+2R2B+nh2Qr7BEhmRi2VwShP6LXPbGUuhsE03rdQ7nvKg==
X-Received: by 2002:a63:2cce:: with SMTP id
 s197mr5784015pgs.334.1638555703670;
        Fri, 03 Dec 2021 10:21:43 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/18] bind: update to 9.11.33
Date: Fri,  3 Dec 2021 08:18:55 -1000
Message-Id: 
 <e869ae12dbae8a4a949fbaad30fa77555db38ce1.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159135

Notes for BIND 9.11.33

This maintenance release of BIND 9.11 contains no significant changes,
although some minor updates have been made (for example, to eliminate
compiler warnings emitted by GCC 11).

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.32.bb => bind_9.11.33.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.32.bb => bind_9.11.33.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.32.bb b/meta/recipes-connectivity/bind/bind_9.11.33.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.32.bb
rename to meta/recipes-connectivity/bind/bind_9.11.33.bb
index 9feebe5ae2..8ef8a76ce2 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.32.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.33.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
+SRC_URI[sha256sum] = "293e767e96ac8ef17163e9f9cba52a6d27163807c29c88d36fe6e18d89083a3e"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


