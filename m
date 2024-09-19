Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A72CF396F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:47:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3745.1726778871834931332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QpsvTgg6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so11541655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726778870; x=1727383670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHFPkXOP9BuPGf4/EvglqxtfiH8n3RDtKLsJIu3kOZ8=;
        b=QpsvTgg6tr5y4383K8o/U8dVW50lPkPdy6SYb5OeADcgxv5iQ4M1Ny7zzye03uPW5x
         T54bz3edYCqIJLArOZTH+vfrLnEE/mO+DSyyJcmPlucisSLxtUGfDGp9CHqhxby6oznm
         5GSTR9tHs4by7x9i3AtvffQrnIj/iPPs21WPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726778870; x=1727383670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHFPkXOP9BuPGf4/EvglqxtfiH8n3RDtKLsJIu3kOZ8=;
        b=IfR4mMngkq1jRYlP7dKN3tnM7KETsVilK3kCi0KyvOGsuB9E4pPOICkx8tJmxamsYD
         4f2FLTr59YafOX37zFm3EB/lTQVAdGg3aHa+4Sf0M/UZiZQCM7iCzzZA/XWtBP1StrHX
         gfGe+cXZg5Ri3CZ35ouj3L8OJE4pUHiTsBoioVmBEG3JDdRGZVMDkyVEquiEOd7Ni4vV
         yf3eR2VIvudDqeZFZWlQ1/QYDZxTNPps5VWfOsY7xQnCmoeEQxc9IgGcNqNVTKBijj6W
         zqbFh/G9Z02q0GxqVN2Eed2mjytQvoxI9NmRMP8TwXLYVmi9AByIiQRjgRKg1BbhcQEc
         ZJnw==
X-Gm-Message-State: AOJu0YyPupMlizm673CO/dbyGsE9tiyZmjIhDUr6U+d44XVVqTRyZPIC
	/cdBwfRB1bJtRMlEFwqiAqayXj3nh+TqgCuijpXlMHiAKCguzBvsTl75rTOeUqw6Z204yJ7gXo0
	y
X-Google-Smtp-Source: AGHT+IGrfI097EWMlNboHFrFikbIYansJayJ6qEs8io6OYq7ORITcprXU9HwhT4Eb4FuV1PJyTl4Ww==
X-Received: by 2002:a5d:52d2:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-37a42253338mr331046f8f.9.1726778869800;
        Thu, 19 Sep 2024 13:47:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49casm16057836f8f.20.2024.09.19.13.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:47:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Add mingw32 SOLIBS and SOLIBSDEV definitions
Date: Thu, 19 Sep 2024 21:47:46 +0100
Message-ID: <20240919204748.4054111-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204714

We may as well define the dll output for mingw alongside the darwin dylib
definitions. There are some recipes which output .so files even on mingw
but those can be handled specifically in mingw.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ab4c6a2d9c9..3f583668f66 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -307,12 +307,14 @@ BB_MULTI_PROVIDER_ALLOWED = "virtual/libintl virtual/libintl-native virtual/nati
 
 SOLIBS = ".so.*"
 SOLIBS:darwin = ".dylib"
+SOLIBS:mingw32 = ".dll"
 
 SOLIBSDEV = ".so"
 # Due to the ordering of PACKAGES and the naming of the dev symlinks on darwin,
 # we can't make the symlinks end up in the -dev packages easily at this point. This hack
 # at least means builds aren't completely broken and symlinks don't take up much space.
 SOLIBSDEV:darwin = ".dylibbroken"
+SOLIBSDEV:mingw32 = ".dll"
 
 PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
 

