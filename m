Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8253.1615380865468252241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 04:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u9mV+GMf;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x9so27831623edd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51KBRidCgGEzV+YuGLsgWf9Rz4+Sh0D7zyhbDJ4VUmc=;
        b=u9mV+GMfCQCU9Bqd/Cx4Qe8BYzFP7FkS4O+skcQge1Ysa1KDrAtUukEbQsmT4jVG2b
         5ds3t/gIoxLUzGqP/Jse9Bs4ivd7jBhiPnaq+srsNwww02piTqRzpCwSwQbUQSriW/b/
         f4ES8y6ozxsOEUr+K21sfTzViBfbSnpVPzqshF8czqjp5VAafRzKIGuHGZBhiFlvE4PV
         PMYixkii8DWG4+VnU5SEuwb5BTHO0VniICmJvJu919xcld2Pjqx17NPq00PTENqsyACY
         7N8cxyGnZHPtriWczrbxeoN3kvxAR4bTAShPEWuuszQ6njrDnEl7pqfWh9GlJ5fNGNh7
         xq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51KBRidCgGEzV+YuGLsgWf9Rz4+Sh0D7zyhbDJ4VUmc=;
        b=JRu0/rwi9HalcNeElGD7Ov4KYgZCcj449ikM2fmqYzVcfLERTda8FYLDGDDr3oOeh5
         2c64r+KaoszuSq4JNhxLIhd4VjryLlKOtI/kM+cKxikJJItIdD4FpZy9fE+XFFukx8rX
         qMYZODqDe0bQiekgeqHwrflseWYcZa8D27Z83vwHx2biqtK95SnItg+Ig/O8ZstgPfPt
         1PuoBJK1Nwwlnz/SaCzVXyiOxKM5iF7oL2AYpyfAJamd+PHsifKqGQwTC3VE9vOX8I1d
         GvC8PT0gptoJnB9wcggWvMkwEPMY59MhaSzM4eKsqQG10TdFeXXxJ8xHqIKG90XzQkoT
         qYMg==
X-Gm-Message-State: AOAM530QV1BJxC8yJLYEHyo3k3rFNx1ARojcPxCh7Rv/hVu/2Vo0r0Mt
	l3xf3PFjWvJ/73rk/Tvzhb6rIdEN1iQ=
X-Google-Smtp-Source: ABdhPJwGoYFbKlficjH07tvNBeUUXWV825eWndIjWXk1ZudJg5F9oKareuS1ejuy8eNUsYQhXdjQzg==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr3010052edu.108.1615380863956;
        Wed, 10 Mar 2021 04:54:23 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h10sm11102139edk.17.2021.03.10.04.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:54:23 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anibal.limon@linaro.org,
	Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH] xcb-proto: update to 1.14.1
Date: Wed, 10 Mar 2021 13:54:20 +0100
Message-Id: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

This fixes [1] the following build error for nativesdk on Fedora 33
which is caused by the removal of fractions.gcd() in favor of math.gcd()
in python 3.9 [2]:

ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)

Furthermore the SRC_URI is adapted as the old one doesn't provide the
1.14.1 archive.

[1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
[2] https://bugs.python.org/issue39350

It's needed in gatesgarth and possibly dunfell as well to support
distributions with python-3.9 as we build libxcb-native, which is
failing with xcb-proto-1.14.

1.14.1 is a bug fix release:
https://lists.x.org/archives/xorg-announce/2020-October/003061.html

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
index 6de30098d6..52e474a2e9 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
@@ -11,8 +11,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
-SRC_URI[sha256sum] = "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605"
+SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
+SRC_URI[sha256sum] = "f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3"
 
 inherit autotools pkgconfig python3native
 
-- 
2.30.1

