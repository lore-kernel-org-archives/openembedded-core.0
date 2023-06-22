Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8E9C0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.14559.1687447924503414232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hUsWoV1t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666eb03457cso3564109b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447923; x=1690039923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdSHAeSLHqSuc84HMqngLiMaqq9QK9gPAFvtYE0SrAs=;
        b=hUsWoV1tkLxN7rxrrp59aBAbd+DTEIAQt2+vLO/wuTYdjLnCdVSdALKCVFPpJFxdn4
         ZMbKx2NH0JIitbaxVkPxS1TekDLqbDXdU0zDRhBOJh2GJFvQhNOnMv1V5pmBEY6fwF5A
         9cturf63FRf5LOntXNlDQUxbpd238o/NNN31fCCE/Zg5vuTeYHMucAs6INK8YxfeGRXO
         s8S1gKSDlYkge/PpCCVGRb5wKRbjD/hB8YwL9YeYrlIrhdwvp6PL4gA6vAjI3weXYooU
         mzdH3ZrEndjUmt2jhkQcWBML3KS9J7Wwk7/vH5CkVPuPtjNiyQ7kE5vN4ekPILmRZEEF
         KWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447923; x=1690039923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdSHAeSLHqSuc84HMqngLiMaqq9QK9gPAFvtYE0SrAs=;
        b=SS/4QOs8LHzGMbwsxlL8lrb1i5oGaPvQhnFaixrI5NUq0ZQhDg90CgyQQNmrTm00tn
         9HrCCLGHgi+Reh5caUVVjENRZLWXGaupczNCcNwTdeAjd1VsjM/DcqrtqoHsHxpeIHXn
         DMmpiQsmiwvphArVAENU8UZyaSR1oiEd7eVtlOsulMxNrbo1K0PjqOerGiyD4VJjt/60
         UU2UMX7mduwbFHV0EwhqxxEM1P8QknuXHAankrN6wVfcLxq9BJ//f8N1AneY8p8pUHJX
         vN4azIk3oloj2DK1UhGsCHcRK5XER/sqhw49fZ5oMs0wZwzn08/hRmfpsME78oJCo90w
         INcw==
X-Gm-Message-State: AC+VfDxvZOzkGpA9slYoyTEJVDHl7eSISkSzhtnAuyYBEWj/ctNzO1TQ
	FnY2Z15kD3QJhzdNFgAQInjUFxV/MgFzNw6ZEkE=
X-Google-Smtp-Source: ACHHUZ5OP37LBafh/Y00PTyABgzHT3vGGsGKXWOb1sd6NSX1wZXw7u3JbEV5pn2N0Osk/jFoj7Dbbg==
X-Received: by 2002:a05:6a00:1a10:b0:668:9fb6:b321 with SMTP id g16-20020a056a001a1000b006689fb6b321mr7105237pfv.12.1687447923408;
        Thu, 22 Jun 2023 08:32:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] uninative: Upgrade to 3.8.1 to include libgcc
Date: Thu, 22 Jun 2023 05:31:35 -1000
Message-Id: <8bb60a90dbd59b22e5ba884804b3cb47df45e97d.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183253

From: Michael Halstead <mhalstead@linuxfoundation.org>

Including libgcc solves issues with libpthread.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36eb46589fb01374d4738a2c376386c68d06aa83)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7012db441b..51c0cdee43 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.7"
+UNINATIVE_VERSION = "3.8.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
-UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
-UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
+UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
+UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
-- 
2.34.1


