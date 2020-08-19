Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.91119.1597853819488542308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 09:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07JGGuJ6031929
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 11:16:57 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package.bbclass: Sort shlib2 output for hash equivalency
Date: Wed, 19 Aug 2020 11:16:56 -0500
Message-Id: <20200819161656.71399-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

The output was unsorted, so different versions of python, different input
ordering could have have changed the files, and thus changed the hashes
making the system think the output was different, even when unmodified.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8dc1bb468..7a36262eb6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1936,7 +1936,7 @@ python package_do_shlibs() {
         shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
         if len(sonames):
             with open(shlibs_file, 'w') as fd:
-                for s in sonames:
+                for s in sorted(sonames):
                     if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
                         (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
                         if old_pkg != pkg:
-- 
2.17.1

