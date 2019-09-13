Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E71B7E831
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:27:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q18so1750617wmq.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bm+JMn3Z6vUD9+92mZIOHpTSYRVYU6gdiNkHPC06qzU=;
	b=oC4GQ+98vPUzK7KiqgCOp/tmYE3kPWcS7N9vLwaSulNMchxrfxkX/AdTmDAiRru80s
	aGMscr9J+Q3k5e2kwO73aiC+1kbsmjb0+jzG7TOorFC/lSX2jTRV/iv9YK1/MKyYDeVU
	RyDREsoax744Q2W74i/rPGhAZbf5qek/VluN2+576djp47uiaG54cd2ID98WQuHQqW9X
	mVi3UAK5BjbDfiGPtrUPg9kst7GQWl/IHe3Z3kwANO1ZrFOocK2ezJb3an6wCCT4cp56
	0DVwadjzZ8VJMqv5NY0lePrhcVzDhZIJoaBBtuQlPCul4aqQR5ItqKkOQlBOxhw0LArn
	pqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bm+JMn3Z6vUD9+92mZIOHpTSYRVYU6gdiNkHPC06qzU=;
	b=Rd+pYr/lPN9usaKDNP20Twsd24RfcZqeMOUs3SXTMiZyfMPbWuGJHsjhOWlETzpxuK
	1CqMxSO7mdF5jmXY5SO2g3ek1gJSBJBK+ArvoJASiLwaXnCZcIWh0yQMHN6Rj3Mei0pf
	Ao8arTRbAsWhPFTPfDfkLe16OydX6aEYU0EcfVyf4M9S9hZtrdgvEMWlnRVte5Sf6ggs
	+qgWMDxgD2sg2Quv2UIjvD7dsYm+k5Fwg9KrPGfCxgJrF3KUnUAlgUMXkIZb/YpzoZGR
	SpdydLHyRIxcmHJ/wsK+eTyYcZoGWSUShd+l9Mfvnj9PGgvF+7fym4m3/eIO0pctbdqp
	fqXQ==
X-Gm-Message-State: APjAAAVnA1LowuprNtKyd0ijK+nQVgUCBAUxmakXkEXeSUzr48r7k6IC
	Vt4xySjGpKLVQSDElH9oO3Lw6A54B8E=
X-Google-Smtp-Source: APXvYqxnFY4f5T5jf8DX66SD4Lu/u4vlKUsHam6WiuJ4YcoefZu7O3cVpxxSl7dFDc/puRNmYUdz+g==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr2316450wmh.172.1568363275304; 
	Fri, 13 Sep 2019 01:27:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x5sm38334545wrg.69.2019.09.13.01.27.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 Sep 2019 01:27:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 08:28:02 +0000
Message-Id: <20190913082802.1481-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] perf: fix build on kernels which don't have ${S}/tools/include/linux/bits.h
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
X-List-Received-Date: Fri, 13 Sep 2019 08:27:55 -0000

* tools/include/linux/bits.h was added in v4.20-rc1 with this commit:
  commit ba4aa02b417f08a0bee5e7b8ed70cac788a7c854
  Author: Arnaldo Carvalho de Melo <acme@redhat.com>
  Date:   Tue Sep 25 10:55:59 2018 -0300

    tools include: Adopt linux/bits.h

* also if you're building for such older kernel you will probably see
  do_compile failing with:
  | config/Makefile:448: Missing perl devel files. Disabling perl scripting support, please install perl-ExtUtils-Embed/libperl-dev
  | config/Makefile:495: Python 3 is not yet supported; please set
  | config/Makefile:496: PYTHON and/or PYTHON_CONFIG appropriately.

  easiest work around is to disable scripting PACKAGECONFIG, because
  since oe-core commit:

  commit 584af667e0000129bcb5c9e8108485f2f6590eaf
  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Aug 28 22:14:41 2019 -0400

    perf: change dependencies on python to python3

    The upstream kernel can now handle python3 for the perf scripts, coupled
    with the impending EOL of python2, we switch the dependencies in perf
    (scripting) to python3.

  it now uses python3, but the support for that was added in kernel
  v4.17-rc1 with:

  commit 66dfdff03d196e51322c6a85c0d8db8bb2bdd655
  Author: Jaroslav Skarvada <jskarvad@redhat.com>
  Date:   Fri Jan 19 21:56:41 2018 +0100

    perf tools: Add Python 3 support

    Added Python 3 support while keeping Python 2.7 compatibility.

  if you really need scripting support than either backport the kernel
  patch to your kernel or undo the perf recipe changes.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 7f00df0f8e..8201c0cb60 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -244,8 +244,8 @@ do_configure_prepend () {
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
 
-    # bits.h can have the same issuen as unistd.h, so we make the tools variant take precedence
-    install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
+    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
+    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
 }
 
 python do_package_prepend() {
-- 
2.17.1


