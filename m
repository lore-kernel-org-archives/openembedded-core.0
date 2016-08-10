Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5250771F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 08:13:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A8DOAT005347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 01:13:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 10 Aug 2016 01:13:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@windriver.com>
Date: Wed, 10 Aug 2016 16:12:56 +0800
Message-ID: <1470816776-17343-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
References: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3] glibc: apply complocaledir while localedir changed
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
X-List-Received-Date: Wed, 10 Aug 2016 08:13:26 -0000
Content-Type: text/plain

Since localedir changed
-----------------------
commit bbca0646c7b55aa28dbf796ab9135bbc63a92a8d
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Mon Aug 8 13:55:42 2016 +0800

    bitbake.conf: change localedir
-----------------------

Refer nativesdk, We should apply complocaledir=${localedir} for target.

Build image with IMAGE_LINGUAS="en-us en-gb"

Boot target and display all locales:
...
root@localhost:~# locale -a
C
POSIX
en_GB
en_US
...

(LOCAL REV: NOT UPSTREAM) -- sent to oe-core on 20160810

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glibc/glibc_2.24.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 88bcbef2..c1b5190 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -134,6 +134,10 @@ do_compile_prepend_class-nativesdk() {
     echo "complocaledir=/usr/lib/locale" >> ${S}/configparms
 }
 
+do_compile_prepend_class-target() {
+    echo "complocaledir=${localedir}" >> ${S}/configparms
+}
+
 require glibc-package.inc
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


