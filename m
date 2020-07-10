Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.3852.1594410000942313823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 12:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=E41VOXSh;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2255; q=dns/txt; s=iport;
  t=1594410000; x=1595619600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qa+I00b9gv0pJoqFnL5vyPtOCINP4xjFzvmLimzQBFY=;
  b=E41VOXShxgTj1MJzIQQ2/8vuq9wcirpy/2WxO140smnDAV/v/2HFHpiv
   UtNJt0XnSbPmAL62S9BLO5S/xjd8rGEwWxPif8afLgjFjv803RYxNQzwH
   wotWlUnE8q/YRePnMGld8PEYQlOs/xwXMoN9zSJ654oJQoO11CttA/NXs
   4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BfAAAVwwhf/5ldJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBeAUBAQsBgilvVAEyLJ9cj3qBfQsBAQEMAQEfEAQBAYRNghg?=
 =?us-ascii?q?CJDYHDgIDAQELAQEFAQEBAgEGBG2FZ4YoAUYpgRUTgyYBglclqROCKIksgUA?=
 =?us-ascii?q?UgSQBiAGDLIFDGoFBP4RfijMEkX+JDZoLgmeHVXqQdw8gnyUBsFMCBAsCFYF?=
 =?us-ascii?q?ZATOBV3AVO4JpCUcZDZ0FIQMwAjUCBggBAQMJj3YBAQ?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="798208830"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 19:39:59 +0000
Received: from localhost.localdomain ([10.24.63.201])
	(authenticated bits=0)
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id 06AJdw1B004169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Jul 2020 19:39:59 GMT
From: "Taras Kondratiuk" <takondra@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, xe-linux-external@cisco.com,
        OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssl: add rdcpu to rand-seed
Date: Fri, 10 Jul 2020 12:39:57 -0700
Message-Id: <20200710193957.1969769-1-takondra@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.24.63.201, [10.24.63.201]
X-Outbound-Node: rcdn-core-2.cisco.com
Content-Transfer-Encoding: 8bit

Native[sdk] openssl fails to initialize RNG on systems where native[sdk]
glibc is built against pre-3.17 linux-libc-headers, but runs on 4.8+
kernel:
140737348333184:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1g/crypto/rand/drbg_lib.c:342

Commit 3ff98f558157 ("Start up DEVRANDOM entropy improvement for older
Linux devices.") in OpenSSL 1.1.1d has effectively disabled devrandom
seed source for kernels >=4.8. The assumption is that getrandom(2) will
be used instead. Getrandom syscall was added in kernel 3.17 by commit
c6e9d6f38894 ("random: introduce getrandom(2) system call"). So on a
system with 4.8+ kernel and pre-3.17 libc headers both getrandom and
devrandom can't be used.

To workaround this issue add 'rdcpu' as additional source of entropy for
the rand seed. Also devrandom in the list is no-op since os = getrandom
+ devrandom on Linux, so remove it. The comment is also not relevant
anymore.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 47ed6b7640b3..2bf7f56183ce 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -43,10 +43,8 @@ do_configure[cleandirs] = "${B}"
 EXTRA_OECONF_append_libc-musl = " no-async"
 EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
-# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
-# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
-EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF_class-native = "--with-rand-seed=os,rdcpu"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,rdcpu"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
 CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-- 
2.25.1

