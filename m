Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405D9C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:24 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.20250.1637901383826164099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k85ioSnm;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p17so7063416pgj.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=20k+4gHVqOm75/Uh1nIyZAF1srV8GQHUg2TXo1AxwDM=;
        b=k85ioSnmVslmazxlYiTC0grITxI2uQHxPK8KaiGdqDT+BJEiGiD6PjwRM1JSOqNc9H
         yc/40ijuj2pnZg3+KMWkR7mp+mB0++lbwYvULj62yDxgcbIIMiN3Pjb8kx7pf1WErwv3
         a9hRPeQNbOD7Nls5iKaqX/sFmw6kOuC5JWZVFiFoiz/rGFulQvmJqlPBxkTgqfoOd+t9
         tMwpqIM4jFwMHwFeiBCRx2BO1DPtWkqOXFNNHNZfeyIAls433obv39vChBTMRZxR6F6q
         CcPQ7oAv0m58bhGSw2TQfh7/SvKanaMQ8WIYMAAsfHBC5OwVAcUdDNEk3zIfGj7MgeuI
         VAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20k+4gHVqOm75/Uh1nIyZAF1srV8GQHUg2TXo1AxwDM=;
        b=8LkGssm9cuvtLJ9QyvXz/GjJSY+JEL9/EJMzf/Hcxfl8kD+N9QV9yflLBZJdVcrIOe
         ikIqmOvQgP7UyphHFnYEVYx2G3cB+YqNvjzeOSlU002b9DW041bU+ddAbbXU1Tfm4wJr
         Tk3EA2aQCzEkrJ1kW0yNGaRV1eWdORgVgZJaHo35rB0U4hamMvRNOONQnmo8ZRC9gmlc
         u5YqRgwe+pX9NrkaWYtyQx3QRIKZaNeWunVeTb+Ji7T1Mj1Kp7qOsfmyHqdiDm8N9Dpm
         OtkBhGK2B9MhgsDJYc3fKNXYdvNL8QiQNQFHzgXFaXGe0u8FvZQ8oKDa5FXwfDW2nmF4
         SqmQ==
X-Gm-Message-State: AOAM533Wi1oPzHwM59kgn/NruL9nYWdVyvdl06ySKIrdWEH0/+4D2tQl
	23Gs/MVs+kBPL21JJ11DlrzF6cyFYYQ=
X-Google-Smtp-Source: 
 ABdhPJyLgUncLdEZ7W/vRtKZozcIaOBHjCjG1IF+tmOwVvzH43IMLg2gJ7IGV5nsJ0ohp8iXPNyfzg==
X-Received: by 2002:a05:6a00:16c7:b0:4a4:edfe:4625 with SMTP id
 l7-20020a056a0016c700b004a4edfe4625mr18782616pfc.58.1637901383122;
        Thu, 25 Nov 2021 20:36:23 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 11/26] createrepo-c: inherit setuptools3-base not
 distutils
Date: Thu, 25 Nov 2021 20:35:50 -0800
Message-Id: 
 <5ad3d04ec0c6ce6fdf2b4ff6450839b19300aed6.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158807

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
index 0c27756d2ac..0b18b8baa0d 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
 
-inherit cmake pkgconfig bash-completion distutils3-base
+inherit cmake pkgconfig bash-completion setuptools3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF -DWITH_LIBMODULEMD=OFF"
 
-- 
2.30.2


