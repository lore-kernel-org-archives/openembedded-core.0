Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D165FC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.30345.1683300052315105096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wycbQWLD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so1335668b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300051; x=1685892051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixlRf975kGM1hAT9m3J9dMVJvAfRpyJqioxDvySHkNQ=;
        b=wycbQWLDnFJ2TcSw4krrPUlNOV/gDcSbdtU+gtusXmiDxv4OeWFXlpli/Vhr2d68X9
         NkE+Ofd3ukuBklhKgBMuNysX9lyvZA7tR+X/fBE1zWRZq4iMrjEab03Z34Ni628nvqMs
         W5fgYWHmjNEhyKgljmxucE1uXgUmMGuEJkCj5LuV8TdMaIXdzjWJhTcI6z/xtHDhd55S
         ZSrOCzQqzju4xaXy8po19nbyU7QqXSdyU+YtJzourzH0OpDyGVeREUD3k1ie7twzHVhF
         fhVbzhEbLMZ09mhRyuBksBi6cEjxhVgLfOXW6ddoRblXY4siDT1pZDDc3FhJoXdc+iuT
         lpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300051; x=1685892051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixlRf975kGM1hAT9m3J9dMVJvAfRpyJqioxDvySHkNQ=;
        b=UoRoByRqRhfiz1zSrf69FqnIhz976vJFChSG/5oLR2i2GaUKsB2e8EfD9Ky8wsXzyf
         2xP//KUgRpivvwuQiEuE/i2NEgwlQpJL/svCQJHpRcWLrlXWALv9Epn0qhasmr66Cnyu
         uykpotzRgZvMHgR3KItTqsUbd0fOAnpNXE+9nkJfr/2JltODusdMgZBCYX4noToj3Agl
         /havdSmV/C7IUhlVgRSCrztKGlxKiI9j/6FvpGV+Iu3tKQWtIGMkkn7w5ralIwMOfo+3
         LFxmjtC9CruRCYP0rLZOcLDrre85pmp4SoUdLi/iRmOwB6eVYilk38xcbnFAPWTPXrTq
         gyoQ==
X-Gm-Message-State: AC+VfDy/jM/6g3CbY8rQaaPRlbBqVKr6esMpv96hYkuqOpDWoN73xayK
	/9ksS8KCVkkBfSSZDpwOEVPAVukJcJmfX+w9vJc=
X-Google-Smtp-Source: ACHHUZ7YMDmMRrx97hMOuUuX18T2eR0lj/TYuxCWPhfzPBoyk79p+oZbaIjXmZ/zsUclaLkq6uEZaA==
X-Received: by 2002:a05:6a00:1796:b0:63d:260d:f9dd with SMTP id s22-20020a056a00179600b0063d260df9ddmr3140552pfg.33.1683300051202;
        Fri, 05 May 2023 08:20:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/35] rust: Upgrade 1.68.1 -> 1.68.2
Date: Fri,  5 May 2023 05:19:34 -1000
Message-Id: <80ffaf90282a72276f6bf62e22976400fe7bb1f9.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180943

From: Alex Kiernan <alex.kiernan@gmail.com>

Changes:

* Update the GitHub RSA host key bundled within Cargo. The key was
  rotated by GitHub on 2023-03-24 after the old one leaked.
* Mark the old GitHub RSA host key as revoked. This will prevent Cargo
  from accepting the leaked key even when trusted by the system.
* Add support for @revoked and a better error message for
  @cert-authority in Cargo’s SSH host key verification

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4563432b41026adc56c54452984b19ab64e7406e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} | 0
 .../rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb}           | 0
 ...t-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} | 0
 .../rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipes-devtools/rust/cargo_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d48fcd5bc9..b25b5c17e8 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,7 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2"
+SRC_URI[rust.sha256sum] = "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recipes-devtools/rust/rust_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.68.1.bb
rename to meta/recipes-devtools/rust/rust_1.68.2.bb
-- 
2.34.1


