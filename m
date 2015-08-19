Return-Path: <ajay.gju@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 71CF473CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:50:04 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so77241178pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eAgK4ycp0/w8sDMW4G7zuEV1goq2GI0GsKO1KeqpZv0=;
	b=raH7Wx/M39HptOAXtcrTMXmGikJo9lM7LhMvFHdIfy5sZpdwa1PURClLyP5iWpWcYO
	6uV7UNutBYoE9Rh5dk6Ft/MGWKDECoKRWNWgx3YJsyIE/oobXvN7/IJEMfAae8sWTvEi
	+W3JC/BgdtzMnMiM5CPleQ5rUSSDjfS16kYg32ZAeudg+56zbtCSE39c2REf+02lvRN9
	WiYyEvoPnzh/q93abKFbmUXaxz9aToaAOsSDjK/i/ZFA7HV8B5HMafV/jMBOk0YtURNY
	T5i7YLlI9WXijEaMrAT/XRe4wda+IXBCSTU9Yjg5j7eiWsFE1FZS6cR79qa+dznu2VXG
	xC6w==
X-Received: by 10.70.59.68 with SMTP id x4mr21648476pdq.89.1439967004778;
	Tue, 18 Aug 2015 23:50:04 -0700 (PDT)
Received: from cardinal.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	hs11sm20362605pdb.12.2015.08.18.23.50.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 23:50:04 -0700 (PDT)
From: Ajay M <ajay.gju@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 12:19:46 +0530
Message-Id: <1439966986-2394-1-git-send-email-ajay.gju@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] parted: set VERSION number same as recipe's version
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
X-List-Received-Date: Wed, 19 Aug 2015 06:50:05 -0000

There is a parameter VERSION in workdir Makefile which tells the version
number of parted. While running ptest for parted we are getting failure because
of VERSION mismatch

--snip--
root@qemux86:/usr/lib/parted/ptest# ./run-ptest
make: Entering directory '/usr/lib/parted/ptest/tests'
make[1]: Entering directory '/usr/lib/parted/ptest/tests'
help-version.sh: failed test: --version-$VERSION mismatch
FAIL: help-version.sh
--CUT--

[YOCTO #8172]

Signed-off-by: Ajay M <ajay.gju@gmail.com>
---
 meta/recipes-extended/parted/parted_3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 5d34749..ff8ae09 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -36,6 +36,7 @@ do_install_ptest() {
 	cp ${S}/build-aux/test-driver $t/build-aux/
 	cp -r ${S}/tests $t
 	cp ${WORKDIR}/Makefile $t/tests/
+	sed -i "s|^VERSION.*|VERSION = ${PV}|g" $t/tests/Makefile
 	for i in print-align print-max dup-clobber duplicate fs-resize; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done
-- 
1.9.1


