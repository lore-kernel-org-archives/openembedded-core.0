Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WdaLN9d9yIveTPsdo3Kx1uth6naq+SvHIOa/tVyspzmZr8fc4XN14XUsZQ8Ee/Tao1x04nu1vi
 Xhzb0TkEsg1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211572"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211572"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:43 -0700
IronPort-SDR: IwkzCvdz4y97cm635lTOxcmcNS8wUjzPfrmideCGa07M43FJJTMarF6/mbLqFjp8vhWp8G6yML
 B4sRnYkqJmnw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295124"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/25] libinput: less parallism to increase chances the test suite works
Date: Mon, 22 Mar 2021 09:41:05 +0800
Message-Id: <bd33e62fba70e8461d0efbee04841db9a0c1ff9d.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Discussion with the libinput maintainer has confirmed that many of the
libinput test cases need to run on a relatively unloaded system,
because input handling is by definition time-sensitive and any
event mismatches are considered a failure to avoid broken code hiding.

We can't expect libinput to run on an otherside unloaded machine
because the autobuilder ptests execute in a qemu at the same time
as builds can be happening.  We can however reduce the amount of
parallellism happening in the libinput test suite to give it a better
chance of succeeding.

This may not be enough, but it's worth a go.

[ YOCTO #14164 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5702f7c489ed45b7f4a69c78aa8215e2c98e21c4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/wayland/libinput/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest b/meta/recipes-graphics/wayland/libinput/run-ptest
index 5a84c568b9..d11e6eb25b 100644
--- a/meta/recipes-graphics/wayland/libinput/run-ptest
+++ b/meta/recipes-graphics/wayland/libinput/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-/usr/libexec/libinput/libinput-test-suite
+/usr/libexec/libinput/libinput-test-suite -j1
 if [ $? -eq 0 ]; then
   echo 'PASS: libinput-test-suite'
 else
-- 
2.30.2

