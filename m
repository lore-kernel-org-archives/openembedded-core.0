Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3C43771FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:31:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A7VmZh012129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 00:31:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 10 Aug 2016 00:31:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@windriver.com>
Date: Wed, 10 Aug 2016 15:31:20 +0800
Message-ID: <1470814280-4269-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
References: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] glibc: apply complocaledir while localedir changed
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
X-List-Received-Date: Wed, 10 Aug 2016 07:31:50 -0000
Content-Type: text/plain

Since localedir changed, we should apply complocaledir=${localedir}

Build image with IMAGE_LINGUAS="en-us en-gb"

Boot target and display all locales:
...
root@localhost:~# locale -a
C
POSIX
en_GB
en_US
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glibc/glibc_2.24.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 88bcbef2..2f0c4be 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -128,10 +128,8 @@ do_compile () {
 
 }
 
-# Use the host locale archive when built for nativesdk so that we don't need to
-# ship a complete (100MB) locale set.
-do_compile_prepend_class-nativesdk() {
-    echo "complocaledir=/usr/lib/locale" >> ${S}/configparms
+do_compile_prepend() {
+    echo "complocaledir=${localedir}" >> ${S}/configparms
 }
 
 require glibc-package.inc
-- 
2.8.1


