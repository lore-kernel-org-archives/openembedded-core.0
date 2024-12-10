Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A1AE77183
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.3950.1733864212191814867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=feOooDHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so1161406a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864211; x=1734469011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3JYqvCoIrChbAxk1J1bbb8r3TNEOe8KUuVpps0mXN0=;
        b=feOooDHcWUVCYCLX7wrxMZivpRpq80/ta7VRicpedJLIRC6Rudr3/YtfIBfero2ZhQ
         v7fhxV7nhFtnC+YAwtyFeQzwdEmTuuBWlX1eHMHivpjRwCaskcRAeRHWIJ7YU6FiDpYt
         WY8Ig4mTxeR4Smw4EAN2l3Su6yCBL2lwWB/PlMWxiMSor1vmz2Nng5XSy4eZ2HOF/m1n
         fpnGcEQpw6fxsSQwxqYyxPncFtb6TFxViMz05Oqx+PAPGM2l+nfPzs/YPiCAuLDbFt3N
         B17WtdP5IazbtPzsWmXCKMnZ+Sj6xlcVUMAYV6PzVgMO2jqdQgPF0zAxhlD6RBNhC233
         TOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864211; x=1734469011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3JYqvCoIrChbAxk1J1bbb8r3TNEOe8KUuVpps0mXN0=;
        b=fg9NNcXZi+LJTSd0zxGCq6YZ2H4P8YKE7QgmeK37r0W/J62KagZ08HwPfV5zbP+azs
         r81yKcla/cqmjCA2gbaSLeRTPu3gLWhyoSEPs8He3BJ7ClZZqbHsZwU7qQ5yTAEbbfY8
         kwsUA3pUYW1kC13ljD7TG17STz2lH+BhkeqjS+l5jkrYn5vybjHJenI6rB8NZnmDx5m4
         0siN/xq6EodArUnqj+ZEA64BPTkeDwVrQgIdjsfJwQp9HbD78+QK/MMxvoUurX7bUu2y
         CW8wGEI3VWqz4jIyy78dLnnYppVtmetLGo3iHNL4KyRZin1HC49dVftX/xilBXi7lgWa
         dX5g==
X-Gm-Message-State: AOJu0YyVgY014z48bcwVPoz+4wRCHNzLNBdRDaux2zilSBpzSFxpAHWm
	k7BH6jcmLVUomOe4e9va81Dv27qzTqXqqO26ZYoSRylaG59xzjVWzphj5B0LX/PUQaY9VlJlAPp
	d
X-Gm-Gg: ASbGncvZRboYln9xjiexpNcCH7F+LH6X+fXd6BrnA64YbCzYZd/h/mPRCzKj6gax++B
	NgqioL8kEAn93Q97SikJoX+ccQek+EbF2c3HGdy6OfMP2YmYUETXN9XJ3P6dC6fAX/mAzpw4QUK
	t8/G0M6fhUh30CjzNcdFCIyNtqev0MtU3souBvAlmAurO0h4+9Lh3w7et/M5xo2q9wHHpYpAdZh
	4Du74AijQ7i/QiqUMV8J54Dotdgn2C36e1il0DcpiE=
X-Google-Smtp-Source: AGHT+IEHGm3swk3cW6yXqaCaVwLZ4shzmvUYspVcPPqgWo6wa1EKiwrHn+vl4v+IRS5DHdzkbGNS7Q==
X-Received: by 2002:a17:90b:5112:b0:2ee:ba0c:1718 with SMTP id 98e67ed59e1d1-2f1280effe4mr626300a91.37.1733864211469;
        Tue, 10 Dec 2024 12:56:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Tue, 10 Dec 2024 12:56:27 -0800
Message-Id: <3273ace1e5e4b0573ceaa44f2710f651db9ae525.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208554

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dnf/dnf_4.19.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
index 37a2cc7de2..9c7c59818e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
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
2.34.1


