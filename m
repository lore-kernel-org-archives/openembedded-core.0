Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2397179F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 20:23:23 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w4so9974136plz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 12:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S/3LOYw0uFZPknpYTq1dVytRXOzwFFi5ptE78cX2g84=;
	b=osRVwWdYIlWTcvUkPxLB4+8pXbKhm9puVBujMGdPluBVWGQPBOdBk8Mn1ScH8aLfN2
	Zgytb/xNCKr5WBXlWQt8yqFjVB1+uSi8k3aZGRYbY8LEePZ6SyTNFpAiuUB8pbPd+nHv
	jGnKl4SkrTocDZnbC3Oro1LmUIR++XndYHdB5qRgEoBCqRoZ3emrZQdUX7wvgImPmfnF
	p5H0IZmanqogktW6Nhb8mmLVnqisHNZsFd0KuCXAQmIJ0vw3vQ1GsD2k/XgR9Aisbn/t
	D6X4i9+PxSJrehHVxfbyzrby7vrNjuR3X3jyPcm1obKOcbxybtbpgH7VasjuBUu+B+VQ
	phBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S/3LOYw0uFZPknpYTq1dVytRXOzwFFi5ptE78cX2g84=;
	b=dCc2pg6ijWLUlWBst7WQCx7a8OQ4BT8antZ6a2RG1Mu0f8O9egnJFkv3OCjOMbcDjg
	A9N4Ult1h9GExuFsrWW5LfhBRllaVYEpHquXtsPCLRYaoJPQc/TFgE7apIUF7oBlOd4j
	i8wmbAqUAV/hvbjhg/9u/8Lz+V35tqUWPSDJpM7I2yCvP1eSF2erxrQy445t08AEJ2cP
	ohOGxk9jStYzl+OC1lR3Cf84V1emBsP2DF0KUTMdauZ8kDvqNpEvhJZjKHXwbnVQyi1M
	iyn6GCbAKsSDhvjNQAOZOySICc/S1USCBaDP4uFaN/BtkNjtRki3LcHLOU6Be+pEd/me
	bHyw==
X-Gm-Message-State: AA+aEWbTI5g47Kuxn4P1lFSDOkBpOd+QWOII0XSfUQC6tUytUdt9ssTN
	XHoxVELVudU2Quv2yvC4KVT2Y3QQBEs=
X-Google-Smtp-Source: AFSGD/Xs+vJ3csNK22kJnJZB0fEtJ5ZdxhlnJpFCGd5VZrhiSWNx2i6ga0lelywSFh/9nSNtLXer7Q==
X-Received: by 2002:a17:902:6b83:: with SMTP id
	p3mr21482942plk.118.1545251003630; 
	Wed, 19 Dec 2018 12:23:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	y184sm24720451pgd.71.2018.12.19.12.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 12:23:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 12:23:14 -0800
Message-Id: <20181219202314.15888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libxcrypt: Fix nativesdk build with gcc9
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
X-List-Received-Date: Wed, 19 Dec 2018 20:23:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
index 5e5d7c077c..594203a59c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
@@ -25,5 +25,6 @@ S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
+CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.20.1


