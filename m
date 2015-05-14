Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 602757408F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 11:41:12 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so38730178wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h2uPD/LLr/7uY2XBJIPvcfm+ieZAmzAbjWlolRi0SM8=;
	b=eaanfG7/ol1kEOTj5C/VK3aN2x3Oc6ZrLEeSKB6C4tDJ6CrOQkmnV3pkP93IekrEpY
	SO9AwLujJW4suAg8tIgX1GMtRxje5SUzf0DhKFwOJuEIYwzTZvIuM5HEEMjKdN/W3ddk
	Yh49fEFlbnqrZFLBs4HMJVZ2Iga2O//iK4FlCn1rEGUcdE1LSUzFwR3U9NHRbq92SHHK
	gHBZc/Wd1FroftKALPXKlNzZS+ZVAqNegY6u1lMydBuyJ3tguNwRRSLPpW5kpeve5VRR
	VBK0HORhkbvS8zZoXnnj6vFBE6p/8LctgNNCNFnMdDgctif48v6M2nXWJV9IJbfNspGs
	cGxQ==
X-Received: by 10.194.78.49 with SMTP id y17mr7312012wjw.131.1431603673123;
	Thu, 14 May 2015 04:41:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm12870911wif.3.2015.05.14.04.41.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 May 2015 04:41:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 13:41:26 +0200
Message-Id: <1431603686-28783-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] boost: properly fix do_boostconfig re-execution
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
X-List-Received-Date: Thu, 14 May 2015 11:41:12 -0000

* it was partially fixed in:
  commit 291e20a51544c640d07767d1dc32d762f4370f41
  Author: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
  Date:   Fri Apr 13 11:42:46 2012 +0000
  Subject: boost: fix re-execution of task

  but with disadvantage that when CXX or *FLAGS variables were changed
  it was continuing to use old values
* just remove the line before appending it with current values to fix
  that

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7628e37..d95d281 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -60,7 +60,7 @@ RRECOMMENDS_${PN}_class-native = ""
 ALLOW_EMPTY_${PN} = "1"
 
 # to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
-TARGET_CC_ARCH += " ${LDFLAGS}" 
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 # Oh yippee, a new build system, it's sooo cooool I could eat my own
 # foot.  inlining=on lets the compiler choose, I think.  At least this
@@ -143,11 +143,9 @@ do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
 
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
-	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/example/user-config.jam 
-	then
-		echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
-	fi	
-
+	sed -i "/^using gcc : 4.3.1/d" ${S}/tools/build/example/user-config.jam
+	sed -i "/^using python : ${PYTHON_BASEVERSION}"/d ${S}/tools/build/example/user-config.jam
+	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
 	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
-- 
2.4.0


