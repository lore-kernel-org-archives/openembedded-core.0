Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rqimtNNc9h+AG0QeKFUr2qylWRr3prTdZz/5bkCW5Hrsu+004wlIZRxlQU/Wi7EDgC1K6ieVKL
 r1ohxmVsriyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671508"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:37 -0700
IronPort-SDR: PjE+lV95Tz4k98nyffGqBEjOb1XPZ3DMUamYb/4OtzE8OjoVEVeY4tCXB7COr/6jtL6reS0n6Q
 muHyOfwiIHGw==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684427"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 4/8] sanity: Add error check for '%' in build path
Date: Wed, 21 Apr 2021 14:06:16 +0800
Message-Id: <bcdadcc77ec4bf5aa46e16f6952ad05a2e7aeb84.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It has been reported that '%' characters in build paths break with python
exceptions, probably due to confusion with python string escaping. Whilst it
is probably fixable, showing the user a human readable error is better given
it doesn't work.

[YOCTO #14282]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31a3cf78452270131a657be45e76569515cff7ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 01c5434f0d..c450b37bf0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -887,6 +887,8 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
     if oeroot.find('@') != -1:
         status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
+    if oeroot.find('%') != -1:
+        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
     if oeroot.find(' ') != -1:
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
-- 
2.30.2

