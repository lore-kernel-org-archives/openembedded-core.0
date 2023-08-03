Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3768C04A94
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.15686.1691071465354381488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Q7rcxMSG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686ea67195dso689641b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071464; x=1691676264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7/umV3N+7n8FmJziIsUxY9+J38CBURk/OGT3jPp5xg=;
        b=Q7rcxMSGWmKs7UTqomw4gkRuD8VaAql5gg+nYqBpsbBAFTk7XZ3N5HwZGGOUK4d/cy
         +jAD0WbGFStH/VKAH8HEYj4hANRbzKog2+5k1DtbVKZyenSQbp87GKAqHJmReMQF5V7e
         Tz1k7j77vDQUoM2xVjOi21Bsql8JXbwF76qqbQgAESPHGqnaIdBXcXfT6ZYTOblecoTM
         BZK5IQcpzOYA9LRb5WQQOdgSbuC6OE/sVmtT6tylxckAvrpvO5bisttRnDJzYqeUZfg0
         aaVpZDBzMRx07t5mdrIhwHs/IflFr0y3MwIzzeE1eix43VWKsBssh++D553fSKh1dEtj
         zfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071464; x=1691676264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7/umV3N+7n8FmJziIsUxY9+J38CBURk/OGT3jPp5xg=;
        b=AKSto1yql/rgISimSNX5Qtiv6nFzcz5Pz6ptgqJ74NmnLYMp/OixbmOTazll+MNQf1
         2jOYsSD1vLVFuiBa+oE9tj7e0169RFxywLwf3t9oU01nXNviyAMImuZC0KFQWLop6psz
         J+b28uMs+8mV7VX0jPWuHRyO6IUdb9/PRvbeV0V9MoFZCVNecjKKnpPsXZz1VCx+EK6G
         R4m+nYAPnClIe8aq1eCAp+7YwgmfpsXCeHE5cIA9R0zaMh8CeIdqBRfKgkPCWTMvXpfj
         ycMnqJaZrXa+G13j98CTb5QOscs7Yc++2D841CJr5EQTOEYhD9XTrhoAZZdgbchVuDu8
         FUag==
X-Gm-Message-State: ABy/qLZZmYO9mL/8jeNNeW6GlIC/MAg+zPBjPxlGR2pwpfiTNvdMku8/
	3AyX/LkxjAscD5Gp/IUopkiIu94wXl2/oMytKlg=
X-Google-Smtp-Source: APBJJlHXj+lNQSvJDGRQ4vxWUTFhPDkgbOsjkRD8GR5kZgro61iQOarT8W6Wz46HgurwTBboIQxoRQ==
X-Received: by 2002:a05:6a20:840d:b0:12d:23ea:9ccc with SMTP id c13-20020a056a20840d00b0012d23ea9cccmr22321244pzd.39.1691071464429;
        Thu, 03 Aug 2023 07:04:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] libarchive: ignore CVE-2023-30571
Date: Thu,  3 Aug 2023 04:04:06 -1000
Message-Id: <d5e7971e12cdc8748be91b4e6408b42fa86b2f15.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185481

From: Peter Marko <peter.marko@siemens.com>

This issue was reported and discusses under [1] which is linked in NVD CVE report.
It was already documented that some parts or libarchive are thread safe and some not.
[2] was now merged to document that also reported function is not thread safe.
So this CVE *now* reports thread race condition for non-thread-safe function.
And as such the CVE report is now invalid.

The issue is still not closed for 2 reasons:
* better document what is and what is not thread safe
* request to public if someone could make these functions thread safe
This should however not invalidate above statment about ignoring this CVE.

[1] https://github.com/libarchive/libarchive/issues/1876
[2] https://github.com/libarchive/libarchive/pull/1875

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index ffcc103112..0219ffa720 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -33,6 +33,9 @@ UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
+# upstream-wontfix: upstream has documented that reported function is not thread-safe
+CVE_CHECK_IGNORE += "CVE-2023-30571"
+
 inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
-- 
2.34.1


