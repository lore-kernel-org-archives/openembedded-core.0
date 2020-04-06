Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 66ft7qPvjEf+Kj9dFBao2NjcU4x49Wrfws1eK0Dysf/7CTF9eCN/RK7UmugDnHPF7bSjdQ8/2e
 PGNkZGhx3w9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:13 -0700
IronPort-SDR: jiIwug472/cSW2hy5voh6PsO3UxQ2cfYl1BvWANH1Y6pdJDUZJG40Zxkilofhw0jjhE3noLrxy
 avEhSCcYlgKg==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391220"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 12/13] perf: Fix externalsrc support
Date: Mon,  6 Apr 2020 23:11:40 +0800
Message-Id: <c30d6b98b739f1ee9c2ebb937e739453899b513d.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eab605bab94552046ec4adae5debe026cc03bb4c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8201c0cb60..90f05c0e62 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -51,7 +51,7 @@ export PYTHON_SITEPACKAGES_DIR
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 # needed for building the tools/perf Perl binding
 include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
-- 
2.25.1

