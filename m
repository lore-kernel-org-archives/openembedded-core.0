Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A626E78208
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:14 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c69so1638250qke.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=64VomweP6JbmWm0b91PXMylntEZLiepMhTiKCKlIDx0=;
	b=h1rtDOuDgy9vgDgrZ5yZhNNiYiKABJpHr1bt9+3VvHupLF3MGNdUukf6reihuEIHkk
	I8a7a5zWeXwMNzxpbZTc+/yWOlz4iMCrZvpKE+6tTecL4s0xyuoKm1ZWC71OPc7BXt+f
	BKROExBF67qhtCDCS7T+nOFxqEv66yM39VyOtEq4MewFlBUkx6DsckScr7DyQsIPXyU4
	hWeSqMYp5qPywXTEzSax/tfRIeZdO3JNa4KDzbWRGcm/aHFQm4ohfKKifIH3zincHdrs
	4e7J9qetS0IQIeCaAMyCc/wTZLCL2GM5Rh+T/EMrBKoH2j2mB/E1lxzAE2uyn11/Yd9Y
	a8Dg==
X-Gm-Message-State: AHPjjUijbjdYsJOMHn/t0LFgL/gyrOzeArjTkVmW946k+QBuCBT+0VnP
	RVpvV+zPyLDqIEbj
X-Google-Smtp-Source: AOwi7QCO4IrDQRu4Vh72Yq4OgdofxANwqQ8nK73XeWbg7k387jRigU5LiGxbZqEYJsH4t4iyKhGpmA==
X-Received: by 10.233.237.5 with SMTP id c5mr4307983qkg.309.1504881915355;
	Fri, 08 Sep 2017 07:45:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	p77sm1428653qkp.44.2017.09.08.07.45.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:43 -0300
Message-Id: <20170908144454.14308-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 01/12] goarch.bbclass: Stop passing True as second argument of d.getVar
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:14 -0000

The d.getVar has the second argument as True by default, avoid passing
it here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 9cd38b8c48..7960ac5f9e 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -1,15 +1,15 @@
-BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
-BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
+BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
+BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
 BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
-HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
-HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
+HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
+HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
-TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
-TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
+TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
+TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
-GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
+GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
 # define here because everybody inherits this class
 #
-- 
2.14.1


