Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D319C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:47:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.12079.1634035631943276923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZvAkZW6g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id v17so65519191wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EU70UCCC72Gjinwg412lW4bGtMLSSctUkcMT5NyTT8w=;
        b=ZvAkZW6gPLQroQc9zLUKPG/lqEvqQOR/zxxf+Uchv6FumBQ4O9nXVBdLnrz8RO8lu9
         60SujeSmEUFCVVD1upE4pFVaP111uaHjzsGjrp3odlRa+cHIJPu1OJoET4QzmZ5sNr6+
         sWK6G695FQsjx1FJ05+7LzSv1FT5vOWE+rqJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EU70UCCC72Gjinwg412lW4bGtMLSSctUkcMT5NyTT8w=;
        b=CmR5NGuJY9b6ORtVFSW4Hl4ifcOdxV9SxL3Ki6UD37LEUcU6Pm+UOFud7FWfaqA5Ym
         fwPSFn8Nn5BHdGMNHHC+EBqf1nCgsIc2mN3F/rOZLDEHBbkYvFJYZN6iVsYVudk+M6ni
         mc6e4DHZra5RqankH93sR86w8/1y79/G0B/EDC/c+qbSYT/adZ/cEVP0GzNKuccQeM/M
         zfRDvTm+bENX2FnDNxczGf1IpW8T2tOrKSu7C0qXxJVFQNblPfIQc66kb3jx7wwuIqEF
         vGx9d2eKhqEg4vyWKqiFJLZ+vNMa/qzLbHMhdy3wgQe7wGbyG/GXgbQaQAs57fGicQRd
         c7xw==
X-Gm-Message-State: AOAM533WXS/R4wtePF+kwinoCCBweh21Che3a1e8vFV1zntwm2d+UKEn
	CdeRSo9vA0W9nfHs+kdVXiUoyQ4iOvjb0g==
X-Google-Smtp-Source: 
 ABdhPJxQ3Kvgga8Dqr3C9D0fUarvbh8rMXmp+H5xYxZK9FBwRvu3i5d63YuquwTJGN+6dqksb9NS0Q==
X-Received: by 2002:adf:e746:: with SMTP id c6mr15761619wrn.367.1634035630459;
        Tue, 12 Oct 2021 03:47:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d206:d72:2579:f3])
        by smtp.gmail.com with ESMTPSA id
 d2sm11149468wrc.32.2021.10.12.03.47.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 03:47:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libnewt: Use python3targetconfig to fix reproducibility
 issue
Date: Tue, 12 Oct 2021 11:47:08 +0100
Message-Id: <20211012104709.2754053-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012104709.2754053-1-richard.purdie@linuxfoundation.org>
References: <20211012104709.2754053-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156870

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/newt/libnewt_0.52.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
index 84d327ca889..86301b95ebd 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac
 
 S = "${WORKDIR}/newt-${PV}"
 
-inherit autotools-brokensep python3native python3-dir
+inherit autotools-brokensep python3native python3-dir python3targetconfig
 
 EXTRA_OECONF = "--without-tcl --with-python"
 
-- 
2.32.0


