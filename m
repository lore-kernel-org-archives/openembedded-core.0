Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rbm8j-00016m-OG
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 05:44:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Dec 2011 20:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="86689439"
Received: from unknown (HELO envy.home) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 16 Dec 2011 20:37:52 -0800
Message-ID: <4EEC1C8E.1070205@linux.intel.com>
Date: Fri, 16 Dec 2011 20:37:34 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>
X-Enigmail-Version: 1.3.3
Subject: [PATCH V2] python-setuptools: Do not pull in target python for native recipe
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
X-List-Received-Date: Sat, 17 Dec 2011 04:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

glib-2.0 DEPENDS and DEPENDS_virtclass-native on python-argparse-native,
which inherits from setuptools, which DEPENDS on python-setuptools-native.

python-setuptools uses RDEPENDS_${PN} for python-distutils and
python-compression. By using ${PN} instead of python-setuptools, when
the -native version is built, RDEPENDS_python-setuptools-native gets
set to include the target versions python-setuptools and python-compression,
pulling the entire target python dependency chain into the build.

Follow recipes like automake by setting RDEPENDS with the PN written out
explicitly, RDEPENDS_python-setuptools, to avoid dragging in the target
python dependency chain.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Saul Wold <sgw@linux.intel.com>
---
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 5dd5f31..0b8a219 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -20,7 +20,7 @@ do_install_prepend() {
     install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS_python-setuptools = "\
   python-distutils \
   python-compression \
 "
-- 
1.7.5.4
-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


