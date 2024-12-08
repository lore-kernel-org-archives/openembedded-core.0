Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CC7E77180
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:15:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.78561.1733663754105531921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzSW5eQC;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385ed7f6605so1498542f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663752; x=1734268552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcveRui4VK5QzBjujDCPVnNrbzB0VRAcv9GkrbvvctQ=;
        b=UzSW5eQCJiXMvBret68TYkQ6YW7pPe6tZr3w5p+DI619WAynYr5H1vSnrThjPew6gu
         Cp3lqLKe6zim5Qj4Zc0E1T6SM08jtx9ZbyI81FSduFOV3EjbZ2zJQ9EYRiB2y1BA84lf
         Z1yzlZZYviJXEU2g34qzOFi5CJ/ScLYH5xwwoT+BXLF9fVpBys8fFxaQOeq26c0ZyTLs
         h+c1ka8RhYmYCAPOkzfXh8TB2LVuZQh9Mru+Fy332i3ph1CJ0XkYF3rary02ZWFPK0fK
         wc01/nMaIv5MqRyObs+HKjIXbkBn2H6GPSRoPku++g6ecJpKwaJNLT+GNRg77vr+ccZP
         YL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663752; x=1734268552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcveRui4VK5QzBjujDCPVnNrbzB0VRAcv9GkrbvvctQ=;
        b=ehLSxpZYmY0EBrnVsupfV8dY7NkQptQnub5Qcr27fkZZUB2/c/qa3HpLTJ2Y5Q+YTz
         V6HHkk51cN59ApxTK5pc4gAPC2bMZOSi9lgX4WGXnwx6vFNDtz+ApOYvdu7A8zjBKC1Z
         2SnI3qUdom91xW5aqwrjxaElHeilrI394yRzOVG4Deneo963gjLYHHIph6MdoSdX9Rfv
         4V5djnHTs7mUISNutxrld78SxBKZl7b5GTsVtFzkDcZ1pD5nGADtIFQS/bIUeaq+iRYx
         /idTty+RA8tXPAyxhD2BDl5wRdbDRapuYHIfUcKq86I/NJffV45Q5kMv9W2IPRYVGvhr
         yPEQ==
X-Gm-Message-State: AOJu0YxwLaMDADeifHRv2o4KFSydcLJcy0eWsOow9Ut6e3kD519oCjTo
	2jh7jlTk07CRzRV3XQtwEJrOTVcEFhE0+xX2tO0AlJ7e/qndfZo15AC5XQ80
X-Gm-Gg: ASbGncvwnYsJiasF9LOxVsfuG2r1SV2PGb73VhJsy7v9rMRDvo/32A1S8oX6A8lwOoD
	J+rbCgPGZV4/Ia/OB5hietZD3WrLREgdZ3CMHrDkNlDy1bWdL+mAi7zpm1QqJ2SBUUK2IZ55EBH
	J8KvLkOqJKaUfZkm8eH7qMNwAtwzKJ9RVPdo/hPleUN3hVH+9CIj5WuyPubfj6tf8cIXrmw4viS
	53nStuM6wW7ySXU+850m9KHofSj7cuhltmxc7S+2U12PaJyitrtvpEPsItl9AJfGpnk5n+rcYI=
X-Google-Smtp-Source: AGHT+IE/f1QgHIp2dLhQRfrF5UpD1jVWETvf+ZXzEOSkXLdGif8QywnCSrofzehloWIqUyLsqnXFiQ==
X-Received: by 2002:a05:6000:188f:b0:385:db39:2cf with SMTP id ffacd0b85a97d-3862b334cbcmr6098499f8f.12.1733663752162;
        Sun, 08 Dec 2024 05:15:52 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm9807830f8f.38.2024.12.08.05.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:51 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 4/4] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Sun,  8 Dec 2024 13:15:35 +0000
Message-ID: <20241208131535.5397-5-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131535.5397-1-gudni.m.g@gmail.com>
References: <20241208131535.5397-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208464

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dnf/dnf_4.21.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.21.1.bb b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
index 09bdbd88a8..d5e2a688d4 100644
--- a/meta/recipes-devtools/dnf/dnf_4.21.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
 
-DEPENDS += "libdnf librepo libcomps python3-iniparse"
+DEPENDS += "libdnf librepo libcomps"
 
 # manpages generation requires http://www.sphinx-doc.org/
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
@@ -49,7 +49,6 @@ RDEPENDS:${PN} += " \
   python3-sqlite3 \
   python3-compression \
   python3-rpm \
-  python3-iniparse \
   python3-json \
   python3-curses \
   python3-misc \
-- 
2.43.0


