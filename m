Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EBFC4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.52977.1699715019522856763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bi0mqTAO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc29f39e7aso20639815ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715018; x=1700319818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoQYmkKbFuL+X2G2ota++Axb2enhm9OWpjYjt2vqt5o=;
        b=Bi0mqTAOkk9vYdqxFMTXr8boI4Ku5niOVdN7zTzDb6vn9d0sA8UWxf7GHrj9ok9Yau
         UKa07DOmgtX3Xx7izyTrUXzhbUQr/Q35scaVNL6hLtuwHu1Z9kdbtjH918OrSY/D0GFu
         kHX0GNW95dsRfUqeqXczom52+m2Q+we+SiqjExnP/rnB425nrwqoMzXVyoQ3N+zhFtLi
         QmnLAX03PHPo3Jhqz/hUj6EoS2S2ICMDZkM6GpX1X+iFf1D2bZwt9egm9tG8VRhP/hyO
         3yCbb1u2XjppWn2hRGsvkOlEa6c/EWidX8TLxQZn3VPn1UTW11laaMBBb4tsgQunlvzN
         GRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715018; x=1700319818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoQYmkKbFuL+X2G2ota++Axb2enhm9OWpjYjt2vqt5o=;
        b=faw0y2QItRhrFJ4JzGoacwg1NcIBcNMJSnh22h4l3T/JvRH5o3XZeh3C1A0cywGAvS
         VaAFdPCEbZ3mRVa6zITT05q7ceMXVr2MBWoYkM7rYe196tNp+vqIfLVC2NHAByCeljC6
         7nymBRo7SayHcWt5e1xWLjtnEE6vG3lSsCHx/9V+VKnmtHZ4pzoKHQt8nT2srVnhiQfG
         516wh4ZZiuDQRAaNV+yFPDwAss37UFQaM5khyFS7vs408F0VyxwTCv/zGZn6uinM7B66
         lIcUwPxActP4oJKYBsycspUZYm1Ggsomb+3W6mEoDmH/sutW1iePB0yo8AiXURXWzP32
         oVxA==
X-Gm-Message-State: AOJu0YziEpCO4rXIDidPBTJan3ijKp7zUiihq1lCHw1fNnt4Pejg1WuN
	vuO0c8N9DqcrZeIi1DLBwNRbFdCTYq8YE88dIoSujA==
X-Google-Smtp-Source: AGHT+IF7/p1O7FrDGmuyEgoKTgP/80RcY8w+YQCbOE/VSMl8OyCSqeSgD38RcnDFa8/rSYkyiv+bLA==
X-Received: by 2002:a17:903:26c9:b0:1cc:2eda:bde6 with SMTP id jg9-20020a17090326c900b001cc2edabde6mr1419072plb.34.1699715018239;
        Sat, 11 Nov 2023 07:03:38 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/15] lz4: use CFLAGS from bitbake
Date: Sat, 11 Nov 2023 05:03:03 -1000
Message-Id: <24b9da1a2332dd1dbc80006e36af693ed1161ee3.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190429

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Currently lz4 uses it's own defaults which include O3 optimization.
Switch from O3 to bitbake default O2 reduces binary package size
from 467056 to 331888 bytes. Enables also building with Os if needed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abaaf8c6bcd368728d298937a9406eb2aebc7a7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 0c4a0ac807..c2e24b518c 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.34.1


