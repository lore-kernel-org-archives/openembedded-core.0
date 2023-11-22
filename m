Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BEBC61D99
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10884.1700620299772314627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MUl+on4E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so5106533b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620299; x=1701225099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiTmPSlYKGQ8mI5LUN+ra/utff2XzQVXqTxml1gsVA4=;
        b=MUl+on4Em9S07kzBKq1H7qptUmSwRihalb60VE3mIb1eH+ipEZB02QWESa2p8mHAxk
         SIcU0sqjVmTQq8WHGGfjOUI9bAZxsvI4iKhmZ1fUXzDhkUOjpNtZqj9qnYLSqstAMWjO
         a2yXMAKfvNLIak8CTeasnlIdDBens+1L5T/iSsPiw2e1sN4G8x448L9a7QcIMTtXlgTH
         xYA6TmWE4FYEb5CPNjdWju8uK/s86yVcxUU2tlCrBpdM9xNRLjGA59IVAU1zeM2Yi4Mx
         xtqtoW4Ew+KPBa5oxP8YFmSjJazbOniciXRxdlpqddl2NybGjXQwym/e1ZRbTy+h3lcL
         5fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620299; x=1701225099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiTmPSlYKGQ8mI5LUN+ra/utff2XzQVXqTxml1gsVA4=;
        b=D0I04ZloN5n6ihbiLn+qps+sGZNG0cwIpGeXeqV6QXC6amNfCgSl04PZ4CXblY03dC
         vq6JX9yZUL6NzVOLejF2nBsnheYOvfEfhIqobiLGtSNfZ4wyWOMtP0Lvem+LtvwpLfCG
         41n74JJiCd4G3SsyjdPc0PFKNSMorNOsJSh0VcifcibdOqu1GFbutD2WbcGiTzp0ZMQS
         yazp21selIGV9VE0caDhbH67C9DZvxms79eb2XjyjVFuVehSh4o7pv/C1Ra1LikmNkO4
         sABi7PJzOnSMKDGjsTPzCOIHLShOlF3e0v2SlpIUTNhMmYO2kvCp+CItKzSUhNElZtXx
         VPnw==
X-Gm-Message-State: AOJu0YzZKq5sYLVlSl34clFmkthVH6K9pAB2mfJ+Tsw1CXC8BBJvIvpe
	axV0AU6gaexI54K+RkXDEmB45rVEQR2a6u8NR0jXzw==
X-Google-Smtp-Source: AGHT+IHxLW68hU1puObYO5BmKp5AlbZ0LVt5wfxtPOQE3ocZ4RGSQ+RmCtIb6JIyxO8gjXy1Os22WQ==
X-Received: by 2002:a05:6a00:391f:b0:6be:287d:46d6 with SMTP id fh31-20020a056a00391f00b006be287d46d6mr1171189pfb.33.1700620298907;
        Tue, 21 Nov 2023 18:31:38 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] go: ignore CVE-2023-45283 and CVE-2023-45284
Date: Tue, 21 Nov 2023 16:31:09 -1000
Message-Id: <60f75fd6a671fcbfeefb634fe88f6faa17b446b7.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191011

From: Peter Marko <peter.marko@siemens.com>

These CVEs affect path handling on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 461819d80f..a0974629fb 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -54,5 +54,5 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
 CVE_CHECK_IGNORE += "CVE-2021-29923"
 
-# This is specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2022-41716"
+# This are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284"
-- 
2.34.1


