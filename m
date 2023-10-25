Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0836C25B6D
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.35674.1698200981261781306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XDlsv7d+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27dc1e4d8b6so4446067a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200980; x=1698805780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcqcfvnkdrksrDwIpLDiO7efY006gnbxkbka3WYMKBM=;
        b=XDlsv7d+8SZEhdKFsrzPjsJ6OL9pIieklt6mXLDlDUZip/QjYulxrnSixcEUSKHqoF
         EYnEqOttiLCX+kFphcMa8z2sZpVGpLgjK/m4C2fioMDcRYnNozuMAaYvB1bPNeXIpwDa
         8Oq6sTo1auev6T6W3GW4ufD2BVsDBbKsjeu7q1jAWqLMwcTJ2RD0Al4hVu43xDKQMCrQ
         ZpTjgzyABvZNHCZff83Bk2BzGgB6/fnRuBwIuNWSXfTbG0f/b7bbHjPsqw907aEB5C44
         OQZSt7BStFjn7Gi57k6VsxMqoWpzweSiNiUu2a0miUygjnQzBOgy/KTUX5+rqpWSkiJR
         kyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200980; x=1698805780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcqcfvnkdrksrDwIpLDiO7efY006gnbxkbka3WYMKBM=;
        b=YSNZL0chAo5zBVQABeaSyHkLAq00toZBpboeWt0sfuMl4pjqpYGeLS/Zjv7yuDxvdE
         dEc7ZiQYVUkk7JQD0beNafBCBExnAdpByVrdtZSXw5jonJow0JZiWRnsAASZ58wmitwh
         8lxp5+LKO8gTRkRjcy2UCKp+e8v/CYvQptKR7hJ8yJVn+p/Ji3th+ynVeu8WNWcoTXcq
         9+Y2V/k85WMExYACYhqqW/6mZccOErOQMoN5sKTnhTfspk9389Aqfkxc17jItDlBnN52
         g17sZETGp57ofTNCpl8lHTpJkn+UT0z1DR6dCGzURS1KTyGolVMKAdbkD9ldGRbPNp+p
         jhBw==
X-Gm-Message-State: AOJu0YxhROmsFznisIrBV/WdQOXfocFvdosndgVZSQtmRogrsL4A5kIo
	9L9nNsQkiBR3RA1oM8Yl6OvRJzt+wjuQlJYZBa0=
X-Google-Smtp-Source: AGHT+IEh5J3gKmmSFbEU8Rpghs8YW8YGnBg1Yo6RuYzTqWQbPpIAcL0HJ6WVYQyqf1TZNBCG+1jo0Q==
X-Received: by 2002:a17:90a:41:b0:27d:d9d:c54d with SMTP id 1-20020a17090a004100b0027d0d9dc54dmr13041810pjb.34.1698200979980;
        Tue, 24 Oct 2023 19:29:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Tue, 24 Oct 2023 16:29:25 -1000
Message-Id: <35fc341402f38619922dcfc4dc9e58b00be26259.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189662

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 51247cbe0a..d8e88af22e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


