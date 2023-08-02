Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F7CC001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 05:18:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.8035.1690953512270092318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 22:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=klrdML7u;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a36b309524so5077902b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 22:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690953511; x=1691558311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOKzU/Gu6/tsxjdnjax25gtTmSCeAv3U7dBK3zIaDas=;
        b=klrdML7uGEwUG0qqnovzAZ+NdWXdit0wlm8KFQcTganWtkq71bu7lFskWH366fgJx3
         1fACqUuDhOZHu/pzMI18jagQPJSn/hGEHx0JsXLUnZfGvaMm7JJIcCtJf9xecIkHQJlp
         jFcAKRn4+VLVewog6MotLVvGC2XJWwOk4I3w//foT72PJzv0+/7dyLsFCygiZx8eALVc
         K8MGvm/aGc8BSamqZ8oZMjaypHUuYDVKGFu8WL2xkVGVT5cl+dDpPPxuy/pqi4dDV0/Y
         v110gbnwQMTr+G9zOkgn/+RxBsBNz3ry99IlW6m0VNE+rrYwY79Uxfk4aQFD/OAH7Hbg
         4MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690953511; x=1691558311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOKzU/Gu6/tsxjdnjax25gtTmSCeAv3U7dBK3zIaDas=;
        b=NZdWk64wLHHYH9GLJGVG2tmjw6GFtdyi4lxMGuXWo+kXgIqchlr4RgMHkGh0Ffm2rf
         MiLybQ+/ADaqUpVNehC0rfHpjOGJM4H90PiwKrurgrhEEv4qSwik7I34gPT+gbpXYt3g
         MZGTRU4LBIRMTbyZkx1Hfi85PriqbD5vs9xDY/1cgcwecMoZrxUAzoNA3PYbNNtMvlkZ
         oUVbbEazZ+6ChnDAxFH6kaG7l24Cf9Qfd0FCDyfCMGpDq2auWftfdIVVWmDYn4+6BLtZ
         yOGGmXY1jurF7FvRkyvJy286Wh48kWOjLR5unyRfKD5Vzr9yUh0IDgziLB122B8Q5cs1
         y4rw==
X-Gm-Message-State: ABy/qLaGTO8yAo1+1TBlZwqmFOF3DlVLqhq8daj1+3ygcCZONyBM8ZG/
	RVn6Ak1rsNWiNdyIb6h/kWFkOQFFjRh6Tw==
X-Google-Smtp-Source: APBJJlHsrgqDB/r8YWCpziFSln6Y4xCaKHFh/zdJpE/aX9ALsnEg8LB9KlXmV6qf3BcKXhF4nKTzBw==
X-Received: by 2002:a05:6808:bc7:b0:3a3:1424:7258 with SMTP id o7-20020a0568080bc700b003a314247258mr18791192oik.3.1690953511222;
        Tue, 01 Aug 2023 22:18:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id c13-20020aa7880d000000b00640f51801e6sm8734921pfo.159.2023.08.01.22.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 22:18:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] musl: Upgrade to tip of trunk
Date: Tue,  1 Aug 2023 22:18:28 -0700
Message-ID: <20230802051828.16307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185374

Brings following changes

* 83b858f8 fix rejection of dns responses with pointers past 512 byte offset
* a4ecaf89 dns stub resolver: increase buffer size to handle chained CNAMEs
* 40834f6c printf core: fix gratuitous integer formatting buffer size
* 3a23cd06 all printf variants: fix argument type handling for %c and %lc
* fa4a8abd fix public clone function to be safe and usable by applications
* 0c277ff1 fix broken thread list unlocking after fork
* 4653b987 mbrtowc: Fix wrong return value when n > UINT_MAX
* b90841e2 configure: replace -Os with equivalent based on -O2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add MIRROR for redundancy

 meta/recipes-core/musl/musl_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b4c2b1f8980..297c5581a37 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "718f363bc2067b6487900eddc9180c84e7739f80"
+SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
 
 BASEVER = "1.2.4"
 
@@ -12,11 +12,13 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/git/musl;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/git/musl.git;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
 
+MIRRORS += "git://git.musl-libc.org/git/musl.git git://github.com/kraj/musl.git"
+
 S = "${WORKDIR}/git"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
-- 
2.41.0


