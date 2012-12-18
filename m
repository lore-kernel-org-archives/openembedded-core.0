Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TkxvI-0001oE-IL
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:13:32 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id B52DA40283;
	Tue, 18 Dec 2012 14:22:20 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 14:58:39 +0100
Message-Id: <1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>
Subject: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
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
X-List-Received-Date: Tue, 18 Dec 2012 14:13:32 -0000

From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>

When installing python packages that are installed with python's easyinstall,
the installation creates easyinstall.pth files. This file must exist in the
root filesystem so that python 2.7 can locate and import the installed modules
in the host system.

Due to the import of the changeset aaaac4c545623d8818de2d3fa71d9d63b717c575
from the Classic OpenEmbedded Development Tree in changeset
733dc27ecf485a0ec5318534dfbbc9491c08df8f, the easyinstall.pth file is removed.
The original changeset claims that python 2.5 can import packages without the
easyinstall.pth file. However in my experience, python 2.7 cannot import
packages without this file. Furthermore, the easyinstall.pth file must
accumulate entries when multiple packages are installed with easyinstall.

The easyinstall class provides a simple postinst script that adds the content
of the variable EASYINSTALL_${PN} to the easyinstall.pth file and initializes
the file if necessary.
---
 meta/classes/easyinstall.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes/easyinstall.bbclass

diff --git a/meta/classes/easyinstall.bbclass b/meta/classes/easyinstall.bbclass
new file mode 100644
index 0000000..8ae975d
--- /dev/null
+++ b/meta/classes/easyinstall.bbclass
@@ -0,0 +1,11 @@
+
+pkg_postinst_${PN} () {
+       if test ! -e ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth; then
+            cat > ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth << EOF
+import sys; sys.__plen = len(sys.path)
+import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)
+EOF
+        fi
+        sed -i '$ i ${EASYINSTALL_${PN}}' ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+}
+
-- 
1.7.9.5



