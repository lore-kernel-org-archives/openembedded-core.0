Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 73ACF78332
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 462DE20C21;
	Mon, 27 Nov 2017 11:39:52 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=uvzWLATj+Rtp7qtLrQojSDVcIDOCJVBSCRYbvvJb62M=; b=kWSmGMHR
	b+99upltL9c34UZvL9WPpnNtsfPM+EZBhoDb060Y/v0ketFZkq8U2GKZ29XXv6w2
	swwqawuyeAj8c8jBKdUJzBZ8UYVkvvXnw3WStMFqaBpeo3SiLaTu7jMp1AyyG26u
	zkyTGfkd9yAsAPBUPzbzTyy/WR2ebZ7BubPcTa/o2dz/2lUlY0L7m8qFmeoBoSTS
	W0L4WX0wSEUYbDLwntwrLsls2eIUT+1Nfz5IVkWEntJxxpV91wTryQL4m1vktVz7
	aTDkNjLHg1Gj+aD/WODWQvmKZqBnd19cs0woXhdYg67gU0b3VxDC3ON5T82/cL7k
	BPyun5dzATusmg==
X-ME-Sender: <xms:2D8cWqCObeMjdDeQLvK2AUHbqICH2eoJElnDC4vnNDJRevPVBvG5Ig>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 816317F813;
	Mon, 27 Nov 2017 11:39:51 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:33 +0200
Message-Id: <20171127163934.31597-6-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 5/6] alsa-tools: 1.1.3 -> 1.1.5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:10 -0000

Changes:
http://www.alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.5

Rebased autotools.patch and makefile_no_gtk.patch.

Dropped 0001-as10k1-Make-output_tram_line-static-inline.patch with the
assumption that it's not needed any more. The patch added a "static"
qualifier to a function. According to the commit message, this was done
to improve optimization. Upstream removed the "inline" qualifier from
that same function, because it caused some trouble with clang. My guess
is that the patch author actually ran into the same clang problem as
upstream, but came up with a different fix. It doesn't seem like a
function whose optimization anyone would really be interested in.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---

Khem, I added you to Cc in case you don't want the as10k1 patch to be
removed.

 ...s10k1-Make-output_tram_line-static-inline.patch | 31 ----------------------
 .../alsa/alsa-tools/autotools.patch                |  2 +-
 .../alsa/alsa-tools/makefile_no_gtk.patch          |  2 +-
 .../{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb}   |  5 ++--
 4 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
deleted file mode 100644
index d049a30d2c..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1e5926df74a35fe2cd90bc59f5264a8715c94048 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Sep 2015 08:16:59 +0000
-Subject: [PATCH] as10k1: Make output_tram_line() static inline
-
-The function is not used in any other file, its better to make it static
-inline so compiler has a better chance of optimizing here
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- as10k1/as10k1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/as10k1/as10k1.c b/as10k1/as10k1.c
-index 96af0c3..d0766fd 100644
---- a/as10k1/as10k1.c
-+++ b/as10k1/as10k1.c
-@@ -366,7 +366,7 @@ void as_exit(const char *message)
- 	exit(1);
- }
- 
--inline void output_tram_line( struct list_head *line_head, int type){
-+static inline void output_tram_line( struct list_head *line_head, int type){
-         
-         struct tram *tram_sym;
-         struct list_head *entry;
--- 
-2.5.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 319f25d27a..2e74963c89 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -20,7 +20,7 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
 +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
 @@ -1,8 +1,8 @@
- VERSION = 1.1.0
+ VERSION = 1.1.5
  TOP = .
 -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
 +SUBDIRS = as10k1 envy24control \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index 9bd6848eda..54373d1a8f 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -14,7 +14,7 @@ index 2457a1c..72346d9 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,9 +1,9 @@
- VERSION = 1.1.0
+ VERSION = 1.1.5
  TOP = .
 -SUBDIRS = as10k1 envy24control \
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
index 9e97c0e969..1be43aa6e7 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
@@ -12,11 +12,10 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://autotools.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
            file://gitcompile_hdajacksensetest \
-           file://0001-as10k1-Make-output_tram_line-static-inline.patch \
            "
 
-SRC_URI[md5sum] = "b23eaae687d55410b92587c2053b301f"
-SRC_URI[sha256sum] = "d88f1dcd6872121383eded5fa24e328e68c54e527db4547e1435d5eabc2b6709"
+SRC_URI[md5sum] = "3afb92eb1b4f2edc8691498e57c3ec78"
+SRC_URI[sha256sum] = "bc3c6567de835223ee7d69487b8c22fb395a2e8c613341b0c96e6a5f6a2bd534"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.14.2


