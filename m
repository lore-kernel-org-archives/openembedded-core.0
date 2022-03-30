Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893AC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 12:23:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.6351.1648643028168780091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 05:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwk/gVP0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so3381990wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OHEti0YKwj87nai8DBlqnmfn2jOIUYff1NdJEmc8bEM=;
        b=gwk/gVP00hfMX2GGu+++a5qajBzSj5kICKJH94G2VsyKVrhXJhhEH0/O5kQ2q/0rxJ
         Ta8ORk2L8EaySBPlqsRfWjluurz0pK+3F3ULgfFk+u75cs25iVgptzYG89DzJvkUI5Ry
         dfRfBBItUS0yun6Q2knoIimKwv9ZtcKLUY/ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OHEti0YKwj87nai8DBlqnmfn2jOIUYff1NdJEmc8bEM=;
        b=Z5/OKCiqtPxE4BGxHUE3kN4LFmBUpHnpIpd2yzFlJkJcXxyv7nBjODZ/BE+LVkgSGq
         4UEHD27pHFYADzfqI3LKvQKgGf/pyZtI9sL9HPdQJHb/Xv9djY3CDxExDpnAk3PGyYGK
         8p+4wyXMWDGjc5djbUwV26aEpcqv6gqKo+It1jyGU19e951Q9qxLsRfTRbD7WBdPn8/X
         JPtdkdiz2oTKu5ciWdQH04qDopc95b57m9gra1W2yaKpvxM2HBdbtJOUsUJ0bBMkodG3
         cebIa3xbHNQ/TTLVHvZb/qPci1I6S73T3lUPeFSTyGCvLeghYZ2e3GxlnNliYqxUulMO
         YYiQ==
X-Gm-Message-State: AOAM530IfcH0oPpGEEfCAdFXqg78JCXVrpvlzcDReyYoUE9qv1S+ly0t
	Dx9RgSIeZsAbk+74+RhgyZZxYKYQwjAzvdv7
X-Google-Smtp-Source: 
 ABdhPJxtLckN9abPzeIMAq36EXg/Nq1gev3PAHvPTL+JczAdPZhHmtS1ygOlC0keOslleoc1cd/YbQ==
X-Received: by 2002:a7b:ce8b:0:b0:38c:ca4c:80ae with SMTP id
 q11-20020a7bce8b000000b0038cca4c80aemr4020621wmj.144.1648643025969;
        Wed, 30 Mar 2022 05:23:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:367f:29cd:9517:5c4])
        by smtp.gmail.com with ESMTPSA id
 z18-20020a5d6412000000b0020400dde72esm17096121wru.37.2022.03.30.05.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:23:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC] mirrors: Switch glibc and binutils to use shallow mirror
 tarballs
Date: Wed, 30 Mar 2022 13:23:44 +0100
Message-Id: <20220330122344.1507091-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 12:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163785

These two repositories are large and overload our downloads server as a
premirror but the recipes are easier to maintain as git urls. Compromise
and use shallow clones for them.

In order to be effective, we need premirror entries on where to find
the shallow mirror tarballs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mirrors.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 37dc449ade7..ffdccff5fb4 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -76,3 +76,14 @@ git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \
 git://.*/.*                   git://HOST/PATH;protocol=https \
 git://.*/.*                   git://HOST/git/PATH;protocol=https \
 "
+
+# Switch glibc and binutils recipes to use shallow clones as they're large and this
+# improves user experience whilst allowing the flexibility of git urls in the recipes
+BB_GIT_SHALLOW:pn-binutils = "1"
+BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
+BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
+BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
+BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
+BB_GIT_SHALLOW:pn-glibc = "1"
+PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
+              git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.32.0


