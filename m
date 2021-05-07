Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: NiwSjobgOcRmW+ntjY2Q/Vm/AiGw0L6OTud2kk2lN2/CTEuZ3IHYmAcYgJpmY57D3rl1hA59K2
 8U3XZm8V2axw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794779"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:17 -0700
IronPort-SDR: k2eSjTWifTbo+psl2+zU+vEHGikqi0QBeZGukevZwYCzWJIbXUhKYj8MxOwVeMQYSA9WlKl6Qy
 7lZRAi7Y2VJw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331645"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/31] ptest-runner: libgcc must be installed for pthread_cancel to work
Date: Fri,  7 May 2021 15:02:32 +0800
Message-Id: <0eeb4dd1e9dbbbe205ff9821a398c44d5769f798.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

This only affects glibc systems and have been
found on runqemu core-image-minimal with gstreamer ptest-runner

STOP: ptest-runner
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1cb679e6a4528a2cef16f65342d5e65adb14cb16)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
index 57a3ae005b..6bd10d2fec 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
@@ -26,3 +26,5 @@ do_compile () {
 do_install () {
 	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
 }
+
+RDEPENDS_${PN}_append_libc-glibc = " libgcc"
-- 
2.30.2

