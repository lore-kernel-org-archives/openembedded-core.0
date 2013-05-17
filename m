Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UdJ5B-0000YU-9g
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:44:31 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id CFACC9530
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 12:26:07 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 12:25:37 +0100
Message-Id: <1368789942-7476-3-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 2/7] clutter.bbclass: helper class for clutter and friends
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
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/classes/clutter.bbclass |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes/clutter.bbclass

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
new file mode 100644
index 0000000..184fb44
--- /dev/null
+++ b/meta/classes/clutter.bbclass
@@ -0,0 +1,28 @@
+
+def get_minor_dir(v):
+    import re
+    m = re.match("^([0-9]+)\.([0-9]+)", v)
+    return "%s.%s" % (m.group(1), m.group(2))
+
+def get_real_name(n):
+    import re
+    m = re.match("^([a-z]+(-[a-z]+)?)(-[0-9]+\.[0-9]+)?", n)
+    return "%s" % (m.group(1))
+
+VERMINOR = "${@get_minor_dir("${PV}")}"
+REALNAME = "${@get_real_name("${BPN}")}"
+FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALNAME}-${PV}", "${FILE_DIRNAME}/${REALNAME}-${VERMINOR}", "${FILE_DIRNAME}/${REALNAME}", "${FILE_DIRNAME}/files"], d)}"
+
+def get_fpu_setting(bb, d):
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+        return "--without-fpu"
+    return ""
+
+CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
+
+CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME};protocol=git"
+
+SRC_URI = "${CLUTTER_SRC_FTP}"
+S = "${WORKDIR}/${REALNAME}-${PV}"
+
+inherit autotools pkgconfig gtk-doc gettext
-- 
1.7.10.4



