Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD1BCCA487
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3721.1657094854092807176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ijx5s2sP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id q6so25599123eji.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKaB6i/bphLRDB5hMD93knPgFuFtdhPGWzUOxlF1wpo=;
        b=ijx5s2sPBcdB0GhnO1ejDTaaXAR9n5np4pjp+xooAT6vmnME+m40ZYlaHN+Kbh7fG2
         CtE0cG459Y31Hfdoe+FgwBRjHPOXgi5tgYcW0Umf5cWXNFn+Ol8E1CxHt9lKfVRcvK4f
         lthY/oTvfd5wbf5BrH8FIi3nQEI7C6O+lIq3jSuPvyA4lOp3HL7hSi6Qw4pOI30WfnMA
         HLUIssfW9PyxcNjiQUqZemg+fz/GrJtnE1W7Jjqa/Nq+5QdvVnweb4sRx8FvCHInnz+O
         Rab34CyXSXM3RJb6Rgh2lhsOs93QUCByo4i1BMxl0DIjuKy1oMPE+ByZqYIzwmNMbTGT
         JVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKaB6i/bphLRDB5hMD93knPgFuFtdhPGWzUOxlF1wpo=;
        b=GtuqhB9GvbxJlHzYr6+9EhmgwM2LgXV9Qro/zaNxcSn5BHstR0KE7Lpb4tGzyLbHtM
         3ZsVXtXUu0S/6KCLFRP1xu2x3IPlPojvlYdkgIPjfa9n/9s7Y9BdHwe7PPLLmaJaE9Zq
         aevVjc/Jbl/LQ/4uuqVy7p0ieKk0PlghfMpTGHmDX3md5DX9NJNOfESwxtkvxjrUkirS
         mngMshgSnjZISCFKLJxLezMMasDz4GvhYEKc9h/XrPXO6TlYuN1JhMxcPVKU9L7pDn0R
         dUpX7sscEhqWBayULIzJkc2MTz0Fy72wx5xc+qnxy925IUgbJJBWPX/rqdUyY55ZCiSk
         rXZw==
X-Gm-Message-State: AJIora/XSe5oMd4osgGh4qZmIEo0NaLvMdpIIi+9g2eNawYfQgMVBAh4
	mVmjsbOgjJU/EoEQ58hQDTtdPoptH462/A==
X-Google-Smtp-Source: 
 AGRyM1t9YrCKrmSs/0QRxtLbkC0oaRrCcINvQkQEecqVU8wWv1M8T29TvNObWQSLm8QWBuEuHDN13Q==
X-Received: by 2002:a17:906:28d6:b0:726:41df:d9cc with SMTP id
 p22-20020a17090628d600b0072641dfd9ccmr38189620ejd.649.1657094852580;
        Wed, 06 Jul 2022 01:07:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/27] libsoup: upgrade 3.0.6 -> 3.0.7
Date: Wed,  6 Jul 2022 10:07:02 +0200
Message-Id: <20220706080721.3072553-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167695

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.6.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.6.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 17825ae6a4..59cc4a1d0a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
+SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.30.2


