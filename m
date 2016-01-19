Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 740856FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 09:36:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J9a5P9013525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 01:36:06 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 01:36:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 01:36:04 -0800
Message-ID: <bb110858045d626bc56fb43920ae9acda71d038c.1453196137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453196137.git.liezhi.yang@windriver.com>
References: <cover.1453196137.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: ignore ipkg/dpkg's CONTROL dir
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
X-List-Received-Date: Tue, 19 Jan 2016 09:36:05 -0000
Content-Type: text/plain

Fixed race issue when:
WARN_QA_append = " buildpaths"
PACKAGE_CLASSES = "package_ipk"
$ bitbake e2fsprogs

[snip]
 *** 0595:    with open(path) as f:
     0596:        file_content = f.read()
     0597:        if tmpdir in file_content:
     0598:            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
     0599:
Exception: IOError: [Errno 2] No such file or directory: '/path/to/tmp/work/core2-64-poky-linux/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-ptest/CONTROL/control'

The similar to package_deb.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ba9c651..c16e6ad 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -584,6 +584,10 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if os.path.islink(path):
         return
 
+    # Ignore ipk and deb's CONTROL dir
+    if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
+        return
+
     tmpdir = d.getVar('TMPDIR', True)
     with open(path) as f:
         file_content = f.read()
-- 
1.7.9.5


