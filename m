Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CE1C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 21:52:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.71366.1723153921357854281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 14:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OfvSRkXu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42803bbf842so14032735e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723153919; x=1723758719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hj61BcuVxbT9XjeBGEjK8LdruvUadtkcJ6XnQpjRckA=;
        b=OfvSRkXuUf6s9wzsKJ78DgF9JzW1ug2lbkOj5S1YHVbI+sKLbb1+1WfhTNGUf14y0z
         /LXluGZ8EfN3VL1BMzYR8DyA3iu6g7obpY4R8mT4uA8kS3fXyOKddeIDN4yGA+Ad/Y7F
         k80bhGhJSNP41CUXld+wIoTTEw+czzda6H578=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723153919; x=1723758719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hj61BcuVxbT9XjeBGEjK8LdruvUadtkcJ6XnQpjRckA=;
        b=iezywM558AYPFHrJNCQoHrzwrDcOIT4hFUi4CcqCysCNldFjLCrx3DakFIH4mmd8ps
         QUIfAymqRf2QupCRArmtHO392qddU4rz9ziDQz6V17zUns4BUsvBC4JTsV2Jvamcl8Xs
         cbrA5uZOE/kM42azBjKRff0VmjOE8LTy8Rt/ikwH1WTyvsjsrBjxeWA8iYynzTyKJy4a
         buaxD2cj03kozJ3x9dd+RNCSncKP6L2qJ/NbDmfVNd6c3qRXI6oFC4mQ+oXNH1BRhEx2
         LtPkq32hKxUpete4MZR9HXKLIMy7d57V7jKEvrCr/x/i8eXVKIPRinC+aq6YJGouaUnn
         RR8g==
X-Gm-Message-State: AOJu0Yxn8ZjBdgM4JFh5D3TPp7wP9s9laGim7uazitdM3WpdDSK1hD47
	ZMGJPMm0ItSdaR+LyS2yKpF3VMjwkUBQptAZkW7z49BYD+7zmTe49iIdSjI8sgZPb2YwVX0SN6m
	i1DQ=
X-Google-Smtp-Source: AGHT+IHEhLYkf9ARJUZNQmS57LBU597h5DOids9PzJfFsDhMIRcMJfflQROH/VlBxKFR/zQwRCPkAQ==
X-Received: by 2002:a05:600c:4f55:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-4290af072a1mr30691315e9.17.1723153919270;
        Thu, 08 Aug 2024 14:51:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43bd:e590:a93b:4c51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7618b9sm44004415e9.30.2024.08.08.14.51.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 14:51:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add truncate to HOSTTOOLS
Date: Thu,  8 Aug 2024 22:51:58 +0100
Message-ID: <20240808215158.444962-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 21:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203147

Some wic images need this command. Since it is part of coreutils, it doesn't really
cost anything to have in HOSTTOOLS and it avoids signifiant build dependencies on
coreutils-native.

[YOCTO #15571]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c5aa073f858..baa1b2df473 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -525,7 +525,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-    sleep sort split stat strings strip tail tar tee test touch tr true uname \
+    sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
     uniq unzstd wc wget which xargs zstd \
 "
 

