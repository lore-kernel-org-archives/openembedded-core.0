Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F29C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:45 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8209.1662560440200858360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mvYphL9C;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x1so10355729plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Ig4zRYvph5JNIUAbdYGKvURniGC86q6AFYA63PtWMsw=;
        b=mvYphL9C4L/FixR/7oZM4cphdbzJGvzpcbAZsdxJ++77+53B/GctQ0Hz8HbtW/bhbM
         +m3tyOElMfYyfm3hmw1gKymRNMJpuqPa0bHPohI+OVdBjhQW5jcv/L84k3UDK8iAz1/N
         v8gM7cbAtAgzD3BPNeyJk/yLdCsa+Ij2vIjXKmjcUJVuBsABGBubFXCtAtxv1icxZvSo
         LUNrkmGVohJnAqKCs8B+siGY4c45GuEr07A8+N/IXDy07Tl7atIWNZyTPgLsBij1WF1H
         sTyB7RxjNHmus91a++YBEQ4ricxrlkDge4/at8Jephs8ThjJpD5L6+P9xEjS9YkShgIu
         2qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ig4zRYvph5JNIUAbdYGKvURniGC86q6AFYA63PtWMsw=;
        b=KXSRX+5HUrVUg4XKNqW+z4/9TClUkPJXxy3DgUzio1a/zXKwYE+LGzK8eKTvQJ3tyG
         3K/R4+rMeIk3KRo+lSeNywYzmcGxRQzk7V8uNwxNQKVxwJnafbqNMBCFXjrz6RvxrAXH
         8XYGHuL8Pyl1RCPu3/v4DVZXvDii/c1RRJ527vB57ioIVRBjXbGrug4gLmr5Roc4EQZr
         K63u2hMJ5jsERwkOdeSSr0fVqb4EW7rQYMn1j5RROhKwqvJzYSeDmkCCtE9dNd56AP1A
         7BQEGmlOTuWlfvyO1liqU4YjvZ1afciK4q9qnJkGuFNvGc8VoEKRgHAo6ZhR/IYw0Y/a
         Go3g==
X-Gm-Message-State: ACgBeo0txsYOlSWfPNFCHdXEuHQS6hWUCiT4BFbdeDqJpBLmMK5i9W82
	x6E04NBW3XN7gwWdJBrECE/RWnTCGoA80xun
X-Google-Smtp-Source: 
 AA6agR64QnbLeSSb/WvsUWmhupoJ1cU80K7v46wTeoDp0LBCfg/68hEyxBW7yRE0xPFDdopKD/uYGA==
X-Received: by 2002:a17:902:a502:b0:172:5f2a:9e35 with SMTP id
 s2-20020a170902a50200b001725f2a9e35mr3853331plq.79.1662560439148;
        Wed, 07 Sep 2022 07:20:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/24] sqlite: add CVE-2022-35737 patch to
 SRC_URI
Date: Wed,  7 Sep 2022 04:20:02 -1000
Message-Id: 
 <f28dc527d4a3e3aa6ef2b446e863264c0e874fa1.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170396

From: Chee Yang Lee <chee.yang.lee@intel.com>

SRC_URI include patch introduced in oe-core commit
fdc82b2314b580c0135c16b7278ebf8786311dec

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index d56a3a0209..628f630657 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -3,7 +3,9 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+"
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
-- 
2.25.1


