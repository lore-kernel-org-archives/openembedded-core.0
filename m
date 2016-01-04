Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 44FDD731CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:23:37 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l65so157153006wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RMr4Q4yRg5asjoD8qELtu9drlBg/7fjFKbEYSM8ptlQ=;
	b=jnzF+LtJkp35eVeDprE9b9c/svBDxIWgHlj9H7xd18zxpxKGK3gt4I8jhTOvEz09KL
	BNLIoC4t71TjfkVJeohVxPWC5f7/EsrSHJpjPDHyjc3RQNguox5Xc3uW0fbYIR5ugbIP
	neslbA8GQK1cfTklNUjbWPc6N0G0jOwddb1y+NEIi0IMynAtqIJLImrJ0XQJY8uLJIgQ
	Q5xWeDiQERX+AbJbKGU1sz7QILV7zsx/4fe0XyNwK3jwwa0Ji2Iz0fXvMsRvTNxWs2p3
	h5K/OU8yZqR047dRMwUdsXOOHdnL0VoIkaPbjeldq9LCjwETyZrtC4KoaIfbyjIe+lkW
	E1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RMr4Q4yRg5asjoD8qELtu9drlBg/7fjFKbEYSM8ptlQ=;
	b=fHge7/om+b0CJ0TN4zydX5aTe8fPXgJS/tT3SR1ka0UrgfLZk3vGi+qIl9s1PJQpTh
	dIBs+4DjhGZDQT0DDpbpA4jkgVZghofiXJG9vs96LA/TV5nC3VVdcFiF2nmRpzMYHXeb
	W+R/8MUzn4vam+JeTrxPxBjd1Tp/0N3t3mP8iMEwFw2Tn4DbzVZIGOYpOSq2rt1BLdjB
	b22Mhia08Hzhh9YiZ5A26pgKTpgIrC8EcArwx3HYQYQz65SoRfMjNCi8LGEKiDsnegc4
	Vf+A9MiOGb7ZbdcjGM0ZTDKYHUjue3T1AKxTFT4PZrXPP5uAoD3R6CQh0lrkoEX5v/SK
	F1iQ==
X-Gm-Message-State: ALoCoQnRF0RxhrtMBj/eV2wGNPuQrT5jKZq2yp66II7Umd4yRVymMAOHoV9rfXqbd3VsYLU3P7DIjftKbtvmtS4GaiafKf/DLA==
X-Received: by 10.28.175.135 with SMTP id y129mr101342203wme.24.1451903017956; 
	Mon, 04 Jan 2016 02:23:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z65sm36901949wmg.10.2016.01.04.02.23.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 02:23:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 10:23:31 +0000
Message-Id: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Cc: Phil Blundell <philb@brightsign.biz>
Subject: [PATCH 1/2] openjade: Fix build if not installing the libtool-garbage
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
X-List-Received-Date: Mon, 04 Jan 2016 10:23:39 -0000

From: Phil Blundell <philb@brightsign.biz>

The openjade build system is slightly funky and does strange things with
library dependencies.  Fix it up so that it depends on the .so rather than
the .la (which may not exist) for libraries from the sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../openjade/openjade-1.3.2/no-libtool.patch         | 20 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb                |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
new file mode 100644
index 0000000..8642bfd
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
@@ -0,0 +1,20 @@
+The openjade build is fairly unique in auto-generating explicit dependencies to
+installed .la files.  As some distributions may delete these files unless
+clearly required, change the Makefile fragment to depend on the .so instead.
+
+Patch originally by Phil Blundell <philb@brightsign.biz>.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Inappropriate
+
+--- openjade-1.3.2/Makefile.prog.in~	2013-05-14 11:42:02.646782318 +0100
++++ openjade-1.3.2/Makefile.prog.in	2013-05-14 11:54:55.051728343 +0100
+@@ -12,7 +12,7 @@
+ 
+ ALL_LIBS = $(XLIBS) $(LIBS)
+ Makefile.lt:
+-	echo 'LT_LIBS='`echo $(ALL_LIBS)|sed 's/\.a/.la/g'` >Makefile.lt
++	echo 'LT_LIBS='`for d in $(ALL_LIBS); do case $$d in ../*) echo $$d | sed 's/\.a/.la/g' ;; *) echo $$d | sed 's/\.a/.so/g' ;; esac ; done` >Makefile.lt
+ 
+ PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
+ 
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index a304daa..068fdf0 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
            file://msggen.pl.patch \
            file://reautoconf.patch \
+	   file://no-libtool.patch \
 	   file://user-declared-default-constructor.patch \
            file://fix-regex.patch"
 
-- 
2.6.4


