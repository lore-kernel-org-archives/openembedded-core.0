Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tLhRgMBjE6NtMI37GdXViZOrE98Q7nrE6zjlum3noet9EHrGji6nK2mG5uqd6QZgecUro+bb6d
 U92imS2gL4fg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014087"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014087"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:06 -0700
IronPort-SDR: HHHPGyDhQtumOV1HGabEDDJJvI1uChlIfB3wzDRkcQDIRO18LgvZiM4J0AH1A22jfwcxOyum91
 SQQkBKl47GFA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260069"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/13] valgrind: remove buggy ptest from arm64
Date: Tue, 22 Jun 2021 17:50:28 +0800
Message-Id: <731d0e9c6921a3ac82e5172e5c7a6088e80243ef.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

This commit removes the stack_changes ptest from aarch64 devices.
This test is buggy and fails almost 100% of the time in qemuarm64.
In general, many of the valgrind tests are more likely to fail on
qemuarm64 vs native x86_64.

This test previously worked on gatesgarth and dunfell, but has
been failing since hardknott. It might be due to a recent change
in the cross-compiler or glibc.
The test runs fine when running natively on arm on a Raspberry Pi.

Until we can find the root cause for the failures, this shorter
term solution should clear up some of the noise from the autobuilder
from a known failure.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 82d6411b80a46d8ec0258ca75c3c80dc6128d44e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 93bfd45a4e..ccbb59cf7e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -233,3 +233,4 @@ memcheck/tests/wrapmalloc
 memcheck/tests/wrapmallocstatic
 memcheck/tests/writev1
 memcheck/tests/xml1
+memcheck/tests/linux/stack_changes
-- 
2.31.1

