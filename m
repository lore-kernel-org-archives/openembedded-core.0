Return-Path: <sumit.garg@linaro.org>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 893997FD78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:15:57 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e11so1111854pjt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9untPYccHN4KagiaKypkNs3ACpB8e1+61Gms/QrGXZo=;
	b=zoJpHz/vQvzOZR1f4+B9yTHHOVuhn7qa22w9PFYEVepB52YeooWLL3fTSBWwAzWMfi
	MAImPyaDkGPVji4iugx9rzp8xKdC3huwKSc/WFnf16lPWtHkH7lY3ZIz1UH6YmTtvJJD
	mynJn+fmh9KjfA5xRvEKhPuJ35ITky+ycEwDDU7TcISbtTzi6TqtcPQ5wL6xA1AoIGhd
	qGpEkE7TVjHk3JowRJwA7X5qsWh+9mfK4GMn2IQfPPA7L+h2TT/fSRMuWBu68WFUaMGV
	wBjAodlfqmegJ1Z8Zfw0dIZGimrSgO01qPt0o93DLbNhVS3pa+XVwExu2QAv5ffx5gzz
	eAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9untPYccHN4KagiaKypkNs3ACpB8e1+61Gms/QrGXZo=;
	b=ugNWK9VRy22OyGwJAQtZJIeAMfbdqRiguwQh4xr3Co3xCg658cMVnKr7t2qOWLJ3DK
	tHf8CyfhDDyieGZxV33PCfbPmEpLfxm1+rdFSSN94jGckVuN9Af4+2ANNxv/m6Gvq1b6
	sxl20mYHOzbK1ic1m2Q0u35ex5HuZNeFTf8Acqvsic2sG9Q6aJF/AwSag+KZ9zfoWD21
	P4TgqV3XAkPVoS33kA+ZBRJiiSzWOSO4nFFCcrkxJPnem3q3Rj5/qHO2kPp+StJJIRUJ
	U6CDgxcZB0HhcQ4Xy8bJ812AIg8M7HH4SYPI+BN2l9rHkbCP8n3Wczs8JxVRgzCSPUlc
	bokw==
X-Gm-Message-State: APjAAAVz/85w1qcgNDqGkL2I/jZNz6jV06sTWDKJgdB8y5FNMpWHaaUp
	WtErXPWZu4LeLyxMNQZ6+85K1vn8A8Y=
X-Google-Smtp-Source: APXvYqwnPJ7k88TL89qpZc4wqNaCxSIvRzt9YdEBTIbPJc3jBA9CxwNgqBarW/eZYfRiiIsJgdSFLg==
X-Received: by 2002:a17:902:9a96:: with SMTP id
	w22mr4167496plp.180.1579594558135; 
	Tue, 21 Jan 2020 00:15:58 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	y5sm32323507pfn.185.2020.01.21.00.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:15:57 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 13:45:37 +0530
Message-Id: <1579594537-22864-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Tue, 21 Jan 2020 08:15:57 -0000

Some native tools dependency issues were seen while building with
external GCC tool-set rather than source GCC tool-set. While building
with source tool-set these dependencies were implicitly met which is not
the case with external tool-set. So explicitly state these native tools
dependencies.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- inherit gettext rather than direct dependency on gettext-native.
- Remove autotools dependency on xz-native.

 meta/recipes-extended/man-db/man-db_2.9.0.bb       | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
index 5b017e8..3cbb0de 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
 SRC_URI[md5sum] = "897576a19ecbef376a916485608cd790"
 SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6cd3e261"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
 RDEPENDS_${PN} += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 101b3df..39e4a8d 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -12,6 +12,6 @@ INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
-inherit autotools pkgconfig features_check
+inherit autotools pkgconfig features_check gettext
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
-- 
2.7.4


