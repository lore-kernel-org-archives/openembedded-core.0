Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 08FA765C7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:06 +0000 (UTC)
Received: by wgjc11 with SMTP id c11so34083298wgj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1bhn1lHW57CM2h6z0h0fFWqge91WNJbgYp8BmySee0I=;
	b=YcK1Yk00VTEHWW4agZDihnNCx30s4pYxOWWiCU/8VBV3cg5N+O3pOSOh9l9ZNDNKHu
	We3uurU1JvGPrr13Z/mTUX7ZjnHsj8qYITbXNM8kfrkq90gG87lAGZYuzkfU5yak/APw
	oWH85cGsgzjadq0tn5Fc0HX5LoBDNjM8mVc0TUYWrxNoPmTPzSzbLxaHlM0whJjgUweq
	BQWkfEgY/co/9+SfhlIhwblX6V1qv0tvSpe63SXz/WKyS+VYJabAO8irHcCh2b8wycxh
	9Q0Z/xgCwbZPXC/Q0gWRHdsvlOpFb5XIP5wGwQQNc9aHVJhrOBqLFMHPFSu1XGCzQ3Ek
	/TNg==
X-Gm-Message-State: ALoCoQkERldWpNh3MosqortgkWmeWhgyNOUDaW8T0g90+ThQlz9uW2zwhRNovh3ulvPQusnNXcSS
X-Received: by 10.194.61.171 with SMTP id q11mr40420591wjr.110.1431967807182; 
	Mon, 18 May 2015 09:50:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:29 +0100
Message-Id: <1431967531-25163-11-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 11/13] libxt: upgrade to 1.1.5
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
X-List-Received-Date: Mon, 18 May 2015 16:50:06 -0000

Remove the custom compile logic as upstream now detects cross-compilation and
uses CC_FOR_BUILD.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxt_1.1.4.bb => libxt_1.1.5.bb}           | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.4.bb => libxt_1.1.5.bb} (66%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
index 9c1aaa4..c1ed0bb 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
@@ -29,16 +29,5 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-xkb"
 
-do_compile() {
-	(
-		unset CC LD CXX CCLD CFLAGS
-		oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
-	)
-	if [ "$?" != "0" ]; then
-		exit 1
-	fi
-	oe_runmake
-}
-
-SRC_URI[md5sum] = "03149823ae57bb02d0cec90d5b97d56c"
-SRC_URI[sha256sum] = "843a97a988f5654872682a4120486d987d853a71651515472f55519ffae2dd57"
+SRC_URI[md5sum] = "8f5b5576fbabba29a05f3ca2226f74d3"
+SRC_URI[sha256sum] = "46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a"
-- 
2.1.4


