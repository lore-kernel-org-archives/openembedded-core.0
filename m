Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6893AC10F04
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:45:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.83109.1701953146773354369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=i5Z2ZKPa;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so10838215e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701953145; x=1702557945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MZZdV+bPEvJsC3vL+YSMe/f9Jx8dHJ5VXDPrUiqhy8=;
        b=i5Z2ZKPa72f6HrwcscSNSjwhE5qETRkM9juBULPIPVE9aYiH/4dCbbbS+IagglTf3N
         VqM0MsS6A0ZsDlNCHflJWX0bYNXNYcbPwLjUZGPEQqzyB7aqM6pW+TypU84erqX9KgcH
         OVLmnjU6tmQnae7nSNryk/aa7x/d7kqOOBMxItKFVmqa6VAB/x7/QfRj33emuxOYHZRk
         xjtHYJSHA91tmYOwRwVu352BWt5lQ/NhqqHJxvP3CQY6b6ZeEtXVKUrMAE49SbcuQLwB
         95nb27HTOupJQft9olql2oY0Hc7nppcmYr681B78Qmo2ksUZq8Qz4eHytRfxCm+pTQ0C
         yajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953145; x=1702557945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MZZdV+bPEvJsC3vL+YSMe/f9Jx8dHJ5VXDPrUiqhy8=;
        b=OI1ILJsI+Xd96zDFheWQwf3y8JBTXweYGDYF9tG/KtiMOVRoDIJ4ZviM1dzACMSLVS
         gxoIZ0GfOz6hHuFbrgNLBnacNPSeIu+ZbStdl0afzl+pfMfoMIq7yHEfBhmtFMhUROAU
         h1B+rMy7LyvyOEy/tflsMCARpy6q0EBtN3kkv3naTNrZVIBPVRylRcE3jjWwpaKeXo21
         qUq+MHNEQMSldTpNzmx6D6V01bKTQiHNpNpDKbXs7XYgUblmkzEmRt2RJGaBxB8Vnni/
         VOIKJHvzYhpsH5qlrHCXwFll5U760jXwTOr7a1ZJT2vfra4+XSItMMabYZl2gVkOFjz4
         tpxQ==
X-Gm-Message-State: AOJu0YzzOWsL53YNpJriiBz8Jrx7P+ioGPtM03qhCF/TgtkL+DbYQR08
	aE8TJKMxoYXgAIOlp1PoIh/nIcesr8t50dv0JY2bNA==
X-Google-Smtp-Source: AGHT+IFsOY4X5LcVM1G2LBHtrpMT46IDV/Z4lMiISRKXJI4qpHXR1quU5iUINFbMLkY5z4Uxpzgcnw==
X-Received: by 2002:a05:600c:1546:b0:40c:503:9bf0 with SMTP id f6-20020a05600c154600b0040c05039bf0mr1131719wmg.173.1701953145217;
        Thu, 07 Dec 2023 04:45:45 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm1901449wmb.17.2023.12.07.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:45:44 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 3/3] variables.rst: Add USERADD_DEPENDS
Date: Thu,  7 Dec 2023 12:45:34 +0000
Message-Id: <1943d053c1276a7ad940f67868aaa9d4c59397bc.1701952927.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701952927.git.pidge@baylibre.com>
References: <cover.1701952927.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191951

Adding USERADD_DEPENDS to the variables document

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b394d310990..9ec0ce4b4ca 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9736,6 +9736,21 @@ system and gives an overview of their function and contents.
       ``meta-poky/conf/templates/default/local.conf.sample`` in the
       :term:`Source Directory`.
 
+   :term:`USERADD_DEPENDS`
+      Lists a recipe's USERADD dependencies. These are dependencies on
+      other recipes whose create users and groups via useradd.bbclass and are
+      needed by the recipe at build time. This variable is now required for
+      recipes that rely on other recipes for part of their useradd.
+      
+      As an example, consider a recipe ``foo``. Recipe ``bar`` creates a group
+      that foo requires for it's useradd tasks. In order to ensure that the
+      useradd tasks exist for foo, we add the the following assignment::
+
+          $USERADD_DEPENDS = "bar"
+
+      The practical effect of this assignment is that bar's sysroot_setscene is
+      added to :term:`USERADDSETSCENEDEPS` variable.
+
    :term:`USERADD_ERROR_DYNAMIC`
       If set to ``error``, forces the OpenEmbedded build system to produce
       an error if the user identification (``uid``) and group
-- 
2.34.1


