Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 85DB77E773
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 22:39:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r16so877682wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BPfGHzAsq7FPj8veuXaVjedWRWoAOx4tJxGmoSX7QxM=;
	b=BGzzHgkAV0S/kQIvhm4GILGnqIth+ahpvn5ZGW3scNBcR6n+Gl8FHMV6pwNFf1tCmU
	s9yWFT8A77pFSe3Ax5t32oBHHFYaC/tDS5AaIqEUDFT6W9T3XAEWTybjcA2QYVJdlAwB
	Fcpd2rgw/atQ+QePNDI/Ce5T6R9lkPl+AQ5kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BPfGHzAsq7FPj8veuXaVjedWRWoAOx4tJxGmoSX7QxM=;
	b=IfkXyCShS4w/wQeyfo+iZuTezsRCeNq2Ox8vRUcvLjAxyUTGBlTDhzNXS2PjoHgJ1v
	AZ7JxLvLv7f0t2/874nJ7pmZprNaykHHl/hc92LlnPr8sHBb0ltfW+7QbwkUgp5F8xBg
	j8p6LCofOq4Wfp7WUCLiRPriyggKpKTaMl2OVMMu0keA9bFjFbBFY/RED35zopTgP/JE
	m/4wNIJzVoV9ViUDtgW4JNJoYYjRBbae96Vo9a4x+uYD1Ky0ig3i2HAOFkXKWH30Jnwo
	AvWvf5q1EDgq/+lb6gdtCpyVsrB6lHe1lDdH64A+ItjikD1W1RWCCzPwgEriY196SAup
	9Tyg==
X-Gm-Message-State: APjAAAU3XKqoaAsKTwY9NADrJBl63chX1UmY9JMSjty8Rq5BjryMnXa/
	bfVZqD/GZFFS2mh0AzvGQnn/q0vKddc=
X-Google-Smtp-Source: APXvYqwAbogzxlA/ltF9otQNiBz9ttK4x/FdysoRxdnvkkYez1TqZF3almEMBpCzPz7I1eC8IcC03A==
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr86974250wrr.70.1560983983948; 
	Wed, 19 Jun 2019 15:39:43 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j17sm17319046wrw.6.2019.06.19.15.39.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 15:39:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 23:39:42 +0100
Message-Id: <20190619223942.17692-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: Filter ptest output to remove random tmp directories
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
X-List-Received-Date: Wed, 19 Jun 2019 22:39:43 -0000
Content-Transfer-Encoding: 8bit

These tmp paths end up in the test names making it hard to compare test runs
so filter them out, they're not useful for our purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools/run-ptest | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index dbb18820a4c..eaa2e7b29d5 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -3,4 +3,4 @@
 # test plan to raise ERRORs; this is just noise.
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
 make -k -t all >/dev/null 2>&1
-exec make -k -s $makeargs check 2>/dev/null
+exec make -k -s $makeargs check 2>/dev/null | sed -e 's#/tmp/tmp\...........#/tmp/tmp.XXXXXXXXXX#g'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 9583ee3abbe..58c7864c304 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
-- 
2.20.1


