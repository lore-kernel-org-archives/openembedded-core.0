Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EC2C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:28:38 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1946.1716312508313976084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLAf28UW;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f174e316eso5050143e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716312506; x=1716917306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPMGszLmxqrgRbEUYpOB9JaWRu0yBdrakM2O5lKUkVg=;
        b=RLAf28UWrZSfA3kXwwZ19kcmzeIpX2XTR32gUGfIs5BIfWo6VVQvb+YIht2j7/yYrk
         3vIMRQVB4KL4Cly3FHq9x2dis23hdER9aOf7POpCSkIG3wewOz+x1FEbB4sYlSJCGNsO
         YUnH+30J7uV6aigvE2jp5cwm6r7AnQ6IveRM9xKhJy23UR7VCGJCS5DfzRIBVNO+Rn5W
         US82Jf9pC/pJmH+RAGsY0IJM81BG4zyu7MPqWjQ7oA06dPyd6Yp4Ob/RLMi3HDZthe/V
         JENt710T4BeOAwJaZHdAAoQfxtBPil7aJy7k8PuKUlGzMwTuuDwUAS5plhHhLNPiWCgY
         /3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312506; x=1716917306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPMGszLmxqrgRbEUYpOB9JaWRu0yBdrakM2O5lKUkVg=;
        b=GR4u0QszTTSLRErjxwomlVL4BBCyjL6GETbg83hQnuiOwiwunKk4iOIEz8XD2edsq9
         3ZM/aP5+NXBMrpFqYff4ZhOdirjeJaiZauU+b5tNl+ClzYaNsaAOb7eyiiJMa7vs9OFR
         2XnRb4G3VZ2rh4EKbsTEck45Wlr8THP2qb/Vm24FGY7dN81AK5/vgp6IzUklTjqh6XUm
         qo1oyZ4dddikHLs+WAiJCDqa0f9UGYGyA0cz6kRVJpp43jj/3K2hE26BqvRAA4mXok+P
         5qQ2Mg5quhz7xjqBwi4Q2hp1+QT7AxL7NiLta+VwGN3kqQpM2mdH2i6NNoa6iKLl5LS0
         b7kw==
X-Gm-Message-State: AOJu0YzgmJov6D3+z8BV3LVm1xj5RURKxI17Pfhi3z2htvx1HoHx6LtU
	oSJQr8K4q0scy20mRugEmlU77ykmxrXjKaH9SEYKBMLH35efO6Nlp7PQUg==
X-Google-Smtp-Source: AGHT+IF0nCxxhOmwt4TBuR1+Gu0vzfgLxSB59ySFnqmMOclPVmM+UfiaPMyO4hEYJa5Xqu2vMygeJQ==
X-Received: by 2002:a05:6512:28c:b0:51d:bbb:7a4e with SMTP id 2adb3069b0e04-5220fb72d7dmr19957292e87.24.1716312505839;
        Tue, 21 May 2024 10:28:25 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad4dbsm4727167e87.50.2024.05.21.10.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:28:25 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 2/2] ref-manual: classes: add new image-bootfiles class
Date: Tue, 21 May 2024 19:33:43 +0200
Message-ID: <20240521173343.2954628-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199668

Describe the newly introduced image-bootfiles class.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 documentation/ref-manual/classes.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9520d0bf7c..53b3697bee 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1169,6 +1169,20 @@ Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-image-buildinfo:
 
+``image-bootfiles``
+===================
+
+The :ref:`ref-classes-image-buildinfo` class copies over files listed
+in :ref:`IMAGE_BOOT_FILES` to the /boot directory of the root filesystem.
+
+This can be useful if no separate boot partition is used but all boot files
+should be included into the rootfs image.
+
+:ref:`IMAGE_BOOT_FILES` is the same space-separated list of files used
+by the ``bootimg-partition`` source plugin to populate the boot partition.
+
+.. _ref-classes-image_types:
+
 ``image-buildinfo``
 ===================
 
-- 
2.44.0


