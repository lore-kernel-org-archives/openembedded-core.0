Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id B27A16B09C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:29:22 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 269E0A62D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 09:29:18 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 09:29:15 +0200
Message-Id: <1373354955-16500-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1373354955-16500-1-git-send-email-eric@eukrea.com>
References: <1373354955-16500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [danny][PATCH 3/3] binutils: fix build with recent texinfo (5.1)
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
X-List-Received-Date: Tue, 09 Jul 2013 07:29:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc   |    1 +
 .../binutils/binutils/texinfo.patch                |  294 ++++++++++++++++++++
 2 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/texinfo.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index 9697242..d0415d4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://0144-timer.cc-include-unistd.h.patch \
      file://0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch \
      file://0182-PR-ld-13991.patch \
+     file://texinfo.patch \
      "
 
 SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
diff --git a/meta/recipes-devtools/binutils/binutils/texinfo.patch b/meta/recipes-devtools/binutils/binutils/texinfo.patch
new file mode 100644
index 0000000..4613fdd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/texinfo.patch
@@ -0,0 +1,294 @@
+From: Alberto Garcia <agarcia@igalia.com>
+Bug-Debian: http://bugs.debian.org/704586
+Description: Fix FTBFS with texinfo 5
+ This patch combines changes from the following commits from the
+ upstream git repository: baf8679, 935f854, f0fa19a and 2cfdb6d, by
+ Nick Clifton and Andreas Schwab.
+
+Upstream-Status: Backport
+
+Index: binutils-2.22/ld/ld.texinfo
+===================================================================
+--- binutils-2.22.orig/ld/ld.texinfo
++++ binutils-2.22/ld/ld.texinfo
+@@ -7778,7 +7778,7 @@ If you have more than one @code{SECT} st
+ @printindex cp
+ 
+ @tex
+-% I think something like @colophon should be in texinfo.  In the
++% I think something like @@colophon should be in texinfo.  In the
+ % meantime:
+ \long\def\colophon{\hbox to0pt{}\vfill
+ \centerline{The body of this manual is set in}
+@@ -7789,7 +7789,7 @@ If you have more than one @code{SECT} st
+ \centerline{{\sl\fontname\tensl\/}}
+ \centerline{are used for emphasis.}\vfill}
+ \page\colophon
+-% Blame: doc@cygnus.com, 28mar91.
++% Blame: doc@@cygnus.com, 28mar91.
+ @end tex
+ 
+ @bye
+Index: binutils-2.22/gas/doc/c-arc.texi
+===================================================================
+--- binutils-2.22.orig/gas/doc/c-arc.texi
++++ binutils-2.22/gas/doc/c-arc.texi
+@@ -220,7 +220,7 @@ The extension instructions are not macro
+ encodings for use of these instructions according to the specification
+ by the user.  The parameters are:
+ 
+-@table @bullet
++@itemize @bullet
+ @item @var{name}
+ Name of the extension instruction 
+ 
+@@ -279,7 +279,7 @@ code were: inst 0,r1,r2.  You use OP1_IM
+ with SYNTAX_20P.
+ 
+ @end itemize 
+-@end table
++@end itemize
+ 
+ For example, defining 64-bit multiplier with immediate operands:
+ 
+Index: binutils-2.22/gas/doc/c-arm.texi
+===================================================================
+--- binutils-2.22.orig/gas/doc/c-arm.texi
++++ binutils-2.22/gas/doc/c-arm.texi
+@@ -380,7 +380,7 @@ ARM and THUMB instructions had their own
+ @code{unified} syntax, which can be selected via the @code{.syntax}
+ directive, and has the following main features:
+ 
+-@table @bullet
++@itemize @bullet
+ @item
+ Immediate operands do not require a @code{#} prefix.
+ 
+@@ -405,7 +405,7 @@ The @code{.N} and @code{.W} suffixes are
+ @item
+ All instructions set the flags if and only if they have an @code{s}
+ affix.
+-@end table
++@end itemize
+ 
+ @node ARM-Chars
+ @subsection Special Characters
+@@ -441,28 +441,6 @@ Either @samp{#} or @samp{$} can be used
+ @cindex register names, ARM
+ *TODO* Explain about ARM register naming, and the predefined names.
+ 
+-@node ARM-Neon-Alignment
+-@subsection NEON Alignment Specifiers
+-
+-@cindex alignment for NEON instructions
+-Some NEON load/store instructions allow an optional address
+-alignment qualifier.
+-The ARM documentation specifies that this is indicated by
+-@samp{@@ @var{align}}. However GAS already interprets
+-the @samp{@@} character as a "line comment" start,
+-so @samp{: @var{align}} is used instead.  For example:
+-
+-@smallexample
+-        vld1.8 @{q0@}, [r0, :128]
+-@end smallexample
+-
+-@node ARM Floating Point
+-@section Floating Point
+-
+-@cindex floating point, ARM (@sc{ieee})
+-@cindex ARM floating point (@sc{ieee})
+-The ARM family uses @sc{ieee} floating-point numbers.
+-
+ @node ARM-Relocations
+ @subsection ARM relocation generation
+ 
+@@ -507,6 +485,28 @@ respectively.  For example to load the 3
+         MOVT r0, #:upper16:foo
+ @end smallexample
+ 
++@node ARM-Neon-Alignment
++@subsection NEON Alignment Specifiers
++
++@cindex alignment for NEON instructions
++Some NEON load/store instructions allow an optional address
++alignment qualifier.
++The ARM documentation specifies that this is indicated by
++@samp{@@ @var{align}}. However GAS already interprets
++the @samp{@@} character as a "line comment" start,
++so @samp{: @var{align}} is used instead.  For example:
++
++@smallexample
++        vld1.8 @{q0@}, [r0, :128]
++@end smallexample
++
++@node ARM Floating Point
++@section Floating Point
++
++@cindex floating point, ARM (@sc{ieee})
++@cindex ARM floating point (@sc{ieee})
++The ARM family uses @sc{ieee} floating-point numbers.
++
+ @node ARM Directives
+ @section ARM Machine Directives
+ 
+Index: binutils-2.22/gas/doc/c-mips.texi
+===================================================================
+--- binutils-2.22.orig/gas/doc/c-mips.texi
++++ binutils-2.22/gas/doc/c-mips.texi
+@@ -234,7 +234,7 @@ the @samp{mad} and @samp{madu} instructi
+ instructions around accesses to the @samp{HI} and @samp{LO} registers.
+ @samp{-no-m4650} turns off this option.
+ 
+-@itemx -m3900
++@item -m3900
+ @itemx -no-m3900
+ @itemx -m4100
+ @itemx -no-m4100
+Index: binutils-2.22/gas/doc/c-score.texi
+===================================================================
+--- binutils-2.22.orig/gas/doc/c-score.texi
++++ binutils-2.22/gas/doc/c-score.texi
+@@ -37,7 +37,7 @@ implicitly with the @code{gp} register.
+ @item -EB
+ Assemble code for a big-endian cpu
+ 
+-@itemx -EL
++@item -EL
+ Assemble code for a little-endian cpu
+ 
+ @item -FIXDD 
+@@ -49,13 +49,13 @@ Assemble code for no warning message for
+ @item -SCORE5
+ Assemble code for target is SCORE5
+ 
+-@itemx -SCORE5U
++@item -SCORE5U
+ Assemble code for target is SCORE5U
+ 
+-@itemx -SCORE7
++@item -SCORE7
+ Assemble code for target is SCORE7, this is default setting
+ 
+-@itemx -SCORE3
++@item -SCORE3
+ Assemble code for target is SCORE3
+ 
+ @item -march=score7
+Index: binutils-2.22/gas/doc/c-tic54x.texi
+===================================================================
+--- binutils-2.22.orig/gas/doc/c-tic54x.texi
++++ binutils-2.22/gas/doc/c-tic54x.texi
+@@ -109,7 +109,7 @@ In this example, x is replaced with SYM2
+ is replaced with x.  At this point, x has already been encountered
+ and the substitution stops.
+ 
+-@smallexample @code
++@smallexample
+  .asg   "x",SYM1 
+  .asg   "SYM1",SYM2
+  .asg   "SYM2",x
+@@ -126,14 +126,14 @@ Substitution may be forced in situations
+ ambiguous by placing colons on either side of the subsym.  The following
+ code: 
+ 
+-@smallexample @code
++@smallexample
+  .eval  "10",x
+ LAB:X:  add     #x, a
+ @end smallexample
+ 
+ When assembled becomes:
+ 
+-@smallexample @code
++@smallexample
+ LAB10  add     #10, a
+ @end smallexample
+ 
+@@ -309,7 +309,7 @@ The @code{LDX} pseudo-op is provided for
+ of a label or address.  For example, if an address @code{_label} resides
+ in extended program memory, the value of @code{_label} may be loaded as
+ follows:
+-@smallexample @code
++@smallexample
+  ldx     #_label,16,a    ; loads extended bits of _label
+  or      #_label,a       ; loads lower 16 bits of _label
+  bacc    a               ; full address is in accumulator A
+@@ -345,7 +345,7 @@ Assign @var{name} the string @var{string
+ performed on @var{string} before assignment.
+ 
+ @cindex @code{eval} directive, TIC54X
+-@itemx .eval @var{string}, @var{name}
++@item .eval @var{string}, @var{name}
+ Evaluate the contents of string @var{string} and assign the result as a
+ string to the subsym @var{name}.  String replacement is performed on
+ @var{string} before assignment. 
+Index: binutils-2.22/bfd/doc/bfd.texinfo
+===================================================================
+--- binutils-2.22.orig/bfd/doc/bfd.texinfo
++++ binutils-2.22/bfd/doc/bfd.texinfo
+@@ -322,7 +322,7 @@ All of BFD lives in one directory.
+ @printindex cp
+ 
+ @tex
+-% I think something like @colophon should be in texinfo.  In the
++% I think something like @@colophon should be in texinfo.  In the
+ % meantime:
+ \long\def\colophon{\hbox to0pt{}\vfill
+ \centerline{The body of this manual is set in}
+@@ -333,7 +333,7 @@ All of BFD lives in one directory.
+ \centerline{{\sl\fontname\tensl\/}}
+ \centerline{are used for emphasis.}\vfill}
+ \page\colophon
+-% Blame: doc@cygnus.com, 28mar91.
++% Blame: doc@@cygnus.com, 28mar91.
+ @end tex
+ 
+ @bye
+Index: binutils-2.22/binutils/doc/binutils.texi
+===================================================================
+--- binutils-2.22.orig/binutils/doc/binutils.texi
++++ binutils-2.22/binutils/doc/binutils.texi
+@@ -4269,7 +4269,7 @@ equivalent. At least one of the @option{
+ 
+ @table @env
+ 
+-@itemx --input-mach=@var{machine}
++@item --input-mach=@var{machine}
+ Set the matching input ELF machine type to @var{machine}.  If
+ @option{--input-mach} isn't specified, it will match any ELF
+ machine types.
+@@ -4277,21 +4277,21 @@ machine types.
+ The supported ELF machine types are, @var{L1OM}, @var{K1OM} and
+ @var{x86-64}.
+ 
+-@itemx --output-mach=@var{machine}
++@item --output-mach=@var{machine}
+ Change the ELF machine type in the ELF header to @var{machine}.  The
+ supported ELF machine types are the same as @option{--input-mach}.
+ 
+-@itemx --input-type=@var{type}
++@item --input-type=@var{type}
+ Set the matching input ELF file type to @var{type}.  If
+ @option{--input-type} isn't specified, it will match any ELF file types.
+ 
+ The supported ELF file types are, @var{rel}, @var{exec} and @var{dyn}.
+ 
+-@itemx --output-type=@var{type}
++@item --output-type=@var{type}
+ Change the ELF file type in the ELF header to @var{type}.  The
+ supported ELF types are the same as @option{--input-type}.
+ 
+-@itemx --input-osabi=@var{osabi}
++@item --input-osabi=@var{osabi}
+ Set the matching input ELF file OSABI to @var{osabi}.  If
+ @option{--input-osabi} isn't specified, it will match any ELF OSABIs.
+ 
+@@ -4301,7 +4301,7 @@ The supported ELF OSABIs are, @var{none}
+ @var{FreeBSD}, @var{TRU64}, @var{Modesto}, @var{OpenBSD}, @var{OpenVMS},
+ @var{NSK}, @var{AROS} and @var{FenixOS}.
+ 
+-@itemx --output-osabi=@var{osabi}
++@item --output-osabi=@var{osabi}
+ Change the ELF OSABI in the ELF header to @var{osabi}.  The
+ supported ELF OSABI are the same as @option{--input-osabi}.
+ 
-- 
1.7.10.4


