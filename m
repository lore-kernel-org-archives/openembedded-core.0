Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719DEC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:13:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.20262.1700662436389481001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LnHQXlTU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32f737deedfso4256083f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700662434; x=1701267234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5oY+eu0smNY8s1h5s3wtZjRcfW5+9Qu5hKvhGyoM6c=;
        b=LnHQXlTU6ipSWowExsoe9G7+awoOd6We+3Q0podR7zuzi8AkF18IJSvI2qoN05GXEn
         3A7w4Itpv90T1XmTbi8LIyFeyVC6LyhSZewyOCV8PxIhkn6UW3+R4tLuH2wPeGB9S6fq
         aoKWEtk5s3gJ0Zaf65adGW1163VbT5Rzxzv4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700662434; x=1701267234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5oY+eu0smNY8s1h5s3wtZjRcfW5+9Qu5hKvhGyoM6c=;
        b=tplpia7WNLaj4diX7CDU1xJ1srTInvaRaFbCHRZXNXsHPdR3NfloUS2uW19g19O8/K
         TYipzueGEc9SWQ7RvR9x2j3bC+aJMfpWUYyEx4u7NypexocxSJKAo1ixqo4oPucOm1NX
         0cd7WhQ56Gg3voLAG07COh4bct+GlOMloapIG0EaOyBJO9hdZPdjQbcjFH8wct5KahCc
         Z4jEvJUakgCTQDupkVGecGYRfBg8fjHPsHJ1Yr9/j6u41FG44L6FUhEDAON/ypwh4SA8
         65LxDOC2aRzPmdfk3iLu+o9M5jn/2xSKrqW71AbZRcGhDbX8K4IsT+cdHv8M3ed0C2Ho
         1r4A==
X-Gm-Message-State: AOJu0YyXxGcLiHP4KnYLYzs4SPVoFdHJ3uD90fWnMX/tGqJw1IMzRdXE
	qNAgE+RQOxzO1wCvOy9mDBbbN9272UfQODzq0qA=
X-Google-Smtp-Source: AGHT+IGVf3JWvOylHkq9Dz3OAkgHnpHOQvQbTlJnGwvO08Esd0FYDRnrUks0koNvESolL+0pnhhFTQ==
X-Received: by 2002:adf:e78a:0:b0:332:c692:fae with SMTP id n10-20020adfe78a000000b00332c6920faemr455441wrm.26.1700662434547;
        Wed, 22 Nov 2023 06:13:54 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id q10-20020adf9dca000000b0032f7f4089b7sm1902938wre.43.2023.11.22.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 06:13:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/2] shared-mime-info: embed PV in the filename
Date: Wed, 22 Nov 2023 14:13:51 +0000
Message-Id: <20231122141352.3484673-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191108

From: Ross Burton <ross.burton@arm.com>

As this recipe tracks the release tags we can embed the PV in the
filename.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{shared-mime-info_git.bb => shared-mime-info_2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_git.bb => shared-mime-info_2.4.bb} (98%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
similarity index 98%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index 937428221ef..5ba40236096 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -10,7 +10,7 @@ DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
 SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
-PV = "2.4"
+
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
-- 
2.39.2


