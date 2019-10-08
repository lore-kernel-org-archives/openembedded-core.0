Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2B960557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:53 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t3so4592233pga.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=lX3cVy4MKfd6B4/XQas9yvt/GlHscClCrDm/ajflT3JCOBji2zk4yo1o0+uhHp/qI3
	54oLZybPusCW8FeeAiNRycqSg7p6RuQP6pTj4RQrplSdsD67513dgazNuVdoXoRljlT4
	QoV6TbkUqVwKges6XfmIcVyV5O+Boi2Yx0wKKmFpbVC6AhvOYdql181YPNHIErKyHgLT
	uVGtQvub1r2C3nHO4UHqReoTIXo81vIRyVL+fPveKezPKH60CBKltKnR4ZrU/+cxf+KM
	vOa1lAbiilOu9iQbrQVQY+PzESfAT7C2r83IPFDglfONFxUoXHBxEJnzZT0JoK8R5omt
	xL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=qYj9w81eN4wTY8qRVQOa20fpCRAup/BGQVlvnZ7aP89dAbs70OK7v0+nMBUC46qVTQ
	z8DO7cFazCo8pH2avDsAs4TQb4BA/CYSaElYBLo13J8jj3QCgAng4MEix1bA00CSvMBX
	+2OtAEpky9rrM64DBuQn/pxf3onZYb6cnSA6JNDdL4GBTf76J94Wz2yHUZPz9MNX9Yhk
	yRbirqFPcvfg/YSEaLkxpW5t7MsJffEFE2z28L0vgx9Vff2iaHvsvsuBTjcc+gqFWJA+
	zOzPPWHqolCNLT7GQ2IRUBZbPcWZUnjAaU7DhR1A2gjrWtgiNvplXF89YBb2Tv+dXZGD
	C2kg==
X-Gm-Message-State: APjAAAWj5zKkf+H3LbWadD8G5C61vM9w/DP8jTl/w6FijnLtC5ADyn/T
	kSw9WCDLwkFYyLZf4NHMFsEG1mQVf68=
X-Google-Smtp-Source: APXvYqzBR/ieYK5/4iBA4FyGVTYnuJzAZGLVWYPh7vyQkNRf+ME5rqWM2ev+77QeorsJWZbFV+u11A==
X-Received: by 2002:a62:1b85:: with SMTP id b127mr4881921pfb.56.1570548415020; 
	Tue, 08 Oct 2019 08:26:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:37 -0700
Message-Id: <fad633eb5c464d4e2a984b9259625bcd150ee357.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 05/12] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:54 -0000

From: Adrian Bunk <bunk@stusta.de>

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68..e6a3899 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -20,8 +20,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
-
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.7.4


