Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0l0fjUMc6OcAvM2UkKiEeObvD7PQnojZGcyyqe5TLxpG4oSRnPR6sfprCtxXqbjnWtZzhbfoiq
 2Q1ZNdD8wrbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794809"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794809"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:23 -0700
IronPort-SDR: 3uSy1LzrMUHukVHCbYGRHLT8UC9B5nDeNj8e6eFdJpyorBn4Jmj5eWGYO9i/o1tDkLDi8sQVVX
 UD6gcrWfr7Fg==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331699"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/31] oe-buildenv-internal: add BitBake's library to PYTHONPATH
Date: Fri,  7 May 2021 15:02:36 +0800
Message-Id: <c65fe0a000c1170d346ffcddf7c65fad53a55b36.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

There are many Python scripts in oe-core that want to use Tinfoil, and
right now they have to know where they are to work out where BitBake is
likely to be.

This is suboptimal as BitBake could be somewhere else, so this
approach doesn't scale to other layers at all.

Solve this by adding BITBAKEDIR/lib to PYTHONPATH in oe-buildenv-internal,
so that Python has BitBake on its search path once the build system is
configured.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a48178f6d00e7f97a09f42d5a164204e9dcffa9f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-buildenv-internal | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index ba0a9b44d6..e0d920f2fc 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -88,6 +88,10 @@ if [ ! -d "$BITBAKEDIR" ]; then
     return 1
 fi
 
+# Add BitBake's library to PYTHONPATH
+PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
+export PYTHONPATH
+
 # Make sure our paths are at the beginning of $PATH
 for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
     # Remove any existences of $newpath from $PATH
-- 
2.30.2

