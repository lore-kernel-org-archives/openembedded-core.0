Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D0535607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:38:14 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h186so1538990pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GOk5oJzcJCK7SsV6lssxV0xTRK/+8pW2jOF+u0XYBL4=;
	b=C+A8g/Sx7SnUraxB7rMRlTsrI5UWmy1UCvXZRSQrGvSJQOuQc6/5zT3YVjNZavAk2+
	j7tpbwmyPUtlgwEAoTMcHxi54TmVhVALFeKNhMiP1JYZpYKzrsJ72CASnBs7HDZRET0Z
	gSP4T9iPnL+OJ++ZMkRP0Vax9JMfq4v4heuDw5qYVbY6xbtl02u4umIV6oB8C+B9sK6M
	C9d8MrABQqreiRZFJDWmk6gBSi6MHDsnxfPxCtT0XMRewx0xFcUDRFIBxa+28kDhw6Np
	9bL9HSYguezdjQ4lSv2E7prgqhgJverHFeQr0tusegKyKhX5Kn2K1BXglfomDZ1sLHHo
	QBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GOk5oJzcJCK7SsV6lssxV0xTRK/+8pW2jOF+u0XYBL4=;
	b=Z+0PG9TEYQDn2KZqJZT2Eg0LWQOLx2hLV0v00MSPdhcNFte7bn5Ed/FSQV9RKLHvZb
	rgzIgx5rx8egCIzsBWZLRluYnuXKV/exH8uUmPL5iLMRDKMBw+sDR3ol9MCjn77ldAl8
	lyGedbQb6Y49KYo+0vf79i59mXnU3KkZkyb4jPa0yUUGATgJFTzfPNhiz59ZRSf5pFMF
	fxHXyQJ4KkcC9FPIkY5x/Caq2kRHxZnlOuTdVbGxWEOHBg2nZ5Qp2Fas+53TQAvLc4Cb
	LXKCzxG3ZK+/GpyoSHVCs4FHA3qcQU/mrhPDGE7fdHPol5ndfif5utYy+BNcLeSVyRTf
	VOog==
X-Gm-Message-State: AEkoouulaO7Rz/4EI1RQRP9RWXsrP04J/mOehkYm5mC3bQxvcXiZKKhEepibNDvpQMjmOw==
X-Received: by 10.98.55.1 with SMTP id e1mr26871665pfa.58.1469612295170;
	Wed, 27 Jul 2016 02:38:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n69sm7519403pfa.77.2016.07.27.02.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 02:38:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 02:38:08 -0700
Message-Id: <20160727093808.32459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] binutils: Cache gettext api version 1 and 2 support
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
X-List-Received-Date: Wed, 27 Jul 2016 09:38:14 -0000

Problem described here

https://lists.gnu.org/archive/html/bug-gettext/2015-11/msg00012.html

gettext does not detect the gettext support in libc
correctly if the libc is not glibc. Musl does support
the gettext version 1 and 2 of APIs

http://www.openwall.com/lists/musl/2015/04/16/3

tests in gettext.m4 however fail since it pokes at glibc
internal symbols to determine the gettext APIs
musl's implementaitons are done differenty so the
tests fail and hence it does not enable  the libc
implementation. Since we install the header from
libc it confuses the compilation and results in errors
like

libbfd.so: undefined reference to `libintl_dgettext'

see
http://savannah.gnu.org/bugs/?46436

binutils need these variables in make env since
binutils build system runs configure in the sub directories
during make step, so we need to pass these flags
in compile step in addition to configure step

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.26.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
index e976bad..b51437b 100644
--- a/meta/recipes-devtools/binutils/binutils_2.26.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
@@ -10,6 +10,10 @@ EXTRA_OECONF += "--with-sysroot=/ \
                 --with-system-zlib \
                 "
 
+EXTRA_OEMAKE_append_libc-musl = "\
+                                 gt_cv_func_gnugettext1_libc=yes \
+                                 gt_cv_func_gnugettext2_libc=yes \
+                                "
 EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-- 
2.9.0


