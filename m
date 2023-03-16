Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4207C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2236.1678928599066636669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KcxeWqvj;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so3733895pjg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0e4/8FLaGxOrZ/NTwMkFwtWrBfwMX9TA9mcq2KH5zjk=;
        b=KcxeWqvjj6g2fjOP7Qx7bbRXVo6dETSut/O0EH1AkX2bh6VT52w6hkyPmThc7IkGBj
         tXd0QQ1SI0Lx/RO+lBsqFSLVU22YXxGYRt/46YuoqmqnwT7f0X6idqq5EkphPtg4+Z3N
         gOy+i5AYtBosR13ZOaHXTIoxDwqae3hsT1Ic2xUoCNFZv954wfpb/cf3sV8L0oTr/aYm
         HlJQ9A1wgZLq+BHzBnWja70gpWJuxC+DBXu8BRMWlwZMw0I76qC79jzSuFhLuh8F+qiZ
         d2F9k7VadMoxyklebBXNZ+nY5iGpCABihBtHzi1woLZrjfpXMf2cUBF4SEO4LKt1qwQz
         v9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e4/8FLaGxOrZ/NTwMkFwtWrBfwMX9TA9mcq2KH5zjk=;
        b=29/4fU+I3Cye4vvceG8gQTmbplbdSa5q598oxfrJrnLo5Yv+mNCojV34vvn0hs3PQg
         wc+ax4NsMDsu+Tt48f/NXizakAmxHN89cvyN+bz5w1UHDHRd8AXXENjMGcPi7tHiKt7D
         qzmpm9vW6k4kzXhqtIIyYgikm3sgZlOWC9vbT4sYJFgFnlzQYc5BBMgk6KN+O6Mt6925
         xu8yBpt50KfGdwK7L3raW4w9dYVO+IYzYYD6YQTzhecOiS5oHF18h4xFdTmhN3IcJSv3
         9pEuKjZhypBZvg2a5FRxgQxVYaywxPcz7cNltiUPrfJgp4koIBq8xLMaARjw5x6szC38
         LVWA==
X-Gm-Message-State: AO0yUKXAjoBDPIHNb6o9vhcPc6oUnleB4tq6nauglSgPUlKNFNoVxpL4
	5AuYBuK4xL6phOtU9FI1x7aeSnvrPnQ=
X-Google-Smtp-Source: AK7set9siM2Yy9mxGSqwysIBfA+v4Fh5ZhIb4+nues4RhhzpZacdTrtWeOxsqebgqqtOXiXhtZyIEg==
X-Received: by 2002:a17:903:120f:b0:19e:6947:3b27 with SMTP id l15-20020a170903120f00b0019e69473b27mr1313073plh.58.1678928598166;
        Wed, 15 Mar 2023 18:03:18 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:17 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3-scons: upgrade 4.4.0 -> 4.5.1
Date: Wed, 15 Mar 2023 18:02:58 -0700
Message-Id: <00147706954d59a3880466e759d6a6f9412a14c6.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1678928363.git.tim.orling@konsulko.com>
References: <cover.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178667

https://github.com/SCons/scons/blob/rel_4.5.1/CHANGES.txt
https://github.com/SCons/scons/blob/rel_4.5.0/CHANGES.txt

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-scons_4.4.0.bb => python3-scons_4.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.4.0.bb => python3-scons_4.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.4.0.bb b/meta/recipes-devtools/python/python3-scons_4.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.4.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.5.1.bb
index ad1149597f3..279347ac9ca 100644
--- a/meta/recipes-devtools/python/python3-scons_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.5.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "7703c4e9d2200b4854a31800c1dbd4587e1fa86e75f58795c740bcfa7eca7eaa"
+SRC_URI[sha256sum] = "9daeabe4d87ba2bd4ea15410765fc1ed2d931b723e4dc730a487a3911b9a1738"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.30.2


