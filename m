Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9072BC25B0E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6692.1659705182370809358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eDFw5hgI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so3957739wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=LmkYEAokNaJuJXug+JWHszklKGaWZXCjJ4kbVyuUr9A=;
        b=eDFw5hgIU4kV0YaxBPZ8xn1CZcJ1J1WPqdkGiIRh+uZV1ndQysJW8AZUzvCnEuavvy
         yi1csLrRQKbzKwMsb/jtXXYAoiTuMKapnJU4oZ2ZTodMqpxaz0wws3iEKEzsKtzXF+mT
         L506isByLggtYMrCNgmAv6w1RfCYjDb+L2FL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=LmkYEAokNaJuJXug+JWHszklKGaWZXCjJ4kbVyuUr9A=;
        b=ScozeBZ3ATJCAXVo5NvXn4R5kFuaFQlsbPz3hHpitoSO7VDLT6tOsCKZs/6n7mGZLa
         vEugfOjvRwK6xKRewquBwcd31dntk51v84CKEBSuK7sABfKy0tH6iAKE2Fy5ZFrMUnhf
         PqPGGuHXB06FQqAGeWNopOX3vY9CrZUqLeZJ9JRITJ4UO48kAONIZZgPAO2r2/BQGndH
         bXhZP59T2PBuokJ+XEOg+mapZYYsErlp+y5lJuNHEGUgikFe4QSZuMQ0X9WNKj4Qqg3u
         Bhcax6u1/QZprIJZjbfpfDwdn7SPfanzrDWmcQh22ynM8iCQ1DUy40keZX1HUqnGrK35
         dD2A==
X-Gm-Message-State: ACgBeo3HUBtIk0U131CT8guibExj2e/gNUTD/2MAYnqLwlWykuFs8lXU
	JuJKXFwYexzpaK1eVnHOzOjhlX/7N53Jrw==
X-Google-Smtp-Source: 
 AA6agR4gpEULt25Wn7IcD240JxX6gSEezSMyaLyeFOooTPrYJu99JfiRzrh/Bj5+sWstLhBrtGAr6A==
X-Received: by 2002:a05:600c:3045:b0:3a5:16a8:77c0 with SMTP id
 n5-20020a05600c304500b003a516a877c0mr2958443wmh.83.1659705180342;
        Fri, 05 Aug 2022 06:13:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/29] rust: Work around reproducibility issues
Date: Fri,  5 Aug 2022 14:12:32 +0100
Message-Id: <20220805131252.3706794-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168943

Add a patch which removes the sections of code which encode buildpaths. Whilst
not ideal, the patches at least show where the problematic data is coming from
and should allow more focused work to resovle it by someone who has a better
understanding of rust and what this code is doing. It does look unlikely we
actually need this code in our usecases anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-source.inc    |  3 +
 .../rust/rust/hardcodepaths.patch             | 70 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust/hardcodepaths.patch

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index fda26534e88..b814574e55f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,6 +1,9 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
 SRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"
 
+SRC_URI:append:class-target:pn-rust = " file://hardcodepaths.patch"
+SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
+
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
diff --git a/meta/recipes-devtools/rust/rust/hardcodepaths.patch b/meta/recipes-devtools/rust/rust/hardcodepaths.patch
new file mode 100644
index 00000000000..2fdfe6d4637
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust/hardcodepaths.patch
@@ -0,0 +1,70 @@
+When building for the target, some build paths end up embedded in the binaries. 
+These changes remove that. Further investigation is needed to work out the way
+to resolve these issues properly upstream.
+
+Upstream-Status: Inappropriate [patches need rework]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: rustc-1.62.0-src/src/tools/clippy/src/driver.rs
+===================================================================
+--- rustc-1.62.0-src.orig/src/tools/clippy/src/driver.rs
++++ rustc-1.62.0-src/src/tools/clippy/src/driver.rs
+@@ -255,7 +255,6 @@ pub fn main() {
+                     .and_then(|out| String::from_utf8(out.stdout).ok())
+                     .map(|s| PathBuf::from(s.trim()))
+             })
+-            .or_else(|| option_env!("SYSROOT").map(PathBuf::from))
+             .or_else(|| {
+                 let home = option_env!("RUSTUP_HOME")
+                     .or(option_env!("MULTIRUST_HOME"))
+Index: rustc-1.62.0-src/compiler/rustc_codegen_llvm/src/context.rs
+===================================================================
+--- rustc-1.62.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
++++ rustc-1.62.0-src/compiler/rustc_codegen_llvm/src/context.rs
+@@ -167,46 +167,6 @@ pub unsafe fn create_module<'ll>(
+         }
+     }
+ 
+-    // Ensure the data-layout values hardcoded remain the defaults.
+-    if sess.target.is_builtin {
+-        let tm = crate::back::write::create_informational_target_machine(tcx.sess);
+-        llvm::LLVMRustSetDataLayoutFromTargetMachine(llmod, tm);
+-        llvm::LLVMRustDisposeTargetMachine(tm);
+-
+-        let llvm_data_layout = llvm::LLVMGetDataLayoutStr(llmod);
+-        let llvm_data_layout = str::from_utf8(CStr::from_ptr(llvm_data_layout).to_bytes())
+-            .expect("got a non-UTF8 data-layout from LLVM");
+-
+-        // Unfortunately LLVM target specs change over time, and right now we
+-        // don't have proper support to work with any more than one
+-        // `data_layout` than the one that is in the rust-lang/rust repo. If
+-        // this compiler is configured against a custom LLVM, we may have a
+-        // differing data layout, even though we should update our own to use
+-        // that one.
+-        //
+-        // As an interim hack, if CFG_LLVM_ROOT is not an empty string then we
+-        // disable this check entirely as we may be configured with something
+-        // that has a different target layout.
+-        //
+-        // Unsure if this will actually cause breakage when rustc is configured
+-        // as such.
+-        //
+-        // FIXME(#34960)
+-        let cfg_llvm_root = option_env!("CFG_LLVM_ROOT").unwrap_or("");
+-        let custom_llvm_used = cfg_llvm_root.trim() != "";
+-
+-        if !custom_llvm_used && target_data_layout != llvm_data_layout {
+-            bug!(
+-                "data-layout for target `{rustc_target}`, `{rustc_layout}`, \
+-                  differs from LLVM target's `{llvm_target}` default layout, `{llvm_layout}`",
+-                rustc_target = sess.opts.target_triple,
+-                rustc_layout = target_data_layout,
+-                llvm_target = sess.target.llvm_target,
+-                llvm_layout = llvm_data_layout
+-            );
+-        }
+-    }
+-
+     let data_layout = SmallCStr::new(&target_data_layout);
+     llvm::LLVMSetDataLayout(llmod, data_layout.as_ptr());
+ 
-- 
2.34.1


