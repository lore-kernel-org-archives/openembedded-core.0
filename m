Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC1DC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:38:42 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.18586.1737657517239934409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=beEHi3es;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=xc0RRSmMFu0PResSJN7QOutuQ3t/YFE4Xcbwzd5f0fk=; b=beEHi3esOSUuJQxxWLM8uWh4EA
	wr5WsueRF4ZlDsICKssNtif7gd+ROJx9UqgQUhYqA+sAWMvDLUpxjSuv4EM5hZ7aZ8wXDBk6ppV3Z
	HR55Vy7375RFYw+fV+/0hBz/LOZ8iq0TA1ryHrVRHDFpc8A8UmEkEB468OEt4g7kFOEvuCUJ8y/1x
	f9b9ec9jMdO3vsAryWus7Se0+yXs5ughT2PmkK7kZ2LAPdvn4bUMlS22odFnmlay6aoJqIDKG9MdX
	JTBQJldVX6VDvuH84fOSS9Jdyei3CF4OpcF4hi3thhizJyEtk9srwNgpG94w/voUhNS4PbYzomWsI
	nmTqEkLA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tb267-000PQi-1F;
	Thu, 23 Jan 2025 19:38:35 +0100
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tb267-0001tL-0U;
	Thu, 23 Jan 2025 19:38:35 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 1/2] rust-cross-canadian: set CC_<triple> for nativesdk
Date: Thu, 23 Jan 2025 19:38:08 +0100
Message-ID: <20250123183812.2247598-1-sean@geanix.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27527/Thu Jan 23 10:44:17 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210204

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

Changes since v1:
- rebased on top of "rust: fix for rust multilib sdk configuration"

 meta/recipes-devtools/rust/rust_1.81.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devto=
ols/rust/rust_1.81.0.bb
index 24a0319dbe..130f98fae5 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -277,10 +277,12 @@ rust_do_install:class-nativesdk() {
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
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
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT=
/lib/${SDKLOADER}"
+	export CC_$RUST_HOST_CC=3D"${CCACHE}${HOST_PREFIX}gcc"
 	EOF
     chown -R root.root ${D}
 }
--=20
2.47.1


