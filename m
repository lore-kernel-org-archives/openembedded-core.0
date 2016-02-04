Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id CFB30772E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:55:25 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id s5so27641941qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=50xiBY2Qz2qLLyJ4QUwoA6AvE8SbLU76uXil9Ne8X2I=;
	b=QztcDkscBTxigeFsBS7BObSor0Dmb+AppbshING4LsCfl2ddMgzFjXeY8XxIeVQyDY
	Q3NjP4UM6axm30sx6/sCJBbMMjV9cQVaHctu4EahWDOff3zXudrCYXAHQWH6nKfU45bJ
	jgVB2VsdhZXjQOF6eSyWUYcVmK0cQ439zi4FwyBDQX1nHLCbOWStSod7WMDwvVXa3D5v
	Y2w8u8QmMRSv79r51LgJAqfd3bLqdWTcI959c2x3ebo5VOgvm5KENpY0SS6dzI8U7d21
	tNMCEr7U3I88p1UBP3U3tqgSs1vPogACiJQjpTjPKF3d7q4Ovm/2MaOKVemyV7CWV0mo
	riHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=50xiBY2Qz2qLLyJ4QUwoA6AvE8SbLU76uXil9Ne8X2I=;
	b=B7gUHYqLHGk3AX353H7dkftZWm9QZ6mNOOkcGxZOPKBCHNWiTpgb+VLJ1iHq2uMs+c
	ieamKNLMkz7gfjz6w+xPJSG2wtxoawdLWxJVy3Hve6zpO97P1G2YoN6zHif8kfD7Jj2f
	35SYhjuS+ps4QtZlgYiid/JErXpzk0NE64NjDC66k+MqUJmiFoximneG65zEfbC1lUQB
	O5g8Jxhn+22Bh6QiafZ++6YxZ3DepV2wYL7eHbB0915b6W/A/Xy8N5bu7CLksual8Ee2
	clHVXm2C4hUFru5IFZk/bDPG1yk2/mkLM0D2HG39wBlOsorfqgW0R0vbAb/LttU2xxNG
	jiiQ==
X-Gm-Message-State: AG10YOTaoKgLPevA1RsHyfWBdS1qlyu3uv3P+38dKE1espH9EeWIJpQ9Cll1zdkcwmjohQ==
X-Received: by 10.55.80.86 with SMTP id e83mr12337638qkb.91.1454626526585;
	Thu, 04 Feb 2016 14:55:26 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w16sm6327876qka.35.2016.02.04.14.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:55:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:55:15 +0000
Message-Id: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 04 Feb 2016 22:55:27 -0000

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


