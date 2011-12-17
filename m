Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rbjry-0004AX-Bh
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 03:19:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Dec 2011 18:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87517328"
Received: from unknown (HELO envy.home) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 18:12:25 -0800
Message-ID: <4EEBFA77.8060306@linux.intel.com>
Date: Fri, 16 Dec 2011 18:12:07 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Enigmail-Version: 1.3.3
Cc: "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH RFC] python-setuptools: Do not pull in target python for native recipe
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
X-List-Received-Date: Sat, 17 Dec 2011 02:19:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

glib-2.0 DEPENDS and DEPENDS_virtclass-native on python-argparse-native,
which inherits from setuptools, which DEPENDS on python-setuptools-native.
python-setuptools RDEPENDS on python-distutils and python-compression,
however, it doesn't distinguish between target and native.

Remove these python RDEPENDS from the -native build so they don't pull
in the target python to all images where glib-2.0-native is needed to
build them.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../python/python-setuptools_0.6c11.bb             |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 5dd5f31..3320c7a 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -24,6 +24,8 @@ RDEPENDS_${PN} = "\
   python-distutils \
   python-compression \
 "
+RDEPENDS_${PN}_virtclass-native = "\
+"
 
 SRC_URI[md5sum] = "7df2a529a074f613b509fb44feefe74e"
 SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
-- 
1.7.5.4
-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


