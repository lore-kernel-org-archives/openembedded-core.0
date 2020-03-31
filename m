Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4791.1585685005811098451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: 1WtLS2czw0la/Qnt+0f6OJhF255KoBaEjko8viic+0iTTkiJf8xXZLOCRE8FiDt4+FQ/1ofh6V
 /ldyhjRqe9VQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:26 -0700
IronPort-SDR: cLsKU99SL2AETNeKBIRiJWRBVWGxIYmCx3W1p5I1zqS0h7J1hXz4wdxtWsxiFpiomq+I8mKs9Z
 /z7PXr+PhGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267398037"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:26 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 3/6] sanity.bbclass: recommend using install-buildtools
Date: Tue, 31 Mar 2020 13:03:03 -0700
Message-Id: <20200331200306.36942-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
References: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For old tar version (< 1.28), recommend using
scripts/install-buildtools

Drop check for tar version 1.24. Dubious extra value.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/sanity.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca5cdad17..fef05fb012 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -532,10 +532,8 @@ def check_tar_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
-    if LooseVersion(version) < LooseVersion("1.24"):
-        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+).\n"
     if LooseVersion(version) < LooseVersion("1.28"):
-        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release).\n"
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.24.0

