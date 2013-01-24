Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyIEO-000835-EE
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:32:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8GmO3028643
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 00:16:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 24 Jan 2013 00:16:47 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 16:16:45 +0800
Message-ID: <c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359014474.git.Qi.Chen@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 05/12] volatiles.bbclass: add recipe
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
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

All recipes that need to tweak their directories need to inherit this
class and set VOLATILE_DIR, VOLATILE_LINK and VOLATILE_PKGS.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/volatiles.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes/volatiles.bbclass

diff --git a/meta/classes/volatiles.bbclass b/meta/classes/volatiles.bbclass
new file mode 100644
index 0000000..f27e598
--- /dev/null
+++ b/meta/classes/volatiles.bbclass
@@ -0,0 +1,11 @@
+# This bbclass is for read-only-rootfs support. All recipes that may tweak their
+# own directories in order to run correctly in a read-only rootfs enviroment
+# should inherit this class and set VOLATILE_DIR, VOLATILE_LINK, VOLATILE_PKGS.
+
+# For each package, the net result is a read-only specific conf file generated
+# and packaged, which has the name of readonly-${VOLATILESPN}.
+
+# All these config files are then parsed by populate-volatile.sh to create proper
+# directories and links.
+
+inherit ${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvinit','',d)}
-- 
1.7.9.5



