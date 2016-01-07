Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 88C49607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 22:29:35 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so177704699pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=braqO2aHJfU1bm5SbdJDhhWjQZlb5QSR5lbWcxPBX+s=;
	b=xVVN6TBEYSmkEPn8r4gBhX5LNRHJb1Yk6EVjNTMd1YPSRS0ZsOKwZk/fOlG5PyRCsW
	MZnIjCFpEpgma5TY1forcpUpAImgDtXJTcWCbKHhbmGS98g4iEfbepBY7BjZ+ZiMJGnT
	PvZ2ZN76qjk2YqWuJxYv4I8GWPwSqzBevskGxQUSzADm6BN5j2Vgp/abQi3oVzy52V3G
	r5FQxs9217aUQRV1IdzU6VDazFsTsFvqqqlUdMxQWBKy+wlU0IpTChCr0qthf8isLx+d
	U8tRxj3ROFKUOFw1Qc0Ya02FrXw/Op1FUXfCBi9m4quQB40PrVwwMC8dzFBctVi90OcX
	DSxw==
X-Received: by 10.67.14.3 with SMTP id fc3mr156362673pad.134.1452205776414;
	Thu, 07 Jan 2016 14:29:36 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wa17sm93819672pac.38.2016.01.07.14.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 14:29:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 14:29:09 -0800
Message-Id: <1452205752-6353-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/4] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Thu, 07 Jan 2016 22:29:36 -0000

Valgrind has been tested on armv5te/qemuarm, so it seems
that valgrind's configure check for armv7 is over cautious.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index c1c11d4..95b3966 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -32,16 +32,18 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
 SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1dfcb997"
 
-COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
-COMPATIBLE_HOST_armv7a = 'arm.*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
 
 PR = "r1"
 
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
+
+# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
+EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+
 EXTRA_OEMAKE = "-w"
 
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
-- 
1.9.1


