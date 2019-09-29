Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0BA47F273
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:14:07 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u28so5450680lfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 13:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tlBb5Po7h6TH1Aj7zIwx6eU9peU6Xz1s+pAyMNghmJU=;
	b=lOe2Giadx2QhdRR8atQwN682njY6vPY+7oZiRJM21IzDglpkPC9l1x5i+byPMgjHv5
	eJAj/7s3fJxybGFAVtFXUxtYe7BZvr0ph6O3DPWGKpqpvRNK1ZibCcEWCUBcGlWTpUnP
	YnHzRQUhYjj9YjXYoAA+DThGz6Vv07O0DuxqwF/cmNm+ga1rUuaaeWYIHN93x2hF1EQY
	lirMeH+SjVlyFpGYt9KHMY7GH2TomOwQB9J5k1jkkH6ADH3ejlFZYyJ2eFvCeYKkkV1R
	AKpzlPnMA+d5qrZm78dlTEJrCiv17ZN4X5wBhrlZuJ4Zcr39+n/1UbkdEarDTohOs9GF
	CDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tlBb5Po7h6TH1Aj7zIwx6eU9peU6Xz1s+pAyMNghmJU=;
	b=i3joqEMrE/CiSduzR9OWph8qz2nvZLCjBln03VItKAjuBeEMkcOSgBfft7fNrELdhx
	CURudc92FYCTtoK8ZSKiXEjnYQwNfoJpp+1wf0CRoE2cIQG9OPY0FfsYt/r9C8zQ9wL8
	/+3Eto9eADvg27pO8V37j6/Veicyd20DuFdO9Epvffe/vGLnEJx2S9tDfk8TZM2sXuTc
	2dSOMrWXWdX5TFJNobcaZDrYlh5oHezrZZZY9MF2dBXIlcHr0YLA3RDfVsqak4YxqUss
	x62/Md3GpsU6/OGnTHq6Zjr7gsq+UXGBm/qJqsmSuNnVfRJD/tOTb0ffSolEjZFNfy9K
	4J2g==
X-Gm-Message-State: APjAAAU0up+Rhk6++LM+/rXcCFFw2KVWSkqTXMsBOc03aTvEFiS3lJY0
	1iJr+1G4Ffeu6tQ6GGKIDcgSlkLs
X-Google-Smtp-Source: APXvYqwyNqFvi89wyTATtJF+Raig0EfvcKYD26AIEQZlvNAQXScMlXM7UN9DTA9PB93LZEnaez0yng==
X-Received: by 2002:ac2:44b9:: with SMTP id c25mr9597301lfm.112.1569788047305; 
	Sun, 29 Sep 2019 13:14:07 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.87])
	by smtp.gmail.com with ESMTPSA id
	w77sm2414685lff.49.2019.09.29.13.14.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 13:14:06 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:13:59 +0300
Message-Id: <20190929201359.9837-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929201359.9837-1-dbaryshkov@gmail.com>
References: <20190929201359.9837-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 5/5] shim: add first-stage UEFI bootloader implementing MOK protocol
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
X-List-Received-Date: Sun, 29 Sep 2019 20:14:08 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 ...ompareMem-on-MokListNode.Type-instea.patch | 69 ++++++++++++++++++
 meta/recipes-bsp/shim/shim_git.bb             | 72 +++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
 create mode 100644 meta/recipes-bsp/shim/shim_git.bb

diff --git a/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
new file mode 100644
index 000000000000..12ee342e9f64
--- /dev/null
+++ b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
@@ -0,0 +1,69 @@
+From f30cd0b6330be8ea72a93bf25e43829c222ba611 Mon Sep 17 00:00:00 2001
+From: Gary Lin <glin@suse.com>
+Date: Tue, 26 Feb 2019 11:33:53 +0800
+Subject: [PATCH] MokManager: Use CompareMem on MokListNode.Type instead of
+ CompareGuid
+
+Fix the errors from gcc9 '-Werror=address-of-packed-member'
+
+https://github.com/rhboot/shim/issues/161
+
+Signed-off-by: Gary Lin <glin@suse.com>
+Upstream-Status: Submitted[https://github.com/rhboot/shim/pull/170]
+---
+ MokManager.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/MokManager.c b/MokManager.c
+index d69b4dbe..05dc1622 100644
+--- a/MokManager.c
++++ b/MokManager.c
+@@ -1053,7 +1053,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 			continue;
+ 
+ 		DataSize += sizeof(EFI_SIGNATURE_LIST);
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0)
+ 			DataSize += sizeof(EFI_GUID);
+ 		DataSize += list[i].MokSize;
+ 	}
+@@ -1075,7 +1076,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 		CertList->SignatureType = list[i].Type;
+ 		CertList->SignatureHeaderSize = 0;
+ 
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			CertList->SignatureListSize = list[i].MokSize +
+ 			    sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
+ 			CertList->SignatureSize =
+@@ -1116,7 +1118,8 @@ static void delete_cert(void *key, UINT32 key_size,
+ 	int i;
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
++		if (CompareMem(&(mok[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) != 0)
+ 			continue;
+ 
+ 		if (mok[i].MokSize == key_size &&
+@@ -1167,7 +1170,7 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 	sig_size = hash_size + sizeof(EFI_GUID);
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
++		if ((CompareMem(&(mok[i].Type), &Type, sizeof(EFI_GUID)) != 0) ||
+ 		    (mok[i].MokSize < sig_size))
+ 			continue;
+ 
+@@ -1331,7 +1334,8 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ 
+ 	/* Search and destroy */
+ 	for (i = 0; i < del_num; i++) {
+-		if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(del_key[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			delete_cert(del_key[i].Mok, del_key[i].MokSize,
+ 				    mok, mok_num);
+ 		} else if (is_sha2_hash(del_key[i].Type)) {
diff --git a/meta/recipes-bsp/shim/shim_git.bb b/meta/recipes-bsp/shim/shim_git.bb
new file mode 100644
index 000000000000..10769ac75a0a
--- /dev/null
+++ b/meta/recipes-bsp/shim/shim_git.bb
@@ -0,0 +1,72 @@
+SUMMARY = "shim is a first stage EFI bootloader."
+DESCRIPTION = "shim is a trivial EFI application that, when run, \
+attempts to open and execute another application. It will initially \
+attempt to do this via the standard EFI LoadImage() and StartImage() \
+calls. If these fail (because secure boot is enabled and the binary \
+is not signed with an appropriate key, for instance) it will then \
+validate the binary against a built-in certificate. If this succeeds \
+and if the binary or signing key are not blacklisted then shim will \
+relocate and execute the binary."
+HOMEPAGE = "https://github.com/rhboot/shim.git"
+SECTION = "bootloaders"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b92e63892681ee4e8d27e7a7e87ef2bc"
+
+DEPENDS += "\
+    gnu-efi \
+"
+
+PV = "15+git${SRCPV}"
+
+SRC_URI = "\
+    git://github.com/rhboot/shim.git \
+    file://0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch \
+"
+
+SRCREV = "a4a1fbe728c9545fc5647129df0cf1593b953bec"
+
+S = "${WORKDIR}/git"
+
+SHIM_IMAGE = "shim-${EFI_BOOT_IMAGE}"
+
+# install to the image as boot*.efi if its the EFI_PROVIDER,
+# otherwise install as the full name.
+# This allows multiple bootloaders to coexist in a single image.
+python __anonymous () {
+    if d.getVar('EFI_PROVIDER') == "shim":
+        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
+    else:
+        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("SHIM_IMAGE"))
+}
+
+inherit deploy
+
+TUNE_CCARGS_remove = "-mfpmath=sse"
+
+EXTRA_OEMAKE = "\
+    CROSS_COMPILE="${TARGET_PREFIX}" \
+    COMPILER="gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+    EFI_INCLUDE="${STAGING_INCDIR}/efi" \
+    EFI_PATH="${STAGING_LIBDIR}" \
+    LIBDIR="${STAGING_LIBDIR}" \
+"
+
+COMPATIBLE_HOST = "${EFI_COMPATIBLE_HOST}"
+
+require conf/image-uefi.conf
+
+do_install() {
+    install -d ${D}${EFI_FILES_PATH}
+    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/
+    install -m 0755 shim${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/${SHIM_EFI_BOOT_IMAGE}
+}
+
+# Install the unsigned images for manual signing
+do_deploy() {
+    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${DEPLOYDIR}
+    install -m 0755 shim${EFI_ARCH}.efi ${DEPLOYDIR}/${SHIM_IMAGE}
+}
+addtask deploy after do_install before do_build
+
+FILES_${PN} += "${EFI_FILES_PATH}"
-- 
2.23.0


