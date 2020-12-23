Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MSkJkR8dgfTltxpCKiG5g5Mqdw4KmaudymT6vOxKpnnBJGQKGuzSmZ+S9YQwon6und6nUQ707i
 cT0gCn/KSilA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236095"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236095"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:22 -0800
IronPort-SDR: qyfr+4z3bBhqXXeZbnrdcfeG6ytj9L7dmTU76BhiLaxgRhLuFV6gawHNlHE7Zg77zniZQ8rdYy
 XRLDmuPniZTA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027634"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/35] groff: Fix reproducibility issue
Date: Wed, 23 Dec 2020 23:18:32 +0800
Message-Id: <bcf17242fec80b39c5386d0fd7ff0a454850aec7.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

groff chooses a default papersize depending on the value from /etc/papersize
and failing that, the search domain in /etc/resolv.conf based on the comment
in configure:

"""
If the top-level domain is two letters and it's not 'us' or 'ca'
then they probably use A4 paper.
"""

Oddly, my system sets to "a4" in /etc/papersize which means it defaults to
"letter" since its != "A4".

These defaults ripple through to cause the output of man-db to change depending
on which default value was selected.

To resolve this, set a default of "A4" since that covers the larger population
of the two default values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cb511bfbd18258c782ee18f054a2590e4daaddc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index e398478349..0867452ce7 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -28,7 +28,7 @@ MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bind
 EXTRA_OECONF = "--without-x --without-doc"
 PARALLEL_MAKE = ""
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no' PAGE=A4"
 
 do_install_append() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-- 
2.29.2

