Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzS2-0006Jm-FG
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734220457"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:55:27 -0700
Message-Id: <4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 15:17:23 -0600
Date: Fri, 15 Apr 2011 23:55:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 47/58] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:50 -0000

From: Gary Thomas <gary@mlbassoc.com>

The setuptools class uses hard-wired options for 'setup.py' during
the install step.  In particular, not all versions of setup.py
support the "--single-version-externally-managed" option.  This
patch allows for a recipe to easily override these options, while
leaving the majority (important) setup options intact.

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

From 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 13 Apr 2011 15:12:57 -0600
Subject: [PATCH] setuptools: Make options for setup.py more flexible

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/setuptools.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index ced9509..cf1c224 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -2,7 +2,8 @@ inherit distutils
 
 DEPENDS += "python-setuptools-native"
 
+DISTUTILS_INSTALL_OPTS ?= "--single-version-externally-managed "
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --single-version-externally-managed \
+    ${DISTUTILS_INSTALL_OPTS} \
     --prefix=${prefix} \
     --install-data=${datadir}"
-- 
1.7.1.1



