Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id E7AAE6C738
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 01:42:12 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so2054888pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2013 17:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zTSr1xSM1UDBX/0DvbgDb84IG1Q3edIxB93ZyPqMdr4=;
	b=lhde9Hj764x82JjHHbzuzI87sz6tqvDCVXbk/OG1LPsfAlvrunJkjDn5g7jZ8HvWsq
	hhLANpSJdP8QwA1iQlbVAXokd2GmPenQah6d5pM1O+XAXJtu48aWC7kFApSi7udyWxoK
	u+Te08C/UQqeDVW0uI5ySASb9UpTkrM/Z+LxqIpqpTvNuFhq6KUGdqat8GOqbty2vDWT
	JSMToVH5HVsxoLEIdsDLeNOvwmQWd943vpSpSP2luCbFX3YawHkTwfroW8enMgtiW8Eb
	jEYrQ0QrH/9ooShqw0+8GyJoRCy8DULthLriBcrwGpLNoOVDdcmpfhS/f5m/kkmGzdSh
	9c5g==
X-Received: by 10.66.232.40 with SMTP id tl8mr7588963pac.137.1386380532304;
	Fri, 06 Dec 2013 17:42:12 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id hz10sm606046pbc.36.2013.12.06.17.42.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 17:42:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 17:42:26 -0800
Message-Id: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Sat, 07 Dec 2013 01:42:13 -0000

??= does not react at all with
BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"

even though we have

PACKAGECONFIG ??= "" it does not honor it and always add python to
BOOST_LIBS but the dependency is not added so it fails to build
complaining for missing python headers which is a understood outcome

When converted to ?= it works as expected and only add --with-python
in bjam when python is specified in PACKAGECONFIG otherwise not.

Is it a bitbake bug ? in anycase ?= should be enough of loose rope
to let user/distro configure the packageconfig policy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index f13051c..f0f9eb8 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -19,7 +19,7 @@ BOOST_LIBS = "\
 	"
 
 # optional boost-python library
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ?= ""
 PACKAGECONFIG[python] = ",,python"
 BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 inherit python-dir
-- 
1.7.10.4


