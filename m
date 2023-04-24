Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F32C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 13:04:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.50234.1682341461692577330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 06:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QjmiKvtj;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso9583505e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682341460; x=1684933460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTJIPlHiVEVVAc3BfDouOjbQyoDiuYmP6m/yZcPN3Oc=;
        b=QjmiKvtj70A3kQwuatPSPVHyg2B3zKTs24fTXadL/7kyua3B8bGvarHN8vBtGYLn1T
         jaaay2JhyylsHB3bJHhZ9HKs4JHOIOY7Vx5nGf5ngnV8Bk5tA43Tc2BPTf+r/xCikxL5
         +ueQyhUBoKfpiPPVeAgaJ44/TZeUQR5psi+31J8OJu2VdoJC2r7yh4ovhD+bn/mb+Qlj
         znBTQXZRFfPMYcsU+3dJokLvrmgsxSQZfH68MXorPFa+C2DSgO3MJkPilf8YbQsI9K82
         8nwt11YSfFa9XdwyxNgIcPItske59J8IxfLpBgiRwfgO8zugXCgzK1+yRW53jzkktyva
         awxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341460; x=1684933460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTJIPlHiVEVVAc3BfDouOjbQyoDiuYmP6m/yZcPN3Oc=;
        b=CNeYI+YuSRcq/PoSB2msHu0EUUoUKX44HIG6rIhVne3g1qBGpvVuuWXTG4M7//oZzu
         1X1JUgMm3EmVl2gIwX1NR+mw/Nht2M6dny8yyOQq4RVY9xHzKRcedvP3Iaqw0xpje1W5
         MoKMoJjivwqkWyWjAbOWM/zSXmeraSZ2BJ9zqc1qooJLAaBhotoiL0hZZ9Pzx6oIn8Dp
         oDae6sdLz9qnnEipVxrcbRPfYSh4uchBYvBI8o8ErKB5+h2n22LUcuBoo6bgtoceTet3
         k4s+Vc4j/hOcwze3YFJCEBNeJNotDaylFqNo7YXU0kSGREGKlfXg8neYasNtcwHTPdWf
         fmgw==
X-Gm-Message-State: AAQBX9dbiLthZcUOA2Qa7VgX73XsRJLhc4evHk6+P9+iSq6rieKbUKJ9
	OkJJeQ/LwhhVDUHLXa7rNrwopg3vREw=
X-Google-Smtp-Source: AKy350YFkNflaBUVJkwjoJZ+ZfL3+lJYTBu48Rm/R3l1kTkJB25jNvrIRz/ulfhCUOCVgONGnneDQQ==
X-Received: by 2002:a05:600c:b59:b0:3ee:ed5:6115 with SMTP id k25-20020a05600c0b5900b003ee0ed56115mr7609808wmr.19.1682341459716;
        Mon, 24 Apr 2023 06:04:19 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:d7e1:16f4:c5d8:fb02])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b003f0ad8d1c69sm9170508wmb.25.2023.04.24.06.04.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:04:18 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 3/3] zvariant: add ptest feature for zvariant test suite
Date: Mon, 24 Apr 2023 15:04:13 +0200
Message-Id: <76a38b59d861ed303a00e96d83a30b3aa3cc4b69.1682341336.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682341336.git.frederic.martinsons@gmail.com>
References: <cover.1682341336.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180354

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Below is the output of run-ptest script under qemu

root@qemux86-64:~# /usr/lib/zvariant/ptest/run-ptest

running 37 tests
test framing_offset_size::tests::framing_offset_size_bump ... ok$<2>
test owned_value::tests::from_value ... ok$<2>
test object_path::unit::owned_from_reader ... ok$<2>
test str::tests::from_string ... ok$<2>
test signature::tests::signature_slicing ... ok$<2>
test str::tests::test_ordering ... ok$<2>
test owned_value::tests::map_conversion ... ok$<2>
test owned_value::tests::serde ... ok$<2>
test tests::enums ... ok$<2>
test tests::derive ... ok$<2>
test tests::f64_value ... ok$<2>
test tests::i16_value ... ok$<2>
test tests::fd_value ... ok$<2>
test tests::i32_value ... ok$<2>
test tests::i8_value ... ok$<2>
test tests::i64_value ... ok$<2>
test tests::ip_addr ... ok$<2>
test tests::issue_59 ... ok$<2>
test tests::issue_99 ... ok$<2>
test tests::array_value ... ok$<2>
test tests::object_path_value ... ok$<2>
test tests::dict_value ... ok$<2>
test tests::signature_value ... ok$<2>
test tests::serialized_size ... ok$<2>
test tests::struct_byte_array ... ok$<2>
test tests::struct_ref ... ok$<2>
test tests::str_value ... ok$<2>
test tests::option_value ... ok$<2>
test tests::struct_value ... ok$<2>
test tests::struct_with_hashmap ... ok$<2>
test tests::u16_value ... ok$<2>
test tests::u32_value ... ok$<2>
test tests::unit ... ok$<2>
test tests::u8_value ... ok$<2>
test tests::unit_fds ... ok$<2>
test tests::value_value ... ok$<2>
test tests::recursion_limits ... ok$<2>

test result: ok$<2>. 37 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.21s

root@qemux86-64:~#

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../recipes-extended/zvariant/zvariant_3.12.0.bb         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
index 4285d11b72..36f2a07ecf 100644
--- a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
+++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "https://gitlab.freedesktop.org/dbus/zbus/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b377b220f43d747efdec40d69fcaa69d"
 
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'glib-2.0', '', d)}"
+
 SRC_URI = " \
     git://gitlab.freedesktop.org/dbus/zbus;protocol=https;branch=main;subpath=zvariant \
     file://0001-Tweak-zvariant-crate-config.patch;striplevel=2 \
@@ -21,10 +23,15 @@ python do_clean_lic_file_symlink() {
 
 addtask clean_lic_file_symlink after do_unpack before do_patch
 
-inherit cargo cargo-update-recipe-crates
+inherit ptest-cargo pkgconfig cargo-update-recipe-crates
 
 # Remove this when the recipe is reproducible
 EXCLUDE_FROM_WORLD = "1"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc
+
+# zvariant is an indermediate product for the zbus project
+# and so, it provided only a static lib (rlib) which fall only
+# in -dev package
+ALLOW_EMPTY:${PN} = "1"
-- 
2.34.1


