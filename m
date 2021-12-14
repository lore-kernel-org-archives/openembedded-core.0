Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Pgowda" <pgowda.cve@gmail.com>
Subject: [PATCH] gcc: Fix CVE-2021-42574
Date: Tue, 14 Dec 2021 02:46:13 -0800
Message-Id: <20211214104613.19264-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |    4 +
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2282 +++++++++++++++++
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 1765 +++++++++++++
 .../gcc/gcc/0003-CVE-2021-42574.patch         |  142 +
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  573 +++++
 5 files changed, 4766 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index c1293229b6..e352c958de 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -63,6 +63,10 @@ SRC_URI = "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0001-CVE-2021-42574.patch \
+           file://0002-CVE-2021-42574.patch \
+           file://0003-CVE-2021-42574.patch \
+           file://0004-CVE-2021-42574.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
new file mode 100644
index 0000000000..4d680ccc8f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
@@ -0,0 +1,2282 @@
+From bd5e882cf6e0def3dd1bc106075d59a303fe0d1e Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Mon, 18 Oct 2021 18:55:31 -0400
+Subject: [PATCH] diagnostics: escape non-ASCII source bytes for certain
+ diagnostics
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
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
+- for -Wnormalized= (and generate source ranges for such warnings)
+
+The escaping is controlled by a new option:
+  -fdiagnostics-escape-format=[unicode|bytes]
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
+ beforeÏXafter
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
+with -fdiagnostics-escape-format=unicode (the default), or as:
+
+  before<CF><80><BF>after
+        ^~~~~~~~
+
+if the user supplies -fdiagnostics-escape-format=bytes.
+
+This only affects how the source is printed; it does not affect
+how column numbers that are printed (as per -fdiagnostics-column-unit=
+and -fdiagnostics-column-origin=).
+
+gcc/c-family/ChangeLog:
+	* c-lex.c (c_lex_with_flags): When complaining about non-printable
+	CPP_OTHER tokens, set the "escape on output" flag.
+
+gcc/ChangeLog:
+	* common.opt (fdiagnostics-escape-format=): New.
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
+	* doc/invoke.texi (-fdiagnostics-escape-format=): New option.
+	(-fdiagnostics-format=): Add "escape-source" attribute to examples
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
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
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
+--- a/gcc/c-family/c-lex.c	2021-07-27 23:55:06.980283060 -0700
++++ b/gcc/c-family/c-lex.c	2021-12-14 01:16:01.541943272 -0800
+@@ -603,7 +603,11 @@ c_lex_with_flags (tree *value, location_
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
+ 
+diff --git a/gcc/common.opt b/gcc/common.opt
+--- a/gcc/common.opt	2021-12-13 22:08:44.939137107 -0800
++++ b/gcc/common.opt	2021-12-14 01:16:01.541943272 -0800
+@@ -1348,6 +1348,10 @@ fdiagnostics-format=
+ Common Joined RejectNegative Enum(diagnostics_output_format)
+ -fdiagnostics-format=[text|json]	Select output format.
+ 
++fdiagnostics-escape-format=
++Common Joined RejectNegative Enum(diagnostics_escape_format)
++-fdiagnostics-escape-format=[unicode|bytes]	Select how to escape non-printable-ASCII bytes in the source for diagnostics that suggest it.
++
+ ; Required for these enum values.
+ SourceInclude
+ diagnostic.h
+@@ -1362,6 +1366,15 @@ EnumValue
+ Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNIT_BYTE)
+ 
+ Enum
++Name(diagnostics_escape_format) Type(int)
++
++EnumValue
++Enum(diagnostics_escape_format) String(unicode) Value(DIAGNOSTICS_ESCAPE_FORMAT_UNICODE)
++
++EnumValue
++Enum(diagnostics_escape_format) String(bytes) Value(DIAGNOSTICS_ESCAPE_FORMAT_BYTES)
++
++Enum
+ Name(diagnostics_output_format) Type(int)
+ 
+ EnumValue
+diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
+--- a/gcc/diagnostic.c	2021-07-27 23:55:07.232286576 -0700
++++ b/gcc/diagnostic.c	2021-12-14 01:16:01.545943202 -0800
+@@ -230,6 +230,7 @@ diagnostic_initialize (diagnostic_contex
+   context->column_unit = DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
+   context->column_origin = 1;
+   context->tabstop = 8;
++  context->escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
+   context->edit_context_ptr = NULL;
+   context->diagnostic_group_nesting_depth = 0;
+   context->diagnostic_group_emission_count = 0;
+@@ -382,7 +383,10 @@ convert_column_unit (enum diagnostics_co
+       gcc_unreachable ();
+ 
+     case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
+-      return location_compute_display_column (s, tabstop);
++      {
++	cpp_char_column_policy policy (tabstop, cpp_wcwidth);
++	return location_compute_display_column (s, policy);
++      }
+ 
+     case DIAGNOSTICS_COLUMN_UNIT_BYTE:
+       return s.column;
+@@ -2275,8 +2279,8 @@ test_diagnostic_get_location_text ()
+     const char *const content = "smile \xf0\x9f\x98\x82\n";
+     const int line_bytes = strlen (content) - 1;
+     const int def_tabstop = 8;
+-    const int display_width = cpp_display_width (content, line_bytes,
+-						 def_tabstop);
++    const cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
++    const int display_width = cpp_display_width (content, line_bytes, policy);
+     ASSERT_EQ (line_bytes - 2, display_width);
+     temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
+     const char *const fname = tmp.get_filename ();
+diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.cc
+--- a/gcc/diagnostic-format-json.cc	2021-07-27 23:55:07.232286576 -0700
++++ b/gcc/diagnostic-format-json.cc	2021-12-14 01:16:01.541943272 -0800
+@@ -264,6 +264,9 @@ json_end_diagnostic (diagnostic_context
+       json::value *path_value = context->make_json_for_path (context, path);
+       diag_obj->set ("path", path_value);
+     }
++
++  diag_obj->set ("escape-source",
++		 new json::literal (richloc->escape_on_output_p ()));
+ }
+ 
+ /* No-op implementation of "begin_group_cb" for JSON output.  */
+diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
+--- a/gcc/diagnostic.h	2021-07-27 23:55:07.236286632 -0700
++++ b/gcc/diagnostic.h	2021-12-14 01:16:01.545943202 -0800
+@@ -38,6 +38,20 @@ enum diagnostics_column_unit
+   DIAGNOSTICS_COLUMN_UNIT_BYTE
+ };
+ 
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
+ 
+ enum diagnostics_output_format
+@@ -320,6 +334,10 @@ struct diagnostic_context
+   /* The size of the tabstop for tab expansion.  */
+   int tabstop;
+ 
++  /* How should non-ASCII/non-printable bytes be escaped when
++     a diagnostic suggests escaping the source code on output.  */
++  enum diagnostics_escape_format escape_format;
++
+   /* If non-NULL, an edit_context to which fix-it hints should be
+      applied, for generating patches.  */
+   edit_context *edit_context_ptr;
+diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
+--- a/gcc/diagnostic-show-locus.c	2021-07-27 23:55:07.232286576 -0700
++++ b/gcc/diagnostic-show-locus.c	2021-12-14 01:16:01.545943202 -0800
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
++	if (aspect != LOCATION_ASPECT_FINISH)
++	  {
++	    expanded_location prev_exploc (exploc);
++	    prev_exploc.column--;
++	    int prev_display_col
++	      = (location_compute_display_column (prev_exploc, policy));
++	    m_display_col = prev_display_col + 1;
++	  }
++      }
++  }
+ 
+   int m_display_col;
+ };
+@@ -313,6 +329,31 @@ test_line_span ()
+ 
+ #endif /* #if CHECKING_P */
+ 
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
+ 
+    The layout is determined within the constructor.
+@@ -345,6 +386,8 @@ class layout
+ 
+   void print_line (linenum_type row);
+ 
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
+ 
+ /* Implementation of "class colorizer".  */
+@@ -646,6 +691,11 @@ layout_range::intersects_line_p (linenum
+ /* Default for when we don't care what the tab expansion is set to.  */
+ static const int def_tabstop = 8;
+ 
++static cpp_char_column_policy def_policy ()
++{
++  return cpp_char_column_policy (8, cpp_wcwidth);
++}
++
+ /* Create some expanded locations for testing layout_range.  The filename
+    member of the explocs is set to the empty string.  This member will only be
+    inspected by the calls to location_compute_display_column() made from the
+@@ -662,10 +712,13 @@ make_range (int start_line, int start_co
+     = {"", start_line, start_col, NULL, false};
+   const expanded_location finish_exploc
+     = {"", end_line, end_col, NULL, false};
+-  return layout_range (exploc_with_display_col (start_exploc, def_tabstop),
+-		       exploc_with_display_col (finish_exploc, def_tabstop),
++  return layout_range (exploc_with_display_col (start_exploc, def_policy (),
++						LOCATION_ASPECT_START),
++		       exploc_with_display_col (finish_exploc, def_policy (),
++						LOCATION_ASPECT_FINISH),
+ 		       SHOW_RANGE_WITHOUT_CARET,
+-		       exploc_with_display_col (start_exploc, def_tabstop),
++		       exploc_with_display_col (start_exploc, def_policy (),
++						LOCATION_ASPECT_CARET),
+ 		       0, NULL);
+ }
+ 
+@@ -959,6 +1012,164 @@ fixit_cmp (const void *p_a, const void *
+   return hint_a->get_start_loc () - hint_b->get_start_loc ();
+ }
+ 
++/* Callbacks for use when not escaping the source.  */
++
++/* The default callback for char_column_policy::m_width_cb is cpp_wcwidth.  */
++
++/* Callback for char_display_policy::m_print_cb for printing source chars
++   when not escaping the source.  */
++
++static void
++default_print_decoded_ch (pretty_printer *pp,
++			  const cpp_decoded_char &decoded_ch)
++{
++  for (const char *ptr = decoded_ch.m_start_byte;
++       ptr != decoded_ch.m_next_byte; ptr++)
++    {
++      if (*ptr == '\0' || *ptr == '\r')
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
++static const int width_per_escaped_byte = 4;
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
++      if (ch <=   0x7F) return 1 * width_per_escaped_byte;
++      if (ch <=  0x7FF) return 2 * width_per_escaped_byte;
++      if (ch <= 0xFFFF) return 3 * width_per_escaped_byte;
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
++      for (const char *iter = decoded_ch.m_start_byte;
++	   iter != decoded_ch.m_next_byte; ++iter)
++	{
++	  char buf[16];
++	  sprintf (buf, "<%02x>", (unsigned char)*iter);
++	  pp_string (pp, buf);
++	}
++      return;
++    }
++
++  cppchar_t ch = decoded_ch.m_ch;
++  if (ch < 0x80 && ISPRINT (ch))
++    pp_character (pp, ch);
++  else
++    {
++      for (const char *iter = decoded_ch.m_start_byte;
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
++  cppchar_t ch = decoded_ch.m_ch;
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
++      result.m_undecoded_byte_width = width_per_escaped_byte;
++      switch (dc.escape_format)
++	{
++	default:
++	  gcc_unreachable ();
++	case DIAGNOSTICS_ESCAPE_FORMAT_UNICODE:
++	  result.m_width_cb = escape_as_unicode_width;
++	  result.m_print_cb = escape_as_unicode_print;
++	  break;
++	case DIAGNOSTICS_ESCAPE_FORMAT_BYTES:
++	  result.m_width_cb = escape_as_bytes_width;
++	  result.m_print_cb = escape_as_bytes_print;
++	  break;
++	}
++    }
++
++  return result;
++}
++
+ /* Implementation of class layout.  */
+ 
+ /* Constructor for class layout.
+@@ -975,8 +1186,10 @@ layout::layout (diagnostic_context * con
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
+@@ -986,7 +1199,8 @@ layout::layout (diagnostic_context * con
+   m_fixit_hints (richloc->get_num_fixit_hints ()),
+   m_line_spans (1 + richloc->get_num_locations ()),
+   m_linenum_width (0),
+-  m_x_offset_display (0)
++  m_x_offset_display (0),
++  m_escape_on_output (richloc->escape_on_output_p ())
+ {
+   for (unsigned int idx = 0; idx < richloc->get_num_locations (); idx++)
+     {
+@@ -1072,10 +1286,13 @@ layout::maybe_add_location_range (const
+ 
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
+ 
+   /* If we have a range that finishes before it starts (perhaps
+@@ -1409,7 +1626,7 @@ layout::calculate_x_offset_display ()
+     = get_line_bytes_without_trailing_whitespace (line.get_buffer (),
+ 						  line.length ());
+   int eol_display_column
+-    = cpp_display_width (line.get_buffer (), line_bytes, m_context->tabstop);
++    = cpp_display_width (line.get_buffer (), line_bytes, m_policy);
+   if (caret_display_column > eol_display_column
+       || !caret_display_column)
+     {
+@@ -1488,7 +1705,7 @@ layout::print_source_line (linenum_type
+   /* This object helps to keep track of which display column we are at, which is
+      necessary for computing the line bounds in display units, for doing
+      tab expansion, and for implementing m_x_offset_display.  */
+-  cpp_display_width_computation dw (line, line_bytes, m_context->tabstop);
++  cpp_display_width_computation dw (line, line_bytes, m_policy);
+ 
+   /* Skip the first m_x_offset_display display columns.  In case the leading
+      portion that will be skipped ends with a character with wcwidth > 1, then
+@@ -1536,7 +1753,8 @@ layout::print_source_line (linenum_type
+ 	 tabs and replacing some control bytes with spaces as necessary.  */
+       const char *c = dw.next_byte ();
+       const int start_disp_col = dw.display_cols_processed () + 1;
+-      const int this_display_width = dw.process_next_codepoint ();
++      cpp_decoded_char cp;
++      const int this_display_width = dw.process_next_codepoint (&cp);
+       if (*c == '\t')
+ 	{
+ 	  /* The returned display width is the number of spaces into which the
+@@ -1545,15 +1763,6 @@ layout::print_source_line (linenum_type
+ 	    pp_space (m_pp);
+ 	  continue;
+ 	}
+-      if (*c == '\0' || *c == '\r')
+-	{
+-	  /* cpp_wcwidth() promises to return 1 for all control bytes, and we
+-	     want to output these as a single space too, so this case is
+-	     actually the same as the '\t' case.  */
+-	  gcc_assert (this_display_width == 1);
+-	  pp_space (m_pp);
+-	  continue;
+-	}
+ 
+       /* We have a (possibly multibyte) character to output; update the line
+ 	 bounds if it is not whitespace.  */
+@@ -1565,7 +1774,8 @@ layout::print_source_line (linenum_type
+ 	}
+ 
+       /* Output the character.  */
+-      while (c != dw.next_byte ()) pp_character (m_pp, *c++);
++      m_policy.m_print_cb (m_pp, cp);
++      c = dw.next_byte ();
+     }
+   print_newline ();
+   return lbounds;
+@@ -1664,14 +1874,14 @@ layout::print_annotation_line (linenum_t
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
+     const int bytes = strlen (text.m_buffer);
+-    m_display_width
+-      = cpp_display_width (text.m_buffer, bytes, context->tabstop);
++    m_display_width = cpp_display_width (text.m_buffer, bytes, policy);
+   }
+ 
+   /* Sorting is primarily by column, then by state index.  */
+@@ -1731,7 +1941,7 @@ layout::print_any_labels (linenum_type r
+ 	if (text.m_buffer == NULL)
+ 	  continue;
+ 
+-	labels.safe_push (line_label (m_context, i, disp_col, text));
++	labels.safe_push (line_label (m_policy, i, disp_col, text));
+       }
+   }
+ 
+@@ -2011,7 +2221,7 @@ public:
+ 
+ /* Get the range of bytes or display columns that HINT would affect.  */
+ static column_range
+-get_affected_range (diagnostic_context *context,
++get_affected_range (const cpp_char_column_policy &policy,
+ 		    const fixit_hint *hint, enum column_unit col_unit)
+ {
+   expanded_location exploc_start = expand_location (hint->get_start_loc ());
+@@ -2022,13 +2232,11 @@ get_affected_range (diagnostic_context *
+   int finish_column;
+   if (col_unit == CU_DISPLAY_COLS)
+     {
+-      start_column
+-	= location_compute_display_column (exploc_start, context->tabstop);
++      start_column = location_compute_display_column (exploc_start, policy);
+       if (hint->insertion_p ())
+ 	finish_column = start_column - 1;
+       else
+-	finish_column
+-	  = location_compute_display_column (exploc_finish, context->tabstop);
++	finish_column = location_compute_display_column (exploc_finish, policy);
+     }
+   else
+     {
+@@ -2041,12 +2249,13 @@ get_affected_range (diagnostic_context *
+ /* Get the range of display columns that would be printed for HINT.  */
+ 
+ static column_range
+-get_printed_columns (diagnostic_context *context, const fixit_hint *hint)
++get_printed_columns (const cpp_char_column_policy &policy,
++		     const fixit_hint *hint)
+ {
+   expanded_location exploc = expand_location (hint->get_start_loc ());
+-  int start_column = location_compute_display_column (exploc, context->tabstop);
++  int start_column = location_compute_display_column (exploc, policy);
+   int hint_width = cpp_display_width (hint->get_string (), hint->get_length (),
+-				      context->tabstop);
++				      policy);
+   int final_hint_column = start_column + hint_width - 1;
+   if (hint->insertion_p ())
+     {
+@@ -2056,8 +2265,7 @@ get_printed_columns (diagnostic_context
+     {
+       exploc = expand_location (hint->get_next_loc ());
+       --exploc.column;
+-      int finish_column
+-	= location_compute_display_column (exploc, context->tabstop);
++      int finish_column = location_compute_display_column (exploc, policy);
+       return column_range (start_column,
+ 			   MAX (finish_column, final_hint_column));
+     }
+@@ -2075,13 +2283,13 @@ public:
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
+@@ -2099,7 +2307,7 @@ public:
+ 
+   void compute_display_cols ()
+   {
+-    m_display_cols = cpp_display_width (m_text, m_byte_length, m_tabstop);
++    m_display_cols = cpp_display_width (m_text, m_byte_length, m_policy);
+   }
+ 
+   void overwrite (int dst_offset, const char_span &src_span)
+@@ -2127,7 +2335,7 @@ public:
+   char *m_text;
+   size_t m_byte_length; /* Not including null-terminator.  */
+   int m_display_cols;
+-  int m_tabstop;
++  const cpp_char_column_policy &m_policy;
+   size_t m_alloc_sz;
+ };
+ 
+@@ -2163,15 +2371,16 @@ correction::ensure_terminated ()
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
+ 
+   void add_hint (const fixit_hint *hint);
+ 
+-  diagnostic_context *m_context;
++  const char_display_policy &m_policy;
+   const char *m_filename;
+   linenum_type m_row;
+   auto_vec <correction *> m_corrections;
+@@ -2217,10 +2426,10 @@ source_line::source_line (const char *fi
+ void
+ line_corrections::add_hint (const fixit_hint *hint)
+ {
+-  column_range affected_bytes = get_affected_range (m_context, hint, CU_BYTES);
+-  column_range affected_columns = get_affected_range (m_context, hint,
++  column_range affected_bytes = get_affected_range (m_policy, hint, CU_BYTES);
++  column_range affected_columns = get_affected_range (m_policy, hint,
+ 						      CU_DISPLAY_COLS);
+-  column_range printed_columns = get_printed_columns (m_context, hint);
++  column_range printed_columns = get_printed_columns (m_policy, hint);
+ 
+   /* Potentially consolidate.  */
+   if (!m_corrections.is_empty ())
+@@ -2289,7 +2498,7 @@ line_corrections::add_hint (const fixit_
+ 					   printed_columns,
+ 					   hint->get_string (),
+ 					   hint->get_length (),
+-					   m_context->tabstop));
++					   m_policy));
+ }
+ 
+ /* If there are any fixit hints on source line ROW, print them.
+@@ -2303,7 +2512,7 @@ layout::print_trailing_fixits (linenum_t
+ {
+   /* Build a list of correction instances for the line,
+      potentially consolidating hints (for the sake of readability).  */
+-  line_corrections corrections (m_context, m_exploc.file, row);
++  line_corrections corrections (m_policy, m_exploc.file, row);
+   for (unsigned int i = 0; i < m_fixit_hints.length (); i++)
+     {
+       const fixit_hint *hint = m_fixit_hints[i];
+@@ -2646,6 +2855,59 @@ namespace selftest {
+ 
+ /* Selftests for diagnostic_show_locus.  */
+ 
++/* Verify that cpp_display_width correctly handles escaping.  */
++
++static void
++test_display_widths ()
++{
++  gcc_rich_location richloc (UNKNOWN_LOCATION);
++
++  /* U+03C0 "GREEK SMALL LETTER PI".  */
++  const char *pi = "\xCF\x80";
++  /* U+1F642 "SLIGHTLY SMILING FACE".  */
++  const char *emoji = "\xF0\x9F\x99\x82";
++  /* Stray trailing byte of a UTF-8 character.  */
++  const char *stray = "\xBF";
++  /* U+10FFFF.  */
++  const char *max_codepoint = "\xF4\x8F\xBF\xBF";
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
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
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
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
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
+    start.  test_left_margin sets the total byte count from the left side of the
+    screen to the start of source lines, after the line number and the separator,
+@@ -2715,10 +2977,10 @@ test_layout_x_offset_display_utf8 (const
+   char_span lspan = location_get_source_line (tmp.get_filename (), 1);
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
+ 
+@@ -2866,12 +3128,13 @@ test_layout_x_offset_display_tab (const
+   ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
+   for (int tabstop = 1; tabstop != num_tabstops; ++tabstop)
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
+ 
+   /* Check that the tab is expanded to the expected number of spaces.  */
+@@ -4003,6 +4266,43 @@ test_one_liner_labels_utf8 ()
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
++      dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++      ASSERT_STREQ (" <U+1F602>_foo = <U+03C0>_bar.<U+1F602>_field<U+03C0>;\n"
++		    " ^~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~\n"
++		    " |               |            |\n"
++		    " |               |            label 2\xcf\x80\n"
++		    " |               label 1\xcf\x80\n"
++		    " label 0\xf0\x9f\x98\x82\n",
++		    pp_formatted_text (dc.printer));
++    }
++    {
++      test_diagnostic_context dc;
++      dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++      ASSERT_STREQ
++	(" <f0><9f><98><82>_foo = <cf><80>_bar.<f0><9f><98><82>_field<cf><80>;\n"
++	 " ^~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
++	 " |                      |            |\n"
++	 " |                      |            label 2\xcf\x80\n"
++	 " |                      label 1\xcf\x80\n"
++	 " label 0\xf0\x9f\x98\x82\n",
++	 pp_formatted_text (dc.printer));
++    }
++  }
+ }
+ 
+ /* Make sure that colorization codes don't interrupt a multibyte
+@@ -4057,9 +4357,9 @@ test_diagnostic_show_locus_one_liner_utf
+ 
+   char_span lspan = location_get_source_line (tmp.get_filename (), 1);
+   ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (),
+-				    def_tabstop));
++				    def_policy ()));
+   ASSERT_EQ (25, location_compute_display_column (expand_location (line_end),
+-						  def_tabstop));
++						  def_policy ()));
+ 
+   test_one_liner_simple_caret_utf8 ();
+   test_one_liner_caret_and_range_utf8 ();
+@@ -4445,30 +4745,31 @@ test_overlapped_fixit_printing (const li
+ 		  pp_formatted_text (dc.printer));
+ 
+     /* Unit-test the line_corrections machinery.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
++	       get_affected_range (policy, hint_0, CU_BYTES));
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0));
+     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
++	       get_affected_range (policy, hint_1, CU_BYTES));
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1));
+     const fixit_hint *hint_2 = richloc.get_fixit_hint (2);
+     ASSERT_EQ (column_range (29, 28),
+-	       get_affected_range (&dc, hint_2, CU_BYTES));
++	       get_affected_range (policy, hint_2, CU_BYTES));
+     ASSERT_EQ (column_range (29, 28),
+-	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2));
++	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (29, 29), get_printed_columns (policy, hint_2));
+ 
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (&dc, tmp.get_filename (), 1);
++    line_corrections lc (policy, tmp.get_filename (), 1);
+ 
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4660,30 +4961,31 @@ test_overlapped_fixit_printing_utf8 (con
+ 		  pp_formatted_text (dc.printer));
+ 
+     /* Unit-test the line_corrections machinery.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (14, 14),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
++	       get_affected_range (policy, hint_0, CU_BYTES));
+     ASSERT_EQ (column_range (12, 12),
+-	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0));
+     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (22, 22),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
++	       get_affected_range (policy, hint_1, CU_BYTES));
+     ASSERT_EQ (column_range (18, 18),
+-	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1));
+     const fixit_hint *hint_2 = richloc.get_fixit_hint (2);
+     ASSERT_EQ (column_range (35, 34),
+-	       get_affected_range (&dc, hint_2, CU_BYTES));
++	       get_affected_range (policy, hint_2, CU_BYTES));
+     ASSERT_EQ (column_range (30, 29),
+-	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
+-    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2));
++	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
++    ASSERT_EQ (column_range (30, 30), get_printed_columns (policy, hint_2));
+ 
+     /* Add each hint in turn to a line_corrections instance,
+        and verify that they are consolidated into one correction instance
+        as expected.  */
+-    line_corrections lc (&dc, tmp.get_filename (), 1);
++    line_corrections lc (policy, tmp.get_filename (), 1);
+ 
+     /* The first replace hint by itself.  */
+     lc.add_hint (hint_0);
+@@ -4877,15 +5179,16 @@ test_overlapped_fixit_printing_2 (const
+     richloc.add_fixit_insert_before (col_21, "}");
+ 
+     /* These fixits should be accepted; they can't be consolidated.  */
++    char_display_policy policy (make_policy (dc, richloc));
+     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
+     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
+     ASSERT_EQ (column_range (23, 22),
+-	       get_affected_range (&dc, hint_0, CU_BYTES));
+-    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0));
++	       get_affected_range (policy, hint_0, CU_BYTES));
++    ASSERT_EQ (column_range (23, 23), get_printed_columns (policy, hint_0));
+     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
+     ASSERT_EQ (column_range (21, 20),
+-	       get_affected_range (&dc, hint_1, CU_BYTES));
+-    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1));
++	       get_affected_range (policy, hint_1, CU_BYTES));
++    ASSERT_EQ (column_range (21, 21), get_printed_columns (policy, hint_1));
+ 
+     /* Verify that they're printed correctly.  */
+     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
+@@ -5152,10 +5455,11 @@ test_tab_expansion (const line_table_cas
+      ....................123 45678901234 56789012345  columns  */
+ 
+   const int tabstop = 8;
++  cpp_char_column_policy policy (tabstop, cpp_wcwidth);
+   const int first_non_ws_byte_col = 7;
+   const int right_quote_byte_col = 15;
+   const int last_byte_col = 25;
+-  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
++  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, policy));
+ 
+   temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
+   line_table_test ltt (case_);
+@@ -5198,6 +5502,114 @@ test_tab_expansion (const line_table_cas
+   }
+ }
+ 
++/* Verify that the escaping machinery can cope with a variety of different
++   invalid bytes.  */
++
++static void
++test_escaping_bytes_1 (const line_table_case &case_)
++{
++  const char content[] = "before\0\1\2\3\r\x80\xff""after\n";
++  const size_t sz = sizeof (content);
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
++  line_table_test ltt (case_);
++  const line_map_ordinary *ord_map = linemap_check_ordinary
++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
++  linemap_line_start (line_table, 1, 100);
++
++  location_t finish
++    = linemap_position_for_line_and_column (line_table, ord_map, 1,
++					    strlen (content));
++
++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Locations of the NUL and \r bytes.  */
++  location_t nul_loc
++    = linemap_position_for_line_and_column (line_table, ord_map, 1, 7);
++  location_t r_loc
++    = linemap_position_for_line_and_column (line_table, ord_map, 1, 11);
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
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ
++      (" before<U+0000><U+0001><U+0002><U+0003><U+000D><80><ff>after\n"
++       "       ^~~~~~~~                        ~~~~~~~~\n",
++       pp_formatted_text (dc.printer));
++  }
++  {
++    test_diagnostic_context dc;
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
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
++  const char content[]  = "\0after\n";
++  const size_t sz = sizeof (content);
++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
++  line_table_test ltt (case_);
++  const line_map_ordinary *ord_map = linemap_check_ordinary
++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
++  linemap_line_start (line_table, 1, 100);
++
++  location_t finish
++    = linemap_position_for_line_and_column (line_table, ord_map, 1,
++					    strlen (content));
++
++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
++    return;
++
++  /* Location of the NUL byte.  */
++  location_t nul_loc
++    = linemap_position_for_line_and_column (line_table, ord_map, 1, 1);
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
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
++    ASSERT_STREQ (" <U+0000>after\n"
++		  " ^~~~~~~~\n",
++		  pp_formatted_text (dc.printer));
++  }
++  {
++    test_diagnostic_context dc;
++    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
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
+@@ -5254,6 +5666,8 @@ diagnostic_show_locus_c_tests ()
+   test_layout_range_for_single_line ();
+   test_layout_range_for_multiple_lines ();
+ 
++  test_display_widths ();
++
+   for_each_line_table_case (test_layout_x_offset_display_utf8);
+   for_each_line_table_case (test_layout_x_offset_display_tab);
+ 
+@@ -5274,6 +5688,8 @@ diagnostic_show_locus_c_tests ()
+   for_each_line_table_case (test_fixit_replace_containing_newline);
+   for_each_line_table_case (test_fixit_deletion_affecting_newline);
+   for_each_line_table_case (test_tab_expansion);
++  for_each_line_table_case (test_escaping_bytes_1);
++  for_each_line_table_case (test_escaping_bytes_2);
+ 
+   test_line_numbers_multiline_range ();
+ }
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-13 23:23:05.764437151 -0800
++++ b/gcc/doc/invoke.texi	2021-12-14 01:16:01.553943061 -0800
+@@ -312,7 +312,8 @@ Objective-C and Objective-C++ Dialects}.
+ -fdiagnostics-show-path-depths @gol
+ -fno-show-column @gol
+ -fdiagnostics-column-unit=@r{[}display@r{|}byte@r{]} @gol
+--fdiagnostics-column-origin=@var{origin}}
++-fdiagnostics-column-origin=@var{origin} @gol
++-fdiagnostics-escape-format=@r{[}unicode@r{|}bytes@r{]}}
+ 
+ @item Warning Options
+ @xref{Warning Options,,Options to Request or Suppress Warnings}.
+@@ -5083,6 +5084,38 @@ first column.  The default value of 1 co
+ behavior and to the GNU style guide.  Some utilities may perform better with an
+ origin of 0; any non-negative value may be specified.
+ 
++@item -fdiagnostics-escape-format=@var{FORMAT}
++@opindex fdiagnostics-escape-format
++When GCC prints pertinent source lines for a diagnostic it normally attempts
++to print the source bytes directly.  However, some diagnostics relate to encoding
++issues in the source file, such as malformed UTF-8, or issues with Unicode
++normalization.  These diagnostics are flagged so that GCC will escape bytes
++that are not printable ASCII when printing their pertinent source lines.
++
++This option controls how such bytes should be escaped.
++
++The default @var{FORMAT}, @samp{unicode} displays Unicode characters that
++are not printable ASCII in the form @samp{<U+XXXX>}, and bytes that do not
++correspond to a Unicode character validly-encoded in UTF-8-encoded will be
++displayed as hexadecimal in the form @samp{<XX>}.
++
++For example, a source line containing the string @samp{before} followed by the
++Unicode character U+03C0 (``GREEK SMALL LETTER PI'', with UTF-8 encoding
++0xCF 0x80) followed by the byte 0xBF (a stray UTF-8 trailing byte), followed by
++the string @samp{after} will be printed for such a diagnostic as:
++
++@smallexample
++ before<U+03C0><BF>after
++@end smallexample
++
++Setting @var{FORMAT} to @samp{bytes} will display all non-printable-ASCII bytes
++in the form @samp{<XX>}, thus showing the underlying encoding of non-ASCII
++Unicode characters.  For the example above, the following will be printed:
++
++@smallexample
++ before<CF><80><BF>after
++@end smallexample
++
+ @item -fdiagnostics-format=@var{FORMAT}
+ @opindex fdiagnostics-format
+ Select a different format for printing diagnostics.
+@@ -5150,9 +5183,11 @@ might be printed in JSON form (after for
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
+@@ -5239,6 +5274,7 @@ of the expression, which have labels.  I
+                 "label": "T @{aka struct t@}"
+             @}
+         ],
++        "escape-source": false,
+         "message": "invalid operands to binary + @dots{}"
+     @}
+ @end smallexample
+@@ -5292,6 +5328,7 @@ might be printed in JSON form as:
+                 @}
+             @}
+         ],
++        "escape-source": false,
+         "message": "\u2018struct s\u2019 has no member named @dots{}"
+     @}
+ @end smallexample
+@@ -5349,6 +5386,10 @@ For example, the intraprocedural example
+     ]
+ @end smallexample
+ 
++Diagnostics have a boolean attribute @code{escape-source}, hinting whether
++non-ASCII bytes should be escaped when printing the pertinent lines of
++source code (@code{true} for diagnostics involving source encoding issues).
++
+ @end table
+ 
+ @node Warning Options
+diff --git a/gcc/input.c b/gcc/input.c
+--- a/gcc/input.c	2021-07-27 23:55:07.328287915 -0700
++++ b/gcc/input.c	2021-12-14 01:16:01.553943061 -0800
+@@ -913,7 +913,8 @@ make_location (location_t caret, source_
+    source line in order to calculate the display width.  If that cannot be done
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
+   return cpp_byte_column_to_display_column (line.get_buffer (), line.length (),
+-					    exploc.column, tabstop);
++					    exploc.column, policy);
+ }
+ 
+ /* Dump statistics to stderr about the memory usage of the line_table
+@@ -3611,43 +3612,50 @@ test_line_offset_overflow ()
+ void test_cpp_utf8 ()
+ {
+   const int def_tabstop = 8;
++  cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
++
+   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
+   {
+-    int w_bad = cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tabstop);
++    int w_bad = cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, policy);
+     ASSERT_EQ (8, w_bad);
+-    int w_ctrl = cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
++    int w_ctrl = cpp_display_width ("\r\n\v\0\1", 5, policy);
+     ASSERT_EQ (5, w_ctrl);
+   }
+ 
+   /* Verify that wcwidth of valid UTF-8 is as expected.  */
+   {
+-    const int w_pi = cpp_display_width ("\xcf\x80", 2, def_tabstop);
++    const int w_pi = cpp_display_width ("\xcf\x80", 2, policy);
+     ASSERT_EQ (1, w_pi);
+-    const int w_emoji = cpp_display_width ("\xf0\x9f\x98\x82", 4, def_tabstop);
++    const int w_emoji = cpp_display_width ("\xf0\x9f\x98\x82", 4, policy);
+     ASSERT_EQ (2, w_emoji);
+     const int w_umlaut_precomposed = cpp_display_width ("\xc3\xbf", 2,
+-							def_tabstop);
++							policy);
+     ASSERT_EQ (1, w_umlaut_precomposed);
+     const int w_umlaut_combining = cpp_display_width ("y\xcc\x88", 3,
+-						      def_tabstop);
++						      policy);
+     ASSERT_EQ (1, w_umlaut_combining);
+-    const int w_han = cpp_display_width ("\xe4\xb8\xba", 3, def_tabstop);
++    const int w_han = cpp_display_width ("\xe4\xb8\xba", 3, policy);
+     ASSERT_EQ (2, w_han);
+-    const int w_ascii = cpp_display_width ("GCC", 3, def_tabstop);
++    const int w_ascii = cpp_display_width ("GCC", 3, policy);
+     ASSERT_EQ (3, w_ascii);
+     const int w_mixed = cpp_display_width ("\xcf\x80 = 3.14 \xf0\x9f\x98\x82"
+ 					   "\x9f! \xe4\xb8\xba y\xcc\x88",
+-					   24, def_tabstop);
++					   24, policy);
+     ASSERT_EQ (18, w_mixed);
+   }
+ 
+   /* Verify that display width properly expands tabs.  */
+   {
+     const char *tstr = "\tabc\td";
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
+ 
+   /* Verify that cpp_byte_column_to_display_column can go past the end,
+@@ -3660,13 +3668,13 @@ void test_cpp_utf8 ()
+       /* 111122223456
+ 	 Byte columns.  */
+ 
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
+ 
+   /* Verify that cpp_display_column_to_byte_column can go past the end,
+@@ -3680,25 +3688,25 @@ void test_cpp_utf8 ()
+       /* 000000000000000000000000000000000111111
+ 	 111122223333444456666777788889999012345
+ 	 Byte columns.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_tabstop));
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
+ 
+     /* Verify that we do not interrupt a UTF-8 sequence.  */
+-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_tabstop));
++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, policy));
+ 
+     for (int byte_col = 1; byte_col <= 15; ++byte_col)
+       {
+ 	const int disp_col
+-	  = cpp_byte_column_to_display_column (str, 15, byte_col, def_tabstop);
++	  = cpp_byte_column_to_display_column (str, 15, byte_col, policy);
+ 	const int byte_col2
+-	  = cpp_display_column_to_byte_column (str, 15, disp_col, def_tabstop);
++	  = cpp_display_column_to_byte_column (str, 15, disp_col, policy);
+ 
+ 	/* If we ask for the display column in the middle of a UTF-8
+ 	   sequence, it will return the length of the partial sequence,
+diff --git a/gcc/input.h b/gcc/input.h
+--- a/gcc/input.h	2021-07-27 23:55:07.328287915 -0700
++++ b/gcc/input.h	2021-12-14 01:16:01.553943061 -0800
+@@ -39,8 +39,11 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
+ extern bool is_location_from_builtin_token (location_t);
+ extern expanded_location expand_location (location_t);
+ 
+-extern int location_compute_display_column (expanded_location exploc,
+-					    int tabstop);
++class cpp_char_column_policy;
++
++extern int
++location_compute_display_column (expanded_location exploc,
++				 const cpp_char_column_policy &policy);
+ 
+ /* A class capturing the bounds of a buffer, to allow for run-time
+    bounds-checking in a checked build.  */
+diff --git a/gcc/opts.c b/gcc/opts.c
+--- a/gcc/opts.c	2021-07-27 23:55:07.364288417 -0700
++++ b/gcc/opts.c	2021-12-14 01:16:01.553943061 -0800
+@@ -2573,6 +2573,10 @@ common_handle_option (struct gcc_options
+       dc->column_origin = value;
+       break;
+ 
++    case OPT_fdiagnostics_escape_format_:
++      dc->escape_format = (enum diagnostics_escape_format)value;
++      break;
++
+     case OPT_fdiagnostics_show_cwe:
+       dc->show_cwe = value;
+       break;
+diff --git a/gcc/selftest.c b/gcc/selftest.c
+--- a/gcc/selftest.c	2021-07-27 23:55:07.500290315 -0700
++++ b/gcc/selftest.c	2021-12-14 01:16:01.557942991 -0800
+@@ -193,6 +193,21 @@ temp_source_file::temp_source_file (cons
+   fclose (out);
+ }
+ 
++/* As above, but with a size, to allow for NUL bytes in CONTENT.  */
++
++temp_source_file::temp_source_file (const location &loc,
++				    const char *suffix,
++				    const char *content,
++				    size_t sz)
++: named_temp_file (suffix)
++{
++  FILE *out = fopen (get_filename (), "w");
++  if (!out)
++    fail_formatted (loc, "unable to open tempfile: %s", get_filename ());
++  fwrite (content, sz, 1, out);
++  fclose (out);
++}
++
+ /* Avoid introducing locale-specific differences in the results
+    by hardcoding open_quote and close_quote.  */
+ 
+diff --git a/gcc/selftest.h b/gcc/selftest.h
+--- a/gcc/selftest.h	2021-07-27 23:55:07.500290315 -0700
++++ b/gcc/selftest.h	2021-12-14 01:16:01.557942991 -0800
+@@ -112,6 +112,8 @@ class temp_source_file : public named_te
+  public:
+   temp_source_file (const location &loc, const char *suffix,
+ 		    const char *content);
++  temp_source_file (const location &loc, const char *suffix,
++		    const char *content, size_t sz);
+ };
+ 
+ /* RAII-style class for avoiding introducing locale-specific differences
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-07-27 23:55:07.596291654 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#error message\"" } */
+ 
+ /* { dg-regexp "\"caret\": \{" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-07-27 23:55:07.596291654 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ /* { dg-regexp "\"kind\": \"warning\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Wcpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-07-27 23:55:07.596291654 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \"#warning message\"" } */
+ /* { dg-regexp "\"option\": \"-Werror=cpp\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-07-27 23:55:07.596291654 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-14 01:16:01.557942991 -0800
+@@ -19,6 +19,7 @@ int test (void)
+ 
+ /* { dg-regexp "\"kind\": \"note\"" } */
+ /* { dg-regexp "\"message\": \"...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'\"" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ 
+ /* { dg-regexp "\"caret\": \{" } */
+ /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
+@@ -39,6 +40,7 @@ int test (void)
+ /* { dg-regexp "\"kind\": \"warning\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
+ /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
+ /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-indentation\"" } */
+ 
+diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c
+--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-07-27 23:55:07.596291654 -0700
++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-14 01:16:01.557942991 -0800
+@@ -14,6 +14,7 @@ int test (struct s *ptr)
+ 
+ /* { dg-regexp "\"kind\": \"error\"" } */
+ /* { dg-regexp "\"column-origin\": 1" } */
++/* { dg-regexp "\"escape-source\": false" } */
+ /* { dg-regexp "\"message\": \".*\"" } */
+ 
+ /* Verify fix-it hints.  */
+diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
+--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	2021-12-14 01:16:01.557942991 -0800
+@@ -0,0 +1,21 @@
++// { dg-do preprocess }
++// { dg-options "-std=gnu99 -Werror=normalized=nfc -fdiagnostics-show-caret -fdiagnostics-escape-format=bytes" }
++/* { dg-message "some warnings being treated as errors" "" {target "*-*-*"} 0 } */
++
++/* à½ = U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 0FB7" i.e.
++   U+0F42 TIBETAN LETTER GA: à½
++   U+0FB7 TIBETAN SUBJOINED LETTER HA: à¾·
++
++   The UTF-8 encoding of U+0F43 TIBETAN LETTER GHA is: E0 BD 83.  */
++
++foo before_\u0F43_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
++/* { dg-begin-multiline-output "" }
++ foo before_\u0F43_after bar
++     ^~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
++
++foo before_à½_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
++/* { dg-begin-multiline-output "" }
++ foo before_<e0><bd><83>_after bar
++     ^~~~~~~~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
+--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	2021-12-14 01:16:01.557942991 -0800
+@@ -0,0 +1,19 @@
++// { dg-do preprocess }
++// { dg-options "-std=gnu99 -Werror=normalized=nfc -fdiagnostics-show-caret -fdiagnostics-escape-format=unicode" }
++/* { dg-message "some warnings being treated as errors" "" {target "*-*-*"} 0 } */
++
++/* à½ = U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 0FB7" i.e.
++   U+0F42 TIBETAN LETTER GA: à½
++   U+0FB7 TIBETAN SUBJOINED LETTER HA: à¾·  */
++
++foo before_\u0F43_after bar  // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
++/* { dg-begin-multiline-output "" }
++ foo before_\u0F43_after bar
++     ^~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
++
++foo before_à½_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
++/* { dg-begin-multiline-output "" }
++ foo before_<U+0F43>_after bar
++     ^~~~~~~~~~~~~~~~~~~~~
++   { dg-end-multiline-output "" } */
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-07-27 23:55:08.472303878 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ ! { dg-regexp "\"kind\": \"error\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#error message\"" }
+ 
+ ! { dg-regexp "\"caret\": \{" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-07-27 23:55:08.472303878 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ ! { dg-regexp "\"kind\": \"warning\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Wcpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90
+--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-07-27 23:55:08.472303878 -0700
++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-14 01:16:01.557942991 -0800
+@@ -9,6 +9,7 @@
+ 
+ ! { dg-regexp "\"kind\": \"error\"" }
+ ! { dg-regexp "\"column-origin\": 1" }
++! { dg-regexp "\"escape-source\": false" }
+ ! { dg-regexp "\"message\": \"#warning message\"" }
+ ! { dg-regexp "\"option\": \"-Werror=cpp\"" }
+ ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
+diff --git a/libcpp/charset.c b/libcpp/charset.c
+--- a/libcpp/charset.c	2021-07-27 23:55:08.712307227 -0700
++++ b/libcpp/charset.c	2021-12-14 01:16:01.557942991 -0800
+@@ -1552,12 +1552,14 @@ convert_escape (cpp_reader *pfile, const
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
+ 
+@@ -2280,14 +2282,16 @@ cpp_string_location_reader::get_next ()
+ }
+ 
+ cpp_display_width_computation::
+-cpp_display_width_computation (const char *data, int data_length, int tabstop) :
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
+ 
+ 
+@@ -2299,19 +2303,28 @@ cpp_display_width_computation (const cha
+    point to a valid UTF-8-encoded sequence, then it will be treated as a single
+    byte with display width 1.  m_cur_display_col is the current display column,
+    relative to which tab stops should be expanded.  Returns the display width of
+-   the codepoint just processed.  */
++   the codepoint just processed.
++   If OUT is non-NULL, it is populated.  */
+ 
+ int
+-cpp_display_width_computation::process_next_codepoint ()
++cpp_display_width_computation::process_next_codepoint (cpp_decoded_char *out)
+ {
+   cppchar_t c;
+   int next_width;
+ 
++  if (out)
++    out->m_start_byte = m_next;
++
+   if (*m_next == '\t')
+     {
+       ++m_next;
+       --m_bytes_left;
+-      next_width = m_tabstop - (m_display_cols % m_tabstop);
++      next_width = m_policy.m_tabstop - (m_display_cols % m_policy.m_tabstop);
++      if (out)
++	{
++	  out->m_ch = '\t';
++	  out->m_valid_ch = true;
++	}
+     }
+   else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left, &c)
+ 	   != 0)
+@@ -2321,14 +2334,24 @@ cpp_display_width_computation::process_n
+ 	 of one.  */
+       ++m_next;
+       --m_bytes_left;
+-      next_width = 1;
++      next_width = m_policy.m_undecoded_byte_width;
++      if (out)
++	out->m_valid_ch = false;
+     }
+   else
+     {
+       /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for us.  */
+-      next_width = cpp_wcwidth (c);
++      next_width = m_policy.m_width_cb (c);
++      if (out)
++	{
++	  out->m_ch = c;
++	  out->m_valid_ch = true;
++	}
+     }
+ 
++  if (out)
++    out->m_next_byte = m_next;
++
+   m_display_cols += next_width;
+   return next_width;
+ }
+@@ -2344,7 +2367,7 @@ cpp_display_width_computation::advance_d
+   const int start = m_display_cols;
+   const int target = start + n;
+   while (m_display_cols < target && !done ())
+-    process_next_codepoint ();
++    process_next_codepoint (NULL);
+   return m_display_cols - start;
+ }
+ 
+@@ -2352,29 +2375,33 @@ cpp_display_width_computation::advance_d
+     how many display columns are occupied by the first COLUMN bytes.  COLUMN
+     may exceed DATA_LENGTH, in which case the phantom bytes at the end are
+     treated as if they have display width 1.  Tabs are expanded to the next tab
+-    stop, relative to the start of DATA.  */
++    stop, relative to the start of DATA, and non-printable-ASCII characters
++    will be escaped as per POLICY.  */
+ 
+ int
+ cpp_byte_column_to_display_column (const char *data, int data_length,
+-				   int column, int tabstop)
++				   int column,
++				   const cpp_char_column_policy &policy)
+ {
+   const int offset = MAX (0, column - data_length);
+-  cpp_display_width_computation dw (data, column - offset, tabstop);
++  cpp_display_width_computation dw (data, column - offset, policy);
+   while (!dw.done ())
+-    dw.process_next_codepoint ();
++    dw.process_next_codepoint (NULL);
+   return dw.display_cols_processed () + offset;
+ }
+ 
+ /*  For the string of length DATA_LENGTH bytes that begins at DATA, compute
+     the least number of bytes that will result in at least DISPLAY_COL display
+     columns.  The return value may exceed DATA_LENGTH if the entire string does
+-    not occupy enough display columns.  */
++    not occupy enough display columns.  Non-printable-ASCII characters
++    will be escaped as per POLICY.  */
+ 
+ int
+ cpp_display_column_to_byte_column (const char *data, int data_length,
+-				   int display_col, int tabstop)
++				   int display_col,
++				   const cpp_char_column_policy &policy)
+ {
+-  cpp_display_width_computation dw (data, data_length, tabstop);
++  cpp_display_width_computation dw (data, data_length, policy);
+   const int avail_display = dw.advance_display_cols (display_col);
+   return dw.bytes_processed () + MAX (0, display_col - avail_display);
+ }
+diff --git a/libcpp/errors.c b/libcpp/errors.c
+--- a/libcpp/errors.c	2021-07-27 23:55:08.712307227 -0700
++++ b/libcpp/errors.c	2021-12-14 01:16:01.557942991 -0800
+@@ -27,6 +27,31 @@ along with this program; see the file CO
+ #include "cpplib.h"
+ #include "internal.h"
+ 
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
++  else if (pfile->cur_token == pfile->cur_run->base)
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
+ 
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
+-	src_loc = pfile->directive_line;
+-      else
+-	src_loc = pfile->line_table->highest_line;
+-    }
+-  /* We don't want to refer to a token before the beginning of the
+-     current run -- that is invalid.  */
+-  else if (pfile->cur_token == pfile->cur_run->base)
+-    {
+-      src_loc = 0;
+-    }
+-  else
+-    {
+-      src_loc = pfile->cur_token[-1].src_loc;
+-    }
++  location_t src_loc = cpp_diagnostic_get_current_location (pfile);
+   rich_location richloc (pfile->line_table, src_loc);
+   return cpp_diagnostic_at (pfile, level, reason, &richloc, msgid, ap);
+ }
+@@ -142,6 +149,43 @@ cpp_warning_syshdr (cpp_reader * pfile,
+ 
+   va_end (ap);
+   return ret;
++}
++
++/* As cpp_warning above, but use RICHLOC as the location of the diagnostic.  */
++
++bool cpp_warning_at (cpp_reader *pfile, enum cpp_warning_reason reason,
++		     rich_location *richloc, const char *msgid, ...)
++{
++  va_list ap;
++  bool ret;
++
++  va_start (ap, msgid);
++
++  ret = cpp_diagnostic_at (pfile, CPP_DL_WARNING, reason, richloc,
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
++  ret = cpp_diagnostic_at (pfile, CPP_DL_PEDWARN, reason, richloc,
++			   msgid, &ap);
++
++  va_end (ap);
++  return ret;
+ }
+ 
+ /* Print a diagnostic at a specific location.  */
+diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
+--- a/libcpp/include/cpplib.h	2021-12-13 23:23:05.768437079 -0800
++++ b/libcpp/include/cpplib.h	2021-12-14 01:20:16.189507386 -0800
+@@ -1275,6 +1275,14 @@ extern bool cpp_warning_syshdr (cpp_read
+ 				const char *msgid, ...)
+   ATTRIBUTE_PRINTF_3;
+ 
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
+@@ -1435,42 +1443,95 @@ extern const char * cpp_get_userdef_suff
+ 
+ /* In charset.c */
+ 
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
++   ASCII chars when printing the user's source code in diagnostic-show-locus.c
++
++   For example, consider:
++   - the Unicode character U+03C0 "GREEK SMALL LETTER PI" (UTF-8: 0xCF 0x80)
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
+ /* A class to manage the state while converting a UTF-8 sequence to cppchar_t
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
+ 
+-  int process_next_codepoint ();
++  int process_next_codepoint (cpp_decoded_char *out);
+   int advance_display_cols (int n);
+ 
+  private:
+   const char *const m_begin;
+   const char *m_next;
+   size_t m_bytes_left;
+-  const int m_tabstop;
++  const cpp_char_column_policy &m_policy;
+   int m_display_cols;
+ };
+ 
+ /* Convenience functions that are simple use cases for class
+    cpp_display_width_computation.  Tab characters will be expanded to spaces
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
+   return cpp_byte_column_to_display_column (data, data_length, data_length,
+-					    tabstop);
++					    policy);
+ }
+ int cpp_display_column_to_byte_column (const char *data, int data_length,
+-				       int display_col, int tabstop);
++				       int display_col,
++				       const cpp_char_column_policy &policy);
+ int cpp_wcwidth (cppchar_t c);
+ 
+ #endif /* ! LIBCPP_CPPLIB_H */
+diff --git a/libcpp/include/line-map.h b/libcpp/include/line-map.h
+--- a/libcpp/include/line-map.h	2021-07-27 23:55:08.716307283 -0700
++++ b/libcpp/include/line-map.h	2021-12-14 01:16:01.557942991 -0800
+@@ -1781,6 +1781,18 @@ class rich_location
+   const diagnostic_path *get_path () const { return m_path; }
+   void set_path (const diagnostic_path *path) { m_path = path; }
+ 
++  /* A flag for hinting that the diagnostic involves character encoding
++     issues, and thus that it will be helpful to the user if we show some
++     representation of how the characters in the pertinent source lines
++     are encoded.
++     The default is false (i.e. do not escape).
++     When set to true, non-ASCII bytes in the pertinent source lines will
++     be escaped in a manner controlled by the user-supplied option
++     -fdiagnostics-escape-format=, so that the user can better understand
++     what's going on with the encoding in their source file.  */
++  bool escape_on_output_p () const { return m_escape_on_output; }
++  void set_escape_on_output (bool flag) { m_escape_on_output = flag; }
++
+ private:
+   bool reject_impossible_fixit (location_t where);
+   void stop_supporting_fixits ();
+@@ -1807,6 +1819,7 @@ protected:
+   bool m_fixits_cannot_be_auto_applied;
+ 
+   const diagnostic_path *m_path;
++  bool m_escape_on_output;
+ };
+ 
+ /* A struct for the result of range_label::get_text: a NUL-terminated buffer
+diff --git a/libcpp/internal.h b/libcpp/internal.h
+--- a/libcpp/internal.h	2021-12-13 23:23:05.768437079 -0800
++++ b/libcpp/internal.h	2021-12-14 01:16:01.557942991 -0800
+@@ -776,6 +776,9 @@ extern void _cpp_do_file_change (cpp_rea
+ extern void _cpp_pop_buffer (cpp_reader *);
+ extern char *_cpp_bracket_include (cpp_reader *);
+ 
++/* In errors.c  */
++extern location_t cpp_diagnostic_get_current_location (cpp_reader *);
++
+ /* In traditional.c.  */
+ extern bool _cpp_scan_out_logical_line (cpp_reader *, cpp_macro *, bool);
+ extern bool _cpp_read_logical_line_trad (cpp_reader *);
+@@ -942,6 +945,26 @@ int linemap_get_expansion_line (class li
+ const char* linemap_get_expansion_filename (class line_maps *,
+ 					    location_t);
+ 
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
+--- a/libcpp/lex.c	2021-12-14 01:14:48.435225968 -0800
++++ b/libcpp/lex.c	2021-12-14 01:24:37.220995816 -0800
+@@ -1774,7 +1774,11 @@ skip_whitespace (cpp_reader *pfile, cppc
+   while (is_nvspace (c));
+ 
+   if (saw_NUL)
+-    cpp_error (pfile, CPP_DL_WARNING, "null character(s) ignored");
++    {
++      encoding_rich_location rich_loc (pfile);
++      cpp_error_at (pfile, CPP_DL_WARNING, &rich_loc,
++		    "null character(s) ignored");
++    }
+ 
+   buffer->cur--;
+ }
+@@ -1803,6 +1807,28 @@ warn_about_normalization (cpp_reader *pf
+   if (CPP_OPTION (pfile, warn_normalize) < NORMALIZE_STATE_RESULT (s)
+       && !pfile->state.skipping)
+     {
++      location_t loc = token->src_loc;
++
++      /* If possible, create a location range for the token.  */
++      if (loc >= RESERVED_LOCATION_COUNT
++	  && token->type != CPP_EOF
++	  /* There must be no line notes to process.  */
++	  && (!(pfile->buffer->cur
++		>= pfile->buffer->notes[pfile->buffer->cur_note].pos
++		&& !pfile->overlaid_buffer)))
++	{
++	  source_range tok_range;
++	  tok_range.m_start = loc;
++	  tok_range.m_finish
++	    = linemap_position_for_column (pfile->line_table,
++					   CPP_BUF_COLUMN (pfile->buffer,
++							   pfile->buffer->cur));
++	  loc = COMBINE_LOCATION_DATA (pfile->line_table,
++				       loc, tok_range, NULL);
++	}
++
++      encoding_rich_location rich_loc (pfile, loc);
++
+       /* Make sure that the token is printed using UCNs, even
+ 	 if we'd otherwise happily print UTF-8.  */
+       unsigned char *buf = XNEWVEC (unsigned char, cpp_token_len (token));
+@@ -1810,11 +1836,11 @@ warn_about_normalization (cpp_reader *pf
+ 
+       sz = cpp_spell_token (pfile, token, buf, false) - buf;
+       if (NORMALIZE_STATE_RESULT (s) == normalized_C)
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
+--- a/libcpp/line-map.c	2021-07-27 23:55:08.716307283 -0700
++++ b/libcpp/line-map.c	2021-12-14 01:16:01.561942921 -0800
+@@ -2086,7 +2086,8 @@ rich_location::rich_location (line_maps
+   m_fixit_hints (),
+   m_seen_impossible_fixit (false),
+   m_fixits_cannot_be_auto_applied (false),
+-  m_path (NULL)
++  m_path (NULL),
++  m_escape_on_output (false)
+ {
+   add_range (loc, SHOW_RANGE_WITH_CARET, label);
+ }
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
new file mode 100644
index 0000000000..9bad81d4d0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
@@ -0,0 +1,1765 @@
+From 51c500269bf53749b107807d84271385fad35628 Mon Sep 17 00:00:00 2001
+From: Marek Polacek <polacek@redhat.com>
+Date: Wed, 6 Oct 2021 14:33:59 -0400
+Subject: [PATCH] libcpp: Implement -Wbidi-chars for CVE-2021-42574 [PR103026]
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
+implements -Wbidi-chars=[none|unpaired|any] to warn about possibly
+misleading Unicode bidirectional control characters the preprocessor may
+encounter.
+
+The default is =unpaired, which warns about improperly terminated
+bidirectional control characters; e.g. a LRE without its corresponding PDF.
+The level =any warns about any use of bidirectional control characters.
+
+This patch handles both UCNs and UTF-8 characters.  UCNs designating
+bidi characters in identifiers are accepted since r204886.  Then r217144
+enabled -fextended-identifiers by default.  Extended characters in C/C++
+identifiers have been accepted since r275979.  However, this patch still
+warns about mixing UTF-8 and UCN bidi characters; there seems to be no
+good reason to allow mixing them.
+
+We warn in different contexts: comments (both C and C++-style), string
+literals, character constants, and identifiers.  Expectedly, UCNs are ignored
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
+	* c.opt (Wbidi-chars, Wbidi-chars=): New option.
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
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
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
+index 8a4cd634f77..3976fc368db 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -370,6 +370,30 @@ Wbad-function-cast
+ C ObjC Var(warn_bad_function_cast) Warning
+ Warn about casting functions to incompatible types.
+ 
++Wbidi-chars
++C ObjC C++ ObjC++ Warning Alias(Wbidi-chars=,any,none)
++;
++
++Wbidi-chars=
++C ObjC C++ ObjC++ RejectNegative Joined Warning CPP(cpp_warn_bidirectional) CppReason(CPP_W_BIDIRECTIONAL) Var(warn_bidirectional) Init(bidirectional_unpaired) Enum(cpp_bidirectional_level)
++-Wbidi-chars=[none|unpaired|any] Warn about UTF-8 bidirectional control characters.
++
++; Required for these enum values.
++SourceInclude
++cpplib.h
++
++Enum
++Name(cpp_bidirectional_level) Type(int) UnknownError(argument %qs to %<-Wbidi-chars%> not recognized)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(none) Value(bidirectional_none)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(unpaired) Value(bidirectional_unpaired)
++
++EnumValue
++Enum(cpp_bidirectional_level) String(any) Value(bidirectional_any)
++
+ Wbool-compare
+ C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C++ ObjC++,Wall)
+ Warn about boolean expression compared with an integer value different from true/false.
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 6070288856c..a22758d18ee 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
+ -Warith-conversion @gol
+ -Warray-bounds  -Warray-bounds=@var{n} @gol
+ -Wno-attributes  -Wattribute-alias=@var{n} -Wno-attribute-alias @gol
+--Wno-attribute-warning  -Wbool-compare  -Wbool-operation @gol
++-Wno-attribute-warning  @gol
++-Wbidi-chars=@r{[}none@r{|}unpaired@r{|}any@r{]} @gol
++-Wbool-compare  -Wbool-operation @gol
+ -Wno-builtin-declaration-mismatch @gol
+ -Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat @gol
+ -Wc11-c2x-compat @gol
+@@ -7559,6 +7561,23 @@ Attributes considered include @code{allo
+ This is the default.  You can disable these warnings with either
+ @option{-Wno-attribute-alias} or @option{-Wattribute-alias=0}.
+ 
++@item -Wbidi-chars=@r{[}none@r{|}unpaired@r{|}any@r{]}
++@opindex Wbidi-chars=
++@opindex Wbidi-chars
++@opindex Wno-bidi-chars
++Warn about possibly misleading UTF-8 bidirectional control characters in
++comments, string literals, character constants, and identifiers.  Such
++characters can change left-to-right writing direction into right-to-left
++(and vice versa), which can cause confusion between the logical order and
++visual order.  This may be dangerous; for instance, it may seem that a piece
++of code is not commented out, whereas it in fact is.
++
++There are three levels of warning supported by GCC@.  The default is
++@option{-Wbidi-chars=unpaired}, which warns about improperly terminated
++bidi contexts.  @option{-Wbidi-chars=none} turns the warning off.
++@option{-Wbidi-chars=any} warns about any use of bidirectional control
++characters.
++
+ @item -Wbool-compare
+ @opindex Wno-bool-compare
+ @opindex Wbool-compare
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
+new file mode 100644
+index 00000000000..34f5ac19271
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
+@@ -0,0 +1,27 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* More nesting testing.  */
++
++/* RLEâ« LRIâ¦ PDFâ¬ PDIâ©*/
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
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDF_\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
+new file mode 100644
+index 00000000000..270ce2368a9
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
+@@ -0,0 +1,13 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test that we warn when mixing UCN and UTF-8.  */
++
++int LRE_âª_PDF_\u202c;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++int LRE_\u202a_PDF_â¬_;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++const char *s1 = "LRE_âª_PDF_\u202c";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++const char *s2 = "LRE_\u202a_PDF_â¬";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
+new file mode 100644
+index 00000000000..b07eec1da91
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
+@@ -0,0 +1,19 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile { target { c || c++11 } } } */
++/* { dg-options "-Wbidi-chars=any" } */
++/* Test raw strings.  */
++
++const char *s1 = R"(a b c LREâª 1 2 3 PDFâ¬ x y z)";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++const char *s2 = R"(a b c RLEâ« 1 2 3 PDFâ¬ x y z)";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++const char *s3 = R"(a b c LROâ­ 1 2 3 PDFâ¬ x y z)";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++const char *s4 = R"(a b c RLOâ® 1 2 3 PDFâ¬ x y z)";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++const char *s7 = R"(a b c FSIâ¨ 1 2 3 PDIâ© x y) z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++const char *s8 = R"(a b c PDIâ© x y )z";
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++const char *s9 = R"(a b c PDFâ¬ x y z)";
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
+diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
+--- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-31 16:00:00.000000000 -0800
++++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-13 23:11:22.328439287 -0800
+@@ -0,0 +1,17 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile { target { c || c++11 } } } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test raw strings.  */
++
++const char *s1 = R"(a b c LREâª 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s2 = R"(a b c RLEâ« 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 = R"(a b c LROâ­ 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s4 = R"(a b c FSIâ¨ 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s5 = R"(a b c LRIâ¦ 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s6 = R"(a b c RLIâ§ 1 2 3)";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
+new file mode 100644
+index 00000000000..ba5f75d9553
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
+@@ -0,0 +1,38 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
++   or RLOs.  */
++
++/* LRI_â¦_LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©
++// LRI_â¦_RLO_â®_RLE_â«_RLE_â«_PDI_â©
++// LRI_â¦_RLO_â®_RLE_â«_PDI_â©
++// FSI_â¨_RLO_â®_PDI_â©
++// FSI_â¨_FSI_â¨_RLO_â®_PDI_â©
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_PDI_\u2069;
++int LRI_\u2066_LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_PDI_\u2069;
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
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
+new file mode 100644
+index 00000000000..a0ce8ff5e2c
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
+@@ -0,0 +1,59 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test unpaired bidi control chars in multiline comments.  */
++
++/*
++ * LREâª end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLEâ« end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * LROâ­ end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLOâ® end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * LRIâ¦ end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * RLIâ§ end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/*
++ * FSIâ¨ end
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/* LREâª
++   PDFâ¬ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++/* FSIâ¨
++   PDIâ© */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++
++/* LRE<âª>
++ *
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
++
++/*
++ * LRE<âª>
++ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++
++/*
++ *
++ * LRE<âª> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++/* RLI<â§> */ /* PDI<â©> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRE<âª> */ /* PDF<â¬> */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
+new file mode 100644
+index 00000000000..baa0159861c
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
+@@ -0,0 +1,26 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=any" } */
++/* Test LTR/RTL chars.  */
++
++/* LTR<â> */
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++// LTR<â>
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++/* RTL<â> */
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++// RTL<â>
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++
++const char *s1 = "LTR<â>";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s2 = "LTR\u200e";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s3 = "LTR\u200E";
++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
++const char *s4 = "RTL<â>";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++const char *s5 = "RTL\u200f";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
++const char *s6 = "RTL\u200F";
++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
+new file mode 100644
+index 00000000000..07cb4321f96
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
+@@ -0,0 +1,30 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test LTR/RTL chars.  */
++
++/* LTR<â> */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// LTR<â>
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* RTL<â> */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// RTL<â>
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int ltr_\u200e;
++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
++int rtl_\u200f;
++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
++
++const char *s1 = "LTR<â>";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s2 = "LTR\u200e";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 = "LTR\u200E";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s4 = "RTL<â>";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s5 = "RTL\u200f";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++const char *s6 = "RTL\u200F";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
+new file mode 100644
+index 00000000000..2340374f276
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
+@@ -0,0 +1,12 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    int isAdmin = 0;
++    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++        __builtin_printf("You are an admin.\n");
++    /* end admins only â® { â¦*/
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
+new file mode 100644
+index 00000000000..2340374f276
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
+@@ -0,0 +1,9 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    /* Say hello; newlineâ§/*/ return 0 ;
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++    __builtin_printf("Hello world.\n");
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
+new file mode 100644
+index 00000000000..9dc7edb6e64
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
+@@ -0,0 +1,11 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++
++int main() {
++    const char* access_level = "user";
++    if (__builtin_strcmp(access_level, "userâ® â¦// Check if adminâ© â¦")) {
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++        __builtin_printf("You are an admin.\n");
++    }
++    return 0;
++}
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
+new file mode 100644
+index 00000000000..639e5c62e88
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
+@@ -0,0 +1,188 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=any -Wno-multichar -Wno-overflow" } */
++/* Test all bidi chars in various contexts (identifiers, comments,
++   string literals, character constants), both UCN and UTF-8.  The bidi
++   chars here are properly terminated, except for the character constants.  */
++
++/* a b c LREâª 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++/* a b c RLIâ§ 1 2 3 PDIâ© x y */
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++
++/* Same but C++ comments instead.  */
++// a b c LREâª 1 2 3 PDFâ¬ x y z
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++// a b c RLEâ« 1 2 3 PDFâ¬ x y z
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++// a b c LROâ­ 1 2 3 PDFâ¬ x y z
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++// a b c RLOâ® 1 2 3 PDFâ¬ x y z
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++// a b c LRIâ¦ 1 2 3 PDIâ© x y z
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++// a b c RLIâ§ 1 2 3 PDIâ© x y
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++// a b c FSIâ¨ 1 2 3 PDIâ© x y z
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++
++/* Here we're closing an unopened context, warn when =any.  */
++/* a b c PDIâ© x y z */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++/* a b c PDFâ¬ x y z */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++// a b c PDIâ© x y z
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++// a b c PDFâ¬ x y z
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++/* Multiline comments.  */
++/* a b c PDIâ© x y z
++   */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
++/* a b c PDFâ¬ x y z
++   */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDIâ© x y z
++   */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDFâ¬ x y z
++   */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDIâ© x y z */
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++/* first
++   a b c PDFâ¬ x y z */
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++  const char *s8 = "a b c PDIâ© x y z";
++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
++  const char *s9 = "a b c PDFâ¬ x y z";
++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
++
++  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s11 = "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char *s12 = "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s13 = "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char *s14 = "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s15 = "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char *s16 = "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s17 = "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char *s18 = "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char *s19 = "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char *s20 = "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++}
++
++void
++g2 ()
++{
++  const char c1 = '\u202a';
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char c2 = '\u202A';
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++  const char c3 = '\u202b';
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char c4 = '\u202B';
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++  const char c5 = '\u202d';
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char c6 = '\u202D';
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++  const char c7 = '\u202e';
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char c8 = '\u202E';
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++  const char c9 = '\u2066';
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++  const char c10 = '\u2067';
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++  const char c11 = '\u2068';
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++}
++
++int aâªbâ¬c;
++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
++int aâ«bâ¬c;
++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
++int aâ­bâ¬c;
++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
++int aâ®bâ¬c;
++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
++int aâ¦bâ©c;
++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
++int aâ§bâ©c;
++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
++int aâ¨bâ©c;
++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
++int Aâ¬X;
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
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
+new file mode 100644
+index 00000000000..68cb053144b
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
+@@ -0,0 +1,188 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired -Wno-multichar -Wno-overflow" } */
++/* Test all bidi chars in various contexts (identifiers, comments,
++   string literals, character constants), both UCN and UTF-8.  The bidi
++   chars here are properly terminated, except for the character constants.  */
++
++/* a b c LREâª 1 2 3 PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLIâ§ 1 2 3 PDIâ© x y */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Same but C++ comments instead.  */
++// a b c LREâª 1 2 3 PDFâ¬ x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLEâ« 1 2 3 PDFâ¬ x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c LROâ­ 1 2 3 PDFâ¬ x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLOâ® 1 2 3 PDFâ¬ x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRIâ¦ 1 2 3 PDIâ© x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLIâ§ 1 2 3 PDIâ© x y
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c FSIâ¨ 1 2 3 PDIâ© x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Here we're closing an unopened context, warn when =any.  */
++/* a b c PDIâ© x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* a b c PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c PDIâ© x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++// a b c PDFâ¬ x y z
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++/* Multiline comments.  */
++/* a b c PDIâ© x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* a b c PDFâ¬ x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDIâ© x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDFâ¬ x y z
++   */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
++/* first
++   a b c PDIâ© x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++/* first
++   a b c PDFâ¬ x y z */
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s8 = "a b c PDIâ© x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s9 = "a b c PDFâ¬ x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++
++  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s11 = "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s12 = "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s13 = "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s14 = "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s15 = "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s16 = "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s17 = "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s18 = "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s19 = "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++  const char *s20 = "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++}
++
++void
++g2 ()
++{
++  const char c1 = '\u202a';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c2 = '\u202A';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c3 = '\u202b';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c4 = '\u202B';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c5 = '\u202d';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c6 = '\u202D';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c7 = '\u202e';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c8 = '\u202E';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c9 = '\u2066';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c10 = '\u2067';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char c11 = '\u2068';
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++}
++
++int aâªbâ¬c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ«bâ¬c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ­bâ¬c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ®bâ¬c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ¦bâ©c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ§bâ©c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int aâ¨bâ©c;
++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
++int Aâ¬X;
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
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
+new file mode 100644
+index 00000000000..0ce6fff2dee
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
+@@ -0,0 +1,155 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test nesting of bidi chars in various contexts.  */
++
++/* Terminated by the wrong char:  */
++/* a b c LREâª 1 2 3 PDIâ© x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLEâ« 1 2 3 PDIâ© x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LROâ­ 1 2 3 PDIâ© x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLOâ® 1 2 3 PDIâ© x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c LRIâ¦ 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c RLIâ§ 1 2 3 PDFâ¬ x y z */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++/* LREâª PDFâ¬ */
++/* LREâª LREâª PDFâ¬ PDFâ¬ */
++/* PDFâ¬ LREâª PDFâ¬ */
++/* LREâª PDFâ¬ LREâª PDFâ¬ */
++/* LREâª LREâª PDFâ¬ */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* PDFâ¬ LREâª */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++// a b c LREâª 1 2 3 PDIâ© x y z
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLEâ« 1 2 3 PDIâ© x y  z*/
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c LROâ­ 1 2 3 PDIâ© x y z 
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLOâ® 1 2 3 PDIâ© x y z 
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c LRIâ¦ 1 2 3 PDFâ¬ x y z 
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c RLIâ§ 1 2 3 PDFâ¬ x y z 
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++// LREâª PDFâ¬ 
++// LREâª LREâª PDFâ¬ PDFâ¬
++// PDFâ¬ LREâª PDFâ¬
++// LREâª PDFâ¬ LREâª PDFâ¬
++// LREâª LREâª PDFâ¬
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++// PDFâ¬ LREâª
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++void
++g1 ()
++{
++  const char *s1 = "a b c LREâª 1 2 3 PDIâ© x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s2 = "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s3 = "a b c RLEâ« 1 2 3 PDIâ© x y ";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s4 = "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s5 = "a b c LROâ­ 1 2 3 PDIâ© x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s6 = "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s7 = "a b c RLOâ® 1 2 3 PDIâ© x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s8 = "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s9 = "a b c LRIâ¦ 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s10 = "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s11 = "a b c RLIâ§ 1 2 3 PDFâ¬ x y z\
++    ";
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++  const char *s12 = "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s13 = "a b c FSIâ¨ 1 2 3 PDFâ¬ x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s14 = "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s15 = "PDFâ¬ LREâª";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s16 = "PDF\u202c LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s17 = "LREâª PDFâ¬";
++  const char *s18 = "LRE\u202a PDF\u202c";
++  const char *s19 = "LREâª LREâª PDFâ¬ PDFâ¬";
++  const char *s20 = "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
++  const char *s21 = "PDFâ¬ LREâª PDFâ¬";
++  const char *s22 = "PDF\u202c LRE\u202a PDF\u202c";
++  const char *s23 = "LREâª LREâª PDFâ¬";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s24 = "LRE\u202a LRE\u202a PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s25 = "PDFâ¬ LREâª";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s26 = "PDF\u202c LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s27 = "PDFâ¬ LRE\u202a";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++  const char *s28 = "PDF\u202c LREâª";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++}
++
++int aLREâªbPDIâ©;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int A\u202aB\u2069C;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLEâ«bPDIâ©;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202bB\u2069c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLROâ­bPDIâ©;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202db\u2069c2;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLOâ®bPDIâ©;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u202eb\u2069;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLRIâ¦bPDFâ¬;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u2066b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aRLIâ§bPDFâ¬c
++;
++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
++int a\u2067b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSIâ¨bPDFâ¬;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a\u2068b\u202c;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSIâ¨bPD\u202C;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aFSI\u2068bPDFâ¬_;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int aLREâªbPDFâ¬b; 
++int A\u202aB\u202c;
++int a_LREâª_LREâª_b_PDFâ¬_PDFâ¬;
++int A\u202aA\u202aB\u202cB\u202c;
++int aPDFâ¬bLREadPDFâ¬;
++int a_\u202C_\u202a_\u202c;
++int a_LREâª_b_PDFâ¬_c_LREâª_PDFâ¬;
++int a_\u202a_\u202c_\u202a_\u202c_;
++int a_LREâª_b_PDFâ¬_c_LREâª;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int a_\u202a_\u202c_\u202a_;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
+new file mode 100644
+index 00000000000..d012d420ec0
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
+@@ -0,0 +1,9 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=any" } */
++/* Test we ignore UCNs in comments.  */
++
++// a b c \u202a 1 2 3
++// a b c \u202A 1 2 3
++/* a b c \u202a 1 2 3 */
++/* a b c \u202A 1 2 3 */
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
+new file mode 100644
+index 00000000000..4f54c5092ec
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
+@@ -0,0 +1,13 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=any" } */
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
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
+new file mode 100644
+index 00000000000..e2af1b1ca97
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
+@@ -0,0 +1,29 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired" } */
++/* Test that we properly separate bidi contexts (comment/identifier/character
++   constant/string literal).  */
++
++/* LRE ->âª<- */ int pdf_\u202c_1;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLE ->â«<- */ int pdf_\u202c_2;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRO ->â­<- */ int pdf_\u202c_3;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLO ->â®<- */ int pdf_\u202c_4;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRI ->â¦<-*/ int pdi_\u2069_1;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* RLI ->â§<- */ int pdi_\u2069_12;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* FSI ->â¨<- */ int pdi_\u2069_3;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++
++const char *s1 = "LRE\u202a"; /* PDF ->â¬<- */
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++/* LRE ->âª<- */ const char *s2 = "PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++const char *s3 = "LRE\u202a"; int pdf_\u202c_5;
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
++int lre_\u202a; const char *s4 = "PDF\u202c";
++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
+diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
+index 176f8c5bbce..112b9c24751 100644
+--- a/libcpp/include/cpplib.h
++++ b/libcpp/include/cpplib.h
+@@ -318,6 +318,17 @@ enum cpp_main_search
+   CMS_system,  /* Search the system INCLUDE path.  */
+ };
+ 
++/* The possible bidirectional control characters checking levels, from least
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
+@@ -531,6 +542,10 @@ struct cpp_options
+   /* True if warn about differences between C++98 and C++11.  */
+   bool cpp_warn_cxx11_compat;
+ 
++  /* Nonzero if bidirectional control characters checking is on.  See enum
++     cpp_bidirectional_level.  */
++  unsigned char cpp_warn_bidirectional;
++
+   /* Dependency generation.  */
+   struct
+   {
+@@ -635,7 +650,8 @@ enum cpp_warning_reason {
+   CPP_W_C90_C99_COMPAT,
+   CPP_W_C11_C2X_COMPAT,
+   CPP_W_CXX11_COMPAT,
+-  CPP_W_EXPANSION_TO_DEFINED
++  CPP_W_EXPANSION_TO_DEFINED,
++  CPP_W_BIDIRECTIONAL
+ };
+ 
+ /* Callback for header lookup for HEADER, which is the name of a
+diff --git a/libcpp/init.c b/libcpp/init.c
+index 5a424e23553..f9a8f5f088f 100644
+--- a/libcpp/init.c
++++ b/libcpp/init.c
+@@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
+       = ENABLE_CANONICAL_SYSTEM_HEADERS;
+   CPP_OPTION (pfile, ext_numeric_literals) = 1;
+   CPP_OPTION (pfile, warn_date_time) = 0;
++  CPP_OPTION (pfile, cpp_warn_bidirectional) = bidirectional_unpaired;
+ 
+   /* Default CPP arithmetic to something sensible for the host for the
+      benefit of dumb users like fix-header.  */
+diff --git a/libcpp/internal.h b/libcpp/internal.h
+index 8577cab6c83..0ce0246c5a2 100644
+--- a/libcpp/internal.h
++++ b/libcpp/internal.h
+@@ -597,6 +597,13 @@ struct cpp_reader
+   /* Location identifying the main source file -- intended to be line
+      zero of said file.  */
+   location_t main_loc;
++
++  /* Returns true iff we should warn about UTF-8 bidirectional control
++     characters.  */
++  bool warn_bidi_p () const
++  {
++    return CPP_OPTION (this, cpp_warn_bidirectional) != bidirectional_none;
++  }
+ };
+ 
+ /* Character classes.  Based on the more primitive macros in safe-ctype.h.
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index fa2253d41c3..6a4fbce6030 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
+     }
+ }
+ 
++namespace bidi {
++  enum class kind {
++    NONE, LRE, RLE, LRO, RLO, LRI, RLI, FSI, PDF, PDI, LTR, RTL
++  };
++
++  /* All the UTF-8 encodings of bidi characters start with E2.  */
++  constexpr uchar utf8_start = 0xe2;
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
++    unsigned int len = vec.count ();
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
++    unsigned int len = vec.count ();
++    if (len == 0)
++      return kind::NONE;
++    return ctx_at (len - 1);
++  }
++
++  /* Return true if the current context comes from a UCN origin, that is,
++     the bidi char which started this bidi context was written as a UCN.  */
++  bool current_ctx_ucn_p ()
++  {
++    unsigned int len = vec.count ();
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
++	if (current_ctx () == kind::PDF)
++	  pop ();
++	break;
++      /* PDI terminates the scope of the last LRI, RLI, or FSI whose
++	 scope has not yet been terminated, as well as the scopes of
++	 any subsequent LREs, RLEs, LROs, or RLOs whose scopes have not
++	 yet been terminated.  */
++      case kind::PDI:
++	for (int i = vec.count () - 1; i >= 0; --i)
++	  if (ctx_at (i) == kind::PDI)
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
++/* Parse a sequence of 3 bytes starting with P and return its bidi code.  */
++
++static bidi::kind
++get_bidi_utf8 (const unsigned char *const p)
++{
++  gcc_checking_assert (p[0] == bidi::utf8_start);
++
++  if (p[1] == 0x80)
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
++  else if (p[1] == 0x81)
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
++/* Parse a UCN where P points just past \u or \U and return its bidi code.  */
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
++      if (p[0] != '0' || p[1] != '0' || p[2] != '0' || p[3] != '0')
++	return bidi::kind::NONE;
++      /* Skip 4B so we can treat \u and \U the same below.  */
++      p += 4;
++    }
++
++  /* All code points we are looking for start with 20xx.  */
++  if (p[0] != '2' || p[1] != '0')
++    return bidi::kind::NONE;
++  else if (p[2] == '2')
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
++  else if (p[2] == '6')
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
++  else if (p[2] == '0')
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
++  if (CPP_OPTION (pfile, cpp_warn_bidirectional) == bidirectional_unpaired
++      && bidi::vec.count () > 0)
++    {
++      const location_t loc
++	= linemap_position_for_column (pfile->line_table,
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
++   literal/character constant.  Warn if we've encountered a bidi character.
++   KIND says which bidi character it was; P points to it in the character
++   stream.  UCN_P is true iff this bidi character was written as a UCN.  */
++
++static void
++maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
++			 bool ucn_p)
++{
++  if (__builtin_expect (kind == bidi::kind::NONE, 1))
++    return;
++
++  const auto warn_bidi = CPP_OPTION (pfile, cpp_warn_bidirectional);
++
++  if (warn_bidi != bidirectional_none)
++    {
++      const location_t loc
++	= linemap_position_for_column (pfile->line_table,
++				       CPP_BUF_COLUMN (pfile->buffer, p));
++      /* It seems excessive to warn about a PDI/PDF that is closing
++	 an opened context because we've already warned about the
++	 opening character.  Except warn when we have a UCN x UTF-8
++	 mismatch.  */
++      if (kind == bidi::current_ctx ())
++	{
++	  if (warn_bidi == bidirectional_unpaired
++	      && bidi::current_ctx_ucn_p () != ucn_p)
++	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
++				   "UTF-8 vs UCN mismatch when closing "
++				   "a context by \"%s\"", bidi::to_str (kind));
++	}
++      else if (warn_bidi == bidirectional_any)
++	{
++	  if (kind == bidi::kind::PDF || kind == bidi::kind::PDI)
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
+   cpp_buffer *buffer = pfile->buffer;
+   const uchar *cur = buffer->cur;
+   uchar c;
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+ 
+   cur++;
+   if (*cur == '/')
+@@ -1189,7 +1508,11 @@ _cpp_skip_block_comment (cpp_reader *pfi
+       if (c == '/')
+ 	{
+ 	  if (cur[-2] == '*')
+-	    break;
++	    {
++	      if (warn_bidi_p)
++		maybe_warn_bidi_on_close (pfile, cur);
++	      break;
++	    }
+ 
+ 	  /* Warn about potential nested comments, but not if the '/'
+ 	     comes immediately before the true comment delimiter.
+@@ -1208,6 +1531,8 @@ _cpp_skip_block_comment (cpp_reader *pfi
+ 	{
+ 	  unsigned int cols;
+ 	  buffer->cur = cur - 1;
++	  if (warn_bidi_p)
++	    maybe_warn_bidi_on_close (pfile, cur);
+ 	  _cpp_process_line_notes (pfile, true);
+ 	  if (buffer->next_line >= buffer->rlimit)
+ 	    return true;
+@@ -1218,6 +1543,13 @@ _cpp_skip_block_comment (cpp_reader *pfi
+ 
+ 	  cur = buffer->cur;
+ 	}
++      /* If this is a beginning of a UTF-8 encoding, it might be
++	 a bidirectional control character.  */
++      else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
++	{
++	  bidi::kind kind = get_bidi_utf8 (cur - 1);
++	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/false);
++	}
+     }
+ 
+   buffer->cur = cur;
+@@ -1233,9 +1565,31 @@ skip_line_comment (cpp_reader *pfile)
+ {
+   cpp_buffer *buffer = pfile->buffer;
+   location_t orig_line = pfile->line_table->highest_line;
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+ 
+-  while (*buffer->cur != '\n')
+-    buffer->cur++;
++  if (!warn_bidi_p)
++    while (*buffer->cur != '\n')
++      buffer->cur++;
++  else
++    {
++      while (*buffer->cur != '\n'
++	     && *buffer->cur != bidi::utf8_start)
++	buffer->cur++;
++      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
++	{
++	  while (*buffer->cur != '\n')
++	    {
++	      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
++		{
++		  bidi::kind kind = get_bidi_utf8 (buffer->cur);
++		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++					   /*ucn_p=*/false);
++		}
++	      buffer->cur++;
++	    }
++	  maybe_warn_bidi_on_close (pfile, buffer->cur);
++	}
++    }
+ 
+   _cpp_process_line_notes (pfile, true);
+   return orig_line != pfile->line_table->highest_line;
+@@ -1317,11 +1671,13 @@ static const cppchar_t utf8_signifier =
+ 
+ /* Returns TRUE if the sequence starting at buffer->cur is valid in
+    an identifier.  FIRST is TRUE if this starts an identifier.  */
++
+ static bool
+ forms_identifier_p (cpp_reader *pfile, int first,
+ 		    struct normalize_state *state)
+ {
+   cpp_buffer *buffer = pfile->buffer;
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+ 
+   if (*buffer->cur == '$')
+     {
+@@ -1344,6 +1700,13 @@ forms_identifier_p (cpp_reader *pfile, i
+       cppchar_t s;
+       if (*buffer->cur >= utf8_signifier)
+ 	{
++	  if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0)
++	      && warn_bidi_p)
++	    {
++	      bidi::kind kind = get_bidi_utf8 (buffer->cur);
++	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++				       /*ucn_p=*/false);
++	    }
+ 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			       state, &s))
+ 	    return true;
+@@ -1352,6 +1715,13 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	       && (buffer->cur[1] == 'u' || buffer->cur[1] == 'U'))
+ 	{
+ 	  buffer->cur += 2;
++	  if (warn_bidi_p)
++	    {
++	      bidi::kind kind = get_bidi_ucn (buffer->cur,
++					      buffer->cur[-1] == 'U');
++	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
++				       /*ucn_p=*/true);
++	    }
+ 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			      state, &s, NULL, NULL))
+ 	    return true;
+@@ -1460,6 +1830,7 @@ lex_identifier (cpp_reader *pfile, const
+   const uchar *cur;
+   unsigned int len;
+   unsigned int hash = HT_HASHSTEP (0, *base);
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+ 
+   cur = pfile->buffer->cur;
+   if (! starts_ucn)
+@@ -1483,6 +1854,8 @@ lex_identifier (cpp_reader *pfile, const
+ 	    pfile->buffer->cur++;
+ 	  }
+       } while (forms_identifier_p (pfile, false, nst));
++      if (warn_bidi_p)
++	maybe_warn_bidi_on_close (pfile, pfile->buffer->cur);
+       result = _cpp_interpret_identifier (pfile, base,
+ 					  pfile->buffer->cur - base);
+       *spelling = cpp_lookup (pfile, base, pfile->buffer->cur - base);
+@@ -1719,6 +2092,7 @@ static void
+ lex_raw_string (cpp_reader *pfile, cpp_token *token, const uchar *base)
+ {
+   const uchar *pos = base;
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+ 
+   /* 'tis a pity this information isn't passed down from the lexer's
+      initial categorization of the token.  */
+@@ -1955,8 +2329,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
+ 	  pos = base = pfile->buffer->cur;
+ 	  note = &pfile->buffer->notes[pfile->buffer->cur_note];
+ 	}
++      else if (__builtin_expect ((unsigned char) c == bidi::utf8_start, 0)
++	       && warn_bidi_p)
++	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
++				 /*ucn_p=*/false);
+     }
+ 
++  if (warn_bidi_p)
++    maybe_warn_bidi_on_close (pfile, pos);
++
+   if (CPP_OPTION (pfile, user_literals))
+     {
+       /* If a string format macro, say from inttypes.h, is placed touching
+@@ -2051,15 +2432,27 @@ lex_string (cpp_reader *pfile, cpp_token
+   else
+     terminator = '>', type = CPP_HEADER_NAME;
+ 
++  const bool warn_bidi_p = pfile->warn_bidi_p ();
+   for (;;)
+     {
+       cppchar_t c = *cur++;
+ 
+       /* In #include-style directives, terminators are not escapable.  */
+       if (c == '\\' && !pfile->state.angled_headers && *cur != '\n')
+-	cur++;
++	{
++	  if ((cur[0] == 'u' || cur[0] == 'U') && warn_bidi_p)
++	    {
++	      bidi::kind kind = get_bidi_ucn (cur + 1, cur[0] == 'U');
++	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/true);
++	    }
++	  cur++;
++	}
+       else if (c == terminator)
+-	break;
++	{
++	  if (warn_bidi_p)
++	    maybe_warn_bidi_on_close (pfile, cur - 1);
++	  break;
++	}
+       else if (c == '\n')
+ 	{
+ 	  cur--;
+@@ -2076,6 +2469,11 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	}
+       else if (c == '\0')
+ 	saw_NUL = true;
++      else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
++	{
++	  bidi::kind kind = get_bidi_utf8 (cur - 1);
++	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=*/false);
++	}
+     }
+ 
+   if (saw_NUL && !pfile->state.skipping)
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
new file mode 100644
index 0000000000..2995a6fc61
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
@@ -0,0 +1,142 @@
+From 1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3 Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Tue, 2 Nov 2021 09:54:32 -0400
+Subject: [PATCH] libcpp: escape non-ASCII source bytes in -Wbidi-chars=
+ [PR103026]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+This flags rich_locations associated with -Wbidi-chars= so that
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
+  Wbidi-chars-1.c: In function âmainâ:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      6 |     /*â® } â¦if (isAdmin)â© â¦ begin admins only */
+        |                                           ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      9 |     /* end admins only â® { â¦*/
+        |                            ^
+
+  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+      6 | int LRE_âª_PDF_\u202c;
+        |               ^
+  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+      8 | int LRE_\u202a_PDF_â¬_;
+        |                   ^
+  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+     10 | const char *s1 = "LRE_âª_PDF_\u202c";
+        |                            ^
+  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+     12 | const char *s2 = "LRE_\u202a_PDF_â¬";
+        |                                 ^
+
+After:
+
+  Wbidi-chars-1.c: In function âmainâ:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
+        |                                                                           ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                                            ^
+
+  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+      6 | int LRE_<U+202A>_PDF_\u202c;
+        |                       ^
+  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+      8 | int LRE_\u202a_PDF_<U+202C>_;
+        |                   ^
+  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+     10 | const char *s1 = "LRE_<U+202A>_PDF_\u202c";
+        |                                    ^
+  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
+     12 | const char *s2 = "LRE_\u202a_PDF_<U+202C>";
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
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ libcpp/lex.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 8188e33b07d..2421d6c0f40 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -1427,9 +1427,11 @@ maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
+       const location_t loc
+ 	= linemap_position_for_column (pfile->line_table,
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
+@@ -1454,6 +1456,9 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
+       const location_t loc
+ 	= linemap_position_for_column (pfile->line_table,
+ 				       CPP_BUF_COLUMN (pfile->buffer, p));
++      rich_location rich_loc (pfile->line_table, loc);
++      rich_loc.set_escape_on_output (true);
++
+       /* It seems excessive to warn about a PDI/PDF that is closing
+ 	 an opened context because we've already warned about the
+ 	 opening character.  Except warn when we have a UCN x UTF-8
+@@ -1462,20 +1467,20 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
+ 	{
+ 	  if (warn_bidi == bidirectional_unpaired
+ 	      && bidi::current_ctx_ucn_p () != ucn_p)
+-	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
+-				   "UTF-8 vs UCN mismatch when closing "
+-				   "a context by \"%s\"", bidi::to_str (kind));
++	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
++			    "UTF-8 vs UCN mismatch when closing "
++			    "a context by \"%s\"", bidi::to_str (kind));
+ 	}
+       else if (warn_bidi == bidirectional_any)
+ 	{
+ 	  if (kind == bidi::kind::PDF || kind == bidi::kind::PDI)
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
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
new file mode 100644
index 0000000000..4999c71b64
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
@@ -0,0 +1,573 @@
+From bef32d4a28595e933f24fef378cf052a30b674a7 Mon Sep 17 00:00:00 2001
+From: David Malcolm <dmalcolm@redhat.com>
+Date: Tue, 2 Nov 2021 15:45:22 -0400
+Subject: [PATCH] libcpp: capture and underline ranges in -Wbidi-chars=
+ [PR103026]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+This patch converts the bidi::vec to use a struct so that we can
+capture location_t values for the bidirectional control characters.
+
+Before:
+
+  Wbidi-chars-1.c: In function âmainâ:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
+        |                                                                           ^
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                                            ^
+
+After:
+
+  Wbidi-chars-1.c: In function âmainâ:
+  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control characters detected [-Wbidi-chars=]
+      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
+        |       ~~~~~~~~                                ~~~~~~~~                    ^
+        |       |                                       |                           |
+        |       |                                       |                           end of bidirectional context
+        |       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT ISOLATE)
+  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control characters detected [-Wbidi-chars=]
+      9 |     /* end admins only <U+202E> { <U+2066>*/
+        |                        ~~~~~~~~   ~~~~~~~~ ^
+        |                        |          |        |
+        |                        |          |        end of bidirectional context
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
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ .../c-c++-common/Wbidi-chars-ranges.c         |  54 ++++
+ libcpp/lex.c                                  | 251 ++++++++++++++----
+ 2 files changed, 257 insertions(+), 48 deletions(-)
+ create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
+
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
+new file mode 100644
+index 00000000000..298750a2a64
+--- /dev/null
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
+@@ -0,0 +1,54 @@
++/* PR preprocessor/103026 */
++/* { dg-do compile } */
++/* { dg-options "-Wbidi-chars=unpaired -fdiagnostics-show-caret" } */
++/* Verify that we escape and underline pertinent bidirectional
++   control characters when quoting the source.  */
++
++int test_unpaired_bidi () {
++    int isAdmin = 0;
++    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
++       ~~~~~~~~                                ~~~~~~~~                    ^
++       |                                       |                           |
++       |                                       |                           end of bidirectional context
++       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT ISOLATE)
++   { dg-end-multiline-output "" }
++#endif
++
++        __builtin_printf("You are an admin.\n");
++    /* end admins only â® { â¦*/
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
++int LRE_âª_PDF_\u202c;
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++ int LRE_<U+202A>_PDF_\u202c;
++         ~~~~~~~~     ^~~~~~
++   { dg-end-multiline-output "" }
++#endif
++
++const char *s1 = "LRE_âª_PDF_\u202c";
++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
++#if 0
++   { dg-begin-multiline-output "" }
++ const char *s1 = "LRE_<U+202A>_PDF_\u202c";
++                       ~~~~~~~~     ^~~~~~
++   { dg-end-multiline-output "" }
++#endif
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 2421d6c0f40..94c36f0d014 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -1172,11 +1172,34 @@ namespace bidi {
+   /* All the UTF-8 encodings of bidi characters start with E2.  */
+   constexpr uchar utf8_start = 0xe2;
+ 
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
+ 
+   /* Close the whole comment/identifier/string literal/character constant
+      context.  */
+@@ -1193,19 +1216,19 @@ namespace bidi {
+     vec.truncate (len - 1);
+   }
+ 
+-  /* Return the context of the Ith element.  */
+-  kind ctx_at (unsigned int i)
++  /* Return the pop kind of the context of the Ith element.  */
++  kind pop_kind_at (unsigned int i)
+   {
+-    return (vec[i] & 1) ? kind::PDF : kind::PDI;
++    return vec[i].get_pop_kind ();
+   }
+ 
+-  /* Return which context is currently opened.  */
++  /* Return the pop kind of the context that is currently opened.  */
+   kind current_ctx ()
+   {
+     unsigned int len = vec.count ();
+     if (len == 0)
+       return kind::NONE;
+-    return ctx_at (len - 1);
++    return vec[len - 1].get_pop_kind ();
+   }
+ 
+   /* Return true if the current context comes from a UCN origin, that is,
+@@ -1214,11 +1237,19 @@ namespace bidi {
+   {
+     unsigned int len = vec.count ();
+     gcc_checking_assert (len > 0);
+-    return (vec[len - 1] >> 1) & 1;
++    return vec[len - 1].m_ucn;
+   }
+ 
+-  /* We've read a bidi char, update the current vector as necessary.  */
+-  void on_char (kind k, bool ucn_p)
++  location_t current_ctx_loc ()
++  {
++    unsigned int len = vec.count ();
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
+ 	for (int i = vec.count () - 1; i >= 0; --i)
+-	  if (ctx_at (i) == kind::PDI)
++	  if (pop_kind_at (i) == kind::PDI)
+ 	    {
+ 	      vec.truncate (i);
+ 	      break;
+@@ -1295,10 +1326,47 @@ namespace bidi {
+   }
+ }
+ 
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
++  size_t start_offset = CPP_BUF_COLUMN (pfile->buffer, start);
++  size_t end_offset = start_offset + num_bytes - 1;
++
++  /* Now convert to location_t, where "columns" are 1-based byte offsets.  */
++  location_t start_loc = linemap_position_for_column (pfile->line_table,
++						      start_offset + 1);
++  location_t end_loc = linemap_position_for_column (pfile->line_table,
++						     end_offset + 1);
++
++  if (start_loc == end_loc)
++    return start_loc;
++
++  source_range src_range;
++  src_range.m_start = start_loc;
++  src_range.m_finish = end_loc;
++  location_t combined_loc = COMBINE_LOCATION_DATA (pfile->line_table,
++						   start_loc,
++						   src_range,
++						   NULL);
++  return combined_loc;
++}
++
+ /* Parse a sequence of 3 bytes starting with P and return its bidi code.  */
+ 
+ static bidi::kind
+-get_bidi_utf8 (const unsigned char *const p)
++get_bidi_utf8_1 (const unsigned char *const p)
+ {
+   gcc_checking_assert (p[0] == bidi::utf8_start);
+ 
+@@ -1340,10 +1408,25 @@ get_bidi_utf8 (const unsigned char *cons
+   return bidi::kind::NONE;
+ }
+ 
++/* Parse a sequence of 3 bytes starting with P and return its bidi code.
++   If the kind is not NONE, write the location to *OUT.*/
++
++static bidi::kind
++get_bidi_utf8 (cpp_reader *pfile, const unsigned char *const p, location_t *out)
++{
++  bidi::kind result = get_bidi_utf8_1 (p);
++  if (result != bidi::kind::NONE)
++    {
++      /* We have a sequence of 3 bytes starting at P.  */
++      *out = get_location_for_byte_range_in_cur_line (pfile, p, 3);
++    }
++  return result;
++}
++
+ /* Parse a UCN where P points just past \u or \U and return its bidi code.  */
+ 
+ static bidi::kind
+-get_bidi_ucn (const unsigned char *p, bool is_U)
++get_bidi_ucn_1 (const unsigned char *p, bool is_U)
+ {
+   /* 6.4.3 Universal Character Names
+       \u hex-quad
+@@ -1412,6 +1495,62 @@ get_bidi_ucn (const unsigned char *p, bo
+   return bidi::kind::NONE;
+ }
+ 
++/* Parse a UCN where P points just past \u or \U and return its bidi code.
++   If the kind is not NONE, write the location to *OUT.*/
++
++static bidi::kind
++get_bidi_ucn (cpp_reader *pfile,  const unsigned char *p, bool is_U,
++	      location_t *out)
++{
++  bidi::kind result = get_bidi_ucn_1 (p, is_U);
++  if (result != bidi::kind::NONE)
++    {
++      const unsigned char *start = p - 2;
++      size_t num_bytes = 2 + (is_U ? 8 : 4);
++      *out = get_location_for_byte_range_in_cur_line (pfile, start, num_bytes);
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
++    for (unsigned i = 0; i < bidi::vec.count (); i++)
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
+ 	= linemap_position_for_column (pfile->line_table,
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
+ 
+ /* We're at the beginning or in the middle of an identifier/comment/string
+    literal/character constant.  Warn if we've encountered a bidi character.
+-   KIND says which bidi character it was; P points to it in the character
+-   stream.  UCN_P is true iff this bidi character was written as a UCN.  */
++   KIND says which bidi control character it was; UCN_P is true iff this bidi
++   control character was written as a UCN.  LOC is the location of the
++   character, but is only valid if KIND != bidi::kind::NONE.  */
+ 
+ static void
+-maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
+-			 bool ucn_p)
++maybe_warn_bidi_on_char (cpp_reader *pfile, bidi::kind kind,
++			 bool ucn_p, location_t loc)
+ {
+   if (__builtin_expect (kind == bidi::kind::NONE, 1))
+     return;
+@@ -1453,9 +1599,6 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 
+   if (warn_bidi != bidirectional_none)
+     {
+-      const location_t loc
+-	= linemap_position_for_column (pfile->line_table,
+-				       CPP_BUF_COLUMN (pfile->buffer, p));
+       rich_location rich_loc (pfile->line_table, loc);
+       rich_loc.set_escape_on_output (true);
+ 
+@@ -1467,9 +1610,12 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 	{
+ 	  if (warn_bidi == bidirectional_unpaired
+ 	      && bidi::current_ctx_ucn_p () != ucn_p)
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
+       else if (warn_bidi == bidirectional_any)
+ 	{
+@@ -1484,7 +1630,7 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
+ 	}
+     }
+   /* We're done with this context.  */
+-  bidi::on_char (kind, ucn_p);
++  bidi::on_char (kind, ucn_p, loc);
+ }
+ 
+ /* Skip a C-style block comment.  We find the end of the comment by
+@@ -1552,8 +1698,9 @@ _cpp_skip_block_comment (cpp_reader *pfi
+ 	 a bidirectional control character.  */
+       else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
+ 	{
+-	  bidi::kind kind = get_bidi_utf8 (cur - 1);
+-	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/false);
++	  location_t loc;
++	  bidi::kind kind = get_bidi_utf8 (pfile, cur - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
+ 	}
+     }
+ 
+@@ -1586,9 +1733,9 @@ skip_line_comment (cpp_reader *pfile)
+ 	    {
+ 	      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
+ 		{
+-		  bidi::kind kind = get_bidi_utf8 (buffer->cur);
+-		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-					   /*ucn_p=*/false);
++		  location_t loc;
++		  bidi::kind kind = get_bidi_utf8 (pfile, buffer->cur, &loc);
++		  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
+ 		}
+ 	      buffer->cur++;
+ 	    }
+@@ -1708,9 +1855,9 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	  if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0)
+ 	      && warn_bidi_p)
+ 	    {
+-	      bidi::kind kind = get_bidi_utf8 (buffer->cur);
+-	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-				       /*ucn_p=*/false);
++	      location_t loc;
++	      bidi::kind kind = get_bidi_utf8 (pfile, buffer->cur, &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
+ 	    }
+ 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			       state, &s))
+@@ -1722,10 +1869,12 @@ forms_identifier_p (cpp_reader *pfile, i
+ 	  buffer->cur += 2;
+ 	  if (warn_bidi_p)
+ 	    {
+-	      bidi::kind kind = get_bidi_ucn (buffer->cur,
+-					      buffer->cur[-1] == 'U');
+-	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
+-				       /*ucn_p=*/true);
++	      location_t loc;
++	      bidi::kind kind = get_bidi_ucn (pfile,
++					      buffer->cur,
++					      buffer->cur[-1] == 'U',
++					      &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/true, loc);
+ 	    }
+ 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
+ 			      state, &s, NULL, NULL))
+@@ -2336,8 +2485,11 @@ lex_raw_string (cpp_reader *pfile, cpp_t
+ 	}
+       else if (__builtin_expect ((unsigned char) c == bidi::utf8_start, 0)
+ 	       && warn_bidi_p)
+-	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
+-				 /*ucn_p=*/false);
++	{
++	  location_t loc;
++	  bidi::kind kind = get_bidi_utf8 (pfile, pos - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
++	}
+     }
+ 
+   if (warn_bidi_p)
+@@ -2447,8 +2599,10 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	{
+ 	  if ((cur[0] == 'u' || cur[0] == 'U') && warn_bidi_p)
+ 	    {
+-	      bidi::kind kind = get_bidi_ucn (cur + 1, cur[0] == 'U');
+-	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/true);
++	      location_t loc;
++	      bidi::kind kind = get_bidi_ucn (pfile, cur + 1, cur[0] == 'U',
++					      &loc);
++	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/true, loc);
+ 	    }
+ 	  cur++;
+ 	}
+@@ -2476,8 +2630,9 @@ lex_string (cpp_reader *pfile, cpp_token
+ 	saw_NUL = true;
+       else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
+ 	{
+-	  bidi::kind kind = get_bidi_utf8 (cur - 1);
+-	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=*/false);
++	  location_t loc;
++	  bidi::kind kind = get_bidi_utf8 (pfile, cur - 1, &loc);
++	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
+ 	}
+     }
+ 
-- 
2.31.1

