Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD6C7962E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:37:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x26-v6so12611072pge.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yeIp/dUgEpX7sTMvKGUmVPx4d/i4FV2nz9+j6h4UyXI=;
	b=IM7SMphNAOEYT6xaDKTC3bI0s4F4ZQZHcrgKTrJrKmcjSWd0Vk8VGP6OMNYTd+Y/j/
	mN8CaMkQSylFPZ8X2Yq7h69wApdoHLVijRpszP6m7kDfiLFBkVASBz0P2C3Nic9tIbdg
	DG8AXj7X9ApnsMZsxX6ZOo4RQBaPYH1MCP2gtja4l7qblvWEGUehwQPF5CQAf5le13LQ
	DrfBoy0NCpvcqAezoeKifG/X9PC7jtYGIK0vNAgmIcw8Wi796qL1OHM0w0Hqkj3mQXyQ
	LcT00lxZqBdGRvaqQzhPiQgA2s7bC4oDOE9LS3Oyb9cxD5TBQH0+nkjRqtPKRrUh80np
	yDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yeIp/dUgEpX7sTMvKGUmVPx4d/i4FV2nz9+j6h4UyXI=;
	b=itAlmE3DmTNkrrbx2mcg81eCD2E6UK0lTnsbYKucRohhFU413em1FVZzPg5ZRqYKN/
	kN7FRNVCojUEaA3ohP2+eZ3/HhSKrM3tayVhou2tQlUqxQ2kz18Y8QXhDWwY6Tt456u7
	KI7wD6IFRQ+7FJIcvHzFxlwLKDYjlD7sZ+L3927NrNJEd7tHXkdWMrjWK8tns7yCCH/a
	Ppe26e2wO5ypGjX1czCjEn1cNVi/VEpTGC7Vc2s5x00500dLr8MM62NBV/+ahr6aBnw9
	4ko/MOT7AMe7v5XgDNJvLtDrKhZ8BJi8iz0RyLvV0bIUA/8kHX6yhY+8N6p76wc3Xutl
	oL1Q==
X-Gm-Message-State: APzg51DBY+zSGFZLrwj3s1AvgKhZjxsmvG6UcU6biz9v0aGPHeABOf1G
	T0TWL3wqAi7YNXGwoc+osiJYeLrN
X-Google-Smtp-Source: ANB0VdYN8pVziSrdK+Qv6W+x+iu7mFam16PUBQmsVFX7QQ2G+EKCXNY2vB/i7AqQ1cRdvxWZUWt84g==
X-Received: by 2002:a63:2b4d:: with SMTP id
	r74-v6mr29654900pgr.406.1536687465811; 
	Tue, 11 Sep 2018 10:37:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	s27-v6sm40198586pfk.133.2018.09.11.10.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 10:37:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 10:37:38 -0700
Message-Id: <20180911173738.31045-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] socat: Cache shift value for CRDLY, TABDLY and CSIZE
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
X-List-Received-Date: Tue, 11 Sep 2018 17:37:45 -0000

Match it to definitions in
arch/<ARCH>/include/uapi/asm/termbits.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/socat/socat_1.7.3.2.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
index 4dcb7b4adc..1c8c903d83 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
@@ -11,7 +11,6 @@ LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
-
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://Makefile.in-fix-for-parallel-build.patch \
            file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
@@ -26,9 +25,23 @@ inherit autotools
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
-        ac_cv_header_bsd_libutil_h=no \
+                 ac_cv_header_bsd_libutil_h=no \
+                 sc_cv_termios_ispeed=no \
+                 ${TERMBITS_SHIFTS} \
 "
 
+TERMBITS_SHIFTS ?= "sc_cv_sys_crdly_shift=9 \
+                    sc_cv_sys_tabdly_shift=11 \
+                    sc_cv_sys_csize_shift=4"
+
+TERMBITS_SHIFTS_powerpc ?= "sc_cv_sys_crdly_shift=12 \
+                            sc_cv_sys_tabdly_shift=10 \
+                            sc_cv_sys_csize_shift=8"
+
+TERMBITS_SHIFTS_powerpc64 ?= "sc_cv_sys_crdly_shift=9 \
+                              sc_cv_sys_tabdly_shift=11 \
+                              sc_cv_sys_csize_shift=4"
+
 PACKAGECONFIG_class-target ??= "tcp-wrappers"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-- 
2.18.0


