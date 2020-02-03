Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98F1060B8B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 12:32:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so16804234wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0I7XGVA3Mqf8hvL+HuQrTrE9u3ouLB+1I0OukNXlwdk=;
	b=vaeQMdODln5MbNGjQDKpwPevixSgVnbkT0gNuCvv2Pf9hnxpT2i8EgARQp33uNyW3Y
	55DVQl2Gn9z5RE1x9C8RJQR0YoXBc34durMJZbpgDBgjJBVxhFtlKzw9HqZBxRXDj67S
	oeAgNQ1hXeiaitd9I7lCBuhpVeHlPuWSdn2LIOJmxsHePNyZVDlG4YlpP9sgifGw755O
	zsLaC2emGIlje+etjO4i8A0c36OnJdQx/NIde9UgN03/takf1aJJLXFCqBOzyb3JnSov
	XqWjiweOIWh1dMUzdNKfeppCZvFeJOvRRmwyzGpFkJ4FBdTxYF+UAkLb6FK5FON2FyLZ
	y1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0I7XGVA3Mqf8hvL+HuQrTrE9u3ouLB+1I0OukNXlwdk=;
	b=L0qiLBIJEmM7b6JnsTda5VAgw4VcQS6BNmKGHlb+ZXJwSsfTJVd/6Wl+sq5oNq63En
	pyIXmsG0HOctdheY27F22PFs+cvGnqbk/rgPUhs8CMfgZDt3sI5g2A0TYcggJH8tf+0l
	SUhd0XqOwGSiT0SlyPCaq09gunjX8FsbST0oiyCiy0IZFdL7r3uMkRogLK6/izXpuzAp
	nT5hNJrVwT7sTcDUzEvTVKAXO6JY0gM9XN4HqQpPQASCafejeOymykXfWXIeagpwEL3d
	F2Fi3sPU8KHIKR1Ai1cgKA7uZvXQwADKlp/d76JnlB8JgQi0nEA5Gv42sDHqzsD7LbSn
	6vow==
X-Gm-Message-State: APjAAAUqirmKELH6F9vT4NlMwBE576g791HV4lG7yu2mAw42eILsyyFJ
	DL1EnhxOKTreob7H8B1J4JY1ux77Yqw=
X-Google-Smtp-Source: APXvYqxLIqq6yIYb6EpZ4ioI5Y/IHeE6/r+FyrEUTxfNmu5Vx0TV3DShfQCI4Z+DgF5/C6uVzeBC0w==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr29939434wme.6.1580733150946; 
	Mon, 03 Feb 2020 04:32:30 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s139sm24298433wme.35.2020.02.03.04.32.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 04:32:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 12:32:25 +0000
Message-Id: <20200203123225.17038-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] piglit: don't stage the test suite
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
X-List-Received-Date: Mon, 03 Feb 2020 12:32:31 -0000
Content-Transfer-Encoding: 8bit

The Piglit test suite is approximately 2GB and because it's installed into
$libdir is added to the sysroot archive.  Nothing links against Piglit so
there's no reason for this, so remove $libdir from Piglit's sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d0d83316977..58d10d6b9b1 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -44,6 +44,7 @@ do_configure_prepend() {
    fi
 }
 
+# Forcibly strip because Piglit is *huge*
 OECMAKE_TARGET_INSTALL = "install/strip"
 
 RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
@@ -55,5 +56,9 @@ RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
 
+# As nothing builds against Piglit we don't need to have anything in the
+# sysroot, especially when this is ~2GB of test suite
+SYSROOT_DIRS_remove = "${libdir}"
+
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
-- 
2.20.1


