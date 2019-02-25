Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA5417C864
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 22:03:06 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 32so9268722ota.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3EtSa+8msTmBh7Wa/wwcA4syemi6V55tDSAZbeDeyrw=;
	b=x8b2YzcRSGot067fYoQuxld2yxjUpAGmt05ltWvhjm2ixBWfN7W3oG2XEp16OZTH5T
	Ja8e+0j3x8/qHurKw/AqLYr+Nouo6WPw2GYv+uv74Vrh1IoHV6Hfx5+kS3uc9u4a5BsK
	MgVULuU2OfHd74Ft1RwX/5br+DYSWeFlP5ksq8ia6z2s/Hv7AvRdl2LApsJ5LiwFdWe8
	fnB65j5YWiBwL6jYeA8geTBDCwSasiS0hIuDwDbfykdFutixR+7jnlPsJ1ShbiepQqGL
	cAqnAQVBm1rhQp7q5hN9Iy86sj+KxUr+sOopnDMoLi3uv9TD1gJS7qCPc4WpWDbv03sG
	Xy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3EtSa+8msTmBh7Wa/wwcA4syemi6V55tDSAZbeDeyrw=;
	b=JbObVHxmZj769ffzmQ0IEi+CVumvaleXNNTf0rhGzazXuGu5N5eEZs1z2Z0NFLHflh
	e3pum7Ln96mU0I2J29KT2sPmkC9biO36zbJEsIoyLGcMZTr+h2TKZzAlTqbNcgWCRJiy
	CwKFNflSSCw84BZVNQzFH8wAAQYroOnQ9rSeuK39vuRB8a8VnC1uFKFPalCZT2emidyX
	hIhZzHi06duawSTBpBN6Er42UmHw+gthsQZpcG7hK8nG639jsblz+xKlPIQ+L5wkiSVt
	Y0D0HRjrho47ogdjHu9I8nTUS2hqVfJmKY0uKU7mpM/nrJ3HfPUlmzxStNfN4MnFkpQw
	QdRA==
X-Gm-Message-State: AHQUAuY2RTwv0ToXKstxHgR7yvSkQG2T3SdrUnyQrl6vSRMZzuxc9szO
	mVcBKXqDML02MNiRppuV6m+GaWS5ofY=
X-Google-Smtp-Source: AHgI3IaGYcWuke/ZcTLAVFHe5kboSVldF/2GhOgjfDF3Qj6DBXB2W0NZaZGxqHYOZvZnrCpGQXc0FQ==
X-Received: by 2002:a9d:72c2:: with SMTP id d2mr13816527otk.228.1551132187162; 
	Mon, 25 Feb 2019 14:03:07 -0800 (PST)
Received: from alago.cortijodelrio.net
	(CableLink-189-218-30-19.Hosts.InterCable.net. [189.218.30.19])
	by smtp.googlemail.com with ESMTPSA id
	c24sm4494002otl.67.2019.02.25.14.03.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 14:03:06 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 16:02:52 -0600
Message-Id: <20190225220252.29133-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ltp: Add patch for string formatting security warning
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
X-List-Received-Date: Mon, 25 Feb 2019 22:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A revamp of the syscalls/setregid tests made to use a new
library [LTP:7a1b4427] required a conversion to test messages.
This test in particular did not include a formatted string,
but a just a string element:
  testcases/kernel/syscalls/setregid/setregid01.c

This patch allows LTP to be built with -Wformat,
-Wformat-security, and -Werror=format-security.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...etregid01-security-string-formatting.patch | 46 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb     |  6 +--
 2 files changed, 47 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch

diff --git a/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch b/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch
new file mode 100644
index 0000000000..24449148f2
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch
@@ -0,0 +1,46 @@
+From 430e05c2169ed15aaa6d7f9459edd607603cee02 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Mon, 25 Feb 2019 10:44:33 -0600
+Subject: [PATCH] setregid01: Fix security warning for string formatting
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC 8.2.0 complains with the following:
+  setregid01.c: In function 'run':
+  setregid01.c:47:3: error: format not a string literal and no format arguments [-Werror=format-security]
+     tst_res(TFAIL | TTERRNO, tc->msg);
+     ^~~~~~~
+because there is no string formatting in the message. This can
+be seen with CFLAGS set to:
+  -Wformat -Wformat-security -Werror=format-security
+as Yocto Project's Poky does, e.g.:
+  http://errors.yoctoproject.org/Errors/Details/230043/
+
+Upstream-Status: Backport [46e1eda55f188810e6bf3a939b92d604321807ae]
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Enji Cooper <yaneurabeya@gmail.com>
+---
+ testcases/kernel/syscalls/setregid/setregid01.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/setregid/setregid01.c b/testcases/kernel/syscalls/setregid/setregid01.c
+index f2e41e134..8c9e11918 100644
+--- a/testcases/kernel/syscalls/setregid/setregid01.c
++++ b/testcases/kernel/syscalls/setregid/setregid01.c
+@@ -44,9 +44,9 @@ static void run(unsigned int n)
+ 	TEST(SETREGID(*tc->arg1, *tc->arg2));
+ 
+ 	if (TST_RET == -1)
+-		tst_res(TFAIL | TTERRNO, tc->msg);
++		tst_res(TFAIL | TTERRNO, "%s", tc->msg);
+ 	else
+-		tst_res(TPASS, tc->msg);
++		tst_res(TPASS, "%s", tc->msg);
+ }
+ 
+ static void setup(void)
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index ed1cb27112..ddf97e26ce 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -29,11 +29,6 @@ CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "a6a5caef13632e669dda27b0461726eba546a2f3"
 
-# ltp doesn't currently build cleanly with
-# "-Wformat -Wformat-security -Werror=format-security" in CFLAGS
-# remove this when it does
-SECURITY_STRINGFORMAT = ""
-
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
@@ -53,6 +48,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://define-sigrtmin-and-sigrtmax-for-musl.patch \
+           file://setregid01-security-string-formatting.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


