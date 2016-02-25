Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 998BA7317F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:09:12 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so37016360wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VtGkZs1pvCvEp041EzrLAJwYMrlC7b6x/W0Do4fH2PA=;
	b=Pbi77hWV8rs03S5wZ1WS1noHCDPoKXRM2xLjzp4xoUfim41QcKQ2LnNy546aVKRMdo
	P7cQL2d0fhSCHdLHTQ7/WiKy86y9nL/s8rac9caligKSnVXQQiY58tCNTQ7nMd+oPaaU
	+w0GBe/iFvLkwkLVDzV0KYG/sd8ADWFyTUr/riAFTMsw+LYzfd4MbdyqA/t/XjSgqwZ9
	htJ0qzGY/et5pArMoprf4HJj1LO+f6ZsOcSdgkj5MVag8Bhs8shQ8Kji0FMe05AwDfy1
	Alw94BrEGl32p3L6QLg5BJgHEZ9U9al38fzSajaDUL5oUqMdicN7spqJ1UREDSAKjtyg
	SJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VtGkZs1pvCvEp041EzrLAJwYMrlC7b6x/W0Do4fH2PA=;
	b=HZ0frpJIdSMP7orNM1mxgk96/kpKzEYhMBdIrEOXT2bTuC8cCSki7OlmgCXyY3Yi+N
	emai5uYDONNTmlsKG5cmzqCFg33TdZpn7KZ++rxRRNTuU+ZmDQ49nhOCMr9T3/V/J83L
	olhSge9sF9vz62Y1aUR5lE0CXSytdjSgK3+20CSiqUMde0E4v81cSxANQzFkVx2cVh5A
	V10MMH5mm88r81GNvU7w+ThQiAh3tM84voWtZoqdwKalFu2tNx81Z9KzYexF3B9jxbbq
	WbwkgHaxMENIwaH9kkL1dom6h+RCnXpjAOcPTD0Vp0MtHbGkHwMIjrZmvqyH708kQgRE
	1Fsg==
X-Gm-Message-State: AG10YOR8qBJHWMsVWFhL/G3FRAR+gov+yhM5ufmcKvNCnTAFr+PTAaHuv9L23zLip6Vcy+WY
X-Received: by 10.28.98.138 with SMTP id w132mr4422299wmb.45.1456420153254;
	Thu, 25 Feb 2016 09:09:13 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id up6sm8820080wjc.6.2016.02.25.09.09.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 09:09:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:09:09 +0000
Message-Id: <1456420149-22638-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uninative-tarball: respect SDKMACHINE when building
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
X-List-Received-Date: Thu, 25 Feb 2016 17:09:15 -0000

So that a single machine can build multiple architectures for the
uninative-tarball respect SDK_ARCH instead of BUILD_ARCH.

This means a x86-64 host can build a i686 uninative-tarball by setting
SDKMACHINE=i686.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 21f3bd9..ab1015f 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -13,7 +13,7 @@ TOOLCHAIN_HOST_TASK = "\
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-TOOLCHAIN_OUTPUTNAME ?= "${BUILD_ARCH}-nativesdk-libc"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_ARCH}-nativesdk-libc"
 
 RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
@@ -43,9 +43,11 @@ fakeroot create_sdk_files() {
 fakeroot tar_sdk() {
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	mv sysroots/${SDK_SYS} ./${BUILD_SYS}
+
+	DEST="./${SDK_ARCH}-${SDK_OS}"
+	mv sysroots/${SDK_SYS} $DEST
 	rm sysroots -rf
-	patchelf --set-interpreter ${@''.join('a' for n in xrange(1024))} ./${BUILD_SYS}/usr/bin/patchelf
-	mv ./${BUILD_SYS}/usr/bin/patchelf ./${BUILD_SYS}/usr/bin/patchelf-uninative
+	patchelf --set-interpreter ${@''.join('a' for n in xrange(1024))} $DEST/usr/bin/patchelf
+	mv $DEST/usr/bin/patchelf $DEST/usr/bin/patchelf-uninative
 	tar ${SDKTAROPTS} -c -j --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
-- 
2.7.0


