Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1RaE09-0005O5-IY
	for openembedded-core@openembedded.org; Mon, 12 Dec 2011 23:05:38 +0100
Received: by qabg14 with SMTP id g14so4862305qab.6
	for <openembedded-core@openembedded.org>;
	Mon, 12 Dec 2011 13:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=LBhsSYRC4nNbPov2ZZZFLXlwFoXIPY1ed11MsSQGjyA=;
	b=mLHLF0dDHV/+Fd30BF1Pk3ifDcJ3MWhgZxwCPLLVPcpwc+Bytxu11WKlv/hK4NSeJA
	1y6e45XHY8CwApBBY0A96yji+L1nLsWy4ujzLMQMXrTTjM32YTWBmJckdXeSDzK3FVVa
	vT9zC8WJi46Vn24CczcIMyEYsO+vOtZz3odGI=
Received: by 10.224.106.5 with SMTP id v5mr19150750qao.74.1323727122363;
	Mon, 12 Dec 2011 13:58:42 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-172-5.ronkva.east.verizon.net. [96.240.172.5])
	by mx.google.com with ESMTPS id ff9sm36758410qab.16.2011.12.12.13.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 13:58:42 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Mon, 12 Dec 2011 16:58:36 -0500
Message-Id: <1323727116-10292-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] boost : Do not use icu when building boost.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2011 22:05:38 -0000

Without this, boost needs to build icu to create images using
boost regex. RP inidicated he would rather disable icu, than add an
extra dependency to the recipe.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-support/boost/boost.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index cc26ef9..aa577b3 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
@@ -127,6 +127,7 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 BJAM_OPTS    = '${BJAM_TOOLS} \
 		--builddir=${S}/${TARGET_SYS} \
 		--with-python-root=${PYTHON_ROOT} \
+		--without-icu \
 		${BJAM_EXTRA}'
 
 
-- 
1.7.3.4



