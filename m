Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64B217ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 23:39:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b137so2098549pga.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 15:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3W6QpADCYFz+InbbQuY/8Hxh96Ft1SlsAQqT3PAbP+I=;
	b=IRIcKqgqZAkfNtE1wwenbA+K+1Yj0uxCM/Qz8OPowNRGE4FTWi/R7BOMy1UjRicmW1
	0nPs+UT7cvpBn0FHFlth9M473vgOMGn2DxfgbBmRhQ5SFfc5cmLw1y7zzS3GckcxyH6U
	wPF9PTTB1ouVeIVcn7RgD07XHt/EeUFuD1IRu+F3kwVr5aIyljqwiGF2Ydp1IA2pJaOT
	55CzOvxRBmz4DulvEKg2OGlrjmvDs+ht0XOmNv0uA4Y4DEGoJwFTekhNIOaUVocHyiDz
	uKQddIX/PJuNPA/Gx71CocCXNUdFPT6kUivT2Ws0SI6EIT/iwZpnxhqvIx3weghR8cPb
	xyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3W6QpADCYFz+InbbQuY/8Hxh96Ft1SlsAQqT3PAbP+I=;
	b=C0y/tR52c578MRZ8lv4eml0NXsIlCU/f1C8vT8lz0N96Qq+xuAn+WM2Jzf9/FN0eDS
	8Jk7Ml9rOfPI9gvHT/iESgCMn3Tj11hOrnlOAbMw80+pBiMBPXnpibAE6KOE+EdyvKa5
	LvRqttkHN6UJbYBZD0THRzyzFVYkU+Wqduxbij4aipQ8bj+4OhqWD8LadjJ3Xs1tEYft
	IkQeyDTyEnFltjOwPBMaZ1w0ncQZr/S0VJwDo2yJQJ0zHv98RE8jwi8zPF4TAV8P7a32
	oyF+B4QAv73yDfouTM6IIyZZwFc4WYQtjatoCztugXadqlK7EBm+VnugU5Rh07t3NNdq
	HcWw==
X-Gm-Message-State: APjAAAWZ7kprmIv9tLGtOppcQqhsgir4Da4Xy7TA8CJT2iraYkrm7W/O
	dybhIrttTTIXH5uCb/E0I98BdQCd66g=
X-Google-Smtp-Source: APXvYqzNQCLkVGMS/y5pZIKaI1KYdik2kIbL44+VL4Px9RCJEeXxfFcXM6JhlSqb1nVg7QeANsg2Cw==
X-Received: by 2002:a63:de4a:: with SMTP id y10mr5883648pgi.367.1576712379706; 
	Wed, 18 Dec 2019 15:39:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id o19sm7774327pjr.2.2019.12.18.15.39.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 15:39:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:39:28 -0800
Message-Id: <20191218233928.696037-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] cmake: Displace VERBOSE setting
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
X-List-Received-Date: Wed, 18 Dec 2019 23:39:39 -0000
Content-Transfer-Encoding: 8bit

Setting VERBOSE always, while is fine on one hand for debugging, its
coming at an expense of creating lots and lots of logs, e.g. qtwebkit
compile logs alone with VERBOSE is 163MB, there are many other large
packages which use cmake e.g. WPE, webkitgtk etc which are in same range
with out this option on, the logs reduce to 861K and also speeds up
build a notch

If user needs to enable this logs for targetted debugging debugging that
could be added via

EXTRA_OECMAKE_BUILD += "--verbose"

in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8ccb1eefc7..8a44a0c216 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -181,9 +181,14 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+# To enable VERBOSE option to emit all kind of logs for a given recipe add following in it
+#
+# EXTRA_OECMAKE_BUILD += "--verbose"
+#
+# Then run do_compile again
 cmake_runcmake_build() {
-	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
-	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_compile()  {
-- 
2.24.1


