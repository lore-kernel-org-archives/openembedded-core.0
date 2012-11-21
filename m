Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tb9Xx-0006Z5-7d
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 13:36:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAL9Od7M009462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 01:24:39 -0800 (PST)
Received: from jiahongxu-OptiPlex-990.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 01:24:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 17:24:35 +0800
Message-ID: <0a514b84b1550c095623ddf495059bbe084c0bf5.1353488396.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353488396.git.hongxu.jia@windriver.com>
References: <cover.1353488396.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] binutils-native: do_compile failed on Ubuntu 12.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 12:36:53 -0000
Content-Type: text/plain

binutils-native do_compile failed on Ubuntu 12.10:
...
error: call to '__warn_memset_zero_len' declared with attribute warning:
memset used with constant zero length parameter; this could be due to
transposed parameters [-Werror]
...

When compiling binutils-native, option "--enable-targets=all" makes
oasys.c compiled and option "-Werror" makes warning treated as error,
so both of the options make the compile warning of oasys.c cause
binutils-native compile failed.

The warning caused by /usr/include/x86_64-linux-gnu/bits/string3.h:82
in Ubuntu 12.10, here is the code:
__extern_always_inline void *
__NTH (memset (void *__dest, int __ch, size_t __len))
{
  if (__builtin_constant_p (__len) && __len == 0
      && (!__builtin_constant_p (__ch) || __ch != 0))
    {
      __warn_memset_zero_len ();
      return __dest;
    }
  return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
}

In oasys.c, invoking memset without checking len nonzero caused the
warning.

Add len nonzero checking when invoke memset in oasys.c to remove the
compile warning could fix the problem.

[YOCTO #3464]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc   |    3 +-
 .../binutils-check-size-before-memset.patch        |   43 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-check-size-before-memset.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index 9697242..94cd17f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -1,4 +1,4 @@
-PR = "r17"
+PR = "r18"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://0144-timer.cc-include-unistd.h.patch \
      file://0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch \
      file://0182-PR-ld-13991.patch \
+     file://binutils-check-size-before-memset.patch \
      "
 
 SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-check-size-before-memset.patch b/meta/recipes-devtools/binutils/binutils/binutils-check-size-before-memset.patch
new file mode 100644
index 0000000..0baf42e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils-check-size-before-memset.patch
@@ -0,0 +1,43 @@
+bfd/oasys.c: check size before memset
+
+On Ubuntu 12.10 /usr/include/x86_64-linux-gnu/bits/string3.h:77
+
+__extern_always_inline void *
+__NTH (memset (void *__dest, int __ch, size_t __len))
+{
+  if (__builtin_constant_p (__len) && __len == 0
+      && (!__builtin_constant_p (__ch) || __ch != 0)) 
+    {   
+      __warn_memset_zero_len (); 
+      return __dest;
+    }   
+  return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
+}
+
+The "memset(void *s, int c, size_t n)" will warn if the "n" is zero,
+check the value of "n" before memset will fix the problem.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Upstream-Status: Pending
+---
+ binutils-2.22/bfd/oasys.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/oasys.c b/bfd/oasys.c
+--- a/bfd/oasys.c
++++ b/bfd/oasys.c
+@@ -908,7 +908,9 @@ oasys_write_header (bfd *abfd)
+     length = sizeof (r.module_name);
+ 
+   (void) memcpy (r.module_name, abfd->filename, length);
+-  (void) memset (r.module_name + length, ' ', sizeof (r.module_name) - length);
++
++  if (sizeof (r.module_name) > length)
++    (void) memset (r.module_name + length, ' ', sizeof (r.module_name) - length);
+ 
+   r.version_number = OASYS_VERSION_NUMBER;
+   r.rev_number = OASYS_REV_NUMBER;
+-- 
+1.7.10.4
+
-- 
1.7.10.4



