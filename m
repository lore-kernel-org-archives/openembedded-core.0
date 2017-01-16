Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B061471A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so5486399pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=a2RHM356lqUSe0SE/fzHt7H3hzSR+G6SCnV4Jq2YZCU=;
	b=QF2O+Mxra3Mrj9PrtUstxcK0KX8CeDLIpC9vw8VGA8SN7OHkHUkwA3NpRo6cPv0gtD
	ygyNQKYgsEQZgxE1P1tdMJQg2EmZOvzT92fjeRAQEd9bEPlRmp+S5w9L5t/9d1UECKqf
	OiIONIL/h1kXZX32IVgLaOeBBpnamppPAkNtGDfuOY4gmXejeWqYzfLF/lbhHWvkOK/y
	5o1WpEAGI7iY6xq7XDyUzqTGQODGuOuoSeuWW5v0IqyJcLGBofFTHgSAHb4AgYJ1dzvz
	j00aOpHN1P5mn3JIx1xBunTWcONRUVq/QG61XErr75LgRR7DVsCV6F/FOexBcEF88oUj
	TcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=a2RHM356lqUSe0SE/fzHt7H3hzSR+G6SCnV4Jq2YZCU=;
	b=qlXBY9WZAJHNkJo8z45f5w/RXsSM9Ih1iahAuKT81SUn9QsI/ramcYrzt03s1LP3XW
	+EcgxdvpiUuOgMrBozwvP9z4AI7EQ/2j88naPplqOt6BT0BjvMOQc8rbwIqlO/aytbo0
	ja1E5OPURbUdNwNZlqfA49xKwalh5zjdqnv9WrdhvQMLwOv3qsj7cLFkNX3KngzPgCqG
	wR6loyC2WNeJJuGUFMpo/HX5cJZlsFe078HQMHRT1p3lvWB+7sh702cJ30+iTdeJFOvF
	EBIkRD91/o3lxA4wEPNFCWiLPzouYGo8ATiNC3W1FnX94ZfV65AAn3GrHVcFbp74FAd+
	haYQ==
X-Gm-Message-State: AIkVDXJfu28WqeoLxtSQXL/5/aI35u7gaMoIPmrLtJi+kK12HJmYDS48EP/8srKyN/7UHQ==
X-Received: by 10.99.126.27 with SMTP id z27mr39386475pgc.177.1484576135664;
	Mon, 16 Jan 2017 06:15:35 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	r8sm48246910pfa.44.2017.01.16.06.15.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:35 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-1-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 1/30] gcc-configure-common.inc: Change 'initfini-array' to PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Change the '--enable-initfini-array' default config to a PACKAGECONFIG
so that it can be disabled (e.g. for mingw32).

The 'initfini-array' option works only for Linux so disable it for
mingw32. Otherwise eventually the build will encounter errors like
(gcc-crosssdk):

    multiple definition of `__do_global_dtors'

Or errors like (gcc-crosssdk-initial):

    Assembler messages:
    Error: invalid instruction suffix for `push'
    Error: invalid instruction suffix for `pop'

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---

This patch uses PACKAGECONFIG as suggested by Khem on an existing
meta-mingw series by Juro.

https://lists.yoctoproject.org/pipermail/yocto/2016-October/032310.html

This patch also consolidates the two patches in the mentioned series
such that initfini-array is disabled for any gcc build that is targeting
mingw32.

https://lists.yoctoproject.org/pipermail/yocto/2016-October/032305.html
https://lists.yoctoproject.org/pipermail/yocto/2016-October/032307.html
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 00ef89ec57..cec17064fe 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -15,6 +15,9 @@ JAVA_sh3 ?= ""
 FORTRAN ?= ",f77"
 LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
 
+PACKAGECONFIG ?= "initfini-array"
+PACKAGECONFIG_remove_mingw32 = "initfini-array"
+
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
@@ -44,9 +47,8 @@ EXTRA_OECONF = "\
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
 
-# Set this here since GCC configure won't auto-detect and enable
-# initfini-arry when cross compiling.
-EXTRA_OECONF_append = " --enable-initfini-array"
+# GCC does not auto-detect initfini-array when cross compiling
+PACKAGECONFIG[initfini-array] = "--enable-initfini-array,--disable-initfini-array"
 
 export gcc_cv_collect2_libs = 'none required'
 # We need to set gcc_cv_collect2_libs else there is cross-compilation badness
-- 
2.11.0


