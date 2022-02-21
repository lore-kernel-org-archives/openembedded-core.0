Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7BAC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.5734.1645406894063210710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUbjUQlM;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id om7so13603941pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=PUbjUQlMX5dbZSrSkAW+R/rEQlM+BAJeb/cKYMwOJuCAfPfB0s2yXlFLKx90DyB+WS
         1tT7EERDuXHTM4bn/ezNhK6K4gZqMuLcx5XGJApsChDlXi03MLzsWj89roHhk6g+miBX
         AyLj64J7fCUIr6tkd1HPHzeN329bqJTvnsHZoejBwkyJcE5guQOBCDg3qv9Z2xj7uJqc
         4LoMl02TrZSyqkBpoupPzer70yJqWgfYV3CAzKoD4+/XsR4YBdMIWstVdxQumP0vWNQv
         QcBfATkgXFIpaV+ZI9qZHvJisD8T2P13SOSZ6xQEzuKpBFLB5giBrSuYE6vDnkoNs8vx
         atXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=JWWack7Hzy0TC9obDMv73CzsV70vv6AbPVpVeqKDZdHRrMwRGRbgT3lsDW8l6OxqZT
         6j3SozPF1UksksMmRLN4BhKZXlJpbCNiAVbGV1L51L+97AnY/V+3T/ytWXRluir7q8sM
         u357MyQZN996dLufzK2wIWOp8f0xK8EmnhVKSB1JDUn8Z8h5dFuaXKQnCBB0JJBNzDCk
         09tQ+8DMB1mGf/nZJDp98NIqp14q+5uBNdaTtZ4hvmJX162Z3tDurSDt6DNrrJthq87r
         Mdnbvto+kmLqG4A/4XnNwognm+pqv4RYpdO20XEXaFf7YlGkTNDsbdxUjJ2tQY3OgnKm
         zb1w==
X-Gm-Message-State: AOAM533Xuets4SA7/QmKq6Oh2aetcaRdqJjhgNUQoJiJ0+7jvyBQIwL1
	u2Vj31jXBT0X1WojcsXFL1oRyipu5Gt+tQ==
X-Google-Smtp-Source: 
 ABdhPJzciscG38jpisEFYbx/nhqk7zviuufvRsBuU/hn5ZYaHgWijO4bJ+ZjT+9zudGVeeklhIAjcA==
X-Received: by 2002:a17:902:c111:b0:14f:c841:66e2 with SMTP id
 17-20020a170902c11100b0014fc84166e2mr744081pli.92.1645406893209;
        Sun, 20 Feb 2022 17:28:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/19] python3-attrs: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:38 -0800
Message-Id: 
 <4a4023d1925e357a0b3adef48af93fa06e04f3e6.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162001

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-attrs_21.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
index d1dde29d376..20e4541f81c 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
 SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-crypt \
-- 
2.30.2


