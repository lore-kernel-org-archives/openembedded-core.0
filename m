Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33347C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 12:19:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.156768.1680783545773160239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 05:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=CwspS/S5;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so5702215wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680783544; x=1683375544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeqbzWiJSvM5vQPYCEfrF+PWxq6ZskT6LgzSxVC7J8g=;
        b=CwspS/S5KqQmospAr5IJs4Wi6P27/CyGOY1EDAlYrD8wK1mVSvuarq6vuDrGHSWtlU
         POzSpPLsgt9SYnjN6p2vAdGB613O/slCLDfn7Tv+1sL7F4kIKzw/V1sCkE5FLZBsYQNh
         KTfzoxN6NPWKkpdBq4DzQTMlqsEv+Ao/SpP0fhhc7Te/krmsSvcajyWgaErz/GNxLNtd
         xBqLw8GkgccvMfLyN87O1c7n/9UzLqphyDXOzoaTBdwu9qwdH0/jfep6vmVxaWAd5GgE
         467Hc5xxmbueyWjoR2W7I5jo0ERrGuizW5qlCtxUZklNeBZVSOpy5M2qfl99i02IOl5M
         jAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783544; x=1683375544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeqbzWiJSvM5vQPYCEfrF+PWxq6ZskT6LgzSxVC7J8g=;
        b=6mao1KsykDbSh6Doi4ScI3rXi0v572fL3ZDs+scOY0PJQHe063njtxlZGubS1xCFQ9
         4GrXBNVx39yQ+++mEYO+In8A/8CTs/e/XuthVds/4PH8b+MC8nw0xC+whoMe2u9BiiRP
         NvSOznDGtlLycAGy6O8pVRBFxoPfb8VwPpqqHGJLSWKjAWYGk10/mqEnDvzkeRgV86t8
         +dzMGxJd08s/MERKGrZFSlaOd//8+xc7CWhSaCYaZLzPZysRA6KbGor3SNT9F9N+Lj2z
         sc/hM1cMeseSTjrfAbZllOK2T+sUDDpsGh5wWS8N0fYONkkLQrfMkTMan4zF8G2w2lU3
         7/Gg==
X-Gm-Message-State: AAQBX9dnzKaeyLQJEzldvZ/Flxt12WuKrrNJBe6nhbe4naeN1/dXXVPO
	49a/APSATJgh5ZMXq5mAHzfOdDyxnqU=
X-Google-Smtp-Source: AKy350ZeFAwX7+r8+Cx1V5F62mYcijcdB1RCJHc3Ax1r76qQPpL8zrKNChRn9oSFrSATRTvQjvZmGw==
X-Received: by 2002:a1c:ed17:0:b0:3f0:7147:2ecd with SMTP id l23-20020a1ced17000000b003f071472ecdmr1135851wmh.7.1680783544004;
        Thu, 06 Apr 2023 05:19:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b003ee9f396dcesm5214219wmq.30.2023.04.06.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:19:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] python3-cryptography-crates.inc: regenerate with updated bbclass
Date: Thu,  6 Apr 2023 14:18:53 +0200
Message-Id: <20230406121854.48486-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 12:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179771

* it's needed for compatibility with updated fetcher from:
  https://patchwork.yoctoproject.org/project/bitbake/patch/20230405122125.3358972-1-enrico.scholz@sigma-chemnitz.de/

* easiest way to regenerate these is:
  echo > meta/recipes-devtools/python/python3-cryptography-crates.inc
  bitbake -c update_crates python3-cryptography
  git commit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python3-cryptography-crates.inc    | 264 +++++++++---------
 1 file changed, 132 insertions(+), 132 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 74f47897a6..55e9f5a158 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,137 +2,137 @@
 
 # from src/rust/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/asn1/0.13.0 \
-    crate://crates.io/asn1_derive/0.13.0 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.13.1 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bumpalo/3.10.0 \
-    crate://crates.io/cc/1.0.78 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.23 \
-    crate://crates.io/codespan-reporting/0.11.1 \
-    crate://crates.io/core-foundation-sys/0.8.3 \
-    crate://crates.io/cxx/1.0.85 \
-    crate://crates.io/cxx-build/1.0.85 \
-    crate://crates.io/cxxbridge-flags/1.0.85 \
-    crate://crates.io/cxxbridge-macro/1.0.85 \
-    crate://crates.io/iana-time-zone/0.1.53 \
-    crate://crates.io/iana-time-zone-haiku/0.1.1 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/indoc-impl/0.3.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/js-sys/0.3.60 \
-    crate://crates.io/libc/0.2.139 \
-    crate://crates.io/link-cplusplus/1.0.8 \
-    crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/once_cell/1.14.0 \
-    crate://crates.io/ouroboros/0.15.5 \
-    crate://crates.io/ouroboros_macro/0.15.5 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.6 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/pem/1.1.0 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-hack/0.5.20+deprecated \
-    crate://crates.io/proc-macro2/1.0.49 \
-    crate://crates.io/pyo3/0.15.2 \
-    crate://crates.io/pyo3-build-config/0.15.2 \
-    crate://crates.io/pyo3-macros/0.15.2 \
-    crate://crates.io/pyo3-macros-backend/0.15.2 \
-    crate://crates.io/quote/1.0.23 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/scratch/1.0.3 \
-    crate://crates.io/smallvec/1.10.0 \
-    crate://crates.io/syn/1.0.107 \
-    crate://crates.io/termcolor/1.1.3 \
-    crate://crates.io/unicode-ident/1.0.6 \
-    crate://crates.io/unicode-width/0.1.10 \
-    crate://crates.io/unindent/0.1.11 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wasm-bindgen/0.2.83 \
-    crate://crates.io/wasm-bindgen-backend/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.83 \
-    crate://crates.io/wasm-bindgen-shared/0.2.83 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/Inflector/0.11.4;name=Inflector-0.11.4 \
+    crate://crates.io/aliasable/0.1.3;name=aliasable-0.1.3 \
+    crate://crates.io/android_system_properties/0.1.5;name=android_system_properties-0.1.5 \
+    crate://crates.io/asn1/0.13.0;name=asn1-0.13.0 \
+    crate://crates.io/asn1_derive/0.13.0;name=asn1_derive-0.13.0 \
+    crate://crates.io/autocfg/1.1.0;name=autocfg-1.1.0 \
+    crate://crates.io/base64/0.13.1;name=base64-0.13.1 \
+    crate://crates.io/bitflags/1.3.2;name=bitflags-1.3.2 \
+    crate://crates.io/bumpalo/3.10.0;name=bumpalo-3.10.0 \
+    crate://crates.io/cc/1.0.78;name=cc-1.0.78 \
+    crate://crates.io/cfg-if/1.0.0;name=cfg-if-1.0.0 \
+    crate://crates.io/chrono/0.4.23;name=chrono-0.4.23 \
+    crate://crates.io/codespan-reporting/0.11.1;name=codespan-reporting-0.11.1 \
+    crate://crates.io/core-foundation-sys/0.8.3;name=core-foundation-sys-0.8.3 \
+    crate://crates.io/cxx/1.0.85;name=cxx-1.0.85 \
+    crate://crates.io/cxx-build/1.0.85;name=cxx-build-1.0.85 \
+    crate://crates.io/cxxbridge-flags/1.0.85;name=cxxbridge-flags-1.0.85 \
+    crate://crates.io/cxxbridge-macro/1.0.85;name=cxxbridge-macro-1.0.85 \
+    crate://crates.io/iana-time-zone/0.1.53;name=iana-time-zone-0.1.53 \
+    crate://crates.io/iana-time-zone-haiku/0.1.1;name=iana-time-zone-haiku-0.1.1 \
+    crate://crates.io/indoc/0.3.6;name=indoc-0.3.6 \
+    crate://crates.io/indoc-impl/0.3.6;name=indoc-impl-0.3.6 \
+    crate://crates.io/instant/0.1.12;name=instant-0.1.12 \
+    crate://crates.io/js-sys/0.3.60;name=js-sys-0.3.60 \
+    crate://crates.io/libc/0.2.139;name=libc-0.2.139 \
+    crate://crates.io/link-cplusplus/1.0.8;name=link-cplusplus-1.0.8 \
+    crate://crates.io/lock_api/0.4.9;name=lock_api-0.4.9 \
+    crate://crates.io/log/0.4.17;name=log-0.4.17 \
+    crate://crates.io/num-integer/0.1.45;name=num-integer-0.1.45 \
+    crate://crates.io/num-traits/0.2.15;name=num-traits-0.2.15 \
+    crate://crates.io/once_cell/1.14.0;name=once_cell-1.14.0 \
+    crate://crates.io/ouroboros/0.15.5;name=ouroboros-0.15.5 \
+    crate://crates.io/ouroboros_macro/0.15.5;name=ouroboros_macro-0.15.5 \
+    crate://crates.io/parking_lot/0.11.2;name=parking_lot-0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.6;name=parking_lot_core-0.8.6 \
+    crate://crates.io/paste/0.1.18;name=paste-0.1.18 \
+    crate://crates.io/paste-impl/0.1.18;name=paste-impl-0.1.18 \
+    crate://crates.io/pem/1.1.0;name=pem-1.1.0 \
+    crate://crates.io/proc-macro-error/1.0.4;name=proc-macro-error-1.0.4 \
+    crate://crates.io/proc-macro-error-attr/1.0.4;name=proc-macro-error-attr-1.0.4 \
+    crate://crates.io/proc-macro-hack/0.5.20+deprecated;name=proc-macro-hack-0.5.20+deprecated \
+    crate://crates.io/proc-macro2/1.0.49;name=proc-macro2-1.0.49 \
+    crate://crates.io/pyo3/0.15.2;name=pyo3-0.15.2 \
+    crate://crates.io/pyo3-build-config/0.15.2;name=pyo3-build-config-0.15.2 \
+    crate://crates.io/pyo3-macros/0.15.2;name=pyo3-macros-0.15.2 \
+    crate://crates.io/pyo3-macros-backend/0.15.2;name=pyo3-macros-backend-0.15.2 \
+    crate://crates.io/quote/1.0.23;name=quote-1.0.23 \
+    crate://crates.io/redox_syscall/0.2.16;name=redox_syscall-0.2.16 \
+    crate://crates.io/scopeguard/1.1.0;name=scopeguard-1.1.0 \
+    crate://crates.io/scratch/1.0.3;name=scratch-1.0.3 \
+    crate://crates.io/smallvec/1.10.0;name=smallvec-1.10.0 \
+    crate://crates.io/syn/1.0.107;name=syn-1.0.107 \
+    crate://crates.io/termcolor/1.1.3;name=termcolor-1.1.3 \
+    crate://crates.io/unicode-ident/1.0.6;name=unicode-ident-1.0.6 \
+    crate://crates.io/unicode-width/0.1.10;name=unicode-width-0.1.10 \
+    crate://crates.io/unindent/0.1.11;name=unindent-0.1.11 \
+    crate://crates.io/version_check/0.9.4;name=version_check-0.9.4 \
+    crate://crates.io/wasm-bindgen/0.2.83;name=wasm-bindgen-0.2.83 \
+    crate://crates.io/wasm-bindgen-backend/0.2.83;name=wasm-bindgen-backend-0.2.83 \
+    crate://crates.io/wasm-bindgen-macro/0.2.83;name=wasm-bindgen-macro-0.2.83 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.83;name=wasm-bindgen-macro-support-0.2.83 \
+    crate://crates.io/wasm-bindgen-shared/0.2.83;name=wasm-bindgen-shared-0.2.83 \
+    crate://crates.io/winapi/0.3.9;name=winapi-0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0;name=winapi-i686-pc-windows-gnu-0.4.0 \
+    crate://crates.io/winapi-util/0.1.5;name=winapi-util-0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0;name=winapi-x86_64-pc-windows-gnu-0.4.0 \
 "
 
-SRC_URI[Inflector.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
-SRC_URI[aliasable.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
-SRC_URI[android_system_properties.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[asn1.sha256sum] = "2affba5e62ee09eeba078f01a00c4aed45ac4287e091298eccbb0d4802efbdc5"
-SRC_URI[asn1_derive.sha256sum] = "bfab79c195875e5aef2bd20b4c8ed8d43ef9610bcffefbbcf66f88f555cc78af"
-SRC_URI[autocfg.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
-SRC_URI[bitflags.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bumpalo.sha256sum] = "37ccbd214614c6783386c1af30caf03192f17891059cecc394b4fb119e363de3"
-SRC_URI[cc.sha256sum] = "a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d"
-SRC_URI[cfg-if.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono.sha256sum] = "16b0a3d9ed01224b22057780a37bb8c5dbfe1be8ba48678e7bf57ec4b385411f"
-SRC_URI[codespan-reporting.sha256sum] = "3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e"
-SRC_URI[core-foundation-sys.sha256sum] = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc"
-SRC_URI[cxx.sha256sum] = "5add3fc1717409d029b20c5b6903fc0c0b02fa6741d820054f4a2efa5e5816fd"
-SRC_URI[cxx-build.sha256sum] = "b4c87959ba14bc6fbc61df77c3fcfe180fc32b93538c4f1031dd802ccb5f2ff0"
-SRC_URI[cxxbridge-flags.sha256sum] = "69a3e162fde4e594ed2b07d0f83c6c67b745e7f28ce58c6df5e6b6bef99dfb59"
-SRC_URI[cxxbridge-macro.sha256sum] = "3e7e2adeb6a0d4a282e581096b06e1791532b7d576dcde5ccd9382acf55db8e6"
-SRC_URI[iana-time-zone.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
-SRC_URI[iana-time-zone-haiku.sha256sum] = "0703ae284fc167426161c2e3f1da3ea71d94b21bedbcc9494e92b28e334e3dca"
-SRC_URI[indoc.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
-SRC_URI[indoc-impl.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
-SRC_URI[instant.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[js-sys.sha256sum] = "49409df3e3bf0856b916e2ceaca09ee28e6871cf7d9ce97a692cacfdb2a25a47"
-SRC_URI[libc.sha256sum] = "201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79"
-SRC_URI[link-cplusplus.sha256sum] = "ecd207c9c713c34f95a097a5b029ac2ce6010530c7b49d7fea24d977dede04f5"
-SRC_URI[lock_api.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[log.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-SRC_URI[num-integer.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-SRC_URI[num-traits.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[once_cell.sha256sum] = "2f7254b99e31cad77da24b08ebf628882739a608578bb1bcdfc1f9c21260d7c0"
-SRC_URI[ouroboros.sha256sum] = "dfbb50b356159620db6ac971c6d5c9ab788c9cc38a6f49619fca2a27acb062ca"
-SRC_URI[ouroboros_macro.sha256sum] = "4a0d9d1a6191c4f391f87219d1ea42b23f09ee84d64763cd05ee6ea88d9f384d"
-SRC_URI[parking_lot.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
-SRC_URI[parking_lot_core.sha256sum] = "60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc"
-SRC_URI[paste.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
-SRC_URI[paste-impl.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
-SRC_URI[pem.sha256sum] = "03c64931a1a212348ec4f3b4362585eca7159d0d09cbdf4a7f74f02173596fd4"
-SRC_URI[proc-macro-error.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-SRC_URI[proc-macro-error-attr.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro-hack.sha256sum] = "dc375e1527247fe1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068"
-SRC_URI[proc-macro2.sha256sum] = "57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5"
-SRC_URI[pyo3.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
-SRC_URI[pyo3-build-config.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
-SRC_URI[pyo3-macros.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
-SRC_URI[pyo3-macros-backend.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
-SRC_URI[quote.sha256sum] = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b"
-SRC_URI[redox_syscall.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[scopeguard.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[scratch.sha256sum] = "ddccb15bcce173023b3fedd9436f882a0739b8dfb45e4f6b6002bee5929f61b2"
-SRC_URI[smallvec.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[syn.sha256sum] = "1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5"
-SRC_URI[termcolor.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
-SRC_URI[unicode-ident.sha256sum] = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc"
-SRC_URI[unicode-width.sha256sum] = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
-SRC_URI[unindent.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
-SRC_URI[version_check.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasm-bindgen.sha256sum] = "eaf9f5aceeec8be17c128b2e93e031fb8a4d469bb9c4ae2d7dc1888b26887268"
-SRC_URI[wasm-bindgen-backend.sha256sum] = "4c8ffb332579b0557b52d268b91feab8df3615f265d5270fec2a8c95b17c1142"
-SRC_URI[wasm-bindgen-macro.sha256sum] = "052be0f94026e6cbc75cdefc9bae13fd6052cdcaf532fa6c45e7ae33a1e6c810"
-SRC_URI[wasm-bindgen-macro-support.sha256sum] = "07bc0c051dc5f23e307b13285f9d75df86bfdf816c5721e573dec1f9b8aa193c"
-SRC_URI[wasm-bindgen-shared.sha256sum] = "1c38c045535d93ec4f0b4defec448e4291638ee608530863b1e2ba115d4fff7f"
-SRC_URI[winapi.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
-SRC_URI[winapi-x86_64-pc-windows-gnu.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[Inflector-0.11.4.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
+SRC_URI[aliasable-0.1.3.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
+SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[asn1-0.13.0.sha256sum] = "2affba5e62ee09eeba078f01a00c4aed45ac4287e091298eccbb0d4802efbdc5"
+SRC_URI[asn1_derive-0.13.0.sha256sum] = "bfab79c195875e5aef2bd20b4c8ed8d43ef9610bcffefbbcf66f88f555cc78af"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bumpalo-3.10.0.sha256sum] = "37ccbd214614c6783386c1af30caf03192f17891059cecc394b4fb119e363de3"
+SRC_URI[cc-1.0.78.sha256sum] = "a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[chrono-0.4.23.sha256sum] = "16b0a3d9ed01224b22057780a37bb8c5dbfe1be8ba48678e7bf57ec4b385411f"
+SRC_URI[codespan-reporting-0.11.1.sha256sum] = "3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e"
+SRC_URI[core-foundation-sys-0.8.3.sha256sum] = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc"
+SRC_URI[cxx-1.0.85.sha256sum] = "5add3fc1717409d029b20c5b6903fc0c0b02fa6741d820054f4a2efa5e5816fd"
+SRC_URI[cxx-build-1.0.85.sha256sum] = "b4c87959ba14bc6fbc61df77c3fcfe180fc32b93538c4f1031dd802ccb5f2ff0"
+SRC_URI[cxxbridge-flags-1.0.85.sha256sum] = "69a3e162fde4e594ed2b07d0f83c6c67b745e7f28ce58c6df5e6b6bef99dfb59"
+SRC_URI[cxxbridge-macro-1.0.85.sha256sum] = "3e7e2adeb6a0d4a282e581096b06e1791532b7d576dcde5ccd9382acf55db8e6"
+SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
+SRC_URI[iana-time-zone-haiku-0.1.1.sha256sum] = "0703ae284fc167426161c2e3f1da3ea71d94b21bedbcc9494e92b28e334e3dca"
+SRC_URI[indoc-0.3.6.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
+SRC_URI[indoc-impl-0.3.6.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[js-sys-0.3.60.sha256sum] = "49409df3e3bf0856b916e2ceaca09ee28e6871cf7d9ce97a692cacfdb2a25a47"
+SRC_URI[libc-0.2.139.sha256sum] = "201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79"
+SRC_URI[link-cplusplus-1.0.8.sha256sum] = "ecd207c9c713c34f95a097a5b029ac2ce6010530c7b49d7fea24d977dede04f5"
+SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
+SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
+SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
+SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
+SRC_URI[once_cell-1.14.0.sha256sum] = "2f7254b99e31cad77da24b08ebf628882739a608578bb1bcdfc1f9c21260d7c0"
+SRC_URI[ouroboros-0.15.5.sha256sum] = "dfbb50b356159620db6ac971c6d5c9ab788c9cc38a6f49619fca2a27acb062ca"
+SRC_URI[ouroboros_macro-0.15.5.sha256sum] = "4a0d9d1a6191c4f391f87219d1ea42b23f09ee84d64763cd05ee6ea88d9f384d"
+SRC_URI[parking_lot-0.11.2.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
+SRC_URI[parking_lot_core-0.8.6.sha256sum] = "60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc"
+SRC_URI[paste-0.1.18.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
+SRC_URI[paste-impl-0.1.18.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
+SRC_URI[pem-1.1.0.sha256sum] = "03c64931a1a212348ec4f3b4362585eca7159d0d09cbdf4a7f74f02173596fd4"
+SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
+SRC_URI[proc-macro-hack-0.5.20+deprecated.sha256sum] = "dc375e1527247fe1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068"
+SRC_URI[proc-macro2-1.0.49.sha256sum] = "57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5"
+SRC_URI[pyo3-0.15.2.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
+SRC_URI[pyo3-build-config-0.15.2.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
+SRC_URI[pyo3-macros-0.15.2.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
+SRC_URI[pyo3-macros-backend-0.15.2.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
+SRC_URI[quote-1.0.23.sha256sum] = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b"
+SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
+SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
+SRC_URI[scratch-1.0.3.sha256sum] = "ddccb15bcce173023b3fedd9436f882a0739b8dfb45e4f6b6002bee5929f61b2"
+SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
+SRC_URI[syn-1.0.107.sha256sum] = "1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5"
+SRC_URI[termcolor-1.1.3.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
+SRC_URI[unicode-ident-1.0.6.sha256sum] = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc"
+SRC_URI[unicode-width-0.1.10.sha256sum] = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
+SRC_URI[unindent-0.1.11.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
+SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[wasm-bindgen-0.2.83.sha256sum] = "eaf9f5aceeec8be17c128b2e93e031fb8a4d469bb9c4ae2d7dc1888b26887268"
+SRC_URI[wasm-bindgen-backend-0.2.83.sha256sum] = "4c8ffb332579b0557b52d268b91feab8df3615f265d5270fec2a8c95b17c1142"
+SRC_URI[wasm-bindgen-macro-0.2.83.sha256sum] = "052be0f94026e6cbc75cdefc9bae13fd6052cdcaf532fa6c45e7ae33a1e6c810"
+SRC_URI[wasm-bindgen-macro-support-0.2.83.sha256sum] = "07bc0c051dc5f23e307b13285f9d75df86bfdf816c5721e573dec1f9b8aa193c"
+SRC_URI[wasm-bindgen-shared-0.2.83.sha256sum] = "1c38c045535d93ec4f0b4defec448e4291638ee608530863b1e2ba115d4fff7f"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-- 
2.40.0


