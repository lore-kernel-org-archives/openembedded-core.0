Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.30685.1598566360804263915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 15:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07RMCbnY001766
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 17:12:39 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v7 2/3] kernel.bbclass: Move away from calling package_get_auto_pr
Date: Thu, 27 Aug 2020 17:12:36 -0500
Message-Id: <20200827221237.143692-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827221237.143692-1-mark.hatle@kernel.crashing.org>
References: <20200827221237.143692-1-mark.hatle@kernel.crashing.org>

...instead we call read_subpackage_metadata.

Calling package_get_auto_pr *should* result in the same PKGV AUTOINC
replacement.  However, it will also end up changing PKGR differently
then do_package as the BB_TASKHASH used will be for the wrong task.

Generally this won't cause any real-world issue, but it could cause
problems.

Moving to read_subpackage_metadata ensures that the values used
in do_package will be read in and used for kernel deployment.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7869184b94..14c22da306 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -748,7 +748,10 @@ kernel_do_deploy() {
 		done
 	fi
 }
-do_deploy[prefuncs] += "package_get_auto_pr"
+
+# We deploy to filenames that include PKGV and PKGR, read the saved data to
+# ensure we get the right values for both
+do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-- 
2.17.1

