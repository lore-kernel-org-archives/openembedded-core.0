Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA55CD4F2C
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:52 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.16352.1695367491495167533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIMbPgu/;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-532eb2a1bf8so2015222a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367490; x=1695972290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3enG6CMab7f6BoIUrqgxLlo8+mfnpyaMdWpAReGi68=;
        b=GIMbPgu/BKNu7z4pmMpBTzszvb3FsUoDrzPGykwmgSBEGUDX025hn+tDeXDd8JYVcj
         wfBI05vbhbgLrA7VmD0sljRCJADzYDqSitIA5M8NvIZtQSimqloELCieFklAulXrxBDw
         W/VShRrWEyhPC7ktOTqnz+gMHFtA94Mu+zFD+t2iBcwhIkBYo7OhK3ZUVaEi+XklLKOp
         O3cujtZYL3Vs59ZZqMpZ9IA2eiAgCbRhSGnm23WpVNUkJuAkndcZcUsPdjU7qZrSq8qf
         K4zLqqOa9MgmOb5GKnnQX63Z0v6NfS8h8Je+w5UCT5dC4SB003vDKP/1/gT4BZMtMzni
         e6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367490; x=1695972290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3enG6CMab7f6BoIUrqgxLlo8+mfnpyaMdWpAReGi68=;
        b=v9eN4U/HVy8keiUL5Xba6BQQ2ThtlE+9aWkR/kFyL/JgrGBV96gj2Ca6M8lXhdWhHD
         9lzFXRgeJXLc7G7RAbOOLubZ6bUwkKE6u9jkDelQ677So3pLHkF6KMpd97YxsWuYkSk6
         xd6tVTuE/X+QQN9k81qExyghXqRfm2qqJaUzBDX4UsuQnHCLmJBvmyLpR34bsRvi61Hu
         k8toVOg+HX72PDHmKpzNZa6ACf7Rc4lvMkBMD1NwKki5ti/uV5ejNt/MjrAl4wDaONva
         c1dj18lMvqAmm/mVDK7M2qXWWHIswppcoc5dw9HC3IokmWkACz0NYl9NvCHtEopIIngh
         lcBw==
X-Gm-Message-State: AOJu0Yz5/jSXBW82OfhVJae2UiVCFUO8mb0S3IgGUmb5AUw/fhkmjcT3
	RvOenT8lb/TeNdlhkPMyQ0SqXIVVoAc=
X-Google-Smtp-Source: AGHT+IHOvvyaG+tGudrDd0i4LnQWFoKVz/XFdfpTLTAteyDGINjzn8VIG7+gAy6DjiDF8MnZea85cQ==
X-Received: by 2002:a17:906:20e:b0:9a1:b7ec:c8bd with SMTP id 14-20020a170906020e00b009a1b7ecc8bdmr7780015ejd.42.1695367489889;
        Fri, 22 Sep 2023 00:24:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/40] man-pages: upgrade 6.04 -> 6.05.01
Date: Fri, 22 Sep 2023 09:24:15 +0200
Message-Id: <20230922072431.1481743-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188067

License-update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/{man-pages_6.04.bb => man-pages_6.05.01.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.04.bb => man-pages_6.05.01.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.04.bb b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.04.bb
rename to meta/recipes-extended/man-pages/man-pages_6.05.01.bb
index fee57e3fbda..2726eded8ba 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.04.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
+LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
                     file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
                     file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "590623b99bf1f8ee958483c35cc0aaef2363e42998c4d927d1f705890d15d51e"
+SRC_URI[sha256sum] = "b2dd44ca0342b50923291f06bdba38c42438e10c04843ce1f731cf3f50631e0a"
 
 inherit manpages
 
-- 
2.30.2


