Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5AB71A36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 14:42:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0BEfFIZ026717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 Jan 2018 14:41:17 GMT
Message-ID: <1515681675.29722.118.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 14:41:15 +0000
In-Reply-To: <1515640552-54778-1-git-send-email-denis@denix.org>
References: <1515640552-54778-1-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] gcc: add flex-native explicit dependency
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
X-List-Received-Date: Thu, 11 Jan 2018 14:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-10 at 22:15 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> It seems flex is required to build gcc:
> 
> > 
> > .../work-shared/gcc-7.2.0-r0/gcc-7.2.0/missing: line 81: flex:
> > command not found
> > WARNING: 'flex' is missing on your system.
> >          You should only need it if you modified a '.l' file.
> >          You may want to install the Fast Lexical Analyzer package:
> >          <http://flex.sourceforge.net/>
> > Makefile:2799: recipe for target 'gengtype-lex.c' failed
> > make[1]: [gengtype-lex.c] Error 127 (ignored)
> Normally this is handled indirectly throught binutils-cross
> dependency
> pulling in flex-native implicitly. For deterministic builds, this
> should
> be specified explicitly.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-
> devtools/gcc/gcc-7.2.inc
> index 1d40cba..d1fb6de 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -10,7 +10,7 @@ BINV = "7.2.0"
>  
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-
> 7.2/backport:"
>  
> -DEPENDS =+ "mpfr gmp libmpc zlib"
> +DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>  
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"

Agreed, however I think we have bigger problems. I'm testing with this:

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 65f51430ee2..a5c4a73963e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -921,6 +921,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
         return True
 
+
+    if taskdependees[task][1] == 'do_populate_sysroot':
+        if taskdependees[task][0] == "flex-native" or taskdependees[task][0] == "bison-native":
+            #bb.warn("Skipping %s" % str(taskdependees[dep]))
+            bb.warn("Skipping")
+            return True
+
     # We only need to trigger packagedata through direct dependencies
     # but need to preserve packagedata on packagedata links
     if taskdependees[task][1] == "do_packagedata":


and test results so far imply that we need:

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 1d40cba7317..90e4a990cb3 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -11,7 +11,7 @@ BINV = "7.2.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 

probably in addition to your patch. I'll continue to run some test
builds and see how much breakage the above change shows up.

Cheers,

Richard






