Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web12.598.1626990673706486986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=KxRQeCMI;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1425; q=dns/txt; s=iport;
  t=1626990673; x=1628200273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YnIwMF1uQP+hVAu9y6149NT4jcQ9LZtpxDzMSsCJNYA=;
  b=KxRQeCMIA62Nfta5OyZPwYI1cRpafMfm5UKZzOBgJkvHt2KvLxjoVsqA
   1Yw3wxf0yk8wd79EAaTfRmntPIOFMonVZyd3vQ6I6FsCDtjThg2JcfcgD
   56Y/lfopGDNbeqKEJB5MB+awk4dkuXucV+tYTbVDLHmjKlE0LIJbmFfO8
   U=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3At7UauaGwBfMyA7eKpLqE78eALOsnbusQ8z?=
 =?us-ascii?q?AXPo5KJiC9Ffbo8PxG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNG?=
 =?us-ascii?q?KNhILrFvAG0WKI+VPd8kPFmtK1rZ0QEJSXzLbLfCFHZQGQ2njfL+od?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AsGQDm5vlg/5pdJa1agmICgil3Vzo?=
 =?us-ascii?q?xlGUBAQUBgT4DA4pXEIZOiimBfAsBAQENAQE1DAQBAYRXAoJ3AiU0CQ4CBAE?=
 =?us-ascii?q?BARIBAQUBAQECAQYEexOFaA1DARABhXEGMgEYAS0QHgIxIQsrGYJxAYJVAwk?=
 =?us-ascii?q?lAQ+ofYIsgQGDHwEtAYN8DYJIgToBiHuEcCccfYEQglCCKIIggWuBBoUuBIM?=
 =?us-ascii?q?cgQ4sIoE+IzqUZYtBnDNcgzCKNo4nhUcaK4UqoTmiPIM0kQmEHQIEBgUCFoF?=
 =?us-ascii?q?gO4FZMxoIGxWDJAlHGQ6RdxmGUYQtITICNgIGCwEBAwmEOYRZgkcBAQ?=
X-IronPort-AV: E=Sophos;i="5.84,262,1620691200"; 
   d="scan'208";a="887924879"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Jul 2021 21:51:12 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 16MLpBE3010371
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 22 Jul 2021 21:51:12 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id B74D7CC128E; Thu, 22 Jul 2021 14:51:11 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
        Samuli Piippo <samuli.piippo@qt.io>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2] cmake-native: enabled zstd support
Date: Thu, 22 Jul 2021 14:50:46 -0700
Message-Id: <20210722215047.1735683-2-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210722215047.1735683-1-fib@cisco.com>
References: <20210722215047.1735683-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
Content-Transfer-Encoding: 8bit

From: Samuli Piippo <samuli.piippo@gmail.com>

CMake depends on having all formats supported and build issues can
arise when zstd is not available:
https://gitlab.kitware.com/cmake/cmake/-/issues/21552

Quote from a CMake dev:
"As far as CMake's design is concerned, we have no optional formats.
All should be supported. That's why we bundle sufficiently new versions
of libarchive and libzstd. If a distro builds with an older libarchive
that doesn't have zstd support, then that is not a proper packaging of CMake."

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/cmake/cmake-native_3.16.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
index b2952ee5f5..6034b654da 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
+DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native zstd-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
-- 
2.26.2.Cisco

