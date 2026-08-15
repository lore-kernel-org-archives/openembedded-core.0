Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2412C5DF6E
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 12:46:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8155.1786797989384392625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 05:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBjHwU6o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1112565f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786797987; x=1787402787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=His+RuHF5S6XdfpggjKKtUnNgbZM7cII7mJTqRXiWzU=;
        b=HBjHwU6oOxHPCFDK3AgmeO5/5HwyP4y64DtLCpKf9coh69QUEANoDiob3K3kgBImEX
         utobkdyLENqmZ+2DlxJFDQlSX0eWZJEXmfdW4yhIbnN5Y3ynGDMqNpDKSMmyDflbBA69
         uxdqsb3VXHMVlJsIzHljDIW72o/CfJp51LtOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786797987; x=1787402787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=His+RuHF5S6XdfpggjKKtUnNgbZM7cII7mJTqRXiWzU=;
        b=WtjcE+T72ySIlbsyfzSTV4VF33ggEbbOe2Hnrb1JZqHURbELs5sLAjZnzk2sS5knpB
         u+hUQwiXoUAKQ9oJcXixOkrzr/Rcr5WSIZqjLNKPoOnw1qEpC6qgf+K4C2yLY+FTlZCZ
         SFpr6SvKIl/m36dL1JKL0HPLmBVIfizaHuf9nR2EpIHMTrfAHcHKqqOZ4jc59s1syGGp
         FhVNMCin02B1aoqHSv4LbkzMbRfhDGOcUhfpvmhNCbUXg/aqr59DTH7CAnrWq/I1cAOy
         BOYD+sHEKeEgf5XpKOgd1JIWxeKpEkzCfF4o3gvnF/ivMuAxCt8tKb7tpedpeLcwzHNJ
         ZlXQ==
X-Gm-Message-State: AOJu0YwBK85GG70YmPhVS2bywS/AF4OVZn+mUSKLFzw0el9WaKba5eHt
	9E9pY9DCi1x//3qK/feRL9PHsVB1YJgO33zNDYVMCKppxxpWXrgo+22MZyq0SUZoOhMkhcdkK3l
	IRTdIrkI=
X-Gm-Gg: AR+sD1349xN02hmzbSSnbPoznvpjYXQPln4DxMU53oc9DzXZQM9UT78iPVvJf7/+mYn
	4T1B42p0hI1yceY1cV9VZZ0Fnplmt3tKYuk2eo2nze9Clw3ugfphnBYMp/YFzA6q3Xkt3sCuXId
	4SvHfijHJ/jN+SOVGcuLYu4McpfnH+Y7ExAXPp0eMysHQpSGT1CKBrK8/9SsQBrX1/YujHVi41b
	bYcirla1ZCQnqppEGjZRxR0NZBnzPXiphxjBLZU3P5fH2YeWsg5jWgSwGLsCWe4gPSLDohGjkzP
	eWxf8C90ycJ7Z9ImdZ2WogRcf2OtZl0agzL35sBkt0eRYSca/YlbgknaUsaVfyN28Mb37BQjN2b
	8ca1qYZXd+EOcWJXO1B3W1hY/LwhItcUlhOvFAb+2VsKNzjMsUO4lnCar0AjnIkck4wKTQC5VWv
	V3RWtSI5N68LO2HZAyCXzpTtG0qjZaR43J98rZ+BNGHpBEHuxNOhAh4LzB9ThEvIpzbwgrtrzGM
	qfKtTn7sdU6zBuy
X-Received: by 2002:a05:6000:65b:b0:481:5ce0:f270 with SMTP id ffacd0b85a97d-4816070fd21mr17716958f8f.1.1786797987270;
        Sat, 15 Aug 2026 05:46:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm17245267f8f.1.2026.08.15.05.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:46:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-uv-build: upgrade 0.12.3 -> 0.12.5
Date: Sat, 15 Aug 2026 13:46:22 +0100
Message-ID: <20260815124622.3666801-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
References: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 12:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243485

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 72 +++++++++++++++----
 ...d_0.12.3.bb => python3-uv-build_0.12.5.bb} |  2 +-
 2 files changed, 61 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.3.bb => python3-uv-build_0.12.5.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index c7ab4f76ff3..8d76d041f3d 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -5,12 +5,14 @@ SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aho-corasick/1.1.4 \
     crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/ambient-authority/0.0.2 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
+    crate://crates.io/archive-trait/0.0.13 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.4 \
@@ -30,11 +32,13 @@ SRC_URI += " \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.1 \
+    crate://crates.io/cap-primitives/4.0.2 \
+    crate://crates.io/cap-std/4.0.2 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.4 \
-    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap/4.6.5 \
+    crate://crates.io/clap_builder/4.6.5 \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
@@ -73,6 +77,7 @@ SRC_URI += " \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
+    crate://crates.io/fs-set-times/0.20.3 \
     crate://crates.io/futures/0.3.33 \
     crate://crates.io/futures-channel/0.3.33 \
     crate://crates.io/futures-core/0.3.33 \
@@ -104,6 +109,10 @@ SRC_URI += " \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/insta/1.48.0 \
+    crate://crates.io/io-extras/0.19.0 \
+    crate://crates.io/io-lifetimes/2.0.4 \
+    crate://crates.io/io-lifetimes/3.0.1 \
+    crate://crates.io/ipnet/2.12.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
@@ -116,13 +125,14 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
+    crate://crates.io/maybe-owned/0.3.4 \
     crate://crates.io/memchr/2.8.3 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
@@ -170,11 +180,12 @@ SRC_URI += " \
     crate://crates.io/rkyv_derive/0.8.17 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix-linux-procfs/0.1.1 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schemars/1.2.1 \
-    crate://crates.io/schemars_derive/1.2.1 \
+    crate://crates.io/schemars/1.2.2 \
+    crate://crates.io/schemars_derive/1.2.2 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
@@ -182,7 +193,7 @@ SRC_URI += " \
     crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
-    crate://crates.io/serde_derive_internals/0.29.1 \
+    crate://crates.io/serde_derive_internals/0.30.0 \
     crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
@@ -203,6 +214,8 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/tar-codec/0.0.13 \
+    crate://crates.io/tar-framing/0.0.13 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -262,18 +275,29 @@ SRC_URI += " \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
+    crate://crates.io/winx/0.36.4 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -293,12 +317,14 @@ SRC_URI += " \
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
+SRC_URI[ambient-authority-0.0.2.sha256sum] = "e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
+SRC_URI[archive-trait-0.0.13.sha256sum] = "dc23b595ad4092163eaf9c0c7532dd5b6d82274c21560c97dc03fa4e4f09e645"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.4.sha256sum] = "b18457efd137254e016bbde5e1d88df61c4e1a5ae2223746e56123bac6af2463"
@@ -318,11 +344,13 @@ SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
+SRC_URI[cap-primitives-4.0.2.sha256sum] = "cdadbd7c002d3a484b35243669abdae85a0ebaded5a61117169dc3400f9a7ff0"
+SRC_URI[cap-std-4.0.2.sha256sum] = "7281235d6e96d3544ca18bba9049be92f4190f8d923e3caef1b5f66cfa752608"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.4.sha256sum] = "d91e0c145792ef73a6ad36d27c75ac09f1832222a3c209689d90f534685ee5b7"
-SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
+SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
 SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
@@ -361,6 +389,7 @@ SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cb
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
+SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
 SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
 SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
 SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
@@ -392,6 +421,10 @@ SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9e
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
+SRC_URI[io-lifetimes-2.0.4.sha256sum] = "06432fb54d3be7964ecd3649233cddf80db2832f47fec34c01f65b3d9d774983"
+SRC_URI[io-lifetimes-3.0.1.sha256sum] = "2f0fb0570afe1fed943c5c3d4102d5358592d8625fda6a0007fdbe65a92fba96"
+SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
@@ -404,13 +437,14 @@ SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf41
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
+SRC_URI[maybe-owned-0.3.4.sha256sum] = "4facc753ae494aeb6e3c22f839b158aebd4f9270f55cd3c79906c45476c47ab4"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
@@ -458,11 +492,12 @@ SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908
 SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
-SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d81715d0420f8bc77a18c6260b307f"
+SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
+SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
@@ -470,7 +505,7 @@ SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
-SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
+SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
 SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
@@ -491,6 +526,8 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[tar-codec-0.0.13.sha256sum] = "f718b1f470b8ff575d12c85c33bdc8b33743009669c7a5e1923b6583235a2258"
+SRC_URI[tar-framing-0.0.13.sha256sum] = "5aca504a58616b04eb381819c4ddfdf87b6d35f6699090e68d8b40954fb42da7"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
@@ -550,18 +587,29 @@ SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
+SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.3.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.5.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.3.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.5.bb
index e8444ec0206..f208c1318bf 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.3.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "b6f51ed4411a35f008c9ef6e28016ac8f167f5c14fb2d0e453a9a97246b14206"
+SRC_URI[sha256sum] = "0fd12723392fcb697c6512e1cbdbd4e5d30af4702578700c472a6d1a0044c71c"
 
 require ${BPN}-crates.inc
 

