Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACAC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 05:21:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.13597.1682572864762254734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 22:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Dj5ynNAt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so36700685e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682572862; x=1685164862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bk4FGaQ1qHPI0pSp0DX3CnD/gxd6F+KGAcORYd6+4Dw=;
        b=Dj5ynNAtm+tf+8B9X6EVY92otnfG7EEDMNGFI9J4BgJIPAWNaNUARV0Ios9k+vR7nV
         TkLOzjl+rGRf4Cqz7j8tWx2TGAKrJ+tpMrfeM4eHLTRPGvfe6elT4pTTeZNvoI3Ch8to
         qoPNntNV4ltAxda2gWC5wSQRMq30MKicZkJbs/ZVjf4+5GVZu0btu5C8OOnU3WU0s0C6
         JJP98mpIdAQHy/ior+xZMzl+l2uabvBIq2RfOT5TZvzzCzzE4JoWBCXDfxm7gWlcKneX
         9lCiDUcbgxbLh2ku1J2pOuRcSiJmKEFSVzqVbAXSJkRjx0XcW+4cu0otQ0hjB1TBWSre
         TbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682572862; x=1685164862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bk4FGaQ1qHPI0pSp0DX3CnD/gxd6F+KGAcORYd6+4Dw=;
        b=EhvMBPoZg2BoO0NkEgnAxenrtLB9VN0Ui/AstNgMHa/HY+BXZOjzH2fLkReShoit11
         9/2IuiIFXKnCK0Ztj3rG0MwOFoQ6hVM51bXXFv6iA2c5CnYlIoG+63vP3PIPeZdTAuE2
         E7ztMsDlR1UkPUgiw249QaryyeDxYR+AdYwhpKf1H+UgmngNDTa8S3M3GYX0vN8GevPd
         40TVf19C0A1r54vFlrZlXcjnLjsuMGcIV5hLOoMA4hQDFw8IxWOsweSCy46iUHS1lpnV
         +69xeq6hKFiYn6JYO2wwMlJti3HyJNA/iwsBU2ZQGRmedWPKAs8ZhEGOWvVoq+eeUyxl
         wEJA==
X-Gm-Message-State: AC+VfDzXMTa5n4DqtJlZFHHAquoyn7APl4EL7agEljhykdUJNw3iSC8N
	Ka9stAalk7RyPfenUi+eBwQnuznSWc0=
X-Google-Smtp-Source: ACHHUZ7VtS+GHPAor+puEZPLWUBN9NpION1IbJZLyPT5FkJXDddhEil470ts1ewt4dpxy3KSmvd5Aw==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:800f:cc61 with SMTP id l14-20020a1ced0e000000b003f1800fcc61mr379216wmh.13.1682572862375;
        Wed, 26 Apr 2023 22:21:02 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm23240809wmb.15.2023.04.26.22.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 22:21:01 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV3 3/3] zvariant: add ptest feature for zvariant test suite
Date: Thu, 27 Apr 2023 07:20:56 +0200
Message-Id: <330dc3272eb6abf476642f87ea8dc4780e12445c.1682572703.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682572703.git.frederic.martinsons@gmail.com>
References: <cover.1682572703.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180469

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
 meta/lib/oeqa/selftest/cases/devtool.py                  | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

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
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 94873fd19f..1896944250 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -876,7 +876,7 @@ class DevtoolModifyTests(DevtoolBase):
         self.assertTrue(any([uri.startswith('file://') and '.patch' in uri for uri in src_uri]),
                         'This test expects the %s recipe to have a patch in its src uris' % testrecipe)
 
-        self._test_recipe_contents(recipefile, {}, ['cargo'])
+        self._test_recipe_contents(recipefile, {}, ['ptest-cargo'])
 
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('%s -c cleansstate' % testrecipe)
-- 
2.34.1


