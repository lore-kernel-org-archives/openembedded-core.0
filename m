Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA041C3A5A3
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.4311.1667832952776316372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VBzJFLpD;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id t1so7036831wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51o3sgWIk9kqmbsS6smWXQdiKUkLpc62Z3V5c8CvMhQ=;
        b=VBzJFLpD/en+dBrh7i/6otCbrhynD+1U2wmQrWuP4HZ6G+wqOC9zenwkdiJHJi6y1A
         dRmtmNOruyt5r6kAmq6vbiO7yKWnyraLN9ujRd0DZmCUsjqS40SVTZmtrCJv5EYm/D3B
         o0K6gvzpLGYWGZbHv8k63kI/FaPrdORd0TUOW+ZfBuQGkLEfslHazvFvbkDGMYUOrN4S
         VK6ckAckL53nKVi2dnmYyGY2hqvxY2V3siBqxGgztJfzTFGjZjbVeHWwxu9ax7tHNBOZ
         uWbHpW2jqZDnOAqatUOHkUDsQWnDZE65VbFwkoX3+NsRslB2aGfz1TZldqwH9sXgOh5n
         r1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51o3sgWIk9kqmbsS6smWXQdiKUkLpc62Z3V5c8CvMhQ=;
        b=IMAc57BoWdD9btdEE9/zf5vG7aLp1PGA5098dS6FuZ2awIaHBon4q+4MA/a7p/Alle
         GL3bxHcjObi2RkJNhjeqqZm+1r/+2Q8fqj7/nXd/Ms2DZ53ZDi3uaUdsTZk5kumU8jHX
         e4jt2JrfzcRqkBH9eqtGPF5sNQYJiKT8FtFtu6mNjVERyCfjS17xpRjqs86X0P8k/WMf
         nTuCN4rlHXCBrehnAMsXvfhBzoZEkenVYQ4lC8yu+vKXQ/aWSsef4IHc6cFh0QrmayKJ
         p5nBIp1U/aQiBiURXHvJ8MUbOtZJNQvXYdnqRsKWnX2eozyeWwO3uV7YtwBOKe1MoCFK
         h7VA==
X-Gm-Message-State: ACrzQf3BNStWqFiJ88Yec3e2feCTStQb09cTbAhRasmUJ38Wda7J4kv0
	5lcMmY5VLk62OgQrcToXKwbOPeLEMhE=
X-Google-Smtp-Source: AMsMyM4bWGGlr6BTiEaE4f8OmcQ8ccjD82WymBR0F4QDpAUIhXBYpoQitTRLMyBntrrO4zMRRVDdCQ==
X-Received: by 2002:a05:600c:3d13:b0:3cf:4d63:243d with SMTP id bh19-20020a05600c3d1300b003cf4d63243dmr33733270wmb.24.1667832951110;
        Mon, 07 Nov 2022 06:55:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/48] mpg123: upgrade 1.30.2 -> 1.31.1
Date: Mon,  7 Nov 2022 15:54:56 +0100
Message-Id: <20221107145508.1051404-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172886

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.30.2.bb => mpg123_1.31.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.30.2.bb => mpg123_1.31.1.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
index f40bff1ff6..11ff5dea92 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "c7ea863756bb79daed7cba2942ad3b267a410f26d2dfbd9aaf84451ff28a05d7"
+SRC_URI[sha256sum] = "5dcb0936efd44cb583498b6585845206f002a7b19d5066a2683be361954d955a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


