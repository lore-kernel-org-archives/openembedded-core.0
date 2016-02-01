Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF167723C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:34 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id x1so46420294qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vMvN02ggm6/a2iI/Z7UfdegRoC46RjQ82qFTB40zrfI=;
	b=YwS2sAMIjsu1YWZGM9A4xPidPN7RKXvqb2BGeIFnmDuGN5D8i9j4+nBzYJinrCcHxa
	+gUBdfgcVP8sJU1e6RQA1Za+BGQj/cGT8JYmOtIn00ovfayiIKSWAhlnxf3ElxZYL7jo
	91bJ/NTYl2K6qq1cxxVDFD24IyBwULvnYAKbeFXsSZ5UTan6yKys/P2W0Yr8RBgSNbK/
	dMYqOZexwfD4/OcACMpPSIhd4chYgdVwkbGKs2t53N90eKhfgNQMYB2vWMjUnY5+4Qfl
	Yt57f47eJAsh3JF6wPJ2DaQlEJom0PiZ9uDgFKlXHcbKt3B+TPJhdaNx5Vixg62Slgb5
	i1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vMvN02ggm6/a2iI/Z7UfdegRoC46RjQ82qFTB40zrfI=;
	b=IKyVaBRpp513kZZ9X3OhqyucnWnICGre0JXo2Zb+R+EgAd/ybtaZHf5wrPYrWBR6D1
	7hwLh2siKkoeofozELK6S6jwP+gM58g1CVPgIml5JatLAuizEakfnNUkrOYlQwPbBw7f
	rt+ApJgoEwUlDxVk++lTkhEgpSBfh8ZiuMkVebVowmarcAfNKpCsZeG/3rMI7T47jdd6
	cWAlry5AkNhj2bx/VKJRPVLVUEjirjzHwSo1EgLZ68J7wOyK3BwLqIVbA1UNVuO580RY
	6dcbHLLKcFFvjToQhB8WldbT2raxyplrkHvtXw4dy74pm90t+UD+Iuj54NhJSpVkVcfj
	Iaag==
X-Gm-Message-State: AG10YOTzBli42LnkVlf5XHVkxWn+BvDOVFnrdlso1V7vzlsLWIVNTV5n2PjCHUQofR/ziQ==
X-Received: by 10.55.72.12 with SMTP id v12mr26142375qka.28.1454303315115;
	Sun, 31 Jan 2016 21:08:35 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:23 +0000
Message-Id: <8414fe6c4db39df641533dfaf9d4c9021916517b.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 2/8] nss-myhostname: Fix build on musl
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:35 -0000

provide needed data types if nss.h is not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tname-Check-for-nss.h-presense-before-use.patch | 51 ++++++++++++++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
new file mode 100644
index 0000000..89b06cf
--- /dev/null
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
@@ -0,0 +1,51 @@
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


