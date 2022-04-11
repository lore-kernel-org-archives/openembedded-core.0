Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2C0C54F3E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.27585.1649672020092970771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 03:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZDZza0PG;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t25so5046914edt.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jXz9foDC3Vb3vGVHU4ldWDqWVdKP71zcE6Kkwb40xs0=;
        b=ZDZza0PGkkqE+1pFNp1920tKrJRuVUlZq71ORqCW1yFsH2tWz0rp/MIoLxfojd1zIC
         5XCm1a2ag4/2vosNyI/3PXauNk6xUCJePBXFbCkcfl107YUnDt9dHLsJSgjOI9lATHfP
         Yyxx//vtlGJE/kH6ZruFGIsH4v8cm5Dr6HL6NFomxPCFGAcLc7dh6dHhSPm1LzrFa8c0
         6cCgV7fVpGGZE/fFM7Fy8zrTOHZlWr0gphUYZYPg7ChnfKs6x2ZYIWOUU/yltlFX4YmW
         mnHmmx1+umg7/R7oYW3DQ4WCLWzhPHAPVe+2BuWyWKnvte0R10LuJiA+xIIliS34ubVN
         x3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jXz9foDC3Vb3vGVHU4ldWDqWVdKP71zcE6Kkwb40xs0=;
        b=zEHscyIr6YmEsrFoQwZVQVBBM9h8yy/h9puooQmu8hdABRldgAAWU9OUJWlI5J2SLi
         P6Bkwt7Ba2YlmwXjzTJglnmegQYD9luKWpdNQmoxURfWOF0B+kQAmyf3D7PuR4JImhr4
         szLqusRn4iB31nrfA+DsK4gdaaQga/SdCShqKmidoyjO1Qx8zud+qoCD+PSThZMD3hu2
         3vciv9Pu81CogXgXzP2INq44OyB1rib/6wPH78AmDSr8Qr2dNZZYCvtUvpkNDot8dFi0
         XWgulDGEzhO1WBghwfdQC2ywkDcro0gN8jWXjziA69CpIZ3yTfcP512JZN9u29tei+TD
         BTZg==
X-Gm-Message-State: AOAM532S+cA+/kbP7ZI0v5KU7kme/E20TCsFS2MIIKXdUA9nvqQDmSbU
	Z4SVQ+qU/eQlVmH4jQYgWpyUu72q42g=
X-Google-Smtp-Source: 
 ABdhPJxFtq1ymXvLdy4M4llFZxbwJC5AN6HbH9Kf/1NqlgnPombTmO4jA/6tXEf5IxPi1gB9EAm5cw==
X-Received: by 2002:aa7:d3c7:0:b0:41d:805a:153a with SMTP id
 o7-20020aa7d3c7000000b0041d805a153amr2678669edr.316.1649672018528;
        Mon, 11 Apr 2022 03:13:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a170906944a00b006e8a6b20129sm31432ejx.29.2022.04.11.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:13:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] itstool: correct upstream version check
Date: Mon, 11 Apr 2022 12:13:35 +0200
Message-Id: <20220411101335.3541864-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164218

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/itstool/itstool_2.0.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes-support/itstool/itstool_2.0.7.bb
index 5af16995d7..336fb636d5 100644
--- a/meta/recipes-support/itstool/itstool_2.0.7.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -13,6 +13,8 @@ DEPENDS = "libxml2-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
            "
+UPSTREAM_CHECK_URI = "https://itstool.org/download.html"
+
 SRC_URI:append:class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI:append:class-nativesdk = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI:append:class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
-- 
2.30.2


