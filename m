Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nD-00015Q-7x
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4jZQ018134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:25 +0800
Message-ID: <82f7bfd1e6ce920a363eb1c14db8166aae17bdaa.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/17] toolchain-scripts.bbclass:add PYTHONHOME variable to environment-setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

When relocating the SDK, applications using python will search for
python modules in the default location and will fail to start.
The below errors are thrown by gdb, for example:

Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
ImportError: No module named site

In order to overcome this, add the PYTHONHOME variable to the
environment-setup script for both standalone toolchain and
adt-installer. No need to do that for meta-ide-support environment
script since this toolchain does not get relocated.

Cherry-pick commit db0a02492c2a53c1917b753bcf21c4ee7c0ecf59

[YOCTO #3839]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6d8623c..d336397 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -132,6 +133,7 @@ toolchain_create_sdk_env_script_for_installer () {
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
 }
 
 #we get the cached site config in the runtime
-- 
1.7.10.4



