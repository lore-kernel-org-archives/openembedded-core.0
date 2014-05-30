Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69D4D6FD6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 02:20:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4U2KRXA004556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 May 2014 19:20:27 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 29 May 2014 19:20:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 May 2014 10:20:19 +0800
Message-ID: <e6d02fd4b7b74e2208bbbaeb0ab602e165cbe89f.1401416249.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401416249.git.hongxu.jia@windriver.com>
References: <cover.1401416249.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] libgcrypt: workaround ICE failure on mips with '-O -g'
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
X-List-Received-Date: Fri, 30 May 2014 02:20:27 -0000
Content-Type: text/plain

Hit a ICE and could reduce it to the following minimal example:

1. Only the size of array assigned with 2 caused the issue:
$ cat > mipgcc-test.c << END

int main (int argc, char **argv)
{
        char *pStrArry[ARRAY_SIZE_MAX] = {"hello"};
        int i = 0;

        while(pStrArry[i] && i<ARRAY_SIZE_MAX)
        {
                printf("%s\n", pStrArry[i]);
                i++;
        }

        return 0;
}

END

2. Only -O1 and -g on mips caused the issue:
$ mips-poky-linux-gcc -O1 -g -o mipgcc-test mipgcc-test.c
mipgcc-test.c: In function 'main':
mipgcc-test.c:18:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:20810
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions

[YOCTO #6034]

3. The quick workround is trying to enlarge the size of array with larger
than 2.

4. File a bug to GNU, but it could not be reproduced on there environment.
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...x-ICE-failure-on-mips-with-option-O-and-g.patch | 71 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch

diff --git a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch b/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
new file mode 100644
index 0000000..56c591f
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
@@ -0,0 +1,71 @@
+tests/bench-slope.c: workaround ICE failure on mips with '-O -g'
+
+Hit a ICE and could reduce it to the following minimal example:
+
+1. Only the size of array assigned with 2 caused the issue:
+$ cat > mipgcc-test.c << END
+
+int main (int argc, char **argv)
+{
+        char *pStrArry[ARRAY_SIZE_MAX] = {"hello"};
+        int i = 0;
+
+        while(pStrArry[i] && i<ARRAY_SIZE_MAX)
+        {
+                printf("%s\n", pStrArry[i]);
+                i++;
+        }
+
+        return 0;
+}
+
+END
+
+2. Only -O1 and -g on mips caused the issue:
+$ mips-poky-linux-gcc -O1 -g -o mipgcc-test mipgcc-test.c
+mipgcc-test.c: In function 'main':
+mipgcc-test.c:18:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:20810
+ }
+ ^
+Please submit a full bug report,
+with preprocessed source if appropriate.
+See <http://gcc.gnu.org/bugs.html> for instructions
+
+3. The quick workround is trying to enlarge the size of array with larger
+than 2.
+
+4. File a bug to GNU, but it could not be reproduced on there environment.
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643
+
+Upstream-Status: [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/bench-slope.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/bench-slope.c b/tests/bench-slope.c
+index bd05064..28c2438 100644
+--- a/tests/bench-slope.c
++++ b/tests/bench-slope.c
+@@ -1197,7 +1197,7 @@ static struct bench_ops hash_ops = {
+ };
+ 
+ 
+-static struct bench_hash_mode hash_modes[] = {
++static struct bench_hash_mode hash_modes[3] = {
+   {"", &hash_ops},
+   {0},
+ };
+@@ -1349,7 +1349,7 @@ static struct bench_ops mac_ops = {
+ };
+ 
+ 
+-static struct bench_mac_mode mac_modes[] = {
++static struct bench_mac_mode mac_modes[3] = {
+   {"", &mac_ops},
+   {0},
+ };
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 724bf3d..0f143a6 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -12,7 +12,9 @@ DEPENDS = "libgpg-error libcap"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
-           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch"
+           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
+           file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
+"
 
 inherit autotools-brokensep texinfo binconfig pkgconfig
 
-- 
1.8.1.2


