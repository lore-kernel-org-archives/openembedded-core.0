Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B639C761A6
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.44026.1679494944107661224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jEMICItP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id u20so10746659pfk.12
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/6y9K1Y/tY57XxuPPgB64iyx7HgOlvugs7oi5RpcHI=;
        b=jEMICItPZotTZZJlkXKIUYeQr1XOKmLMnO3l9C9JENvqfV/szkBUwmlkWvDkY2YkGv
         GVafiGlVLluSgwiUJ3Tl3LJdLNt8hDtPSZOBE4Nvb1GiCE+NL9SbkrIhMd9wsr5iRJKY
         C5AE+22/ZSru3K/K/NMnXwEElVjuz1xTGXY0snbLpjxAppX5DKb1a4BJraQww58dBVjw
         UQ6Y7DOum2tMdQ4oxSJA899otQMghxs6EuNx2dpT3B9r5aaaxq0bqEyzPQw26LBmHRlC
         I3LVutqouPR2kZ36vs17T/Hh6v8irV1c328WT2rFPtyvSUOJr+Gq0GdcYf2GRA1Of483
         H13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/6y9K1Y/tY57XxuPPgB64iyx7HgOlvugs7oi5RpcHI=;
        b=74f/Sh2avC+E37mbAKTyY/eKj2+lOAf54jR0YHgaxEeKhBgwtKWIyZ+WnpUuMFBiyt
         1eurfjH7RMUr1c9O1zB3lrEp4rWiLL5YyIsot8/4Cb44bYxwxFIFEPxrA796QkKrMwEd
         rSGzelYHpGMJY/zb/WRwr2XJtJImqUIZO045KK0eM8iXtJrpxPa0s7yWlik0d64Lr3Xc
         g1DqVqeCNVifO2LNCt/IfoI1ZLzffqJb8Eo1GGp8CIJkd16cyfWEeNLBY8HdwNg+wraF
         K2s6REqwk7LPdN2xgUdacpWZiJvrgko6I66DJ+ZrgYFbqk5x1cu71GWJqrbFiqZepEhR
         9YKA==
X-Gm-Message-State: AO0yUKVm0mQtwW/T7pQx7K7leQGwZcu4n1zpGVSwTWOMMpD7zfdRUglj
	Vge65SCarw5Y6oUpXimQntT+G5vavjkjEac2Gow=
X-Google-Smtp-Source: AK7set+dpXIPzUdn7qWeBlYLrZGCyghjgptwisARXo+0zDOv8wn8ssSvTRcp+adnHdcZepjiGpJOhA==
X-Received: by 2002:aa7:9890:0:b0:625:14cb:8b7c with SMTP id r16-20020aa79890000000b0062514cb8b7cmr3203933pfl.0.1679494943202;
        Wed, 22 Mar 2023 07:22:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/21] cargo.bbclass: use offline mode for building
Date: Wed, 22 Mar 2023 04:21:39 -1000
Message-Id: <bad6361b2f90e7916e344148976a968559375eda.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178945

From: Frederic Martinsons <frederic.martinsons@gmail.com>

There should not be any network access during the build step so
specify this explicitely to cargo.
This will allow better error message, e.g:

| Caused by:
|  can't checkout from 'ssh://git@.../fmartinsons/zbus-git-dep-test.git': you are in  the offline mode (--offline)

Instead of

|   Updating git repository `ssh://git@.../fmartinsons/zbus-git-dep-test.git`
| warning: spurious network error (2 tries remaining): failed to resolve address for gitlab.com: Temporary failure in name resolution;class=Net (12)

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e9ec03c73e8c09e223d6f6cce297df363991350)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index d1e83518b5..b27eb2f209 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -39,7 +39,7 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-- 
2.34.1


