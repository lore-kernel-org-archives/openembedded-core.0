Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A588A776B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2E8juB9004803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:45:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:45:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:42 -0700
Message-ID: <2d29975401f385b033825cf91e62a6797169060f.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] valgrind: set ac_cv_path_PERL to /usr/bin/perl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Mar 2017 08:45:55 -0000
Content-Type: text/plain

The shebang's length is usually 128 as defined in /usr/include/linux/binfmts.h:
  #define BINPRM_BUF_SIZE 128

So there would be errors when /path/to/hosttools/perl is longer than 128.

Set ac_cv_path_PERL to /usr/bin/perl to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index a4a3e72ecd..48091420c3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -56,6 +56,8 @@ EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
 EXTRA_OEMAKE = "-w"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+
 # valgrind likes to control its own optimisation flags. It generally defaults
 # to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
 # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
-- 
2.11.0.rc2.dirty


