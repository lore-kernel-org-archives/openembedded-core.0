Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70243C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 12:06:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.11230.1671192403391943337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 04:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VuXQ2VJ9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id o5so2300049wrm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 04:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdKs7yWMcO61O9IJ6bflzBIAovOW96mC/HmREdBbM2o=;
        b=VuXQ2VJ9/PUfzq/NMVmA0nzbuXwfHCqvLnQfLzDanmusTSQwbpcn7TXK1IdkW5sc18
         OsB77rOpEfvXNXwwg23CpHVpQIlY1X9bt4mEmV/lthAcyYxIryLKEqSC2l/ChJ/lvvHR
         F7dRGSCuuvf7qIwv4Ha2uLDoRCqQS8QmLmAhkSRck39L0YW3cpsJWBS60yAVlMx08+nm
         vEux/Up8U1ryMqMOQZHKG5nXCkRvITNHUmuzcNIOylYZd9odNHkZpNwFyxSNEFWLaG+0
         GqlkbSRvcJQlzZRpB6PyC54gB3K2krCP94kwiHna9Ek6YOJ7/Bm/BCic7lxxovcQHtVx
         18og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdKs7yWMcO61O9IJ6bflzBIAovOW96mC/HmREdBbM2o=;
        b=hlGOjXH5dD6E3SKOFtE/sUqYhtEg1rbqoBUju7R77zRQL+w77Ka1+1VCrVnbN1IEYp
         l6kikaU4ZDMd/XmpSjvlRQHhRF73+k9PxYtZHBsdq7Kpp7ed8LTrvuKDhdB2tsmFb+Px
         xxanRHMDmV0IM9P/dfwFfEu/BC7S8QJseEwJAxv7bZcoIpcT79AAcgZ/rnvwcx9ZH6o6
         DkHi8Rz6lQNA52iWV7jR/BHAhr7qVIXrTcrdAP0kzZFaxwivpL+v6wKYMVjQUqOZfPZx
         7kRobRY53FZBSo7cFV9ADQHKf0Gwn1j7VagymCTX2VQAbuXCdzQIUQxiVYQ/PWN5xJKC
         peHA==
X-Gm-Message-State: ANoB5plmZVfJUEly9kRhK5d3VxZUimBkZaHKfQLn1MhP8J5q2RqPp/WL
	njek/J4WFtR8xDicj3IOp60SC1eDmDg=
X-Google-Smtp-Source: AA0mqf6OFra5vmSagd9ZQP9AIsGF7A9FXm8MC0mT/eEFaIIN9UII+ix3VUmALCBrgYYLjDicvEhXkQ==
X-Received: by 2002:a5d:5b1c:0:b0:242:1bdf:a02 with SMTP id bx28-20020a5d5b1c000000b002421bdf0a02mr22574486wrb.37.1671192401387;
        Fri, 16 Dec 2022 04:06:41 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b002302dc43d77sm2074661wrb.115.2022.12.16.04.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 04:06:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] rust: Install target.json for target rustc
Date: Fri, 16 Dec 2022 12:06:31 +0000
Message-Id: <20221216120632.5804-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 12:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174741

As part of the merging builds, installation of target.json was lost
causing `rustc` to fail on startup with:

  error: Error loading target specification: Could not find specification for target "aarch64-poky-linux-gnu". Run `rustc --print target-list` for a list of built-in targets

We know the full target specification, so just install it directly
rather than using the glob approach from previously.

Fixes: b9b0cd99cdc7 ("rust: Enable nativesdk and target builds + replace rust-tools-cross-canadian")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-devtools/rust/rust_1.65.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.65.0.bb b/meta/recipes-devtools/rust/rust_1.65.0.bb
index dbf74cec8feb..b39f772c5fe1 100644
--- a/meta/recipes-devtools/rust/rust_1.65.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.65.0.bb
@@ -68,6 +68,9 @@ rust_do_install:class-target() {
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
+    install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
-- 
2.39.0


