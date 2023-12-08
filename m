Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9823C10F07
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.11252.1702002837027311756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IRNYHP3k;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1191353a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002836; x=1702607636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHFZ5HhpSMd7lTWdPdlidq3Nhg0WpDbAC4ragDW4xxs=;
        b=IRNYHP3kUrKrRiGMJ7URJXseqPZkowBzXrQqSUbh4xbZSpFW8UhQ7/vYoy5J5j59lJ
         dmGZdIs+GTpcyQCWDVaZEcnGrGV1oPuDWGdaho2TtQXFJqM+u4+1ywCaqNEbz0aVDhO2
         fw7G2WgnuuzSSG7F9hcLHnaTRi6HjS/NXI6MPsStQB5p8ohxX6kfliW5tfY3hiKShfNx
         4q9CFSKaPKt95Fhb+Oj6kmZcQu3G/hywc5HukLSfU6HBFVPm9Wsd3wGm8NwPY8tg4F/3
         KlJM5V/6/DnzaAD/ixlEdSvvxjLjx8T6bjKVVTPraBf00+FmoGw0+vmvCaS+SoNJkZg7
         mhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002836; x=1702607636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHFZ5HhpSMd7lTWdPdlidq3Nhg0WpDbAC4ragDW4xxs=;
        b=tSc58FhDhEm36HSpK53hEYN6yKYDMRIrNBKTtrG18iY/EZV/m+M6Tg2LVN2571VQoI
         PJO/xbgBZ72wZkYY9p2Md2P6gWYaZhgUDvc0l790bU7rRxFEXZn+OtKvU05YsC2HL/3J
         BKLhAHEHrIsqD2QD1bQD0KXoeYzY+9L3HCwfujV+26u2UxxfjW8qh7Vstmk16wRGtU2u
         vgjH4gn58GtaAFwt84fI+gvMK8BfswV0g4oXTSrLPD37Sfirpbg51AAhZu2+kffFl9U2
         gOwnkqyGUuJUAYpIMO0crtOqfmRhKhu/HurBxYMR2H61XKeQKfIUQlsW3mIaqdzY4/nt
         /ZJA==
X-Gm-Message-State: AOJu0YwPkfvWM+aYv/Qm1kosdCtfz0z6EX8TMifHEGsCX8a4iDkq10rH
	aNz/qmNgThqxG58ZTOyGSQQgsgQyFNesyRRgH7I=
X-Google-Smtp-Source: AGHT+IHoRyoj3wck1xASqipExs4kbIb6wmI3sh4qU/ylMj2bw5jrNhKbLZ+7NHGWONgU3/REhmJ7nA==
X-Received: by 2002:a17:902:d50b:b0:1d0:969b:4bdf with SMTP id b11-20020a170902d50b00b001d0969b4bdfmr2900167plg.108.1702002836188;
        Thu, 07 Dec 2023 18:33:56 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] rust-cross-canadian: Fix ordering of target json config generation
Date: Thu,  7 Dec 2023 16:33:18 -1000
Message-Id: <d8c030ef90272e42a1697f5195f887d09878aa01.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192004

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Based upon a patch from Otavio Salvador <otavio@ossystems.com.br>,
ensure the target json files are written in the correct order with
the most specific last incase it overwrites earlier files if the prefixes
match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1912c4e9e0ecf9655f3b3a41588b54d7956f5899)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian-common.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 1f21c8af26..df4901f1fa 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -27,9 +27,10 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
     rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
-- 
2.34.1


