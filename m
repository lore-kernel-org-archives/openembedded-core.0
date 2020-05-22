Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7667.1590123521026554131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 21:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eycNo/GSgBAn4tHhpbkmZ/wGI6Gnn5jwI5+5xG/TRinukuKwnQ3fcgPMhpy//S599Z57ksikbf
 lMeoe0WBOSGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 21:58:40 -0700
IronPort-SDR: ID3kHhMrdo1RfzPiCHazB9wYrhIVYsAoJgMeZ812eg/1pW1bJwNv+i50wooWWUCXP744E4Md6z
 cqkRjQre76yw==
X-IronPort-AV: E=Sophos;i="5.73,420,1583222400"; 
   d="scan'208";a="440733466"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.135.70])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 21:58:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH] strace: fix failing ptests
Date: Fri, 22 May 2020 12:58:32 +0800
Message-Id: <20200522045832.2186073-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

1. They need to be run under regular user.
2. Some tests genuinely need more time than 30 seconds
3. The Makefile patch erroneously introduced a test-breaking change.

(From OE-Core rev: 3d6bf58c7080c1cacf3ed1f270ff5acf4858c790)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5e90281ac211e912ec6bfd6873e56152ec8bd4e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch | 2 +-
 meta/recipes-devtools/strace/strace/run-ptest            | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 08fa5c53b8..36e93a2dcf 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -44,6 +44,6 @@ index 825c989..4623c48 100644
 +	done
 +	for file in $(EXTRA_DIST); do \
 +		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
-+		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
++		#sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 2fed984e90..4660207220 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,3 +1,6 @@
 #!/bin/sh
-export TIMEOUT_DURATION=30
-make -B -C tests -k test-suite.log
+export TIMEOUT_DURATION=120
+chown nobody tests
+chown nobody tests/*
+chown nobody ../ptest
+su nobody -c "make -B -C tests -k test-suite.log"
-- 
2.25.4

