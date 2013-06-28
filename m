Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A1B586ADC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:33 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so2926799pad.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+IqP9vWuSoeL5NSa+bilH314o6gMkadun5wjIbI3s8s=;
	b=SGsbulp+ZhhnocpZYkHYUvcimwUyN7CT+6e3kvWHs6kNFTqrX4DBD9dr0qYFCjt2HF
	v2EFKJSSCnTcUlCF2u4ub5BvgDPlF3CHQQs2J+phWSRa0NYXgOHkvO2IkTD+W3veVYOy
	scQhyJHTMiDAUi+EvZB6G7BVNGRlTJ6f4NKE8bYBRurA0t86IB3gfzVmNAvwYoS5m+eO
	O4Wu6awPQzIwSOQ5R9JIr/kkUSC7wlOHmhY/YZgS5ywrFJnapAbhu+GG2LRL+1yj+u6N
	qdtKy4aKkLKumjm5qaLJtCYU7kzLnhmBwJZhT1F/2usiyr0KIh1/kVxYfjO293FwXQ2H
	RSUA==
X-Received: by 10.66.219.38 with SMTP id pl6mr13578998pac.59.1372457075013;
	Fri, 28 Jun 2013 15:04:35 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.34 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:54 -0700
Message-Id: <61650999da6b6b68cedb9cb6014797f78e651849.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 09/24] distutils: Introduce PYTHON_ABI variable
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:33 -0000

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
1.7.9.5


