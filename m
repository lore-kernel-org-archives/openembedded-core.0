Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79C766FD07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:30:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5I1U0nt021096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 18:30:00 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 18:30:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 21:29:51 -0400
Message-ID: <1403054991-19506-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: update to 2.4.1-stable latest
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
X-List-Received-Date: Wed, 18 Jun 2014 01:30:04 -0000
Content-Type: text/plain

The 3.15, and 3.14.5+ kernels introduced a change to trace_block_rq_complete,
which triggers the following build error:

    probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:151:6:
    error: conflicting types for 'trace_block_rq_complete'
    |  void trace_##_name(_proto);
    |       ^
    |
    probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:117:2:
    note: in expansion of macro 'DEFINE_EVENT_MAP'
    |   DEFINE_EVENT_MAP(template, name, name, PARAMS(proto), PARAMS(args))
    |   ^
    |
    probes/../instrumentation/events/lttng-module/../../../probes/../instrumentation/events/lttng-module/block.h:235:1:
    note: in expansion of macro 'DEFINE_EVENT'
    |  DEFINE_EVENT(block_rq_with_error, block_rq_complete,

The lttng 2.4.x-stable branch contains the fix (and several other small fixes), so
we bump the SRCREV to import the change.

Build tested against 3.14 and 3.10.

[YOCTO #6459]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
index 4ef74dd1cb33..5e05ffc69853 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "afdc6b155161f209fcfadc5288dc017ceab56353"
+SRCREV = "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
 PV = "2.4.1"
 
 # lttng currently blacklists arm with gcc-4.8
-- 
1.8.1.2


