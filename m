Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05078C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.44027.1679494945992556081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mAClRyHj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id a16so14310792pjs.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu9dO20FjC/VrcHgn8Sorc1YfBFDiZv9CwC8h1Jj77Y=;
        b=mAClRyHj+DdAUYNItupKSotlxOZR3plS46KAbine3upMz2y5wXu/5HLcyKAAeE5jzK
         muZWz+/hEvoAwP+0/63fyYDL9vYfPGfumIiAN7z4HssCufncPgWpfznUvANBNjSLfXx+
         gz1SZ2pAERtUiLM7lUpH5z9udUhfxnS2kLu/EhMEL3isdvL5UlcPI6+uLamRr3rkpVs9
         UwHV/x+v+pnizrccIB3JrXx5ht2w1sxvAgp08W0EUSshzvvpYjFb3DeElCeQyIYSXJ+K
         JtS+RIVF8jZCpcZknfT/Kx8KoE59jWHSXEVX5yfhx/BuqOJTR8ocJAU69K+ySDLX2kRC
         XTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu9dO20FjC/VrcHgn8Sorc1YfBFDiZv9CwC8h1Jj77Y=;
        b=bvh1Y4K3JG0QO0mbFNkZpBRfKql6JXvHjuIJqkGxoAMIFPqDai7bMYUi/ctOOtSV80
         hSgUyAi+DVWnoDHw0QeIHv8MyoWQQvshWGcmj0icus/RVw5O0a120E5GDEsHZqbebrGX
         IF7jZBaTSSpIZPaYQiOZqoKiLZA4A98qvQqp+WkGkl9m7Rke5i89ahqSiZ9X6kHRhZJM
         Y4Px80uAfsIEIJNp1nO1TVAXWdaKGg5QVKaTcmkX5D1GrQNfmmRS/bHnX3baY9R9CiAW
         fXeM6hhzilNDxJQP8xbZQKXp60xDaPSukF+MFUlV72NrjstB7Oc84EjkQO14WoQFs2Oj
         lm3Q==
X-Gm-Message-State: AO0yUKWNSk4PM/GTKZUpDprHaCQoSthtTJrSF0xzCJQPmgFuuY6wZqYb
	2uvSuXKLWu9KRhrF4SQDdz4NAv0oXS9SgLsBLh8=
X-Google-Smtp-Source: AK7set/AWDeB3rtPMH3hIqibvFWqyG7TOhkxyJR5GdwrhItpzLu0MVGM48W1aOCMX+hi5+7jxoML4g==
X-Received: by 2002:a05:6a20:2d94:b0:d9:81b5:36f8 with SMTP id bf20-20020a056a202d9400b000d981b536f8mr5743642pzb.29.1679494945026;
        Wed, 22 Mar 2023 07:22:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/21] systemd: fix wrong nobody-group assignment
Date: Wed, 22 Mar 2023 04:21:40 -1000
Message-Id: <a0ef4386d37f84e8f169cbe3cfa9307010b89bbd.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178946

From: Piotr Łobacz <p.lobacz@welotec.com>

The generated /etc/group file had a wrong group name for nobody-group
which was nobody with same id as nogroup groupd. This was leading to
duplcate groups, with same ids and different names.

More can be read on this link:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11766

Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d69fccf2e5d108dd7c6059310924588d36a45865)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_251.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-core/systemd/systemd_251.8.bb
index 3c87e71485..991da07368 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_251.8.bb
@@ -217,7 +217,7 @@ rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
-                  -Dnobody-group=nobody \
+                  -Dnobody-group=nogroup \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
-- 
2.34.1


