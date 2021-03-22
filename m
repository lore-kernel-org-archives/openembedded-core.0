Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: p26Zx+jDqvPXa0fX4+BNX5tPUMWKQgCMRHfQRs62zW4K3JMcGukY2nvW5dOndS9H83T7ZgVpxt
 MYx2R7q6SbhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211637"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211637"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:59 -0700
IronPort-SDR: Jgt7bfkZzjx+lA2SNSejpKyOFbXb3Juo8FfPX1+wKUlvOuW9eHfmXTZNy9ZBE1gJMKvEFtHqlW
 je+1E36kcyMw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295213"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/25] iso-codes: fix protocol in SRC_URI
Date: Mon, 22 Mar 2021 09:41:18 +0800
Message-Id: <c0a06ffdfc5fccee247e750413711cba237fb982.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* it doesn't listen on http and the redirect sometimes doesn't work

WARNING: iso-codes-4.6.0-r0 do_fetch: Failed to fetch URL git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;, attempting MIRRORS if available

The protocol should be changed to https, like all other salsa.debian.org pulls are, so that it doesn't depend on mirrors.bbclass to resolve this.
meta/classes/mirrors.bbclass:git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \

from log.do_fetch:
DEBUG: Fetcher accessed the network with the command LANG=C git -c core.fsyncobjectfiles=0 fetch -f --progress http://salsa.debian.org/iso-codes-team/iso-codes.git refs/*:refs/*
fatal: unable to access 'http://salsa.debian.org/iso-codes-team/iso-codes.git/': Couldn't connect to server
WARNING: Failed to fetch URL git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;, attempting MIRRORS if available
...
warning: redirecting to https://salsa.debian.org/iso-codes-team/iso-codes.git/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 749eeb8cfaa8ffcfda29f3f06a77debaf6304288)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
index 9d02f5c794..0b4582b202 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
 SRCREV = "a36019e5014bff251f83d522ddcfebaecf52afd3"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.30.2

