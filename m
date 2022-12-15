Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CD2C3DA71
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.142657.1671132090268548050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LOnPg+4S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d15so7897052pls.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECSmod6b3vtRRjnfA6OOtFtelkJGhaoz6twAgOFMvcA=;
        b=LOnPg+4S14VKKKuwmGIumj13yjYONLI9qBCHFT/zDlM1CqbHXIkqgut8NbWJHSy5cM
         gL3bwDWXbT989g1+xIyWVCfreilH+wtie15/4HJWMt8QHwt+TUgopjy2TO3anOn72LI1
         ggAuxgYCSr4XlZh9hjITIwwBCetFDvz+MYagfXyqxt1iEHtNlg5C8w67DIJzgyYeral6
         X/+tqLMjxTfypYZgmsKQyIDyX+HDdGvJnsvtpHaMoSqRDkQAoGff4Hh8pKwK7UOCLLg9
         siUtbAC8Gy4I41vSiBj8/QcoggTRSKt423Co8vf27WPBqqtMPH80RhBBe17uUyD5F3Jf
         F/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECSmod6b3vtRRjnfA6OOtFtelkJGhaoz6twAgOFMvcA=;
        b=DUj4m6rDHIReScfEAoFQm8UX+iK0sBl3bdXKiqmG6phtkrXg33uoT9HURZkeHChdAp
         1lwzLxrDVrbr7Mp6nbPZPuTKBQ2Sd1/P9GgXLh8tatmZ8+6KnO/9acmR2xtFi1+fckkT
         Dp9BcWdg+qklyzfjk7MFp8oQjcWwX5RSuQQ97tvSJ/NFCMbeOBLsFk293IOdWladONNW
         GvwV5VU9dIfCFzJK1oTMh/9wPT5iD8FwYDtDifOBe+V42dici7q5tV9NgLeD9XLPWPir
         j4vCVDYobdlTngdrhBSWOc3M7AHIvBvCKWzFRNs2RI8WPQoKo8ZX8KrFpn1Ihq0JNGSA
         fvpw==
X-Gm-Message-State: ANoB5plNN5IPxs1pSIg5uXNxAGLI0UrEmYtzrfCfDQ9WFEj0cfupBTzP
	9o8QsDmQeTXe1jsgrEndVQlVklKc85KEJumKOEM=
X-Google-Smtp-Source: AA0mqf7ThPMbr7WEOlQbATHZvxBTsJE4Z74sD/MZHhtrd3Lsg/22QqpPNJGqI9CDPseNNBtfhkkypQ==
X-Received: by 2002:a17:902:ea86:b0:18f:a0de:6ad0 with SMTP id x6-20020a170902ea8600b0018fa0de6ad0mr17198929plb.55.1671132099106;
        Thu, 15 Dec 2022 11:21:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/30] rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work
Date: Thu, 15 Dec 2022 09:20:46 -1000
Message-Id: <cd321118ec380d785e5def87c82c3ddf6eef9b3e.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174614

From: Chen Qi <Qi.Chen@windriver.com>

For now, if we use rm_work and `bitbake core-image-minimal', some
recipes' WORKDIRs are not cleaned up, e.g., makedevs-native.

Adjust the dependency to make do_rm_work_all depend on do_rm_work
to solve this problem.

Below are the detailed explanation of why this would work.

Without this patch, the dependency chain is like:
[other deps] -> [do_rm_work] -+-> [do_build]
                              |
[do_rm_work_all] -------------+

With this patch, the depedency chain is like:
[other deps] -> [do_rm_work] -> [do_rm_work_all] -> [do_build]

Such dependency chain adjustment fixes the issue because do_rm_work_all
now depends on [other deps] and thus the [depends] of these [other deps].
Take core-image-minimal as an example. Before this adjustment,
do_rm_work_all does not have any relationship with do_rootfs, and we have
do_rootfs[depends] += "makedevs-native:do_populate_sysroot ..."
This essentially prevents 'recrdeptask' setting of do_rm_work_all extend
to makedevs-native. With this patch, the do_rm_work_all now depends
on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all's
recrdeptask could have effect on makedevs-native.

With this patch, all built recipes WORKDIR will be cleaned up with
a few expected exceptions such as kernel and qemu-helper-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b25cc45c9b39f79ba0a03c4556cb2e2431677b4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 4121a13279..1f28bc7187 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -180,7 +180,7 @@ python inject_rm_work() {
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
         # In practice, addtask() here merely updates the dependencies.
-        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
+        bb.build.addtask('do_rm_work', 'do_rm_work_all do_build', ' '.join(deps), d)
 
     # Always update do_build_without_rm_work dependencies.
     bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
-- 
2.25.1


