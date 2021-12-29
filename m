Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88951C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 09:14:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.48941.1640769245493475908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 01:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MsweitYO;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id h1so12234864pls.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RW9kaf0Tsffs5kihBLGsi2rqr20ODbLt9zHgkUj5EwY=;
        b=MsweitYOcUlhXoIVJAtq5oSKE0TEChwqRjp9T2hbHW3ndAXGjNv/rDLFP0i93anH1/
         /kGS+BB8we6ktUboRZ2NsWVEpKzZ1sVY4Ie+0JclLesqeLFIm68fNa1xBgSIgMLvNaZw
         53eLfKdiklmtblICE3g5Dubsgj3ozDwudzMGHp3Hs2HQoW8KbXVCp9V7nEmDZoQqCJPK
         GpUYO5n+FQQ0uS1DEoJ9Ms5i9lK+n4nuYHgk8UccqwpNtTJgr7tJpj6bD6cyBc1v3+ou
         wUy8DCR+vNOEnASjWDzbbCI+YH+V6d80YZya7qnp5tKs9htlbNdADXjh1FQqmwRYu3K3
         Rwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RW9kaf0Tsffs5kihBLGsi2rqr20ODbLt9zHgkUj5EwY=;
        b=NcjRfDVyn4jB73DBAhjcb189Ykz9QmcJumuvAotMlmHRRAa03N0Fu6ihVFXo9UtyPN
         CuiZDbn7Y1XQbGB2Kx3OTNlGrD6LKqexyYo5t8oHGl9WHMIGgqJ/7UXx7P2uauEU90y3
         1SN1DbQKvRydAbnGToo9LoarRoXx6HuR7h6Df4sZ+TiRO0kYCu5IdCAuFS5Jj7qQI5DV
         m8jBpqm1RDaIM6TnYCZ7yiTziwHnf6ghqeYA24MPrSUUZBFQo31B0Saq0qXflwCYNiA2
         NHqt1DeG8KUrPfw7LFDYeYK6taPYmcJ01ZYyW46K1GvD38wCJ6OCglsLtZ+AL73ijvAh
         vyiQ==
X-Gm-Message-State: AOAM533PkTDcv1GV4fDEnmvcifz9hExsU6oQ+dXf4i6beWBaEST7I1Tf
	vFZxLOJ5/x75jbfHhCMkBgiOW189Pf+5Tw==
X-Google-Smtp-Source: 
 ABdhPJzdMp0k/2U5JdpRw3ozCLMSKC8nQmHA9FpsrR9CzojNbeZt1UHFfrIQ8v9fLsxD3/NHLqwHKg==
X-Received: by 2002:a17:90a:4002:: with SMTP id
 u2mr31165854pjc.115.1640769242663;
        Wed, 29 Dec 2021 01:14:02 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 f10sm23858873pfe.187.2021.12.29.01.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 01:14:02 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH] gcc: Fix CVE-2021-42574
Date: Wed, 29 Dec 2021 01:13:47 -0800
Message-Id: <20211229091347.42742-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=Y
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 09:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160049

Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;=
h=3D004bb936d6d5f177af26ad4905595e843d5665a5]
Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;=
h=3Dbd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;=
h=3D51c500269bf53749b107807d84271385fad35628]
Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;=
h=3D1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;=
h=3Dbef32d4a28595e933f24fef378cf052a30b674a7]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |    5 +
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2906 +++++++++++++++++
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 2270 +++++++++++++
 .../gcc/gcc/0003-CVE-2021-42574.patch         | 1724 ++++++++++
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  138 +
 .../gcc/gcc/0005-CVE-2021-42574.patch         |  575 ++++
 6 files changed, 7618 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0005-CVE-2021-42574.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools=
/gcc/gcc-10.2.inc
index 5626bf20f0..fd7f16d7bf 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,11 @@ SRC_URI =3D "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0001-CVE-2021-42574.patch \
+           file://0002-CVE-2021-42574.patch \
+           file://0003-CVE-2021-42574.patch \
+           file://0004-CVE-2021-42574.patch \
+           file://0005-CVE-2021-42574.patch \
 "
 SRC_URI[sha256sum] =3D "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff14=
6c855fe16c1d8c"
=20
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch b/meta=
/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
new file mode 100644
index 0000000000..e0f4f7d32f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
@@ -0,0 +1,2906 @@
+From 004bb936d6d5f177af26ad4905595e843d5665a5 Mon Sep 17 00:00:00 2001
+From: Lewis Hyatt <lhyatt@gmail.com>
+Date: Tue, 14 Jul 2020 12:05:56 -0400
+Subject: [PATCH] diagnostics: Support conversion of tabs to spaces [PR4997=
3]
+ [PR86904]
+
+Supports conversion of tabs to spaces when outputting diagnostics. Also
+adds -fdiagnostics-column-unit and -fdiagnostics-column-origin options to
+control how the column number is output, thereby resolving the two PRs.
+
+gcc/c-family/ChangeLog:
+
+	PR other/86904
+	* c-indentation.c (should_warn_for_misleading_indentation): Get
+	global tabstop from the new source.
+	* c-opts.c (c_common_handle_option): Remove handling of -ftabstop, which
+	is now a common option.
+	* c.opt: Likewise.
+
+gcc/ChangeLog:
+
+	PR preprocessor/49973
+	PR other/86904
+	* common.opt: Handle -ftabstop here instead of in c-family
+	options.  Add -fdiagnostics-column-unit=3D and
+	-fdiagnostics-column-origin=3D options.
+	* opts.c (common_handle_option): Handle the new options.
+	* diagnostic-format-json.cc (json_from_expanded_location): Add
+	diagnostic_context argument.  Use it to convert column numbers as per
+	the new options.
+	(json_from_location_range): Likewise.
+	(json_from_fixit_hint): Likewise.
+	(json_end_diagnostic): Pass the new context argument to helper
+	functions above.  Add "column-origin" field to the output.
+	(test_unknown_location): Add the new context argument to calls to
+	helper functions.
+	(test_bad_endpoints): Likewise.
+	* diagnostic-show-locus.c
+	(exploc_with_display_col::exploc_with_display_col): Support
+	tabstop parameter.
+	(layout_point::layout_point): Make use of class
+	exploc_with_display_col.
+	(layout_range::layout_range): Likewise.
+	(struct line_bounds): Clarify that the units are now always
+	display columns.  Rename members accordingly.  Add constructor.
+	(layout::print_source_line): Add support for tab expansion.
+	(make_range): Adapt to class layout_range changes.
+	(layout::maybe_add_location_range): Likewise.
+	(layout::layout): Adapt to class exploc_with_display_col changes.
+	(layout::calculate_x_offset_display): Support tabstop parameter.
+	(layout::print_annotation_line): Adapt to struct line_bounds changes.
+	(layout::print_line): Likewise.
+	(line_label::line_label): Add diagnostic_context argument.
+	(get_affected_range): Likewise.
+	(get_printed_columns): Likewise.
+	(layout::print_any_labels): Adapt to struct line_label changes.
+	(class correction): Add m_tabstop member.
+	(correction::correction): Add tabstop argument.
+	(correction::compute_display_cols): Use m_tabstop.
+	(class line_corrections): Add m_context member.
+	(line_corrections::line_corrections): Add diagnostic_context argument.
+	(line_corrections::add_hint): Use m_context to handle tabstops.
+	(layout::print_trailing_fixits): Adapt to class line_corrections
+	changes.
+	(test_layout_x_offset_display_utf8): Support tabstop parameter.
+	(test_layout_x_offset_display_tab): New selftest.
+	(test_one_liner_colorized_utf8): Likewise.
+	(test_tab_expansion): Likewise.
+	(test_diagnostic_show_locus_one_liner_utf8): Call the new tests.
+	(diagnostic_show_locus_c_tests): Likewise.
+	(test_overlapped_fixit_printing): Adapt to helper class and
+	function changes.
+	(test_overlapped_fixit_printing_utf8): Likewise.
+	(test_overlapped_fixit_printing_2): Likewise.
+	* diagnostic.h (enum diagnostics_column_unit): New enum.
+	(struct diagnostic_context): Add members for the new options.
+	(diagnostic_converted_column): Declare.
+	(json_from_expanded_location): Add new context argument.
+	* diagnostic.c (diagnostic_initialize): Initialize new members.
+	(diagnostic_converted_column): New function.
+	(maybe_line_and_column): Be willing to output a column of 0.
+	(diagnostic_get_location_text): Convert column number as per the new
+	options.
+	(diagnostic_report_current_module): Likewise.
+	(assert_location_text): Add origin and column_unit arguments for
+	testing the new functionality.
+	(test_diagnostic_get_location_text): Test the new functionality.
+	* doc/invoke.texi: Document the new options and behavior.
+	* input.h (location_compute_display_column): Add tabstop argument.
+	* input.c (location_compute_display_column): Likewise.
+	(test_cpp_utf8): Add selftests for tab expansion.
+	* tree-diagnostic-path.cc (default_tree_make_json_for_path): Pass the
+	new context argument to json_from_expanded_location().
+
+libcpp/ChangeLog:
+
+	PR preprocessor/49973
+	PR other/86904
+	* include/cpplib.h (struct cpp_options):  Removed support for -ftabstop,
+	which is now handled by diagnostic_context.
+	(class cpp_display_width_computation): New class.
+	(cpp_byte_column_to_display_column): Add optional tabstop argument.
+	(cpp_display_width): Likewise.
+	(cpp_display_column_to_byte_column): Likewise.
+	* charset.c
+	(cpp_display_width_computation::cpp_display_width_computation): New
+	function.
+	(cpp_display_width_computation::advance_display_cols): Likewise.
+	(compute_next_display_width): Removed and implemented this
+	functionality in a new function...
+	(cpp_display_width_computation::process_next_codepoint): ...here.
+	(cpp_byte_column_to_display_column): Added tabstop argument.
+	Reimplemented in terms of class cpp_display_width_computation.
+	(cpp_display_column_to_byte_column): Likewise.
+	* init.c (cpp_create_reader): Remove handling of -ftabstop, which is now
+	handled by diagnostic_context.
+
+gcc/testsuite/ChangeLog:
+
+	PR preprocessor/49973
+	PR other/86904
+	* c-c++-common/Wmisleading-indentation-3.c: Adjust expected output
+	for new defaults.
+	* c-c++-common/Wmisleading-indentation.c: Likewise.
+	* c-c++-common/diagnostic-format-json-1.c: Likewise.
+	* c-c++-common/diagnostic-format-json-2.c: Likewise.
+	* c-c++-common/diagnostic-format-json-3.c: Likewise.
+	* c-c++-common/diagnostic-format-json-4.c: Likewise.
+	* c-c++-common/diagnostic-format-json-5.c: Likewise.
+	* c-c++-common/missing-close-symbol.c: Likewise.
+	* g++.dg/diagnostic/bad-binary-ops.C: Likewise.
+	* g++.dg/parse/error4.C: Likewise.
+	* g++.old-deja/g++.brendan/crash11.C: Likewise.
+	* g++.old-deja/g++.pt/overload2.C: Likewise.
+	* g++.old-deja/g++.robertl/eb109.C: Likewise.
+	* gcc.dg/analyzer/malloc-paths-9.c: Likewise.
+	* gcc.dg/bad-binary-ops.c: Likewise.
+	* gcc.dg/format/branch-1.c: Likewise.
+	* gcc.dg/format/pr79210.c: Likewise.
+	* gcc.dg/plugin/diagnostic-test-expressions-1.c: Likewise.
+	* gcc.dg/plugin/diagnostic-test-string-literals-1.c: Likewise.
+	* gcc.dg/redecl-4.c: Likewise.
+	* gfortran.dg/diagnostic-format-json-1.F90: Likewise.
+	* gfortran.dg/diagnostic-format-json-2.F90: Likewise.
+	* gfortran.dg/diagnostic-format-json-3.F90: Likewise.
+	* go.dg/arrayclear.go: Add a comment explaining why adding a
+	comment was necessary to work around a dejagnu bug.
+	* c-c++-common/diagnostic-units-1.c: New test.
+	* c-c++-common/diagnostic-units-2.c: New test.
+	* c-c++-common/diagnostic-units-3.c: New test.
+	* c-c++-common/diagnostic-units-4.c: New test.
+	* c-c++-common/diagnostic-units-5.c: New test.
+	* c-c++-common/diagnostic-units-6.c: New test.
+	* c-c++-common/diagnostic-units-7.c: New test.
+	* c-c++-common/diagnostic-units-8.c: New test.
+
+CVE: CVE-2021-42574
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit=
;h=3D004bb936d6d5f177af26ad4905595e843d5665a5]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ gcc/c-family/c-indentation.c                  |   5 +-
+ gcc/c-family/c-opts.c                         |   6 -
+ gcc/c-family/c.opt                            |   4 -
+ gcc/common.opt                                |  21 +
+ gcc/diagnostic-format-json.cc                 |  55 +-
+ gcc/diagnostic-show-locus.c                   | 504 +++++++++++++-----
+ gcc/diagnostic.c                              | 113 +++-
+ gcc/diagnostic.h                              |  28 +-
+ gcc/doc/invoke.texi                           |  68 ++-
+ gcc/input.c                                   |  72 ++-
+ gcc/input.h                                   |   4 +-
+ gcc/opts.c                                    |  14 +
+ .../c-c++-common/Wmisleading-indentation-3.c  |  12 +-
+ .../c-c++-common/Wmisleading-indentation.c    |   6 +-
+ .../c-c++-common/diagnostic-format-json-1.c   |   5 +
+ .../c-c++-common/diagnostic-format-json-2.c   |   5 +
+ .../c-c++-common/diagnostic-format-json-3.c   |   5 +
+ .../c-c++-common/diagnostic-format-json-4.c   |   9 +
+ .../c-c++-common/diagnostic-format-json-5.c   |   9 +
+ .../c-c++-common/diagnostic-units-1.c         |  28 +
+ .../c-c++-common/diagnostic-units-2.c         |  28 +
+ .../c-c++-common/diagnostic-units-3.c         |  28 +
+ .../c-c++-common/diagnostic-units-4.c         |  28 +
+ .../c-c++-common/diagnostic-units-5.c         |  28 +
+ .../c-c++-common/diagnostic-units-6.c         |  28 +
+ .../c-c++-common/diagnostic-units-7.c         |  28 +
+ .../c-c++-common/diagnostic-units-8.c         |  28 +
+ .../c-c++-common/missing-close-symbol.c       |   6 +-
+ .../g++.dg/diagnostic/bad-binary-ops.C        |   8 +-
+ gcc/testsuite/g++.dg/parse/error4.C           |   2 +-
+ .../g++.old-deja/g++.brendan/crash11.C        |   4 +-
+ gcc/testsuite/g++.old-deja/g++.pt/overload2.C |   2 +-
+ .../g++.old-deja/g++.robertl/eb109.C          |   4 +-
+ .../gcc.dg/analyzer/malloc-paths-9.c          |   2 +-
+ gcc/testsuite/gcc.dg/bad-binary-ops.c         |   8 +-
+ gcc/testsuite/gcc.dg/format/branch-1.c        |   2 +-
+ gcc/testsuite/gcc.dg/format/pr79210.c         |   2 +-
+ .../plugin/diagnostic-test-expressions-1.c    |  16 +-
+ .../diagnostic-test-string-literals-1.c       |   4 +-
+ gcc/testsuite/gcc.dg/redecl-4.c               |   2 +-
+ .../gfortran.dg/diagnostic-format-json-1.F90  |   5 +
+ .../gfortran.dg/diagnostic-format-json-2.F90  |   5 +
+ .../gfortran.dg/diagnostic-format-json-3.F90  |   5 +
+ gcc/testsuite/go.dg/arrayclear.go             |   3 +
+ gcc/tree-diagnostic-path.cc                   |   5 +-
+ libcpp/charset.c                              |  98 ++--
+ libcpp/include/cpplib.h                       |  40 +-
+ libcpp/init.c                                 |   1 -
+ 48 files changed, 1106 insertions(+), 287 deletions(-)
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-1.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-2.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-3.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-4.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-5.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-6.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-7.c
+ create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-8.c
+
+diff --git a/gcc/c-family/c-indentation.c b/gcc/c-family/c-indentation.c
+--- a/gcc/c-family/c-indentation.c	2020-07-22 23:35:17.296384022 -0700
++++ b/gcc/c-family/c-indentation.c	2021-12-25 01:20:53.475636694 -0800
+@@ -24,8 +24,7 @@ along with GCC; see the file COPYING3.
+ #include "c-common.h"
+ #include "c-indentation.h"
+ #include "selftest.h"
+-
+-extern cpp_options *cpp_opts;
++#include "diagnostic.h"
+=20
+ /* Round up VIS_COLUMN to nearest tab stop. */
+=20
+@@ -294,7 +293,7 @@ should_warn_for_misleading_indentation (
+   expanded_location next_stmt_exploc =3D expand_location (next_stmt_loc);
+   expanded_location guard_exploc =3D expand_location (guard_loc);
+=20
+-  const unsigned int tab_width =3D cpp_opts->tabstop;
++  const unsigned int tab_width =3D global_dc->tabstop;
+=20
+   /* They must be in the same file.  */
+   if (next_stmt_exploc.file !=3D body_exploc.file)
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+--- a/gcc/c-family/c.opt	2021-12-24 20:23:42.816809230 -0800
++++ b/gcc/c-family/c.opt	2021-12-25 01:20:53.475636694 -0800
+@@ -1876,10 +1876,6 @@ Enum(strong_eval_order) String(some) Val
+ EnumValue
+ Enum(strong_eval_order) String(all) Value(2)
+=20
+-ftabstop=3D
+-C ObjC C++ ObjC++ Joined RejectNegative UInteger
+--ftabstop=3D<number>	Distance between tab stops for column reporting.
+-
+ ftemplate-backtrace-limit=3D
+ C++ ObjC++ Joined RejectNegative UInteger Var(template_backtrace_limit) I=
nit(10)
+ Set the maximum number of template instantiation notes for a single warni=
ng or error.
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+--- a/gcc/c-family/c-opts.c	2021-12-24 20:23:44.824774786 -0800
++++ b/gcc/c-family/c-opts.c	2021-12-25 01:20:53.475636694 -0800
+@@ -504,12 +504,6 @@ c_common_handle_option (size_t scode, co
+ 	cpp_opts->track_macro_expansion =3D 2;
+       break;
+=20
+-    case OPT_ftabstop_:
+-      /* It is documented that we silently ignore silly values.  */
+-      if (value >=3D 1 && value <=3D 100)
+-	cpp_opts->tabstop =3D value;
+-      break;
+-
+     case OPT_fexec_charset_:
+       cpp_opts->narrow_charset =3D arg;
+       break;
+diff --git a/gcc/common.opt b/gcc/common.opt
+--- a/gcc/common.opt	2021-12-24 20:23:42.480814993 -0800
++++ b/gcc/common.opt	2021-12-25 01:20:53.475636694 -0800
+@@ -1325,6 +1325,14 @@ Enum(diagnostic_url_rule) String(always)
+ EnumValue
+ Enum(diagnostic_url_rule) String(auto) Value(DIAGNOSTICS_URL_AUTO)
+=20
++fdiagnostics-column-unit=3D
++Common Joined RejectNegative Enum(diagnostics_column_unit)
++-fdiagnostics-column-unit=3D[display|byte]	Select whether column numbers =
are output as display columns (default) or raw bytes.
++
++fdiagnostics-column-origin=3D
++Common Joined RejectNegative UInteger
++-fdiagnostics-column-origin=3D<number>	Set the number of the first column=
.  The default is 1-based as per GNU style, but some utilities may expect 0=
-based, for example.
++
+ fdiagnostics-format=3D
+ Common Joined RejectNegative Enum(diagnostics_output_format)
+ -fdiagnostics-format=3D[text|json]	Select output format.
+@@ -1334,6 +1342,15 @@ SourceInclude
+ diagnostic.h
+=20
+ Enum
++Name(diagnostics_column_unit) Type(int)
++
++EnumValue
++Enum(diagnostics_column_unit) String(display) Value(DIAGNOSTICS_COLUMN_UN=
IT_DISPLAY)
++
++EnumValue
++Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNIT_=
BYTE)
++
++Enum
+ Name(diagnostics_output_format) Type(int)
+=20
+ EnumValue
+@@ -1362,6 +1379,10 @@ fdiagnostics-path-format=3D
+ Common Joined RejectNegative Var(flag_diagnostics_path_format) Enum(diagn=
ostic_path_format) Init(DPF_INLINE_EVENTS)
+ Specify how to print any control-flow path associated with a diagnostic.
+=20
++ftabstop=3D
++Common Joined RejectNegative UInteger
++-ftabstop=3D<number>      Distance between tab stops for column reporting.
++
+ Enum
+ Name(diagnostic_path_format) Type(int)
+=20
+diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
+--- a/gcc/diagnostic.c	2020-07-22 23:35:17.556386887 -0700
++++ b/gcc/diagnostic.c	2021-12-25 01:23:41.300841207 -0800
+@@ -38,6 +38,7 @@ along with GCC; see the file COPYING3.
+ #include "selftest.h"
+ #include "selftest-diagnostic.h"
+ #include "opts.h"
++#include "cpplib.h"
+=20
+ #ifdef HAVE_TERMIOS_H
+ # include <termios.h>
+@@ -219,6 +220,9 @@ diagnostic_initialize (diagnostic_contex
+   context->min_margin_width =3D 0;
+   context->show_ruler_p =3D false;
+   context->parseable_fixits_p =3D false;
++  context->column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
++  context->column_origin =3D 1;
++  context->tabstop =3D 8;
+   context->edit_context_ptr =3D NULL;
+   context->diagnostic_group_nesting_depth =3D 0;
+   context->diagnostic_group_emission_count =3D 0;
+@@ -353,8 +357,51 @@ diagnostic_get_color_for_kind (diagnosti
+   return diagnostic_kind_color[kind];
+ }
+=20
++/* Given an expanded_location, convert the column (which is in 1-based by=
tes)
++   to the requested units, without converting the origin.
++   Return -1 if the column is invalid (<=3D 0).  */
++
++static int
++convert_column_unit (enum diagnostics_column_unit column_unit,
++		     int tabstop,
++		     expanded_location s)
++{
++  if (s.column <=3D 0)
++    return -1;
++
++  switch (column_unit)
++    {
++    default:
++      gcc_unreachable ();
++
++    case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
++      {
++	cpp_char_column_policy policy (tabstop, cpp_wcwidth);
++	return location_compute_display_column (s, policy);
++      }
++
++    case DIAGNOSTICS_COLUMN_UNIT_BYTE:
++      return s.column;
++    }
++}
++
++/* Given an expanded_location, convert the column (which is in 1-based by=
tes)
++   to the requested units and origin.  Return -1 if the column is
++   invalid (<=3D 0).  */
++int
++diagnostic_converted_column (diagnostic_context *context, expanded_locati=
on s)
++{
++  int one_based_col
++    =3D convert_column_unit (context->column_unit, context->tabstop, s);
++  if (one_based_col <=3D 0)
++    return -1;
++  return one_based_col + (context->column_origin - 1);
++}
++
+ /* Return a formatted line and column ':%line:%column'.  Elided if
+-   zero.  The result is a statically allocated buffer.  */
++   line =3D=3D 0 or col < 0.  (A column of 0 may be valid due to the
++   -fdiagnostics-column-origin option.)
++   The result is a statically allocated buffer.  */
+=20
+ static const char *
+ maybe_line_and_column (int line, int col)
+@@ -363,8 +410,9 @@ maybe_line_and_column (int line, int col
+=20
+   if (line)
+     {
+-      size_t l =3D snprintf (result, sizeof (result),
+-			   col ? ":%d:%d" : ":%d", line, col);
++      size_t l
++	=3D snprintf (result, sizeof (result),
++		    col >=3D 0 ? ":%d:%d" : ":%d", line, col);
+       gcc_checking_assert (l < sizeof (result));
+     }
+   else
+@@ -383,8 +431,14 @@ diagnostic_get_location_text (diagnostic
+   const char *locus_cs =3D colorize_start (pp_show_color (pp), "locus");
+   const char *locus_ce =3D colorize_stop (pp_show_color (pp));
+   const char *file =3D s.file ? s.file : progname;
+-  int line =3D strcmp (file, N_("<built-in>")) ? s.line : 0;
+-  int col =3D context->show_column ? s.column : 0;
++  int line =3D 0;
++  int col =3D -1;
++  if (strcmp (file, N_("<built-in>")))
++    {
++      line =3D s.line;
++      if (context->show_column)
++	col =3D diagnostic_converted_column (context, s);
++    }
+=20
+   const char *line_col =3D maybe_line_and_column (line, col);
+   return build_message_string ("%s%s%s:%s", locus_cs, file,
+@@ -650,14 +704,20 @@ diagnostic_report_current_module (diagno
+       if (! MAIN_FILE_P (map))
+ 	{
+ 	  bool first =3D true;
++	  expanded_location s =3D {};
+ 	  do
+ 	    {
+ 	      where =3D linemap_included_from (map);
+ 	      map =3D linemap_included_from_linemap (line_table, map);
+-	      const char *line_col
+-		=3D maybe_line_and_column (SOURCE_LINE (map, where),
+-					 first && context->show_column
+-					 ? SOURCE_COLUMN (map, where) : 0);
++	      s.file =3D LINEMAP_FILE (map);
++	      s.line =3D SOURCE_LINE (map, where);
++	      int col =3D -1;
++	      if (first && context->show_column)
++		{
++		  s.column =3D SOURCE_COLUMN (map, where);
++		  col =3D diagnostic_converted_column (context, s);
++		}
++	      const char *line_col =3D maybe_line_and_column (s.line, col);
+ 	      static const char *const msgs[] =3D
+ 		{
+ 		 N_("In file included from"),
+@@ -666,7 +726,7 @@ diagnostic_report_current_module (diagno
+ 	      unsigned index =3D !first;
+ 	      pp_verbatim (context->printer, "%s%s %r%s%s%R",
+ 			   first ? "" : ",\n", _(msgs[index]),
+-			   "locus", LINEMAP_FILE (map), line_col);
++			   "locus", s.file, line_col);
+ 	      first =3D false;
+ 	    }
+ 	  while (! MAIN_FILE_P (map));
+@@ -2042,10 +2102,15 @@ test_print_parseable_fixits_replace ()
+ static void
+ assert_location_text (const char *expected_loc_text,
+ 		      const char *filename, int line, int column,
+-		      bool show_column)
++		      bool show_column,
++		      int origin =3D 1,
++		      enum diagnostics_column_unit column_unit
++			=3D DIAGNOSTICS_COLUMN_UNIT_BYTE)
+ {
+   test_diagnostic_context dc;
+   dc.show_column =3D show_column;
++  dc.column_unit =3D column_unit;
++  dc.column_origin =3D origin;
+=20
+   expanded_location xloc;
+   xloc.file =3D filename;
+@@ -2069,7 +2134,10 @@ test_diagnostic_get_location_text ()
+   assert_location_text ("PROGNAME:", NULL, 0, 0, true);
+   assert_location_text ("<built-in>:", "<built-in>", 42, 10, true);
+   assert_location_text ("foo.c:42:10:", "foo.c", 42, 10, true);
+-  assert_location_text ("foo.c:42:", "foo.c", 42, 0, true);
++  assert_location_text ("foo.c:42:9:", "foo.c", 42, 10, true, 0);
++  assert_location_text ("foo.c:42:1010:", "foo.c", 42, 10, true, 1001);
++  for (int origin =3D 0; origin !=3D 2; ++origin)
++    assert_location_text ("foo.c:42:", "foo.c", 42, 0, true, origin);
+   assert_location_text ("foo.c:", "foo.c", 0, 10, true);
+   assert_location_text ("foo.c:42:", "foo.c", 42, 10, false);
+   assert_location_text ("foo.c:", "foo.c", 0, 10, false);
+@@ -2077,6 +2145,41 @@ test_diagnostic_get_location_text ()
+   maybe_line_and_column (INT_MAX, INT_MAX);
+   maybe_line_and_column (INT_MIN, INT_MIN);
+=20
++  {
++    /* In order to test display columns vs byte columns, we need to creat=
e a
++       file for location_get_source_line() to read.  */
++
++    const char *const content =3D "smile \xf0\x9f\x98\x82\n";
++    const int line_bytes =3D strlen (content) - 1;
++    const int def_tabstop =3D 8;
++    const int display_width =3D cpp_display_width (content, line_bytes,
++						 def_tabstop);
++    ASSERT_EQ (line_bytes - 2, display_width);
++    temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
++    const char *const fname =3D tmp.get_filename ();
++    const int buf_len =3D strlen (fname) + 16;
++    char *const expected =3D XNEWVEC (char, buf_len);
++
++    snprintf (expected, buf_len, "%s:1:%d:", fname, line_bytes);
++    assert_location_text (expected, fname, 1, line_bytes, true,
++			  1, DIAGNOSTICS_COLUMN_UNIT_BYTE);
++
++    snprintf (expected, buf_len, "%s:1:%d:", fname, line_bytes - 1);
++    assert_location_text (expected, fname, 1, line_bytes, true,
++			  0, DIAGNOSTICS_COLUMN_UNIT_BYTE);
++
++    snprintf (expected, buf_len, "%s:1:%d:", fname, display_width);
++    assert_location_text (expected, fname, 1, line_bytes, true,
++			  1, DIAGNOSTICS_COLUMN_UNIT_DISPLAY);
++
++    snprintf (expected, buf_len, "%s:1:%d:", fname, display_width - 1);
++    assert_location_text (expected, fname, 1, line_bytes, true,
++			  0, DIAGNOSTICS_COLUMN_UNIT_DISPLAY);
++
++    XDELETEVEC (expected);
++  }
++
++
+   progname =3D old_progname;
+ }
+=20
+diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.cc
+--- a/gcc/diagnostic-format-json.cc	2020-07-22 23:35:17.556386887 -0700
++++ b/gcc/diagnostic-format-json.cc	2021-12-25 01:20:53.475636694 -0800
+@@ -23,6 +23,7 @@ along with GCC; see the file COPYING3.
+ #include "system.h"
+ #include "coretypes.h"
+ #include "diagnostic.h"
++#include "selftest-diagnostic.h"
+ #include "diagnostic-metadata.h"
+ #include "json.h"
+ #include "selftest.h"
+@@ -43,21 +44,43 @@ static json::array *cur_children_array;
+ /* Generate a JSON object for LOC.  */
+=20
+ json::value *
+-json_from_expanded_location (location_t loc)
++json_from_expanded_location (diagnostic_context *context, location_t loc)
+ {
+   expanded_location exploc =3D expand_location (loc);
+   json::object *result =3D new json::object ();
+   if (exploc.file)
+     result->set ("file", new json::string (exploc.file));
+   result->set ("line", new json::integer_number (exploc.line));
+-  result->set ("column", new json::integer_number (exploc.column));
++
++  const enum diagnostics_column_unit orig_unit =3D context->column_unit;
++  struct
++  {
++    const char *name;
++    enum diagnostics_column_unit unit;
++  } column_fields[] =3D {
++    {"display-column", DIAGNOSTICS_COLUMN_UNIT_DISPLAY},
++    {"byte-column", DIAGNOSTICS_COLUMN_UNIT_BYTE}
++  };
++  int the_column =3D INT_MIN;
++  for (int i =3D 0; i !=3D sizeof column_fields / sizeof (*column_fields)=
; ++i)
++    {
++      context->column_unit =3D column_fields[i].unit;
++      const int col =3D diagnostic_converted_column (context, exploc);
++      result->set (column_fields[i].name, new json::integer_number (col));
++      if (column_fields[i].unit =3D=3D orig_unit)
++	the_column =3D col;
++    }
++  gcc_assert (the_column !=3D INT_MIN);
++  result->set ("column", new json::integer_number (the_column));
++  context->column_unit =3D orig_unit;
+   return result;
+ }
+=20
+ /* Generate a JSON object for LOC_RANGE.  */
+=20
+ static json::object *
+-json_from_location_range (const location_range *loc_range, unsigned range=
_idx)
++json_from_location_range (diagnostic_context *context,
++			  const location_range *loc_range, unsigned range_idx)
+ {
+   location_t caret_loc =3D get_pure_location (loc_range->m_loc);
+=20
+@@ -68,13 +91,13 @@ json_from_location_range (const location
+   location_t finish_loc =3D get_finish (loc_range->m_loc);
+=20
+   json::object *result =3D new json::object ();
+-  result->set ("caret", json_from_expanded_location (caret_loc));
++  result->set ("caret", json_from_expanded_location (context, caret_loc));
+   if (start_loc !=3D caret_loc
+       && start_loc !=3D UNKNOWN_LOCATION)
+-    result->set ("start", json_from_expanded_location (start_loc));
++    result->set ("start", json_from_expanded_location (context, start_loc=
));
+   if (finish_loc !=3D caret_loc
+       && finish_loc !=3D UNKNOWN_LOCATION)
+-    result->set ("finish", json_from_expanded_location (finish_loc));
++    result->set ("finish", json_from_expanded_location (context, finish_l=
oc));
+=20
+   if (loc_range->m_label)
+     {
+@@ -91,14 +114,14 @@ json_from_location_range (const location
+ /* Generate a JSON object for HINT.  */
+=20
+ static json::object *
+-json_from_fixit_hint (const fixit_hint *hint)
++json_from_fixit_hint (diagnostic_context *context, const fixit_hint *hint)
+ {
+   json::object *fixit_obj =3D new json::object ();
+=20
+   location_t start_loc =3D hint->get_start_loc ();
+-  fixit_obj->set ("start", json_from_expanded_location (start_loc));
++  fixit_obj->set ("start", json_from_expanded_location (context, start_lo=
c));
+   location_t next_loc =3D hint->get_next_loc ();
+-  fixit_obj->set ("next", json_from_expanded_location (next_loc));
++  fixit_obj->set ("next", json_from_expanded_location (context, next_loc)=
);
+   fixit_obj->set ("string", new json::string (hint->get_string ()));
+=20
+   return fixit_obj;
+@@ -190,11 +213,13 @@ json_end_diagnostic (diagnostic_context
+   else
+     {
+       /* Otherwise, make diag_obj be the top-level object within the grou=
p;
+-	 add a "children" array.  */
++	 add a "children" array and record the column origin.  */
+       toplevel_array->append (diag_obj);
+       cur_group =3D diag_obj;
+       cur_children_array =3D new json::array ();
+       diag_obj->set ("children", cur_children_array);
++      diag_obj->set ("column-origin",
++		     new json::integer_number (context->column_origin));
+     }
+=20
+   const rich_location *richloc =3D diagnostic->richloc;
+@@ -205,7 +230,7 @@ json_end_diagnostic (diagnostic_context
+   for (unsigned int i =3D 0; i < richloc->get_num_locations (); i++)
+     {
+       const location_range *loc_range =3D richloc->get_range (i);
+-      json::object *loc_obj =3D json_from_location_range (loc_range, i);
++      json::object *loc_obj =3D json_from_location_range (context, loc_ra=
nge, i);
+       if (loc_obj)
+ 	loc_array->append (loc_obj);
+     }
+@@ -217,7 +242,7 @@ json_end_diagnostic (diagnostic_context
+       for (unsigned int i =3D 0; i < richloc->get_num_fixit_hints (); i++)
+ 	{
+ 	  const fixit_hint *hint =3D richloc->get_fixit_hint (i);
+-	  json::object *fixit_obj =3D json_from_fixit_hint (hint);
++	  json::object *fixit_obj =3D json_from_fixit_hint (context, hint);
+ 	  fixit_array->append (fixit_obj);
+ 	}
+     }
+@@ -320,7 +345,8 @@ namespace selftest {
+ static void
+ test_unknown_location ()
+ {
+-  delete json_from_expanded_location (UNKNOWN_LOCATION);
++  test_diagnostic_context dc;
++  delete json_from_expanded_location (&dc, UNKNOWN_LOCATION);
+ }
+=20
+ /* Verify that we gracefully handle attempts to serialize bad
+@@ -338,7 +364,8 @@ test_bad_endpoints ()
+   loc_range.m_range_display_kind =3D SHOW_RANGE_WITH_CARET;
+   loc_range.m_label =3D NULL;
+=20
+-  json::object *obj =3D json_from_location_range (&loc_range, 0);
++  test_diagnostic_context dc;
++  json::object *obj =3D json_from_location_range (&dc, &loc_range, 0);
+   /* We should have a "caret" value, but no "start" or "finish" values.  =
*/
+   ASSERT_TRUE (obj !=3D NULL);
+   ASSERT_TRUE (obj->get ("caret") !=3D NULL);
+diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
+--- a/gcc/diagnostic.h	2020-07-22 23:35:17.556386887 -0700
++++ b/gcc/diagnostic.h	2021-12-25 01:20:53.479636627 -0800
+@@ -24,6 +24,20 @@ along with GCC; see the file COPYING3.
+ #include "pretty-print.h"
+ #include "diagnostic-core.h"
+=20
++/* An enum for controlling what units to use for the column number
++   when diagnostics are output, used by the -fdiagnostics-column-unit opt=
ion.
++   Tabs will be expanded or not according to the value of -ftabstop.  The=
 origin
++   (default 1) is controlled by -fdiagnostics-column-origin.  */
++
++enum diagnostics_column_unit
++{
++  /* The default from GCC 11 onwards: display columns.  */
++  DIAGNOSTICS_COLUMN_UNIT_DISPLAY,
++
++  /* The behavior in GCC 10 and earlier: simple bytes.  */
++  DIAGNOSTICS_COLUMN_UNIT_BYTE
++};
++
+ /* Enum for overriding the standard output format.  */
+=20
+ enum diagnostics_output_format
+@@ -280,6 +294,15 @@ struct diagnostic_context
+      rest of the diagnostic.  */
+   bool parseable_fixits_p;
+=20
++  /* What units to use when outputting the column number.  */
++  enum diagnostics_column_unit column_unit;
++
++  /* The origin for the column number (1-based or 0-based typically).  */
++  int column_origin;
++
++  /* The size of the tabstop for tab expansion.  */
++  int tabstop;
++
+   /* If non-NULL, an edit_context to which fix-it hints should be
+      applied, for generating patches.  */
+   edit_context *edit_context_ptr;
+@@ -458,6 +481,8 @@ diagnostic_same_line (const diagnostic_c
+ }
+=20
+ extern const char *diagnostic_get_color_for_kind (diagnostic_t kind);
++extern int diagnostic_converted_column (diagnostic_context *context,
++					expanded_location s);
+=20
+ /* Pure text formatting support functions.  */
+ extern char *file_name_as_prefix (diagnostic_context *, const char *);
+@@ -470,6 +495,7 @@ extern void diagnostic_output_format_ini
+ /* Compute the number of digits in the decimal representation of an integ=
er.  */
+ extern int num_digits (int);
+=20
+-extern json::value *json_from_expanded_location (location_t loc);
++extern json::value *json_from_expanded_location (diagnostic_context *cont=
ext,
++						 location_t loc);
+=20
+ #endif /* ! GCC_DIAGNOSTIC_H */
+diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
+--- a/gcc/diagnostic-show-locus.c	2020-07-22 23:35:17.556386887 -0700
++++ b/gcc/diagnostic-show-locus.c	2021-12-25 01:20:53.479636627 -0800
+@@ -175,9 +175,10 @@ enum column_unit {
+ class exploc_with_display_col : public expanded_location
+ {
+  public:
+-  exploc_with_display_col (const expanded_location &exploc)
++  exploc_with_display_col (const expanded_location &exploc, int tabstop)
+     : expanded_location (exploc),
+-      m_display_col (location_compute_display_column (exploc)) {}
++      m_display_col (location_compute_display_column (exploc, tabstop))
++  {}
+=20
+   int m_display_col;
+ };
+@@ -189,11 +190,11 @@ class exploc_with_display_col : public e
+ class layout_point
+ {
+  public:
+-  layout_point (const expanded_location &exploc)
++  layout_point (const exploc_with_display_col &exploc)
+     : m_line (exploc.line)
+   {
+     m_columns[CU_BYTES] =3D exploc.column;
+-    m_columns[CU_DISPLAY_COLS] =3D location_compute_display_column (explo=
c);
++    m_columns[CU_DISPLAY_COLS] =3D exploc.m_display_col;
+   }
+=20
+   linenum_type m_line;
+@@ -205,10 +206,10 @@ class layout_point
+ class layout_range
+ {
+  public:
+-  layout_range (const expanded_location *start_exploc,
+-		const expanded_location *finish_exploc,
++  layout_range (const exploc_with_display_col &start_exploc,
++		const exploc_with_display_col &finish_exploc,
+ 		enum range_display_kind range_display_kind,
+-		const expanded_location *caret_exploc,
++		const exploc_with_display_col &caret_exploc,
+ 		unsigned original_idx,
+ 		const range_label *label);
+=20
+@@ -226,22 +227,18 @@ class layout_range
+=20
+ /* A struct for use by layout::print_source_line for telling
+    layout::print_annotation_line the extents of the source line that
+-   it printed, so that underlines can be clipped appropriately.  */
++   it printed, so that underlines can be clipped appropriately.  Units
++   are 1-based display columns.  */
+=20
+ struct line_bounds
+ {
+-  int m_first_non_ws;
+-  int m_last_non_ws;
++  int m_first_non_ws_disp_col;
++  int m_last_non_ws_disp_col;
+=20
+-  void convert_to_display_cols (char_span line)
++  line_bounds ()
+   {
+-    m_first_non_ws =3D cpp_byte_column_to_display_column (line.get_buffer=
 (),
+-							line.length (),
+-							m_first_non_ws);
+-
+-    m_last_non_ws =3D cpp_byte_column_to_display_column (line.get_buffer =
(),
+-						       line.length (),
+-						       m_last_non_ws);
++    m_first_non_ws_disp_col =3D INT_MAX;
++    m_last_non_ws_disp_col =3D 0;
+   }
+ };
+=20
+@@ -351,8 +348,8 @@ class layout
+  private:
+   bool will_show_line_p (linenum_type row) const;
+   void print_leading_fixits (linenum_type row);
+-  void print_source_line (linenum_type row, const char *line, int line_by=
tes,
+-			  line_bounds *lbounds_out);
++  line_bounds print_source_line (linenum_type row, const char *line,
++				 int line_bytes);
+   bool should_print_annotation_line_p (linenum_type row) const;
+   void start_annotation_line (char margin_char =3D ' ') const;
+   void print_annotation_line (linenum_type row, const line_bounds lbounds=
);
+@@ -513,16 +510,16 @@ colorizer::get_color_by_name (const char
+    Initialize various layout_point fields from expanded_location
+    equivalents; we've already filtered on file.  */
+=20
+-layout_range::layout_range (const expanded_location *start_exploc,
+-			    const expanded_location *finish_exploc,
++layout_range::layout_range (const exploc_with_display_col &start_exploc,
++			    const exploc_with_display_col &finish_exploc,
+ 			    enum range_display_kind range_display_kind,
+-			    const expanded_location *caret_exploc,
++			    const exploc_with_display_col &caret_exploc,
+ 			    unsigned original_idx,
+ 			    const range_label *label)
+-: m_start (*start_exploc),
+-  m_finish (*finish_exploc),
++: m_start (start_exploc),
++  m_finish (finish_exploc),
+   m_range_display_kind (range_display_kind),
+-  m_caret (*caret_exploc),
++  m_caret (caret_exploc),
+   m_original_idx (original_idx),
+   m_label (label)
+ {
+@@ -646,6 +643,9 @@ layout_range::intersects_line_p (linenum
+=20
+ #if CHECKING_P
+=20
++/* Default for when we don't care what the tab expansion is set to.  */
++static const int def_tabstop =3D 8;
++
+ /* Create some expanded locations for testing layout_range.  The filename
+    member of the explocs is set to the empty string.  This member will on=
ly be
+    inspected by the calls to location_compute_display_column() made from =
the
+@@ -662,8 +662,11 @@ make_range (int start_line, int start_co
+     =3D {"", start_line, start_col, NULL, false};
+   const expanded_location finish_exploc
+     =3D {"", end_line, end_col, NULL, false};
+-  return layout_range (&start_exploc, &finish_exploc, SHOW_RANGE_WITHOUT_=
CARET,
+-		       &start_exploc, 0, NULL);
++  return layout_range (exploc_with_display_col (start_exploc, def_tabstop=
),
++		       exploc_with_display_col (finish_exploc, def_tabstop),
++		       SHOW_RANGE_WITHOUT_CARET,
++		       exploc_with_display_col (start_exploc, def_tabstop),
++		       0, NULL);
+ }
+=20
+ /* Selftests for layout_range::contains_point and
+@@ -964,7 +967,7 @@ layout::layout (diagnostic_context * con
+ : m_context (context),
+   m_pp (context->printer),
+   m_primary_loc (richloc->get_range (0)->m_loc),
+-  m_exploc (richloc->get_expanded_location (0)),
++  m_exploc (richloc->get_expanded_location (0), context->tabstop),
+   m_colorizer (context, diagnostic_kind),
+   m_colorize_source_p (context->colorize_source_p),
+   m_show_labels_p (context->show_labels_p),
+@@ -1060,7 +1063,10 @@ layout::maybe_add_location_range (const
+=20
+   /* Everything is now known to be in the correct source file,
+      but it may require further sanitization.  */
+-  layout_range ri (&start, &finish, loc_range->m_range_display_kind, &car=
et,
++  layout_range ri (exploc_with_display_col (start, m_context->tabstop),
++		   exploc_with_display_col (finish, m_context->tabstop),
++		   loc_range->m_range_display_kind,
++		   exploc_with_display_col (caret, m_context->tabstop),
+ 		   original_idx, loc_range->m_label);
+=20
+   /* If we have a range that finishes before it starts (perhaps
+@@ -1394,7 +1400,7 @@ layout::calculate_x_offset_display ()
+     =3D get_line_bytes_without_trailing_whitespace (line.get_buffer (),
+ 						  line.length ());
+   int eol_display_column
+-    =3D cpp_display_width (line.get_buffer (), line_bytes);
++    =3D cpp_display_width (line.get_buffer (), line_bytes, m_context->tab=
stop);
+   if (caret_display_column > eol_display_column
+       || !caret_display_column)
+     {
+@@ -1445,16 +1451,13 @@ layout::calculate_x_offset_display ()
+ }
+=20
+ /* Print line ROW of source code, potentially colorized at any ranges, and
+-   populate *LBOUNDS_OUT.
+-   LINE is the source line (not necessarily 0-terminated) and LINE_BYTES
+-   is its length in bytes.
+-   This function deals only with byte offsets, not display columns, so
+-   m_x_offset_display must be converted from display to byte units.  In
+-   particular, LINE_BYTES and LBOUNDS_OUT are in bytes.  */
++   return the line bounds.  LINE is the source line (not necessarily
++   0-terminated) and LINE_BYTES is its length in bytes.  In order to hand=
le both
++   colorization and tab expansion, this function tracks the line position=
 in
++   both byte and display column units.  */
+=20
+-void
+-layout::print_source_line (linenum_type row, const char *line, int line_b=
ytes,
+-			   line_bounds *lbounds_out)
++line_bounds
++layout::print_source_line (linenum_type row, const char *line, int line_b=
ytes)
+ {
+   m_colorizer.set_normal_text ();
+=20
+@@ -1469,30 +1472,29 @@ layout::print_source_line (linenum_type
+   else
+     pp_space (m_pp);
+=20
+-  /* We will stop printing the source line at any trailing whitespace, an=
d start
+-     printing it as per m_x_offset_display.  */
++  /* We will stop printing the source line at any trailing whitespace.  */
+   line_bytes =3D get_line_bytes_without_trailing_whitespace (line,
+ 							   line_bytes);
+-  int x_offset_bytes =3D 0;
+-  if (m_x_offset_display)
+-    {
+-      x_offset_bytes =3D cpp_display_column_to_byte_column (line, line_by=
tes,
+-							  m_x_offset_display);
+-      /* In case the leading portion of the line that will be skipped ove=
r ends
+-	 with a character with wcwidth > 1, then it is possible we skipped too
+-	 much, so account for that by padding with spaces.  */
+-      const int overage
+-	=3D cpp_byte_column_to_display_column (line, line_bytes, x_offset_bytes)
+-	- m_x_offset_display;
+-      for (int column =3D 0; column < overage; ++column)
+-	pp_space (m_pp);
+-      line +=3D x_offset_bytes;
+-    }
+=20
+-  /* Print the line.  */
+-  int first_non_ws =3D INT_MAX;
+-  int last_non_ws =3D 0;
+-  for (int col_byte =3D 1 + x_offset_bytes; col_byte <=3D line_bytes; col=
_byte++)
++  /* This object helps to keep track of which display column we are at, w=
hich is
++     necessary for computing the line bounds in display units, for doing
++     tab expansion, and for implementing m_x_offset_display.  */
++  cpp_display_width_computation dw (line, line_bytes, m_context->tabstop);
++
++  /* Skip the first m_x_offset_display display columns.  In case the lead=
ing
++     portion that will be skipped ends with a character with wcwidth > 1,=
 then
++     it is possible we skipped too much, so account for that by padding w=
ith
++     spaces.  Note that this does the right thing too in case a tab was t=
he last
++     character to be skipped over; the tab is effectively replaced by the
++     correct number of trailing spaces needed to offset by the desired nu=
mber of
++     display columns.  */
++  for (int skipped_display_cols =3D dw.advance_display_cols (m_x_offset_d=
isplay);
++       skipped_display_cols > m_x_offset_display; --skipped_display_cols)
++    pp_space (m_pp);
++
++  /* Print the line and compute the line_bounds.  */
++  line_bounds lbounds;
++  while (!dw.done ())
+     {
+       /* Assuming colorization is enabled for the caret and underline
+ 	 characters, we may also colorize the associated characters
+@@ -1510,7 +1512,8 @@ layout::print_source_line (linenum_type
+ 	{
+ 	  bool in_range_p;
+ 	  point_state state;
+-	  in_range_p =3D get_state_at_point (row, col_byte,
++	  const int start_byte_col =3D dw.bytes_processed () + 1;
++	  in_range_p =3D get_state_at_point (row, start_byte_col,
+ 					   0, INT_MAX,
+ 					   CU_BYTES,
+ 					   &state);
+@@ -1519,22 +1522,44 @@ layout::print_source_line (linenum_type
+ 	  else
+ 	    m_colorizer.set_normal_text ();
+ 	}
+-      char c =3D *line;
+-      if (c =3D=3D '\0' || c =3D=3D '\t' || c =3D=3D '\r')
+-	c =3D ' ';
+-      if (c !=3D ' ')
++
++      /* Get the display width of the next character to be output, expand=
ing
++	 tabs and replacing some control bytes with spaces as necessary.  */
++      const char *c =3D dw.next_byte ();
++      const int start_disp_col =3D dw.display_cols_processed () + 1;
++      const int this_display_width =3D dw.process_next_codepoint ();
++      if (*c =3D=3D '\t')
++	{
++	  /* The returned display width is the number of spaces into which the
++	     tab should be expanded.  */
++	  for (int i =3D 0; i !=3D this_display_width; ++i)
++	    pp_space (m_pp);
++	  continue;
++	}
++      if (*c =3D=3D '\0' || *c =3D=3D '\r')
+ 	{
+-	  last_non_ws =3D col_byte;
+-	  if (first_non_ws =3D=3D INT_MAX)
+-	    first_non_ws =3D col_byte;
++	  /* cpp_wcwidth() promises to return 1 for all control bytes, and we
++	     want to output these as a single space too, so this case is
++	     actually the same as the '\t' case.  */
++	  gcc_assert (this_display_width =3D=3D 1);
++	  pp_space (m_pp);
++	  continue;
+ 	}
+-      pp_character (m_pp, c);
+-      line++;
++
++      /* We have a (possibly multibyte) character to output; update the l=
ine
++	 bounds if it is not whitespace.  */
++      if (*c !=3D ' ')
++	{
++	  lbounds.m_last_non_ws_disp_col =3D dw.display_cols_processed ();
++	  if (lbounds.m_first_non_ws_disp_col =3D=3D INT_MAX)
++	    lbounds.m_first_non_ws_disp_col =3D start_disp_col;
++	}
++
++      /* Output the character.  */
++      while (c !=3D dw.next_byte ()) pp_character (m_pp, *c++);
+     }
+   print_newline ();
+-
+-  lbounds_out->m_first_non_ws =3D first_non_ws;
+-  lbounds_out->m_last_non_ws =3D last_non_ws;
++  return lbounds;
+ }
+=20
+ /* Determine if we should print an annotation line for ROW.
+@@ -1576,14 +1601,13 @@ layout::start_annotation_line (char marg
+ }
+=20
+ /* Print a line consisting of the caret/underlines for the given
+-   source line.  This function works with display columns, rather than by=
te
+-   counts; in particular, LBOUNDS should be in display column units.  */
++   source line.  */
+=20
+ void
+ layout::print_annotation_line (linenum_type row, const line_bounds lbound=
s)
+ {
+   int x_bound =3D get_x_bound_for_row (row, m_exploc.m_display_col,
+-				     lbounds.m_last_non_ws);
++				     lbounds.m_last_non_ws_disp_col);
+=20
+   start_annotation_line ();
+   pp_space (m_pp);
+@@ -1593,8 +1617,8 @@ layout::print_annotation_line (linenum_t
+       bool in_range_p;
+       point_state state;
+       in_range_p =3D get_state_at_point (row, column,
+-				       lbounds.m_first_non_ws,
+-				       lbounds.m_last_non_ws,
++				       lbounds.m_first_non_ws_disp_col,
++				       lbounds.m_last_non_ws_disp_col,
+ 				       CU_DISPLAY_COLS,
+ 				       &state);
+       if (in_range_p)
+@@ -1631,12 +1655,14 @@ layout::print_annotation_line (linenum_t
+ class line_label
+ {
+ public:
+-  line_label (int state_idx, int column, label_text text)
++  line_label (diagnostic_context *context, int state_idx, int column,
++	      label_text text)
+   : m_state_idx (state_idx), m_column (column),
+     m_text (text), m_label_line (0), m_has_vbar (true)
+   {
+     const int bytes =3D strlen (text.m_buffer);
+-    m_display_width =3D cpp_display_width (text.m_buffer, bytes);
++    m_display_width
++      =3D cpp_display_width (text.m_buffer, bytes, context->tabstop);
+   }
+=20
+   /* Sorting is primarily by column, then by state index.  */
+@@ -1696,7 +1722,7 @@ layout::print_any_labels (linenum_type r
+ 	if (text.m_buffer =3D=3D NULL)
+ 	  continue;
+=20
+-	labels.safe_push (line_label (i, disp_col, text));
++	labels.safe_push (line_label (m_context, i, disp_col, text));
+       }
+   }
+=20
+@@ -1976,7 +2002,8 @@ public:
+=20
+ /* Get the range of bytes or display columns that HINT would affect.  */
+ static column_range
+-get_affected_range (const fixit_hint *hint, enum column_unit col_unit)
++get_affected_range (diagnostic_context *context,
++		    const fixit_hint *hint, enum column_unit col_unit)
+ {
+   expanded_location exploc_start =3D expand_location (hint->get_start_loc=
 ());
+   expanded_location exploc_finish =3D expand_location (hint->get_next_loc=
 ());
+@@ -1986,11 +2013,13 @@ get_affected_range (const fixit_hint *hi
+   int finish_column;
+   if (col_unit =3D=3D CU_DISPLAY_COLS)
+     {
+-      start_column =3D location_compute_display_column (exploc_start);
++      start_column
++	=3D location_compute_display_column (exploc_start, context->tabstop);
+       if (hint->insertion_p ())
+ 	finish_column =3D start_column - 1;
+       else
+-	finish_column =3D location_compute_display_column (exploc_finish);
++	finish_column
++	  =3D location_compute_display_column (exploc_finish, context->tabstop);
+     }
+   else
+     {
+@@ -2003,12 +2032,12 @@ get_affected_range (const fixit_hint *hi
+ /* Get the range of display columns that would be printed for HINT.  */
+=20
+ static column_range
+-get_printed_columns (const fixit_hint *hint)
++get_printed_columns (diagnostic_context *context, const fixit_hint *hint)
+ {
+   expanded_location exploc =3D expand_location (hint->get_start_loc ());
+-  int start_column =3D location_compute_display_column (exploc);
+-  int hint_width =3D cpp_display_width (hint->get_string (),
+-				      hint->get_length ());
++  int start_column =3D location_compute_display_column (exploc, context->=
tabstop);
++  int hint_width =3D cpp_display_width (hint->get_string (), hint->get_le=
ngth (),
++				      context->tabstop);
+   int final_hint_column =3D start_column + hint_width - 1;
+   if (hint->insertion_p ())
+     {
+@@ -2018,7 +2047,8 @@ get_printed_columns (const fixit_hint *h
+     {
+       exploc =3D expand_location (hint->get_next_loc ());
+       --exploc.column;
+-      int finish_column =3D location_compute_display_column (exploc);
++      int finish_column
++	=3D location_compute_display_column (exploc, context->tabstop);
+       return column_range (start_column,
+ 			   MAX (finish_column, final_hint_column));
+     }
+@@ -2035,12 +2065,14 @@ public:
+   correction (column_range affected_bytes,
+ 	      column_range affected_columns,
+ 	      column_range printed_columns,
+-	      const char *new_text, size_t new_text_len)
++	      const char *new_text, size_t new_text_len,
++	      int tabstop)
+   : m_affected_bytes (affected_bytes),
+     m_affected_columns (affected_columns),
+     m_printed_columns (printed_columns),
+     m_text (xstrdup (new_text)),
+     m_byte_length (new_text_len),
++    m_tabstop (tabstop),
+     m_alloc_sz (new_text_len + 1)
+   {
+     compute_display_cols ();
+@@ -2058,7 +2090,7 @@ public:
+=20
+   void compute_display_cols ()
+   {
+-    m_display_cols =3D cpp_display_width (m_text, m_byte_length);
++    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_tabsto=
p);
+   }
+=20
+   void overwrite (int dst_offset, const char_span &src_span)
+@@ -2086,6 +2118,7 @@ public:
+   char *m_text;
+   size_t m_byte_length; /* Not including null-terminator.  */
+   int m_display_cols;
++  int m_tabstop;
+   size_t m_alloc_sz;
+ };
+=20
+@@ -2121,13 +2154,15 @@ correction::ensure_terminated ()
+ class line_corrections
+ {
+ public:
+-  line_corrections (const char *filename, linenum_type row)
+-  : m_filename (filename), m_row (row)
++  line_corrections (diagnostic_context *context, const char *filename,
++		    linenum_type row)
++    : m_context (context), m_filename (filename), m_row (row)
+   {}
+   ~line_corrections ();
+=20
+   void add_hint (const fixit_hint *hint);
+=20
++  diagnostic_context *m_context;
+   const char *m_filename;
+   linenum_type m_row;
+   auto_vec <correction *> m_corrections;
+@@ -2173,9 +2208,10 @@ source_line::source_line (const char *fi
+ void
+ line_corrections::add_hint (const fixit_hint *hint)
+ {
+-  column_range affected_bytes =3D get_affected_range (hint, CU_BYTES);
+-  column_range affected_columns =3D get_affected_range (hint, CU_DISPLAY_=
COLS);
+-  column_range printed_columns =3D get_printed_columns (hint);
++  column_range affected_bytes =3D get_affected_range (m_context, hint, CU=
_BYTES);
++  column_range affected_columns =3D get_affected_range (m_context, hint,
++						      CU_DISPLAY_COLS);
++  column_range printed_columns =3D get_printed_columns (m_context, hint);
+=20
+   /* Potentially consolidate.  */
+   if (!m_corrections.is_empty ())
+@@ -2243,7 +2279,8 @@ line_corrections::add_hint (const fixit_
+ 					   affected_columns,
+ 					   printed_columns,
+ 					   hint->get_string (),
+-					   hint->get_length ()));
++					   hint->get_length (),
++					   m_context->tabstop));
+ }
+=20
+ /* If there are any fixit hints on source line ROW, print them.
+@@ -2257,7 +2294,7 @@ layout::print_trailing_fixits (linenum_t
+ {
+   /* Build a list of correction instances for the line,
+      potentially consolidating hints (for the sake of readability).  */
+-  line_corrections corrections (m_exploc.file, row);
++  line_corrections corrections (m_context, m_exploc.file, row);
+   for (unsigned int i =3D 0; i < m_fixit_hints.length (); i++)
+     {
+       const fixit_hint *hint =3D m_fixit_hints[i];
+@@ -2499,15 +2536,11 @@ layout::print_line (linenum_type row)
+   if (!line)
+     return;
+=20
+-  line_bounds lbounds;
+   print_leading_fixits (row);
+-  print_source_line (row, line.get_buffer (), line.length (), &lbounds);
++  const line_bounds lbounds
++    =3D print_source_line (row, line.get_buffer (), line.length ());
+   if (should_print_annotation_line_p (row))
+-    {
+-      if (lbounds.m_first_non_ws !=3D INT_MAX)
+-	lbounds.convert_to_display_cols (line);
+-      print_annotation_line (row, lbounds);
+-    }
++    print_annotation_line (row, lbounds);
+   if (m_show_labels_p)
+     print_any_labels (row);
+   print_trailing_fixits (row);
+@@ -2670,9 +2703,11 @@ test_layout_x_offset_display_utf8 (const
+=20
+   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
+   ASSERT_EQ (line_display_cols,
+-	     cpp_display_width (lspan.get_buffer (), lspan.length ()));
++	     cpp_display_width (lspan.get_buffer (), lspan.length (),
++				def_tabstop));
+   ASSERT_EQ (line_display_cols,
+-	     location_compute_display_column (expand_location (line_end)));
++	     location_compute_display_column (expand_location (line_end),
++					      def_tabstop));
+   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
+ 			"\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
+=20
+@@ -2774,6 +2809,111 @@ test_layout_x_offset_display_utf8 (const
+=20
+ }
+=20
++static void
++test_layout_x_offset_display_tab (const line_table_case &case_)
++{
++  const char *content
++    =3D "This line is very long, so that we can use it to test the logic =
for "
++      "clipping long lines.  Also this: `\t' is a tab that occupies 1 byt=
e and "
++      "a variable number of display columns, starting at column #103.\n";
++
++  /* Number of bytes in the line, subtracting one to remove the newline. =
 */
++  const int line_bytes =3D strlen (content) - 1;
++
++ /* The column where the tab begins.  Byte or display is the same as ther=
e are
++    no multibyte characters earlier on the line.  */
++  const int tab_col =3D 103;
++
++  /* Effective extra size of the tab beyond what a single space would hav=
e taken
++     up, indexed by tabstop.  */
++  static const int num_tabstops =3D 11;
++  int extra_width[num_tabstops];
++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
++    {
++      const int this_tab_size =3D tabstop - (tab_col - 1) % tabstop;
++      extra_width[tabstop] =3D this_tab_size - 1;
++    }
++  /* Example of this calculation: if tabstop is 10, the tab starting at c=
olumn
++     #103 has to expand into 8 spaces, covering columns 103-110, so that =
the
++     next character is at column #111.  So it takes up 7 more columns than
++     a space would have taken up.  */
++  ASSERT_EQ (7, extra_width[10]);
++
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
++  line_table_test ltt (case_);
++
++  linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 1);
++
++  location_t line_end =3D linemap_position_for_column (line_table, line_b=
ytes);
++
++  /* Don't attempt to run the tests if column data might be unavailable. =
 */
++  if (line_end > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Check that cpp_display_width handles the tabs as expected.  */
++  char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
++  ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
++    {
++      ASSERT_EQ (line_bytes + extra_width[tabstop],
++		 cpp_display_width (lspan.get_buffer (), lspan.length (),
++				    tabstop));
++      ASSERT_EQ (line_bytes + extra_width[tabstop],
++		 location_compute_display_column (expand_location (line_end),
++						  tabstop));
++    }
++
++  /* Check that the tab is expanded to the expected number of spaces.  */
++  rich_location richloc (line_table,
++			 linemap_position_for_column (line_table,
++						      tab_col + 1));
++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
++    {
++      test_diagnostic_context dc;
++      dc.tabstop =3D tabstop;
++      layout test_layout (&dc, &richloc, DK_ERROR);
++      test_layout.print_line (1);
++      const char *out =3D pp_formatted_text (dc.printer);
++      ASSERT_EQ (NULL, strchr (out, '\t'));
++      const char *left_quote =3D strchr (out, '`');
++      const char *right_quote =3D strchr (out, '\'');
++      ASSERT_NE (NULL, left_quote);
++      ASSERT_NE (NULL, right_quote);
++      ASSERT_EQ (right_quote - left_quote, extra_width[tabstop] + 2);
++    }
++
++  /* Check that the line is offset properly and that the tab is broken up
++     into the expected number of spaces when it is the last character ski=
pped
++     over.  */
++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
++    {
++      test_diagnostic_context dc;
++      dc.tabstop =3D tabstop;
++      static const int small_width =3D 24;
++      dc.caret_max_width =3D small_width - 4;
++      dc.min_margin_width =3D test_left_margin - test_linenum_sep + 1;
++      dc.show_line_numbers_p =3D true;
++      layout test_layout (&dc, &richloc, DK_ERROR);
++      test_layout.print_line (1);
++
++      /* We have arranged things so that two columns will be printed befo=
re
++	 the caret.  If the tab results in more than one space, this should
++	 produce two spaces in the output; otherwise, it will be a single space
++	 preceded by the opening quote before the tab character.  */
++      const char *output1
++	=3D "   1 |   ' is a tab that occupies 1 byte and a variable number of "
++	  "display columns, starting at column #103.\n"
++	  "     |   ^\n\n";
++      const char *output2
++	=3D "   1 | ` ' is a tab that occupies 1 byte and a variable number of "
++	  "display columns, starting at column #103.\n"
++	  "     |   ^\n\n";
++      const char *expected_output =3D (extra_width[tabstop] ? output1 : o=
utput2);
++      ASSERT_STREQ (expected_output, pp_formatted_text (dc.printer));
++    }
++}
++
++
+ /* Verify that diagnostic_show_locus works sanely on UNKNOWN_LOCATION.  */
+=20
+ static void
+@@ -3854,6 +3994,27 @@ test_one_liner_labels_utf8 ()
+   }
+ }
+=20
++/* Make sure that colorization codes don't interrupt a multibyte
++   sequence, which would corrupt it.  */
++static void
++test_one_liner_colorized_utf8 ()
++{
++  test_diagnostic_context dc;
++  dc.colorize_source_p =3D true;
++  diagnostic_color_init (&dc, DIAGNOSTICS_COLOR_YES);
++  const location_t pi =3D linemap_position_for_column (line_table, 12);
++  rich_location richloc (line_table, pi);
++  diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++
++  /* In order to avoid having the test depend on exactly how the coloriza=
tion
++     was effected, just confirm there are two pi characters in the output=
.  */
++  const char *result =3D pp_formatted_text (dc.printer);
++  const char *null_term =3D result + strlen (result);
++  const char *first_pi =3D strstr (result, "\xcf\x80");
++  ASSERT_TRUE (first_pi && first_pi <=3D null_term - 2);
++  ASSERT_STR_CONTAINS (first_pi + 2, "\xcf\x80");
++}
++
+ /* Run the various one-liner tests.  */
+=20
+ static void
+@@ -3884,8 +4045,10 @@ test_diagnostic_show_locus_one_liner_utf
+   ASSERT_EQ (31, LOCATION_COLUMN (line_end));
+=20
+   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
+-  ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length ())=
);
+-  ASSERT_EQ (25, location_compute_display_column (expand_location (line_e=
nd)));
++  ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (),
++				    def_tabstop));
++  ASSERT_EQ (25, location_compute_display_column (expand_location (line_e=
nd),
++						  def_tabstop));
+=20
+   test_one_liner_simple_caret_utf8 ();
+   test_one_liner_caret_and_range_utf8 ();
+@@ -3900,6 +4063,7 @@ test_diagnostic_show_locus_one_liner_utf
+   test_one_liner_many_fixits_1_utf8 ();
+   test_one_liner_many_fixits_2_utf8 ();
+   test_one_liner_labels_utf8 ();
++  test_one_liner_colorized_utf8 ();
+ }
+=20
+ /* Verify that gcc_rich_location::add_location_if_nearby works.  */
+@@ -4272,25 +4436,28 @@ test_overlapped_fixit_printing (const li
+     /* Unit-test the line_corrections machinery.  */
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+-    ASSERT_EQ (column_range (12, 12), get_affected_range (hint_0, CU_BYTE=
S));
+     ASSERT_EQ (column_range (12, 12),
+-			   get_affected_range (hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (hint_0));
++	       get_affected_range (&dc, hint_0, CU_BYTES));
++    ASSERT_EQ (column_range (12, 12),
++	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+-    ASSERT_EQ (column_range (18, 18), get_affected_range (hint_1, CU_BYTE=
S));
+     ASSERT_EQ (column_range (18, 18),
+-			   get_affected_range (hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (hint_1));
++	       get_affected_range (&dc, hint_1, CU_BYTES));
++    ASSERT_EQ (column_range (18, 18),
++	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
+     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
+-    ASSERT_EQ (column_range (29, 28), get_affected_range (hint_2, CU_BYTE=
S));
+     ASSERT_EQ (column_range (29, 28),
+-			   get_affected_range (hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (29, 29), get_printed_columns (hint_2));
++	       get_affected_range (&dc, hint_2, CU_BYTES));
++    ASSERT_EQ (column_range (29, 28),
++	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2));
+=20
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (tmp.get_filename (), 1);
++    line_corrections lc (&dc, tmp.get_filename (), 1);
+=20
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4484,25 +4651,28 @@ test_overlapped_fixit_printing_utf8 (con
+     /* Unit-test the line_corrections machinery.  */
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+-    ASSERT_EQ (column_range (14, 14), get_affected_range (hint_0, CU_BYTE=
S));
++    ASSERT_EQ (column_range (14, 14),
++	       get_affected_range (&dc, hint_0, CU_BYTES));
+     ASSERT_EQ (column_range (12, 12),
+-			   get_affected_range (hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (hint_0));
++	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+-    ASSERT_EQ (column_range (22, 22), get_affected_range (hint_1, CU_BYTE=
S));
++    ASSERT_EQ (column_range (22, 22),
++	       get_affected_range (&dc, hint_1, CU_BYTES));
+     ASSERT_EQ (column_range (18, 18),
+-			   get_affected_range (hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (hint_1));
++	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
+     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
+-    ASSERT_EQ (column_range (35, 34), get_affected_range (hint_2, CU_BYTE=
S));
++    ASSERT_EQ (column_range (35, 34),
++	       get_affected_range (&dc, hint_2, CU_BYTES));
+     ASSERT_EQ (column_range (30, 29),
+-			   get_affected_range (hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (30, 30), get_printed_columns (hint_2));
++	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2));
+=20
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (tmp.get_filename (), 1);
++    line_corrections lc (&dc, tmp.get_filename (), 1);
+=20
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4689,6 +4859,8 @@ test_overlapped_fixit_printing_2 (const
+=20
+   /* Two insertions, in the wrong order.  */
+   {
++    test_diagnostic_context dc;
++
+     rich_location richloc (line_table, col_20);
+     richloc.add_fixit_insert_before (col_23, "{");
+     richloc.add_fixit_insert_before (col_21, "}");
+@@ -4696,14 +4868,15 @@ test_overlapped_fixit_printing_2 (const
+     /* These fixits should be accepted; they can't be consolidated.  */
+     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+-    ASSERT_EQ (column_range (23, 22), get_affected_range (hint_0, CU_BYTE=
S));
+-    ASSERT_EQ (column_range (23, 23), get_printed_columns (hint_0));
++    ASSERT_EQ (column_range (23, 22),
++	       get_affected_range (&dc, hint_0, CU_BYTES));
++    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+-    ASSERT_EQ (column_range (21, 20), get_affected_range (hint_1, CU_BYTE=
S));
+-    ASSERT_EQ (column_range (21, 21), get_printed_columns (hint_1));
++    ASSERT_EQ (column_range (21, 20),
++	       get_affected_range (&dc, hint_1, CU_BYTES));
++    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1));
+=20
+     /* Verify that they're printed correctly.  */
+-    test_diagnostic_context dc;
+     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
+     ASSERT_STREQ (" int a5[][0][0] =3D { 1, 2 };\n"
+ 		  "                    ^\n"
+@@ -4955,6 +5128,65 @@ test_fixit_deletion_affecting_newline (c
+ 		pp_formatted_text (dc.printer));
+ }
+=20
++static void
++test_tab_expansion (const line_table_case &case_)
++{
++  /* Create a tempfile and write some text to it.  This example uses a ta=
bstop
++     of 8, as the column numbers attempt to indicate:
++
++    .....................000.01111111111.22222333333  display
++    .....................123.90123456789.56789012345  columns  */
++  const char *content =3D "  \t   This: `\t' is a tab.\n";
++  /* ....................000 00000011111 11111222222  byte
++     ....................123 45678901234 56789012345  columns  */
++
++  const int tabstop =3D 8;
++  const int first_non_ws_byte_col =3D 7;
++  const int right_quote_byte_col =3D 15;
++  const int last_byte_col =3D 25;
++  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
++
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
++  line_table_test ltt (case_);
++  linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 1);
++
++  /* Don't attempt to run the tests if column data might be unavailable. =
 */
++  location_t line_end =3D linemap_position_for_column (line_table, last_b=
yte_col);
++  if (line_end > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Check that the leading whitespace with mixed tabs and spaces is expa=
nded
++     into 11 spaces.  Recall that print_line() also puts one space before
++     everything too.  */
++  {
++    test_diagnostic_context dc;
++    dc.tabstop =3D tabstop;
++    rich_location richloc (line_table,
++			   linemap_position_for_column (line_table,
++							first_non_ws_byte_col));
++    layout test_layout (&dc, &richloc, DK_ERROR);
++    test_layout.print_line (1);
++    ASSERT_STREQ ("            This: `      ' is a tab.\n"
++		  "            ^\n",
++		  pp_formatted_text (dc.printer));
++  }
++
++  /* Confirm the display width was tracked correctly across the internal =
tab
++     as well.  */
++  {
++    test_diagnostic_context dc;
++    dc.tabstop =3D tabstop;
++    rich_location richloc (line_table,
++			   linemap_position_for_column (line_table,
++							right_quote_byte_col));
++    layout test_layout (&dc, &richloc, DK_ERROR);
++    test_layout.print_line (1);
++    ASSERT_STREQ ("            This: `      ' is a tab.\n"
++		  "                         ^\n",
++		  pp_formatted_text (dc.printer));
++  }
++}
++
+ /* Verify that line numbers are correctly printed for the case of
+    a multiline range in which the width of the line numbers changes
+    (e.g. from "9" to "10").  */
+@@ -5012,6 +5244,7 @@ diagnostic_show_locus_c_tests ()
+   test_layout_range_for_multiple_lines ();
+=20
+   for_each_line_table_case (test_layout_x_offset_display_utf8);
++  for_each_line_table_case (test_layout_x_offset_display_tab);
+=20
+   test_get_line_bytes_without_trailing_whitespace ();
+=20
+@@ -5029,6 +5262,7 @@ diagnostic_show_locus_c_tests ()
+   for_each_line_table_case (test_fixit_insert_containing_newline_2);
+   for_each_line_table_case (test_fixit_replace_containing_newline);
+   for_each_line_table_case (test_fixit_deletion_affecting_newline);
++  for_each_line_table_case (test_tab_expansion);
+=20
+   test_line_numbers_multiline_range ();
+ }
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-24 20:23:46.876739587 -0800
++++ b/gcc/doc/invoke.texi	2021-12-25 01:20:53.487636494 -0800
+@@ -293,7 +293,9 @@ Objective-C and Objective-C++ Dialects}.
+ -fdiagnostics-show-template-tree  -fno-elide-type @gol
+ -fdiagnostics-path-format=3D@r{[}none@r{|}separate-events@r{|}inline-even=
ts@r{]} @gol
+ -fdiagnostics-show-path-depths @gol
+--fno-show-column}
++-fno-show-column @gol
++-fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol
++-fdiagnostics-column-origin=3D@var{origin}}
+=20
+ @item Warning Options
+ @xref{Warning Options,,Options to Request or Suppress Warnings}.
+@@ -4424,6 +4426,31 @@ Do not print column numbers in diagnosti
+ diagnostics are being scanned by a program that does not understand the
+ column numbers, such as @command{dejagnu}.
+=20
++@item -fdiagnostics-column-unit=3D@var{UNIT}
++@opindex fdiagnostics-column-unit
++Select the units for the column number.  This affects traditional diagnos=
tics
++(in the absence of @option{-fno-show-column}), as well as JSON format
++diagnostics if requested.
++
++The default @var{UNIT}, @samp{display}, considers the number of display
++columns occupied by each character.  This may be larger than the number
++of bytes required to encode the character, in the case of tab
++characters, or it may be smaller, in the case of multibyte characters.
++For example, the character ``GREEK SMALL LETTER PI (U+03C0)'' occupies one
++display column, and its UTF-8 encoding requires two bytes; the character
++``SLIGHTLY SMILING FACE (U+1F642)'' occupies two display columns, and
++its UTF-8 encoding requires four bytes.
++
++Setting @var{UNIT} to @samp{byte} changes the column number to the raw by=
te
++count in all cases, as was traditionally output by GCC prior to version 1=
1.1.0.
++
++@item -fdiagnostics-column-origin=3D@var{ORIGIN}
++@opindex fdiagnostics-column-origin
++Select the origin for column numbers, i.e. the column number assigned to =
the
++first column.  The default value of 1 corresponds to traditional GCC
++behavior and to the GNU style guide.  Some utilities may perform better w=
ith an
++origin of 0; any non-negative value may be specified.
++
+ @item -fdiagnostics-format=3D@var{FORMAT}
+ @opindex fdiagnostics-format
+ Select a different format for printing diagnostics.
+@@ -4459,11 +4486,15 @@ might be printed in JSON form (after for
+         "locations": [
+             @{
+                 "caret": @{
++		    "display-column": 3,
++		    "byte-column": 3,
+                     "column": 3,
+                     "file": "misleading-indentation.c",
+                     "line": 15
+                 @},
+                 "finish": @{
++		    "display-column": 4,
++		    "byte-column": 4,
+                     "column": 4,
+                     "file": "misleading-indentation.c",
+                     "line": 15
+@@ -4479,6 +4510,8 @@ might be printed in JSON form (after for
+                 "locations": [
+                     @{
+                         "caret": @{
++			    "display-column": 5,
++			    "byte-column": 5,
+                             "column": 5,
+                             "file": "misleading-indentation.c",
+                             "line": 17
+@@ -4488,6 +4521,7 @@ might be printed in JSON form (after for
+                 "message": "...this statement, but the latter is @dots{}"
+             @}
+         ]
++	"column-origin": 1,
+     @},
+     @dots{}
+ ]
+@@ -4500,10 +4534,34 @@ A diagnostic has a @code{kind}.  If this
+ an @code{option} key describing the command-line option controlling the
+ warning.
+=20
+-A diagnostic can contain zero or more locations.  Each location has up
+-to three positions within it: a @code{caret} position and optional
+-@code{start} and @code{finish} positions.  A location can also have
+-an optional @code{label} string.  For example, this error:
++A diagnostic can contain zero or more locations.  Each location has an
++optional @code{label} string and up to three positions within it: a
++@code{caret} position and optional @code{start} and @code{finish} positio=
ns.
++A position is described by a @code{file} name, a @code{line} number, and
++three numbers indicating a column position:
++@itemize @bullet
++
++@item
++@code{display-column} counts display columns, accounting for tabs and
++multibyte characters.
++
++@item
++@code{byte-column} counts raw bytes.
++
++@item
++@code{column} is equal to one of
++the previous two, as dictated by the @option{-fdiagnostics-column-unit}
++option.
++
++@end itemize
++All three columns are relative to the origin specified by
++@option{-fdiagnostics-column-origin}, which is typically equal to 1 but m=
ay
++be set, for instance, to 0 for compatibility with other utilities that
++number columns from 0.  The column origin is recorded in the JSON output =
in
++the @code{column-origin} tag.  In the remaining examples below, the extra
++column number outputs have been omitted for brevity.
++
++For example, this error:
+=20
+ @smallexample
+ bad-binary-ops.c:64:23: error: invalid operands to binary + (have 'S' @{a=
ka
+diff --git a/gcc/input.c b/gcc/input.c
+--- a/gcc/input.c	2020-07-22 23:35:17.664388078 -0700
++++ b/gcc/input.c	2021-12-25 01:20:53.487636494 -0800
+@@ -913,7 +913,7 @@ make_location (location_t caret, source_
+    source line in order to calculate the display width.  If that cannot b=
e done
+    for any reason, then returns the byte column as a fallback.  */
+ int
+-location_compute_display_column (expanded_location exploc)
++location_compute_display_column (expanded_location exploc, int tabstop)
+ {
+   if (!(exploc.file && *exploc.file && exploc.line && exploc.column))
+     return exploc.column;
+@@ -921,7 +921,7 @@ location_compute_display_column (expande
+   /* If line is NULL, this function returns exploc.column which is the
+      desired fallback.  */
+   return cpp_byte_column_to_display_column (line.get_buffer (), line.leng=
th (),
+-					    exploc.column);
++					    exploc.column, tabstop);
+ }
+=20
+ /* Dump statistics to stderr about the memory usage of the line_table
+@@ -3608,33 +3608,46 @@ test_line_offset_overflow ()
+=20
+ void test_cpp_utf8 ()
+ {
++  const int def_tabstop =3D 8;
+   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
+   {
+-    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8);
++    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tabst=
op);
+     ASSERT_EQ (8, w_bad);
+-    int w_ctrl =3D cpp_display_width ("\r\t\n\v\0\1", 6);
+-    ASSERT_EQ (6, w_ctrl);
++    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
++    ASSERT_EQ (5, w_ctrl);
+   }
+=20
+   /* Verify that wcwidth of valid UTF-8 is as expected.  */
+   {
+-    const int w_pi =3D cpp_display_width ("\xcf\x80", 2);
++    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, def_tabstop);
+     ASSERT_EQ (1, w_pi);
+-    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4);
++    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, def_t=
abstop);
+     ASSERT_EQ (2, w_emoji);
+-    const int w_umlaut_precomposed =3D cpp_display_width ("\xc3\xbf", 2);
++    const int w_umlaut_precomposed =3D cpp_display_width ("\xc3\xbf", 2,
++							def_tabstop);
+     ASSERT_EQ (1, w_umlaut_precomposed);
+-    const int w_umlaut_combining =3D cpp_display_width ("y\xcc\x88", 3);
++    const int w_umlaut_combining =3D cpp_display_width ("y\xcc\x88", 3,
++						      def_tabstop);
+     ASSERT_EQ (1, w_umlaut_combining);
+-    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3);
++    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, def_tabstop=
);
+     ASSERT_EQ (2, w_han);
+-    const int w_ascii =3D cpp_display_width ("GCC", 3);
++    const int w_ascii =3D cpp_display_width ("GCC", 3, def_tabstop);
+     ASSERT_EQ (3, w_ascii);
+     const int w_mixed =3D cpp_display_width ("\xcf\x80 =3D 3.14 \xf0\x9f\=
x98\x82"
+-					   "\x9f! \xe4\xb8\xba y\xcc\x88", 24);
++					   "\x9f! \xe4\xb8\xba y\xcc\x88",
++					   24, def_tabstop);
+     ASSERT_EQ (18, w_mixed);
+   }
+=20
++  /* Verify that display width properly expands tabs.  */
++  {
++    const char *tstr =3D "\tabc\td";
++    ASSERT_EQ (6, cpp_display_width (tstr, 6, 1));
++    ASSERT_EQ (10, cpp_display_width (tstr, 6, 3));
++    ASSERT_EQ (17, cpp_display_width (tstr, 6, 8));
++    ASSERT_EQ (1, cpp_display_column_to_byte_column (tstr, 6, 7, 8));
++  }
++
+   /* Verify that cpp_byte_column_to_display_column can go past the end,
+      and similar edge cases.  */
+   {
+@@ -3645,10 +3658,13 @@ void test_cpp_utf8 ()
+       /* 111122223456
+ 	 Byte columns.  */
+=20
+-    ASSERT_EQ (5, cpp_display_width (str, 6));
+-    ASSERT_EQ (105, cpp_byte_column_to_display_column (str, 6, 106));
+-    ASSERT_EQ (10000, cpp_byte_column_to_display_column (NULL, 0, 10000));
+-    ASSERT_EQ (0, cpp_byte_column_to_display_column (NULL, 10000, 0));
++    ASSERT_EQ (5, cpp_display_width (str, 6, def_tabstop));
++    ASSERT_EQ (105,
++	       cpp_byte_column_to_display_column (str, 6, 106, def_tabstop));
++    ASSERT_EQ (10000,
++	       cpp_byte_column_to_display_column (NULL, 0, 10000, def_tabstop));
++    ASSERT_EQ (0,
++	       cpp_byte_column_to_display_column (NULL, 10000, 0, def_tabstop));
+   }
+=20
+   /* Verify that cpp_display_column_to_byte_column can go past the end,
+@@ -3662,21 +3678,25 @@ void test_cpp_utf8 ()
+       /* 000000000000000000000000000000000111111
+ 	 111122223333444456666777788889999012345
+ 	 Byte columns.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2));
+-    ASSERT_EQ (15, cpp_display_column_to_byte_column (str, 15, 11));
+-    ASSERT_EQ (115, cpp_display_column_to_byte_column (str, 15, 111));
+-    ASSERT_EQ (10000, cpp_display_column_to_byte_column (NULL, 0, 10000));
+-    ASSERT_EQ (0, cpp_display_column_to_byte_column (NULL, 10000, 0));
++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_tabs=
top));
++    ASSERT_EQ (15,
++	       cpp_display_column_to_byte_column (str, 15, 11, def_tabstop));
++    ASSERT_EQ (115,
++	       cpp_display_column_to_byte_column (str, 15, 111, def_tabstop));
++    ASSERT_EQ (10000,
++	       cpp_display_column_to_byte_column (NULL, 0, 10000, def_tabstop));
++    ASSERT_EQ (0,
++	       cpp_display_column_to_byte_column (NULL, 10000, 0, def_tabstop));
+=20
+     /* Verify that we do not interrupt a UTF-8 sequence.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1));
++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_tabs=
top));
+=20
+     for (int byte_col =3D 1; byte_col <=3D 15; ++byte_col)
+       {
+-	const int disp_col =3D cpp_byte_column_to_display_column (str, 15,
+-								byte_col);
+-	const int byte_col2 =3D cpp_display_column_to_byte_column (str, 15,
+-								 disp_col);
++	const int disp_col
++	  =3D cpp_byte_column_to_display_column (str, 15, byte_col, def_tabstop);
++	const int byte_col2
++	  =3D cpp_display_column_to_byte_column (str, 15, disp_col, def_tabstop);
+=20
+ 	/* If we ask for the display column in the middle of a UTF-8
+ 	   sequence, it will return the length of the partial sequence,
+diff --git a/gcc/input.h b/gcc/input.h
+--- a/gcc/input.h	2020-07-22 23:35:17.664388078 -0700
++++ b/gcc/input.h	2021-12-25 01:20:53.487636494 -0800
+@@ -38,7 +38,9 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
+=20
+ extern bool is_location_from_builtin_token (location_t);
+ extern expanded_location expand_location (location_t);
+-extern int location_compute_display_column (expanded_location);
++
++extern int location_compute_display_column (expanded_location exploc,
++					    int tabstop);
+=20
+ /* A class capturing the bounds of a buffer, to allow for run-time
+    bounds-checking in a checked build.  */
+diff --git a/gcc/opts.c b/gcc/opts.c
+--- a/gcc/opts.c	2020-07-22 23:35:17.708388562 -0700
++++ b/gcc/opts.c	2021-12-25 01:20:53.487636494 -0800
+@@ -2439,6 +2439,14 @@ common_handle_option (struct gcc_options
+       dc->parseable_fixits_p =3D value;
+       break;
+=20
++    case OPT_fdiagnostics_column_unit_:
++      dc->column_unit =3D (enum diagnostics_column_unit)value;
++      break;
++
++    case OPT_fdiagnostics_column_origin_:
++      dc->column_origin =3D value;
++      break;
++
+     case OPT_fdiagnostics_show_cwe:
+       dc->show_cwe =3D value;
+       break;
+@@ -2825,6 +2833,12 @@ common_handle_option (struct gcc_options
+       check_alignment_argument (loc, arg, "functions");
+       break;
+=20
++    case OPT_ftabstop_:
++      /* It is documented that we silently ignore silly values.  */
++      if (value >=3D 1 && value <=3D 100)
++	dc->tabstop =3D value;
++      break;
++
+     default:
+       /* If the flag was handled in a standard way, assume the lack of
+ 	 processing here is intentional.  */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-1.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2020-07-22 23:=
35:17.908390765 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-25 01:=
20:53.487636494 -0800
+@@ -8,17 +8,22 @@
+    We can't rely on any ordering of the keys.  */
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
++/* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"#error message\"" } */
+=20
+ /* { dg-regexp "\"caret\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-1.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 2" } */
++/* { dg-regexp "\"display-column\": 2" } */
++/* { dg-regexp "\"byte-column\": 2" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-1.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 6" } */
++/* { dg-regexp "\"display-column\": 6" } */
++/* { dg-regexp "\"byte-column\": 6" } */
+=20
+ /* { dg-regexp "\"locations\": \[\[\{\}, \]*\]" } */
+ /* { dg-regexp "\"children\": \[\[\]\[\]\]" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-2.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2020-07-22 23:=
35:17.908390765 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-25 01:=
20:53.487636494 -0800
+@@ -8,6 +8,7 @@
+    We can't rely on any ordering of the keys.  */
+=20
+ /* { dg-regexp "\"kind\": \"warning\"" } */
++/* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Wcpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+@@ -16,11 +17,15 @@
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-2.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 2" } */
++/* { dg-regexp "\"display-column\": 2" } */
++/* { dg-regexp "\"byte-column\": 2" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-2.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 8" } */
++/* { dg-regexp "\"display-column\": 8" } */
++/* { dg-regexp "\"byte-column\": 8" } */
+=20
+ /* { dg-regexp "\"locations\": \[\[\{\}, \]*\]" } */
+ /* { dg-regexp "\"children\": \[\[\]\[\]\]" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-3.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2020-07-22 23:=
35:17.908390765 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-25 01:=
20:53.487636494 -0800
+@@ -8,6 +8,7 @@
+    We can't rely on any ordering of the keys.  */
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
++/* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Werror=3Dcpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+@@ -16,11 +17,15 @@
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-3.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 2" } */
++/* { dg-regexp "\"display-column\": 2" } */
++/* { dg-regexp "\"byte-column\": 2" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-3.c\"" } */
+ /* { dg-regexp "\"line\": 4" } */
+ /* { dg-regexp "\"column\": 8" } */
++/* { dg-regexp "\"display-column\": 8" } */
++/* { dg-regexp "\"byte-column\": 8" } */
+=20
+ /* { dg-regexp "\"locations\": \[\[\{\}, \]*\]" } */
+ /* { dg-regexp "\"children\": \[\[\]\[\]\]" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-4.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2020-07-22 23:=
35:17.908390765 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-25 01:=
20:53.487636494 -0800
+@@ -24,15 +24,20 @@ int test (void)
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 5" } */
++/* { dg-regexp "\"display-column\": 5" } */
++/* { dg-regexp "\"byte-column\": 5" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 10" } */
++/* { dg-regexp "\"display-column\": 10" } */
++/* { dg-regexp "\"byte-column\": 10" } */
+=20
+ /* The outer diagnostic.  */
+=20
+ /* { dg-regexp "\"kind\": \"warning\"" } */
++/* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } */
+ /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-in=
dentation\"" } */
+@@ -41,11 +46,15 @@ int test (void)
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+ /* { dg-regexp "\"line\": 6" } */
+ /* { dg-regexp "\"column\": 3" } */
++/* { dg-regexp "\"display-column\": 3" } */
++/* { dg-regexp "\"byte-column\": 3" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+ /* { dg-regexp "\"line\": 6" } */
+ /* { dg-regexp "\"column\": 4" } */
++/* { dg-regexp "\"display-column\": 4" } */
++/* { dg-regexp "\"byte-column\": 4" } */
+=20
+ /* More from the nested diagnostic (we can't guarantee what order the
+    "file" keys are consumed).  */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-5.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2020-07-22 23:=
35:17.908390765 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-25 01:=
20:53.487636494 -0800
+@@ -13,6 +13,7 @@ int test (struct s *ptr)
+    We can't rely on any ordering of the keys.  */
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
++/* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \".*\"" } */
+=20
+ /* Verify fix-it hints.  */
+@@ -23,11 +24,15 @@ int test (struct s *ptr)
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-5.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 15" } */
++/* { dg-regexp "\"display-column\": 15" } */
++/* { dg-regexp "\"byte-column\": 15" } */
+=20
+ /* { dg-regexp "\"next\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-5.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 21" } */
++/* { dg-regexp "\"display-column\": 21" } */
++/* { dg-regexp "\"byte-column\": 21" } */
+=20
+ /* { dg-regexp "\"fixits\": \[\[\{\}, \]*\]" } */
+=20
+@@ -35,11 +40,15 @@ int test (struct s *ptr)
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-5.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 15" } */
++/* { dg-regexp "\"display-column\": 15" } */
++/* { dg-regexp "\"byte-column\": 15" } */
+=20
+ /* { dg-regexp "\"finish\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-5.c\"" } */
+ /* { dg-regexp "\"line\": 8" } */
+ /* { dg-regexp "\"column\": 20" } */
++/* { dg-regexp "\"display-column\": 20" } */
++/* { dg-regexp "\"byte-column\": 20" } */
+=20
+ /* { dg-regexp "\"locations\": \[\[\{\}, \]*\]" } */
+ /* { dg-regexp "\"children\": \[\[\]\[\]\]" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-1.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-1.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-1.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-1.c	2021-12-25 01:20:53.=
487636494 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Dbyte -fshow-colum=
n -fdiagnostics-show-caret -Wmultichar" } */
++
++/* column units: bytes (via arg)
++   column origin: 1 (via default)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "11: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "18: multi-character character c=
onstant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "19: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-2.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-2.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-2.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-2.c	2021-12-25 01:20:53.=
487636494 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Ddisplay -fshow-co=
lumn -fdiagnostics-show-caret -Wmultichar" } */
++
++/* column units: display (via arg)
++   column origin: 1 (via default)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "18: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "18: multi-character character c=
onstant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "25: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-3.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-3.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-3.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-3.c	2021-12-25 01:20:53.=
487636494 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Dbyte -fshow-colum=
n -fdiagnostics-show-caret -ftabstop=3D200 -Wmultichar" } */
++
++/* column units: bytes (via arg)
++   column origin: 1 (via fallback from overly large argument)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "11: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "18: multi-character character c=
onstant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "19: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-4.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-4.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-4.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-4.c	2021-12-25 01:20:53.=
487636494 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Dbyte -fshow-colum=
n -fdiagnostics-show-caret -fdiagnostics-column-origin=3D0 -Wmultichar" } */
++
++/* column units: bytes (via arg)
++   column origin: 0 (via arg)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "10: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "17: multi-character character c=
onstant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "18: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-5.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-5.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-5.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-5.c	2021-12-25 01:20:53.=
491636427 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Ddisplay -fshow-co=
lumn -fdiagnostics-show-caret -fdiagnostics-column-origin=3D0 -Wmultichar" =
} */
++
++/* column units: display (via arg)
++   column origin: 0 (via arg)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "17: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "17: multi-character character c=
onstant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "24: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-6.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-6.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-6.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-6.c	2021-12-25 01:20:53.=
491636427 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Dbyte -fshow-colum=
n -fdiagnostics-show-caret -fdiagnostics-column-origin=3D100 -Wmultichar" }=
 */
++
++/* column units: bytes (via arg)
++   column origin: 100 (via arg)
++   tabstop: 8 (via default) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "110: multi-character character constan=
t" } */
++/* { dg-begin-multiline-output "" }
++         int c1 =3D 'c1';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++        int c2 =3D 'c2'; /* { dg-warning "117: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++         int c2 =3D 'c2';
++                  ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++        int c3 =3D 	'c3'; /* { dg-warning "118: multi-character character=
 constant" } */
++/* { dg-begin-multiline-output "" }
++         int c3 =3D        'c3';
++                         ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-7.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-7.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-7.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-7.c	2021-12-25 01:20:53.=
491636427 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fdiagnostics-column-unit=3Dbyte -fshow-colum=
n -fdiagnostics-show-caret -ftabstop=3D9 -Wmultichar" } */
++
++/* column units: bytes (via arg)
++   column origin: 1 (via default)
++   tabstop: 9 (via arg) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "11: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++          int c1 =3D 'c1';
++                   ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++         int c2 =3D 'c2'; /* { dg-warning "19: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++          int c2 =3D 'c2';
++                   ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++         int c3 =3D 	'c3'; /* { dg-warning "20: multi-character character=
 constant" } */
++/* { dg-begin-multiline-output "" }
++          int c3 =3D          'c3';
++                            ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-units-8.c b/gcc/testsui=
te/c-c++-common/diagnostic-units-8.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-units-8.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-units-8.c	2021-12-25 01:20:53.=
491636427 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-additional-options "-fshow-column -fdiagnostics-show-caret -ftabs=
top=3D9 -Wmultichar" } */
++
++/* column units: display (via default)
++   column origin: 1 (via default)
++   tabstop: 9 (via arg) */
++
++/* This line starts with a tab.  */
++	int c1 =3D 'c1'; /* { dg-warning "19: multi-character character constant=
" } */
++/* { dg-begin-multiline-output "" }
++          int c1 =3D 'c1';
++                   ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces.  */
++         int c2 =3D 'c2'; /* { dg-warning "19: multi-character character =
constant" } */
++/* { dg-begin-multiline-output "" }
++          int c2 =3D 'c2';
++                   ^~~~
++   { dg-end-multiline-output "" } */
++
++/* This line starts with <tabstop> spaces and has an internal tab after
++   a space.  */
++         int c3 =3D 	'c3'; /* { dg-warning "28: multi-character character=
 constant" } */
++/* { dg-begin-multiline-output "" }
++          int c3 =3D          'c3';
++                            ^~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/c-c++-common/missing-close-symbol.c b/gcc/tests=
uite/c-c++-common/missing-close-symbol.c
+--- a/gcc/testsuite/c-c++-common/missing-close-symbol.c	2020-07-22 23:35:1=
7.912390810 -0700
++++ b/gcc/testsuite/c-c++-common/missing-close-symbol.c	2021-12-25 01:20:5=
3.491636427 -0800
+@@ -24,9 +24,9 @@ void test_static_assert_different_line (
+   _Static_assert(sizeof(int) >=3D sizeof(char), /* { dg-message "to match=
 this '\\('" } */
+ 		 "msg"; /* { dg-error "expected '\\)' before ';' token" } */
+   /* { dg-begin-multiline-output "" }
+-    "msg";
+-         ^
+-         )
++                  "msg";
++                       ^
++                       )
+      { dg-end-multiline-output "" } */
+   /* { dg-begin-multiline-output "" }
+    _Static_assert(sizeof(int) >=3D sizeof(char),
+diff --git a/gcc/testsuite/c-c++-common/Wmisleading-indentation-3.c b/gcc/=
testsuite/c-c++-common/Wmisleading-indentation-3.c
+--- a/gcc/testsuite/c-c++-common/Wmisleading-indentation-3.c	2020-07-22 23=
:35:17.904390722 -0700
++++ b/gcc/testsuite/c-c++-common/Wmisleading-indentation-3.c	2021-12-25 01=
:20:53.487636494 -0800
+@@ -36,20 +36,20 @@ int fn_6 (int a, int b, int c)
+ 	/* ... */
+ 	if ((err =3D foo (a)) !=3D 0)
+ 		goto fail;
+-	if ((err =3D foo (b)) !=3D 0) /* { dg-message "2: this 'if' clause does =
not guard..." } */
++	if ((err =3D foo (b)) !=3D 0) /* { dg-message "9: this 'if' clause does =
not guard..." } */
+ 		goto fail;
+-		goto fail; /* { dg-message "3: ...this statement, but the latter is mis=
leadingly indented as if it were guarded by the 'if'" } */
++		goto fail; /* { dg-message "17: ...this statement, but the latter is mi=
sleadingly indented as if it were guarded by the 'if'" } */
+ 	if ((err =3D foo (c)) !=3D 0)
+ 		goto fail;
+ 	/* ... */
+=20
+ /* { dg-begin-multiline-output "" }
+-  if ((err =3D foo (b)) !=3D 0)
+-  ^~
++         if ((err =3D foo (b)) !=3D 0)
++         ^~
+    { dg-end-multiline-output "" } */
+ /* { dg-begin-multiline-output "" }
+-   goto fail;
+-   ^~~~
++                 goto fail;
++                 ^~~~
+    { dg-end-multiline-output "" } */
+=20
+ fail:
+diff --git a/gcc/testsuite/c-c++-common/Wmisleading-indentation.c b/gcc/te=
stsuite/c-c++-common/Wmisleading-indentation.c
+--- a/gcc/testsuite/c-c++-common/Wmisleading-indentation.c	2020-07-22 23:3=
5:17.904390722 -0700
++++ b/gcc/testsuite/c-c++-common/Wmisleading-indentation.c	2021-12-25 01:2=
0:53.487636494 -0800
+@@ -65,9 +65,9 @@ int fn_6 (int a, int b, int c)
+ 	/* ... */
+ 	if ((err =3D foo (a)) !=3D 0)
+ 		goto fail;
+-	if ((err =3D foo (b)) !=3D 0) /* { dg-message "2: this 'if' clause does =
not guard..." } */
++	if ((err =3D foo (b)) !=3D 0) /* { dg-message "9: this 'if' clause does =
not guard..." } */
+ 		goto fail;
+-		goto fail; /* { dg-message "3: ...this statement, but the latter is mis=
leadingly indented as if it were guarded by the 'if'" } */
++		goto fail; /* { dg-message "17: ...this statement, but the latter is mi=
sleadingly indented as if it were guarded by the 'if'" } */
+ 	if ((err =3D foo (c)) !=3D 0)
+ 		goto fail;
+ 	/* ... */
+@@ -178,7 +178,7 @@ void fn_16_tabs (void)
+     while (flagA)
+       if (flagB) /* { dg-message "7: this 'if' clause does not guard..." =
} */
+ 	foo (0);
+-	foo (1);/* { dg-message "2: ...this statement, but the latter is mislead=
ingly indented as if it were guarded by the 'if'" } */
++	foo (1);/* { dg-message "9: ...this statement, but the latter is mislead=
ingly indented as if it were guarded by the 'if'" } */
+ }
+=20
+ void fn_17_spaces (void)
+diff --git a/gcc/testsuite/gcc.dg/analyzer/malloc-paths-9.c b/gcc/testsuit=
e/gcc.dg/analyzer/malloc-paths-9.c
+--- a/gcc/testsuite/gcc.dg/analyzer/malloc-paths-9.c	2020-07-22 23:35:18.1=
24393144 -0700
++++ b/gcc/testsuite/gcc.dg/analyzer/malloc-paths-9.c	2021-12-25 01:20:53.4=
91636427 -0800
+@@ -288,7 +288,7 @@ int test_3 (int x, int y)
+     |      |     ~~~~~~~~~~
+     |      |     |
+     |      |     (4) ...to here
+-    |   NN |      to dereference it above
++    |   NN |                    to dereference it above
+     |   NN |   return *ptr;
+     |      |          ~~~~
+     |      |          |
+diff --git a/gcc/testsuite/gcc.dg/bad-binary-ops.c b/gcc/testsuite/gcc.dg/=
bad-binary-ops.c
+--- a/gcc/testsuite/gcc.dg/bad-binary-ops.c	2020-07-22 23:35:18.128393190 =
-0700
++++ b/gcc/testsuite/gcc.dg/bad-binary-ops.c	2021-12-25 01:20:53.491636427 =
-0800
+@@ -35,10 +35,10 @@ int test_2 (void)
+            ~~~~~~~~~~~~~~~~
+            |
+            struct s
+-    + some_other_function ());
+-    ^ ~~~~~~~~~~~~~~~~~~~~~~
+-      |
+-      struct t
++           + some_other_function ());
++           ^ ~~~~~~~~~~~~~~~~~~~~~~
++             |
++             struct t
+    { dg-end-multiline-output "" } */
+ }
+=20
+diff --git a/gcc/testsuite/gcc.dg/format/branch-1.c b/gcc/testsuite/gcc.dg=
/format/branch-1.c
+--- a/gcc/testsuite/gcc.dg/format/branch-1.c	2020-07-22 23:35:18.152393454=
 -0700
++++ b/gcc/testsuite/gcc.dg/format/branch-1.c	2021-12-25 01:20:53.491636427=
 -0800
+@@ -10,7 +10,7 @@ foo (long l, int nfoo)
+ {
+   printf ((nfoo > 1) ? "%d foos" : "%d foo", nfoo);
+   printf ((l > 1) ? "%d foos" /* { dg-warning "23:int" "wrong type in con=
ditional expr" } */
+-	          : "%d foo", l); /* { dg-warning "16:int" "wrong type in condit=
ional expr" } */
++	          : "%d foo", l); /* { dg-warning "23:int" "wrong type in condit=
ional expr" } */
+   printf ((l > 1) ? "%ld foos" : "%d foo", l); /* { dg-warning "36:int" "=
wrong type in conditional expr" } */
+   printf ((l > 1) ? "%d foos" : "%ld foo", l); /* { dg-warning "23:int" "=
wrong type in conditional expr" } */
+   /* Should allow one case to have extra arguments.  */
+diff --git a/gcc/testsuite/gcc.dg/format/pr79210.c b/gcc/testsuite/gcc.dg/=
format/pr79210.c
+--- a/gcc/testsuite/gcc.dg/format/pr79210.c	2020-07-22 23:35:18.152393454 =
-0700
++++ b/gcc/testsuite/gcc.dg/format/pr79210.c	2021-12-25 01:20:53.491636427 =
-0800
+@@ -20,4 +20,4 @@ LPFC_VPORT_ATTR_R(peer_port_login,
+ 		  "Allow peer ports on the same physical port to login to each "
+ 		  "other.");
+=20
+-/* { dg-warning "6: format .%d. expects argument of type .int., but argum=
ent 4 has type .unsigned int. " "" { target *-*-* } .-12 } */
++/* { dg-warning "20: format .%d. expects argument of type .int., but argu=
ment 4 has type .unsigned int. " "" { target *-*-* } .-12 } */
+diff --git a/gcc/testsuite/gcc.dg/plugin/diagnostic-test-expressions-1.c b=
/gcc/testsuite/gcc.dg/plugin/diagnostic-test-expressions-1.c
+--- a/gcc/testsuite/gcc.dg/plugin/diagnostic-test-expressions-1.c	2020-07-=
22 23:35:18.172393674 -0700
++++ b/gcc/testsuite/gcc.dg/plugin/diagnostic-test-expressions-1.c	2021-12-=
25 01:20:53.491636427 -0800
+@@ -540,15 +540,15 @@ void test_builtin_types_compatible_p (un
+   __emit_expression_range (0,
+ 			   f (i) + __builtin_types_compatible_p (long, int)); /* { dg-warning =
"range" } */
+ /* { dg-begin-multiline-output "" }
+-       f (i) + __builtin_types_compatible_p (long, int));
+-       ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++                            f (i) + __builtin_types_compatible_p (long, i=
nt));
++                            ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+    { dg-end-multiline-output "" } */
+=20
+   __emit_expression_range (0,
+ 			   __builtin_types_compatible_p (long, int) + f (i)); /* { dg-warning =
"range" } */
+ /* { dg-begin-multiline-output "" }
+-       __builtin_types_compatible_p (long, int) + f (i));
+-       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
++                            __builtin_types_compatible_p (long, int) + f =
(i));
++                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~=
~~~
+    { dg-end-multiline-output "" } */
+ }
+=20
+@@ -671,8 +671,8 @@ void test_multiple_ordinary_maps (void)
+ /* { dg-begin-multiline-output "" }
+    __emit_expression_range (0, foo (0,
+                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+-        "0123456789012345678901234567890123456789012345678901234567890123=
456789012345678901234567890123456789012345678901234567890123456789"));
+-        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++                                    "012345678901234567890123456789012345=
678901234567890123456789012345678901234567890123456789012345678901234567890=
1234567890123456789"));
++                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
+    { dg-end-multiline-output "" } */
+=20
+   /* Another expression that transitions between ordinary maps; this
+@@ -685,8 +685,8 @@ void test_multiple_ordinary_maps (void)
+ /* { dg-begin-multiline-output "" }
+    __emit_expression_range (0, foo (0, "012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
890123456789012345678901234567890123456789012345678901234567890123456789012=
345678901234567890123456789012345678901234567890123456789012345678901234567=
89012345678901234567890123456789",
+                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+-        0));
+-        ~~=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
++                                    0));
++                                    ~~
+    { dg-end-multiline-output "" } */
+ }
+=20
+diff --git a/gcc/testsuite/gcc.dg/plugin/diagnostic-test-string-literals-1=
.c b/gcc/testsuite/gcc.dg/plugin/diagnostic-test-string-literals-1.c
+--- a/gcc/testsuite/gcc.dg/plugin/diagnostic-test-string-literals-1.c	2020=
-07-22 23:35:18.172393674 -0700
++++ b/gcc/testsuite/gcc.dg/plugin/diagnostic-test-string-literals-1.c	2021=
-12-25 01:20:53.491636427 -0800
+@@ -335,11 +335,11 @@ pr87652 (const char *stem, int counter)
+ /* { dg-error "unable to read substring location: unable to read source l=
ine" "" { target c } 329 } */
+ /* { dg-error "unable to read substring location: failed to get ordinary =
maps" "" { target c++ } 329 } */
+ /* { dg-begin-multiline-output "" }
+-     __emit_string_literal_range(__FILE__":%5d: " format, \
++     __emit_string_literal_range(__FILE__":%5d: " format,        \
+                                  ^~~~~~~~
+      { dg-end-multiline-output "" { target c } } */
+ /* { dg-begin-multiline-output "" }
+-     __emit_string_literal_range(__FILE__":%5d: " format, \
++     __emit_string_literal_range(__FILE__":%5d: " format,        \
+                                  ^
+      { dg-end-multiline-output "" { target c++ } } */
+=20
+diff --git a/gcc/testsuite/gcc.dg/redecl-4.c b/gcc/testsuite/gcc.dg/redecl=
-4.c
+--- a/gcc/testsuite/gcc.dg/redecl-4.c	2020-07-22 23:35:18.192393895 -0700
++++ b/gcc/testsuite/gcc.dg/redecl-4.c	2021-12-25 01:20:53.491636427 -0800
+@@ -15,7 +15,7 @@ f (void)
+     /* Should get format warnings even though the built-in declaration
+        isn't "visible".  */
+     printf (
+-	    "%s", 1); /* { dg-warning "8:format" } */
++	    "%s", 1); /* { dg-warning "15:format" } */
+     /* The type of strcmp here should have no prototype.  */
+     if (0)
+       strcmp (1);
+diff --git a/gcc/testsuite/g++.dg/diagnostic/bad-binary-ops.C b/gcc/testsu=
ite/g++.dg/diagnostic/bad-binary-ops.C
+--- a/gcc/testsuite/g++.dg/diagnostic/bad-binary-ops.C	2020-07-22 23:35:17=
.972391472 -0700
++++ b/gcc/testsuite/g++.dg/diagnostic/bad-binary-ops.C	2021-12-25 01:20:53=
.491636427 -0800
+@@ -33,10 +33,10 @@ int test_2 (void)
+            ~~~~~~~~~~~~~~~~
+                          |
+                          s
+-    + some_other_function ());
+-    ^ ~~~~~~~~~~~~~~~~~~~~~~
+-                          |
+-                          t
++           + some_other_function ());
++           ^ ~~~~~~~~~~~~~~~~~~~~~~
++                                 |
++                                 t
+    { dg-end-multiline-output "" } */
+ }
+=20
+diff --git a/gcc/testsuite/g++.dg/parse/error4.C b/gcc/testsuite/g++.dg/pa=
rse/error4.C
+--- a/gcc/testsuite/g++.dg/parse/error4.C	2020-07-22 23:35:18.012391910 -0=
700
++++ b/gcc/testsuite/g++.dg/parse/error4.C	2021-12-25 01:20:53.491636427 -0=
800
+@@ -7,4 +7,4 @@ struct X {
+ 		 int);
+ };
+=20
+-// { dg-error "4:'itn' has not been declared" "" { target *-*-* } 6 }
++// { dg-error "18:'itn' has not been declared" "" { target *-*-* } 6 }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-1.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2020-07-22 23=
:35:18.512397420 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-25 01=
:20:53.491636427 -0800
+@@ -8,17 +8,22 @@
+ ! We can't rely on any ordering of the keys.
+=20
+ ! { dg-regexp "\"kind\": \"error\"" }
++! { dg-regexp "\"column-origin\": 1" }
+ ! { dg-regexp "\"message\": \"#error message\"" }
+=20
+ ! { dg-regexp "\"caret\": \{" }
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-1.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 2" }
++! { dg-regexp "\"display-column\": 2" }
++! { dg-regexp "\"byte-column\": 2" }
+=20
+ ! { dg-regexp "\"finish\": \{" }
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-1.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 6" }
++! { dg-regexp "\"display-column\": 6" }
++! { dg-regexp "\"byte-column\": 6" }
+=20
+ ! { dg-regexp "\"locations\": \[\[\{\}, \]*\]" }
+ ! { dg-regexp "\"children\": \[\[\]\[\]\]" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-2.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2020-07-22 23=
:35:18.512397420 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-25 01=
:20:53.491636427 -0800
+@@ -8,6 +8,7 @@
+ ! We can't rely on any ordering of the keys.=20
+=20
+ ! { dg-regexp "\"kind\": \"warning\"" }
++! { dg-regexp "\"column-origin\": 1" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Wcpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+@@ -16,11 +17,15 @@
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-2.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 2" }
++! { dg-regexp "\"display-column\": 2" }
++! { dg-regexp "\"byte-column\": 2" }
+=20
+ ! { dg-regexp "\"finish\": \{" }
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-2.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 8" }
++! { dg-regexp "\"display-column\": 8" }
++! { dg-regexp "\"byte-column\": 8" }
+=20
+ ! { dg-regexp "\"locations\": \[\[\{\}, \]*\]" }
+ ! { dg-regexp "\"children\": \[\[\]\[\]\]" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-3.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2020-07-22 23=
:35:18.512397420 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-25 01=
:20:53.491636427 -0800
+@@ -8,6 +8,7 @@
+ ! We can't rely on any ordering of the keys.
+=20
+ ! { dg-regexp "\"kind\": \"error\"" }
++! { dg-regexp "\"column-origin\": 1" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Werror=3Dcpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+@@ -16,11 +17,15 @@
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-3.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 2" }
++! { dg-regexp "\"display-column\": 2" }
++! { dg-regexp "\"byte-column\": 2" }
+=20
+ ! { dg-regexp "\"finish\": \{" }
+ ! { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-3.F90\"" }
+ ! { dg-regexp "\"line\": 4" }
+ ! { dg-regexp "\"column\": 8" }
++! { dg-regexp "\"display-column\": 8" }
++! { dg-regexp "\"byte-column\": 8" }
+=20
+ ! { dg-regexp "\"locations\": \[\[\{\}, \]*\]" }
+ ! { dg-regexp "\"children\": \[\[\]\[\]\]" }
+diff --git a/gcc/testsuite/go.dg/arrayclear.go b/gcc/testsuite/go.dg/array=
clear.go
+--- a/gcc/testsuite/go.dg/arrayclear.go	2020-07-22 23:35:18.588398257 -0700
++++ b/gcc/testsuite/go.dg/arrayclear.go	2021-12-25 01:20:53.491636427 -0800
+@@ -1,5 +1,8 @@
+ // { dg-do compile }
+ // { dg-options "-fgo-debug-optimization" }
++// This comment is necessary to work around a dejagnu bug. Otherwise, the
++// column of the second error message would equal the row of the first on=
e, and
++// since the errors are also identical, dejagnu is not able to distinguis=
h them.
+=20
+ package p
+=20
+diff --git a/gcc/testsuite/g++.old-deja/g++.brendan/crash11.C b/gcc/testsu=
ite/g++.old-deja/g++.brendan/crash11.C
+--- a/gcc/testsuite/g++.old-deja/g++.brendan/crash11.C	2020-07-22 23:35:18=
.048392308 -0700
++++ b/gcc/testsuite/g++.old-deja/g++.brendan/crash11.C	2021-12-25 01:20:53=
.491636427 -0800
+@@ -9,13 +9,13 @@ class A {
+ 	int	h;
+ 	A() { i=3D10; j=3D20; }
+ 	virtual void f1() { printf("i=3D%d j=3D%d\n",i,j); }
+-	friend virtual void f2() { printf("i=3D%d j=3D%d\n",i,j); } // { dg-erro=
r "9:virtual functions cannot be friends" }
++	friend virtual void f2() { printf("i=3D%d j=3D%d\n",i,j); } // { dg-erro=
r "16:virtual functions cannot be friends" }
+ };
+=20
+ class B : public A {
+     public:
+ 	virtual void f1() { printf("i=3D%d j=3D%d\n",i,j); }// { dg-error "" }  =
member.*// ERROR -  member.*
+-	friend virtual void f2() { printf("i=3D%d j=3D%d\n",i,j); }  // { dg-err=
or "9:virtual functions cannot be friends" }
++	friend virtual void f2() { printf("i=3D%d j=3D%d\n",i,j); }  // { dg-err=
or "16:virtual functions cannot be friends" }
+ // { dg-error "private" "" { target *-*-* } .-1 }
+ };
+=20
+diff --git a/gcc/testsuite/g++.old-deja/g++.pt/overload2.C b/gcc/testsuite=
/g++.old-deja/g++.pt/overload2.C
+--- a/gcc/testsuite/g++.old-deja/g++.pt/overload2.C	2020-07-22 23:35:18.07=
2392572 -0700
++++ b/gcc/testsuite/g++.old-deja/g++.pt/overload2.C	2021-12-25 01:20:53.49=
1636427 -0800
+@@ -12,5 +12,5 @@ int
+ main()
+ {
+ 	C<char*>	c;
+-	char*		p =3D Z(c.O); //{ dg-error "13:'Z' was not declared" } ambiguous =
c.O
++	char*		p =3D Z(c.O); //{ dg-error "29:'Z' was not declared" } ambiguous =
c.O
+ }
+diff --git a/gcc/testsuite/g++.old-deja/g++.robertl/eb109.C b/gcc/testsuit=
e/g++.old-deja/g++.robertl/eb109.C
+--- a/gcc/testsuite/g++.old-deja/g++.robertl/eb109.C	2020-07-22 23:35:18.0=
76392617 -0700
++++ b/gcc/testsuite/g++.old-deja/g++.robertl/eb109.C	2021-12-25 01:20:53.4=
91636427 -0800
+@@ -48,8 +48,8 @@ ostream& operator<<(ostream& os, Graph<V
+=20
+         // The compiler does not like this line!!!!!!
+         typename Graph<VertexType, EdgeType>::Successor::iterator
+-	  startN =3D G[i].second.begin(), // { dg-error "14:no match" } no index=
 operator
+-	  endN   =3D G[i].second.end();  // { dg-error "14:no match" } no index =
operator
++	  startN =3D G[i].second.begin(), // { dg-error "21:no match" } no index=
 operator
++	  endN   =3D G[i].second.end();  // { dg-error "21:no match" } no index =
operator
+=20
+         while(startN !=3D endN)
+         {
+diff --git a/gcc/tree-diagnostic-path.cc b/gcc/tree-diagnostic-path.cc
+--- a/gcc/tree-diagnostic-path.cc	2020-07-22 23:35:18.628398698 -0700
++++ b/gcc/tree-diagnostic-path.cc	2021-12-25 01:20:53.491636427 -0800
+@@ -493,7 +493,7 @@ default_tree_diagnostic_path_printer (di
+    doesn't have access to trees (for m_fndecl).  */
+=20
+ json::value *
+-default_tree_make_json_for_path (diagnostic_context *,
++default_tree_make_json_for_path (diagnostic_context *context,
+ 				 const diagnostic_path *path)
+ {
+   json::array *path_array =3D new json::array ();
+@@ -504,7 +504,8 @@ default_tree_make_json_for_path (diagnos
+       json::object *event_obj =3D new json::object ();
+       if (event.get_location ())
+ 	event_obj->set ("location",
+-			json_from_expanded_location (event.get_location ()));
++			json_from_expanded_location (context,
++						     event.get_location ()));
+       label_text event_text (event.get_desc (false));
+       event_obj->set ("description", new json::string (event_text.m_buffe=
r));
+       event_text.maybe_free ();
+diff --git a/libcpp/charset.c b/libcpp/charset.c
+--- a/libcpp/charset.c	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/charset.c	2021-12-25 01:20:53.491636427 -0800
+@@ -2276,49 +2276,90 @@ cpp_string_location_reader::get_next ()
+   return result;
+ }
+=20
+-/* Helper for cpp_byte_column_to_display_column and its inverse.  Given a
+-   pointer to a UTF-8-encoded character, compute its display width.  *INB=
UFP
+-   points on entry to the start of the UTF-8 encoding of the character, a=
nd
+-   is updated to point just after the last byte of the encoding.  *INBYTE=
SLEFTP
+-   contains on entry the remaining size of the buffer into which *INBUFP
+-   points, and this is also updated accordingly.  If *INBUFP does not
++cpp_display_width_computation::
++cpp_display_width_computation (const char *data, int data_length, int tab=
stop) :
++  m_begin (data),
++  m_next (m_begin),
++  m_bytes_left (data_length),
++  m_tabstop (tabstop),
++  m_display_cols (0)
++{
++  gcc_assert (m_tabstop > 0);
++}
++
++
++/* The main implementation function for class cpp_display_width_computati=
on.
++   m_next points on entry to the start of the UTF-8 encoding of the next
++   character, and is updated to point just after the last byte of the enc=
oding.
++   m_bytes_left contains on entry the remaining size of the buffer into w=
hich
++   m_next points, and this is also updated accordingly.  If m_next does n=
ot
+    point to a valid UTF-8-encoded sequence, then it will be treated as a =
single
+-   byte with display width 1.  */
++   byte with display width 1.  m_cur_display_col is the current display c=
olumn,
++   relative to which tab stops should be expanded.  Returns the display w=
idth of
++   the codepoint just processed.  */
+=20
+-static inline int
+-compute_next_display_width (const uchar **inbufp, size_t *inbytesleftp)
++int
++cpp_display_width_computation::process_next_codepoint ()
+ {
+   cppchar_t c;
+-  if (one_utf8_to_cppchar (inbufp, inbytesleftp, &c) !=3D 0)
++  int next_width;
++
++  if (*m_next =3D=3D '\t')
++    {
++      ++m_next;
++      --m_bytes_left;
++      next_width =3D m_tabstop - (m_display_cols % m_tabstop);
++    }
++  else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left, =
&c)
++	   !=3D 0)
+     {
+       /* Input is not convertible to UTF-8.  This could be fine, e.g. in a
+ 	 string literal, so don't complain.  Just treat it as if it has a width
+ 	 of one.  */
+-      ++*inbufp;
+-      --*inbytesleftp;
+-      return 1;
++      ++m_next;
++      --m_bytes_left;
++      next_width =3D 1;
++    }
++  else
++    {
++      /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for u=
s.  */
++      next_width =3D cpp_wcwidth (c);
+     }
+=20
+-  /*  one_utf8_to_cppchar() has updated inbufp and inbytesleftp for us.  =
*/
+-  return cpp_wcwidth (c);
++  m_display_cols +=3D next_width;
++  return next_width;
++}
++
++/*  Utility to advance the byte stream by the minimum amount needed to co=
nsume
++    N display columns.  Returns the number of display columns that were
++    actually skipped.  This could be less than N, if there was not enough=
 data,
++    or more than N, if the last character to be skipped had a sufficientl=
y large
++    display width.  */
++int
++cpp_display_width_computation::advance_display_cols (int n)
++{
++  const int start =3D m_display_cols;
++  const int target =3D start + n;
++  while (m_display_cols < target && !done ())
++    process_next_codepoint ();
++  return m_display_cols - start;
+ }
+=20
+ /*  For the string of length DATA_LENGTH bytes that begins at DATA, compu=
te
+     how many display columns are occupied by the first COLUMN bytes.  COL=
UMN
+     may exceed DATA_LENGTH, in which case the phantom bytes at the end are
+-    treated as if they have display width 1.  */
++    treated as if they have display width 1.  Tabs are expanded to the ne=
xt tab
++    stop, relative to the start of DATA.  */
+=20
+ int
+ cpp_byte_column_to_display_column (const char *data, int data_length,
+-				   int column)
++				   int column, int tabstop)
+ {
+-  int display_col =3D 0;
+-  const uchar *udata =3D (const uchar *) data;
+   const int offset =3D MAX (0, column - data_length);
+-  size_t inbytesleft =3D column - offset;
+-  while (inbytesleft)
+-    display_col +=3D compute_next_display_width (&udata, &inbytesleft);
+-  return display_col + offset;
++  cpp_display_width_computation dw (data, column - offset, tabstop);
++  while (!dw.done ())
++    dw.process_next_codepoint ();
++  return dw.display_cols_processed () + offset;
+ }
+=20
+ /*  For the string of length DATA_LENGTH bytes that begins at DATA, compu=
te
+@@ -2328,14 +2369,11 @@ cpp_byte_column_to_display_column (const
+=20
+ int
+ cpp_display_column_to_byte_column (const char *data, int data_length,
+-				   int display_col)
++				   int display_col, int tabstop)
+ {
+-  int column =3D 0;
+-  const uchar *udata =3D (const uchar *) data;
+-  size_t inbytesleft =3D data_length;
+-  while (column < display_col && inbytesleft)
+-      column +=3D compute_next_display_width (&udata, &inbytesleft);
+-  return data_length - inbytesleft + MAX (0, display_col - column);
++  cpp_display_width_computation dw (data, data_length, tabstop);
++  const int avail_display =3D dw.advance_display_cols (display_col);
++  return dw.bytes_processed () + MAX (0, display_col - avail_display);
+ }
+=20
+ /* Our own version of wcwidth().  We don't use the actual wcwidth() in gl=
ibc,
+diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
+--- a/libcpp/include/cpplib.h	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/include/cpplib.h	2021-12-25 01:20:53.491636427 -0800
+@@ -312,9 +312,6 @@ enum cpp_normalize_level {
+    carries all the options visible to the command line.  */
+ struct cpp_options
+ {
+-  /* Characters between tab stops.  */
+-  unsigned int tabstop;
+-
+   /* The language we're preprocessing.  */
+   enum c_lang lang;
+=20
+@@ -1322,14 +1319,43 @@ extern const char * cpp_get_userdef_suff
+   (const cpp_token *);
+=20
+ /* In charset.c */
++
++/* A class to manage the state while converting a UTF-8 sequence to cppch=
ar_t
++   and computing the display width one character at a time.  */
++class cpp_display_width_computation {
++ public:
++  cpp_display_width_computation (const char *data, int data_length,
++				 int tabstop);
++  const char *next_byte () const { return m_next; }
++  int bytes_processed () const { return m_next - m_begin; }
++  int bytes_left () const { return m_bytes_left; }
++  bool done () const { return !bytes_left (); }
++  int display_cols_processed () const { return m_display_cols; }
++
++  int process_next_codepoint ();
++  int advance_display_cols (int n);
++
++ private:
++  const char *const m_begin;
++  const char *m_next;
++  size_t m_bytes_left;
++  const int m_tabstop;
++  int m_display_cols;
++};
++
++/* Convenience functions that are simple use cases for class
++   cpp_display_width_computation.  Tab characters will be expanded to spa=
ces
++   as determined by TABSTOP.  */
+ int cpp_byte_column_to_display_column (const char *data, int data_length,
+-				       int column);
+-inline int cpp_display_width (const char *data, int data_length)
++				       int column, int tabstop);
++inline int cpp_display_width (const char *data, int data_length,
++			      int tabstop)
+ {
+-    return cpp_byte_column_to_display_column (data, data_length, data_len=
gth);
++  return cpp_byte_column_to_display_column (data, data_length, data_lengt=
h,
++					    tabstop);
+ }
+ int cpp_display_column_to_byte_column (const char *data, int data_length,
+-				       int display_col);
++				       int display_col, int tabstop);
+ int cpp_wcwidth (cppchar_t c);
+=20
+ #endif /* ! LIBCPP_CPPLIB_H */
+diff --git a/libcpp/init.c b/libcpp/init.c
+--- a/libcpp/init.c	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/init.c	2021-12-25 01:20:53.491636427 -0800
+@@ -190,7 +190,6 @@ cpp_create_reader (enum c_lang lang, cpp
+   CPP_OPTION (pfile, discard_comments) =3D 1;
+   CPP_OPTION (pfile, discard_comments_in_macro_exp) =3D 1;
+   CPP_OPTION (pfile, max_include_depth) =3D 200;
+-  CPP_OPTION (pfile, tabstop) =3D 8;
+   CPP_OPTION (pfile, operator_names) =3D 1;
+   CPP_OPTION (pfile, warn_trigraphs) =3D 2;
+   CPP_OPTION (pfile, warn_endif_labels) =3D 1;
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/meta=
/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
new file mode 100644
index 0000000000..5b1896ed69
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
@@ -0,0 +1,2270 @@
+From bd5e882cf6e0def3dd1bc106075d59a303fe0d1e Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Mon, 18 Oct 2021 18:55:31 -0400
+Subject: [PATCH] diagnostics: escape non-ASCII source bytes for certain
+ diagnostics
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+This patch adds support to GCC's diagnostic subsystem for escaping certain
+bytes and Unicode characters when quoting source code.
+
+Specifically, this patch adds a new flag rich_location::m_escape_on_output
+which is a hint from a diagnostic that non-ASCII bytes in the pertinent
+lines of the user's source code should be escaped when printed.
+
+The patch sets this for the following diagnostics:
+- when complaining about stray bytes in the program (when these
+are non-printable)
+- when complaining about "null character(s) ignored");
+- for -Wnormalized=3D (and generate source ranges for such warnings)
+
+The escaping is controlled by a new option:
+  -fdiagnostics-escape-format=3D[unicode|bytes]
+
+For example, consider a diagnostic involing a source line containing the
+string "before" followed by the Unicode character U+03C0 ("GREEK SMALL
+LETTER PI", with UTF-8 encoding 0xCF 0x80) followed by the byte 0xBF
+(a stray UTF-8 trailing byte), followed by the string "after", where the
+diagnostic highlights the U+03C0 character.
+
+By default, this line will be printed verbatim to the user when
+reporting a diagnostic at it, as:
+
+ before=C3=8FXafter
+       ^
+
+(using X for the stray byte to avoid putting invalid UTF-8 in this
+commit message)
+
+If the diagnostic sets the "escape" flag, it will be printed as:
+
+ before<U+03C0><BF>after
+       ^~~~~~~~
+
+with -fdiagnostics-escape-format=3Dunicode (the default), or as:
+
+  before<CF><80><BF>after
+        ^~~~~~~~
+
+if the user supplies -fdiagnostics-escape-format=3Dbytes.
+
+This only affects how the source is printed; it does not affect
+how column numbers that are printed (as per -fdiagnostics-column-unit=3D
+and -fdiagnostics-column-origin=3D).
+
+gcc/c-family/ChangeLog:
+	* c-lex.c (c_lex_with_flags): When complaining about non-printable
+	CPP_OTHER tokens, set the "escape on output" flag.
+
+gcc/ChangeLog:
+	* common.opt (fdiagnostics-escape-format=3D): New.
+	(diagnostics_escape_format): New enum.
+	(DIAGNOSTICS_ESCAPE_FORMAT_UNICODE): New enum value.
+	(DIAGNOSTICS_ESCAPE_FORMAT_BYTES): Likewise.
+	* diagnostic-format-json.cc (json_end_diagnostic): Add
+	"escape-source" attribute.
+	* diagnostic-show-locus.c
+	(exploc_with_display_col::exploc_with_display_col): Replace
+	"tabstop" param with a cpp_char_column_policy and add an "aspect"
+	param.  Use these to compute m_display_col accordingly.
+	(struct char_display_policy): New struct.
+	(layout::m_policy): New field.
+	(layout::m_escape_on_output): New field.
+	(def_policy): New function.
+	(make_range): Update for changes to exploc_with_display_col ctor.
+	(default_print_decoded_ch): New.
+	(width_per_escaped_byte): New.
+	(escape_as_bytes_width): New.
+	(escape_as_bytes_print): New.
+	(escape_as_unicode_width): New.
+	(escape_as_unicode_print): New.
+	(make_policy): New.
+	(layout::layout): Initialize new fields.  Update m_exploc ctor
+	call for above change to ctor.
+	(layout::maybe_add_location_range): Update for changes to
+	exploc_with_display_col ctor.
+	(layout::calculate_x_offset_display): Update for change to
+	cpp_display_width.
+	(layout::print_source_line): Pass policy
+	to cpp_display_width_computation. Capture cpp_decoded_char when
+	calling process_next_codepoint.  Move printing of source code to
+	m_policy.m_print_cb.
+	(line_label::line_label): Pass in policy rather than context.
+	(layout::print_any_labels): Update for change to line_label ctor.
+	(get_affected_range): Pass in policy rather than context, updating
+	calls to location_compute_display_column accordingly.
+	(get_printed_columns): Likewise, also for cpp_display_width.
+	(correction::correction): Pass in policy rather than tabstop.
+	(correction::compute_display_cols): Pass m_policy rather than
+	m_tabstop to cpp_display_width.
+	(correction::m_tabstop): Replace with...
+	(correction::m_policy): ...this.
+	(line_corrections::line_corrections): Pass in policy rather than
+	context.
+	(line_corrections::m_context): Replace with...
+	(line_corrections::m_policy): ...this.
+	(line_corrections::add_hint): Update to use m_policy rather than
+	m_context.
+	(line_corrections::add_hint): Likewise.
+	(layout::print_trailing_fixits): Likewise.
+	(selftest::test_display_widths): New.
+	(selftest::test_layout_x_offset_display_utf8): Update to use
+	policy rather than tabstop.
+	(selftest::test_one_liner_labels_utf8): Add test of escaping
+	source lines.
+	(selftest::test_diagnostic_show_locus_one_liner_utf8): Update to
+	use policy rather than tabstop.
+	(selftest::test_overlapped_fixit_printing): Likewise.
+	(selftest::test_overlapped_fixit_printing_utf8): Likewise.
+	(selftest::test_overlapped_fixit_printing_2): Likewise.
+	(selftest::test_tab_expansion): Likewise.
+	(selftest::test_escaping_bytes_1): New.
+	(selftest::test_escaping_bytes_2): New.
+	(selftest::diagnostic_show_locus_c_tests): Call the new tests.
+	* diagnostic.c (diagnostic_initialize): Initialize
+	context->escape_format.
+	(convert_column_unit): Update to use default character width policy.
+	(selftest::test_diagnostic_get_location_text): Likewise.
+	* diagnostic.h (enum diagnostics_escape_format): New enum.
+	(diagnostic_context::escape_format): New field.
+	* doc/invoke.texi (-fdiagnostics-escape-format=3D): New option.
+	(-fdiagnostics-format=3D): Add "escape-source" attribute to examples
+	of JSON output, and document it.
+	* input.c (location_compute_display_column): Pass in "policy"
+	rather than "tabstop", passing to
+	cpp_byte_column_to_display_column.
+	(selftest::test_cpp_utf8): Update to use cpp_char_column_policy.
+	* input.h (class cpp_char_column_policy): New forward decl.
+	(location_compute_display_column): Pass in "policy" rather than
+	"tabstop".
+	* opts.c (common_handle_option): Handle
+	OPT_fdiagnostics_escape_format_.
+	* selftest.c (temp_source_file::temp_source_file): New ctor
+	overload taking a size_t.
+	* selftest.h (temp_source_file::temp_source_file): Likewise.
+
+gcc/testsuite/ChangeLog:
+	* c-c++-common/diagnostic-format-json-1.c: Add regexp to consume
+	"escape-source" attribute.
+	* c-c++-common/diagnostic-format-json-2.c: Likewise.
+	* c-c++-common/diagnostic-format-json-3.c: Likewise.
+	* c-c++-common/diagnostic-format-json-4.c: Likewise, twice.
+	* c-c++-common/diagnostic-format-json-5.c: Likewise.
+	* gcc.dg/cpp/warn-normalized-4-bytes.c: New test.
+	* gcc.dg/cpp/warn-normalized-4-unicode.c: New test.
+	* gcc.dg/encoding-issues-bytes.c: New test.
+	* gcc.dg/encoding-issues-unicode.c: New test.
+	* gfortran.dg/diagnostic-format-json-1.F90: Add regexp to consume
+	"escape-source" attribute.
+	* gfortran.dg/diagnostic-format-json-2.F90: Likewise.
+	* gfortran.dg/diagnostic-format-json-3.F90: Likewise.
+
+libcpp/ChangeLog:
+	* charset.c (convert_escape): Use encoding_rich_location when
+	complaining about nonprintable unknown escape sequences.
+	(cpp_display_width_computation::::cpp_display_width_computation):
+	Pass in policy rather than tabstop.
+	(cpp_display_width_computation::process_next_codepoint): Add "out"
+	param and populate *out if non-NULL.
+	(cpp_display_width_computation::advance_display_cols): Pass NULL
+	to process_next_codepoint.
+	(cpp_byte_column_to_display_column): Pass in policy rather than
+	tabstop.  Pass NULL to process_next_codepoint.
+	(cpp_display_column_to_byte_column): Pass in policy rather than
+	tabstop.
+	* errors.c (cpp_diagnostic_get_current_location): New function,
+	splitting out the logic from...
+	(cpp_diagnostic): ...here.
+	(cpp_warning_at): New function.
+	(cpp_pedwarning_at): New function.
+	* include/cpplib.h (cpp_warning_at): New decl for rich_location.
+	(cpp_pedwarning_at): Likewise.
+	(struct cpp_decoded_char): New.
+	(struct cpp_char_column_policy): New.
+	(cpp_display_width_computation::cpp_display_width_computation):
+	Replace "tabstop" param with "policy".
+	(cpp_display_width_computation::process_next_codepoint): Add "out"
+	param.
+	(cpp_display_width_computation::m_tabstop): Replace with...
+	(cpp_display_width_computation::m_policy): ...this.
+	(cpp_byte_column_to_display_column): Replace "tabstop" param with
+	"policy".
+	(cpp_display_width): Likewise.
+	(cpp_display_column_to_byte_column): Likewise.
+	* include/line-map.h (rich_location::escape_on_output_p): New.
+	(rich_location::set_escape_on_output): New.
+	(rich_location::m_escape_on_output): New.
+	* internal.h (cpp_diagnostic_get_current_location): New decl.
+	(class encoding_rich_location): New.
+	* lex.c (skip_whitespace): Use encoding_rich_location when
+	complaining about null characters.
+	(warn_about_normalization): Generate a source range when
+	complaining about improperly normalized tokens, rather than just a
+	point, and use encoding_rich_location so that the source code
+	is escaped on printing.
+	* line-map.c (rich_location::rich_location): Initialize
+	m_escape_on_output.
+
+Signed-off-by: David Malcolm <dmalcolm@redhat.com>
+
+CVE: CVE-2021-42574
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;=
h=3Dbd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ gcc/c-family/c-lex.c                          |   6 +-
+ gcc/common.opt                                |  13 +
+ gcc/diagnostic-format-json.cc                 |   3 +
+ gcc/diagnostic-show-locus.c                   | 580 +++++++++++++++---
+ gcc/diagnostic.c                              |  10 +-
+ gcc/diagnostic.h                              |  18 +
+ gcc/doc/invoke.texi                           |  43 +-
+ gcc/input.c                                   |  62 +-
+ gcc/input.h                                   |   7 +-
+ gcc/opts.c                                    |   4 +
+ gcc/selftest.c                                |  15 +
+ gcc/selftest.h                                |   2 +
+ .../c-c++-common/diagnostic-format-json-1.c   |   1 +
+ .../c-c++-common/diagnostic-format-json-2.c   |   1 +
+ .../c-c++-common/diagnostic-format-json-3.c   |   1 +
+ .../c-c++-common/diagnostic-format-json-4.c   |   2 +
+ .../c-c++-common/diagnostic-format-json-5.c   |   1 +
+ .../gcc.dg/cpp/warn-normalized-4-bytes.c      |  21 +
+ .../gcc.dg/cpp/warn-normalized-4-unicode.c    |  19 +
+ gcc/testsuite/gcc.dg/encoding-issues-bytes.c  | Bin 0 -> 595 bytes
+ .../gcc.dg/encoding-issues-unicode.c          | Bin 0 -> 613 bytes
+ .../gfortran.dg/diagnostic-format-json-1.F90  |   1 +
+ .../gfortran.dg/diagnostic-format-json-2.F90  |   1 +
+ .../gfortran.dg/diagnostic-format-json-3.F90  |   1 +
+ libcpp/charset.c                              |  63 +-
+ libcpp/errors.c                               |  82 ++-
+ libcpp/include/cpplib.h                       |  76 ++-
+ libcpp/include/line-map.h                     |  13 +
+ libcpp/internal.h                             |  23 +
+ libcpp/lex.c                                  |  38 +-
+ libcpp/line-map.c                             |   3 +-
+ 31 files changed, 942 insertions(+), 168 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
+ create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
+ create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-bytes.c
+ create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-unicode.c
+
+diff --git a/gcc/c-family/c-lex.c b/gcc/c-family/c-lex.c
+--- a/gcc/c-family/c-lex.c	2020-07-22 23:35:17.296384022 -0700
++++ b/gcc/c-family/c-lex.c	2021-12-25 01:30:50.669689023 -0800
+@@ -587,7 +587,11 @@ c_lex_with_flags (tree *value, location_
+ 	else if (ISGRAPH (c))
+ 	  error_at (*loc, "stray %qc in program", (int) c);
+ 	else
+-	  error_at (*loc, "stray %<\\%o%> in program", (int) c);
++	  {
++	    rich_location rich_loc (line_table, *loc);
++	    rich_loc.set_escape_on_output (true);
++	    error_at (&rich_loc, "stray %<\\%o%> in program", (int) c);
++	  }
+       }
+       goto retry;
+=20
+diff --git a/gcc/common.opt b/gcc/common.opt
+--- a/gcc/common.opt	2021-12-25 01:29:12.915317374 -0800
++++ b/gcc/common.opt	2021-12-25 01:30:50.669689023 -0800
+@@ -1337,6 +1337,10 @@ fdiagnostics-format=3D
+ Common Joined RejectNegative Enum(diagnostics_output_format)
+ -fdiagnostics-format=3D[text|json]	Select output format.
+=20
++fdiagnostics-escape-format=3D
++Common Joined RejectNegative Enum(diagnostics_escape_format)
++-fdiagnostics-escape-format=3D[unicode|bytes]	Select how to escape non-pr=
intable-ASCII bytes in the source for diagnostics that suggest it.
++
+ ; Required for these enum values.
+ SourceInclude
+ diagnostic.h
+@@ -1351,6 +1355,15 @@ EnumValue
+ Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNIT_=
BYTE)
+=20
+ Enum
++Name(diagnostics_escape_format) Type(int)
++
++EnumValue
++Enum(diagnostics_escape_format) String(unicode) Value(DIAGNOSTICS_ESCAPE_=
FORMAT_UNICODE)
++
++EnumValue
++Enum(diagnostics_escape_format) String(bytes) Value(DIAGNOSTICS_ESCAPE_FO=
RMAT_BYTES)
++
++Enum
+ Name(diagnostics_output_format) Type(int)
+=20
+ EnumValue
+diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
+--- a/gcc/diagnostic.c	2021-12-25 01:29:12.915317374 -0800
++++ b/gcc/diagnostic.c	2021-12-25 01:30:50.669689023 -0800
+@@ -223,6 +223,7 @@ diagnostic_initialize (diagnostic_contex
+   context->column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
+   context->column_origin =3D 1;
+   context->tabstop =3D 8;
++  context->escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
+   context->edit_context_ptr =3D NULL;
+   context->diagnostic_group_nesting_depth =3D 0;
+   context->diagnostic_group_emission_count =3D 0;
+@@ -2152,8 +2153,8 @@ test_diagnostic_get_location_text ()
+     const char *const content =3D "smile \xf0\x9f\x98\x82\n";
+     const int line_bytes =3D strlen (content) - 1;
+     const int def_tabstop =3D 8;
+-    const int display_width =3D cpp_display_width (content, line_bytes,
+-						 def_tabstop);
++    const cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
++    const int display_width =3D cpp_display_width (content, line_bytes, p=
olicy);
+     ASSERT_EQ (line_bytes - 2, display_width);
+     temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
+     const char *const fname =3D tmp.get_filename ();
+diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.cc
+--- a/gcc/diagnostic-format-json.cc	2021-12-25 01:29:12.915317374 -0800
++++ b/gcc/diagnostic-format-json.cc	2021-12-25 01:30:50.669689023 -0800
+@@ -264,6 +264,9 @@ json_end_diagnostic (diagnostic_context
+       json::value *path_value =3D context->make_json_for_path (context, p=
ath);
+       diag_obj->set ("path", path_value);
+     }
++
++  diag_obj->set ("escape-source",
++		 new json::literal (richloc->escape_on_output_p ()));
+ }
+=20
+ /* No-op implementation of "begin_group_cb" for JSON output.  */
+diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
+--- a/gcc/diagnostic.h	2021-12-25 01:29:12.919317307 -0800
++++ b/gcc/diagnostic.h	2021-12-25 01:30:50.669689023 -0800
+@@ -38,6 +38,20 @@ enum diagnostics_column_unit
+   DIAGNOSTICS_COLUMN_UNIT_BYTE
+ };
+=20
++/* An enum for controlling how to print non-ASCII characters/bytes when
++   a diagnostic suggests escaping the source code on output.  */
++
++enum diagnostics_escape_format
++{
++  /* Escape non-ASCII Unicode characters in the form <U+XXXX> and
++     non-UTF-8 bytes in the form <XX>.  */
++  DIAGNOSTICS_ESCAPE_FORMAT_UNICODE,
++
++  /* Escape non-ASCII bytes in the form <XX> (thus showing the underlying
++     encoding of non-ASCII Unicode characters).  */
++  DIAGNOSTICS_ESCAPE_FORMAT_BYTES
++};
++
+ /* Enum for overriding the standard output format.  */
+=20
+ enum diagnostics_output_format
+@@ -303,6 +317,10 @@ struct diagnostic_context
+   /* The size of the tabstop for tab expansion.  */
+   int tabstop;
+=20
++  /* How should non-ASCII/non-printable bytes be escaped when
++     a diagnostic suggests escaping the source code on output.  */
++  enum diagnostics_escape_format escape_format;
++
+   /* If non-NULL, an edit_context to which fix-it hints should be
+      applied, for generating patches.  */
+   edit_context *edit_context_ptr;
+diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
+--- a/gcc/diagnostic-show-locus.c	2021-12-25 01:29:12.919317307 -0800
++++ b/gcc/diagnostic-show-locus.c	2021-12-25 01:30:50.673688956 -0800
+@@ -175,10 +175,26 @@ enum column_unit {
+ class exploc_with_display_col : public expanded_location
+ {
+  public:
+-  exploc_with_display_col (const expanded_location &exploc, int tabstop)
+-    : expanded_location (exploc),
+-      m_display_col (location_compute_display_column (exploc, tabstop))
+-  {}
++  exploc_with_display_col (const expanded_location &exploc,
++			   const cpp_char_column_policy &policy,
++			   enum location_aspect aspect)
++  : expanded_location (exploc),
++    m_display_col (location_compute_display_column (exploc, policy))
++  {
++    if (exploc.column > 0)
++      {
++	/* m_display_col is now the final column of the byte.
++	   If escaping has happened, we may want the first column instead.  */
++	if (aspect !=3D LOCATION_ASPECT_FINISH)
++	  {
++	    expanded_location prev_exploc (exploc);
++	    prev_exploc.column--;
++	    int prev_display_col
++	      =3D (location_compute_display_column (prev_exploc, policy));
++	    m_display_col =3D prev_display_col + 1;
++	  }
++      }
++  }
+=20
+   int m_display_col;
+ };
+@@ -313,6 +329,31 @@ test_line_span ()
+=20
+ #endif /* #if CHECKING_P */
+=20
++/* A bundle of information containing how to print unicode
++   characters and bytes when quoting source code.
++
++   Provides a unified place to support escaping some subset
++   of characters to some format.
++
++   Extends char_column_policy; printing is split out to avoid
++   libcpp having to know about pretty_printer.  */
++
++struct char_display_policy : public cpp_char_column_policy
++{
++ public:
++  char_display_policy (int tabstop,
++		       int (*width_cb) (cppchar_t c),
++		       void (*print_cb) (pretty_printer *pp,
++					 const cpp_decoded_char &cp))
++  : cpp_char_column_policy (tabstop, width_cb),
++    m_print_cb (print_cb)
++  {
++  }
++
++  void (*m_print_cb) (pretty_printer *pp,
++		      const cpp_decoded_char &cp);
++};
++
+ /* A class to control the overall layout when printing a diagnostic.
+=20
+    The layout is determined within the constructor.
+@@ -345,6 +386,8 @@ class layout
+=20
+   void print_line (linenum_type row);
+=20
++  void on_bad_codepoint (const char *ptr, cppchar_t ch, size_t ch_sz);
++
+  private:
+   bool will_show_line_p (linenum_type row) const;
+   void print_leading_fixits (linenum_type row);
+@@ -386,6 +429,7 @@ class layout
+  private:
+   diagnostic_context *m_context;
+   pretty_printer *m_pp;
++  char_display_policy m_policy;
+   location_t m_primary_loc;
+   exploc_with_display_col m_exploc;
+   colorizer m_colorizer;
+@@ -398,6 +442,7 @@ class layout
+   auto_vec <line_span> m_line_spans;
+   int m_linenum_width;
+   int m_x_offset_display;
++  bool m_escape_on_output;
+ };
+=20
+ /* Implementation of "class colorizer".  */
+@@ -646,6 +691,11 @@ layout_range::intersects_line_p (linenum
+ /* Default for when we don't care what the tab expansion is set to.  */
+ static const int def_tabstop =3D 8;
+=20
++static cpp_char_column_policy def_policy ()
++{
++  return cpp_char_column_policy (8, cpp_wcwidth);
++}
++
+ /* Create some expanded locations for testing layout_range.  The filename
+    member of the explocs is set to the empty string.  This member will on=
ly be
+    inspected by the calls to location_compute_display_column() made from =
the
+@@ -662,10 +712,13 @@ make_range (int start_line, int start_co
+     =3D {"", start_line, start_col, NULL, false};
+   const expanded_location finish_exploc
+     =3D {"", end_line, end_col, NULL, false};
+-  return layout_range (exploc_with_display_col (start_exploc, def_tabstop=
),
+-		       exploc_with_display_col (finish_exploc, def_tabstop),
++  return layout_range (exploc_with_display_col (start_exploc, def_policy =
(),
++						LOCATION_ASPECT_START),
++		       exploc_with_display_col (finish_exploc, def_policy (),
++						LOCATION_ASPECT_FINISH),
+ 		       SHOW_RANGE_WITHOUT_CARET,
+-		       exploc_with_display_col (start_exploc, def_tabstop),
++		       exploc_with_display_col (start_exploc, def_policy (),
++						LOCATION_ASPECT_CARET),
+ 		       0, NULL);
+ }
+=20
+@@ -950,6 +1003,164 @@ fixit_cmp (const void *p_a, const void *
+   return hint_a->get_start_loc () - hint_b->get_start_loc ();
+ }
+=20
++/* Callbacks for use when not escaping the source.  */
++
++/* The default callback for char_column_policy::m_width_cb is cpp_wcwidth=
.  */
++
++/* Callback for char_display_policy::m_print_cb for printing source chars
++   when not escaping the source.  */
++
++static void
++default_print_decoded_ch (pretty_printer *pp,
++			  const cpp_decoded_char &decoded_ch)
++{
++  for (const char *ptr =3D decoded_ch.m_start_byte;
++       ptr !=3D decoded_ch.m_next_byte; ptr++)
++    {
++      if (*ptr =3D=3D '\0' || *ptr =3D=3D '\r')
++	{
++	  pp_space (pp);
++	  continue;
++	}
++
++      pp_character (pp, *ptr);
++    }
++}
++
++/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
++
++static const int width_per_escaped_byte =3D 4;
++
++/* Callback for char_column_policy::m_width_cb for determining the
++   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
++
++static int
++escape_as_bytes_width (cppchar_t ch)
++{
++  if (ch < 0x80 && ISPRINT (ch))
++    return cpp_wcwidth (ch);
++  else
++    {
++      if (ch <=3D   0x7F) return 1 * width_per_escaped_byte;
++      if (ch <=3D  0x7FF) return 2 * width_per_escaped_byte;
++      if (ch <=3D 0xFFFF) return 3 * width_per_escaped_byte;
++      return 4 * width_per_escaped_byte;
++    }
++}
++
++/* Callback for char_display_policy::m_print_cb for printing source chars
++   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
++
++static void
++escape_as_bytes_print (pretty_printer *pp,
++		       const cpp_decoded_char &decoded_ch)
++{
++  if (!decoded_ch.m_valid_ch)
++    {
++      for (const char *iter =3D decoded_ch.m_start_byte;
++	   iter !=3D decoded_ch.m_next_byte; ++iter)
++	{
++	  char buf[16];
++	  sprintf (buf, "<%02x>", (unsigned char)*iter);
++	  pp_string (pp, buf);
++	}
++      return;
++    }
++
++  cppchar_t ch =3D decoded_ch.m_ch;
++  if (ch < 0x80 && ISPRINT (ch))
++    pp_character (pp, ch);
++  else
++    {
++      for (const char *iter =3D decoded_ch.m_start_byte;
++	   iter < decoded_ch.m_next_byte; ++iter)
++	{
++	  char buf[16];
++	  sprintf (buf, "<%02x>", (unsigned char)*iter);
++	  pp_string (pp, buf);
++	}
++    }
++}
++
++/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
++
++/* Callback for char_column_policy::m_width_cb for determining the
++   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
++
++static int
++escape_as_unicode_width (cppchar_t ch)
++{
++  if (ch < 0x80 && ISPRINT (ch))
++    return cpp_wcwidth (ch);
++  else
++    {
++      // Width of "<U+%04x>"
++      if (ch > 0xfffff)
++	return 10;
++      else if (ch > 0xffff)
++	return 9;
++      else
++	return 8;
++    }
++}
++
++/* Callback for char_display_policy::m_print_cb for printing source chars
++   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
++
++static void
++escape_as_unicode_print (pretty_printer *pp,
++			 const cpp_decoded_char &decoded_ch)
++{
++  if (!decoded_ch.m_valid_ch)
++    {
++      escape_as_bytes_print (pp, decoded_ch);
++      return;
++    }
++
++  cppchar_t ch =3D decoded_ch.m_ch;
++  if (ch < 0x80 && ISPRINT (ch))
++    pp_character (pp, ch);
++  else
++    {
++      char buf[16];
++      sprintf (buf, "<U+%04X>", ch);
++      pp_string (pp, buf);
++    }
++}
++
++/* Populate a char_display_policy based on DC and RICHLOC.  */
++
++static char_display_policy
++make_policy (const diagnostic_context &dc,
++	     const rich_location &richloc)
++{
++  /* The default is to not escape non-ASCII bytes.  */
++  char_display_policy result
++    (dc.tabstop, cpp_wcwidth, default_print_decoded_ch);
++
++  /* If the diagnostic suggests escaping non-ASCII bytes, then
++     use policy from user-supplied options.  */
++  if (richloc.escape_on_output_p ())
++    {
++      result.m_undecoded_byte_width =3D width_per_escaped_byte;
++      switch (dc.escape_format)
++	{
++	default:
++	  gcc_unreachable ();
++	case DIAGNOSTICS_ESCAPE_FORMAT_UNICODE:
++	  result.m_width_cb =3D escape_as_unicode_width;
++	  result.m_print_cb =3D escape_as_unicode_print;
++	  break;
++	case DIAGNOSTICS_ESCAPE_FORMAT_BYTES:
++	  result.m_width_cb =3D escape_as_bytes_width;
++	  result.m_print_cb =3D escape_as_bytes_print;
++	  break;
++	}
++    }
++
++  return result;
++}
++
+ /* Implementation of class layout.  */
+=20
+ /* Constructor for class layout.
+@@ -966,8 +1177,10 @@ layout::layout (diagnostic_context * con
+ 		diagnostic_t diagnostic_kind)
+ : m_context (context),
+   m_pp (context->printer),
++  m_policy (make_policy (*context, *richloc)),
+   m_primary_loc (richloc->get_range (0)->m_loc),
+-  m_exploc (richloc->get_expanded_location (0), context->tabstop),
++  m_exploc (richloc->get_expanded_location (0), m_policy,
++	    LOCATION_ASPECT_CARET),
+   m_colorizer (context, diagnostic_kind),
+   m_colorize_source_p (context->colorize_source_p),
+   m_show_labels_p (context->show_labels_p),
+@@ -977,7 +1190,8 @@ layout::layout (diagnostic_context * con
+   m_fixit_hints (richloc->get_num_fixit_hints ()),
+   m_line_spans (1 + richloc->get_num_locations ()),
+   m_linenum_width (0),
+-  m_x_offset_display (0)
++  m_x_offset_display (0),
++  m_escape_on_output (richloc->escape_on_output_p ())
+ {
+   for (unsigned int idx =3D 0; idx < richloc->get_num_locations (); idx++)
+     {
+@@ -1063,10 +1277,13 @@ layout::maybe_add_location_range (const
+=20
+   /* Everything is now known to be in the correct source file,
+      but it may require further sanitization.  */
+-  layout_range ri (exploc_with_display_col (start, m_context->tabstop),
+-		   exploc_with_display_col (finish, m_context->tabstop),
++  layout_range ri (exploc_with_display_col (start, m_policy,
++					    LOCATION_ASPECT_START),
++		   exploc_with_display_col (finish, m_policy,
++					    LOCATION_ASPECT_FINISH),
+ 		   loc_range->m_range_display_kind,
+-		   exploc_with_display_col (caret, m_context->tabstop),
++		   exploc_with_display_col (caret, m_policy,
++					    LOCATION_ASPECT_CARET),
+ 		   original_idx, loc_range->m_label);
+=20
+   /* If we have a range that finishes before it starts (perhaps
+@@ -1400,7 +1617,7 @@ layout::calculate_x_offset_display ()
+     =3D get_line_bytes_without_trailing_whitespace (line.get_buffer (),
+ 						  line.length ());
+   int eol_display_column
+-    =3D cpp_display_width (line.get_buffer (), line_bytes, m_context->tab=
stop);
++    =3D cpp_display_width (line.get_buffer (), line_bytes, m_policy);
+   if (caret_display_column > eol_display_column
+       || !caret_display_column)
+     {
+@@ -1479,7 +1696,7 @@ layout::print_source_line (linenum_type
+   /* This object helps to keep track of which display column we are at, w=
hich is
+      necessary for computing the line bounds in display units, for doing
+      tab expansion, and for implementing m_x_offset_display.  */
+-  cpp_display_width_computation dw (line, line_bytes, m_context->tabstop);
++  cpp_display_width_computation dw (line, line_bytes, m_policy);
+=20
+   /* Skip the first m_x_offset_display display columns.  In case the lead=
ing
+      portion that will be skipped ends with a character with wcwidth > 1,=
 then
+@@ -1527,7 +1744,8 @@ layout::print_source_line (linenum_type
+ 	 tabs and replacing some control bytes with spaces as necessary.  */
+       const char *c =3D dw.next_byte ();
+       const int start_disp_col =3D dw.display_cols_processed () + 1;
+-      const int this_display_width =3D dw.process_next_codepoint ();
++      cpp_decoded_char cp;
++      const int this_display_width =3D dw.process_next_codepoint (&cp);
+       if (*c =3D=3D '\t')
+ 	{
+ 	  /* The returned display width is the number of spaces into which the
+@@ -1536,15 +1754,6 @@ layout::print_source_line (linenum_type
+ 	    pp_space (m_pp);
+ 	  continue;
+ 	}
+-      if (*c =3D=3D '\0' || *c =3D=3D '\r')
+-	{
+-	  /* cpp_wcwidth() promises to return 1 for all control bytes, and we
+-	     want to output these as a single space too, so this case is
+-	     actually the same as the '\t' case.  */
+-	  gcc_assert (this_display_width =3D=3D 1);
+-	  pp_space (m_pp);
+-	  continue;
+-	}
+=20
+       /* We have a (possibly multibyte) character to output; update the l=
ine
+ 	 bounds if it is not whitespace.  */
+@@ -1556,7 +1765,8 @@ layout::print_source_line (linenum_type
+ 	}
+=20
+       /* Output the character.  */
+-      while (c !=3D dw.next_byte ()) pp_character (m_pp, *c++);
++      m_policy.m_print_cb (m_pp, cp);
++      c =3D dw.next_byte ();
+     }
+   print_newline ();
+   return lbounds;
+@@ -1655,14 +1865,14 @@ layout::print_annotation_line (linenum_t
+ class line_label
+ {
+ public:
+-  line_label (diagnostic_context *context, int state_idx, int column,
++  line_label (const cpp_char_column_policy &policy,
++	      int state_idx, int column,
+ 	      label_text text)
+   : m_state_idx (state_idx), m_column (column),
+     m_text (text), m_label_line (0), m_has_vbar (true)
+   {
+     const int bytes =3D strlen (text.m_buffer);
+-    m_display_width
+-      =3D cpp_display_width (text.m_buffer, bytes, context->tabstop);
++    m_display_width =3D cpp_display_width (text.m_buffer, bytes, policy);
+   }
+=20
+   /* Sorting is primarily by column, then by state index.  */
+@@ -1722,7 +1932,7 @@ layout::print_any_labels (linenum_type r
+ 	if (text.m_buffer =3D=3D NULL)
+ 	  continue;
+=20
+-	labels.safe_push (line_label (m_context, i, disp_col, text));
++	labels.safe_push (line_label (m_policy, i, disp_col, text));
+       }
+   }
+=20
+@@ -2002,7 +2212,7 @@ public:
+=20
+ /* Get the range of bytes or display columns that HINT would affect.  */
+ static column_range
+-get_affected_range (diagnostic_context *context,
++get_affected_range (const cpp_char_column_policy &policy,
+ 		    const fixit_hint *hint, enum column_unit col_unit)
+ {
+   expanded_location exploc_start =3D expand_location (hint->get_start_loc=
 ());
+@@ -2013,13 +2223,11 @@ get_affected_range (diagnostic_context *
+   int finish_column;
+   if (col_unit =3D=3D CU_DISPLAY_COLS)
+     {
+-      start_column
+-	=3D location_compute_display_column (exploc_start, context->tabstop);
++      start_column =3D location_compute_display_column (exploc_start, pol=
icy);
+       if (hint->insertion_p ())
+ 	finish_column =3D start_column - 1;
+       else
+-	finish_column
+-	  =3D location_compute_display_column (exploc_finish, context->tabstop);
++	finish_column =3D location_compute_display_column (exploc_finish, policy=
);
+     }
+   else
+     {
+@@ -2032,12 +2240,13 @@ get_affected_range (diagnostic_context *
+ /* Get the range of display columns that would be printed for HINT.  */
+=20
+ static column_range
+-get_printed_columns (diagnostic_context *context, const fixit_hint *hint)
++get_printed_columns (const cpp_char_column_policy &policy,
++		     const fixit_hint *hint)
+ {
+   expanded_location exploc =3D expand_location (hint->get_start_loc ());
+-  int start_column =3D location_compute_display_column (exploc, context->=
tabstop);
++  int start_column =3D location_compute_display_column (exploc, policy);
+   int hint_width =3D cpp_display_width (hint->get_string (), hint->get_le=
ngth (),
+-				      context->tabstop);
++				      policy);
+   int final_hint_column =3D start_column + hint_width - 1;
+   if (hint->insertion_p ())
+     {
+@@ -2047,8 +2256,7 @@ get_printed_columns (diagnostic_context
+     {
+       exploc =3D expand_location (hint->get_next_loc ());
+       --exploc.column;
+-      int finish_column
+-	=3D location_compute_display_column (exploc, context->tabstop);
++      int finish_column =3D location_compute_display_column (exploc, poli=
cy);
+       return column_range (start_column,
+ 			   MAX (finish_column, final_hint_column));
+     }
+@@ -2066,13 +2274,13 @@ public:
+ 	      column_range affected_columns,
+ 	      column_range printed_columns,
+ 	      const char *new_text, size_t new_text_len,
+-	      int tabstop)
++	      const cpp_char_column_policy &policy)
+   : m_affected_bytes (affected_bytes),
+     m_affected_columns (affected_columns),
+     m_printed_columns (printed_columns),
+     m_text (xstrdup (new_text)),
+     m_byte_length (new_text_len),
+-    m_tabstop (tabstop),
++    m_policy (policy),
+     m_alloc_sz (new_text_len + 1)
+   {
+     compute_display_cols ();
+@@ -2090,7 +2298,7 @@ public:
+=20
+   void compute_display_cols ()
+   {
+-    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_tabsto=
p);
++    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_policy=
);
+   }
+=20
+   void overwrite (int dst_offset, const char_span &src_span)
+@@ -2118,7 +2326,7 @@ public:
+   char *m_text;
+   size_t m_byte_length; /* Not including null-terminator.  */
+   int m_display_cols;
+-  int m_tabstop;
++  const cpp_char_column_policy &m_policy;
+   size_t m_alloc_sz;
+ };
+=20
+@@ -2154,15 +2362,16 @@ correction::ensure_terminated ()
+ class line_corrections
+ {
+ public:
+-  line_corrections (diagnostic_context *context, const char *filename,
++  line_corrections (const char_display_policy &policy,
++		    const char *filename,
+ 		    linenum_type row)
+-    : m_context (context), m_filename (filename), m_row (row)
++  : m_policy (policy), m_filename (filename), m_row (row)
+   {}
+   ~line_corrections ();
+=20
+   void add_hint (const fixit_hint *hint);
+=20
+-  diagnostic_context *m_context;
++  const char_display_policy &m_policy;
+   const char *m_filename;
+   linenum_type m_row;
+   auto_vec <correction *> m_corrections;
+@@ -2208,10 +2417,10 @@ source_line::source_line (const char *fi
+ void
+ line_corrections::add_hint (const fixit_hint *hint)
+ {
+-  column_range affected_bytes =3D get_affected_range (m_context, hint, CU=
_BYTES);
+-  column_range affected_columns =3D get_affected_range (m_context, hint,
++  column_range affected_bytes =3D get_affected_range (m_policy, hint, CU_=
BYTES);
++  column_range affected_columns =3D get_affected_range (m_policy, hint,
+ 						      CU_DISPLAY_COLS);
+-  column_range printed_columns =3D get_printed_columns (m_context, hint);
++  column_range printed_columns =3D get_printed_columns (m_policy, hint);
+=20
+   /* Potentially consolidate.  */
+   if (!m_corrections.is_empty ())
+@@ -2280,7 +2489,7 @@ line_corrections::add_hint (const fixit_
+ 					   printed_columns,
+ 					   hint->get_string (),
+ 					   hint->get_length (),
+-					   m_context->tabstop));
++					   m_policy));
+ }
+=20
+ /* If there are any fixit hints on source line ROW, print them.
+@@ -2294,7 +2503,7 @@ layout::print_trailing_fixits (linenum_t
+ {
+   /* Build a list of correction instances for the line,
+      potentially consolidating hints (for the sake of readability).  */
+-  line_corrections corrections (m_context, m_exploc.file, row);
++  line_corrections corrections (m_policy, m_exploc.file, row);
+   for (unsigned int i =3D 0; i < m_fixit_hints.length (); i++)
+     {
+       const fixit_hint *hint =3D m_fixit_hints[i];
+@@ -2635,6 +2844,59 @@ namespace selftest {
+=20
+ /* Selftests for diagnostic_show_locus.  */
+=20
++/* Verify that cpp_display_width correctly handles escaping.  */
++
++static void
++test_display_widths ()
++{
++  gcc_rich_location richloc (UNKNOWN_LOCATION);
++
++  /* U+03C0 "GREEK SMALL LETTER PI".  */
++  const char *pi =3D "\xCF\x80";
++  /* U+1F642 "SLIGHTLY SMILING FACE".  */
++  const char *emoji =3D "\xF0\x9F\x99\x82";
++  /* Stray trailing byte of a UTF-8 character.  */
++  const char *stray =3D "\xBF";
++  /* U+10FFFF.  */
++  const char *max_codepoint =3D "\xF4\x8F\xBF\xBF";
++
++  /* No escaping.  */
++  {
++    test_diagnostic_context dc;
++    char_display_policy policy (make_policy (dc, richloc));
++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 1);
++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 2);
++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 1);
++    /* Don't check width of U+10FFFF; it's in a private use plane.  */
++  }
++
++  richloc.set_escape_on_output (true);
++
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++    char_display_policy policy (make_policy (dc, richloc));
++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 9);
++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
++    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
++				  policy),
++	       strlen ("<U+10FFFF>"));
++  }
++
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
++    char_display_policy policy (make_policy (dc, richloc));
++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 16);
++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
++    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
++				  policy),
++	       16);
++  }
++}
++
+ /* For precise tests of the layout, make clear where the source line will
+    start.  test_left_margin sets the total byte count from the left side =
of the
+    screen to the start of source lines, after the line number and the sep=
arator,
+@@ -2704,10 +2966,10 @@ test_layout_x_offset_display_utf8 (const
+   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
+   ASSERT_EQ (line_display_cols,
+ 	     cpp_display_width (lspan.get_buffer (), lspan.length (),
+-				def_tabstop));
++				def_policy ()));
+   ASSERT_EQ (line_display_cols,
+ 	     location_compute_display_column (expand_location (line_end),
+-					      def_tabstop));
++					      def_policy ()));
+   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
+ 			"\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
+=20
+@@ -2855,12 +3117,13 @@ test_layout_x_offset_display_tab (const
+   ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
+   for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
+     {
++      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
+       ASSERT_EQ (line_bytes + extra_width[tabstop],
+ 		 cpp_display_width (lspan.get_buffer (), lspan.length (),
+-				    tabstop));
++				    policy));
+       ASSERT_EQ (line_bytes + extra_width[tabstop],
+ 		 location_compute_display_column (expand_location (line_end),
+-						  tabstop));
++						  policy));
+     }
+=20
+   /* Check that the tab is expanded to the expected number of spaces.  */
+@@ -3992,6 +4255,43 @@ test_one_liner_labels_utf8 ()
+ 			   " bb\xf0\x9f\x98\x82\xf0\x9f\x98\x82\n",
+ 		  pp_formatted_text (dc.printer));
+   }
++
++  /* Example of escaping the source lines.  */
++  {
++    text_range_label label0 ("label 0\xf0\x9f\x98\x82");
++    text_range_label label1 ("label 1\xcf\x80");
++    text_range_label label2 ("label 2\xcf\x80");
++    gcc_rich_location richloc (foo, &label0);
++    richloc.add_range (bar, SHOW_RANGE_WITHOUT_CARET, &label1);
++    richloc.add_range (field, SHOW_RANGE_WITHOUT_CARET, &label2);
++    richloc.set_escape_on_output (true);
++
++    {
++      test_diagnostic_context dc;
++      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++      ASSERT_STREQ (" <U+1F602>_foo =3D <U+03C0>_bar.<U+1F602>_field<U+03=
C0>;\n"
++		    " ^~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~\n"
++		    " |               |            |\n"
++		    " |               |            label 2\xcf\x80\n"
++		    " |               label 1\xcf\x80\n"
++		    " label 0\xf0\x9f\x98\x82\n",
++		    pp_formatted_text (dc.printer));
++    }
++    {
++      test_diagnostic_context dc;
++      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++      ASSERT_STREQ
++	(" <f0><9f><98><82>_foo =3D <cf><80>_bar.<f0><9f><98><82>_field<cf><80>;=
\n"
++	 " ^~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
++	 " |                      |            |\n"
++	 " |                      |            label 2\xcf\x80\n"
++	 " |                      label 1\xcf\x80\n"
++	 " label 0\xf0\x9f\x98\x82\n",
++	 pp_formatted_text (dc.printer));
++    }
++  }
+ }
+=20
+ /* Make sure that colorization codes don't interrupt a multibyte
+@@ -4046,9 +4346,9 @@ test_diagnostic_show_locus_one_liner_utf
+=20
+   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
+   ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (),
+-				    def_tabstop));
++				    def_policy ()));
+   ASSERT_EQ (25, location_compute_display_column (expand_location (line_e=
nd),
+-						  def_tabstop));
++						  def_policy ()));
+=20
+   test_one_liner_simple_caret_utf8 ();
+   test_one_liner_caret_and_range_utf8 ();
+@@ -4434,30 +4734,31 @@ test_overlapped_fixit_printing (const li
+ 		  pp_formatted_text (dc.printer));
+=20
+     /* Unit-test the line_corrections machinery.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
++	       get_affected_range (policy, hint_0, CU_BYTES));
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0=
));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
++	       get_affected_range (policy, hint_1, CU_BYTES));
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1=
));
+     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
+     ASSERT_EQ (column_range (29, 28),
+-	       get_affected_range (&dc, hint_2, CU_BYTES));
++	       get_affected_range (policy, hint_2, CU_BYTES));
+     ASSERT_EQ (column_range (29, 28),
+-	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2));
++	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (29, 29), get_printed_columns (policy, hint_2=
));
+=20
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (&dc, tmp.get_filename (), 1);
++    line_corrections lc (policy, tmp.get_filename (), 1);
+=20
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4649,30 +4950,31 @@ test_overlapped_fixit_printing_utf8 (con
+ 		  pp_formatted_text (dc.printer));
+=20
+     /* Unit-test the line_corrections machinery.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (14, 14),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
++	       get_affected_range (policy, hint_0, CU_BYTES));
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0=
));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (22, 22),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
++	       get_affected_range (policy, hint_1, CU_BYTES));
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1=
));
+     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
+     ASSERT_EQ (column_range (35, 34),
+-	       get_affected_range (&dc, hint_2, CU_BYTES));
++	       get_affected_range (policy, hint_2, CU_BYTES));
+     ASSERT_EQ (column_range (30, 29),
+-	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2));
++	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (30, 30), get_printed_columns (policy, hint_2=
));
+=20
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (&dc, tmp.get_filename (), 1);
++    line_corrections lc (policy, tmp.get_filename (), 1);
+=20
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4866,15 +5168,16 @@ test_overlapped_fixit_printing_2 (const
+     richloc.add_fixit_insert_before (col_21, "}");
+=20
+     /* These fixits should be accepted; they can't be consolidated.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (23, 22),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
+-    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_BYTES));
++    ASSERT_EQ (column_range (23, 23), get_printed_columns (policy, hint_0=
));
+     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (21, 20),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
+-    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_BYTES));
++    ASSERT_EQ (column_range (21, 21), get_printed_columns (policy, hint_1=
));
+=20
+     /* Verify that they're printed correctly.  */
+     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
+@@ -5141,10 +5444,11 @@ test_tab_expansion (const line_table_cas
+      ....................123 45678901234 56789012345  columns  */
+=20
+   const int tabstop =3D 8;
++  cpp_char_column_policy policy (tabstop, cpp_wcwidth);
+   const int first_non_ws_byte_col =3D 7;
+   const int right_quote_byte_col =3D 15;
+   const int last_byte_col =3D 25;
+-  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
++  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, policy));
+=20
+   temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
+   line_table_test ltt (case_);
+@@ -5187,6 +5491,114 @@ test_tab_expansion (const line_table_cas
+   }
+ }
+=20
++/* Verify that the escaping machinery can cope with a variety of different
++   invalid bytes.  */
++
++static void
++test_escaping_bytes_1 (const line_table_case &case_)
++{
++  const char content[] =3D "before\0\1\2\3\r\x80\xff""after\n";
++  const size_t sz =3D sizeof (content);
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
++  line_table_test ltt (case_);
++  const line_map_ordinary *ord_map =3D linemap_check_ordinary
++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
++  linemap_line_start (line_table, 1, 100);
++
++  location_t finish
++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
++					    strlen (content));
++
++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Locations of the NUL and \r bytes.  */
++  location_t nul_loc
++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 7);
++  location_t r_loc
++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 11);
++  gcc_rich_location richloc (nul_loc);
++  richloc.add_range (r_loc);
++
++  {
++    test_diagnostic_context dc;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ (" before \1\2\3 \x80\xff""after\n"
++		  "       ^   ~\n",
++		  pp_formatted_text (dc.printer));
++  }
++  richloc.set_escape_on_output (true);
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ
++      (" before<U+0000><U+0001><U+0002><U+0003><U+000D><80><ff>after\n"
++       "       ^~~~~~~~                        ~~~~~~~~\n",
++       pp_formatted_text (dc.printer));
++  }
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ (" before<00><01><02><03><0d><80><ff>after\n"
++		  "       ^~~~            ~~~~\n",
++		  pp_formatted_text (dc.printer));
++  }
++}
++
++/* As above, but verify that we handle the initial byte of a line
++   correctly.  */
++
++static void
++test_escaping_bytes_2 (const line_table_case &case_)
++{
++  const char content[]  =3D "\0after\n";
++  const size_t sz =3D sizeof (content);
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
++  line_table_test ltt (case_);
++  const line_map_ordinary *ord_map =3D linemap_check_ordinary
++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
++  linemap_line_start (line_table, 1, 100);
++
++  location_t finish
++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
++					    strlen (content));
++
++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Location of the NUL byte.  */
++  location_t nul_loc
++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 1);
++  gcc_rich_location richloc (nul_loc);
++
++  {
++    test_diagnostic_context dc;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ ("  after\n"
++		  " ^\n",
++		  pp_formatted_text (dc.printer));
++  }
++  richloc.set_escape_on_output (true);
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ (" <U+0000>after\n"
++		  " ^~~~~~~~\n",
++		  pp_formatted_text (dc.printer));
++  }
++  {
++    test_diagnostic_context dc;
++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ (" <00>after\n"
++		  " ^~~~\n",
++		  pp_formatted_text (dc.printer));
++  }
++}
++
+ /* Verify that line numbers are correctly printed for the case of
+    a multiline range in which the width of the line numbers changes
+    (e.g. from "9" to "10").  */
+@@ -5243,6 +5655,8 @@ diagnostic_show_locus_c_tests ()
+   test_layout_range_for_single_line ();
+   test_layout_range_for_multiple_lines ();
+=20
++  test_display_widths ();
++
+   for_each_line_table_case (test_layout_x_offset_display_utf8);
+   for_each_line_table_case (test_layout_x_offset_display_tab);
+=20
+@@ -5263,6 +5677,8 @@ diagnostic_show_locus_c_tests ()
+   for_each_line_table_case (test_fixit_replace_containing_newline);
+   for_each_line_table_case (test_fixit_deletion_affecting_newline);
+   for_each_line_table_case (test_tab_expansion);
++  for_each_line_table_case (test_escaping_bytes_1);
++  for_each_line_table_case (test_escaping_bytes_2);
+=20
+   test_line_numbers_multiline_range ();
+ }
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-25 01:29:12.927317174 -0800
++++ b/gcc/doc/invoke.texi	2021-12-25 01:30:50.681688823 -0800
+@@ -295,7 +295,8 @@ Objective-C and Objective-C++ Dialects}.
+ -fdiagnostics-show-path-depths @gol
+ -fno-show-column @gol
+ -fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol
+--fdiagnostics-column-origin=3D@var{origin}}
++-fdiagnostics-column-origin=3D@var{origin} @gol
++-fdiagnostics-escape-format=3D@r{[}unicode@r{|}bytes@r{]}}
+=20
+ @item Warning Options
+ @xref{Warning Options,,Options to Request or Suppress Warnings}.
+@@ -4451,6 +4452,38 @@ first column.  The default value of 1 co
+ behavior and to the GNU style guide.  Some utilities may perform better w=
ith an
+ origin of 0; any non-negative value may be specified.
+=20
++@item -fdiagnostics-escape-format=3D@var{FORMAT}
++@opindex fdiagnostics-escape-format
++When GCC prints pertinent source lines for a diagnostic it normally attem=
pts
++to print the source bytes directly.  However, some diagnostics relate to =
encoding
++issues in the source file, such as malformed UTF-8, or issues with Unicode
++normalization.  These diagnostics are flagged so that GCC will escape byt=
es
++that are not printable ASCII when printing their pertinent source lines.
++
++This option controls how such bytes should be escaped.
++
++The default @var{FORMAT}, @samp{unicode} displays Unicode characters that
++are not printable ASCII in the form @samp{<U+XXXX>}, and bytes that do not
++correspond to a Unicode character validly-encoded in UTF-8-encoded will be
++displayed as hexadecimal in the form @samp{<XX>}.
++
++For example, a source line containing the string @samp{before} followed b=
y the
++Unicode character U+03C0 (``GREEK SMALL LETTER PI'', with UTF-8 encoding
++0xCF 0x80) followed by the byte 0xBF (a stray UTF-8 trailing byte), follo=
wed by
++the string @samp{after} will be printed for such a diagnostic as:
++
++@smallexample
++ before<U+03C0><BF>after
++@end smallexample
++
++Setting @var{FORMAT} to @samp{bytes} will display all non-printable-ASCII=
 bytes
++in the form @samp{<XX>}, thus showing the underlying encoding of non-ASCII
++Unicode characters.  For the example above, the following will be printed:
++
++@smallexample
++ before<CF><80><BF>after
++@end smallexample
++
+ @item -fdiagnostics-format=3D@var{FORMAT}
+ @opindex fdiagnostics-format
+ Select a different format for printing diagnostics.
+@@ -4518,9 +4551,11 @@ might be printed in JSON form (after for
+                         @}
+                     @}
+                 ],
++                "escape-source": false,
+                 "message": "...this statement, but the latter is @dots{}"
+             @}
+         ]
++	"escape-source": false,
+ 	"column-origin": 1,
+     @},
+     @dots{}
+@@ -4607,6 +4642,7 @@ of the expression, which have labels.  I
+                 "label": "T @{aka struct t@}"
+             @}
+         ],
++        "escape-source": false,
+         "message": "invalid operands to binary + @dots{}"
+     @}
+ @end smallexample
+@@ -4660,6 +4696,7 @@ might be printed in JSON form as:
+                 @}
+             @}
+         ],
++        "escape-source": false,
+         "message": "\u2018struct s\u2019 has no member named @dots{}"
+     @}
+ @end smallexample
+@@ -4717,6 +4754,10 @@ For example, the intraprocedural example
+     ]
+ @end smallexample
+=20
++Diagnostics have a boolean attribute @code{escape-source}, hinting whether
++non-ASCII bytes should be escaped when printing the pertinent lines of
++source code (@code{true} for diagnostics involving source encoding issues=
).
++
+ @end table
+=20
+ @node Warning Options
+diff --git a/gcc/input.c b/gcc/input.c
+--- a/gcc/input.c	2021-12-25 01:29:12.927317174 -0800
++++ b/gcc/input.c	2021-12-25 01:30:50.681688823 -0800
+@@ -913,7 +913,8 @@ make_location (location_t caret, source_
+    source line in order to calculate the display width.  If that cannot b=
e done
+    for any reason, then returns the byte column as a fallback.  */
+ int
+-location_compute_display_column (expanded_location exploc, int tabstop)
++location_compute_display_column (expanded_location exploc,
++				 const cpp_char_column_policy &policy)
+ {
+   if (!(exploc.file && *exploc.file && exploc.line && exploc.column))
+     return exploc.column;
+@@ -921,7 +922,7 @@ location_compute_display_column (expande
+   /* If line is NULL, this function returns exploc.column which is the
+      desired fallback.  */
+   return cpp_byte_column_to_display_column (line.get_buffer (), line.leng=
th (),
+-					    exploc.column, tabstop);
++					    exploc.column, policy);
+ }
+=20
+ /* Dump statistics to stderr about the memory usage of the line_table
+@@ -3609,43 +3610,50 @@ test_line_offset_overflow ()
+ void test_cpp_utf8 ()
+ {
+   const int def_tabstop =3D 8;
++  cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
++
+   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
+   {
+-    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tabst=
op);
++    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, policy);
+     ASSERT_EQ (8, w_bad);
+-    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
++    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, policy);
+     ASSERT_EQ (5, w_ctrl);
+   }
+=20
+   /* Verify that wcwidth of valid UTF-8 is as expected.  */
+   {
+-    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, def_tabstop);
++    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, policy);
+     ASSERT_EQ (1, w_pi);
+-    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, def_t=
abstop);
++    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, polic=
y);
+     ASSERT_EQ (2, w_emoji);
+     const int w_umlaut_precomposed =3D cpp_display_width ("\xc3\xbf", 2,
+-							def_tabstop);
++							policy);
+     ASSERT_EQ (1, w_umlaut_precomposed);
+     const int w_umlaut_combining =3D cpp_display_width ("y\xcc\x88", 3,
+-						      def_tabstop);
++						      policy);
+     ASSERT_EQ (1, w_umlaut_combining);
+-    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, def_tabstop=
);
++    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, policy);
+     ASSERT_EQ (2, w_han);
+-    const int w_ascii =3D cpp_display_width ("GCC", 3, def_tabstop);
++    const int w_ascii =3D cpp_display_width ("GCC", 3, policy);
+     ASSERT_EQ (3, w_ascii);
+     const int w_mixed =3D cpp_display_width ("\xcf\x80 =3D 3.14 \xf0\x9f\=
x98\x82"
+ 					   "\x9f! \xe4\xb8\xba y\xcc\x88",
+-					   24, def_tabstop);
++					   24, policy);
+     ASSERT_EQ (18, w_mixed);
+   }
+=20
+   /* Verify that display width properly expands tabs.  */
+   {
+     const char *tstr =3D "\tabc\td";
+-    ASSERT_EQ (6, cpp_display_width (tstr, 6, 1));
+-    ASSERT_EQ (10, cpp_display_width (tstr, 6, 3));
+-    ASSERT_EQ (17, cpp_display_width (tstr, 6, 8));
+-    ASSERT_EQ (1, cpp_display_column_to_byte_column (tstr, 6, 7, 8));
++    ASSERT_EQ (6, cpp_display_width (tstr, 6,
++				     cpp_char_column_policy (1, cpp_wcwidth)));
++    ASSERT_EQ (10, cpp_display_width (tstr, 6,
++				      cpp_char_column_policy (3, cpp_wcwidth)));
++    ASSERT_EQ (17, cpp_display_width (tstr, 6,
++				      cpp_char_column_policy (8, cpp_wcwidth)));
++    ASSERT_EQ (1,
++	       cpp_display_column_to_byte_column
++		 (tstr, 6, 7, cpp_char_column_policy (8, cpp_wcwidth)));
+   }
+=20
+   /* Verify that cpp_byte_column_to_display_column can go past the end,
+@@ -3658,13 +3666,13 @@ void test_cpp_utf8 ()
+       /* 111122223456
+ 	 Byte columns.  */
+=20
+-    ASSERT_EQ (5, cpp_display_width (str, 6, def_tabstop));
++    ASSERT_EQ (5, cpp_display_width (str, 6, policy));
+     ASSERT_EQ (105,
+-	       cpp_byte_column_to_display_column (str, 6, 106, def_tabstop));
++	       cpp_byte_column_to_display_column (str, 6, 106, policy));
+     ASSERT_EQ (10000,
+-	       cpp_byte_column_to_display_column (NULL, 0, 10000, def_tabstop));
++	       cpp_byte_column_to_display_column (NULL, 0, 10000, policy));
+     ASSERT_EQ (0,
+-	       cpp_byte_column_to_display_column (NULL, 10000, 0, def_tabstop));
++	       cpp_byte_column_to_display_column (NULL, 10000, 0, policy));
+   }
+=20
+   /* Verify that cpp_display_column_to_byte_column can go past the end,
+@@ -3678,25 +3686,25 @@ void test_cpp_utf8 ()
+       /* 000000000000000000000000000000000111111
+ 	 111122223333444456666777788889999012345
+ 	 Byte columns.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_tabs=
top));
++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, policy));
+     ASSERT_EQ (15,
+-	       cpp_display_column_to_byte_column (str, 15, 11, def_tabstop));
++	       cpp_display_column_to_byte_column (str, 15, 11, policy));
+     ASSERT_EQ (115,
+-	       cpp_display_column_to_byte_column (str, 15, 111, def_tabstop));
++	       cpp_display_column_to_byte_column (str, 15, 111, policy));
+     ASSERT_EQ (10000,
+-	       cpp_display_column_to_byte_column (NULL, 0, 10000, def_tabstop));
++	       cpp_display_column_to_byte_column (NULL, 0, 10000, policy));
+     ASSERT_EQ (0,
+-	       cpp_display_column_to_byte_column (NULL, 10000, 0, def_tabstop));
++	       cpp_display_column_to_byte_column (NULL, 10000, 0, policy));
+=20
+     /* Verify that we do not interrupt a UTF-8 sequence.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_tabs=
top));
++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, policy));
+=20
+     for (int byte_col =3D 1; byte_col <=3D 15; ++byte_col)
+       {
+ 	const int disp_col
+-	  =3D cpp_byte_column_to_display_column (str, 15, byte_col, def_tabstop);
++	  =3D cpp_byte_column_to_display_column (str, 15, byte_col, policy);
+ 	const int byte_col2
+-	  =3D cpp_display_column_to_byte_column (str, 15, disp_col, def_tabstop);
++	  =3D cpp_display_column_to_byte_column (str, 15, disp_col, policy);
+=20
+ 	/* If we ask for the display column in the middle of a UTF-8
+ 	   sequence, it will return the length of the partial sequence,
+diff --git a/gcc/input.h b/gcc/input.h
+--- a/gcc/input.h	2021-12-25 01:29:12.927317174 -0800
++++ b/gcc/input.h	2021-12-25 01:30:50.681688823 -0800
+@@ -39,8 +39,11 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
+ extern bool is_location_from_builtin_token (location_t);
+ extern expanded_location expand_location (location_t);
+=20
+-extern int location_compute_display_column (expanded_location exploc,
+-					    int tabstop);
++class cpp_char_column_policy;
++
++extern int
++location_compute_display_column (expanded_location exploc,
++				 const cpp_char_column_policy &policy);
+=20
+ /* A class capturing the bounds of a buffer, to allow for run-time
+    bounds-checking in a checked build.  */
+diff --git a/gcc/opts.c b/gcc/opts.c
+--- a/gcc/opts.c	2021-12-25 01:29:12.927317174 -0800
++++ b/gcc/opts.c	2021-12-25 01:30:50.681688823 -0800
+@@ -2447,6 +2447,10 @@ common_handle_option (struct gcc_options
+       dc->column_origin =3D value;
+       break;
+=20
++    case OPT_fdiagnostics_escape_format_:
++      dc->escape_format =3D (enum diagnostics_escape_format)value;
++      break;
++
+     case OPT_fdiagnostics_show_cwe:
+       dc->show_cwe =3D value;
+       break;
+diff --git a/gcc/selftest.c b/gcc/selftest.c
+--- a/gcc/selftest.c	2020-07-22 23:35:17.820389797 -0700
++++ b/gcc/selftest.c	2021-12-25 01:30:50.681688823 -0800
+@@ -193,6 +193,21 @@ temp_source_file::temp_source_file (cons
+   fclose (out);
+ }
+=20
++/* As above, but with a size, to allow for NUL bytes in CONTENT.  */
++
++temp_source_file::temp_source_file (const location &loc,
++				    const char *suffix,
++				    const char *content,
++				    size_t sz)
++: named_temp_file (suffix)
++{
++  FILE *out =3D fopen (get_filename (), "w");
++  if (!out)
++    fail_formatted (loc, "unable to open tempfile: %s", get_filename ());
++  fwrite (content, sz, 1, out);
++  fclose (out);
++}
++
+ /* Avoid introducing locale-specific differences in the results
+    by hardcoding open_quote and close_quote.  */
+=20
+diff --git a/gcc/selftest.h b/gcc/selftest.h
+--- a/gcc/selftest.h	2020-07-22 23:35:17.820389797 -0700
++++ b/gcc/selftest.h	2021-12-25 01:30:50.681688823 -0800
+@@ -112,6 +112,8 @@ class temp_source_file : public named_te
+  public:
+   temp_source_file (const location &loc, const char *suffix,
+ 		    const char *content);
++  temp_source_file (const location &loc, const char *suffix,
++		    const char *content, size_t sz);
+ };
+=20
+ /* RAII-style class for avoiding introducing locale-specific differences
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-1.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-25 01:=
29:12.927317174 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-25 01:=
30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#error message\"" } */
+=20
+ /* { dg-regexp "\"caret\": \{" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-2.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-25 01:=
29:12.927317174 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-25 01:=
30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ /* { dg-regexp "\"kind\": \"warning\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Wcpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-3.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-25 01:=
29:12.927317174 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-25 01:=
30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Werror=3Dcpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-4.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-25 01:=
29:12.927317174 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-25 01:=
30:50.681688823 -0800
+@@ -19,6 +19,7 @@ int test (void)
+=20
+ /* { dg-regexp "\"kind\": \"note\"" } */
+ /* { dg-regexp "\"message\": \"...this statement, but the latter is misle=
adingly indented as if it were guarded by the 'if'\"" } */
++/* { dg-regexp "\"escape-source\": false" } */
+=20
+ /* { dg-regexp "\"caret\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+@@ -39,6 +40,7 @@ int test (void)
+ /* { dg-regexp "\"kind\": \"warning\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-in=
dentation\"" } */
+=20
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc/t=
estsuite/c-c++-common/diagnostic-format-json-5.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-25 01:=
29:12.927317174 -0800
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-25 01:=
30:50.681688823 -0800
+@@ -14,6 +14,7 @@ int test (struct s *ptr)
+=20
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \".*\"" } */
+=20
+ /* Verify fix-it hints.  */
+diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c b/gcc/test=
suite/gcc.dg/cpp/warn-normalized-4-bytes.c
+--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	1969-12-31 16:00:=
00.000000000 -0800
++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	2021-12-25 01:30:=
50.681688823 -0800
+@@ -0,0 +1,21 @@
++// { dg-do preprocess }
++// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-sh=
ow-caret -fdiagnostics-escape-format=3Dbytes" }
++/* { dg-message "some warnings being treated as errors" "" {target "*-*-*=
"} 0 } */
++
++/* =C3=A0=C2=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition "0=
F42 0FB7" i.e.
++   U+0F42 TIBETAN LETTER GA: =C3=A0=C2=BD
++   U+0FB7 TIBETAN SUBJOINED LETTER HA: =C3=A0=C2=BE=C2=B7
++
++   The UTF-8 encoding of U+0F43 TIBETAN LETTER GHA is: E0 BD 83.  */
++
++foo before_\u0F43_after bar // { dg-error "`before_.U00000f43_after' is n=
ot in NFC .-Werror=3Dnormalized=3D." }
++/* { dg-begin-multiline-output "" }
++ foo before_\u0F43_after bar
++     ^~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
++
++foo before_=C3=A0=C2=BD_after bar // { dg-error "`before_.U00000f43_after=
' is not in NFC .-Werror=3Dnormalized=3D." }
++/* { dg-begin-multiline-output "" }
++ foo before_<e0><bd><83>_after bar
++     ^~~~~~~~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c b/gcc/te=
stsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
+--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	1969-12-31 16:0=
0:00.000000000 -0800
++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	2021-12-25 01:3=
0:50.681688823 -0800
+@@ -0,0 +1,19 @@
++// { dg-do preprocess }
++// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-sh=
ow-caret -fdiagnostics-escape-format=3Dunicode" }
++/* { dg-message "some warnings being treated as errors" "" {target "*-*-*=
"} 0 } */
++
++/* =C3=A0=C2=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition "0=
F42 0FB7" i.e.
++   U+0F42 TIBETAN LETTER GA: =C3=A0=C2=BD
++   U+0FB7 TIBETAN SUBJOINED LETTER HA: =C3=A0=C2=BE=C2=B7  */
++
++foo before_\u0F43_after bar  // { dg-error "`before_.U00000f43_after' is =
not in NFC .-Werror=3Dnormalized=3D." }
++/* { dg-begin-multiline-output "" }
++ foo before_\u0F43_after bar
++     ^~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
++
++foo before_=C3=A0=C2=BD_after bar // { dg-error "`before_.U00000f43_after=
' is not in NFC .-Werror=3Dnormalized=3D." }
++/* { dg-begin-multiline-output "" }
++ foo before_<U+0F43>_after bar
++     ^~~~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-1.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-25 01=
:29:12.931317107 -0800
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-25 01=
:30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ ! { dg-regexp "\"kind\": \"error\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#error message\"" }
+=20
+ ! { dg-regexp "\"caret\": \{" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-2.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-25 01=
:29:12.931317107 -0800
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-25 01=
:30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ ! { dg-regexp "\"kind\": \"warning\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Wcpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gcc/=
testsuite/gfortran.dg/diagnostic-format-json-3.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-25 01=
:29:12.931317107 -0800
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-25 01=
:30:50.681688823 -0800
+@@ -9,6 +9,7 @@
+=20
+ ! { dg-regexp "\"kind\": \"error\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Werror=3Dcpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+diff --git a/libcpp/charset.c b/libcpp/charset.c
+--- a/libcpp/charset.c	2021-12-25 01:29:12.931317107 -0800
++++ b/libcpp/charset.c	2021-12-25 01:30:50.681688823 -0800
+@@ -1549,12 +1549,14 @@ convert_escape (cpp_reader *pfile, const
+ 		   "unknown escape sequence: '\\%c'", (int) c);
+       else
+ 	{
++	  encoding_rich_location rich_loc (pfile);
++
+ 	  /* diagnostic.c does not support "%03o".  When it does, this
+ 	     code can use %03o directly in the diagnostic again.  */
+ 	  char buf[32];
+ 	  sprintf(buf, "%03o", (int) c);
+-	  cpp_error (pfile, CPP_DL_PEDWARN,
+-		     "unknown escape sequence: '\\%s'", buf);
++	  cpp_error_at (pfile, CPP_DL_PEDWARN, &rich_loc,
++			"unknown escape sequence: '\\%s'", buf);
+ 	}
+     }
+=20
+@@ -2277,14 +2279,16 @@ cpp_string_location_reader::get_next ()
+ }
+=20
+ cpp_display_width_computation::
+-cpp_display_width_computation (const char *data, int data_length, int tab=
stop) :
++cpp_display_width_computation (const char *data, int data_length,
++			       const cpp_char_column_policy &policy) :
+   m_begin (data),
+   m_next (m_begin),
+   m_bytes_left (data_length),
+-  m_tabstop (tabstop),
++  m_policy (policy),
+   m_display_cols (0)
+ {
+-  gcc_assert (m_tabstop > 0);
++  gcc_assert (policy.m_tabstop > 0);
++  gcc_assert (policy.m_width_cb);
+ }
+=20
+=20
+@@ -2296,19 +2300,28 @@ cpp_display_width_computation (const cha
+    point to a valid UTF-8-encoded sequence, then it will be treated as a =
single
+    byte with display width 1.  m_cur_display_col is the current display c=
olumn,
+    relative to which tab stops should be expanded.  Returns the display w=
idth of
+-   the codepoint just processed.  */
++   the codepoint just processed.
++   If OUT is non-NULL, it is populated.  */
+=20
+ int
+-cpp_display_width_computation::process_next_codepoint ()
++cpp_display_width_computation::process_next_codepoint (cpp_decoded_char *=
out)
+ {
+   cppchar_t c;
+   int next_width;
+=20
++  if (out)
++    out->m_start_byte =3D m_next;
++
+   if (*m_next =3D=3D '\t')
+     {
+       ++m_next;
+       --m_bytes_left;
+-      next_width =3D m_tabstop - (m_display_cols % m_tabstop);
++      next_width =3D m_policy.m_tabstop - (m_display_cols % m_policy.m_ta=
bstop);
++      if (out)
++	{
++	  out->m_ch =3D '\t';
++	  out->m_valid_ch =3D true;
++	}
+     }
+   else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left, =
&c)
+ 	   !=3D 0)
+@@ -2318,14 +2331,24 @@ cpp_display_width_computation::process_n
+ 	 of one.  */
+       ++m_next;
+       --m_bytes_left;
+-      next_width =3D 1;
++      next_width =3D m_policy.m_undecoded_byte_width;
++      if (out)
++	out->m_valid_ch =3D false;
+     }
+   else
+     {
+       /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for u=
s.  */
+-      next_width =3D cpp_wcwidth (c);
++      next_width =3D m_policy.m_width_cb (c);
++      if (out)
++	{
++	  out->m_ch =3D c;
++	  out->m_valid_ch =3D true;
++	}
+     }
+=20
++  if (out)
++    out->m_next_byte =3D m_next;
++
+   m_display_cols +=3D next_width;
+   return next_width;
+ }
+@@ -2341,7 +2364,7 @@ cpp_display_width_computation::advance_d
+   const int start =3D m_display_cols;
+   const int target =3D start + n;
+   while (m_display_cols < target && !done ())
+-    process_next_codepoint ();
++    process_next_codepoint (NULL);
+   return m_display_cols - start;
+ }
+=20
+@@ -2349,29 +2372,33 @@ cpp_display_width_computation::advance_d
+     how many display columns are occupied by the first COLUMN bytes.  COL=
UMN
+     may exceed DATA_LENGTH, in which case the phantom bytes at the end are
+     treated as if they have display width 1.  Tabs are expanded to the ne=
xt tab
+-    stop, relative to the start of DATA.  */
++    stop, relative to the start of DATA, and non-printable-ASCII characte=
rs
++    will be escaped as per POLICY.  */
+=20
+ int
+ cpp_byte_column_to_display_column (const char *data, int data_length,
+-				   int column, int tabstop)
++				   int column,
++				   const cpp_char_column_policy &policy)
+ {
+   const int offset =3D MAX (0, column - data_length);
+-  cpp_display_width_computation dw (data, column - offset, tabstop);
++  cpp_display_width_computation dw (data, column - offset, policy);
+   while (!dw.done ())
+-    dw.process_next_codepoint ();
++    dw.process_next_codepoint (NULL);
+   return dw.display_cols_processed () + offset;
+ }
+=20
+ /*  For the string of length DATA_LENGTH bytes that begins at DATA, compu=
te
+     the least number of bytes that will result in at least DISPLAY_COL di=
splay
+     columns.  The return value may exceed DATA_LENGTH if the entire strin=
g does
+-    not occupy enough display columns.  */
++    not occupy enough display columns.  Non-printable-ASCII characters
++    will be escaped as per POLICY.  */
+=20
+ int
+ cpp_display_column_to_byte_column (const char *data, int data_length,
+-				   int display_col, int tabstop)
++				   int display_col,
++				   const cpp_char_column_policy &policy)
+ {
+-  cpp_display_width_computation dw (data, data_length, tabstop);
++  cpp_display_width_computation dw (data, data_length, policy);
+   const int avail_display =3D dw.advance_display_cols (display_col);
+   return dw.bytes_processed () + MAX (0, display_col - avail_display);
+ }
+diff --git a/libcpp/errors.c b/libcpp/errors.c
+--- a/libcpp/errors.c	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/errors.c	2021-12-25 01:30:50.681688823 -0800
+@@ -27,6 +27,31 @@ along with this program; see the file CO
+ #include "cpplib.h"
+ #include "internal.h"
+=20
++/* Get a location_t for the current location in PFILE,
++   generally that of the previously lexed token.  */
++
++location_t
++cpp_diagnostic_get_current_location (cpp_reader *pfile)
++{
++  if (CPP_OPTION (pfile, traditional))
++    {
++      if (pfile->state.in_directive)
++	return pfile->directive_line;
++      else
++	return pfile->line_table->highest_line;
++    }
++  /* We don't want to refer to a token before the beginning of the
++     current run -- that is invalid.  */
++  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
++    {
++      return 0;
++    }
++  else
++    {
++      return pfile->cur_token[-1].src_loc;
++    }
++}
++
+ /* Print a diagnostic at the given location.  */
+=20
+ ATTRIBUTE_FPTR_PRINTF(5,0)
+@@ -52,25 +77,7 @@ cpp_diagnostic (cpp_reader * pfile, enum
+ 		enum cpp_warning_reason reason,
+ 		const char *msgid, va_list *ap)
+ {
+-  location_t src_loc;
+-
+-  if (CPP_OPTION (pfile, traditional))
+-    {
+-      if (pfile->state.in_directive)
+-	src_loc =3D pfile->directive_line;
+-      else
+-	src_loc =3D pfile->line_table->highest_line;
+-    }
+-  /* We don't want to refer to a token before the beginning of the
+-     current run -- that is invalid.  */
+-  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
+-    {
+-      src_loc =3D 0;
+-    }
+-  else
+-    {
+-      src_loc =3D pfile->cur_token[-1].src_loc;
+-    }
++  location_t src_loc =3D cpp_diagnostic_get_current_location (pfile);
+   rich_location richloc (pfile->line_table, src_loc);
+   return cpp_diagnostic_at (pfile, level, reason, &richloc, msgid, ap);
+ }
+@@ -142,6 +149,43 @@ cpp_warning_syshdr (cpp_reader * pfile,
+=20
+   va_end (ap);
+   return ret;
++}
++
++/* As cpp_warning above, but use RICHLOC as the location of the diagnosti=
c.  */
++
++bool cpp_warning_at (cpp_reader *pfile, enum cpp_warning_reason reason,
++		     rich_location *richloc, const char *msgid, ...)
++{
++  va_list ap;
++  bool ret;
++
++  va_start (ap, msgid);
++
++  ret =3D cpp_diagnostic_at (pfile, CPP_DL_WARNING, reason, richloc,
++			   msgid, &ap);
++
++  va_end (ap);
++  return ret;
++
++}
++
++/* As cpp_pedwarning above, but use RICHLOC as the location of the
++   diagnostic.  */
++
++bool
++cpp_pedwarning_at (cpp_reader * pfile, enum cpp_warning_reason reason,
++		   rich_location *richloc, const char *msgid, ...)
++{
++  va_list ap;
++  bool ret;
++
++  va_start (ap, msgid);
++
++  ret =3D cpp_diagnostic_at (pfile, CPP_DL_PEDWARN, reason, richloc,
++			   msgid, &ap);
++
++  va_end (ap);
++  return ret;
+ }
+=20
+ /* Print a diagnostic at a specific location.  */
+diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
+--- a/libcpp/include/cpplib.h	2021-12-25 01:29:12.931317107 -0800
++++ b/libcpp/include/cpplib.h	2021-12-25 01:30:50.685688757 -0800
+@@ -1176,6 +1176,14 @@ extern bool cpp_warning_syshdr (cpp_read
+ 				const char *msgid, ...)
+   ATTRIBUTE_PRINTF_3;
+=20
++/* As their counterparts above, but use RICHLOC.  */
++extern bool cpp_warning_at (cpp_reader *, enum cpp_warning_reason,
++			    rich_location *richloc, const char *msgid, ...)
++  ATTRIBUTE_PRINTF_4;
++extern bool cpp_pedwarning_at (cpp_reader *, enum cpp_warning_reason,
++			       rich_location *richloc, const char *msgid, ...)
++  ATTRIBUTE_PRINTF_4;
++
+ /* Output a diagnostic with "MSGID: " preceding the
+    error string of errno.  No location is printed.  */
+ extern bool cpp_errno (cpp_reader *, enum cpp_diagnostic_level,
+@@ -1320,42 +1328,95 @@ extern const char * cpp_get_userdef_suff
+=20
+ /* In charset.c */
+=20
++/* The result of attempting to decode a run of UTF-8 bytes.  */
++
++struct cpp_decoded_char
++{
++  const char *m_start_byte;
++  const char *m_next_byte;
++
++  bool m_valid_ch;
++  cppchar_t m_ch;
++};
++
++/* Information for mapping between code points and display columns.
++
++   This is a tabstop value, along with a callback for getting the
++   widths of characters.  Normally this callback is cpp_wcwidth, but we
++   support other schemes for escaping non-ASCII unicode as a series of
++   ASCII chars when printing the user's source code in diagnostic-show-lo=
cus.c
++
++   For example, consider:
++   - the Unicode character U+03C0 "GREEK SMALL LETTER PI" (UTF-8: 0xCF 0x=
80)
++   - the Unicode character U+1F642 "SLIGHTLY SMILING FACE"
++     (UTF-8: 0xF0 0x9F 0x99 0x82)
++   - the byte 0xBF (a stray trailing byte of a UTF-8 character)
++   Normally U+03C0 would occupy one display column, U+1F642
++   would occupy two display columns, and the stray byte would be
++   printed verbatim as one display column.
++
++   However when escaping them as unicode code points as "<U+03C0>"
++   and "<U+1F642>" they occupy 8 and 9 display columns respectively,
++   and when escaping them as bytes as "<CF><80>" and "<F0><9F><99><82>"
++   they occupy 8 and 16 display columns respectively.  In both cases
++   the stray byte is escaped to <BF> as 4 display columns.  */
++
++struct cpp_char_column_policy
++{
++  cpp_char_column_policy (int tabstop,
++			  int (*width_cb) (cppchar_t c))
++  : m_tabstop (tabstop),
++    m_undecoded_byte_width (1),
++    m_width_cb (width_cb)
++  {}
++
++  int m_tabstop;
++  /* Width in display columns of a stray byte that isn't decodable
++     as UTF-8.  */
++  int m_undecoded_byte_width;
++  int (*m_width_cb) (cppchar_t c);
++};
++
+ /* A class to manage the state while converting a UTF-8 sequence to cppch=
ar_t
+    and computing the display width one character at a time.  */
+ class cpp_display_width_computation {
+  public:
+   cpp_display_width_computation (const char *data, int data_length,
+-				 int tabstop);
++				 const cpp_char_column_policy &policy);
+   const char *next_byte () const { return m_next; }
+   int bytes_processed () const { return m_next - m_begin; }
+   int bytes_left () const { return m_bytes_left; }
+   bool done () const { return !bytes_left (); }
+   int display_cols_processed () const { return m_display_cols; }
+=20
+-  int process_next_codepoint ();
++  int process_next_codepoint (cpp_decoded_char *out);
+   int advance_display_cols (int n);
+=20
+  private:
+   const char *const m_begin;
+   const char *m_next;
+   size_t m_bytes_left;
+-  const int m_tabstop;
++  const cpp_char_column_policy &m_policy;
+   int m_display_cols;
+ };
+=20
+ /* Convenience functions that are simple use cases for class
+    cpp_display_width_computation.  Tab characters will be expanded to spa=
ces
+-   as determined by TABSTOP.  */
++   as determined by POLICY.m_tabstop, and non-printable-ASCII characters
++   will be escaped as per POLICY.  */
++
+ int cpp_byte_column_to_display_column (const char *data, int data_length,
+-				       int column, int tabstop);
++				       int column,
++				       const cpp_char_column_policy &policy);
+ inline int cpp_display_width (const char *data, int data_length,
+-			      int tabstop)
++			      const cpp_char_column_policy &policy)
+ {
+   return cpp_byte_column_to_display_column (data, data_length, data_lengt=
h,
+-					    tabstop);
++					    policy);
+ }
+ int cpp_display_column_to_byte_column (const char *data, int data_length,
+-				       int display_col, int tabstop);
++				       int display_col,
++				       const cpp_char_column_policy &policy);
+ int cpp_wcwidth (cppchar_t c);
+=20
+ #endif /* ! LIBCPP_CPPLIB_H */
+diff --git a/libcpp/include/line-map.h b/libcpp/include/line-map.h
+--- a/libcpp/include/line-map.h	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/include/line-map.h	2021-12-25 01:30:50.685688757 -0800
+@@ -1732,6 +1732,18 @@ class rich_location
+   const diagnostic_path *get_path () const { return m_path; }
+   void set_path (const diagnostic_path *path) { m_path =3D path; }
+=20
++  /* A flag for hinting that the diagnostic involves character encoding
++     issues, and thus that it will be helpful to the user if we show some
++     representation of how the characters in the pertinent source lines
++     are encoded.
++     The default is false (i.e. do not escape).
++     When set to true, non-ASCII bytes in the pertinent source lines will
++     be escaped in a manner controlled by the user-supplied option
++     -fdiagnostics-escape-format=3D, so that the user can better understa=
nd
++     what's going on with the encoding in their source file.  */
++  bool escape_on_output_p () const { return m_escape_on_output; }
++  void set_escape_on_output (bool flag) { m_escape_on_output =3D flag; }
++
+ private:
+   bool reject_impossible_fixit (location_t where);
+   void stop_supporting_fixits ();
+@@ -1758,6 +1770,7 @@ protected:
+   bool m_fixits_cannot_be_auto_applied;
+=20
+   const diagnostic_path *m_path;
++  bool m_escape_on_output;
+ };
+=20
+ /* A struct for the result of range_label::get_text: a NUL-terminated buf=
fer
+diff --git a/libcpp/internal.h b/libcpp/internal.h
+--- a/libcpp/internal.h	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/internal.h	2021-12-25 01:30:50.685688757 -0800
+@@ -758,6 +758,9 @@ struct _cpp_dir_only_callbacks
+ extern void _cpp_preprocess_dir_only (cpp_reader *,
+ 				      const struct _cpp_dir_only_callbacks *);
+=20
++/* In errors.c  */
++extern location_t cpp_diagnostic_get_current_location (cpp_reader *);
++
+ /* In traditional.c.  */
+ extern bool _cpp_scan_out_logical_line (cpp_reader *, cpp_macro *, bool);
+ extern bool _cpp_read_logical_line_trad (cpp_reader *);
+@@ -946,6 +949,26 @@ int linemap_get_expansion_line (class li
+ const char* linemap_get_expansion_filename (class line_maps *,
+ 					    location_t);
+=20
++/* A subclass of rich_location for emitting a diagnostic
++   at the current location of the reader, but flagging
++   it with set_escape_on_output (true).  */
++class encoding_rich_location : public rich_location
++{
++ public:
++  encoding_rich_location (cpp_reader *pfile)
++  : rich_location (pfile->line_table,
++		   cpp_diagnostic_get_current_location (pfile))
++  {
++    set_escape_on_output (true);
++  }
++
++  encoding_rich_location (cpp_reader *pfile, location_t loc)
++  : rich_location (pfile->line_table, loc)
++  {
++    set_escape_on_output (true);
++  }
++};
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-12-24 20:23:45.568762024 -0800
++++ b/libcpp/lex.c	2021-12-25 01:30:50.685688757 -0800
+@@ -1268,7 +1268,11 @@ skip_whitespace (cpp_reader *pfile, cppc
+   while (is_nvspace (c));
+=20
+   if (saw_NUL)
+-    cpp_error (pfile, CPP_DL_WARNING, "null character(s) ignored");
++    {
++      encoding_rich_location rich_loc (pfile);
++      cpp_error_at (pfile, CPP_DL_WARNING, &rich_loc,
++		    "null character(s) ignored");
++    }
+=20
+   buffer->cur--;
+ }
+@@ -1297,6 +1301,28 @@ warn_about_normalization (cpp_reader *pf
+   if (CPP_OPTION (pfile, warn_normalize) < NORMALIZE_STATE_RESULT (s)
+       && !pfile->state.skipping)
+     {
++      location_t loc =3D token->src_loc;
++
++      /* If possible, create a location range for the token.  */
++      if (loc >=3D RESERVED_LOCATION_COUNT
++	  && token->type !=3D CPP_EOF
++	  /* There must be no line notes to process.  */
++	  && (!(pfile->buffer->cur
++		>=3D pfile->buffer->notes[pfile->buffer->cur_note].pos
++		&& !pfile->overlaid_buffer)))
++	{
++	  source_range tok_range;
++	  tok_range.m_start =3D loc;
++	  tok_range.m_finish
++	    =3D linemap_position_for_column (pfile->line_table,
++					   CPP_BUF_COLUMN (pfile->buffer,
++							   pfile->buffer->cur));
++	  loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
++				       loc, tok_range, NULL);
++	}
++
++      encoding_rich_location rich_loc (pfile, loc);
++
+       /* Make sure that the token is printed using UCNs, even
+ 	 if we'd otherwise happily print UTF-8.  */
+       unsigned char *buf =3D XNEWVEC (unsigned char, cpp_token_len (token=
));
+@@ -1304,11 +1330,11 @@ warn_about_normalization (cpp_reader *pf
+=20
+       sz =3D cpp_spell_token (pfile, token, buf, false) - buf;
+       if (NORMALIZE_STATE_RESULT (s) =3D=3D normalized_C)
+-	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
+-			       "`%.*s' is not in NFKC", (int) sz, buf);
++	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
++			"`%.*s' is not in NFKC", (int) sz, buf);
+       else
+-	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
+-			       "`%.*s' is not in NFC", (int) sz, buf);
++	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
++			"`%.*s' is not in NFC", (int) sz, buf);
+       free (buf);
+     }
+ }
+diff --git a/libcpp/line-map.c b/libcpp/line-map.c
+--- a/libcpp/line-map.c	2020-07-22 23:35:18.712399623 -0700
++++ b/libcpp/line-map.c	2021-12-25 01:30:50.685688757 -0800
+@@ -2007,7 +2007,8 @@ rich_location::rich_location (line_maps
+   m_fixit_hints (),
+   m_seen_impossible_fixit (false),
+   m_fixits_cannot_be_auto_applied (false),
+-  m_path (NULL)
++  m_path (NULL),
++  m_escape_on_output (false)
+ {
+   add_range (loc, SHOW_RANGE_WITH_CARET, label);
+ }
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch b/meta=
/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
new file mode 100644
index 0000000000..6bfaf8402d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
@@ -0,0 +1,1724 @@
+From 51c500269bf53749b107807d84271385fad35628 Mon Sep 17 00:00:00 2001
+From: Marek Polacek <polacek@redhat.com>
+Date: Wed, 6 Oct 2021 14:33:59 -0400
+Subject: [PATCH] libcpp: Implement -Wbidi-chars for CVE-2021-42574 [PR1030=
26]
+
+From a link below:
+"An issue was discovered in the Bidirectional Algorithm in the Unicode
+Specification through 14.0. It permits the visual reordering of
+characters via control sequences, which can be used to craft source code
+that renders different logic than the logical ordering of tokens
+ingested by compilers and interpreters. Adversaries can leverage this to
+encode source code for compilers accepting Unicode such that targeted
+vulnerabilities are introduced invisibly to human reviewers."
+
+More info:
+https://nvd.nist.gov/vuln/detail/CVE-2021-42574
+https://trojansource.codes/
+
+This is not a compiler bug.  However, to mitigate the problem, this patch
+implements -Wbidi-chars=3D[none|unpaired|any] to warn about possibly
+misleading Unicode bidirectional control characters the preprocessor may
+encounter.
+
+The default is =3Dunpaired, which warns about improperly terminated
+bidirectional control characters; e.g. a LRE without its corresponding PDF.
+The level =3Dany warns about any use of bidirectional control characters.
+
+This patch handles both UCNs and UTF-8 characters.  UCNs designating
+bidi characters in identifiers are accepted since r204886.  Then r217144
+enabled -fextended-identifiers by default.  Extended characters in C/C++
+identifiers have been accepted since r275979.  However, this patch still
+warns about mixing UTF-8 and UCN bidi characters; there seems to be no
+good reason to allow mixing them.
+
+We warn in different contexts: comments (both C and C++-style), string
+literals, character constants, and identifiers.  Expectedly, UCNs are igno=
red
+in comments and raw string literals.  The bidirectional control characters
+can nest so this patch handles that as well.
+
+I have not included nor tested this at all with Fortran (which also has
+string literals and line comments).
+
+Dave M. posted patches improving diagnostic involving Unicode characters.
+This patch does not make use of this new infrastructure yet.
+
+	PR preprocessor/103026
+
+gcc/c-family/ChangeLog:
+
+	* c.opt (Wbidi-chars, Wbidi-chars=3D): New option.
+
+gcc/ChangeLog:
+
+	* doc/invoke.texi: Document -Wbidi-chars.
+
+libcpp/ChangeLog:
+
+	* include/cpplib.h (enum cpp_bidirectional_level): New.
+	(struct cpp_options): Add cpp_warn_bidirectional.
+	(enum cpp_warning_reason): Add CPP_W_BIDIRECTIONAL.
+	* internal.h (struct cpp_reader): Add warn_bidi_p member
+	function.
+	* init.c (cpp_create_reader): Set cpp_warn_bidirectional.
+	* lex.c (bidi): New namespace.
+	(get_bidi_utf8): New function.
+	(get_bidi_ucn): Likewise.
+	(maybe_warn_bidi_on_close): Likewise.
+	(maybe_warn_bidi_on_char): Likewise.
+	(_cpp_skip_block_comment): Implement warning about bidirectional
+	control characters.
+	(skip_line_comment): Likewise.
+	(forms_identifier_p): Likewise.
+	(lex_identifier): Likewise.
+	(lex_string): Likewise.
+	(lex_raw_string): Likewise.
+
+gcc/testsuite/ChangeLog:
+
+	* c-c++-common/Wbidi-chars-1.c: New test.
+	* c-c++-common/Wbidi-chars-2.c: New test.
+	* c-c++-common/Wbidi-chars-3.c: New test.
+	* c-c++-common/Wbidi-chars-4.c: New test.
+	* c-c++-common/Wbidi-chars-5.c: New test.
+	* c-c++-common/Wbidi-chars-6.c: New test.
+	* c-c++-common/Wbidi-chars-7.c: New test.
+	* c-c++-common/Wbidi-chars-8.c: New test.
+	* c-c++-common/Wbidi-chars-9.c: New test.
+	* c-c++-common/Wbidi-chars-10.c: New test.
+	* c-c++-common/Wbidi-chars-11.c: New test.
+	* c-c++-common/Wbidi-chars-12.c: New test.
+	* c-c++-common/Wbidi-chars-13.c: New test.
+	* c-c++-common/Wbidi-chars-14.c: New test.
+	* c-c++-common/Wbidi-chars-15.c: New test.
+	* c-c++-common/Wbidi-chars-16.c: New test.
+	* c-c++-common/Wbidi-chars-17.c: New test.
+
+CVE: CVE-2021-42574
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;=
h=3D51c500269bf53749b107807d84271385fad35628]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ gcc/c-family/c.opt                          |  24 ++
+ gcc/doc/invoke.texi                         |  21 +-
+ gcc/testsuite/c-c++-common/Wbidi-chars-1.c  |  12 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-10.c |  27 ++
+ gcc/testsuite/c-c++-common/Wbidi-chars-11.c |  13 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-12.c |  19 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-13.c |  17 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-14.c |  38 ++
+ gcc/testsuite/c-c++-common/Wbidi-chars-15.c |  59 +++
+ gcc/testsuite/c-c++-common/Wbidi-chars-16.c |  26 ++
+ gcc/testsuite/c-c++-common/Wbidi-chars-17.c |  30 ++
+ gcc/testsuite/c-c++-common/Wbidi-chars-2.c  |   9 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-3.c  |  11 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-4.c  | 188 +++++++++
+ gcc/testsuite/c-c++-common/Wbidi-chars-5.c  | 188 +++++++++
+ gcc/testsuite/c-c++-common/Wbidi-chars-6.c  | 155 ++++++++
+ gcc/testsuite/c-c++-common/Wbidi-chars-7.c  |   9 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-8.c  |  13 +
+ gcc/testsuite/c-c++-common/Wbidi-chars-9.c  |  29 ++
+ libcpp/include/cpplib.h                     |  18 +-
+ libcpp/init.c                               |   1 +
+ libcpp/internal.h                           |   7 +
+ libcpp/lex.c                                | 408 +++++++++++++++++++-
+ 23 files changed, 1315 insertions(+), 7 deletions(-)
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-1.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-10.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-11.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-12.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-13.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-14.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-15.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-16.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-17.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-2.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-3.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-4.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-5.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-6.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-7.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-8.c
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
+
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+--- a/gcc/c-family/c.opt	2021-12-25 01:29:12.915317374 -0800
++++ b/gcc/c-family/c.opt	2021-12-25 01:36:22.040018701 -0800
+@@ -350,6 +350,30 @@ Wbad-function-cast
+ C ObjC Var(warn_bad_function_cast) Warning
+ Warn about casting functions to incompatible types.
+=20
++Wbidi-chars
++C ObjC C++ ObjC++ Warning Alias(Wbidi-chars=3D,any,none)
++;
++
++Wbidi-chars=3D
++C ObjC C++ ObjC++ RejectNegative Joined Warning CPP(cpp_warn_bidirectiona=
l) CppReason(CPP_W_BIDIRECTIONAL) Var(warn_bidirectional) Init(bidirectiona=
l_unpaired) Enum(cpp_bidirectional_level)
++-Wbidi-chars=3D[none|unpaired|any] Warn about UTF-8 bidirectional control=
 characters.
++
++; Required for these enum values.
++SourceInclude
++cpplib.h
++
++Enum
++Name(cpp_bidirectional_level) Type(int) UnknownError(argument %qs to %<-W=
bidi-chars%> not recognized)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(none) Value(bidirectional_none)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(unpaired) Value(bidirectional_unpair=
ed)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(any) Value(bidirectional_any)
++
+ Wbool-compare
+ C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C++=
 ObjC++,Wall)
+ Warn about boolean expression compared with an integer value different fr=
om true/false.
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-25 01:35:33.284883488 -0800
++++ b/gcc/doc/invoke.texi	2021-12-25 01:36:22.048018559 -0800
+@@ -310,7 +310,9 @@ Objective-C and Objective-C++ Dialects}.
+ -Warith-conversion @gol
+ -Warray-bounds  -Warray-bounds=3D@var{n} @gol
+ -Wno-attributes  -Wattribute-alias=3D@var{n} -Wno-attribute-alias @gol
+--Wno-attribute-warning  -Wbool-compare  -Wbool-operation @gol
++-Wno-attribute-warning  @gol
++-Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]} @gol
++-Wbool-compare  -Wbool-operation @gol
+ -Wno-builtin-declaration-mismatch @gol
+ -Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat @gol
+ -Wc11-c2x-compat @gol
+@@ -6860,6 +6862,23 @@ Attributes considered include @code{allo
+ This is the default.  You can disable these warnings with either
+ @option{-Wno-attribute-alias} or @option{-Wattribute-alias=3D0}.
+=20
++@item -Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]}
++@opindex Wbidi-chars=3D
++@opindex Wbidi-chars
++@opindex Wno-bidi-chars
++Warn about possibly misleading UTF-8 bidirectional control characters in
++comments, string literals, character constants, and identifiers.  Such
++characters can change left-to-right writing direction into right-to-left
++(and vice versa), which can cause confusion between the logical order and
++visual order.  This may be dangerous; for instance, it may seem that a pi=
ece
++of code is not commented out, whereas it in fact is.
++
++There are three levels of warning supported by GCC@.  The default is
++@option{-Wbidi-chars=3Dunpaired}, which warns about improperly terminated
++bidi contexts.  @option{-Wbidi-chars=3Dnone} turns the warning off.
++@option{-Wbidi-chars=3Dany} warns about any use of bidirectional control
++characters.
++
+ @item -Wbool-compare
+ @opindex Wno-bool-compare
+ @opindex Wbool-compare
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-10.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,27 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* More nesting testing.  */
++
++/* RLE=E2=80=AB LRI=E2=81=A6 PDF=E2=80=AC PDI=E2=81=A9*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int LRE_\u202a_PDF_\u202c;
++int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
++int LRE_\u202a_LRI_\u2066_PDF_\u202c_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLE_\u202b_RLI_\u2067_PDF_\u202c_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLE_\u202b_RLI_\u2067_PDI_\u2069_PDF_\u202c;
++int FSI_\u2068_LRO_\u202d_PDI_\u2069_PDF_\u202c;
++int FSI_\u2068;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int FSI_\u2068_PDI_\u2069;
++int FSI_\u2068_FSI_\u2068_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI=
_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_P=
DI_\u2069;
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI=
_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI=
_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_P=
DF_\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_PDI=
_\u2069_PDI_\u2069_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-11.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,13 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test that we warn when mixing UCN and UTF-8.  */
++
++int LRE_=E2=80=AA_PDF_\u202c;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++int LRE_\u202a_PDF_=E2=80=AC_;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++const char *s1 =3D "LRE_=E2=80=AA_PDF_\u202c";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++const char *s2 =3D "LRE_\u202a_PDF_=E2=80=AC";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-12.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,19 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile { target { c || c++11 } } } */
++/* { dg-options "-Wbidi-chars=3Dany" } */
++/* Test raw strings.  */
++
++const char *s1 =3D R"(a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z)";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++const char *s2 =3D R"(a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z)";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++const char *s3 =3D R"(a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z)";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++const char *s4 =3D R"(a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z)";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++const char *s7 =3D R"(a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y) z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++const char *s8 =3D R"(a b c PDI=E2=81=A9 x y )z";
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++const char *s9 =3D R"(a b c PDF=E2=80=AC x y z)";
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-13.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,17 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile { target { c || c++11 } } } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test raw strings.  */
++
++const char *s1 =3D R"(a b c LRE=E2=80=AA 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s2 =3D R"(a b c RLE=E2=80=AB 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 =3D R"(a b c LRO=E2=80=AD 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s4 =3D R"(a b c FSI=E2=81=A8 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s5 =3D R"(a b c LRI=E2=81=A6 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s6 =3D R"(a b c RLI=E2=81=A7 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-14.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,38 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
++   or RLOs.  */
++
++/* LRI_=E2=81=A6_LRI_=E2=81=A6_RLE_=E2=80=AB_RLE_=E2=80=AB_RLE_=E2=80=AB_=
PDI_=E2=81=A9*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// LRI_=E2=81=A6_RLE_=E2=80=AB_RLE_=E2=80=AB_RLE_=E2=80=AB_PDI_=E2=81=A9
++// LRI_=E2=81=A6_RLO_=E2=80=AE_RLE_=E2=80=AB_RLE_=E2=80=AB_PDI_=E2=81=A9
++// LRI_=E2=81=A6_RLO_=E2=80=AE_RLE_=E2=80=AB_PDI_=E2=81=A9
++// FSI_=E2=81=A8_RLO_=E2=80=AE_PDI_=E2=81=A9
++// FSI_=E2=81=A8_FSI_=E2=81=A8_RLO_=E2=80=AE_PDI_=E2=81=A9
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_PDI=
_\u2069;
++int LRI_\u2066_LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI=
_\u2069_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int PDI_\u2069;
++int LRI_\u2066_PDI_\u2069;
++int RLI_\u2067_PDI_\u2069;
++int LRE_\u202a_LRI_\u2066_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int LRI_\u2066_LRE_\u202a_PDF_\u202c_PDI_\u2069;
++int LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
++int RLI_\u2067_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int FSI_\u2068_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLO_\u202e_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_PDI_\u2069_RLI_\u2067;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int FSI_\u2068_PDF_\u202c_PDI_\u2069;
++int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-15.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,59 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test unpaired bidi control chars in multiline comments.  */
++
++/*
++ * LRE=E2=80=AA end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLE=E2=80=AB end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * LRO=E2=80=AD end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLO=E2=80=AE end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * LRI=E2=81=A6 end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLI=E2=81=A7 end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * FSI=E2=81=A8 end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/* LRE=E2=80=AA
++   PDF=E2=80=AC */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/* FSI=E2=81=A8
++   PDI=E2=81=A9 */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++
++/* LRE<=E2=80=AA>
++ *
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
++
++/*
++ * LRE<=E2=80=AA>
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++
++/*
++ *
++ * LRE<=E2=80=AA> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++/* RLI<=E2=81=A7> */ /* PDI<=E2=81=A9> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRE<=E2=80=AA> */ /* PDF<=E2=80=AC> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-16.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,26 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dany" } */
++/* Test LTR/RTL chars.  */
++
++/* LTR<=E2=80=8E> */
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++// LTR<=E2=80=8E>
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++/* RTL<=E2=80=8F> */
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++// RTL<=E2=80=8F>
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++
++const char *s1 =3D "LTR<=E2=80=8E>";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s2 =3D "LTR\u200e";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s3 =3D "LTR\u200E";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s4 =3D "RTL<=E2=80=8F>";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++const char *s5 =3D "RTL\u200f";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++const char *s6 =3D "RTL\u200F";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite/c=
-c++-common/Wbidi-chars-17.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c	1969-12-31 16:00:00.0000=
00000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c	2021-12-25 01:36:22.0480=
18559 -0800
+@@ -0,0 +1,30 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test LTR/RTL chars.  */
++
++/* LTR<=E2=80=8E> */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// LTR<=E2=80=8E>
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* RTL<=E2=80=8F> */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// RTL<=E2=80=8F>
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int ltr_\u200e;
++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
++int rtl_\u200f;
++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
++
++const char *s1 =3D "LTR<=E2=80=8E>";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s2 =3D "LTR\u200e";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 =3D "LTR\u200E";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s4 =3D "RTL<=E2=80=8F>";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s5 =3D "RTL\u200f";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s6 =3D "RTL\u200F";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-1.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c	2021-12-25 01:36:22.04801=
8559 -0800
+@@ -0,0 +1,12 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    int isAdmin =3D 0;
++    /*=E2=80=AE } =E2=81=A6if (isAdmin)=E2=81=A9 =E2=81=A6 begin admins o=
nly */
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++        __builtin_printf("You are an admin.\n");
++    /* end admins only =E2=80=AE { =E2=81=A6*/
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-2.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c	2021-12-25 01:36:22.04801=
8559 -0800
+@@ -0,0 +1,9 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    /* Say hello; newline=E2=81=A7/*/ return 0 ;
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++    __builtin_printf("Hello world.\n");
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-3.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c	2021-12-25 01:36:22.04801=
8559 -0800
+@@ -0,0 +1,11 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    const char* access_level =3D "user";
++    if (__builtin_strcmp(access_level, "user=E2=80=AE =E2=81=A6// Check i=
f admin=E2=81=A9 =E2=81=A6")) {
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++        __builtin_printf("You are an admin.\n");
++    }
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-4.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c	2021-12-25 01:36:22.04801=
8559 -0800
+@@ -0,0 +1,188 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dany -Wno-multichar -Wno-overflow" } */
++/* Test all bidi chars in various contexts (identifiers, comments,
++   string literals, character constants), both UCN and UTF-8.  The bidi
++   chars here are properly terminated, except for the character constants=
.  */
++
++/* a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++/* a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++/* a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++/* a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++/* a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++/* a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y */
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++/* a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++
++/* Same but C++ comments instead.  */
++// a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++// a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++// a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++// a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++// a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++// a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++// a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++
++/* Here we're closing an unopened context, warn when =3Dany.  */
++/* a b c PDI=E2=81=A9 x y z */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++/* a b c PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++// a b c PDI=E2=81=A9 x y z
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++// a b c PDF=E2=80=AC x y z
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++/* Multiline comments.  */
++/* a b c PDI=E2=81=A9 x y z
++   */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
++/* a b c PDF=E2=80=AC x y z
++   */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDI=E2=81=A9 x y z
++   */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDF=E2=80=AC x y z
++   */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDI=E2=81=A9 x y z */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++/* first
++   a b c PDF=E2=80=AC x y z */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s2 =3D "a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s3 =3D "a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s4 =3D "a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s5 =3D "a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char *s6 =3D "a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char *s7 =3D "a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++  const char *s8 =3D "a b c PDI=E2=81=A9 x y z";
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++  const char *s9 =3D "a b c PDF=E2=80=AC x y z";
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++}
++
++void
++g2 ()
++{
++  const char c1 =3D '\u202a';
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char c2 =3D '\u202A';
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char c3 =3D '\u202b';
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char c4 =3D '\u202B';
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char c5 =3D '\u202d';
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char c6 =3D '\u202D';
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char c7 =3D '\u202e';
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char c8 =3D '\u202E';
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char c9 =3D '\u2066';
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char c10 =3D '\u2067';
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char c11 =3D '\u2068';
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++}
++
++int a=E2=80=AAb=E2=80=ACc;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int a=E2=80=ABb=E2=80=ACc;
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++int a=E2=80=ADb=E2=80=ACc;
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++int a=E2=80=AEb=E2=80=ACc;
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++int a=E2=81=A6b=E2=81=A9c;
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++int a=E2=81=A7b=E2=81=A9c;
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++int a=E2=81=A8b=E2=81=A9c;
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++int A=E2=80=ACX;
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++int A\u202cY;
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++int A\u202CY2;
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++int d\u202ae\u202cf;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int d\u202Ae\u202cf2;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int d\u202be\u202cf;
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++int d\u202Be\u202cf2;
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++int d\u202de\u202cf;
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++int d\u202De\u202cf2;
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++int d\u202ee\u202cf;
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++int d\u202Ee\u202cf2;
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++int d\u2066e\u2069f;
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++int d\u2067e\u2069f;
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++int d\u2068e\u2069f;
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++int X\u2069;
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-5.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c	2021-12-25 01:36:22.04801=
8559 -0800
+@@ -0,0 +1,188 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired -Wno-multichar -Wno-overflow" } =
*/
++/* Test all bidi chars in various contexts (identifiers, comments,
++   string literals, character constants), both UCN and UTF-8.  The bidi
++   chars here are properly terminated, except for the character constants=
.  */
++
++/* a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Same but C++ comments instead.  */
++// a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Here we're closing an unopened context, warn when =3Dany.  */
++/* a b c PDI=E2=81=A9 x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c PDI=E2=81=A9 x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c PDF=E2=80=AC x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Multiline comments.  */
++/* a b c PDI=E2=81=A9 x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* a b c PDF=E2=80=AC x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDI=E2=81=A9 x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDF=E2=80=AC x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDI=E2=81=A9 x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* first
++   a b c PDF=E2=80=AC x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s2 =3D "a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s3 =3D "a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s4 =3D "a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s5 =3D "a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s6 =3D "a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s7 =3D "a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s8 =3D "a b c PDI=E2=81=A9 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s9 =3D "a b c PDF=E2=80=AC x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++}
++
++void
++g2 ()
++{
++  const char c1 =3D '\u202a';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c2 =3D '\u202A';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c3 =3D '\u202b';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c4 =3D '\u202B';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c5 =3D '\u202d';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c6 =3D '\u202D';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c7 =3D '\u202e';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c8 =3D '\u202E';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c9 =3D '\u2066';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c10 =3D '\u2067';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c11 =3D '\u2068';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++}
++
++int a=E2=80=AAb=E2=80=ACc;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=80=ABb=E2=80=ACc;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=80=ADb=E2=80=ACc;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=80=AEb=E2=80=ACc;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=81=A6b=E2=81=A9c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=81=A7b=E2=81=A9c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int a=E2=81=A8b=E2=81=A9c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int A=E2=80=ACX;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int A\u202cY;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int A\u202CY2;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++int d\u202ae\u202cf;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202Ae\u202cf2;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202be\u202cf;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202Be\u202cf2;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202de\u202cf;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202De\u202cf2;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202ee\u202cf;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u202Ee\u202cf2;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u2066e\u2069f;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u2067e\u2069f;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int d\u2068e\u2069f;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int X\u2069;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-6.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c	2021-12-25 01:36:22.05201=
8489 -0800
+@@ -0,0 +1,155 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test nesting of bidi chars in various contexts.  */
++
++/* Terminated by the wrong char:  */
++/* a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++/* LRE=E2=80=AA PDF=E2=80=AC */
++/* LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=AC */
++/* PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC */
++/* LRE=E2=80=AA PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC */
++/* LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* PDF=E2=80=AC LRE=E2=80=AA */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++// a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z=20
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z=20
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z=20
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z=20
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y  z
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++// LRE=E2=80=AA PDF=E2=80=AC=20
++// LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=AC
++// PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC
++// LRE=E2=80=AA PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC
++// LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// PDF=E2=80=AC LRE=E2=80=AA
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s2 =3D "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s3 =3D "a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y ";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s4 =3D "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s5 =3D "a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s6 =3D "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s7 =3D "a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s8 =3D "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s9 =3D "a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s10 =3D "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s11 =3D "a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z\
++    ";
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++  const char *s12 =3D "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s13 =3D "a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s14 =3D "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s15 =3D "PDF=E2=80=AC LRE=E2=80=AA";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s16 =3D "PDF\u202c LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s17 =3D "LRE=E2=80=AA PDF=E2=80=AC";
++  const char *s18 =3D "LRE\u202a PDF\u202c";
++  const char *s19 =3D "LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=
=AC";
++  const char *s20 =3D "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
++  const char *s21 =3D "PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC";
++  const char *s22 =3D "PDF\u202c LRE\u202a PDF\u202c";
++  const char *s23 =3D "LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s24 =3D "LRE\u202a LRE\u202a PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s25 =3D "PDF=E2=80=AC LRE=E2=80=AA";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s26 =3D "PDF\u202c LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s27 =3D "PDF=E2=80=AC LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s28 =3D "PDF\u202c LRE=E2=80=AA";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++}
++
++int aLRE=E2=80=AAbPDI=E2=81=A9;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int A\u202aB\u2069C;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLE=E2=80=ABbPDI=E2=81=A9;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202bB\u2069c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLRO=E2=80=ADbPDI=E2=81=A9;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202db\u2069c2;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLO=E2=80=AEbPDI=E2=81=A9;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202eb\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLRI=E2=81=A6bPDF=E2=80=AC;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u2066b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLI=E2=81=A7bPDF=E2=80=ACc
++;
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++int a\u2067b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSI=E2=81=A8bPDF=E2=80=AC;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u2068b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSI=E2=81=A8bPD\u202C;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSI\u2068bPDF=E2=80=AC_;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLRE=E2=80=AAbPDF=E2=80=ACb;=20
++int A\u202aB\u202c;
++int a_LRE=E2=80=AA_LRE=E2=80=AA_b_PDF=E2=80=AC_PDF=E2=80=AC;
++int A\u202aA\u202aB\u202cB\u202c;
++int aPDF=E2=80=ACbLREadPDF=E2=80=AC;
++int a_\u202C_\u202a_\u202c;
++int a_LRE=E2=80=AA_b_PDF=E2=80=AC_c_LRE=E2=80=AA_PDF=E2=80=AC;
++int a_\u202a_\u202c_\u202a_\u202c_;
++int a_LRE=E2=80=AA_b_PDF=E2=80=AC_c_LRE=E2=80=AA;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a_\u202a_\u202c_\u202a_;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-7.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c	2021-12-25 01:36:22.05201=
8489 -0800
+@@ -0,0 +1,9 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dany" } */
++/* Test we ignore UCNs in comments.  */
++
++// a b c \u202a 1 2 3
++// a b c \u202A 1 2 3
++/* a b c \u202a 1 2 3 */
++/* a b c \u202A 1 2 3 */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-8.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c	2021-12-25 01:36:22.05201=
8489 -0800
+@@ -0,0 +1,13 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dany" } */
++/* Test \u vs \U.  */
++
++int a_\u202A;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int a_\u202a_2;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int a_\U0000202A_3;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int a_\U0000202a_4;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/c-=
c++-common/Wbidi-chars-9.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c	1969-12-31 16:00:00.00000=
0000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c	2021-12-25 01:36:22.05201=
8489 -0800
+@@ -0,0 +1,29 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
++/* Test that we properly separate bidi contexts (comment/identifier/chara=
cter
++   constant/string literal).  */
++
++/* LRE ->=E2=80=AA<- */ int pdf_\u202c_1;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLE ->=E2=80=AB<- */ int pdf_\u202c_2;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRO ->=E2=80=AD<- */ int pdf_\u202c_3;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLO ->=E2=80=AE<- */ int pdf_\u202c_4;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRI ->=E2=81=A6<-*/ int pdi_\u2069_1;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLI ->=E2=81=A7<- */ int pdi_\u2069_12;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* FSI ->=E2=81=A8<- */ int pdi_\u2069_3;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++const char *s1 =3D "LRE\u202a"; /* PDF ->=E2=80=AC<- */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRE ->=E2=80=AA<- */ const char *s2 =3D "PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 =3D "LRE\u202a"; int pdf_\u202c_5;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int lre_\u202a; const char *s4 =3D "PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
+--- a/libcpp/include/cpplib.h	2021-12-25 01:35:33.288883417 -0800
++++ b/libcpp/include/cpplib.h	2021-12-25 01:36:22.052018489 -0800
+@@ -308,6 +308,17 @@ enum cpp_normalize_level {
+   normalized_none
+ };
+=20
++/* The possible bidirectional control characters checking levels, from le=
ast
++   restrictive to most.  */
++enum cpp_bidirectional_level {
++  /* No checking.  */
++  bidirectional_none,
++  /* Only detect unpaired uses of bidirectional control characters.  */
++  bidirectional_unpaired,
++  /* Detect any use of bidirectional control characters.  */
++  bidirectional_any
++};
++
+ /* This structure is nested inside struct cpp_reader, and
+    carries all the options visible to the command line.  */
+ struct cpp_options
+@@ -515,6 +526,10 @@ struct cpp_options
+   /* True if warn about differences between C++98 and C++11.  */
+   bool cpp_warn_cxx11_compat;
+=20
++  /* Nonzero if bidirectional control characters checking is on.  See enum
++     cpp_bidirectional_level.  */
++  unsigned char cpp_warn_bidirectional;
++
+   /* Dependency generation.  */
+   struct
+   {
+@@ -613,7 +628,8 @@ enum cpp_warning_reason {
+   CPP_W_C90_C99_COMPAT,
+   CPP_W_C11_C2X_COMPAT,
+   CPP_W_CXX11_COMPAT,
+-  CPP_W_EXPANSION_TO_DEFINED
++  CPP_W_EXPANSION_TO_DEFINED,
++  CPP_W_BIDIRECTIONAL
+ };
+=20
+ /* Callback for header lookup for HEADER, which is the name of a
+diff --git a/libcpp/init.c b/libcpp/init.c
+--- a/libcpp/init.c	2021-12-25 01:29:12.931317107 -0800
++++ b/libcpp/init.c	2021-12-25 01:36:22.052018489 -0800
+@@ -215,6 +215,7 @@ cpp_create_reader (enum c_lang lang, cpp
+       =3D ENABLE_CANONICAL_SYSTEM_HEADERS;
+   CPP_OPTION (pfile, ext_numeric_literals) =3D 1;
+   CPP_OPTION (pfile, warn_date_time) =3D 0;
++  CPP_OPTION (pfile, cpp_warn_bidirectional) =3D bidirectional_unpaired;
+=20
+   /* Default CPP arithmetic to something sensible for the host for the
+      benefit of dumb users like fix-header.  */
+diff --git a/libcpp/internal.h b/libcpp/internal.h
+--- a/libcpp/internal.h	2021-12-25 01:35:33.288883417 -0800
++++ b/libcpp/internal.h	2021-12-25 01:36:22.052018489 -0800
+@@ -581,6 +581,10 @@ struct cpp_reader
+   /* If non-zero, the lexer will use this location for the next token
+      instead of getting a location from the linemap.  */
+   location_t forced_token_location;
++  bool warn_bidi_p () const
++  {
++    return CPP_OPTION (this, cpp_warn_bidirectional) !=3D bidirectional_n=
one;
++  }
+ };
+=20
+ /* Character classes.  Based on the more primitive macros in safe-ctype.h.
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-12-25 01:35:33.288883417 -0800
++++ b/libcpp/lex.c	2021-12-25 01:36:22.052018489 -0800
+@@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
+     }
+ }
+=20
++namespace bidi {
++  enum class kind {
++    NONE, LRE, RLE, LRO, RLO, LRI, RLI, FSI, PDF, PDI, LTR, RTL
++  };
++
++  /* All the UTF-8 encodings of bidi characters start with E2.  */
++  constexpr uchar utf8_start =3D 0xe2;
++
++  /* A vector holding currently open bidi contexts.  We use a char for
++     each context, its LSB is 1 if it represents a PDF context, 0 if it
++     represents a PDI context.  The next bit is 1 if this context was open
++     by a bidi character written as a UCN, and 0 when it was UTF-8.  */
++  semi_embedded_vec <unsigned char, 16> vec;
++
++  /* Close the whole comment/identifier/string literal/character constant
++     context.  */
++  void on_close ()
++  {
++    vec.truncate (0);
++  }
++
++  /* Pop the last element in the vector.  */
++  void pop ()
++  {
++    unsigned int len =3D vec.count ();
++    gcc_checking_assert (len > 0);
++    vec.truncate (len - 1);
++  }
++
++  /* Return the context of the Ith element.  */
++  kind ctx_at (unsigned int i)
++  {
++    return (vec[i] & 1) ? kind::PDF : kind::PDI;
++  }
++
++  /* Return which context is currently opened.  */
++  kind current_ctx ()
++  {
++    unsigned int len =3D vec.count ();
++    if (len =3D=3D 0)
++      return kind::NONE;
++    return ctx_at (len - 1);
++  }
++
++  /* Return true if the current context comes from a UCN origin, that is,
++     the bidi char which started this bidi context was written as a UCN. =
 */
++  bool current_ctx_ucn_p ()
++  {
++    unsigned int len =3D vec.count ();
++    gcc_checking_assert (len > 0);
++    return (vec[len - 1] >> 1) & 1;
++  }
++
++  /* We've read a bidi char, update the current vector as necessary.  */
++  void on_char (kind k, bool ucn_p)
++  {
++    switch (k)
++      {
++      case kind::LRE:
++      case kind::RLE:
++      case kind::LRO:
++      case kind::RLO:
++	vec.push (ucn_p ? 3u : 1u);
++	break;
++      case kind::LRI:
++      case kind::RLI:
++      case kind::FSI:
++	vec.push (ucn_p ? 2u : 0u);
++	break;
++      /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
++	 whose scope has not yet been terminated.  */
++      case kind::PDF:
++	if (current_ctx () =3D=3D kind::PDF)
++	  pop ();
++	break;
++      /* PDI terminates the scope of the last LRI, RLI, or FSI whose
++	 scope has not yet been terminated, as well as the scopes of
++	 any subsequent LREs, RLEs, LROs, or RLOs whose scopes have not
++	 yet been terminated.  */
++      case kind::PDI:
++	for (int i =3D vec.count () - 1; i >=3D 0; --i)
++	  if (ctx_at (i) =3D=3D kind::PDI)
++	    {
++	      vec.truncate (i);
++	      break;
++	    }
++	break;
++      case kind::LTR:
++      case kind::RTL:
++	/* These aren't popped by a PDF/PDI.  */
++	break;
++      [[likely]] case kind::NONE:
++	break;
++      default:
++	abort ();
++      }
++  }
++
++  /* Return a descriptive string for K.  */
++  const char *to_str (kind k)
++  {
++    switch (k)
++      {
++      case kind::LRE:
++	return "U+202A (LEFT-TO-RIGHT EMBEDDING)";
++      case kind::RLE:
++	return "U+202B (RIGHT-TO-LEFT EMBEDDING)";
++      case kind::LRO:
++	return "U+202D (LEFT-TO-RIGHT OVERRIDE)";
++      case kind::RLO:
++	return "U+202E (RIGHT-TO-LEFT OVERRIDE)";
++      case kind::LRI:
++	return "U+2066 (LEFT-TO-RIGHT ISOLATE)";
++      case kind::RLI:
++	return "U+2067 (RIGHT-TO-LEFT ISOLATE)";
++      case kind::FSI:
++	return "U+2068 (FIRST STRONG ISOLATE)";
++      case kind::PDF:
++	return "U+202C (POP DIRECTIONAL FORMATTING)";
++      case kind::PDI:
++	return "U+2069 (POP DIRECTIONAL ISOLATE)";
++      case kind::LTR:
++	return "U+200E (LEFT-TO-RIGHT MARK)";
++      case kind::RTL:
++	return "U+200F (RIGHT-TO-LEFT MARK)";
++      default:
++	abort ();
++      }
++  }
++}
++
++/* Parse a sequence of 3 bytes starting with P and return its bidi code. =
 */
++
++static bidi::kind
++get_bidi_utf8 (const unsigned char *const p)
++{
++  gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
++
++  if (p[1] =3D=3D 0x80)
++    switch (p[2])
++      {
++      case 0xaa:
++	return bidi::kind::LRE;
++      case 0xab:
++	return bidi::kind::RLE;
++      case 0xac:
++	return bidi::kind::PDF;
++      case 0xad:
++	return bidi::kind::LRO;
++      case 0xae:
++	return bidi::kind::RLO;
++      case 0x8e:
++	return bidi::kind::LTR;
++      case 0x8f:
++	return bidi::kind::RTL;
++      default:
++	break;
++      }
++  else if (p[1] =3D=3D 0x81)
++    switch (p[2])
++      {
++      case 0xa6:
++	return bidi::kind::LRI;
++      case 0xa7:
++	return bidi::kind::RLI;
++      case 0xa8:
++	return bidi::kind::FSI;
++      case 0xa9:
++	return bidi::kind::PDI;
++      default:
++	break;
++      }
++
++  return bidi::kind::NONE;
++}
++
++/* Parse a UCN where P points just past \u or \U and return its bidi code=
.  */
++
++static bidi::kind
++get_bidi_ucn (const unsigned char *p, bool is_U)
++{
++  /* 6.4.3 Universal Character Names
++      \u hex-quad
++      \U hex-quad hex-quad
++     where \unnnn means \U0000nnnn.  */
++
++  if (is_U)
++    {
++      if (p[0] !=3D '0' || p[1] !=3D '0' || p[2] !=3D '0' || p[3] !=3D '0=
')
++	return bidi::kind::NONE;
++      /* Skip 4B so we can treat \u and \U the same below.  */
++      p +=3D 4;
++    }
++
++  /* All code points we are looking for start with 20xx.  */
++  if (p[0] !=3D '2' || p[1] !=3D '0')
++    return bidi::kind::NONE;
++  else if (p[2] =3D=3D '2')
++    switch (p[3])
++      {
++      case 'a':
++      case 'A':
++	return bidi::kind::LRE;
++      case 'b':
++      case 'B':
++	return bidi::kind::RLE;
++      case 'c':
++      case 'C':
++	return bidi::kind::PDF;
++      case 'd':
++      case 'D':
++	return bidi::kind::LRO;
++      case 'e':
++      case 'E':
++	return bidi::kind::RLO;
++      default:
++	break;
++      }
++  else if (p[2] =3D=3D '6')
++    switch (p[3])
++      {
++      case '6':
++	return bidi::kind::LRI;
++      case '7':
++	return bidi::kind::RLI;
++      case '8':
++	return bidi::kind::FSI;
++      case '9':
++	return bidi::kind::PDI;
++      default:
++	break;
++      }
++  else if (p[2] =3D=3D '0')
++    switch (p[3])
++      {
++      case 'e':
++      case 'E':
++	return bidi::kind::LTR;
++      case 'f':
++      case 'F':
++	return bidi::kind::RTL;
++      default:
++	break;
++      }
++
++  return bidi::kind::NONE;
++}
++
++/* We're closing a bidi context, that is, we've encountered a newline,
++   are closing a C-style comment, or are at the end of a string literal,
++   character constant, or identifier.  Warn if this context was not
++   properly terminated by a PDI or PDF.  P points to the last character
++   in this context.  */
++
++static void
++maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
++{
++  if (CPP_OPTION (pfile, cpp_warn_bidirectional) =3D=3D bidirectional_unp=
aired
++      && bidi::vec.count () > 0)
++    {
++      const location_t loc
++	=3D linemap_position_for_column (pfile->line_table,
++				       CPP_BUF_COLUMN (pfile->buffer, p));
++      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
++			     "unpaired UTF-8 bidirectional control character "
++			     "detected");
++    }
++  /* We're done with this context.  */
++  bidi::on_close ();
++}
++
++/* We're at the beginning or in the middle of an identifier/comment/string
++   literal/character constant.  Warn if we've encountered a bidi characte=
r.
++   KIND says which bidi character it was; P points to it in the character
++   stream.  UCN_P is true iff this bidi character was written as a UCN.  =
*/
++
++static void
++maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind ki=
nd,
++			 bool ucn_p)
++{
++  if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
++    return;
++
++  const auto warn_bidi =3D CPP_OPTION (pfile, cpp_warn_bidirectional);
++
++  if (warn_bidi !=3D bidirectional_none)
++    {
++      const location_t loc
++	=3D linemap_position_for_column (pfile->line_table,
++				       CPP_BUF_COLUMN (pfile->buffer, p));
++      /* It seems excessive to warn about a PDI/PDF that is closing
++	 an opened context because we've already warned about the
++	 opening character.  Except warn when we have a UCN x UTF-8
++	 mismatch.  */
++      if (kind =3D=3D bidi::current_ctx ())
++	{
++	  if (warn_bidi =3D=3D bidirectional_unpaired
++	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
++	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
++				   "UTF-8 vs UCN mismatch when closing "
++				   "a context by \"%s\"", bidi::to_str (kind));
++	}
++      else if (warn_bidi =3D=3D bidirectional_any)
++	{
++	  if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
++	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
++				   "\"%s\" is closing an unopened context",
++				   bidi::to_str (kind));
++	  else
++	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
++				   "found problematic Unicode character \"%s\"",
++				   bidi::to_str (kind));
++	}
++    }
++  /* We're done with this context.  */
++  bidi::on_char (kind, ucn_p);
++}
++
+ /* Skip a C-style block comment.  We find the end of the comment by
+    seeing if an asterisk is before every '/' we encounter.  Returns
+    nonzero if comment terminated by EOF, zero otherwise.
+@@ -1175,6 +1493,7 @@ _cpp_skip_block_comment (cpp_reader *pfi
+   cpp_buffer *buffer =3D pfile->buffer;
+   const uchar *cur =3D buffer->cur;
+   uchar c;
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+=20
+   cur++;
+   if (*cur =3D=3D '/')
+@@ -1189,7 +1508,11 @@ _cpp_skip_block_comment (cpp_reader *pfi
+       if (c =3D=3D '/')
+ 	{
+ 	  if (cur[-2] =3D=3D '*')
+-	    break;
++	    {
++	      if (warn_bidi_p)
++		maybe_warn_bidi_on_close (pfile, cur);
++	      break;
++	    }
+=20
+ 	  /* Warn about potential nested comments, but not if the '/'
+ 	     comes immediately before the true comment delimiter.
+@@ -1208,6 +1531,8 @@ _cpp_skip_block_comment (cpp_reader *pfi
+ 	{
+ 	  unsigned int cols;
+ 	  buffer->cur =3D cur - 1;
++	  if (warn_bidi_p)
++	    maybe_warn_bidi_on_close (pfile, cur);
+ 	  _cpp_process_line_notes (pfile, true);
+ 	  if (buffer->next_line >=3D buffer->rlimit)
+ 	    return true;
+@@ -1218,6 +1543,13 @@ _cpp_skip_block_comment (cpp_reader *pfi
+=20
+ 	  cur =3D buffer->cur;
+ 	}
++      /* If this is a beginning of a UTF-8 encoding, it might be
++	 a bidirectional control character.  */
++      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_bi=
di_p)
++	{
++	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
++	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
++	}
+     }
+=20
+   buffer->cur =3D cur;
+@@ -1233,9 +1565,31 @@ skip_line_comment (cpp_reader *pfile)
+ {
+   cpp_buffer *buffer =3D pfile->buffer;
+   location_t orig_line =3D pfile->line_table->highest_line;
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+=20
+-  while (*buffer->cur !=3D '\n')
+-    buffer->cur++;
++  if (!warn_bidi_p)
++    while (*buffer->cur !=3D '\n')
++      buffer->cur++;
++  else
++    {
++      while (*buffer->cur !=3D '\n'
++	     && *buffer->cur !=3D bidi::utf8_start)
++	buffer->cur++;
++      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
++	{
++	  while (*buffer->cur !=3D '\n')
++	    {
++	      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
++		{
++		  bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
++		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++					   /*ucn_p=3D*/false);
++		}
++	      buffer->cur++;
++	    }
++	  maybe_warn_bidi_on_close (pfile, buffer->cur);
++	}
++    }
+=20
+   _cpp_process_line_notes (pfile, true);
+   return orig_line !=3D pfile->line_table->highest_line;
+@@ -1343,11 +1697,13 @@ static const cppchar_t utf8_signifier =3D
+=20
+ /* Returns TRUE if the sequence starting at buffer->cur is valid in
+    an identifier.  FIRST is TRUE if this starts an identifier.  */
++
+ static bool
+ forms_identifier_p (cpp_reader *pfile, int first,
+ 		    struct normalize_state *state)
+ {
+   cpp_buffer *buffer =3D pfile->buffer;
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+=20
+   if (*buffer->cur =3D=3D '$')
+     {
+@@ -1370,6 +1726,13 @@ forms_identifier_p (cpp_reader *pfile, i
+       cppchar_t s;
+       if (*buffer->cur >=3D utf8_signifier)
+ 	{
++	  if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
++	      && warn_bidi_p)
++	    {
++	      bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
++	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++				       /*ucn_p=3D*/false);
++	    }
+ 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			       state, &s))
+ 	    return true;
+@@ -1378,6 +1741,13 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	       && (buffer->cur[1] =3D=3D 'u' || buffer->cur[1] =3D=3D 'U'))
+ 	{
+ 	  buffer->cur +=3D 2;
++	  if (warn_bidi_p)
++	    {
++	      bidi::kind kind =3D get_bidi_ucn (buffer->cur,
++					      buffer->cur[-1] =3D=3D 'U');
++	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++				       /*ucn_p=3D*/true);
++	    }
+ 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			      state, &s, NULL, NULL))
+ 	    return true;
+@@ -1486,6 +1856,7 @@ lex_identifier (cpp_reader *pfile, const
+   const uchar *cur;
+   unsigned int len;
+   unsigned int hash =3D HT_HASHSTEP (0, *base);
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+=20
+   cur =3D pfile->buffer->cur;
+   if (! starts_ucn)
+@@ -1509,6 +1880,8 @@ lex_identifier (cpp_reader *pfile, const
+ 	    pfile->buffer->cur++;
+ 	  }
+       } while (forms_identifier_p (pfile, false, nst));
++      if (warn_bidi_p)
++	maybe_warn_bidi_on_close (pfile, pfile->buffer->cur);
+       result =3D _cpp_interpret_identifier (pfile, base,
+ 					  pfile->buffer->cur - base);
+       *spelling =3D cpp_lookup (pfile, base, pfile->buffer->cur - base);
+@@ -1697,6 +2070,7 @@ lex_raw_string (cpp_reader *pfile, cpp_t
+ {
+   uchar raw_prefix[17];
+   uchar temp_buffer[18];
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+   const uchar *orig_base;
+   unsigned int raw_prefix_len =3D 0, raw_suffix_len =3D 0;
+   enum raw_str_phase { RAW_STR_PREFIX, RAW_STR, RAW_STR_SUFFIX };
+@@ -1946,8 +2320,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
+ 	  cur =3D base =3D pfile->buffer->cur;
+ 	  note =3D &pfile->buffer->notes[pfile->buffer->cur_note];
+ 	}
++      else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_star=
t, 0)
++	       && warn_bidi_p)
++	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
++				 /*ucn_p=3D*/false);
+     }
+=20
++  if (warn_bidi_p)
++    maybe_warn_bidi_on_close (pfile, pos);
++
+   if (CPP_OPTION (pfile, user_literals))
+     {
+       /* If a string format macro, say from inttypes.h, is placed touching
+@@ -2042,15 +2423,27 @@ lex_string (cpp_reader *pfile, cpp_token
+   else
+     terminator =3D '>', type =3D CPP_HEADER_NAME;
+=20
++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
+   for (;;)
+     {
+       cppchar_t c =3D *cur++;
+=20
+       /* In #include-style directives, terminators are not escapable.  */
+       if (c =3D=3D '\\' && !pfile->state.angled_headers && *cur !=3D '\n')
+-	cur++;
++	{
++	  if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
++	    {
++	      bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U');
++	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true);
++	    }
++	  cur++;
++	}
+       else if (c =3D=3D terminator)
+-	break;
++	{
++	  if (warn_bidi_p)
++	    maybe_warn_bidi_on_close (pfile, cur - 1);
++	  break;
++	}
+       else if (c =3D=3D '\n')
+ 	{
+ 	  cur--;
+@@ -2067,6 +2460,11 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	}
+       else if (c =3D=3D '\0')
+ 	saw_NUL =3D true;
++      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_bi=
di_p)
++	{
++	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
++	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/false);
++	}
+     }
+=20
+   if (saw_NUL && !pfile->state.skipping)
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/meta=
/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
new file mode 100644
index 0000000000..877b8a6452
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
@@ -0,0 +1,138 @@
+From 1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3 Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Tue, 2 Nov 2021 09:54:32 -0400
+Subject: [PATCH] libcpp: escape non-ASCII source bytes in -Wbidi-chars=3D
+ [PR103026]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+This flags rich_locations associated with -Wbidi-chars=3D so that
+non-ASCII bytes will be escaped when printing the source lines
+(using the diagnostics support I added in
+r12-4825-gbd5e882cf6e0def3dd1bc106075d59a303fe0d1e).
+
+In particular, this ensures that the printed source lines will
+be pure ASCII, and thus the visual ordering of the characters
+will be the same as the logical ordering.
+
+Before:
+
+  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      6 |     /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=A2=
=C2=A6 begin admins only */
+        |                                           ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      9 |     /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
+        |                            ^
+
+  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a con=
text by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+      6 | int LRE_=C3=A2=C2=AA_PDF_\u202c;
+        |               ^
+  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a con=
text by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+      8 | int LRE_\u202a_PDF_=C3=A2=C2=AC_;
+        |                   ^
+  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a co=
ntext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+     10 | const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
+        |                            ^
+  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a co=
ntext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+     12 | const char *s2 =3D "LRE_\u202a_PDF_=C3=A2=C2=AC";
+        |                                 ^
+
+After:
+
+  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin adm=
ins only */
+        |                                                                 =
          ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                                            ^
+
+  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a con=
text by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+      6 | int LRE_<U+202A>_PDF_\u202c;
+        |                       ^
+  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a con=
text by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+      8 | int LRE_\u202a_PDF_<U+202C>_;
+        |                   ^
+  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a co=
ntext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+     10 | const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
+        |                                    ^
+  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a co=
ntext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
+     12 | const char *s2 =3D "LRE_\u202a_PDF_<U+202C>";
+        |                                 ^
+
+libcpp/ChangeLog:
+	PR preprocessor/103026
+	* lex.c (maybe_warn_bidi_on_close): Use a rich_location
+	and call set_escape_on_output (true) on it.
+	(maybe_warn_bidi_on_char): Likewise.
+
+Signed-off-by: David Malcolm <dmalcolm@redhat.com>
+
+CVE: CVE-2021-42574
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;=
h=3D1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ libcpp/lex.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-12-14 20:44:11.647815287 -0800
++++ b/libcpp/lex.c	2021-12-14 20:43:38.008383220 -0800
+@@ -1427,9 +1427,11 @@ maybe_warn_bidi_on_close (cpp_reader *pf
+       const location_t loc
+ 	=3D linemap_position_for_column (pfile->line_table,
+ 				       CPP_BUF_COLUMN (pfile->buffer, p));
+-      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
+-			     "unpaired UTF-8 bidirectional control character "
+-			     "detected");
++      rich_location rich_loc (pfile->line_table, loc);
++      rich_loc.set_escape_on_output (true);
++      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++		      "unpaired UTF-8 bidirectional control character "
++		      "detected");
+     }
+   /* We're done with this context.  */
+   bidi::on_close ();
+@@ -1454,6 +1456,9 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+       const location_t loc
+ 	=3D linemap_position_for_column (pfile->line_table,
+ 				       CPP_BUF_COLUMN (pfile->buffer, p));
++      rich_location rich_loc (pfile->line_table, loc);
++      rich_loc.set_escape_on_output (true);
++
+       /* It seems excessive to warn about a PDI/PDF that is closing
+ 	 an opened context because we've already warned about the
+ 	 opening character.  Except warn when we have a UCN x UTF-8
+@@ -1462,20 +1467,20 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 	{
+ 	  if (warn_bidi =3D=3D bidirectional_unpaired
+ 	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
+-	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
+-				   "UTF-8 vs UCN mismatch when closing "
+-				   "a context by \"%s\"", bidi::to_str (kind));
++	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			    "UTF-8 vs UCN mismatch when closing "
++			    "a context by \"%s\"", bidi::to_str (kind));
+ 	}
+       else if (warn_bidi =3D=3D bidirectional_any)
+ 	{
+ 	  if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
+-	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
+-				   "\"%s\" is closing an unopened context",
+-				   bidi::to_str (kind));
++	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			    "\"%s\" is closing an unopened context",
++			    bidi::to_str (kind));
+ 	  else
+-	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
+-				   "found problematic Unicode character \"%s\"",
+-				   bidi::to_str (kind));
++	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			    "found problematic Unicode character \"%s\"",
++			    bidi::to_str (kind));
+ 	}
+     }
+   /* We're done with this context.  */
diff --git a/meta/recipes-devtools/gcc/gcc/0005-CVE-2021-42574.patch b/meta=
/recipes-devtools/gcc/gcc/0005-CVE-2021-42574.patch
new file mode 100644
index 0000000000..6e983a67b6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0005-CVE-2021-42574.patch
@@ -0,0 +1,575 @@
+From bef32d4a28595e933f24fef378cf052a30b674a7 Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Tue, 2 Nov 2021 15:45:22 -0400
+Subject: [PATCH] libcpp: capture and underline ranges in -Wbidi-chars=3D
+ [PR103026]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+This patch converts the bidi::vec to use a struct so that we can
+capture location_t values for the bidirectional control characters.
+
+Before:
+
+  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin adm=
ins only */
+        |                                                                 =
          ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control char=
acter detected [-Wbidi-chars=3D]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                                            ^
+
+After:
+
+  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control char=
acters detected [-Wbidi-chars=3D]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin adm=
ins only */
+        |       ~~~~~~~~                                ~~~~~~~~          =
          ^
+        |       |                                       |                 =
          |
+        |       |                                       |                 =
          end of bidirectional context
+        |       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RI=
GHT ISOLATE)
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control char=
acters detected [-Wbidi-chars=3D]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                        ~~~~~~~~   ~~~~~~~~ ^
+        |                        |          |        |
+        |                        |          |        end of bidirectional =
context
+        |                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
+        |                        U+202E (RIGHT-TO-LEFT OVERRIDE)
+
+Signed-off-by: David Malcolm <dmalcolm@redhat.com>
+
+gcc/testsuite/ChangeLog:
+	PR preprocessor/103026
+	* c-c++-common/Wbidi-chars-ranges.c: New test.
+
+libcpp/ChangeLog:
+	PR preprocessor/103026
+	* lex.c (struct bidi::context): New.
+	(bidi::vec): Convert to a vec of context rather than unsigned
+	char.
+	(bidi::ctx_at): Rename to...
+	(bidi::pop_kind_at): ...this and reimplement for above change.
+	(bidi::current_ctx): Update for change to vec.
+	(bidi::current_ctx_ucn_p): Likewise.
+	(bidi::current_ctx_loc): New.
+	(bidi::on_char): Update for usage of context struct.  Add "loc"
+	param and pass it when pushing contexts.
+	(get_location_for_byte_range_in_cur_line): New.
+	(get_bidi_utf8): Rename to...
+	(get_bidi_utf8_1): ...this, reintroducing...
+	(get_bidi_utf8): ...as a wrapper, setting *OUT when the result is
+	not NONE.
+	(get_bidi_ucn): Rename to...
+	(get_bidi_ucn_1): ...this, reintroducing...
+	(get_bidi_ucn): ...as a wrapper, setting *OUT when the result is
+	not NONE.
+	(class unpaired_bidi_rich_location): New.
+	(maybe_warn_bidi_on_close): Use unpaired_bidi_rich_location when
+	reporting on unpaired bidi chars.  Split into singular vs plural
+	spellings.
+	(maybe_warn_bidi_on_char): Pass in a location_t rather than a
+	const uchar * and use it when emitting warnings, and when calling
+	bidi::on_char.
+	(_cpp_skip_block_comment): Capture location when kind is not NONE
+	and pass it to maybe_warn_bidi_on_char.
+	(skip_line_comment): Likewise.
+	(forms_identifier_p): Likewise.
+	(lex_raw_string): Likewise.
+	(lex_string): Likewise.
+
+Signed-off-by: David Malcolm <dmalcolm@redhat.com>
+
+CVE: CVE-2021-42574
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;=
h=3Dbef32d4a28595e933f24fef378cf052a30b674a7]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ .../c-c++-common/Wbidi-chars-ranges.c         |  54 ++++
+ libcpp/lex.c                                  | 251 ++++++++++++++----
+ 2 files changed, 257 insertions(+), 48 deletions(-)
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
+
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/testsui=
te/c-c++-common/Wbidi-chars-ranges.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c	1969-12-31 16:00:00.=
000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c	2021-12-25 01:39:55.=
116281847 -0800
+@@ -0,0 +1,54 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=3Dunpaired -fdiagnostics-show-caret" } */
++/* Verify that we escape and underline pertinent bidirectional
++   control characters when quoting the source.  */
++
++int test_unpaired_bidi () {
++    int isAdmin =3D 0;
++    /*=E2=80=AE } =E2=81=A6if (isAdmin)=E2=81=A9 =E2=81=A6 begin admins o=
nly */
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only=
 */
++       ~~~~~~~~                                ~~~~~~~~                  =
  ^
++       |                                       |                         =
  |
++       |                                       |                         =
  end of bidirectional context
++       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT ISOL=
ATE)
++   { dg-end-multiline-output "" }
++#endif
++
++        __builtin_printf("You are an admin.\n");
++    /* end admins only =E2=80=AE { =E2=81=A6*/
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++     /* end admins only <U+202E> { <U+2066>*/
++                        ~~~~~~~~   ~~~~~~~~ ^
++                        |          |        |
++                        |          |        end of bidirectional context
++                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
++                        U+202E (RIGHT-TO-LEFT OVERRIDE)
++   { dg-end-multiline-output "" }
++#endif
++
++    return 0;
++}
++
++int LRE_=E2=80=AA_PDF_\u202c;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++ int LRE_<U+202A>_PDF_\u202c;
++         ~~~~~~~~     ^~~~~~
++   { dg-end-multiline-output "" }
++#endif
++
++const char *s1 =3D "LRE_=E2=80=AA_PDF_\u202c";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++ const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
++                       ~~~~~~~~     ^~~~~~
++   { dg-end-multiline-output "" }
++#endif
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-12-25 01:41:16.522868808 -0800
++++ b/libcpp/lex.c	2021-12-25 06:28:58.530680302 -0800
+@@ -1172,11 +1172,34 @@ namespace bidi {
+   /* All the UTF-8 encodings of bidi characters start with E2.  */
+   constexpr uchar utf8_start =3D 0xe2;
+=20
++  struct context
++  {
++    context () {}
++    context (location_t loc, kind k, bool pdf, bool ucn)
++    : m_loc (loc), m_kind (k), m_pdf (pdf), m_ucn (ucn)
++    {
++    }
++
++    kind get_pop_kind () const
++    {
++      return m_pdf ? kind::PDF : kind::PDI;
++    }
++    bool ucn_p () const
++    {
++      return m_ucn;
++    }
++
++    location_t m_loc;
++    kind m_kind;
++    unsigned m_pdf : 1;
++    unsigned m_ucn : 1;
++  };
++
+   /* A vector holding currently open bidi contexts.  We use a char for
+      each context, its LSB is 1 if it represents a PDF context, 0 if it
+      represents a PDI context.  The next bit is 1 if this context was open
+      by a bidi character written as a UCN, and 0 when it was UTF-8.  */
+-  semi_embedded_vec <unsigned char, 16> vec;
++  semi_embedded_vec <context, 16> vec;
+=20
+   /* Close the whole comment/identifier/string literal/character constant
+      context.  */
+@@ -1193,19 +1216,19 @@ namespace bidi {
+     vec.truncate (len - 1);
+   }
+=20
+-  /* Return the context of the Ith element.  */
+-  kind ctx_at (unsigned int i)
++  /* Return the pop kind of the context of the Ith element.  */
++  kind pop_kind_at (unsigned int i)
+   {
+-    return (vec[i] & 1) ? kind::PDF : kind::PDI;
++    return vec[i].get_pop_kind ();
+   }
+=20
+-  /* Return which context is currently opened.  */
++  /* Return the pop kind of the context that is currently opened.  */
+   kind current_ctx ()
+   {
+     unsigned int len =3D vec.count ();
+     if (len =3D=3D 0)
+       return kind::NONE;
+-    return ctx_at (len - 1);
++    return vec[len - 1].get_pop_kind ();
+   }
+=20
+   /* Return true if the current context comes from a UCN origin, that is,
+@@ -1214,11 +1237,19 @@ namespace bidi {
+   {
+     unsigned int len =3D vec.count ();
+     gcc_checking_assert (len > 0);
+-    return (vec[len - 1] >> 1) & 1;
++    return vec[len - 1].m_ucn;
+   }
+=20
+-  /* We've read a bidi char, update the current vector as necessary.  */
+-  void on_char (kind k, bool ucn_p)
++  location_t current_ctx_loc ()
++  {
++    unsigned int len =3D vec.count ();
++    gcc_checking_assert (len > 0);
++    return vec[len - 1].m_loc;
++  }
++
++  /* We've read a bidi char, update the current vector as necessary.
++     LOC is only valid when K is not kind::NONE.  */
++  void on_char (kind k, bool ucn_p, location_t loc)
+   {
+     switch (k)
+       {
+@@ -1226,12 +1257,12 @@ namespace bidi {
+       case kind::RLE:
+       case kind::LRO:
+       case kind::RLO:
+-	vec.push (ucn_p ? 3u : 1u);
++	vec.push (context (loc, k, true, ucn_p));
+ 	break;
+       case kind::LRI:
+       case kind::RLI:
+       case kind::FSI:
+-	vec.push (ucn_p ? 2u : 0u);
++	vec.push (context (loc, k, false, ucn_p));
+ 	break;
+       /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
+ 	 whose scope has not yet been terminated.  */
+@@ -1245,7 +1276,7 @@ namespace bidi {
+ 	 yet been terminated.  */
+       case kind::PDI:
+ 	for (int i =3D vec.count () - 1; i >=3D 0; --i)
+-	  if (ctx_at (i) =3D=3D kind::PDI)
++	  if (pop_kind_at (i) =3D=3D kind::PDI)
+ 	    {
+ 	      vec.truncate (i);
+ 	      break;
+@@ -1295,10 +1326,47 @@ namespace bidi {
+   }
+ }
+=20
++/* Get location_t for the range of bytes [START, START + NUM_BYTES)
++   within the current line in FILE, with the caret at START.  */
++
++static location_t
++get_location_for_byte_range_in_cur_line (cpp_reader *pfile,
++					 const unsigned char *const start,
++					 size_t num_bytes)
++{
++  gcc_checking_assert (num_bytes > 0);
++
++  /* CPP_BUF_COLUMN and linemap_position_for_column both refer
++     to offsets in bytes, but CPP_BUF_COLUMN is 0-based,
++     whereas linemap_position_for_column is 1-based.  */
++
++  /* Get 0-based offsets within the line.  */
++  size_t start_offset =3D CPP_BUF_COLUMN (pfile->buffer, start);
++  size_t end_offset =3D start_offset + num_bytes - 1;
++
++  /* Now convert to location_t, where "columns" are 1-based byte offsets.=
  */
++  location_t start_loc =3D linemap_position_for_column (pfile->line_table,
++						      start_offset + 1);
++  location_t end_loc =3D linemap_position_for_column (pfile->line_table,
++						     end_offset + 1);
++
++  if (start_loc =3D=3D end_loc)
++    return start_loc;
++
++  source_range src_range;
++  src_range.m_start =3D start_loc;
++  src_range.m_finish =3D end_loc;
++  location_t combined_loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
++						   start_loc,
++						   src_range,
++						   NULL);
++  return combined_loc;
++}
++
+ /* Parse a sequence of 3 bytes starting with P and return its bidi code. =
 */
+=20
+ static bidi::kind
+-get_bidi_utf8 (const unsigned char *const p)
++get_bidi_utf8_1 (const unsigned char *const p)
+ {
+   gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
+=20
+@@ -1340,10 +1408,25 @@ get_bidi_utf8 (const unsigned char *cons
+   return bidi::kind::NONE;
+ }
+=20
++/* Parse a sequence of 3 bytes starting with P and return its bidi code.
++   If the kind is not NONE, write the location to *OUT.*/
++
++static bidi::kind
++get_bidi_utf8 (cpp_reader *pfile, const unsigned char *const p, location_=
t *out)
++{
++  bidi::kind result =3D get_bidi_utf8_1 (p);
++  if (result !=3D bidi::kind::NONE)
++    {
++      /* We have a sequence of 3 bytes starting at P.  */
++      *out =3D get_location_for_byte_range_in_cur_line (pfile, p, 3);
++    }
++  return result;
++}
++
+ /* Parse a UCN where P points just past \u or \U and return its bidi code=
.  */
+=20
+ static bidi::kind
+-get_bidi_ucn (const unsigned char *p, bool is_U)
++get_bidi_ucn_1 (const unsigned char *p, bool is_U)
+ {
+   /* 6.4.3 Universal Character Names
+       \u hex-quad
+@@ -1412,6 +1495,62 @@ get_bidi_ucn (const unsigned char *p, bo
+   return bidi::kind::NONE;
+ }
+=20
++/* Parse a UCN where P points just past \u or \U and return its bidi code.
++   If the kind is not NONE, write the location to *OUT.*/
++
++static bidi::kind
++get_bidi_ucn (cpp_reader *pfile,  const unsigned char *p, bool is_U,
++	      location_t *out)
++{
++  bidi::kind result =3D get_bidi_ucn_1 (p, is_U);
++  if (result !=3D bidi::kind::NONE)
++    {
++      const unsigned char *start =3D p - 2;
++      size_t num_bytes =3D 2 + (is_U ? 8 : 4);
++      *out =3D get_location_for_byte_range_in_cur_line (pfile, start, num=
_bytes);
++    }
++  return result;
++}
++
++/* Subclass of rich_location for reporting on unpaired UTF-8
++   bidirectional control character(s).
++   Escape the source lines on output, and show all unclosed
++   bidi context, labelling everything.  */
++
++class unpaired_bidi_rich_location : public rich_location
++{
++ public:
++  class custom_range_label : public range_label
++  {
++   public:
++     label_text get_text (unsigned range_idx) const FINAL OVERRIDE
++     {
++       /* range 0 is the primary location; each subsequent range i + 1
++	  is for bidi::vec[i].  */
++       if (range_idx > 0)
++	 {
++	   const bidi::context &ctxt (bidi::vec[range_idx - 1]);
++	   return label_text::borrow (bidi::to_str (ctxt.m_kind));
++	 }
++       else
++	 return label_text::borrow (_("end of bidirectional context"));
++     }
++  };
++
++  unpaired_bidi_rich_location (cpp_reader *pfile, location_t loc)
++  : rich_location (pfile->line_table, loc, &m_custom_label)
++  {
++    set_escape_on_output (true);
++    for (unsigned i =3D 0; i < bidi::vec.count (); i++)
++      add_range (bidi::vec[i].m_loc,
++		 SHOW_RANGE_WITHOUT_CARET,
++		 &m_custom_label);
++  }
++
++ private:
++   custom_range_label m_custom_label;
++};
++
+ /* We're closing a bidi context, that is, we've encountered a newline,
+    are closing a C-style comment, or are at the end of a string literal,
+    character constant, or identifier.  Warn if this context was not
+@@ -1427,11 +1566,17 @@ maybe_warn_bidi_on_close (cpp_reader *pf
+       const location_t loc
+ 	=3D linemap_position_for_column (pfile->line_table,
+ 				       CPP_BUF_COLUMN (pfile->buffer, p));
+-      rich_location rich_loc (pfile->line_table, loc);
+-      rich_loc.set_escape_on_output (true);
+-      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
+-		      "unpaired UTF-8 bidirectional control character "
+-		      "detected");
++      unpaired_bidi_rich_location rich_loc (pfile, loc);
++      /* cpp_callbacks doesn't yet have a way to handle singular vs plural
++	 forms of a diagnostic, so fake it for now.  */
++      if (bidi::vec.count () > 1)
++	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			"unpaired UTF-8 bidirectional control characters "
++			"detected");
++      else
++	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			"unpaired UTF-8 bidirectional control character "
++			"detected");
+     }
+   /* We're done with this context.  */
+   bidi::on_close ();
+@@ -1439,12 +1584,13 @@ maybe_warn_bidi_on_close (cpp_reader *pf
+=20
+ /* We're at the beginning or in the middle of an identifier/comment/string
+    literal/character constant.  Warn if we've encountered a bidi characte=
r.
+-   KIND says which bidi character it was; P points to it in the character
+-   stream.  UCN_P is true iff this bidi character was written as a UCN.  =
*/
++   KIND says which bidi control character it was; UCN_P is true iff this =
bidi
++   control character was written as a UCN.  LOC is the location of the
++   character, but is only valid if KIND !=3D bidi::kind::NONE.  */
+=20
+ static void
+-maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind ki=
nd,
+-			 bool ucn_p)
++maybe_warn_bidi_on_char (cpp_reader *pfile, bidi::kind kind,
++			 bool ucn_p, location_t loc)
+ {
+   if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
+     return;
+@@ -1453,9 +1599,6 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+=20
+   if (warn_bidi !=3D bidirectional_none)
+     {
+-      const location_t loc
+-	=3D linemap_position_for_column (pfile->line_table,
+-				       CPP_BUF_COLUMN (pfile->buffer, p));
+       rich_location rich_loc (pfile->line_table, loc);
+       rich_loc.set_escape_on_output (true);
+=20
+@@ -1467,9 +1610,12 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 	{
+ 	  if (warn_bidi =3D=3D bidirectional_unpaired
+ 	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
+-	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
+-			    "UTF-8 vs UCN mismatch when closing "
+-			    "a context by \"%s\"", bidi::to_str (kind));
++	    {
++	      rich_loc.add_range (bidi::current_ctx_loc ());
++	      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			      "UTF-8 vs UCN mismatch when closing "
++			      "a context by \"%s\"", bidi::to_str (kind));
++	    }
+ 	}
+       else if (warn_bidi =3D=3D bidirectional_any)
+ 	{
+@@ -1484,7 +1630,7 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 	}
+     }
+   /* We're done with this context.  */
+-  bidi::on_char (kind, ucn_p);
++  bidi::on_char (kind, ucn_p, loc);
+ }
+=20
+ /* Skip a C-style block comment.  We find the end of the comment by
+@@ -1552,8 +1698,9 @@ _cpp_skip_block_comment (cpp_reader *pfi
+ 	 a bidirectional control character.  */
+       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_bi=
di_p)
+ 	{
+-	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
+-	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
++	  location_t loc;
++	  bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
+ 	}
+     }
+=20
+@@ -1586,9 +1733,9 @@ skip_line_comment (cpp_reader *pfile)
+ 	    {
+ 	      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
+ 		{
+-		  bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
+-		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-					   /*ucn_p=3D*/false);
++		  location_t loc;
++		  bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, &loc);
++		  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
+ 		}
+ 	      buffer->cur++;
+ 	    }
+@@ -1734,9 +1881,9 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	  if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
+ 	      && warn_bidi_p)
+ 	    {
+-	      bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
+-	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-				       /*ucn_p=3D*/false);
++	      location_t loc;
++	      bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
+ 	    }
+ 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			       state, &s))
+@@ -1748,10 +1895,12 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	  buffer->cur +=3D 2;
+ 	  if (warn_bidi_p)
+ 	    {
+-	      bidi::kind kind =3D get_bidi_ucn (buffer->cur,
+-					      buffer->cur[-1] =3D=3D 'U');
+-	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-				       /*ucn_p=3D*/true);
++	      location_t loc;
++	      bidi::kind kind =3D get_bidi_ucn (pfile,
++					      buffer->cur,
++					      buffer->cur[-1] =3D=3D 'U',
++					      &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc);
+ 	    }
+ 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			      state, &s, NULL, NULL))
+@@ -2327,12 +2476,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
+ 	}
+       else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_star=
t, 0)
+ 	       && warn_bidi_p)
+-	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
+-				 /*ucn_p=3D*/false);
++	{
++	  location_t loc;
++	  bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
++	}
+     }
+=20
+   if (warn_bidi_p)
+-    maybe_warn_bidi_on_close (pfile, pos);
++    maybe_warn_bidi_on_close (pfile, cur);
+=20
+   if (CPP_OPTION (pfile, user_literals))
+     {
+@@ -2438,8 +2590,10 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	{
+ 	  if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
+ 	    {
+-	      bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U');
+-	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true);
++	      location_t loc;
++	      bidi::kind kind =3D get_bidi_ucn (pfile, cur + 1, cur[0] =3D=3D 'U=
',
++					      &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc);
+ 	    }
+ 	  cur++;
+ 	}
+@@ -2467,8 +2621,9 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	saw_NUL =3D true;
+       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_bi=
di_p)
+ 	{
+-	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
+-	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/false);
++	  location_t loc;
++	  bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
+ 	}
+     }
+=20
--=20
2.31.1


