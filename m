Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD13C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9128.1635325670961128296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nMdhqsVv;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id e4so2871144wrc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNI66L8/Ed1BoY7SeuIyIrrQ1mFZLHqN4A/VAip686M=;
        b=nMdhqsVvfg8Y3sUJ7vPsXN/NrjX33cgTOg4ad4n0eX3ESyNIyeuZVVSlaJjr/S/dXE
         3lAlLsR71+cNLQwtbP6WGU/K7BI3UmkhiiMTK1CsMmVawXh5bCY+/llyzuUxIVri3hZ/
         gp89jowQaJFQAD6oGDmgz41fVtUI7VtpxU1bB2EEMJwFTCPN+a7R7z5aenjifiMTsG3A
         Rm8ME13nWwxOiJkP8upiblnp0PRdTTCs0Cr4ezSHUHgsGCZoGKxG0Ovo3hiGISVBaJSU
         wBkk8nh/v0wZmtMYT0HVJAYk1O81G2cEBsCnS/gfy706jEETMU75qhPioR1kGED7tR9g
         tq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNI66L8/Ed1BoY7SeuIyIrrQ1mFZLHqN4A/VAip686M=;
        b=w95+OSOzGqci1lpx1YfoJX0QNkmoaJOYJ8X8xLUMDNrLRYY/35r6LopHYLCKV3po8G
         yo6d18vwx7DpWMrD/2kV41eR1BSXx7C1TAYOgXgEyhoVYbGHV4KuxQlkHQ3nXod/yiVz
         erWCf2l4yYl+FXqAu+r0Z0XbM9JtkZdgSFkxOP6+VeGkUTbT1EagmORElbNLlOqWHgIq
         6V3hd5+Evkrl3qOnx7sil6pEhluj91UZ+HqVWU359iZcFnABdCa1DW8DUocJ9jWidbcM
         bggOdW7Rf4RwKiHERd6z6+lNCKgxyPkSS5wYE3Qcau/pNFRkmbaxlQgvo15Pdx1aMPEX
         sQGQ==
X-Gm-Message-State: AOAM531+jBYDAP3jXFduAxdUaQoDjxzqnvMq7T69kF7akYH8NujyOWGd
	AeWp73DBUSZE7HJ47R1ak91Zaw68av8=
X-Google-Smtp-Source: 
 ABdhPJxJmhOdRgXGJD4o+UBDXxy7y9BcarWxHhzrt4igtVtqBmm++RFaD/jUthIYmDKIK36rCq8B7Q==
X-Received: by 2002:adf:b1d7:: with SMTP id
 r23mr39283147wra.145.1635325669620;
        Wed, 27 Oct 2021 02:07:49 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/30] libcap: upgrade 2.59 -> 2.60
Date: Wed, 27 Oct 2021 11:07:23 +0200
Message-Id: <20211027090736.2546759-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157493

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.59.bb => libcap_2.60.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.59.bb => libcap_2.60.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 6e43ba3366..89f6bcd65f 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 75843ed8238523776683a8660621d74c06597f11 Mon Sep 17 00:00:00 2001
+From 42b3e19d4e584fb9b47fb471e02bb25de90ac641 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.59.bb b/meta/recipes-support/libcap/libcap_2.60.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.59.bb
rename to meta/recipes-support/libcap/libcap_2.60.bb
index 3d2592d962..030198c41b 100644
--- a/meta/recipes-support/libcap/libcap_2.59.bb
+++ b/meta/recipes-support/libcap/libcap_2.60.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "49f64ae40b113e53cbc161e22af7094e3bb4a0611fa33ef5a4257b011779f034"
+SRC_URI[sha256sum] = "06a92076ce39a78bd28089e32085f1bde7f3bfa448fad37d895c2358f760b2eb"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.20.1


