Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: E1bxOyIGTjsY4WXi6Y1zCEDcuqmxNNFWGd1GprutPl2X34w4fnd0J0Ymt3UJIjQvymKh6EDzDP
 3uMKnxseJTzA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014098"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:08 -0700
IronPort-SDR: 5VxuwHN5gTddPvtC5jEDKty1BhMYyp+6D6OdmU4aHedGa8qw4u/CPB1K7IHLdSfWyTQv+vR8D4
 mPoT9eCa3LSA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260083"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/13] perf: Use python3targetconfig to ensure we use target libraries
Date: Tue, 22 Jun 2021 17:50:30 +0800
Message-Id: <6f8b91c68e260af3a6228fd9528ca4343c8b3b4e.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've seen some reproducibility issues on the autobuilder in perf where the
size of the python module varies slightly between systems. After some head
scratching and removing the --quiet option to the python module build,
you can see it using -Lrecipe-sysroot-native in the linking commandline
for the module. This means it is linking against the native library
on systems where that works, skipping it and using the target one
otherwise, probably with warnings in logs we've not seen.

The fix is to inherit the python3targetconfig class which ensures
that the target sysroot is used, then the byte differences between
the builds go away and things are sane(r) again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e2b6c042edd9ec76cb8281247604e4f81518780)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2dfd798ef7..99808d636b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.31.1

