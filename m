Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D353DC54E71
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:31 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.34081.1710728543475423017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fu9k6gtR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e69543fc1eso189905a34.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728542; x=1711333342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCBtKohTZylOy9H7C1WiZoYja6Q8AeZEkWVkmtNQj9s=;
        b=Fu9k6gtRcFHQ7gO86XPiEpAxLci5txAyptNCfD+eBxeKEFshBFhYEEPYU41RerWyCI
         DlvTb+/6O1DrihtirFycCrhF/V0NUZlHx/w/uSqgpyMXbwZ8b8HfA1CrsqIw3xV6XnOK
         Z/qggdnuQDq9GekDkBQ8kYDKboVX/udAJgKtvoe+QoVNAMSvaReSekWW5+QoBhjaiptC
         qxgtXIE/zAxnNOBnU4e55d9o9XdY8Ak1t816afNnxF8xhKxm6IHTUJ5k/1IxyLOv33ew
         /LTwgu2zG8JGk1kah2CFxy31f0unn7V5wejLPqicc2YbgzRReLCwg46VaufzZvdIqw5i
         VtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728542; x=1711333342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCBtKohTZylOy9H7C1WiZoYja6Q8AeZEkWVkmtNQj9s=;
        b=W3o8NCJ8bgXOedPuv0hJCDbrmzBH8F4BD929/TC/ojo2loHZBK1Q41+cZbWB9Y2l0n
         jooP4tVVtHPXbpQTc6hTzCOG7eZ6AZ7yQUe9NKFcQ6qlgFsTRas9ti7HgK9MWv8vosQI
         whagpGf82gS0o2GV6p8SBKRmYZ9+i3GSWoufX6o1RnYZ1lRmItY48R/o5tYTzj4Q4XYB
         yAjENF9LsfO7rd3ThIF2pQhtkgnf0lbkhvoquz4s3KAwtGY09mn8JLDRNQnRSk/VKEOf
         +9u98EzUB8cp5uDNl4/WoV4fa8NWznQpHu18dxqH8Mrgc/mej0DtYKZxy1Ov3M2cTbMP
         1pWQ==
X-Gm-Message-State: AOJu0YwrBM6O2IYUDTYHVs5dWgEc7xNDNDkz8Kh/gjZw3MT+8EMBn1TX
	MM0OJkDfqrrbEPN+ZO+i6YvEnbzXfZxZz+8JY+ODoPeFL4+Bb4yeO8/sesnFzzjzP2UVy9t28dI
	kbovgQA==
X-Google-Smtp-Source: AGHT+IEdazHtNYpRGPVEJ21l/MzsMr3quk+DmBSfYZ9oaOFO4nAs+IwwxYbkFfn7MO7yJuPXJiIg9w==
X-Received: by 2002:a05:6830:6e8c:b0:6e6:978e:26d with SMTP id ed12-20020a0568306e8c00b006e6978e026dmr365829otb.9.1710728542735;
        Sun, 17 Mar 2024 19:22:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/14] tzdata : Upgrade to 2024a
Date: Sun, 17 Mar 2024 16:21:56 -1000
Message-Id: <e0f18bb696dc7266befd2fd6c46062c9d6a7ab59.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197287

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5abbd0abf992ce8d11f3ae31fb1d83d97f5319fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2774e5e730..4734adcc08 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
-SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.34.1


