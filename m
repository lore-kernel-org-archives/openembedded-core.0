Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AE9C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.31712.1742141546434187364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KU1AhtYA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so12803595e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141544; x=1742746344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aXiZWnUIl/cACtHcp7bFZsUX1GbsMOLlk1MPhgTi+8=;
        b=KU1AhtYAgNpl7/Ad6tR8NnocT8NtiriOqFLUWhuRtsYgQ4+S4N4gqRi9fwudkqqFKs
         zuvVrx3xSnyhRhNQ89gfALjigoxPEqo5SML4QZaizsnLnk8GaADMmMputxkSf9ZkVj3Z
         /uq2SkIzxqgTIUVOpltBIhTjthEeRvCSh+XWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141544; x=1742746344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aXiZWnUIl/cACtHcp7bFZsUX1GbsMOLlk1MPhgTi+8=;
        b=c/cyruORGXRHbrzS9DwxekM0A6KnjX78pWScXKQjSrNq4vV0gPxLR7b8JYECVpplr5
         HF5G3MoeqL/iR+iesZGrHfVjpI4M2unxEwfxRZefl6lJgkfQV1EqXf2c8PeiN9KEJ1nH
         L454L2rCDpo9JOfKt8B+nvtN5AXXgCBvnjRaQW3qEHr8+9JLGJHO8puyuuLaiP6CxU9L
         LcfG8x/wwq2f07WIEJmW4hV62U3Fh1d/KvakKdyXdqC88KADwIsApJzxS6rqUQXYHw3I
         DWr4R8ZLT5g9ha2OfpsIPuGpeg+mIV4ZMkR6mYkc9+sv8QXNFdai8XuKaVJ7a8BpVtF6
         hNwQ==
X-Gm-Message-State: AOJu0YzqOy6Q7myA9++tkmefrgoTP2C501CVsSueSsC2hLsRnmb20rbP
	tnTMvGx3sSpekqYn6ZqmbytsVmHVqaY5yjWLBl3N14eseyTgxPDgsxWa4VcDB9kQRIVS6BxUf1y
	Y
X-Gm-Gg: ASbGncsJ9y8xnmvG3fASlTZsCsC83tOR89A1sLyEnmZTFShytrcguHEI2vsBFauXZsX
	9+TWYyVDq5SU7N8vX3FYTxLlFse7FsKDl8DhtKfGDC1UTM+ixrV6rhejyuGWpvO+oFwFZgw2Eko
	+qRWncQtFYC/Brlfayv7K9j7cwsVWeptIctnid+qEYVMlqY9gd2go37/rJzXrz/58yrwCp7ZPf6
	G+xj11iY4V9nZXMdcWdPdIsY4n+d+J2uqr9h1lS8vcZH+ur24p2R7Akjq506NJmvC3uMvPA819+
	JDsP37Xs414ljhdTT5RGCH8CwflnLVSYdCyJQLM+pMzHn1o6aFhLYHQOZp6Pc0iV0ezutXa9ZA=
	=
X-Google-Smtp-Source: AGHT+IGnry10rsrbify2ep02JQ4gQgFJMeKdRsxnwMuNCSGEsddyuGdF7ieT36rVQ2J21Tbn7JJkHg==
X-Received: by 2002:a05:6000:25f1:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-3971e971cc3mr12046455f8f.35.1742141544043;
        Sun, 16 Mar 2025 09:12:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/43] hwdata: upgrade 0.392 -> 0.393
Date: Sun, 16 Mar 2025 16:11:36 +0000
Message-ID: <20250316161209.3629986-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213013

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/hwdata/{hwdata_0.392.bb => hwdata_0.393.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.392.bb => hwdata_0.393.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.392.bb b/meta/recipes-support/hwdata/hwdata_0.393.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.392.bb
rename to meta/recipes-support/hwdata/hwdata_0.393.bb
index e0a1a7fbb21..1517a1d35ff 100644
--- a/meta/recipes-support/hwdata/hwdata_0.392.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.393.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "e3aac7f6bed87ca6d701bb5ad30f29a8df857f66"
+SRCREV = "2b7f8370a5b3b1552d8264b8665ed99ddfea0b57"
 
 S = "${WORKDIR}/git"
 

