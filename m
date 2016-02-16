Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C84E273163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:27:22 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so160488830wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0XTKcTXtIGN2LXcKSPmTbOI7AZ3p9KfW+n7jmr738fA=;
	b=k4EK1yqx323ByYcBW3KZTVDQbrgaPRQXK0QPGUw4ndZE//MyVo+xwqoJGm/llju+15
	2T+dZMEjEQNMeG/1cBQIDjT1043uPwWfV81Q+1vO8wuNaQPc10P8Vo890lOp9XtOMAL+
	AFQUV/ucPC9KXj5NN9aZSMGWjuwTf3OW8yCbIvQrrPm3sdvtxJIXLrZDq01CD5oF7hNE
	O/+LdGxTYN4BlDZJgaTGMWrYifoLjASvPUYbvmq/cGSI2OWb1F6aKUr6FIAhHgwMQFkk
	Tvw59bwLGRPQkgBRc3WNL9jgaYHaIOpx7eJILwd2gzFvH2SGzqnvZ2QvoEmS4jcMoz3d
	CelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0XTKcTXtIGN2LXcKSPmTbOI7AZ3p9KfW+n7jmr738fA=;
	b=dKul8h6awaCHs93vyecHGgOih+S2qqob1IRBpde0mEm+uoEtP/b0JzPLtp9V46vLNY
	Wr9DAGMZFD/2rLVkmzybn2KCFTe1G4sYkbCr23mm82XUae3dTyl5Vd+xdEGr/U2ypj28
	DjNV0ZVQNr8Yqpk9ok4CRyY54drSuRfyxBHbpEC/a2/Q0dES7+gYlniuC7ahwiENjS2v
	8jOwuWDnmJcyf0jTK15A8D+LZQVfGFEi1ThJlmWY1g7Rv3xEfRG+cOckJf0E32Bl6ouq
	Ii5rAFj4PEqgTqLSHd3gYvUVGCbRXkcLNGIdo1zvrOn3zUX5LpJ++zMp7EQp7YN5ZIj8
	rlJA==
X-Gm-Message-State: AG10YORsUybQ1oMuxf7kqloGwUETbxT833oA9riI7bJ2Ns1660RndPUdK6w0DjL0dPmSgry6
X-Received: by 10.194.201.166 with SMTP id kb6mr23576150wjc.125.1455640042795; 
	Tue, 16 Feb 2016 08:27:22 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m63sm21350260wmc.3.2016.02.16.08.27.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 08:27:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 16:27:19 +0000
Message-Id: <1455640040-8949-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] cmake: don't inherit autotools
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
X-List-Received-Date: Tue, 16 Feb 2016 16:27:23 -0000

autotools was inherited for some functions some time ago, but now all it's using
it for explicitly is autotools_do_install(), which is basically just "make
install".  Invoke that directly and we can remove the inherit autotools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 70e8677..22cd61e 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -7,9 +7,6 @@ B = "${WORKDIR}/build"
 # We need to unset CCACHE otherwise cmake gets too confused
 CCACHE = ""
 
-# We want the staging and installing functions from autotools
-inherit autotools
-
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
@@ -132,7 +129,7 @@ cmake_do_compile()  {
 
 cmake_do_install() {
 	cd ${B}
-	autotools_do_install
+	oe_runmake 'DESTDIR=${D}' install
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.7.0


