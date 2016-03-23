Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5463262132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:51:48 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j35so4957622qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DnNvTMfuMYjzkEYOllxcFvbpTxozm99yOzmIUFXC9/A=;
	b=aSPQrFhUMicGKDag9yKrSKub1d2vDkILghnKoZcuKMOERtDWSruBB/lxjYc7LscDwM
	MfT2EnRJgoe7vjUkqkdkMn0fsAD+IX5yAriE/H5G/lkQA0ya8VSavXb+vF889absEEwr
	SaYzp1PUazqj5wkAhUqRqT4lkk+5vsaisjEv6Nb1z31Hjiv2C9YQ0JdYy4rckKthHz2j
	cCqbdBLT/eN2zai+1VbMyGBZsfn+LZyW6Y3f0E1M45mwr3ICV5mZorevTGF/hnzQ0epe
	7EjjiDQR6q35VdoU5UCokFmM+tfXo0QpSrDC3bEs17wAO4x5E4nou8ZxgNftT5Mn2LwL
	lnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DnNvTMfuMYjzkEYOllxcFvbpTxozm99yOzmIUFXC9/A=;
	b=C+WCWqcAZzh9iT8LrdtWD7aimvGQ+ZePsC6bu21eIfd3cKn579LBgMVGQG1+E7Vz/+
	jResB5dbmYTUqwVU8v3YumLYjj47dshpG6TNtFtRfA0TJtdHEU0EHPIAKn517iXBqU4W
	h8fBTYiRPJGSlgx9Bu09dxu5vcUiONFH3Q5HPADzXqiCRsTkVZdH/E6KqWsqccLc0F3C
	VK1diUJMusr4ZkuKufy/3nCPnTuBZdNzGKelCs9GDEFfNWRdsN+A4vIfpKK+9shSQB6d
	ov978qKI/9/Bk0b/WXb7UoZTj7CmfLdw3FOHGpmOsDa2C7pmM3ZKNWpzebGA3bPabkIt
	yhNw==
X-Gm-Message-State: AD7BkJKszSrSLJjRZLLbx/AlkFqIv9XzvU0VB5UHsi3u9OZ84ZY/mqeEEScshe2NCdWqxg==
X-Received: by 10.141.6.9 with SMTP id i9mr1313534qhd.21.1458715909171;
	Tue, 22 Mar 2016 23:51:49 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id b34sm478226qgb.31.2016.03.22.23.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 23:51:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 06:51:40 +0000
Message-Id: <1458715901-31788-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] libunwind: Fix build on mips/mips64 for musl targets
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
X-List-Received-Date: Wed, 23 Mar 2016 06:51:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-on-mips-musl.patch              | 90 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-Fix-build-on-mips-musl.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-Fix-build-on-mips-musl.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-Fix-build-on-mips-musl.patch
new file mode 100644
index 0000000..5426fcc
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-Fix-build-on-mips-musl.patch
@@ -0,0 +1,90 @@
+From e623c7703945a5eb6c9a30586ec5e23b2f7396f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Mar 2016 06:08:59 +0000
+Subject: [PATCH] Fix build on mips/musl
+
+Do not include endian.h on musl it includes
+further headers which can not be compiled in __ASSEMBLER__
+ mode
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/coredump/_UCD_internal.h | 34 ++++++++++++++++++++++++++++++++++
+ src/mips/getcontext.S        |  3 +--
+ 2 files changed, 35 insertions(+), 2 deletions(-)
+
+diff --git a/src/coredump/_UCD_internal.h b/src/coredump/_UCD_internal.h
+index 3c95a2a..80acc15 100644
+--- a/src/coredump/_UCD_internal.h
++++ b/src/coredump/_UCD_internal.h
+@@ -34,6 +34,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ #ifdef HAVE_SYS_PROCFS_H
+ #include <sys/procfs.h> /* struct elf_prstatus */
+ #endif
++#include <sys/reg.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <limits.h>
+@@ -44,6 +45,39 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 
+ #include "libunwind_i.h"
+ 
++#ifndef __GLIBC__
++#define EF_REG0			6
++#define EF_REG1			7
++#define EF_REG2			8
++#define EF_REG3			9
++#define EF_REG4			10
++#define EF_REG5			11
++#define EF_REG6			12
++#define EF_REG7			13
++#define EF_REG8			14
++#define EF_REG9			15
++#define EF_REG10		16
++#define EF_REG11		17
++#define EF_REG12		18
++#define EF_REG13		19
++#define EF_REG14		20
++#define EF_REG15		21
++#define EF_REG16		22
++#define EF_REG17		23
++#define EF_REG18		24
++#define EF_REG19		25
++#define EF_REG20		26
++#define EF_REG21		27
++#define EF_REG22		28
++#define EF_REG23		29
++#define EF_REG24		30
++#define EF_REG25		31
++#define EF_REG28		34
++#define EF_REG29		35
++#define EF_REG30		36
++#define EF_REG31		37
++#endif
++
+ 
+ #if SIZEOF_OFF_T == 4
+ typedef uint32_t uoff_t;
+diff --git a/src/mips/getcontext.S b/src/mips/getcontext.S
+index d1dbd57..de9b681 100644
+--- a/src/mips/getcontext.S
++++ b/src/mips/getcontext.S
+@@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 
+ #include "offsets.h"
+-#include <endian.h>
+ 
+ 	.text
+ 
+ #if _MIPS_SIM == _ABIO32
+-# if __BYTE_ORDER == __BIG_ENDIAN
++# if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+ #  define OFFSET 4
+ # else
+ #  define OFFSET 0
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 1ed525f..aff8409 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI_append_libc-musl = "\
            file://0001-x86-Stub-out-x86_local_resume.patch \
            file://0001-disable-tests.patch \
+           file://0001-Fix-build-on-mips-musl.patch \
 "
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.8.3.1


