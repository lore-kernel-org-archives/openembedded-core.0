Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 688397E077
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 21:09:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m3so4719296wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X4vL4sgXvgcOajbIAF/gYMLgnT/Mtd76H/mqHCouBus=;
	b=M2IeuKTESZpF4tyuHjN0Y2TJeIrSEZuCgwQ53P1JNb6dXUAzrQZ3LPBxG3Ne9R+Cnt
	Mh6yAjGe2U9uVdARu05tFvqEK72AwEt03Acj9tpTFNwIg0DhfcNWMyWFlRuTJzTs0lV7
	Mg3PeYCJH5we+CGt60eHjqNlhtokTsq+H2mlM/3knHDWKlQ7WndmoV+iDDWaw414c4MN
	qjdPDIBetc0z+R1yl2Q3HjCvGozmtJIJHszTASlbjOpFbm4UDqLqh4phM2Qwj73J0opz
	ENA0sdHZaXiQxFSnTZ+/5UYkIV1HzCeGVwqqpn/BL7fPi96bLkFPub4w5e+p8eCJOdL+
	aVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X4vL4sgXvgcOajbIAF/gYMLgnT/Mtd76H/mqHCouBus=;
	b=H1BcUf6bi2bViLcQScbvqYIqprFBDfl8iBU301H8t4dT8CN+tu4XJ1Lx8AXW+kijrw
	/0vvDUCFhOHnhb+bhTjAxs9TJCX0FAXWOLOpKdWpasod3fluBbjSI3a1xZHwcQ7NPoSo
	B7+xGtNVbsQVt0Pn85hbJvQM82Pw3kAKxHv0zp3AWDxj4xXU61OgFGhfePdhK/O2J7lF
	OnNgv0Hf5jy4VPAJO35K3sI5sWrJ1stVR7jgIfGaZA6fCeGVlv5V8gMq0lsTe6QOJuri
	z/AayiEsG9TdiuxbTGqE00LbStkjfzttBSqX0YtEFB5AEZry8TrulV7RzaczuZdORZTz
	r2Jg==
X-Gm-Message-State: APjAAAW+6yJRWiyiiyMPO1puviVwLTQG/zKA6fkG9EDw2hVkoSt7DsLz
	ZqzJ11uJ+PevRfjQI6qEKdJ+lydV6N8=
X-Google-Smtp-Source: APXvYqyKAzFnWBpsxULj6ezIHCjL0cZc31MCvkUhA5gWKaTmYYW5uZot+yEph/5yyRokxLLsvgJmjw==
X-Received: by 2002:adf:e691:: with SMTP id r17mr13546658wrm.50.1558040999582; 
	Thu, 16 May 2019 14:09:59 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	k184sm11413541wmk.0.2019.05.16.14.09.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 14:09:58 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 22:09:56 +0100
Message-Id: <20190516210956.19906-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Thu, 16 May 2019 21:10:00 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The pkg_resources Python module is useful by itself, for example for
automatic loading of resources shipped in a Python package.
Add separate packages for it, so that users can depend on them
individually and avoid pulling in the entire setuptools, which
include scripts to download other packages, which might not be
desired on minimal images.

Other distributions like Debian and Ubuntu already split setuptools
and pkg-resources in this way.

The setuptools packages now depend on the new pkg-resources packages,
to avoid regressions for other packages that depend on them
already.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 357aa07086..ad00cbe0ef 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-html \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-pkg-resources \
   ${PYTHON_PN}-pkgutil \
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-shell \
@@ -37,3 +38,6 @@ do_install_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "${PYTHON_PN}-pkg-resources "
+FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
-- 
2.20.1


