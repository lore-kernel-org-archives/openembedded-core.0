Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E00C32773
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.44421.1660841831350888481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=d17Lg+M8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id l64so1762239pge.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0LmcU2P/p392Mz9bz8Wii1UirvsbQ1JuzBZouUnilEE=;
        b=d17Lg+M8V3s46q50P/fyNHuz/mtv1oiq5uaoZFk9kZjICOrmX//0qb6B28zlk3GgzL
         eDEffFdNDS9mD9kPFHqca9YbWSqRxy3Rj3q4LBUYCNitA2cq4k5+Cc9o31FHUZjlRlNt
         acpoSnwaU4VOG4qJEz2gmmYmsjq+MU8AA58BG85ojMNA37OvMBBJyhzRu2bFXSxRNb8t
         rXKA2CgOjxvwSkzr8rYKn0NLuAOT5mD1Tc+bQdhv059v512SYfBBwsph2AdmHLCLFkXZ
         0FmVpw9AEtz1k4uBd9btHCUUSLDHtYk9cV2EPpUguJky/QfZ5enihaUl08TbKz5r8FRw
         kwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0LmcU2P/p392Mz9bz8Wii1UirvsbQ1JuzBZouUnilEE=;
        b=GaAPp2a/q5HVRmFQEAK/cMOx3bgUflgdPVmXzcKxaHw52CXyjDmbOr2wFOaThZq4yZ
         tiYBc0lbGaokOz7ecJefdyTNvIsRUd/kUyHE9QORvaF52E08lWls7P7O9skohtvOJ/JX
         42qKycW+v5FQlDDOfN5FjCZ/PN+P0B0RI5e6AnysoDrwL/wOc3YqpxcyxZMNMfj1Q8Sc
         0choLJBsgZdNC6vaDIoqitQPsZZY/0oB8b3jPUv52ae4QSYfw5bin7vCssLCY2QWW49k
         Yq5UvKtLkBcNNsPFqOg9UwY8YtFHFYNHjAJW9GIItZj0hQ0RYhFa/cslC8kaifKHb1Kz
         K7Tw==
X-Gm-Message-State: ACgBeo3yuGqpzDjYAokYNl/qndLhDpmthRE+9z14iIqv06hGR5MBZkDy
	jrQtkjJzKt0AyXG7n/Dxfxs0PKhirNQd32Iv
X-Google-Smtp-Source: 
 AA6agR6IL7/a8ligc45TbBcZMGtdckUuWUe74Ug1jShUBWlYW1zOfWVSzM1/zUALIbe45KowJMxBVA==
X-Received: by 2002:a05:6a00:188e:b0:52e:2606:a805 with SMTP id
 x14-20020a056a00188e00b0052e2606a805mr3716516pfh.49.1660841830389;
        Thu, 18 Aug 2022 09:57:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:57:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] bin_package: install into base_prefix
Date: Thu, 18 Aug 2022 06:56:26 -1000
Message-Id: 
 <a995748d324c40dfa7a78d2f385172748c9ac86e.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169531

From: Pascal Bach <pascal.bach@siemens.com>

This makes the bin_package.bbclass work properly with the native class.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad330b6d4b6e2ba051b5c6c437e07a183831f757)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/bin_package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
index cbc9b1fa13..c1954243ee 100644
--- a/meta/classes/bin_package.bbclass
+++ b/meta/classes/bin_package.bbclass
@@ -30,8 +30,9 @@ bin_package_do_install () {
         bbfatal bin_package has nothing to install. Be sure the SRC_URI unpacks into S.
     fi
     cd ${S}
+    install -d ${D}${base_prefix}
     tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
-        | tar --no-same-owner -xpf - -C ${D}
+        | tar --no-same-owner -xpf - -C ${D}${base_prefix}
 }
 
 FILES_${PN} = "/"
-- 
2.25.1


