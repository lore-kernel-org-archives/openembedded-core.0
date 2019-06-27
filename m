Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6287E7D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 12:28:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so5545861wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=s/Rhgsp4M0bD57MKHQoBfJ700FdE6BXkaanEakDxsVw=;
	b=lMdbvtjMUXZkKZwPd6KUv6AIfFuAqrAH7JC87+HdJRUqYoK/eBSoGth0HOTdQKgdLm
	5QdorAi7wjW+x8pFlEaFo9hMwrcnJU0BpKCTCvb8+JbDwGky0YkJ/mh0cg8qOHH/TcAc
	v8vOHtdL74cJOARBJc9UzphNFOimjRkKsRClNoa8IFoBo0ADyJLQ4+BnEq9+W8lui5Op
	+mG3mp11s680MQl3ZLHrr8iiGo2BVryu+qJrkb5R2OliXDBm1DVJQg423LZIqXHV/ogr
	TJIYN+a7cfd6rdePXyjiRZdsPSM6sckIrxROUl7oPdzm+6OOs63U2hI4aPNkKhfRJhLU
	3eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s/Rhgsp4M0bD57MKHQoBfJ700FdE6BXkaanEakDxsVw=;
	b=Mr9Y+y9Jwml+tXT8bdgD+qq+iOGOcxnNrkapx9Koop9NHA19WL+OiiUDtfkeJw8wzI
	2MbIF9dW2q2VWTjGZQ0OEBsVtmS2OujUUUZgdNZw/8LWJLPEbpdvEBs/sHVpyRIeM2Q1
	VQNpGi500d9lULVwMU3d7156nWXT2QNxcXZjmP5qVdak4ZVRe6uXHSAVsSqNgfRO8Xc7
	X1aoM85GmxhC6okhvGmYuuiyuUKuEa3xsmvyddYtLy0E+iF/v+GgyKqY5uSzoCEqfTnV
	9EQtPKFIH8CuO5q78i4npG3N/IXk39WDcHrujHYaaWCS+A7F7gKl9cjWvuwgbqPFZPjv
	o5HA==
X-Gm-Message-State: APjAAAWrZWO1khtyNNUYZLcRTeSBpMGaZELxdkLGLBNoj08IM9cnvvsz
	NBl5qEtMvL2lTFbesCDN3UouogpRbc8=
X-Google-Smtp-Source: APXvYqwXQ5kqOk4ytcKbHLoErnH5nxOQ6o6E2HucGBstxJz8wMC8THvDf3Kx8ytlqY1D3qD3Ym/tQQ==
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr2821271wmd.87.1561638538369; 
	Thu, 27 Jun 2019 05:28:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f2sm1371248wrq.48.2019.06.27.05.28.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 05:28:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 13:28:53 +0100
Message-Id: <20190627122854.28435-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] buildhistory: write the contents of the sysroot
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
X-List-Received-Date: Thu, 27 Jun 2019 12:28:58 -0000

Changes to the sysroot as just as interesting during development, so write the
file listing for the sysroot to buildhistory too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2e501df24b4..baa7c8e2799 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -60,15 +60,23 @@ SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
 # When extending build history, derive your class from buildhistory.bbclass
 # and extend this list here with the additional files created by the derived
 # class.
-BUILDHISTORY_PRESERVE = "latest latest_srcrev"
+BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+buildhistory_emit_sysroot() {
+	mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
+	buildhistory_list_files ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
+}
+
 #
 # Write out metadata about this package for comparison when writing future packages
 #
 python buildhistory_emit_pkghistory() {
+    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
+        bb.build.exec_func("buildhistory_emit_sysroot", d)
+
     if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
         return 0
 
-- 
2.11.0


