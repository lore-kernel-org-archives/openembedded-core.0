Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8CC7844F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:53:56 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id k93so27415143ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VqlE8Hq5ZwL01iKbQ+5T1DpcYUpiPpwXLi9omi7K5oo=;
	b=dYMtuV0ED0xjv/nnPJNia6V1Yk0imhnu91DDF+jJZyZ5rKf8wu1GNYJ7MiyjgjLI92
	N8GRHNvogaZKzKtDJUcbNs0GSnzR7sV/BsygmjiAdQAT5L0UUt4bn/EWeXPexWjcd3xH
	aPhVb0JLw/EfgBmBcUOajQb9Xs+jvbVl84IkTShkbB2U8skizxhhTZ7YsjOQ0tWACx22
	AZGwmHrtt6d9nA2fWNpwCggeVBbjdxQURjrEZ7uNkUURXas7PU1XSqPY7e1SX4JEYOQ9
	/yiWqLvqEJ54Px19y0zpHVXOx5r1a+YKaomPo6Q946LDo7bQOStF+Oza4L+ZuN5Z7kN3
	/n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VqlE8Hq5ZwL01iKbQ+5T1DpcYUpiPpwXLi9omi7K5oo=;
	b=TaJsvyWLZyxISz+OeOmWl76yzWgsRf9Ty2x0fRSeuQa9hGGnwAsyG89agihme6pja/
	7Ia4z03rSOwxrhlY9NgVyrt3gE28iChMvSUmtukt9lxGPXsTACw3naoulJkLe0t0NemC
	PLyQrBHHC2jwUcJ8B33/T57X9/phgy4j9Hxe1aobzO+VtvmjNlxy5N3mcMWpiLf2V7R1
	8Zadyw3Zmo8Y5bBJXjCERxqhzq+U4o88e0TOkE5oHIc1RQpDX7wOyAk01zd1tN6ggkra
	0fagfINb6ZJpDkq6hCi0weJOw/RN8K+zODn/KcuaDNuTffku7fgt9XMLgkHhaXdxvtUe
	YXgw==
X-Gm-Message-State: AKS2vOyImV3b3z+c5nsB5flz6eNLXePtPP5bKCbIdkTtQvYj9mvPNneS
	Kzi+P47xVMRt3C/bjiI=
X-Received: by 10.107.19.71 with SMTP id b68mr9185429ioj.0.1497606837872;
	Fri, 16 Jun 2017 02:53:57 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EEFB.dip0.t-ipconnect.de.
	[93.232.238.251]) by smtp.gmail.com with ESMTPSA id
	t194sm1067768iof.23.2017.06.16.02.53.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 02:53:56 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 11:53:48 +0200
Message-Id: <22146d3f8ce5f2c3da42f8f19cad49f9f4ffc175.1497606816.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ovmf: fix secureboot PACKAGECONFIG + OpenSSL update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 09:53:59 -0000

The recent ovmf update broke secureboot because upstream changed the
way how openssl gets compiled into ovmf. It's now integrated directly
into the ovmf build process, without having to patch it first.

In addition, more recent OpenSSL releases are supported. 1.1.0e was
explicitly mentioned in the ovmf commits and because the current
1.1.0f only has minor build enhancements, 1.1.0e is used here.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 5d7216e..28f0cde 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -18,14 +18,16 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://no-stack-protector-all-archs.patch \
         "
 
+OPENSSL_RELEASE = "openssl-1.1.0e"
+
 SRC_URI_append_class-target = " \
-	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/${OPENSSL_RELEASE}.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
 	file://0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch \
 "
 
 SRCREV="ec4910cd3336565fdb61dafdd9ec4ae7a6160ba3"
-SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
-SRC_URI[openssl.sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
+SRC_URI[openssl.md5sum] = "51c42d152122e474754aea96f66928c6"
+SRC_URI[openssl.sha256sum] = "57be8618979d80c910728cfc99369bf97b2a1abd8f366ab6ebdee8975ad3874c"
 
 inherit deploy
 
@@ -187,10 +189,7 @@ do_compile_class-target() {
         # building with Secure Boot enabled.
         bbnote "Building with Secure Boot."
         rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-        if ! [ -f ${S}/CryptoPkg/Library/OpensslLib/openssl-*/edk2-patch-applied ]; then
-            ( cd ${S}/CryptoPkg/Library/OpensslLib/openssl-* && patch -p1 <$(echo ../EDKII_openssl-*.patch) && touch edk2-patch-applied )
-        fi
-        ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
+        ln -sf ${OPENSSL_RELEASE} ${S}/CryptoPkg/Library/OpensslLib/openssl
         ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
         ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
         ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.code.fd

base-commit: 059846662f1ea1c82804cfce5f91afcb2980ec8a
-- 
git-series 0.9.1

