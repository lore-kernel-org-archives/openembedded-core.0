Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web10.4334.1627076740993774674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=XWbXdbcH;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1472; q=dns/txt; s=iport;
  t=1627076740; x=1628286340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yvpNfmSyA2PyVMt1YoT8iyL+NGOQnv7lkaeueyj38lk=;
  b=XWbXdbcHNkEnZ+P/DvMUMgyL1x0dCvwF0XQsEvL9aPj/aJD7I53DJftX
   ekoN0LD2Z5Br5Dla3m9I51PcWdcGmqOJXCW47X3f1MVJEjh05p9irgOo1
   zDYnsmREVwcAU3S6Icg70Ey48ji4/ZOHHVu0xEFJSLvI3SarjR3Wxoili
   0=;
X-IronPort-AV: E=Sophos;i="5.84,265,1620691200"; 
   d="scan'208";a="913023174"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 Jul 2021 21:45:39 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 16NLjd5U017105
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 23 Jul 2021 21:45:40 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 61027CC128F; Fri, 23 Jul 2021 14:45:39 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
        Samuli Piippo <samuli.piippo@qt.io>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ruslan Babayev <fib@cisco.com>
Subject: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
Date: Fri, 23 Jul 2021 14:45:25 -0700
Message-Id: <20210723214527.2225841-2-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210723214527.2225841-1-fib@cisco.com>
References: <20210723214527.2225841-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
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
Signed-off-by: Ruslan Babayev <fib@cisco.com>
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

