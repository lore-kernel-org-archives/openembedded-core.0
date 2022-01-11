Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C98AC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.12440.1641927753797163548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mVEe3STY;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id oa15so492284pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TdKUJbD0CM2tsZHj7PLcdHt4XBBgWNrpU5NMFjoCqyc=;
        b=mVEe3STYpQxF9a2m+6IRWUnocOUQRDTZ0E6exnYXOJZp1b/N22BfGmFeL0RveUVeae
         sKu8U6Cu0m+T6W0uaerHOLymfYSBbSarBNKXFZ5ZRtwLYDyCYqc6jr2vkEfzRRQOJd6f
         BIKeQtw1TlRYeW4GWGH8E1GTNySfCDJwLYD+NE6A7tjpztqJ4Mhxt3XrIoLZX925BvQU
         xbljIWirRBIIEJtBXhva4YIdifCk1j4yuKsrbTFgJsYiofK10dYRWiUGw75Smljq+wcK
         bRbSgA8F/YSk6zamwdcsiDF818upKI/qC4SSBncZpICtxm1j4VpUKpVytadGP27EjE0y
         Cczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TdKUJbD0CM2tsZHj7PLcdHt4XBBgWNrpU5NMFjoCqyc=;
        b=B6Jvgs5axp8Rp91JC6lGqgS3IKyV4F03VRmIRgLuHUMpaFRO1GDSAVK3qPn2Ghx+eo
         QRz3P8RGDLyajJO1cNUaQkroUzCZm6TPayj+Xt0PPHOlXt30pPfuWCyDo9ZU2dmQFHxi
         UqFM6iMMJiEOfhIhwy0XmpkGKRqOeeU8ohCDC9c/ARZ4o5LIuDJIWNxKaCAOfbhPzyQK
         rrNl8e/ptPtbQVsw4VIet475ck4ZX2EqlSmfCLtQ3UvbIJEleBeI4xY94xRyo03OXAN+
         3WuhFKNBqQMGTQ3+LcBcJjsI20NbAL2ffrug+X+O7glLK2XQjM5fKGX/cQJNLye9dGSU
         +0FQ==
X-Gm-Message-State: AOAM531J9/yxLfe8qFG1reb4W9ZQQQ7WojI5vu0VhXNEojEOcQwX+m1v
	coUJV4OPld3y7FWyyiZeR18cHmEbHgU=
X-Google-Smtp-Source: 
 ABdhPJwzY3nJ8ts4YadJgCStpUEpSCBk8t8p/ZBmk3GwOhIbMYXxPH1NHBo8VqfKAW7px66+VJPr0w==
X-Received: by 2002:a17:90b:3b85:: with SMTP id
 pc5mr4619789pjb.15.1641927753065;
        Tue, 11 Jan 2022 11:02:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 11/22] createrepo-c: inherit setuptools3-base not distutils
Date: Tue, 11 Jan 2022 11:01:20 -0800
Message-Id: 
 <2be8b891b61729903cd3cf9e8e409305be52122f.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160447

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
index e249b767ffa..d5fa38d300d 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
 
-inherit cmake pkgconfig bash-completion distutils3-base
+inherit cmake pkgconfig bash-completion setuptools3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF -DWITH_LIBMODULEMD=OFF"
 
-- 
2.30.2


