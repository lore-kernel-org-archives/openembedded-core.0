Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBA0C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.12358.1641927756721007752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hP+ad6fk;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id h1so166017pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BOuGcEKCkeB48VDXS/4aoYCG0W6ZSvo+pvvz8zv5AnQ=;
        b=hP+ad6fkQ+z0K/gPTdykUCSIELv4X73EddU0d9/rMlOh/xDCYZDomBvydS6OJaUs5Q
         273Cwdj4DumFlnPqL9cge6YPuZIVWp3WOlqZ2rH5WnwhtC1sr1ld6oUf1dyiOK+k2lac
         fEYvalMMD0wyZYxfeGvs031LdGAn9DMOvAmW5hdIbHABDMRkm8RgFe8D/x00nzrvMNQ5
         4Z7q2yXDw5RmpoIm/9bZTPAzjJ0KmdmJVsyamewTHq/ylZREviUOm+cszHQSqBy6Raks
         Bn/EGMedbmamlmN2j9IR62RaxLq3VSn5XZj73YHOjfTpDZfwNsvalJleEn7icjRaD+YF
         VwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BOuGcEKCkeB48VDXS/4aoYCG0W6ZSvo+pvvz8zv5AnQ=;
        b=o/vHANo9xwFejyNIyBY3Z+/fcQPEeBoBOI12Ied93meT6ECO4PJKOlw2o6qOkL/JuZ
         zeKLpU6tSTC0yiD9O68YFa3MNxFgo5dUX7Z+bIh1HuqOBr3dLYN7BaMp9NNcvfYShkB6
         hYb7F43JxX4xF2OFPMS4F5d0f51IN8T1TJM24VPk4v2ca5N3jJe5ekQVSAxhpl+jCUN3
         cXnsM3uKbLLCRPdgJ2aaX1dmXOunmFOb7fg+87eQN8k+yq+DGbRdMJbjUVIvRMi4EXMJ
         P7Vull9X1CDfp4F84CwiOInJ5sFCsqqX/45AxkPwPuEpeMxeInDJwfZb7v61Csg1ifT1
         xYEw==
X-Gm-Message-State: AOAM531C7XT4q7kfHKNJQ1o9b7iHdEKO9RVCCRlHsLUtNP4a7CrmsNGQ
	x3CrHNPBwc5Cb3n5LccUctXkiDTl2Ik=
X-Google-Smtp-Source: 
 ABdhPJwDWUqECIKUODiwGn8mebO6t3wIXV2YErF6F6K6J00AH9Mh58z2lFKS/eu76cPxwP5cpmPBVQ==
X-Received: by 2002:a17:90a:ce18:: with SMTP id
 f24mr4759479pju.98.1641927756020;
        Tue, 11 Jan 2022 11:02:36 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 12/22] librepo: inherit setuptools3-base not distutils
Date: Tue, 11 Jan 2022 11:01:21 -0800
Message-Id: 
 <8a6ed808d5a482b463d961bb28798b09b0dcaa15.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160448

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/librepo/librepo_1.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
index 61a485cfe89..6cd8090b556 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-inherit cmake distutils3-base pkgconfig
+inherit cmake setuptools3-base pkgconfig
 
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
-- 
2.30.2


