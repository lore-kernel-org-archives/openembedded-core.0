Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id C756372F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:26:10 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id w43so49313906wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b9HyvDefk/FRXXrcTfxawYMutR/8BoP08qWaIQFwq+Q=;
	b=QY7y9NPHZFw+acKpmosZPSfCE+vh7AKYa11EUB29/5m9vcM76MYPBpYl3+E2COtBhB
	cF9c+pc04h+ycsTRRgWLFfzAXb8HyBM+XCc3Jzc39wUbx4/0KlPipeUaw6UzcTSNDl1J
	X1XqHq2rJ01pFQy7YhmDPle3wGrV4vMET2ILk5rL0ttZpmQiNsCBGGRo4j//mt3kt85N
	piVL3ZfdvO3+Tmz0fvtXPGtlUY7xrjuwt5GH0v3JnRz6nFbpe/kCgKOJ2YrX5CWAygvI
	JXGszszfwlMvKxIkR56fO6HOhENYARc7SoR//kbGJBGTu/hQ9jT/0HyiH258KcuMNGmy
	JJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b9HyvDefk/FRXXrcTfxawYMutR/8BoP08qWaIQFwq+Q=;
	b=Clu1VdOv4emwDFdeix+gkpnI8oYSIju0wButXTKHreoBf0DuxE7UVMBn/zCfhQ0l5w
	ddtl9PhxdJvZ0tMQySn98pa+UAktHFoQBJ4OGeYlCvnBKoMhxSoZ6u5TaA1qo3KtI3KQ
	QDPyhy1lumtAxY8PwMwhOPyUwpLE83lQRHTjg+WkofiW43qGzzMOfWVE3xJ10jyXbO5P
	gYzbzyT/YgufA0qLDXCTsthimgGLR8P2UOgNkD+NIFrnN8dZkSFD95QAXiW3smXW7r/5
	7+r2ZgegT7C1q2MPtTDce228/ijUzJj4cNIvmPk23u98snMGAqkNx9D9semYnDcBBI7y
	uNLw==
X-Gm-Message-State: AFeK/H1Oep7CbIUlE0dsNnXOkxzyTjSarmAw9fLwY1eLZ3T0gilCkJPbJO9RqZYS29FHAy/f
X-Received: by 10.28.199.129 with SMTP id x123mr10588160wmf.7.1490628370814;
	Mon, 27 Mar 2017 08:26:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 134sm1304147wmj.6.2017.03.27.08.26.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 08:26:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 16:26:05 +0100
Message-Id: <1490628365-5428-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1490628365-5428-1-git-send-email-ross.burton@intel.com>
References: <1490628365-5428-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] boost: enable more libraries
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
X-List-Received-Date: Mon, 27 Mar 2017 15:26:11 -0000

Enable the fiber, metaparse, and type_erasure libraries.

We can't enable coroutine2 as it needs C++11 and it appears our hacks to
configure the compiler mean boost doesn't think we support that.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index f85e1d1..100fb0d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -5,17 +5,21 @@ DEPENDS = "bjam-native zlib bzip2"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+# When we don't insist that our GCC is 4.3.1 (see below) hopefully coroutine2
+# (which needs C++11) will work.
 BOOST_LIBS = "\
 	atomic \
 	chrono \
 	container \
 	date_time \
 	exception \
+	fiber \
 	filesystem \
 	graph \
 	iostreams \
 	log \
 	math \
+	metaparse \
 	program_options \
 	random \
 	regex \
@@ -24,6 +28,7 @@ BOOST_LIBS = "\
 	system \
 	timer \
 	test \
+	type_erasure \
 	thread \
 	wave \
 	"
-- 
2.8.1


