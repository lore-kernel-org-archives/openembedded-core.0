Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE94BEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:38:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.244.1686926281218107874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5TWKLWnq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b52d14df27so5361265ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926280; x=1689518280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF8te3yM46iyb0ssjTFPQQmC3A5114Oz1b6Njqf/yfA=;
        b=5TWKLWnqDQl8B2RQO29vfcuuMVT4fs+wemTNLw0V2dFJ0znjRcg6kJguKuVfGUb+Do
         QmMbWd9oSS9OBwlBzzaPsKAYJucvL7to+tdDQpG+uiyVs6ar8KfsPIgPqigYkaqMtexl
         63oyr7gWMtIm+IAUx80U1CiROx1EtXcgi39zrZkc198yDRUqAg9jcaMgJZEla8LzHNxH
         U9DfcPldu364XeE9GGEPsN1WsBliWUv52osez/rdXu0KBbX+VH/eRbeHlhvh3L6PwfZ2
         8YF8lLgMTly4smSpP0qXe5RyehhcngsKId53p2ER1owYsGqM2OcHE0gQXNGpho+2QsMH
         gx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926280; x=1689518280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF8te3yM46iyb0ssjTFPQQmC3A5114Oz1b6Njqf/yfA=;
        b=GRHRDbUdi7YsMc51/4zLgMxdSSY8zReLmZ8BI0mw+8mIobmM0N6SJKZ+7hndnRl+eY
         gLiQ8rsGrWqtf+sDkBGJprlEtvJRCm2k9NzwshCRofhMZRdDxrZguXyGblGqOdtjEGgL
         Wt2ypuaTzzcf1WIDThvWAJVLXPbTCGnsga/Wz9EALFTqdx1lMdrL80fTLHhpiBAwLGgX
         G5J9iouRic4yP16OpPWkWqMTCE/Z3NhHF2kcLdROphHho2SzsQfHLmbZwHQN19LX5y99
         wKSa1ojSVFkpCfkEJPOEghi4NBTHkVKwAuUa+dtNxTYjHxA3WjBQ3kSRDgxqsW2MQ4oD
         3+hQ==
X-Gm-Message-State: AC+VfDzv7ahJTNFtduR5VplPpbo8LHHqk4jHb2kY83jSJuaqHDXZFTa1
	fb9FrJM0+1YEeVl57kbfrpBA0JOLe16sp+wZuVs=
X-Google-Smtp-Source: ACHHUZ6UVgWwJzHRnQGxWiE11R5Yy6qmBo18JDgL02zCqxuVvgRtZWPUimDHrGM2dSfDvfVYKdrUCw==
X-Received: by 2002:a17:902:b28c:b0:1b3:ad86:ed17 with SMTP id u12-20020a170902b28c00b001b3ad86ed17mr2084477plr.9.1686926280289;
        Fri, 16 Jun 2023 07:38:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/24] cmake.bbclass: do not search host paths for find_program()
Date: Fri, 16 Jun 2023 04:37:14 -1000
Message-Id: <1e2866eb0ce0c10a2668fbd66bc28526eec30f4d.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183044

From: Chen Qi <Qi.Chen@windriver.com>

OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM[1] controls the search
behavior of find_program(). When this variable's value was
first used in OE, it was deliberately set to BOTH to allow
searching of host tools. This is to ensure the necessary tools
from host could be used. The downside is that the configure
behavior may differ on different host environments.

Later, this cmake.bbclass was added the ability to search tools
under the HOSTTOOLS_DIR. This means we no longer needs cmake to
search the host paths. So we remove the class-native setting of
BOTH.

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f4ea12f6635125ee793f4dd801c538c0186f9dc3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cmake.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 554b948c32..2f5114b6b5 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -61,7 +61,6 @@ OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM:class-native = "BOTH"
 
 EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.34.1


