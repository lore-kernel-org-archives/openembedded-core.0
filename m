Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8589FC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.8779.1678888891891890454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yItnwOwu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id i5so20136930pla.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcCjWE2ldIr5GEEkF3cqohZo/hg28zonkzuIwT5zwSk=;
        b=yItnwOwu4VllB9VBtCKf1uqF2FXZgGdSZVCC6eei+v5IC5QHfRTj8ca81fpb2Fu8J3
         Xs4mMASjCfbbqULBwhWnlZj326GmxlKC1XaXEYL8tO5P7/tkKvDUOScwnOFP5ETk6/vc
         2lQwP1mCI8qvAVoSq96rP465jVsIjZT6UnBsdLfBbKr5Dz76csn4pAIG9TJ9WuP1r3Ju
         Cwdz+4FD70kC95od0NRNQLehlHpQFqCl8AyRmsXzTSNcgUIKb2B5gg0LfOD63Bz5+IsS
         HGLdMlbu3mUjEJeb+8GGC88bdFZFTELnZfFLPkyFJzRHU5Yr1+9JbzfjiqhUu9l3zcD5
         vkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcCjWE2ldIr5GEEkF3cqohZo/hg28zonkzuIwT5zwSk=;
        b=pyk+EhXiHH0I9cZNBTpNYSUoJk3rLzldd3XNCnUKe5BwtvXy6DEXjTr9hjhPPg+caU
         cKzvH6p1H8E2K7chQq0L3a88DfB4uRrXz9LYJL6clharzulwtZKmmo+/XClDqY5saHm4
         dxzacNhAe30/rAvrTfBi5dYUfMYXG+5ELCIxTWcHxy4P5w55DxFLfXwvk/LYLRbsfXre
         MEfRdcIfUd//cXuxJYOoMNwoNxYah33KrEIK+Vo9JqN2GYFfWSD5kSsUqV+J/XGSEsL8
         LMB0+CuUW/UHIj/5JqpiukAmjyp81nJwuvj0LPkPAMgEZ51KZ8cUlKo52V6JtxnY6FKA
         Kn6A==
X-Gm-Message-State: AO0yUKVfeYJUrN72m3mqz1jFdDmxZYhU5HYmnSU37pkYpjTyCMInwy70
	Dfr3iq+AuyjxMbvH1dizBNNeXMFcOMQzOa3pHOU=
X-Google-Smtp-Source: AK7set82O+PIhKnN5AgSGci8shmFilunSl8saxt43eqIlRc9N0HIl01HaSbKMn4NTGo/+RsS+vXMmQ==
X-Received: by 2002:a17:902:ea03:b0:19a:945d:e31 with SMTP id s3-20020a170902ea0300b0019a945d0e31mr3279278plg.13.1678888906827;
        Wed, 15 Mar 2023 07:01:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/22] binutils: Fix nativesdk ld.so search
Date: Wed, 15 Mar 2023 04:01:04 -1000
Message-Id: <47528fa2aa590b3e04e4cc2b66704143419a92d1.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178564

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently binutils in buildtools is searching for /etc/etc/ld.so.conf
which makes no sense. ld_sysconfdir already contains /etc so we need to
drop the /etc from the fixed string.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccd28c418ab8390118d738fbe914395b5c2a1f75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 59a97c13c7..8a5f4a8d79 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -65,7 +65,7 @@ index 121c25d948f..34cbc60e5e9 100644
        info.path = NULL;
        info.len = info.alloc = 0;
 -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
  			(const char *) NULL);
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
-- 
2.34.1


