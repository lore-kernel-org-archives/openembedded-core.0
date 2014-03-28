Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2308A6BC9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 15:14:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,751,1389740400"; d="scan'208";a="43486951"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Mar 2014 16:14:46 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 28 Mar 2014 16:14:45 +0100
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 28 Mar 2014 16:14:45 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:13:35 +0100
Message-ID: <1396023215-2583-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] libcap 2.22: fix, disable gperf detection
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
X-List-Received-Date: Fri, 28 Mar 2014 15:14:53 -0000
Content-Type: text/plain

gperf straight invoke is not suitable for cross environment (gperf-native should be used instead).
Formal patch has been submited to the upstream.
As libcap 2.24 is currently available, I prefer doing this quick fix.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-support/libcap/libcap.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index ccc0fde..fef700a 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -24,6 +24,9 @@ do_configure() {
 	# on what should be replaced with ?=
 	sed -e 's,:=,?=,g' -i Make.Rules
 	sed -e 's,^BUILD_CFLAGS ?= $(.*CFLAGS),BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
+
+	# disable gperf detection
+	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
 EXTRA_OEMAKE = " \
-- 
1.8.5.4


