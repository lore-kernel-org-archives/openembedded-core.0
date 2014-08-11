Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE4165D54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 04:40:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7B4e1dR011673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Aug 2014 21:40:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 10 Aug 2014 21:40:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 12:39:53 +0800
Message-ID: <9a4390c1c7a016bdaa3c7dfad75ea62ab0893d4d.1407731782.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407731782.git.hongxu.jia@windriver.com>
References: <cover.1407731782.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] puzzles: fix do_compile failed when DEBUG_BUILD
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
X-List-Received-Date: Mon, 11 Aug 2014 04:40:04 -0000
Content-Type: text/plain

There were compiling failure with option -g -O
...
././gtk.c: In function 'configure_area':
././gtk.c:397:2: error: 'cr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  cairo_set_source_rgb(cr,
  ^
././gtk.c:384:14: note: 'cr' was declared here
     cairo_t *cr;
              ^
././gtk.c: In function 'main':
././gtk.c:2911:6: error: 'error' may be used uninitialized in this function [-Werror=maybe-uninitialized]
      fprintf(stderr, "%s: %s\n", pname, error);
      ^
cc1: all warnings being treated as errors
...

Initialized the pointers 'cr' and 'error' with NULL

[YOCTO #6410]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-compiling-failure-with-option-g-O.patch    | 52 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch

diff --git a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
new file mode 100644
index 0000000..d246fee
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
@@ -0,0 +1,52 @@
+gtk.c: fix compiling failure with option -g -O
+
+There were compiling failure with option -g -O
+...
+././gtk.c: In function 'configure_area':
+././gtk.c:397:2: error: 'cr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  cairo_set_source_rgb(cr,
+  ^
+././gtk.c:384:14: note: 'cr' was declared here
+     cairo_t *cr;
+              ^
+././gtk.c: In function 'main':
+././gtk.c:2911:6: error: 'error' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+      fprintf(stderr, "%s: %s\n", pname, error);
+      ^
+cc1: all warnings being treated as errors
+...
+
+Initialized pointer 'cr' and 'error' with NULL
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gtk.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gtk.c b/gtk.c
+index a2eba2c..c54bf63 100644
+--- a/gtk.c
++++ b/gtk.c
+@@ -381,7 +381,7 @@ static void clear_backing_store(frontend *fe)
+ 
+ static void setup_backing_store(frontend *fe)
+ {
+-    cairo_t *cr;
++    cairo_t *cr = NULL;
+     int i;
+ 
+     fe->pixmap = gdk_pixmap_new(fe->area->window, fe->pw, fe->ph, -1);
+@@ -2481,7 +2481,7 @@ char *fgetline(FILE *fp)
+ int main(int argc, char **argv)
+ {
+     char *pname = argv[0];
+-    char *error;
++    char *error = NULL;
+     int ngenerate = 0, print = FALSE, px = 1, py = 1;
+     int time_generation = FALSE, test_solve = FALSE, list_presets = FALSE;
+     int soln = FALSE, colour = FALSE;
+-- 
+1.9.1
+
diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10116.bb
index ef5392b..6ee4d96 100644
--- a/meta/recipes-sato/puzzles/puzzles_r10116.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r10116.bb
@@ -7,7 +7,9 @@ MOD_PV = "${@d.getVar('PV',1)[1:]}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV} \
+           file://fix-compiling-failure-with-option-g-O.patch \
+"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
1.9.1


