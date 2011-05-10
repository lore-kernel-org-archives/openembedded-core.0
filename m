Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVE-0001SF-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876573"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:15 -0700
Message-Id: <dff45e1625c76ad7b8ed2e523147432cc2897057.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 22:10:22 -0700
Date: Mon, 09 May 2011 22:26:15 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 04/30] libgalago_0.5.2.bb: Fix compile for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 05:29:00 -0000

From: Khem Raj <raj.khem@gmail.com>

uclibc targets may not have gettext but this package
still needs config.rpath during regenerating configury
so we provide it when libc is uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index 6d9f76b..3a47620 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -18,3 +18,7 @@ PR = "r2"
 inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--disable-tests --disable-check"
+
+do_configure_prepend_libc-uclibc() {
+        touch ${S}/config.rpath
+}
-- 
1.7.1.1



