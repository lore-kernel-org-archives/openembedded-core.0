Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: m0cGRS3MiB4LghkQLKzkUKc36vXeNfF1aEiZN3URY3JcH2YSD1otz+EuXqfTLHeCg8nsGguVIc
 EOr08S5YirWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236129"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:33 -0800
IronPort-SDR: cctvRgbIrrDqVpYkGmZG9ipYb113Q+sPcdIGGVUwRhxjUxJ/9NsTFKiCBk8ohXyr71vz7PPFda
 MwQpf2vc7SMg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027714"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 29/35] go.bbclass: Use external linker for native packages
Date: Wed, 23 Dec 2020 23:18:39 +0800
Message-Id: <2df1d63ab246fd07ccb4273c3203690ceeaecffb.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

go 1.15 has reworked internal linker, which has resulted in regressions
in OE where native binaries generated using internal linker in some
cases result in corruption during populate_sysroot e.g. glide-native
crashing when used after relocation.

This improved reliability of native binaries working especially when
they use cgo or pie build modes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit daf4856ea3ccafc05c808a34d4c6af2bfafea12f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a9e31b50ea..5b26378a4e 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -40,6 +40,7 @@ GO_RPATH_LINK_class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pk
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
+GO_LINKMODE_class-native = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
-- 
2.29.2

