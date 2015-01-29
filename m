Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6B2660017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:22:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0T2MG2D014280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 18:22:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 28 Jan 2015 18:22:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jan 2015 10:22:14 +0800
Message-ID: <b35561e993f50d52ae592feddd907881b940f312.1422498020.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422498020.git.Qi.Chen@windriver.com>
References: <cover.1422498020.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: fix rootfs failure with multilib enabled
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
X-List-Received-Date: Thu, 29 Jan 2015 02:22:19 -0000
Content-Type: text/plain

With the current code, if we use debian package backend and enable
multilib support, the do_rootfs process would always fail with error
messages like below.

    E: Unable to locate package packagegroup-core-boot

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 69100f1..6f49c69 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1723,9 +1723,12 @@ class DpkgPM(PackageManager):
             with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
                 for line in apt_conf_sample.read().split("\n"):
                     match_arch = re.match("  Architecture \".*\";$", line)
+                    architectures = ""
                     if match_arch:
                         for base_arch in base_arch_list:
-                            apt_conf.write("  Architecture \"%s\";\n" % base_arch)
+                            architectures += "\"%s\";" % base_arch
+                        apt_conf.write("  Architectures {%s};\n" % architectures);
+                        apt_conf.write("  Architecture \"%s\";\n" % base_archs)
                     else:
                         line = re.sub("#ROOTFS#", self.target_rootfs, line)
                         line = re.sub("#APTCONF#", self.apt_conf_dir, line)
-- 
1.9.1


