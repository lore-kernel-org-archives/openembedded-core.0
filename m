Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 633197FD86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 18:50:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i18so2460600pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fqef18wbWUEZhzGP7RZQgLzWCCGxipj5w9XmQiQlA4c=;
	b=vSU+/DdZQZqUT3H8YStINL7+tL3dHTae8SE1JAYX0IK8gLkQPFqq+ar2uccV0aagre
	d6oi9Hj+SnUlL+rs0kazQEf2qwVyNIp+rnfz1CEd7aeo1QwAdQByEnnimcJuNdjyIDd3
	D4qj9ux4m2kYqKzg2o+/ncGIik11ptcNvvokAPkUKwX6Z2Hk0lVzl9mPPhISCLxfhsj5
	4wnVDKSOgXAgiE3oPNAubyYajmAPMGRWxaG8vNYBLAVmabcNgOw9a005Cc37Xv4ksDkT
	+QZVzCY6eudFuiCTuds2mCxUG7CLq6MJZIPQu2TJMozjJkDM4Aw8glnQ/SZQW9P4APQc
	OLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fqef18wbWUEZhzGP7RZQgLzWCCGxipj5w9XmQiQlA4c=;
	b=f02DuA6Z6zbZ5TYyQ8A9jovrUfltT/Qh5ke71SohPHLJOhpTxo9eCr0cJDl/Amu5Up
	7xXWgZvKDMiSBTD0H45cCL40TOg+bG0V92tPflQ5KIqqFkxwKAKtEiO4fVQxLn3W9WOs
	kyOt+td6i2QlfZ/SOEJFM1IrioZYM+Nsw0N17joGAIlfT77ft12Dyu+Z+cWBP8BTJuV4
	Ml8pYE2iCxBUj6999ZdOHO0FHZNvpAGSFLbUHwEb6XNh0CwOo7pVYYc5FibQS+Ux16cY
	+fJ8vrF4dMcmGlOUXvfFbSYEXtSSmAdu9FRK6nTkv/DH+ZSyMFNK6OYdYTtPdqENAMAY
	Q9uA==
X-Gm-Message-State: APjAAAXr25EZ4clcaOjJ5/cpS0h/bVE1DoUysxVei/zN35NO9wR+Fy1o
	Wf3xLIfRUZnJoQRhUC+ASUQlIYbZgIM=
X-Google-Smtp-Source: APXvYqx/dA1v7/v3ljmcK+h+zgKuCp8IeJg80CZLbeNkTIkHT6jLfDRLSu6dpQ3hYI6WLaUBY2SG+Q==
X-Received: by 2002:a17:90a:d356:: with SMTP id
	i22mr6263773pjx.24.1568746201710; 
	Tue, 17 Sep 2019 11:50:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id n1sm1337891pfa.12.2019.09.17.11.50.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 11:50:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 11:49:47 -0700
Message-Id: <20190917184947.2244823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Tue, 17 Sep 2019 18:50:01 -0000
Content-Transfer-Encoding: 8bit

with openSSL 1.1.1d we start seeing errors like

Error Generating Key
139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:

when using openssl from openssl-native on build hosts, this is due to
limiting the random seed to devrandom, to support older hosts, since the
option allows to have a comma separated list of methods to try, we can
try the default first and if that fails then fallback to devrandom, this
will ensure that it keeps working with build systems which dont support
getrandom()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 080d1a8bb7..072f727e0b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -43,10 +43,10 @@ do_configure[cleandirs] = "${B}"
 EXTRA_OECONF_append_libc-musl = " no-async"
 EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
-# This prevents openssl from using getrandom() which is not available on older glibc versions
+# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF_class-native = "--with-rand-seed=devrandom"
-EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
+EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
 CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-- 
2.23.0


