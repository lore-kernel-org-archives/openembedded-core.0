Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1F76C6BBA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:05 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so5053824pab.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4aSzguMyPpvQfrcSGEKXxeBNlensvaxCeSpO5JqlYMo=;
	b=CCNHCxQx2gYZ1m/cov39fLiV34wvG2FSGqCKwZK+0Gpd6NwKLCw/AIumzXiFTRuq9D
	nrxj6ulzgtdha1ufq2pr6R9JKslD7qOFJsJmdqzKFtQvasiV/y18PCSKLhbt9Aq19pwj
	GGFQtvnJ3SMV804iUbTKklpE4Ib/aizE3aN4Cd0OQkp0A6n+9VeL2iZoInhH2vKcl/ma
	MmnIyMgKCxSA3forOfuMpvbVF3kpf2Uim6wMOxt1tmgua0mRI+qOCLEjS+Esw46l0ZOu
	rCkiaMI2CFoSjyZClFNGHcqSYMBbVrnoaO1p7qi6okfBp6DfHAPoybc+rb3j/A0pILyt
	jXVA==
X-Received: by 10.66.146.66 with SMTP id ta2mr22235297pab.11.1377623766147;
	Tue, 27 Aug 2013 10:16:06 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:06 -0700
Message-Id: <9f3d252f77e1eed63c47d3d9120a152235e7321e.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 07/20] distutils: Introduce PYTHON_ABI variable
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:05 -0000

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
1.8.3.4


