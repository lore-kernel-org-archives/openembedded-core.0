Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF50C19F29
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:11:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.8432.1659103858739268061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YgWTqgLv;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l23so8741772ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iRBnJxSRy8QPB2LwHsDZ1tJ2uAWrdOHgRRj+diNQI8=;
        b=YgWTqgLv+C9RCUjuRxZl9iK6oszQmWG1VzAmGlyK2guiXArxB9hkMMvryUZDpgH+hA
         XG72oIcweB5BDtRF+2XgFwyc9SiSeCcmnL5nu89Qg8HaBhfC2bIm/FYr37RZb5m6CXpd
         1HMoThjEWYWyzdDpojWHnPlzv5YQmSjD8/LcBb9r/gAomYTt94x06SgzeVEwHaRzaomw
         ryhLOZbeO1zrFyW4dDUO7aZC/g51YQPh6vdJNh0KfraEq6dAJZNr+7dHn0g13yulro0w
         LmhHnW83c8gaEVwpLpJqtkr9X+8DUljKr+Zi8Fl3op2XsMnXnNp8X7/1QUIFuW9l6LDS
         +/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iRBnJxSRy8QPB2LwHsDZ1tJ2uAWrdOHgRRj+diNQI8=;
        b=vkqiPUU286Ca8uwLjy6Otc0aJl8BE0HNWKm07Cj6VpzVENhYNdPOvMpwcVvxBVOwAS
         M8eVYmcneSQJdX2cbxBuVc3m72M3ERjqRr0C+olliA4yx7NpiAUfMW+Yhiv+IRi25edZ
         aqs3Iym49Gg/Nzzthr6Gq17+oNdAtwS36vNBgy7bsR4trsJfm159V6wJUEmTmYUx2AT4
         1eWEmNa2Rbr7/Q+/cybIR4K0YUb0NbxAoV4L/0LR8mEervhaI4hNoQXdCD36VXnEiSgk
         vI7Nz+qhEO44e8dQPmuMmXJoYBjod5JG4OhIS0eld2NqHhpmX44tjjvcPprbYhITEfQ1
         nV2A==
X-Gm-Message-State: AJIora+MPn2Yqa/g57rnt7o/PWQ70cUWEmGD9IzwDXZIAd/zZOMTKpoB
	K3PA2BsKI0nXTKNXw5nVbXgRwIlAsg0=
X-Google-Smtp-Source: 
 AGRyM1uR1hGZbCd1kDcIeMPRt0Rkx2NUcGTF93tUPXem9obJx2WI63BdpeBvZ+ia/4yOXHTQO3XlAA==
X-Received: by 2002:a17:907:2c5b:b0:72b:54bd:40f8 with SMTP id
 hf27-20020a1709072c5b00b0072b54bd40f8mr2942707ejc.137.1659103856901;
        Fri, 29 Jul 2022 07:10:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm1744227ejc.103.2022.07.29.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:10:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] scripts/oe-setup-builddir: make it known where
 configurations come from
Date: Fri, 29 Jul 2022 16:10:44 +0200
Message-Id: <20220729141049.835733-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168628

"with some default values" isn't clear; if the user wants to change or
inspect the default values and their history, we should help them find
where they are. This becomes especially important when using template
configs other than poky's.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 54048e62ec..b4fec4d120 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -74,9 +74,9 @@ fi
 if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
     cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
-created for you with some default values. You may wish to edit it to, for
-example, select a different MACHINE (target hardware). See conf/local.conf
-for more information as common configuration options are commented.
+created for you from $OECORELOCALCONF
+You may wish to edit it to, for example, select a different MACHINE (target hardware).
+See conf/local.conf for more information as common configuration options are commented.
 
 EOM
     cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
@@ -89,8 +89,9 @@ fi
 if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
     cat <<EOM
 You had no conf/bblayers.conf file. This configuration file has therefore been
-created for you with some default values. To add additional metadata layers
-into your configuration please add entries to conf/bblayers.conf.
+created for you from $OECORELAYERCONF
+To add additional metadata layers into your configuration please add entries
+to conf/bblayers.conf.
 
 EOM
 
-- 
2.30.2


