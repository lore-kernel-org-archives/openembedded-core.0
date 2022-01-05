Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Marta Rybczynska" <rybczynska@gmail.com>
Subject: [dunfell][PATCH] grub: fix CVE-2020-14372 and CVE-2020-27779
Date: Wed,  5 Jan 2022 09:40:50 +0100
Message-Id: <20220105084050.2209866-1-marta.rybczynska@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com, steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>, Marta Rybczynska <marta.rybczynska@huawei.com>

From: Marta Rybczynska <rybczynska@gmail.com>

Fix issues with grub in secure boot mode where an attacker could circumvent
secure boot by using acpi and cutmem commands. Also include patches fixing
similar issues.

Most patches are backported directly from grub. One patch
(no-insmod-on-sb.patch) comes from Debian, as the upstream implementation is
too complicated to backport.

CVE-2020-14372 description (from NVD [1]):
A flaw was found in grub2 in versions prior to 2.06, where it incorrectly
enables the usage of the ACPI command when Secure Boot is enabled.
This flaw allows an attacker with privileged access to craft a Secondary
System Description Table (SSDT) containing code to overwrite the Linux
kernel lockdown variable content directly into memory. The table is
further loaded and executed by the kernel, defeating its Secure Boot
lockdown and allowing the attacker to load unsigned code. The highest
threat from this vulnerability is to data confidentiality and integrity,
as well as system availability.

CVE-2020-27779 description (from NVD [2]):
A flaw was found in grub2 in versions prior to 2.06. The cutmem command
does not honor secure boot locking allowing an privileged attacker to
remove address ranges from memory creating an opportunity to circumvent
SecureBoot protections after proper triage about grub's memory layout.
The highest threat from this vulnerability is to data confidentiality
and integrity as well as system availability.

[1] https://nvd.nist.gov/vuln/detail/CVE-2020-14372
[2] https://nvd.nist.gov/vuln/detail/CVE-2020-27779

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../grub/files/CVE-2020-14372.patch           |  76 +++
 .../grub/files/CVE-2020-14372_1.patch         | 130 ++++++
 .../grub/files/CVE-2020-14372_2.patch         | 431 ++++++++++++++++++
 .../grub/files/CVE-2020-14372_3.patch         |  57 +++
 .../grub/files/CVE-2020-14372_4.patch         |  52 +++
 .../grub/files/CVE-2020-14372_5.patch         | 158 +++++++
 .../grub/files/CVE-2020-27779.patch           |  70 +++
 .../grub/files/CVE-2020-27779_2.patch         | 105 +++++
 .../grub/files/CVE-2020-27779_3.patch         |  37 ++
 .../grub/files/CVE-2020-27779_4.patch         |  35 ++
 .../grub/files/CVE-2020-27779_5.patch         |  62 +++
 .../grub/files/CVE-2020-27779_6.patch         |  61 +++
 .../grub/files/CVE-2020-27779_7.patch         |  65 +++
 .../grub/files/no-insmod-on-sb.patch          | 107 +++++
 meta/recipes-bsp/grub/grub2.inc               |  14 +
 15 files changed, 1460 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_1.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_5.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_5.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_6.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_7.patch
 create mode 100644 meta/recipes-bsp/grub/files/no-insmod-on-sb.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372.patch
new file mode 100644
index 0000000000..08e7666cde
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372.patch
@@ -0,0 +1,76 @@
+From 0d237c0b90f0c6d4a3662c569b2371ae3ed69574 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:41 +0200
+Subject: [PATCH] acpi: Don't register the acpi command when locked down
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The command is not allowed when lockdown is enforced. Otherwise an
+attacker can instruct the GRUB to load an SSDT table to overwrite
+the kernel lockdown configuration and later load and execute
+unsigned code.
+
+Fixes: CVE-2020-14372
+
+Reported-by: Máté Kukri <km@mkukri.xyz>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3e8e4c0549240fa209acffceb473e1e509b50c95]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi            |  5 +++++
+ grub-core/commands/acpi.c | 15 ++++++++-------
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index 0786427..47ac7ff 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -3986,6 +3986,11 @@ Normally, this command will replace the Root System Description Pointer
+ (RSDP) in the Extended BIOS Data Area to point to the new tables. If the
+ @option{--no-ebda} option is used, the new tables will be known only to
+ GRUB, but may be used by GRUB's EFI emulation.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      Otherwise an attacker can instruct the GRUB to load an SSDT table to
++      overwrite the kernel lockdown configuration and later load and execute
++      unsigned code.
+ @end deffn
+ 
+ 
+diff --git a/grub-core/commands/acpi.c b/grub-core/commands/acpi.c
+index 5a1499a..1215f2a 100644
+--- a/grub-core/commands/acpi.c
++++ b/grub-core/commands/acpi.c
+@@ -27,6 +27,7 @@
+ #include <grub/mm.h>
+ #include <grub/memory.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ #ifdef GRUB_MACHINE_EFI
+ #include <grub/efi/efi.h>
+@@ -775,13 +776,13 @@ static grub_extcmd_t cmd;
+ 
+ GRUB_MOD_INIT(acpi)
+ {
+-  cmd = grub_register_extcmd ("acpi", grub_cmd_acpi, 0,
+-			      N_("[-1|-2] [--exclude=TABLE1,TABLE2|"
+-			      "--load-only=TABLE1,TABLE2] FILE1"
+-			      " [FILE2] [...]"),
+-			      N_("Load host ACPI tables and tables "
+-			      "specified by arguments."),
+-			      options);
++  cmd = grub_register_extcmd_lockdown ("acpi", grub_cmd_acpi, 0,
++                                       N_("[-1|-2] [--exclude=TABLE1,TABLE2|"
++                                          "--load-only=TABLE1,TABLE2] FILE1"
++                                          " [FILE2] [...]"),
++                                       N_("Load host ACPI tables and tables "
++                                          "specified by arguments."),
++                                       options);
+ }
+ 
+ GRUB_MOD_FINI(acpi)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_1.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_1.patch
new file mode 100644
index 0000000000..745f335501
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_1.patch
@@ -0,0 +1,130 @@
+From fe7a13df6200bda934fcc0246458df249f1ef4f2 Mon Sep 17 00:00:00 2001
+From: Marco A Benatto <mbenatto@redhat.com>
+Date: Wed, 23 Sep 2020 11:33:33 -0400
+Subject: [PATCH] verifiers: Move verifiers API to kernel image
+
+Move verifiers API from a module to the kernel image, so it can be
+used there as well. There are no functional changes in this patch.
+
+Signed-off-by: Marco A Benatto <mbenatto@redhat.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9e95f45ceeef36fcf93cbfffcf004276883dbc99]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/Makefile.am                    | 1 +
+ grub-core/Makefile.core.def              | 6 +-----
+ grub-core/kern/main.c                    | 4 ++++
+ grub-core/{commands => kern}/verifiers.c | 8 ++------
+ include/grub/verify.h                    | 9 ++++++---
+ 5 files changed, 14 insertions(+), 14 deletions(-)
+ rename grub-core/{commands => kern}/verifiers.c (97%)
+
+diff --git a/grub-core/Makefile.am b/grub-core/Makefile.am
+index 3ea8e7f..375c30d 100644
+--- a/grub-core/Makefile.am
++++ b/grub-core/Makefile.am
+@@ -90,6 +90,7 @@ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/parser.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/partition.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/term.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/time.h
++KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/verify.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/mm_private.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/net.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/memory.h
+diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
+index 474a63e..cff02f2 100644
+--- a/grub-core/Makefile.core.def
++++ b/grub-core/Makefile.core.def
+@@ -140,6 +140,7 @@ kernel = {
+   common = kern/rescue_parser.c;
+   common = kern/rescue_reader.c;
+   common = kern/term.c;
++  common = kern/verifiers.c;
+ 
+   noemu = kern/compiler-rt.c;
+   noemu = kern/mm.c;
+@@ -942,11 +943,6 @@ module = {
+   cppflags = '-I$(srcdir)/lib/posix_wrap';
+ };
+ 
+-module = {
+-  name = verifiers;
+-  common = commands/verifiers.c;
+-};
+-
+ module = {
+   name = shim_lock;
+   common = commands/efi/shim_lock.c;
+diff --git a/grub-core/kern/main.c b/grub-core/kern/main.c
+index 9cad0c4..73967e2 100644
+--- a/grub-core/kern/main.c
++++ b/grub-core/kern/main.c
+@@ -29,6 +29,7 @@
+ #include <grub/command.h>
+ #include <grub/reader.h>
+ #include <grub/parser.h>
++#include <grub/verify.h>
+ 
+ #ifdef GRUB_MACHINE_PCBIOS
+ #include <grub/machine/memory.h>
+@@ -274,6 +275,9 @@ grub_main (void)
+   grub_printf ("Welcome to GRUB!\n\n");
+   grub_setcolorstate (GRUB_TERM_COLOR_STANDARD);
+ 
++  /* Init verifiers API. */
++  grub_verifiers_init ();
++
+   grub_load_config ();
+ 
+   grub_boot_time ("Before loading embedded modules.");
+diff --git a/grub-core/commands/verifiers.c b/grub-core/kern/verifiers.c
+similarity index 97%
+rename from grub-core/commands/verifiers.c
+rename to grub-core/kern/verifiers.c
+index 0dde481..aa3dc7c 100644
+--- a/grub-core/commands/verifiers.c
++++ b/grub-core/kern/verifiers.c
+@@ -217,12 +217,8 @@ grub_verify_string (char *str, enum grub_verify_string_type type)
+   return GRUB_ERR_NONE;
+ }
+ 
+-GRUB_MOD_INIT(verifiers)
++void
++grub_verifiers_init (void)
+ {
+   grub_file_filter_register (GRUB_FILE_FILTER_VERIFY, grub_verifiers_open);
+ }
+-
+-GRUB_MOD_FINI(verifiers)
+-{
+-  grub_file_filter_unregister (GRUB_FILE_FILTER_VERIFY);
+-}
+diff --git a/include/grub/verify.h b/include/grub/verify.h
+index ea04914..cd129c3 100644
+--- a/include/grub/verify.h
++++ b/include/grub/verify.h
+@@ -64,7 +64,10 @@ struct grub_file_verifier
+   grub_err_t (*verify_string) (char *str, enum grub_verify_string_type type);
+ };
+ 
+-extern struct grub_file_verifier *grub_file_verifiers;
++extern struct grub_file_verifier *EXPORT_VAR (grub_file_verifiers);
++
++extern void
++grub_verifiers_init (void);
+ 
+ static inline void
+ grub_verifier_register (struct grub_file_verifier *ver)
+@@ -78,7 +81,7 @@ grub_verifier_unregister (struct grub_file_verifier *ver)
+   grub_list_remove (GRUB_AS_LIST (ver));
+ }
+ 
+-grub_err_t
+-grub_verify_string (char *str, enum grub_verify_string_type type);
++extern grub_err_t
++EXPORT_FUNC (grub_verify_string) (char *str, enum grub_verify_string_type type);
+ 
+ #endif /* ! GRUB_VERIFY_HEADER */
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_2.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_2.patch
new file mode 100644
index 0000000000..a98b5d0455
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_2.patch
@@ -0,0 +1,431 @@
+From d8aac4517fef0f0188a60a2a8ff9cafdd9c7ca42 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:02 +0200
+Subject: [PATCH] kern: Add lockdown support
+
+When the GRUB starts on a secure boot platform, some commands can be
+used to subvert the protections provided by the verification mechanism and
+could lead to booting untrusted system.
+
+To prevent that situation, allow GRUB to be locked down. That way the code
+may check if GRUB has been locked down and further restrict the commands
+that are registered or what subset of their functionality could be used.
+
+The lockdown support adds the following components:
+
+* The grub_lockdown() function which can be used to lockdown GRUB if,
+  e.g., UEFI Secure Boot is enabled.
+
+* The grub_is_lockdown() function which can be used to check if the GRUB
+  was locked down.
+
+* A verifier that flags OS kernels, the GRUB modules, Device Trees and ACPI
+  tables as GRUB_VERIFY_FLAGS_DEFER_AUTH to defer verification to other
+  verifiers. These files are only successfully verified if another registered
+  verifier returns success. Otherwise, the whole verification process fails.
+
+  For example, PE/COFF binaries verification can be done by the shim_lock
+  verifier which validates the signatures using the shim_lock protocol.
+  However, the verification is not deferred directly to the shim_lock verifier.
+  The shim_lock verifier is hooked into the verification process instead.
+
+* A set of grub_{command,extcmd}_lockdown functions that can be used by
+  code registering command handlers, to only register unsafe commands if
+  the GRUB has not been locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=578c95298bcc46e0296f4c786db64c2ff26ce2cc]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.common        |  2 +
+ docs/grub-dev.texi          | 27 +++++++++++++
+ docs/grub.texi              |  8 ++++
+ grub-core/Makefile.am       |  5 ++-
+ grub-core/Makefile.core.def |  1 +
+ grub-core/commands/extcmd.c | 23 +++++++++++
+ grub-core/kern/command.c    | 24 +++++++++++
+ grub-core/kern/lockdown.c   | 80 +++++++++++++++++++++++++++++++++++++
+ include/grub/command.h      |  5 +++
+ include/grub/extcmd.h       |  7 ++++
+ include/grub/lockdown.h     | 44 ++++++++++++++++++++
+ 11 files changed, 225 insertions(+), 1 deletion(-)
+ create mode 100644 grub-core/kern/lockdown.c
+ create mode 100644 include/grub/lockdown.h
+
+diff --git a/conf/Makefile.common b/conf/Makefile.common
+index 6cd71cb..2a1a886 100644
+--- a/conf/Makefile.common
++++ b/conf/Makefile.common
+@@ -84,7 +84,9 @@ CPPFLAGS_PARTTOOL_LIST = -Dgrub_parttool_register=PARTTOOL_LIST_MARKER
+ CPPFLAGS_TERMINAL_LIST = '-Dgrub_term_register_input(...)=INPUT_TERMINAL_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_TERMINAL_LIST += '-Dgrub_term_register_output(...)=OUTPUT_TERMINAL_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST = '-Dgrub_register_command(...)=COMMAND_LIST_MARKER(__VA_ARGS__)'
++CPPFLAGS_COMMAND_LIST += '-Dgrub_register_command_lockdown(...)=COMMAND_LOCKDOWN_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST += '-Dgrub_register_extcmd(...)=EXTCOMMAND_LIST_MARKER(__VA_ARGS__)'
++CPPFLAGS_COMMAND_LIST += '-Dgrub_register_extcmd_lockdown(...)=EXTCOMMAND_LOCKDOWN_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST += '-Dgrub_register_command_p1(...)=P1COMMAND_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_FDT_LIST := '-Dgrub_fdtbus_register(...)=FDT_DRIVER_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_MARKER = $(CPPFLAGS_FS_LIST) $(CPPFLAGS_VIDEO_LIST) \
+diff --git a/docs/grub-dev.texi b/docs/grub-dev.texi
+index ee389fd..635ec72 100644
+--- a/docs/grub-dev.texi
++++ b/docs/grub-dev.texi
+@@ -86,6 +86,7 @@ This edition documents version @value{VERSION}.
+ * PFF2 Font File Format::
+ * Graphical Menu Software Design::
+ * Verifiers framework::
++* Lockdown framework::
+ * Copying This Manual::         Copying This Manual
+ * Index::
+ @end menu
+@@ -2086,6 +2087,32 @@ Optionally at the end of the file @samp{fini}, if it exists, is called with just
+ the context. If you return no error during any of @samp{init}, @samp{write} and
+ @samp{fini} then the file is considered as having succeded verification.
+ 
++@node Lockdown framework
++@chapter Lockdown framework
++
++The GRUB can be locked down, which is a restricted mode where some operations
++are not allowed. For instance, some commands cannot be used when the GRUB is
++locked down.
++
++The function
++@code{grub_lockdown()} is used to lockdown GRUB and the function
++@code{grub_is_lockdown()} function can be used to check whether lockdown is
++enabled or not. When enabled, the function returns @samp{GRUB_LOCKDOWN_ENABLED}
++and @samp{GRUB_LOCKDOWN_DISABLED} when is not enabled.
++
++The following functions can be used to register the commands that can only be
++used when lockdown is disabled:
++
++@itemize
++
++@item @code{grub_cmd_lockdown()} registers command which should not run when the
++GRUB is in lockdown mode.
++
++@item @code{grub_cmd_lockdown()} registers extended command which should not run
++when the GRUB is in lockdown mode.
++
++@end itemize
++
+ @node Copying This Manual
+ @appendix Copying This Manual
+ 
+diff --git a/docs/grub.texi b/docs/grub.texi
+index 8779507..d778bfb 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -5581,6 +5581,7 @@ environment variables and commands are listed in the same order.
+ * Using digital signatures::         Booting digitally signed code
+ * UEFI secure boot and shim::        Booting digitally signed PE files
+ * Measured Boot::                    Measuring boot components
++* Lockdown::                         Lockdown when booting on a secure setup
+ @end menu
+ 
+ @node Authentication and authorisation
+@@ -5794,6 +5795,13 @@ into @file{core.img} in order to avoid a potential gap in measurement between
+ 
+ Measured boot is currently only supported on EFI platforms.
+ 
++@node Lockdown
++@section Lockdown when booting on a secure setup
++
++The GRUB can be locked down when booted on a secure boot environment, for example
++if the UEFI secure boot is enabled. On a locked down configuration, the GRUB will
++be restricted and some operations/commands cannot be executed.
++
+ @node Platform limitations
+ @chapter Platform limitations
+ 
+diff --git a/grub-core/Makefile.am b/grub-core/Makefile.am
+index 375c30d..3096241 100644
+--- a/grub-core/Makefile.am
++++ b/grub-core/Makefile.am
+@@ -79,6 +79,7 @@ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/fs.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/i18n.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/kernel.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/list.h
++KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/lockdown.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/misc.h
+ if COND_emu
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/compiler-rt-emu.h
+@@ -376,8 +377,10 @@ command.lst: $(MARKER_FILES)
+ 	  b=`basename $$pp .marker`; \
+ 	  sed -n \
+ 	    -e "/EXTCOMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
++	    -e "/EXTCOMMAND_LOCKDOWN_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
+ 	    -e "/P1COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
+-	    -e "/COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" $$pp; \
++	    -e "/COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" \
++	    -e "/COMMAND_LOCKDOWN_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" $$pp; \
+ 	done) | sort -u > $@
+ platform_DATA += command.lst
+ CLEANFILES += command.lst
+diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
+index cff02f2..651ea2a 100644
+--- a/grub-core/Makefile.core.def
++++ b/grub-core/Makefile.core.def
+@@ -204,6 +204,7 @@ kernel = {
+   efi = term/efi/console.c;
+   efi = kern/acpi.c;
+   efi = kern/efi/acpi.c;
++  efi = kern/lockdown.c;
+   i386_coreboot = kern/i386/pc/acpi.c;
+   i386_multiboot = kern/i386/pc/acpi.c;
+   i386_coreboot = kern/acpi.c;
+diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
+index 69574e2..90a5ca2 100644
+--- a/grub-core/commands/extcmd.c
++++ b/grub-core/commands/extcmd.c
+@@ -19,6 +19,7 @@
+ 
+ #include <grub/mm.h>
+ #include <grub/list.h>
++#include <grub/lockdown.h>
+ #include <grub/misc.h>
+ #include <grub/extcmd.h>
+ #include <grub/script_sh.h>
+@@ -110,6 +111,28 @@ grub_register_extcmd (const char *name, grub_extcmd_func_t func,
+ 				    summary, description, parser, 1);
+ }
+ 
++static grub_err_t
++grub_extcmd_lockdown (grub_extcmd_context_t ctxt __attribute__ ((unused)),
++                      int argc __attribute__ ((unused)),
++                      char **argv __attribute__ ((unused)))
++{
++  return grub_error (GRUB_ERR_ACCESS_DENIED,
++                     N_("%s: the command is not allowed when lockdown is enforced"),
++                     ctxt->extcmd->cmd->name);
++}
++
++grub_extcmd_t
++grub_register_extcmd_lockdown (const char *name, grub_extcmd_func_t func,
++                               grub_command_flags_t flags, const char *summary,
++                               const char *description,
++                               const struct grub_arg_option *parser)
++{
++  if (grub_is_lockdown () == GRUB_LOCKDOWN_ENABLED)
++    func = grub_extcmd_lockdown;
++
++  return grub_register_extcmd (name, func, flags, summary, description, parser);
++}
++
+ void
+ grub_unregister_extcmd (grub_extcmd_t ext)
+ {
+diff --git a/grub-core/kern/command.c b/grub-core/kern/command.c
+index acd7218..4aabcd4 100644
+--- a/grub-core/kern/command.c
++++ b/grub-core/kern/command.c
+@@ -17,6 +17,7 @@
+  *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <grub/lockdown.h>
+ #include <grub/mm.h>
+ #include <grub/command.h>
+ 
+@@ -77,6 +78,29 @@ grub_register_command_prio (const char *name,
+   return cmd;
+ }
+ 
++static grub_err_t
++grub_cmd_lockdown (grub_command_t cmd __attribute__ ((unused)),
++                   int argc __attribute__ ((unused)),
++                   char **argv __attribute__ ((unused)))
++
++{
++  return grub_error (GRUB_ERR_ACCESS_DENIED,
++                     N_("%s: the command is not allowed when lockdown is enforced"),
++                     cmd->name);
++}
++
++grub_command_t
++grub_register_command_lockdown (const char *name,
++                                grub_command_func_t func,
++                                const char *summary,
++                                const char *description)
++{
++  if (grub_is_lockdown () == GRUB_LOCKDOWN_ENABLED)
++    func = grub_cmd_lockdown;
++
++  return grub_register_command_prio (name, func, summary, description, 0);
++}
++
+ void
+ grub_unregister_command (grub_command_t cmd)
+ {
+diff --git a/grub-core/kern/lockdown.c b/grub-core/kern/lockdown.c
+new file mode 100644
+index 0000000..1e56c0b
+--- /dev/null
++++ b/grub-core/kern/lockdown.c
+@@ -0,0 +1,80 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ *
++ */
++
++#include <grub/dl.h>
++#include <grub/file.h>
++#include <grub/lockdown.h>
++#include <grub/verify.h>
++
++static int lockdown = GRUB_LOCKDOWN_DISABLED;
++
++static grub_err_t
++lockdown_verifier_init (grub_file_t io __attribute__ ((unused)),
++                    enum grub_file_type type,
++                    void **context __attribute__ ((unused)),
++                    enum grub_verify_flags *flags)
++{
++  *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
++
++  switch (type & GRUB_FILE_TYPE_MASK)
++    {
++    case GRUB_FILE_TYPE_GRUB_MODULE:
++    case GRUB_FILE_TYPE_LINUX_KERNEL:
++    case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
++    case GRUB_FILE_TYPE_XEN_HYPERVISOR:
++    case GRUB_FILE_TYPE_BSD_KERNEL:
++    case GRUB_FILE_TYPE_XNU_KERNEL:
++    case GRUB_FILE_TYPE_PLAN9_KERNEL:
++    case GRUB_FILE_TYPE_NTLDR:
++    case GRUB_FILE_TYPE_TRUECRYPT:
++    case GRUB_FILE_TYPE_FREEDOS:
++    case GRUB_FILE_TYPE_PXECHAINLOADER:
++    case GRUB_FILE_TYPE_PCCHAINLOADER:
++    case GRUB_FILE_TYPE_COREBOOT_CHAINLOADER:
++    case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
++    case GRUB_FILE_TYPE_ACPI_TABLE:
++    case GRUB_FILE_TYPE_DEVICE_TREE_IMAGE:
++      *flags = GRUB_VERIFY_FLAGS_DEFER_AUTH;
++
++      /* Fall through. */
++
++    default:
++      return GRUB_ERR_NONE;
++    }
++}
++
++struct grub_file_verifier lockdown_verifier =
++  {
++    .name = "lockdown_verifier",
++    .init = lockdown_verifier_init,
++  };
++
++void
++grub_lockdown (void)
++{
++  lockdown = GRUB_LOCKDOWN_ENABLED;
++
++  grub_verifier_register (&lockdown_verifier);
++}
++
++int
++grub_is_lockdown (void)
++{
++  return lockdown;
++}
+diff --git a/include/grub/command.h b/include/grub/command.h
+index eee4e84..2a6f7f8 100644
+--- a/include/grub/command.h
++++ b/include/grub/command.h
+@@ -86,6 +86,11 @@ EXPORT_FUNC(grub_register_command_prio) (const char *name,
+ 					 const char *summary,
+ 					 const char *description,
+ 					 int prio);
++grub_command_t
++EXPORT_FUNC(grub_register_command_lockdown) (const char *name,
++                                             grub_command_func_t func,
++                                             const char *summary,
++                                             const char *description);
+ void EXPORT_FUNC(grub_unregister_command) (grub_command_t cmd);
+ 
+ static inline grub_command_t
+diff --git a/include/grub/extcmd.h b/include/grub/extcmd.h
+index 19fe592..fe9248b 100644
+--- a/include/grub/extcmd.h
++++ b/include/grub/extcmd.h
+@@ -62,6 +62,13 @@ grub_extcmd_t EXPORT_FUNC(grub_register_extcmd) (const char *name,
+ 						 const char *description,
+ 						 const struct grub_arg_option *parser);
+ 
++grub_extcmd_t EXPORT_FUNC(grub_register_extcmd_lockdown) (const char *name,
++                                                          grub_extcmd_func_t func,
++                                                          grub_command_flags_t flags,
++                                                          const char *summary,
++                                                          const char *description,
++                                                          const struct grub_arg_option *parser);
++
+ grub_extcmd_t EXPORT_FUNC(grub_register_extcmd_prio) (const char *name,
+ 						      grub_extcmd_func_t func,
+ 						      grub_command_flags_t flags,
+diff --git a/include/grub/lockdown.h b/include/grub/lockdown.h
+new file mode 100644
+index 0000000..40531fa
+--- /dev/null
++++ b/include/grub/lockdown.h
+@@ -0,0 +1,44 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#ifndef GRUB_LOCKDOWN_H
++#define GRUB_LOCKDOWN_H 1
++
++#include <grub/symbol.h>
++
++#define GRUB_LOCKDOWN_DISABLED       0
++#define GRUB_LOCKDOWN_ENABLED        1
++
++#ifdef GRUB_MACHINE_EFI
++extern void
++EXPORT_FUNC (grub_lockdown) (void);
++extern int
++EXPORT_FUNC (grub_is_lockdown) (void);
++#else
++static inline void
++grub_lockdown (void)
++{
++}
++
++static inline int
++grub_is_lockdown (void)
++{
++  return GRUB_LOCKDOWN_DISABLED;
++}
++#endif
++#endif /* ! GRUB_LOCKDOWN_H */
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_3.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_3.patch
new file mode 100644
index 0000000000..93fdd2cb1a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_3.patch
@@ -0,0 +1,57 @@
+From bfb9c44298aa202c176fef8dc5ea48f9b0e76e5e Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 2 Feb 2021 19:59:48 +0100
+Subject: [PATCH] kern/lockdown: Set a variable if the GRUB is locked down
+
+It may be useful for scripts to determine whether the GRUB is locked
+down or not. Add the lockdown variable which is set to "y" when the GRUB
+is locked down.
+
+Suggested-by: Dimitri John Ledkov <xnox@ubuntu.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d90367471779c240e002e62edfb6b31fc85b4908]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi            | 3 +++
+ grub-core/kern/lockdown.c | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index d778bfb..5e6cace 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -5802,6 +5802,9 @@ The GRUB can be locked down when booted on a secure boot environment, for exampl
+ if the UEFI secure boot is enabled. On a locked down configuration, the GRUB will
+ be restricted and some operations/commands cannot be executed.
+ 
++The @samp{lockdown} variable is set to @samp{y} when the GRUB is locked down.
++Otherwise it does not exit.
++
+ @node Platform limitations
+ @chapter Platform limitations
+ 
+diff --git a/grub-core/kern/lockdown.c b/grub-core/kern/lockdown.c
+index 1e56c0b..0bc70fd 100644
+--- a/grub-core/kern/lockdown.c
++++ b/grub-core/kern/lockdown.c
+@@ -18,6 +18,7 @@
+  */
+ 
+ #include <grub/dl.h>
++#include <grub/env.h>
+ #include <grub/file.h>
+ #include <grub/lockdown.h>
+ #include <grub/verify.h>
+@@ -71,6 +72,9 @@ grub_lockdown (void)
+   lockdown = GRUB_LOCKDOWN_ENABLED;
+ 
+   grub_verifier_register (&lockdown_verifier);
++
++  grub_env_set ("lockdown", "y");
++  grub_env_export ("lockdown");
+ }
+ 
+ int
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_4.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_4.patch
new file mode 100644
index 0000000000..ac509b63c7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_4.patch
@@ -0,0 +1,52 @@
+From 0d809c0979ced9db4d0e500b3e812bba95e52972 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:29 +0200
+Subject: [PATCH] efi: Lockdown the GRUB when the UEFI Secure Boot is enabled
+
+If the UEFI Secure Boot is enabled then the GRUB must be locked down
+to prevent executing code that can potentially be used to subvert its
+verification mechanisms.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=98b00a403cbf2ba6833d1ac0499871b27a08eb77]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/efi/init.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/grub-core/kern/efi/init.c b/grub-core/kern/efi/init.c
+index 3dfdf2d..db84d82 100644
+--- a/grub-core/kern/efi/init.c
++++ b/grub-core/kern/efi/init.c
+@@ -20,6 +20,7 @@
+ #include <grub/efi/efi.h>
+ #include <grub/efi/console.h>
+ #include <grub/efi/disk.h>
++#include <grub/lockdown.h>
+ #include <grub/term.h>
+ #include <grub/misc.h>
+ #include <grub/env.h>
+@@ -39,6 +40,20 @@ grub_efi_init (void)
+   /* Initialize the memory management system.  */
+   grub_efi_mm_init ();
+ 
++  /*
++   * Lockdown the GRUB and register the shim_lock verifier
++   * if the UEFI Secure Boot is enabled.
++   */
++  if (grub_efi_secure_boot ())
++    {
++      grub_lockdown ();
++      /* NOTE: Our version does not have the shim_lock_verifier,
++       * need to update below if added */
++#if 0
++      grub_shim_lock_verifier_setup ();
++#endif
++    }
++
+   efi_call_4 (grub_efi_system_table->boot_services->set_watchdog_timer,
+ 	      0, 0, 0, NULL);
+ 
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_5.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_5.patch
new file mode 100644
index 0000000000..12ec4e1c17
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_5.patch
@@ -0,0 +1,158 @@
+From 1ad728b08ba2a21573e5f81a565114f74ca33988 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:33 +0200
+Subject: [PATCH] efi: Use grub_is_lockdown() instead of hardcoding a disabled
+ modules list
+
+Now the GRUB can check if it has been locked down and this can be used to
+prevent executing commands that can be utilized to circumvent the UEFI
+Secure Boot mechanisms. So, instead of hardcoding a list of modules that
+have to be disabled, prevent the usage of commands that can be dangerous.
+
+This not only allows the commands to be disabled on other platforms, but
+also properly separate the concerns. Since the shim_lock verifier logic
+should be only about preventing to run untrusted binaries and not about
+defining these kind of policies.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=8f73052885892bc0dbc01e297f79d7cf4925e491]
+CVE: CVE-2020-14372
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi                  | 10 ++++++++++
+ grub-core/commands/i386/wrmsr.c |  5 +++--
+ grub-core/commands/iorw.c       | 19 ++++++++++---------
+ grub-core/commands/memrw.c      | 19 ++++++++++---------
+ 4 files changed, 33 insertions(+), 20 deletions(-)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index 5e6cace..0786427 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -5256,6 +5256,9 @@ only applies to the particular cpu/core/thread that runs the command.
+ Also, if you specify a reserved or unimplemented MSR address, it will
+ cause a general protection exception (which is not currently being handled)
+ and the system will reboot.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This is done to prevent subverting various security mechanisms.
+ @end deffn
+ 
+ @node xen_hypervisor
+@@ -5758,6 +5761,13 @@ security reasons. All above mentioned requirements are enforced by the
+ shim_lock module. And itself it is a persistent module which means that
+ it cannot be unloaded if it was loaded into the memory.
+ 
++All GRUB modules not stored in the @file{core.img}, OS kernels, ACPI tables,
++Device Trees, etc. have to be signed, e.g, using PGP. Additionally, the commands
++that can be used to subvert the UEFI secure boot mechanism, such as @command{iorw}
++and @command{memrw} will not be available when the UEFI secure boot is enabled.
++This is done for security reasons and are enforced by the GRUB Lockdown mechanism
++(@pxref{Lockdown}).
++
+ @node Measured Boot
+ @section Measuring boot components
+ 
+diff --git a/grub-core/commands/i386/wrmsr.c b/grub-core/commands/i386/wrmsr.c
+index 9c5e510..56a29c2 100644
+--- a/grub-core/commands/i386/wrmsr.c
++++ b/grub-core/commands/i386/wrmsr.c
+@@ -24,6 +24,7 @@
+ #include <grub/env.h>
+ #include <grub/command.h>
+ #include <grub/extcmd.h>
++#include <grub/lockdown.h>
+ #include <grub/i18n.h>
+ #include <grub/i386/cpuid.h>
+ #include <grub/i386/wrmsr.h>
+@@ -83,8 +84,8 @@ grub_cmd_msr_write (grub_command_t cmd __attribute__ ((unused)), int argc, char
+ 
+ GRUB_MOD_INIT(wrmsr)
+ {
+-  cmd_write = grub_register_command ("wrmsr", grub_cmd_msr_write, N_("ADDR VALUE"),
+-				     N_("Write a value to a CPU model specific register."));
++  cmd_write = grub_register_command_lockdown ("wrmsr", grub_cmd_msr_write, N_("ADDR VALUE"),
++                                              N_("Write a value to a CPU model specific register."));
+ }
+ 
+ GRUB_MOD_FINI(wrmsr)
+diff --git a/grub-core/commands/iorw.c b/grub-core/commands/iorw.c
+index a0c164e..584baec 100644
+--- a/grub-core/commands/iorw.c
++++ b/grub-core/commands/iorw.c
+@@ -23,6 +23,7 @@
+ #include <grub/env.h>
+ #include <grub/cpu/io.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -131,17 +132,17 @@ GRUB_MOD_INIT(memrw)
+ 			  N_("PORT"), N_("Read 32-bit value from PORT."),
+ 			  options);
+   cmd_write_byte =
+-    grub_register_command ("outb", grub_cmd_write,
+-			   N_("PORT VALUE [MASK]"),
+-			   N_("Write 8-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outb", grub_cmd_write,
++                                    N_("PORT VALUE [MASK]"),
++                                    N_("Write 8-bit VALUE to PORT."));
+   cmd_write_word =
+-    grub_register_command ("outw", grub_cmd_write,
+-			   N_("PORT VALUE [MASK]"),
+-			   N_("Write 16-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outw", grub_cmd_write,
++                                    N_("PORT VALUE [MASK]"),
++                                    N_("Write 16-bit VALUE to PORT."));
+   cmd_write_dword =
+-    grub_register_command ("outl", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 32-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outl", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 32-bit VALUE to PORT."));
+ }
+ 
+ GRUB_MOD_FINI(memrw)
+diff --git a/grub-core/commands/memrw.c b/grub-core/commands/memrw.c
+index 98769ea..d401a6d 100644
+--- a/grub-core/commands/memrw.c
++++ b/grub-core/commands/memrw.c
+@@ -22,6 +22,7 @@
+ #include <grub/extcmd.h>
+ #include <grub/env.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -133,17 +134,17 @@ GRUB_MOD_INIT(memrw)
+ 			  N_("ADDR"), N_("Read 32-bit value from ADDR."),
+ 			  options);
+   cmd_write_byte =
+-    grub_register_command ("write_byte", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 8-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_byte", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 8-bit VALUE to ADDR."));
+   cmd_write_word =
+-    grub_register_command ("write_word", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 16-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_word", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 16-bit VALUE to ADDR."));
+   cmd_write_dword =
+-    grub_register_command ("write_dword", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 32-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_dword", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 32-bit VALUE to ADDR."));
+ }
+ 
+ GRUB_MOD_FINI(memrw)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779.patch
new file mode 100644
index 0000000000..c82423b8af
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779.patch
@@ -0,0 +1,70 @@
+From 584263eca1546e5cab69ba6fe7b4b07df2630a21 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 14 Oct 2020 16:33:42 +0200
+Subject: [PATCH] mmap: Don't register cutmem and badram commands when lockdown
+ is enforced
+
+The cutmem and badram commands can be used to remove EFI memory regions
+and potentially disable the UEFI Secure Boot. Prevent the commands to be
+registered if the GRUB is locked down.
+
+Fixes: CVE-2020-27779
+
+Reported-by: Teddy Reed <teddy.reed@gmail.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d298b41f90cbf1f2e5a10e29daa1fc92ddee52c9]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi        |  4 ++++
+ grub-core/mmap/mmap.c | 13 +++++++------
+ 2 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index 47ac7ff..a1aaee6 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -4051,6 +4051,10 @@ this page is to be filtered.  This syntax makes it easy to represent patterns
+ that are often result of memory damage, due to physical distribution of memory
+ cells.
+ 
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This prevents removing EFI memory regions to potentially subvert the
++      security mechanisms provided by the UEFI secure boot.
++
+ @node blocklist
+ @subsection blocklist
+ 
+diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c
+index 57b4e9a..7ebf32e 100644
+--- a/grub-core/mmap/mmap.c
++++ b/grub-core/mmap/mmap.c
+@@ -20,6 +20,7 @@
+ #include <grub/memory.h>
+ #include <grub/machine/memory.h>
+ #include <grub/err.h>
++#include <grub/lockdown.h>
+ #include <grub/misc.h>
+ #include <grub/mm.h>
+ #include <grub/command.h>
+@@ -534,12 +535,12 @@ static grub_command_t cmd, cmd_cut;
+ 
+ GRUB_MOD_INIT(mmap)
+ {
+-  cmd = grub_register_command ("badram", grub_cmd_badram,
+-			       N_("ADDR1,MASK1[,ADDR2,MASK2[,...]]"),
+-			       N_("Declare memory regions as faulty (badram)."));
+-  cmd_cut = grub_register_command ("cutmem", grub_cmd_cutmem,
+-				   N_("FROM[K|M|G] TO[K|M|G]"),
+-				   N_("Remove any memory regions in specified range."));
++  cmd = grub_register_command_lockdown ("badram", grub_cmd_badram,
++                                        N_("ADDR1,MASK1[,ADDR2,MASK2[,...]]"),
++                                        N_("Declare memory regions as faulty (badram)."));
++  cmd_cut = grub_register_command_lockdown ("cutmem", grub_cmd_cutmem,
++                                            N_("FROM[K|M|G] TO[K|M|G]"),
++                                            N_("Remove any memory regions in specified range."));
+ 
+ }
+ 
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_2.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_2.patch
new file mode 100644
index 0000000000..e33c96a05b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_2.patch
@@ -0,0 +1,105 @@
+From 4ff1dfdf8c4c71bf4b0dd0488d9fa40ff2617f41 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 24 Feb 2021 09:00:05 +0100
+Subject: [PATCH] commands: Restrict commands that can load BIOS or DT blobs
+ when locked down
+
+There are some more commands that should be restricted when the GRUB is
+locked down. Following is the list of commands and reasons to restrict:
+
+  * fakebios:   creates BIOS-like structures for backward compatibility with
+                existing OSes. This should not be allowed when locked down.
+
+  * loadbios:   reads a BIOS dump from storage and loads it. This action
+                should not be allowed when locked down.
+
+  * devicetree: loads a Device Tree blob and passes it to the OS. It replaces
+                any Device Tree provided by the firmware. This also should
+                not be allowed when locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=468a5699b249fe6816b4e7e86c5dc9d325c9b09e]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi                    |  3 +++
+ grub-core/commands/efi/loadbios.c | 16 ++++++++--------
+ grub-core/loader/arm/linux.c      |  6 +++---
+ grub-core/loader/efi/fdt.c        |  4 ++--
+ 4 files changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index a1aaee6..ccf1908 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -4236,6 +4236,9 @@ Load a device tree blob (.dtb) from a filesystem, for later use by a Linux
+ kernel. Does not perform merging with any device tree supplied by firmware,
+ but rather replaces it completely.
+ @ref{GNU/Linux}.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This is done to prevent subverting various security mechanisms.
+ @end deffn
+ 
+ @node distrust
+diff --git a/grub-core/commands/efi/loadbios.c b/grub-core/commands/efi/loadbios.c
+index d41d521..5c7725f 100644
+--- a/grub-core/commands/efi/loadbios.c
++++ b/grub-core/commands/efi/loadbios.c
+@@ -205,14 +205,14 @@ static grub_command_t cmd_fakebios, cmd_loadbios;
+ 
+ GRUB_MOD_INIT(loadbios)
+ {
+-  cmd_fakebios = grub_register_command ("fakebios", grub_cmd_fakebios,
+-					0, N_("Create BIOS-like structures for"
+-					      " backward compatibility with"
+-					      " existing OS."));
+-
+-  cmd_loadbios = grub_register_command ("loadbios", grub_cmd_loadbios,
+-					N_("BIOS_DUMP [INT10_DUMP]"),
+-					N_("Load BIOS dump."));
++  cmd_fakebios = grub_register_command_lockdown ("fakebios", grub_cmd_fakebios,
++						 0, N_("Create BIOS-like structures for"
++						       " backward compatibility with"
++						       " existing OS."));
++
++  cmd_loadbios = grub_register_command_lockdown ("loadbios", grub_cmd_loadbios,
++						 N_("BIOS_DUMP [INT10_DUMP]"),
++						 N_("Load BIOS dump."));
+ }
+ 
+ GRUB_MOD_FINI(loadbios)
+diff --git a/grub-core/loader/arm/linux.c b/grub-core/loader/arm/linux.c
+index d70c174..ed23dc7 100644
+--- a/grub-core/loader/arm/linux.c
++++ b/grub-core/loader/arm/linux.c
+@@ -493,9 +493,9 @@ GRUB_MOD_INIT (linux)
+ 				     0, N_("Load Linux."));
+   cmd_initrd = grub_register_command ("initrd", grub_cmd_initrd,
+ 				      0, N_("Load initrd."));
+-  cmd_devicetree = grub_register_command ("devicetree", grub_cmd_devicetree,
+-					  /* TRANSLATORS: DTB stands for device tree blob.  */
+-					  0, N_("Load DTB file."));
++  cmd_devicetree = grub_register_command_lockdown ("devicetree", grub_cmd_devicetree,
++						   /* TRANSLATORS: DTB stands for device tree blob. */
++						   0, N_("Load DTB file."));
+   my_mod = mod;
+   current_fdt = (const void *) grub_arm_firmware_get_boot_data ();
+   machine_type = grub_arm_firmware_get_machine_type ();
+diff --git a/grub-core/loader/efi/fdt.c b/grub-core/loader/efi/fdt.c
+index ee9c559..003d07c 100644
+--- a/grub-core/loader/efi/fdt.c
++++ b/grub-core/loader/efi/fdt.c
+@@ -165,8 +165,8 @@ static grub_command_t cmd_devicetree;
+ GRUB_MOD_INIT (fdt)
+ {
+   cmd_devicetree =
+-    grub_register_command ("devicetree", grub_cmd_devicetree, 0,
+-			   N_("Load DTB file."));
++    grub_register_command_lockdown ("devicetree", grub_cmd_devicetree, 0,
++				    N_("Load DTB file."));
+ }
+ 
+ GRUB_MOD_FINI (fdt)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_3.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_3.patch
new file mode 100644
index 0000000000..f9a6a73ebc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_3.patch
@@ -0,0 +1,37 @@
+From e4f5c16f76e137b3beb6b61a6d2435e54fcb495c Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 24 Feb 2021 22:59:59 +0100
+Subject: [PATCH] commands/setpci: Restrict setpci command when locked down
+
+This command can set PCI devices register values, which makes it dangerous
+in a locked down configuration. Restrict it so can't be used on this setup.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=58b77d4069823b44c5fa916fa8ddfc9c4cd51e02]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/commands/setpci.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/commands/setpci.c b/grub-core/commands/setpci.c
+index d5bc97d..fa2ba7d 100644
+--- a/grub-core/commands/setpci.c
++++ b/grub-core/commands/setpci.c
+@@ -329,10 +329,10 @@ static grub_extcmd_t cmd;
+ 
+ GRUB_MOD_INIT(setpci)
+ {
+-  cmd = grub_register_extcmd ("setpci", grub_cmd_setpci, 0,
+-			      N_("[-s POSITION] [-d DEVICE] [-v VAR] "
+-				 "REGISTER[=VALUE[:MASK]]"),
+-			      N_("Manipulate PCI devices."), options);
++  cmd = grub_register_extcmd_lockdown ("setpci", grub_cmd_setpci, 0,
++				       N_("[-s POSITION] [-d DEVICE] [-v VAR] "
++					  "REGISTER[=VALUE[:MASK]]"),
++				       N_("Manipulate PCI devices."), options);
+ }
+ 
+ GRUB_MOD_FINI(setpci)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_4.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_4.patch
new file mode 100644
index 0000000000..a756f8d1cf
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_4.patch
@@ -0,0 +1,35 @@
+From 7949671de268ba3116d113778e5d770574e9f9e3 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 24 Feb 2021 12:59:29 +0100
+Subject: [PATCH] commands/hdparm: Restrict hdparm command when locked down
+
+The command can be used to get/set ATA disk parameters. Some of these can
+be dangerous since change the disk behavior. Restrict it when locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5c97492a29c6063567b65ed1a069f5e6f4e211f0]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/commands/hdparm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/commands/hdparm.c b/grub-core/commands/hdparm.c
+index d3fa966..2e2319e 100644
+--- a/grub-core/commands/hdparm.c
++++ b/grub-core/commands/hdparm.c
+@@ -436,9 +436,9 @@ static grub_extcmd_t cmd;
+ 
+ GRUB_MOD_INIT(hdparm)
+ {
+-  cmd = grub_register_extcmd ("hdparm", grub_cmd_hdparm, 0,
+-			      N_("[OPTIONS] DISK"),
+-			      N_("Get/set ATA disk parameters."), options);
++  cmd = grub_register_extcmd_lockdown ("hdparm", grub_cmd_hdparm, 0,
++				       N_("[OPTIONS] DISK"),
++				       N_("Get/set ATA disk parameters."), options);
+ }
+ 
+ GRUB_MOD_FINI(hdparm)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_5.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_5.patch
new file mode 100644
index 0000000000..b52273ff50
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_5.patch
@@ -0,0 +1,62 @@
+From 6993cce7c3a9d15e6573845f455d2f0de424a717 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 24 Feb 2021 15:03:26 +0100
+Subject: [PATCH] gdb: Restrict GDB access when locked down
+
+The gdbstub* commands allow to start and control a GDB stub running on
+local host that can be used to connect from a remote debugger. Restrict
+this functionality when the GRUB is locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=508270838998f151a82e9c13e7cb8a470a2dc23d]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/gdb/gdb.c | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/grub-core/gdb/gdb.c b/grub-core/gdb/gdb.c
+index 847a1e1..1818cb6 100644
+--- a/grub-core/gdb/gdb.c
++++ b/grub-core/gdb/gdb.c
+@@ -75,20 +75,24 @@ static grub_command_t cmd, cmd_stop, cmd_break;
+ GRUB_MOD_INIT (gdb)
+ {
+   grub_gdb_idtinit ();
+-  cmd = grub_register_command ("gdbstub", grub_cmd_gdbstub,
+-			       N_("PORT"), 
+-			       /* TRANSLATORS: GDB stub is a small part of
+-				  GDB functionality running on local host
+-				  which allows remote debugger to
+-				  connect to it.  */
+-			       N_("Start GDB stub on given port"));
+-  cmd_break = grub_register_command ("gdbstub_break", grub_cmd_gdb_break,
+-				     /* TRANSLATORS: this refers to triggering
+-					a breakpoint so that the user will land
+-					into GDB.  */
+-				     0, N_("Break into GDB"));
+-  cmd_stop = grub_register_command ("gdbstub_stop", grub_cmd_gdbstop,
+-				    0, N_("Stop GDB stub"));
++  cmd = grub_register_command_lockdown ("gdbstub", grub_cmd_gdbstub,
++					N_("PORT"),
++					/*
++					 * TRANSLATORS: GDB stub is a small part of
++					 * GDB functionality running on local host
++					 * which allows remote debugger to
++					 * connect to it.
++					 */
++					N_("Start GDB stub on given port"));
++  cmd_break = grub_register_command_lockdown ("gdbstub_break", grub_cmd_gdb_break,
++					      /*
++					       * TRANSLATORS: this refers to triggering
++					       * a breakpoint so that the user will land
++					       * into GDB.
++					       */
++					      0, N_("Break into GDB"));
++  cmd_stop = grub_register_command_lockdown ("gdbstub_stop", grub_cmd_gdbstop,
++					     0, N_("Stop GDB stub"));
+ }
+ 
+ GRUB_MOD_FINI (gdb)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_6.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_6.patch
new file mode 100644
index 0000000000..474826ade5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_6.patch
@@ -0,0 +1,61 @@
+From 73f214761cff76a18a2a867976bdd3a9adb00b67 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 24 Feb 2021 14:44:38 +0100
+Subject: [PATCH] loader/xnu: Don't allow loading extension and packages when
+ locked down
+
+The shim_lock verifier validates the XNU kernels but no its extensions
+and packages. Prevent these to be loaded when the GRUB is locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c5565135f12400a925ee901b25984e7af4442f5]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/xnu.c | 31 +++++++++++++++++--------------
+ 1 file changed, 17 insertions(+), 14 deletions(-)
+
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index 77d7060..07232d2 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -1482,20 +1482,23 @@ GRUB_MOD_INIT(xnu)
+ 				      N_("Load XNU image."));
+   cmd_kernel64 = grub_register_command ("xnu_kernel64", grub_cmd_xnu_kernel64,
+ 					0, N_("Load 64-bit XNU image."));
+-  cmd_mkext = grub_register_command ("xnu_mkext", grub_cmd_xnu_mkext, 0,
+-				     N_("Load XNU extension package."));
+-  cmd_kext = grub_register_command ("xnu_kext", grub_cmd_xnu_kext, 0,
+-				    N_("Load XNU extension."));
+-  cmd_kextdir = grub_register_command ("xnu_kextdir", grub_cmd_xnu_kextdir,
+-				       /* TRANSLATORS: OSBundleRequired is a
+-					  variable name in xnu extensions
+-					  manifests. It behaves mostly like
+-					  GNU/Linux runlevels.
+-				       */
+-				       N_("DIRECTORY [OSBundleRequired]"),
+-				       /* TRANSLATORS: There are many extensions
+-					  in extension directory.  */
+-				       N_("Load XNU extension directory."));
++  cmd_mkext = grub_register_command_lockdown ("xnu_mkext", grub_cmd_xnu_mkext, 0,
++					      N_("Load XNU extension package."));
++  cmd_kext = grub_register_command_lockdown ("xnu_kext", grub_cmd_xnu_kext, 0,
++					     N_("Load XNU extension."));
++  cmd_kextdir = grub_register_command_lockdown ("xnu_kextdir", grub_cmd_xnu_kextdir,
++						/*
++						 * TRANSLATORS: OSBundleRequired is
++						 * a variable name in xnu extensions
++						 * manifests. It behaves mostly like
++						 * GNU/Linux runlevels.
++						 */
++						N_("DIRECTORY [OSBundleRequired]"),
++						/*
++						 * TRANSLATORS: There are many extensions
++						 * in extension directory.
++						 */
++						N_("Load XNU extension directory."));
+   cmd_ramdisk = grub_register_command ("xnu_ramdisk", grub_cmd_xnu_ramdisk, 0,
+    /* TRANSLATORS: ramdisk here isn't identifier. It can be translated.  */
+ 				       N_("Load XNU ramdisk. "
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779_7.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779_7.patch
new file mode 100644
index 0000000000..e5d372a2b1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779_7.patch
@@ -0,0 +1,65 @@
+From dcc5a434e59f721b03cc809db0375a24aa2ac6d0 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Sat, 7 Nov 2020 01:03:18 +0100
+Subject: [PATCH] docs: Document the cutmem command
+
+The command is not present in the docs/grub.texi user documentation.
+
+Reported-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f05e79a0143beb2d9a482a3ebf4fe0ce76778122]
+CVE: CVE-2020-27779
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ docs/grub.texi | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index ccf1908..ae85f55 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -3892,6 +3892,7 @@ you forget a command, you can run the command @command{help}
+ * cpuid::                       Check for CPU features
+ * crc::                         Compute or check CRC32 checksums
+ * cryptomount::                 Mount a crypto device
++* cutmem::                      Remove memory regions
+ * date::                        Display or set current date and time
+ * devicetree::                  Load a device tree blob
+ * distrust::                    Remove a pubkey from trusted keys
+@@ -4051,6 +4052,8 @@ this page is to be filtered.  This syntax makes it easy to represent patterns
+ that are often result of memory damage, due to physical distribution of memory
+ cells.
+ 
++The command is similar to @command{cutmem} command.
++
+ Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
+       This prevents removing EFI memory regions to potentially subvert the
+       security mechanisms provided by the UEFI secure boot.
+@@ -4214,6 +4217,24 @@ GRUB suports devices encrypted using LUKS and geli. Note that necessary modules
+ be used.
+ @end deffn
+ 
++@node cutmem
++@subsection cutmem
++
++@deffn Command cutmem from[K|M|G] to[K|M|G]
++Remove any memory regions in specified range.
++@end deffn
++
++This command notifies the memory manager that specified regions of RAM ought to
++be filtered out. This remains in effect after a payload kernel has been loaded
++by GRUB, as long as the loaded kernel obtains its memory map from GRUB. Kernels
++that support this include Linux, GNU Mach, the kernel of FreeBSD and Multiboot
++kernels in general.
++
++The command is similar to @command{badram} command.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This prevents removing EFI memory regions to potentially subvert the
++      security mechanisms provided by the UEFI secure boot.
+ 
+ @node date
+ @subsection date
diff --git a/meta/recipes-bsp/grub/files/no-insmod-on-sb.patch b/meta/recipes-bsp/grub/files/no-insmod-on-sb.patch
new file mode 100644
index 0000000000..504352b4e3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/no-insmod-on-sb.patch
@@ -0,0 +1,107 @@
+From b5a6aa7d77439bfeb75f200abffe15c6f685c907 Mon Sep 17 00:00:00 2001
+From: Matthew Garrett <mjg@redhat.com>
+Date: Mon, 13 Jan 2014 12:13:09 +0000
+Subject: Don't permit loading modules on UEFI secure boot
+
+Author: Colin Watson <cjwatson@ubuntu.com>
+Origin: vendor, http://pkgs.fedoraproject.org/cgit/grub2.git/tree/grub-2.00-no-insmod-on-sb.patch
+Forwarded: no
+Last-Update: 2013-12-25
+
+Patch-Name: no-insmod-on-sb.patch
+
+Upstream-Status: Inappropriate [other, https://salsa.debian.org/grub-team/grub/-/blob/debian/2.04-20/debian/patches/no-insmod-on-sb.patch]
+
+Backport of a Debian (and Fedora) patch implementing a way to get secure boot status
+for CVE-2020-14372_4.patch. The upstream solution has too many dependencies to backport.
+Source: https://salsa.debian.org/grub-team/grub/-/blob/debian/2.04-20/debian/patches/no-insmod-on-sb.patch
+
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/dl.c      | 13 +++++++++++++
+ grub-core/kern/efi/efi.c | 28 ++++++++++++++++++++++++++++
+ include/grub/efi/efi.h   |  1 +
+ 3 files changed, 42 insertions(+)
+
+diff --git a/grub-core/kern/dl.c b/grub-core/kern/dl.c
+index 48eb5e7b6..074dfc3c6 100644
+--- a/grub-core/kern/dl.c
++++ b/grub-core/kern/dl.c
+@@ -38,6 +38,10 @@
+ #define GRUB_MODULES_MACHINE_READONLY
+ #endif
+ 
++#ifdef GRUB_MACHINE_EFI
++#include <grub/efi/efi.h>
++#endif
++
+ 
+ 
+ #pragma GCC diagnostic ignored "-Wcast-align"
+@@ -686,6 +690,15 @@ grub_dl_load_file (const char *filename)
+   void *core = 0;
+   grub_dl_t mod = 0;
+ 
++#ifdef GRUB_MACHINE_EFI
++  if (grub_efi_secure_boot ())
++    {
++      grub_error (GRUB_ERR_ACCESS_DENIED,
++		  "Secure Boot forbids loading module from %s", filename);
++      return 0;
++    }
++#endif
++
+   grub_boot_time ("Loading module %s", filename);
+ 
+   file = grub_file_open (filename, GRUB_FILE_TYPE_GRUB_MODULE);
+diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
+index 6e1ceb905..96204e39b 100644
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -273,6 +273,34 @@ grub_efi_get_variable (const char *var, const grub_efi_guid_t *guid,
+   return NULL;
+ }
+ 
++grub_efi_boolean_t
++grub_efi_secure_boot (void)
++{
++  grub_efi_guid_t efi_var_guid = GRUB_EFI_GLOBAL_VARIABLE_GUID;
++  grub_size_t datasize;
++  char *secure_boot = NULL;
++  char *setup_mode = NULL;
++  grub_efi_boolean_t ret = 0;
++
++  secure_boot = grub_efi_get_variable ("SecureBoot", &efi_var_guid, &datasize);
++
++  if (datasize != 1 || !secure_boot)
++    goto out;
++
++  setup_mode = grub_efi_get_variable ("SetupMode", &efi_var_guid, &datasize);
++
++  if (datasize != 1 || !setup_mode)
++    goto out;
++
++  if (*secure_boot && !*setup_mode)
++    ret = 1;
++
++ out:
++  grub_free (secure_boot);
++  grub_free (setup_mode);
++  return ret;
++}
++
+ #pragma GCC diagnostic ignored "-Wcast-align"
+ 
+ /* Search the mods section from the PE32/PE32+ image. This code uses
+diff --git a/include/grub/efi/efi.h b/include/grub/efi/efi.h
+index e90e00dc4..a237952b3 100644
+--- a/include/grub/efi/efi.h
++++ b/include/grub/efi/efi.h
+@@ -82,6 +82,7 @@ EXPORT_FUNC (grub_efi_set_variable) (const char *var,
+ 				     const grub_efi_guid_t *guid,
+ 				     void *data,
+ 				     grub_size_t datasize);
++grub_efi_boolean_t EXPORT_FUNC (grub_efi_secure_boot) (void);
+ int
+ EXPORT_FUNC (grub_efi_compare_device_paths) (const grub_efi_device_path_t *dp1,
+ 					     const grub_efi_device_path_t *dp2);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 180e3752f8..db7c23a84a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,20 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
            file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
            file://determinism.patch \
+           file://no-insmod-on-sb.patch \
+           file://CVE-2020-14372_1.patch \
+           file://CVE-2020-14372_2.patch \
+           file://CVE-2020-14372_3.patch \
+           file://CVE-2020-14372_4.patch \
+           file://CVE-2020-14372_5.patch \
+           file://CVE-2020-14372.patch \
+           file://CVE-2020-27779.patch \
+           file://CVE-2020-27779_2.patch \
+           file://CVE-2020-27779_3.patch \
+           file://CVE-2020-27779_4.patch \
+           file://CVE-2020-27779_5.patch \
+           file://CVE-2020-27779_6.patch \
+           file://CVE-2020-27779_7.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0

