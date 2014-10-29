Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB1B60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9TB9UBM008823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 04:09:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 29 Oct 2014 04:09:29 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 19:06:10 +0800
Message-ID: <1414580771-32464-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/2] beecrpty: add option --with-dev-dsp
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
X-List-Received-Date: Wed, 29 Oct 2014 11:09:35 -0000
Content-Type: text/plain

Add this configure option for developer to control if the
/dev/dsp should be used on target. Instead of judging it
based on the very device file of build server.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../beecrypt/beecrypt/add-option-dev-dsp.patch     | 34 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch

diff --git a/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
new file mode 100644
index 0000000..b3298ce
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
@@ -0,0 +1,34 @@
+Add config option --with-dev-dsp.
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+--- a/configure.ac
++++ b/configure.ac
+@@ -106,6 +106,16 @@ AC_ARG_WITH(python,[  --with-python[[=AR
+   fi
+   ])
+ 
++AC_ARG_WITH(dev-dsp,[  --with-dev-dsp          enables dev/dsp for entropy producing. auto for auto-detecting dev/dep on host. [[default=no]]],[
++  if test "$withval" = yes; then
++    AC_DEFINE([HAVE_DEV_DSP], 1)
++  else
++    if test "$withval" = auto;  then
++      ac_detect_dev_dsp=yes
++    fi
++  fi
++  ],[ac_detect_dev_dsp=no])
++
+ # Check for expert mode
+ if test "$ac_enable_expert_mode" = yes; then
+   BEE_EXPERT_MODE
+@@ -464,7 +474,7 @@ linux*)
+       ac_cv_have_dev_dsp=no
+     fi
+     ])
+-  if test "$ac_cv_have_dev_dsp" = yes; then
++  if test "$ac_cv_have_dev_dsp" = yes && test "$ac_detect_dev_dsp" = yes; then
+     AC_DEFINE([HAVE_DEV_DSP], 1)
+   fi
+   ;;
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 209b92e..1e626f1 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
            file://fix-for-gcc-4.7.patch \
            file://run-ptest \
            file://beecrypt-enable-ptest-support.patch \
+           file://add-option-dev-dsp.patch \
           "
 
 SRC_URI[md5sum] = "8441c014170823f2dff97e33df55af1e"
-- 
1.9.1


