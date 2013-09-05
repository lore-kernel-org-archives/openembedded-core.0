Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB3361624
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:43 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id q10so1238703pdj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=d7Ljm1/yb2W9FC4Rc73PaBF8DUNAC//USAwKdmnS8YI=;
	b=jNFH6C+r+QwgM6M/pBL1bhG3pU3XmDfm63mEQEjX35c5hUAWGLbLTQvYNe60TmfQMQ
	T80q+JkzIF2fSpWNUi3QbOCCT08wNHgqbfR/0QNxH/AXKhmMFpJIWkhaPq+1K5FAP57u
	yAhmQ8qzYLBHsYbc/Wy6AR3+aYgJ/cvFpJHmqsBu+2nNtNVnblYJG9MIKoNH4hs7vudI
	8frYSM0P9VGEpLdKsBsO5MYeZjIM5oVA7sgTipBBHTzC8u/E6Ob/VsBn/cnkqsmZXL7q
	d6aC55veQ0Q34JI3NjaysqyP9udt4UuGEtcFWEvenziCnpuYKKUERHJcyJdJUabjbcGe
	QEAg==
X-Received: by 10.66.192.8 with SMTP id hc8mr6958945pac.66.1378354665180;
	Wed, 04 Sep 2013 21:17:45 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:12 -0700
Message-Id: <db98172e9c0a36efde727da1d85a5d7a16da93e7.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 07/13] distutils: Introduce PYTHON_ABI variable
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:43 -0000

In python3 this has to be taken care of, it defines a variable to
denote ABI currently its at 'm' and it uses this to construct
the directory names for installing the python headers and library
names in sysroot. e.g. it will be something like ../python3.3m/...

We need this information when we are using distutils to cross build
python extentions and want to know the locations of python headers
and libraries install locations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3-base.bbclass        | 3 +++
 meta/classes/distutils3-native-base.bbclass | 1 +
 meta/classes/python-dir.bbclass             | 1 +
 3 files changed, 5 insertions(+)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index 82ab6a3..d4d25dc 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,5 +1,8 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
+PYTHON_BASEVERSION = "3.3"
+PYTHON_ABI = "m"
+
 inherit distutils-common-base python3native
 
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/distutils3-native-base.bbclass
index b4a333f..ed3fe54 100644
--- a/meta/classes/distutils3-native-base.bbclass
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -1,3 +1,4 @@
 PYTHON_BASEVERSION = "3.3"
+PYTHON_ABI = "m"
 
 inherit distutils-native-base
diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index b4b5ab0..ebfa4b3 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,4 +1,5 @@
 PYTHON_BASEVERSION ?= "2.7"
+PYTHON_ABI ?= ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python${@'' if '${PYTHON_BASEVERSION}'.startswith('2') else '3'}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
1.8.4


