Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3673C60111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:34 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id w104so63250763qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0VxyW33IqfKWiSUVZkRH8sYf4iCbbOhvEXx4aMsq+jY=;
	b=BRU95e2HFp+aqp3YVrqmQa40janELcQTZyon25rc1Tj0y0vN9xPfpa7iI2WjamP22p
	y9pcITMFEiBElbww81TaGiwubZh10XZP+ZtW7rU0KEb7dmWpkW8W0pdttyvVELOM9sEJ
	D8ZuKohKgZkmdT7/D05jYlZV3hWg1SGe0/QvmG3QU0p7U4Uc09v8IGtp3sFrp3SBm+/2
	ptBEVYlFBK/pf3HKFxIDRsjL5tP3vTHAPwmdKGIcv5lbHvhtHc8Pz96hqnHBdkCuhVhx
	0RDptYToQZQP0eCRwZ9p1c0mlzkRy5sHdyj84oYGl1JuL9OO0ctNm7E98BSDGl9GWlcE
	4iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0VxyW33IqfKWiSUVZkRH8sYf4iCbbOhvEXx4aMsq+jY=;
	b=UoeI7wsrVaRd6jpWNNKLN0Wnn0XNhyhn01osNeiVEJ2VOJKV49cqdCGLjvRxQFO1qQ
	c4HhKXOP4es+YEbwHTM3VO5iWDyTtyMsEGJx2QM07Er85+Zwc99mevbczwHYmvfcA5+X
	nXXFSKU1B30EG/zkiERT+/HT1moTMMrxX6OEZgRYDDeZUFpIG2WALuaviwWijscgSyRs
	GL+Uw85aQmg2Q4p+ALQZg6vibQxYXKt9JQJXB/NatneqeNCRDkFGvSUs4bALA5EDllCY
	4i1hKsq/PG65Vip8/tvopSDOQKdzsBPtz7mVETMR3T40rNwQG7lTQ7vagPMOHndzZAJK
	A+lw==
X-Gm-Message-State: AD7BkJLVtKB6gpkhzMMNX3v2dO9MIjbEgDAucm69RcbbD9gJ3eqT8NWUKBprVTBUBlxYYw==
X-Received: by 10.140.230.18 with SMTP id a18mr12366262qhc.3.1458191915024;
	Wed, 16 Mar 2016 22:18:35 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:17 +0000
Message-Id: <6fe213a08313bc9118e05e7c9d5107e2153373b3.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] bdwgc: Check for getcontext() API during configure
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:35 -0000

This helps in compiling dependent components like
guile where it shows the problem of missing getcontext
API when using libc which dont implement it e.g. musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 29 ++++++++++++++++++++++
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

diff --git a/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
new file mode 100644
index 0000000..8ef774f
--- /dev/null
+++ b/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
@@ -0,0 +1,29 @@
+configure.ac: add check for NO_GETCONTEXT definition
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[yann.morin.1998@free.fr: add a comment, change variable name, use
+ AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
+ Thomas)]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+Upstream-Status: Pending
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- bdwgc-7.2f.orig/configure.ac	2014-06-01 19:00:47.000000000 +0200
++++ bdwgc-7.2f/configure.ac	2014-12-23 14:13:11.585716713 +0100
+@@ -365,6 +365,12 @@
+   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
+ fi
+ 
++# Check for getcontext (uClibc can be configured without it, for example)
++AC_CHECK_FUNCS([getcontext])
++AS_IF([test "$ac_cv_func_getcontext" = "no"],
++  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
++
+ case "$host" in
+ # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
+ # and unnecessary everywhere.
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 95e358f..209f533 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -23,6 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
 SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
            file://0001-fix-build-with-musl.patch \
+           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
           "
 
 SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
-- 
1.9.1


