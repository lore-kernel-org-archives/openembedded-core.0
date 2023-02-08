Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F5C677F1
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3155.1675840928155593088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Drc1UFzq;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso737091wms.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuqdfycGx6jVbCLQgusq2IuHa/tIJWVfoEKrTicrtZ4=;
        b=Drc1UFzq6A/1TEdyZl7OM7lBsxJQNcm8yPjIRYaBr67dc8A072tLJbOPGwTjdE6wc3
         OQMMR6RxZJDv2HXlOuz152a4FF0hTqeW39HvMcFwWyypF2zdFiWjq2nWqrz1dvEiwIqN
         CHK6baBUS46DF5VVNq+dtg6pXFWPnDUwRmYTXDtHLvXZafOQzsDX7Y+I/7Xa1zRR+ZHT
         jLpiyiEUFcvH5IGrXV99csskHD91G3LXcWJygD8r9MYqGLatg+OjBflGIgHP7Erq3a60
         MW+ScqH6N1naAVz74swPrCnBuuKGOsmr2mCfrjAShuOuRZ9iKmRotQTAqdbgUo3g7Yju
         dcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuqdfycGx6jVbCLQgusq2IuHa/tIJWVfoEKrTicrtZ4=;
        b=uplszMZuICKI/UG0lgGwwYZYy+n6UUvFS6T2TfgQwb2CkOAzgL6cja6On8Mm1SGdsP
         T9QsDNAWB/fbDdrxXWXSYYedqFfyuLbjig/Uxxc96xR1IIACbx9LjvOod9aq44eqYiKW
         qsc6OH1D3sesPQIxvaselZQWnmuW2MdYJZAckstCTtLOEc0fexdtJaC5RshDxkibi+BE
         cJ0RLwE7Yg5HbgREktEi1GtZjLDD+8k38vf6+tiSQrL7OhUYCVg7HVwFxDwxPkoxte9V
         egINhYzfP3021L9VuH9A+75mDJpxFMJbQhwMqEhkMfo42mnbgxnIuNJRBaZvBXfhV9N5
         bacg==
X-Gm-Message-State: AO0yUKV8MxdzYDhsL6c3ZihQ/7HW7g7xJBCEiIOcqt0B0SXoFGEobj4p
	TKCsQKgOXU69FpjAgD8szpbTWnhUb3g=
X-Google-Smtp-Source: AK7set9nMy/UkQOdsstvm6mZBNMj/pBEMg+x0/Kt4cQG0ZDvE0SEOC6+wOl5AIygrbXzJYTbcz/glg==
X-Received: by 2002:a05:600c:44d3:b0:3df:e57d:f4d0 with SMTP id f19-20020a05600c44d300b003dfe57df4d0mr5486317wmo.26.1675840926707;
        Tue, 07 Feb 2023 23:22:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/52] python3-sphinx: upgrade 6.0.0 -> 6.1.3
Date: Wed,  8 Feb 2023 08:21:24 +0100
Message-Id: <20230208072143.2930292-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176874

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
index 5e565e745d..f75988a6a0 100644
--- a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2214a89317448c7f792f5b75dd6726e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=066da51ab732319a06beae4f10788577"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "58c140ecd9aa0abbc8ff6da48a266648eac9e5bfc8e49576efd2979bf46f5961"
+SRC_URI[sha256sum] = "0dac3b698538ffef41716cf97ba26c1c7788dba73ce6f150c1ff5b4720786dd2"
 
 inherit python_flit_core pypi
 
-- 
2.30.2


