Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7C87EA18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 02:18:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5H2ILuJ010644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2019 19:18:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 16 Jun 2019 19:18:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sun, 16 Jun 2019 22:17:41 -0400
Message-ID: <1560737861-151223-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openssh: fix potential signed overflow in pointer arithmatic
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
X-List-Received-Date: Mon, 17 Jun 2019 02:18:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Pointer arithmatic results in implementation defined signed integer
type, so that 'd - dst’ in strlcat may trigger signed overflow if
pointer ‘d’ is near 0x7fffffff in 32 bits system. In case of ompilation
by gcc or clang with -ftrapv option, the overflow would generate
program abort.

Signed-off-by: hguo3 <heng.guo@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ial-signed-overflow-in-pointer-arithmatic.patch | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
index 7e043a2..20036da 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -11,14 +11,17 @@ would lead to program abort.
 Upstream-Status: Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]
 
 Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+
+Complete the fix
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- openbsd-compat/strlcat.c | 8 ++++++--
- openbsd-compat/strlcpy.c | 8 ++++++--
- openbsd-compat/strnlen.c | 8 ++++++--
- 3 files changed, 18 insertions(+), 6 deletions(-)
+ openbsd-compat/strlcat.c | 10 +++++++---
+ openbsd-compat/strlcpy.c |  8 ++++++--
+ openbsd-compat/strnlen.c |  8 ++++++--
+ 3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/openbsd-compat/strlcat.c b/openbsd-compat/strlcat.c
-index bcc1b61..e758ebf 100644
+index bcc1b61..124e1e3 100644
 --- a/openbsd-compat/strlcat.c
 +++ b/openbsd-compat/strlcat.c
 @@ -23,6 +23,7 @@
@@ -29,6 +32,15 @@ index bcc1b61..e758ebf 100644
  
  /*
   * Appends src to string dst of size siz (unlike strncat, siz is the
+@@ -42,7 +43,7 @@ strlcat(char *dst, const char *src, size_t siz)
+ 	/* Find the end of dst and adjust bytes left but don't go past end */
+ 	while (n-- != 0 && *d != '\0')
+ 		d++;
+-	dlen = d - dst;
++	dlen = (uintptr_t)d - (uintptr_t)dst;
+ 	n = siz - dlen;
+ 
+ 	if (n == 0)
 @@ -55,8 +56,11 @@ strlcat(char *dst, const char *src, size_t siz)
  		s++;
  	}
@@ -70,7 +82,7 @@ index b4b1b60..b06f374 100644
  
  #endif /* !HAVE_STRLCPY */
 diff --git a/openbsd-compat/strnlen.c b/openbsd-compat/strnlen.c
-index 93d5155..9b8de5d 100644
+index 7ad3573..7040f1f 100644
 --- a/openbsd-compat/strnlen.c
 +++ b/openbsd-compat/strnlen.c
 @@ -23,6 +23,7 @@
@@ -95,5 +107,5 @@ index 93d5155..9b8de5d 100644
  }
  #endif
 -- 
-1.9.1
+2.17.1
 
-- 
2.8.1


