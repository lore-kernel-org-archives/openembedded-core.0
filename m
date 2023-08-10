Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C470C04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.21262.1691683485363132774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hgt+1WUn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686be28e1a8so809677b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683484; x=1692288284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPKUoQ4Xf9JSTrs5zuPZlB8X+jQY+uQXHo5MTaOM/qE=;
        b=hgt+1WUn+g3NvxTFc9SZVd4R2SzasOpXDZMmYtzrgCtx9sZH3HMykizTJUBO9M9XbR
         b6YK2l4b6aSsQ8nBS9xey+UdxuwT3Zijnc99cXfT0l6ZpuXoixJXIXIhsJTJLYfrYeTX
         eZnqTg3p3EkfAV7SI4fEdn8fqk9sZRXz9RXnurEx/gnd4cVJ4T5qzc2eLNgviMNBE05y
         adhR8H3bPhnoWsIjnx7qXiMzpiDOlC9tx7DVjMVnhymihhxqAqq4tONZmWFyz02hq5Vk
         VVk+wvgQnXSDvJBjOT0uWm2zXs4kpfH2m9UwxvBHZ4yUq9C1jmekHxxaloeCwj4p9S3Z
         ocpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683484; x=1692288284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPKUoQ4Xf9JSTrs5zuPZlB8X+jQY+uQXHo5MTaOM/qE=;
        b=M18tWupIFbevB4BjapNcRIX7NFscKDumYITotJ44jUcQCqBzp7+zF7Wm5KwUP2CpA+
         cgpKt9sYbN1C7ZHCjJmyxDKhTm1lPuq8yPzJLdFX+mZY2x6W/Iq4IwvlujtC7cATptoE
         U2WVd7ezXPVP1srjOHFq1eTdo2dYM7aVbIhIHPOY3yYsgSCgyVmsRtmzk0xZKRpWNeFv
         tK0EVtKLlYXVkLCgVbMqn9/Etily/rZG01jMb3whYmdDkAZi0w/4wDoDyynlenCnEg2L
         XWASaDSY6Jx4S/xjX5Cnybc5UtKBSAm0nkERKhYs2ulmrvu4DpPPenjbbEH239o1z/YM
         SXnA==
X-Gm-Message-State: AOJu0Yzl0swbFwe9o+DMWNtcvbnyIVHv8oe/gRaXqJQD/dqAORZq2vmY
	1WYdASxX2jLc9mQpZFpPd9QNfP4hcVCCNRoRKNM=
X-Google-Smtp-Source: AGHT+IF7BunVPMFZdS6HzbOmknV3597gCUFTAXk021qg7DiZkHCS4x80nFhfOrEd9C9gTnyOu2MS0Q==
X-Received: by 2002:a05:6a20:3d8c:b0:140:a6ec:b56a with SMTP id s12-20020a056a203d8c00b00140a6ecb56amr3011659pzi.3.1691683484345;
        Thu, 10 Aug 2023 09:04:44 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/37] libarchive: ignore CVE-2023-30571
Date: Thu, 10 Aug 2023 06:04:00 -1000
Message-Id: <ffa8f92aa6f8405d8fea117af2f212ba190de393.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185763

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
index aafede3da8..6e0bc426f5 100644
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


