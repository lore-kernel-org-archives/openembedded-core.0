Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A72E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:21:52 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.40505.1736842904477072969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=zLgYMGTj;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YJZbQu1VVNLCDnRlj6su1q3cRY6bWNEYXXuM45MAF2U=; b=zLgYMGTj1+m6bR3gHoAt/AR8L/
	CKl7JK3gTJcizv93m36cSpfF7WeAk74aCYHcgyrxFIKssRMhq5tpvS38VkEAi2U58NCeiIA3C5x9F
	fafKhbJbuub3qHsouJdoGt/t3OfcgGIWjHsWEFYDIt3RxtTgpaiOUOnIOWsq4gi4fW8zPqFA0QyEn
	xG8/cpAyM6uCD06HDvcucksIKcICnuu92cUjei5rS9eDPnwLYdFtgIOPl+Gn/wlGxZ11bQoHj0kKo
	bD4GQQgJYCDwskdhTvQQFhlt4Y6BbHFCwHxxpeKJH1KD0z8xidCZbYpMIO5fUHZkgx1AORYE6l+cR
	1zRAcPlA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tXcBC-0000yE-1T;
	Tue, 14 Jan 2025 09:21:42 +0100
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tXcBC-000I4z-1S;
	Tue, 14 Jan 2025 09:21:42 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	raj.khem@gmail.com
Subject: [PATCH] rust-cross-canadian: set CC_<triple> for nativesdk
Date: Tue, 14 Jan 2025 09:21:26 +0100
Message-ID: <20250114082128.903105-1-sean@geanix.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27517/Mon Jan 13 10:41:18 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209782

This fixes build errors when building rust bindings for C dependencies
for the sdk host.
This will allow us to build and run rust programs on the sdk host.

Before:
% cargo build --target x86_64-oesdk-linux-gnu -vv
[...]
   Compiling zstd-sys v2.0.13+zstd.1.5.6 (zstd-rs/zstd-safe/zstd-sys)
[zstd-sys 2.0.13+zstd.1.5.6] CC_x86_64-oesdk-linux-gnu =3D None
[zstd-sys 2.0.13+zstd.1.5.6] CC =3D Some(arm-oe-linux-gnueabi-gcc  -mthumb =
-mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -D_TIME_BITS=3D64 -D_FILE=
_OFFSET_BITS=3D64 --sysroot=3D/usr/local/sdk/sysroots/cortexa7t2hf-neon-oe-=
linux-gnueabi)
[zstd-sys 2.0.13+zstd.1.5.6] cargo:warning=3DToolExecError: Command LC_ALL=
=3D"C" "arm-oe-linux-gnueabi-gcc" "-mthumb" "-mfpu=3Dneon" "-mfloat-abi=3Dh=
ard" "-mcpu=3Dcortex-a7" "-D_TIME_BITS=3D64" "-D_FILE_OFFSET_BITS=3D64" "--=
sysroot=3D/usr/local/cc-sdk/sysroots/cortexa7t2hf-neon-oe-linux-gnueabi" "-=
O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-gdwarf-4" "-fno-omit-=
frame-pointer" "-m64" "-I" "zstd/lib/" "-I" "zstd/lib/common" "-I" "zstd/li=
b/legacy" "-O2" "-pipe" "-g" "-feliminate-unused-debug-types" "-flto" "-ffa=
t-lto-objects" "-fuse-linker-plugin" "-fvisibility=3Dhidden" "-DZSTD_LIB_DE=
PRECATED=3D0" "-DXXH_PRIVATE_API=3D" "-DZSTDLIB_VISIBILITY=3D" "-DZDICTLIB_=
VISIBILITY=3D" "-DZSTDERRORLIB_VISIBILITY=3D" "-DZSTD_LEGACY_SUPPORT=3D1" "=
-o" "zstd-rs/target/x86_64-oesdk-linux-gnu/debug/build/zstd-sys-b2560022e17=
2eec3/out/44ff4c55aa9e5133-debug.o" "-c" "zstd/lib/common/debug.c" with arg=
s arm-oe-linux-gnueabi-gcc did not execute successfully (status code exit s=
tatus: 1).cargo:warning=3Darm-oe-linux-gnueabi-gcc: error: unrecognized com=
mand-line option '-m64'

After:
% cargo build --target x86_64-oesdk-linux-gnu -vv
[...]
   Compiling zstd-sys v2.0.13+zstd.1.5.6 (zstd-rs/zstd-safe/zstd-sys)
[zstd-sys 2.0.13+zstd.1.5.6] CC_x86_64_oesdk_linux_gnu =3D Some(x86_64-oesd=
k-linux-gcc)
[...]
   Compiling zstd v0.13.2 (zstd-rs)
    Finished dev [unoptimized + debuginfo] target(s) in 14.67s

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/reci=
pes-devtools/rust/rust-cross-canadian.inc
index c34b839d159..c334bc8890f 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -58,11 +58,13 @@ do_install () {
=20
     RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:uppe=
r:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]'=
 | sed 's/-/_/g'`
+    RUST_HOST_CC=3D`echo ${RUST_HOST_SYS} | sed 's/-/_/g'`
     SDKLOADER=3D${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-6=
4.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '=
', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', =
'', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@b=
b.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', =
d)}
=20
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OECO=
RE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT"
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT=
/lib/${SDKLOADER}"
+	export CC_$RUST_HOST_CC=3D"${CCACHE}${HOST_PREFIX}gcc"
 	export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/=
rustlib"
 	EOF
=20
--=20
2.47.1


