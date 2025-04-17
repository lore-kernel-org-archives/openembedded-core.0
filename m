Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8AEC369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.608.1744860571616063922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKzCF1S8;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso2170405e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860570; x=1745465370; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXVJYGDsD7i8emrBjcLgLl9Ll0G43AEvECvCe3gCx9c=;
        b=IKzCF1S8JeSE/YWwNQhZ3b/EYxJ+p8AWGNJ0sIJXrfZB52g82JVNfBhPeu1XtdeZ0m
         yJQyOCUxWl/tyVJfGWxUdj2EFni1g963lvLskouocLiofnrkePN6yuOsF0md48alVRDk
         LVBGj5XdjLXJgXYjOCISF1a1D0szJcfy/GEXYAD3Pz9bUtsJcBzILLsf5zUmjJfuGlOJ
         1zFCKZEYgObk1r0xdpS4MPcfYOFdpvmsKsCyh95th3G2KZ+L/SufUMGMTB7QoXENXjAz
         5gIXnWFlp4iyMlDotOEQmMW4IBid02IeFeD8g3wooEuVafkfEWYfIqCBh9f9ZaXJuXg1
         OZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860570; x=1745465370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXVJYGDsD7i8emrBjcLgLl9Ll0G43AEvECvCe3gCx9c=;
        b=SrU20sDlDuv2OPogiF06Ab2S2lHEYbY437FjJxavszNmxJlBzCT/XEaTO/dZzxbgjy
         8MHraQMIMLPoQTyCrsoKFYEnVjGUlEiDGvE6NqVYwkjpARxY4Cz4MYbbGjtKD0hoMlDE
         RdAihR4I99G+MTMr6BZ3tUxYf3lbl/HD4Gt45gcOtbYP/c6hHACZNRUEDruAD+nRzCHT
         C+bmLuSHQQGd3NsxEbOMqEOYkgx1T8h1/Af156heHSQ/AG6dMd5fXo4v4K2JQ9sQx8tJ
         mplKSi0uu3O5tSWSdNkfT+ww2wwkNG3GuFLQPQcUftEV/tVBpHvJ7nuUOYnrvIg73P66
         WmaA==
X-Gm-Message-State: AOJu0YyyAB2PVnvE4Y91mRiTpDveM3HENRgkdygGg/+YxcZOnHyvbgop
	igf8jzJgrrY1j04v72MpZXIzzZtxBmzMOvBZ8nMQ9JDQVwBdgSU3
X-Gm-Gg: ASbGncv7t9GnBfKBaL48pihdzBgpgXJ70jFAqkx5A4WcBJMY1Fp2h5WKQGWNs3JTZG8
	rzmU4sx32qYo5IqAE0UiG4DURbi74MupV3TZHRObOf0Yhdj1fevmqtoxEYBWpbgXi/HuJy1oPo7
	6WvPv65kqN248SE/3xbGHSKAw9GL3lSooGR4hqnpC+MLxdqNatB/MNc08FdNVIptVNkqaSL+LWi
	9WZ8N1Yswft61xIMEimejNLILAjOU2OZZa0zYS9MYhibrjL2FnYxmeI6MCBInfeXcPgNWVVQbP+
	JBE+kiAFyZ99s7PNm3uJ9nbQvpMCtxsvsESkGU6IcwfmfNfUNIYM+iJddn/z41AypcKqEGOi7SB
	/6fRgEz/n
X-Google-Smtp-Source: AGHT+IE3/wQZNpSW3RVbKJeEqciH+EtoNRVu1tezKk85ay8AIdBJXQ5aFunRiAghQA/UZwIUvhPmxg==
X-Received: by 2002:a05:600c:a09:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-4405d6decb3mr31427205e9.29.1744860569722;
        Wed, 16 Apr 2025 20:29:29 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Apr 2025 03:29:15 +0000
Subject: [PATCH OE-Core 2/5] connman: Create ${sysconfdir} for systemd
 images
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-connman-fixes-v1-2-160b2b811116@gmail.com>
References: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
In-Reply-To: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215034

Depending on what set of PACKAGECONFIG options you have, ${sysconfdir} may not
have been created.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 33b1ca0680b076bb3fb2b0bf1261eca1f81bcd59..bbe3585dc72ff64ecda74d866f119dc3b71e4fcf 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -115,6 +115,7 @@ do_install:append() {
 
 	# For read-only filesystem, do not create links during bootup
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}
 		ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
 	fi
 }

-- 
2.46.1


