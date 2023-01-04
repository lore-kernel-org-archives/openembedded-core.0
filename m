Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31979C54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oPQ+ooLK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16085644wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WpeDFQ2yRZgdxoIDE9Hmmw5HKB7vC3DzYuw3HJ3RRc=;
        b=oPQ+ooLK6Ix7hOMlrirAs+Le1ESij+a2aJyZ9Is2sY7lWf6AbMyID6AEA6zMKMOhDE
         ygiNMU4FL+xmCNCKODlZhKC74qnG2sSDpAzC6th2Cxps0GHib6dwPeu1XfpAsz+tVog6
         cTLBtqAOyvUENODjvyXc90YrPNJNLsWp7Xj1SbGe3UD5NVO26R6odNooVpZIEzZ/rT0Q
         vXl6HwgKBNnGyBmjwE4NKjpga8sV6zifvVTjICrSwgGurBVSbQX4ylQ+wZfUNqh2K1K5
         pgTIvCAOTGAFWLWgj1BQIH2w0x5X1MAhPZc8hJNmIKf621JpBFUIAc0oe0Dvr8qgmapC
         zmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WpeDFQ2yRZgdxoIDE9Hmmw5HKB7vC3DzYuw3HJ3RRc=;
        b=Sk6K6FGZid3O+sR7U9TDcxjOJFlWyNxmn0e5LWdBhhmmiJxDNB0SpuZsdBXWgpGD1X
         NoO7ILVBbQdcfJOaX192xi8NBEHiHq0teUnxRG5r2rHTpCVuWRJd1OJGzJLhmnyZQd91
         wA0uBiL5qmryS20qZ6YQOoDeLLbDGoeE7jzkiatAMl/GMUMhOhbMc0MxM9LqllDnY/kH
         6StRoFbMizQDUa7RU+mx0ZCX370Iu9d3sOU3wHnXSS716RfQlaEu0sEuFwXI4DY9o+E3
         ZnrR+rKYRuYJKwq/0pW+nlTLIqUVDk4Ho0nb85F1PjnjT/irOjr7zrMaDlkjrWfvT6Im
         kGlQ==
X-Gm-Message-State: AFqh2krPnftrWmtnVO1vV1sDuKdTIZkhvrMBQsi1Z8n8mrPFisC2ZKkk
	be8lqgXgNKNWNKB9tniYK0tPg2rmLCY=
X-Google-Smtp-Source: AMrXdXvmay3uRj5+gfkJH6kqRj1qc4mXfzmJKwAqP0/+swcypfPIK6ABK7Wv18UNmbTywiktnjTPUg==
X-Received: by 2002:a5d:6541:0:b0:28e:f7a:9fe9 with SMTP id z1-20020a5d6541000000b0028e0f7a9fe9mr12058973wrv.5.1672830392859;
        Wed, 04 Jan 2023 03:06:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 53/77] librepo: upgrade 1.14.5 -> 1.15.1
Date: Wed,  4 Jan 2023 12:05:24 +0100
Message-Id: <20230104110548.2537259-53-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175438

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librepo/{librepo_1.14.5.bb => librepo_1.15.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.5.bb => librepo_1.15.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.5.bb b/meta/recipes-devtools/librepo/librepo_1.15.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.5.bb
rename to meta/recipes-devtools/librepo/librepo_1.15.1.bb
index 46cfce53ff..2c8d6fc719 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.5.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.15.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "f4b915be5e04e88263097f65addfcac5919fef41"
+SRCREV = "5f4de4a4e85845d4184fbd30c03ff8a8ec7df4af"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


