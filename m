Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id B0D7277367
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:04 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b35so9306181qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=50xiBY2Qz2qLLyJ4QUwoA6AvE8SbLU76uXil9Ne8X2I=;
	b=GC1Eyat2tCHrAeMBL3sws0yooHKIN1VpI8gIc94zxvombIKtuhq9HNqre8+mcUV4M3
	7Hx/k8AvqciLnn1dULEDw38ZpHg0XXfZ33cZNSQK8cSEbq0oBF5R6Mm93nXi4VdX+OcJ
	qxJBgFv6eHRtl9+oHVTUowXAi295onDa76DQk0h/AMK5M8QhohEn7XerFqbL224vheFD
	x/vei1CufR/J80mZIFl8vw2xxkXS6fPFWYHGImzpkljE/gkx7aPtj5ToEYzUJrMbMg+Y
	lJuhUede6dkEydi5RyGH8iBMbrOEV1EqvCaUcptgGBEmVZG+OrzcBOYt7ypMfmCFK4wc
	SceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=50xiBY2Qz2qLLyJ4QUwoA6AvE8SbLU76uXil9Ne8X2I=;
	b=TIVc5l4c8MuBJHpnz7pLclvCc9Afiv/R68ehe50pJoaaZwJCB5XnsdaXgnTJT78qjl
	klgH1+Rbuy9uxvjoGdPlBtFiVoBj+14c0hav0Jk0+2Dohdkloiat/6LPYackme3b8TaC
	ZgRALNXBCzrxguGaHkj57Y9sGiEq1/WR5UMgXTH7Ppe7HMh4f/T3zfiLpRVbsm5Zw9cl
	+0FFuCxzdSTSjphFQ2UhkfB82G2CXQ9C21TKtU7xCRWJzR46l5TGALdnqxnbYU7Ch0qw
	9UvmRrCk6b7ixcZYyjfSNakub78AcRnkpZtwUapCmcZRD1itvVNS29nk5rBYc9EgGJno
	UmMQ==
X-Gm-Message-State: AG10YOTwEW1tTMFRZXfmMgk2dkcswTjV8j6Js84y+hEHkGkZ+BleE0oKzZG3rfvYT/G+nA==
X-Received: by 10.140.234.129 with SMTP id f123mr39720518qhc.67.1454480884791; 
	Tue, 02 Feb 2016 22:28:04 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:54 +0000
Message-Id: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] nss-myhostname: Fix build on musl
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:06 -0000

provide needed data types if nss.h is not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tname-Check-for-nss.h-presense-before-use.patch | 53 ++++++++++++++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
new file mode 100644
index 0000000..82f2574
--- /dev/null
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
@@ -0,0 +1,53 @@
+From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Jan 2016 20:29:06 +0000
+Subject: [PATCH] nss-myhostname: Check for nss.h presense before use
+
+We do not have nss.h on musl e.g. and configury is already checking for
+nss.h presence, use this to define needed data structures if nss.h is
+missing on a given libc implementation on a platform
+
+include stdint.h for uint32_h definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ nss-myhostname.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/nss-myhostname.c b/nss-myhostname.c
+index 293166c..6f287f5 100644
+--- a/nss-myhostname.c
++++ b/nss-myhostname.c
+@@ -21,7 +21,27 @@
+ ***/
+ 
+ #include <limits.h>
++#include <stdint.h>
++#ifdef HAVE_NSS_H
+ #include <nss.h>
++#else
++enum nss_status {
++    NSS_STATUS_TRYAGAIN = -2,
++    NSS_STATUS_UNAVAIL,
++    NSS_STATUS_NOTFOUND,
++    NSS_STATUS_SUCCESS,
++    NSS_STATUS_RETURN
++};
++/* Data structure used for the 'gethostbyname4_r' function.  */
++struct gaih_addrtuple
++  {
++    struct gaih_addrtuple *next;
++    char *name;
++    int family;
++    uint32_t addr[4];
++    uint32_t scopeid;
++  };
++#endif
+ #include <sys/types.h>
+ #include <netdb.h>
+ #include <errno.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index bbce9e9..de5b7cf 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz"
+SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
+           file://0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch \
+           "
 
 SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
 SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
-- 
2.7.0


