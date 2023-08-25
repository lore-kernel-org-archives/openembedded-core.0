Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2F9C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5601.1692931672376709284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pLDlGEll;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a3e271491so411340b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931671; x=1693536471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0hXWzN2GXxR3cJkJtlUOVKSOUKcw0sMtDV5eq1BNMI=;
        b=pLDlGEllgMNs5cxnV1nehEe1iYeZuhJipTVW/a/WgpRrVl/uhhEd5JmTQ9F0ve7ez3
         Vu3Q7fmXJUJvQrLr4ZMRv97418+LTlTKuiVeIMWhV9CJAH343ogEIqpEJUqW7/kdKrdW
         mKgXS263iXsay58o4VZ9LyNkc7PkgpZv9Zco3drLe4URgQrAHcL29kKif+pDRthl1UtS
         TAxZFVXRRUu+l6OnMjelNeV+V4XyGDxud8akv1JT01oRMqMneffwYesNTFjZ2QnDjuK3
         vFmSTNdtxZB740wzGP6qf30Tzs+OLSx9zoHOmVKM5746T2+kCbbMlWWleeftL6j0YLgn
         Qyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931671; x=1693536471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0hXWzN2GXxR3cJkJtlUOVKSOUKcw0sMtDV5eq1BNMI=;
        b=OzfibNc1TCUPkKnWSxTUQySjSYrlrnSvqfQIN74wc+x1AtqZoPDEYNUf2XmOar83i0
         muR3ypXCI4XZzsPRDjTvGsdmDtttoCJrsfD5ajUhJ5bAmh/cHa1oFpVJDx0Ak1S7uUvm
         QFGxI9TVzvl9gPnePbJHnVmlL6vpV1wATrgA5HGtwEoMvdjQ1HxqqVGPuceoZuLlJ1UX
         seUUJNrtiD5ol4j54SZtu7Azn2D0LfsSOIK16JjNBy9wDgrCdmzewpKAx1qvenvAiGWl
         AujIPJcqpRXQWmRdb8GXLy+iRwOFpVrXy8zUKXnttLm+J3XuClcZ1z8+4rmfdYB+tW19
         AQlA==
X-Gm-Message-State: AOJu0YxCLFFaZkigHE/nkjCdi+/r2QsVcpVAfD/EStSe7S8kUJa9k5UG
	vssfxJbtIl/eNBTyXy91jCih2ZFpzs/DRPE4gek=
X-Google-Smtp-Source: AGHT+IFiVF5uWmjb+a15SxvXLD/cEAFMiEu2mHxj5HOqCMq84NOpyMY7grP3vSRHTxV0P4Sp0i1Y6g==
X-Received: by 2002:a05:6a00:846:b0:68a:6808:3053 with SMTP id q6-20020a056a00084600b0068a68083053mr11147822pfk.25.1692931671472;
        Thu, 24 Aug 2023 19:47:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] tiff: CVE-2022-3599.patch also fix CVE-2022-4645 CVE-2023-30774
Date: Thu, 24 Aug 2023 16:47:27 -1000
Message-Id: <8a4f312ef3751ecf8b3fe2ac719477c7d9c967d2.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186676

From: Chee Yang Lee <chee.yang.lee@intel.com>

The same patch also fix CVE-2022-4645 CVE-2023-30774
CVE-2022-4645 - https://gitlab.com/libtiff/libtiff/-/issues/277
CVE-2023-30774 - https://gitlab.com/libtiff/libtiff/-/issues/463

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
index 9689a99638..b3232d9002 100644
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
@@ -4,7 +4,7 @@ Date: Tue, 30 Aug 2022 16:56:48 +0200
 Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
 
 Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
-CVE: CVE-2022-3599
+CVE: CVE-2022-3599 CVE-2022-4645 CVE-2023-30774
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 
 Origin: https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246
-- 
2.34.1


