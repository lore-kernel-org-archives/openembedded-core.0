Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A89C5719F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 09:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C9J8x2008784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:19:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 02:19:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2016 02:19:05 -0700
Message-ID: <5bf0ca2a5d9706b971280a904503c4fb86c2896e.1476263868.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476263868.git.liezhi.yang@windriver.com>
References: <cover.1476263868.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package_tar: avoid chdir warnings and restore cwd after packaging
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
X-List-Received-Date: Wed, 12 Oct 2016 09:19:08 -0000
Content-Type: text/plain

Fixed:
WARNING: attr-2.4.47-r0 do_package_write_tar: Task do_package_tar changed cwd to /path/to/attr/2.4.47-r0/packages-split/attr-locale-sv

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_tar.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 854e645..e217814 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -4,6 +4,9 @@ IMAGE_PKGTYPE ?= "tar"
 
 python do_package_tar () {
     import subprocess
+
+    oldcwd = os.getcwd()
+
     workdir = d.getVar('WORKDIR', True)
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
@@ -49,6 +52,8 @@ python do_package_tar () {
         ret = subprocess.call(args + [tarfn] + dlist)
         if ret != 0:
             bb.error("Creation of tar %s failed." % tarfn)
+
+    os.chdir(oldcwd)
 }
 
 python () {
-- 
2.9.0


