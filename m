Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E23E26EAB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:51 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id x10so2516389pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5qOX0KuW1q1qlRHe2nzfsvX4IBNqsmp/9vSW6XZ13nI=;
	b=u8MSs3L05922uczOUiVqtp46Y8ZdDQ9N+WaCe7O76qzBsvkMKiLb55BYRZ90Dfhc+4
	Q0ew6yTYIbT19/mZfgw5uAYqCFmOAB0vQ/AHiimK8O4XWwZhWi+Ap53vgY+/BOQYL9ux
	hy0LPkeCGCGzOIjWHqZFkPwc5OTaOkTbVoCWArls2Su5+ZNp9jLFKA2zDsiBt4wVo0GF
	OQZYNKCcaLvfoY8nSDz88B+12nNnlNKXWnEgWCwCx75cjyBYkg9/0wNwzgnrc3CxnV5M
	MK8eq6xxgvsGIeoaOf5sGAjkGnBL6aHC0DbjKg6EXPPNETQbE3NlDSNeRjfJDgtBik+6
	tMTA==
X-Received: by 10.66.50.105 with SMTP id b9mr12138331pao.9.1391055113273;
	Wed, 29 Jan 2014 20:11:53 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:29 -0800
Message-Id: <2e0686ac0e30f8bbcca884158eeb1c71d6b5371c.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 07/15] distutils: Introduce PYTHON_ABI variable
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:52 -0000

In python3 this has to be taken care of, it defines a variable to
denote ABI currently its at 'm' and it uses this to construct
the directory names for installing the python headers and library
names in sysroot. e.g. it will be something like ../python3.3m/...

We need this information when we are using distutils to cross build
python extentions and want to know the locations of python headers
and libraries install locations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3-base.bbclass        |    3 +++
 meta/classes/distutils3-native-base.bbclass |    1 +
 meta/classes/python-dir.bbclass             |    1 +
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
1.7.10.4


