Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2CA06011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 05:50:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A5oJBj011334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Aug 2016 22:50:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 9 Aug 2016 22:50:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@gmail.com>
Date: Wed, 10 Aug 2016 13:49:51 +0800
Message-ID: <1470808191-29496-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
References: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] glibc: apply complocaledir while localedir changed
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
X-List-Received-Date: Wed, 10 Aug 2016 05:50:20 -0000
Content-Type: text/plain

Since localedir changed, we should apply complocaledir=/usr/lib/locale

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
 meta/recipes-core/glibc/glibc_2.24.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 88bcbef2..219370c 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -128,9 +128,7 @@ do_compile () {
 
 }
 
-# Use the host locale archive when built for nativesdk so that we don't need to
-# ship a complete (100MB) locale set.
-do_compile_prepend_class-nativesdk() {
+do_compile_prepend() {
     echo "complocaledir=/usr/lib/locale" >> ${S}/configparms
 }
 
-- 
2.8.1


