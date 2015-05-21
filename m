Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3827865C64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 09:23:39 +0000 (UTC)
Received: by wibt6 with SMTP id t6so6813763wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 02:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eFoaKL04vU/cWVUq6yQ50l9BNE3gGJKGVx2tApVFa18=;
	b=ffa9pUooNtzLn2QgItXU+/7eHlJy0A4NzXkIOayBcly/Cm69kl19Sc8PcZZkM2Hgx7
	xJ6rWrscteeGtW2egpt5KLrMlob10O73BL4/XEFA7LJn/3oiSS0wubwLIZFbLgFcKyv6
	9fGQnWXmicscoCOADTSFFECGVVVeP4pT0Jfp8JcjThu5tUKX++e9zzbdKPsgPPluPYXE
	yjyd5arg/5Sb2MvDGmmVTPKlYIZRc7Wi9MVhxemeBHbR/jNDRoVi8hq4YZ4r4YAeoqKA
	TSNofmoR8p4SZ2bZzAGUm8sgNe6Ti+A6NU43dR45Vujxycsf4vlqjqbqcAA8Pvy81gv6
	0FSg==
X-Gm-Message-State: ALoCoQkUv3tZNwp9d+Vn+xdYaod47jhnd2EIVwiRMX3K0Nv1jUNtR8li/7kh7O0HqA9CQVapIx+q
X-Received: by 10.180.8.98 with SMTP id q2mr46557304wia.53.1432200220362;
	Thu, 21 May 2015 02:23:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ej5sm18591948wjd.22.2015.05.21.02.23.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 May 2015 02:23:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 10:19:22 +0100
Message-Id: <1432199962-12337-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libxdmcp: make libbsd usage deterministic
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
X-List-Received-Date: Thu, 21 May 2015 09:23:42 -0000

libxdmcp can optionally use arc4random_buf() from libbsd instead of it's own
random key generation code. As this is an optional dependency add a
PACKAGECONFIG for it and default to not using libbsd.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
index 7471b9a..f4e30d9 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
@@ -24,3 +24,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "18aa5c1279b01f9d18e3299969665b2e"
 SRC_URI[sha256sum] = "81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.1.4


