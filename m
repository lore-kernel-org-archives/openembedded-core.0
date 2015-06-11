Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AAFDB6E277
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:43:28 +0000 (UTC)
Received: by wgme6 with SMTP id e6so5552568wgm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 06:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qP++rQKCpyQKbiP/2W82U/Us8psX0RKIwmHcCjdne8o=;
	b=I2sfuV8y/yd4HYvYeJ1PGzcVoaWmyhC7ntYScSkk6sumUbdvtn2Mp8rjiYFeCrTzz3
	mM1HS0tcbKEI8Uy2XyX+s9pqv6HBiGPFvM7sezzbKQtWXETfdDeqQ+wwhpXbOEWXu4cY
	UGckp/uL/rL/loDrDX5cGLBFKgcMt8TEn3ajrswtwqU8uJhMeLaS1ujiV8ItMryQfvmB
	Zlb/+Qjv4FwZf81USO4pvlXJcvcAXikOAaBVjSxd8YKoyFg3aTbKU+irzxO3N/MSZrdo
	d4RmodEL+zcmTLsMBvgb/nnO00RvSX5zpYJJIjKpjoP2tophGk+ChoPI1xqP2q6r2QET
	5uQA==
X-Gm-Message-State: ALoCoQn3YSBYe7cDvIdYBksHHCg8rgasoJ1OAC3uttON/rYkTldNdiz/smEJQOVu1IOVoRKKxSks
X-Received: by 10.180.36.103 with SMTP id p7mr19514404wij.88.1434030208587;
	Thu, 11 Jun 2015 06:43:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id f8sm1733763wiy.7.2015.06.11.06.43.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jun 2015 06:43:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:38:41 +0100
Message-Id: <1434029921-16556-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cmake: extend CMAKE_MODULE_PATH instead of setting
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
X-List-Received-Date: Thu, 11 Jun 2015 13:43:29 -0000

Some (e.g. piglit) CMakeList.txt files will extend CMAKE_MODULE_PATH before
calling project(), which is when the toolchain.cmake file is parsed.  In this
situation the CMAKE_MODULE_PATH is overwritten, so handle this by appending in
toolchain.cmake instead of assigning.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 1ebb936..b0a3972 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -62,7 +62,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
 set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 
 # Use native cmake modules
-set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
+list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
-- 
2.1.4


