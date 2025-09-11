Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89453CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 10:52:09 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.43468.1757587920485972914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 03:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 8E989E959;
	Thu, 11 Sep 2025 12:51:58 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.207]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uweu3-1ORPCi0; Thu, 11 Sep 2025 12:51:47 +0200
Date: Thu, 11 Sep 2025 12:51:41 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: openembedded-core@lists.openembedded.org
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Message-Id: <5I7F2T.KIGKW1QUPNT51@t-online.de>
In-Reply-To: <186275A42D34EEAB.19063@lists.openembedded.org>
References: <186275A42D34EEAB.19063@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-J5WsZdkkkFDkB8VtYTue"
X-TOI-EXPURGATEID: 150726::1757587907-F9FF8C1C-BFB9B8C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 0890efac-751d-493d-b1e6-d7700fbf0c37
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 10:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223268

--=-J5WsZdkkkFDkB8VtYTue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

After briefly testing the upcoming gnome environment, I believe that=20
this update should be postponed until the next release. Support for=20
girepository-1 has been completely removed from the gnome environment,=20
which does not bode well for backward compatibility. gnome-shell 48 is=20
broken with glib-2.86 at runtime, and updating to gnome-shell 49=20
requires an update to mutter, which in turn adds glycin2 as a hard=20
dependency. Despite several tests, I have not yet been able to compile=20
it. I am having problems with a 'rust error: Linker =E2=80=9Ccc=E2=80=9D no=
t found'=20
and a problem that, despite crates.inc, the network must still be=20
active during do_compile. In addition, gnome-shell 49 requires a gjs=20
update that requires mozjs140. I performed this update and it works...=20
but it is also not compatible with gnome-shell 48. Finally,=20
gnome-control-center also introduces a new cross-compile issue that I=20
have not yet investigated.

Long story short... there is still a lot to do and free time is=20
unfortunately scarce at the moment.

On Fri, Sep 5 2025 at 20:15:38 +02:00:00, Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> Overview of changes in GLib 2.86.0, 2025-09-05
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Rework how platform-specific introspected GIO APIs have to be=20
> imported to fix
>   problems with backwards-compatibility provision for it, by removing=20
> duplicate
>   platform-specific symbols from `Gio-2.0`. Users of=20
> platform-specific GIO APIs
>   should be unaffected, as `GIRepository` will now automatically=20
> import
>   `GioWin32-2.0` or `GioUnix-2.0` when asked to import `Gio-2.0`.=20
> However,
>   projects generating introspection data which depends on types from=20
> either of
>   those platform-specific GIRs must make sure they depend on those=20
> GIRs
>   explicitly, rather than just transitively depending on them through=20
> `Gio-2.0`
>   (#3744, work by Emmanuele Bassi, Marco Trevisan, Florian M=C3=BCllner,=20
> and others)
>=20
> * Fix file existence queries on Solaris, broken due to unexpected=20
> flags handling
>   within `faccessat()` (#3770, work by Niveditha Rau)
>=20
> * Bugs fixed:
>   - #3744 GDesktopAppInfo API disappeared after girepository-2.0 port=20
> (Emmanuele
>     Bassi)
>   - #3768 g_test_trap_subprocess does not check=20
> G_TEST_SUBPROCESS_INHERIT_STDIN
>     (Philip Withnall)
>   - !4751 gtestutils: Fix a slightly broken example in a doc comment
>   - !4754 Update Polish translation 250825
>   - !4758 Update Swedish translation
>   - !4762 gio: gmemorymonitorpsi: Replace GRegex with=20
> g_str_has_prefix()
>   - !4765 girepository: Add an assertion to help scan-build
>   - !4767 glocalfile: Disable faccessat()-based query_exists on=20
> Solaris
>   - !4768 gmessages: Fix win32_keep_fatal_message regression
>   - !4769 docs: Fix typos
>   - !4770 Update Chinese translation
>   - !4771 Update Georgian translation
>   - !4772 po: Update Persian translation.
>=20
> * Translation updates:
>   - Chinese (China) (lumingzh)
>   - Georgian (NorwayFun)
>   - Persian (Danial Behzadi)
>   - Polish (Piotr Dr=C4=85g)
>   - Swedish (Anders Jonsson)
>=20
> Overview of changes in GLib 2.85.4, 2025-08-22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Follow symlink (instead of overwriting it) when updating=20
> `mimeapps.list`
>   (#3579, work by Rafael Gir=C3=A3o)
>=20
> * Bugs fixed:
>   - #3579 mimeapps.list is overwritten if it is a symlink (Rafael=20
> Gir=C3=A3o)
>   - #3724 Crash in g_hash_table_add after 252645135 elements (Tobias=20
> Stoeckmann)
>   - #3743 g_utf8_validate out parameter has wrong type (two)
>   - #3751 meta: clang-format refers to a broken link (Rafael Gir=C3=A3o)
>   - #3758 Out-of-bounds read in GMemoryMonitorPoll (Philip Withnall)
>   - #3760 Stack overflow when recursing within g_log_structured() with
>     `G_LOG_FLAG_RECURSION` (Tobias Stoeckmann)
>   - #3761 Regression in g_printf() - can no longer output formatted=20
> values
>     containing NUL bytes (Luca Bacci)
>   - #3766 Update sl.po (Slovenian) (Martin)
>   - !4714 gmain: Reformat docs to fully use gi-docgen and match style=20
> guide
>   - !4720 Disable GMemoryMonitorPsi on Solaris
>   - !4727 garray: Improve and migrate documentation to gi-docgen
>   - !4735 build: Fix stp files for development versions
>   - !4736 systemtap: Use correct formatters/types
>   - !4738 docs: Add Thomas Haller as a co-maintainer of GObject
>   - !4739 Annotate ref/unref functions as transfer full
>   - !4740 gstrfuncs: Check parameter validity
>   - !4742 garray: Fix g_array_binary_search description
>   - !4743 Update Russian translation
>   - !4744 tests/gio: skip Unix socket-mock tests on Windows
>   - !4747 tests/printf: Use proper compare helper for unsigned types
>   - !4748 gconstructor: Add attribute used for TLS callback pointer
>=20
> * Translation updates:
>   - Russian (jtux270)
>   - Slovenian (Martin)
>=20
> Overview of changes in GLib 2.85.3, 2025-08-08
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Fix encoding of output from `g_print()` and `g_printerr()` when=20
> locale is set
>   to `.utf8` on Windows (#3341, work by Luca Bacci)
>=20
> * Bugs fixed:
>   - #3341 `g_print` and `g_printerr` will cause encoding errors on=20
> Windows when
>     locale is set to `.utf8` (Luca Bacci)
>   - #3739 Crash in accept_ready() of GThreadedSocketService Under=20
> High Load
>     (Philip Withnall)
>   - #3740 Documentation of g_win32_error_message  does not contain=20
> information
>     about the behaviour when FormatMessageW failed (Philip Withnall)
>   - #3755 AIX: Unwanted symbol needs to be removed for AIX platform:=20
> getpwnam_r,
>     getpwuid_r (Parth Patel)
>   - !4706 gthreadpool: Clean up when g_thread_pool_new fails
>   - !4707 tests: Skip slow mainloop test on valgrind
>   - !4708 gfilenamecompleter: Fix g_object_unref() of undefined value
>   - !4709 tests: Connect to GMemoryMonitor signals earlier
>   - !4712 tests/thread-pool: Add a thread-pool fail test
>   - !4713 Fix test error for GMemoryMonitor
>   - !4715 gdbuserror: Reformat docs to fully use gi-docgen and match=20
> style guide
>   - !4722 tests: Add missing unistd.h header to thread-pool test
>   - !4723 tests: Add a missing poll condition to socket-listener test
>   - !4724 garray: Pass errors through GByteArray functions
>   - !4725 garray: Add checks to g_ptr_array_extend_and_steal
>   - !4726 Add a basic GFilenameCompleter test
>   - !4728 gbitlock: Fix documentation issues
>   - !4729 [RFC] Tests: do not set a timeout in Python tests
>   - !4730 gstrfuncs: Always treat G_MININT64 in g_ascii_strtoll
>   - !4731 glocalfile: Disable faccessat()-based query_exists on=20
> OpenBSD
>   - !4733 gvalue: Reformat docs to fully use gi-docgen and match=20
> style guide
>   - !4734 gspawn: Improve docstring for g_spawn_async()
>=20
> Overview of changes in GLib 2.85.2, 2025-07-21
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * New Linux PSI based backend for `GMemoryMonitor` as an option to=20
> use instead
>   of the existing Low Memory Monitor daemon backend (!4481, work by=20
> Kate Hsuan)
>=20
> * Bugs fixed:
>   - #1443 Deadlock between g_module_open() and dlopen() when called=20
> from a
>     constructor
>   - #2848 Doc: clarification request regarding g_match_info_fetch_pos=20
> return
>     value (Mark Lautman)
>   - #3712 Crash in g_thread_pool_new_full
>   - #3713 call g_file_enumerator_close in g_file_enumerator_finalize=20
> is not safe
>     (fbrouille)
>   - #3716 (CVE-2025-7039) (#YWH-PGM9867-104) Buffer Under-read on=20
> GLib through
>     glib/gfileutils.c via get_tmp_file() (Michael Catanzaro)
>   - #3721 GFile leak in g_local_file_set_display_name during error=20
> handling
>     (Philip Withnall, Michael Catanzaro)
>   - #3725 Deadlock on source_destroy_lock inside=20
> g_main_context_unref() and
>     g_source_destroy() (with child sources) (Matthew Waters)
>   - #3726 GApplication sometimes fails to call before_emit (Matthias=20
> Clasen)
>   - !4481 gio: gmemorymonitorpsi: Replace GMemoryMonitor backend with=20
> kernel PSI
>     event
>   - !4665 gio: enums: Fix GBusNameOwnerFlags's annotation
>   - !4667 Incorrect output parameter handling in closure helper of
>     g_settings_bind_with_mapping_closures
>   - !4669 Add missing `(array zero-terminated=3D1)` annotations
>   - !4676 Fix IPv6 scope-id from DNS responses being lost
>   - !4680 gbacktrace: Correctly wait for children on Unix
>   - !4681 (CVE-2025-6052) gstring: Improve
>     g_string_expand/g_string_append_len_inline checks
>   - !4682 gio-tool-launch: fix %k field code expansion
>   - !4683 gio-tool-launch: Fix mismatched curly quotes in=20
> translatable strings
>   - !4684 garray: Support unallocated zero terminated arrays
>   - !4685 garray: Use g_array_elt_len/pos where appropriate
>   - !4687 gstring: Fix g_string_append_vprintf overflow
>   - !4690 garray: Fix out of boundary write in g_ptr_array_copy
>   - !4692 tests: Fix a minor leak in array-test
>   - !4693 tests: Loosen string comparison assertion in gio-tool.py
>   - !4694 tests: Do not always skip array overflow checks
>   - !4695 garray: Add more element_size > 0 checks
>   - !4698 garray: Avoid exponential growth in g_array_copy
>   - !4699 garray: Set capacity in terminated take functions
>   - !4700 gfileutils: Fix OOB read in g_build_path(name)_va
>   - !4701 gbacktrace: Fix OOB write in stack_trace
>   - !4702 gio/filenamecompleter: Fix leaks
>   - !4703 application: NULL check for options
>   - !4704 tests: Add a regression test for GApplication command line=20
> handling
>=20
> Overview of changes in GLib 2.85.1, 2025-06-13
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Re-add the option of a singleton to `GIRepository` (#3664, work by
>   Christian Hergert)
>=20
> * Add support for the `e` flag (O_CLOEXEC) to `g_fopen()` (!4564,=20
> work by
>   Luca Bacci and Philip Withnall)
>=20
> * Make the `sysprof` Meson option yield when using GLib as a=20
> subproject (!4659,
>   work by Matthias Clasen)
>=20
> * Use the Meson built-in `localedir` option (!4661, work by
>   Kleis Auke Wolthuizen)
>=20
> * Bugs fixed:
>   - #1665 g_file_trash() should return PERMISSION_DENIED if files=20
> can't be
>     deleted (Ignacy Kuchci=C5=84ski)
>   - #3664 Lack of g_irepository_get_default() equivalent makes=20
> cross-library
>     integration extremely difficult (Christian Hergert)
>   - #3698 Misleading autogenerated hints in the documentation of
>     g_async_queue_pop() (Alicia Boya Garc=C3=ADa)
>   - !4560 glib/gnulib/printf.c: Sync with gnulib
>   - !4564 gstdio: Add support for the `e` flag (O_CLOEXEC) to=20
> g_fopen()
>   - !4637 Rework Windows implementation of g_getenv()
>   - !4641 [th/gobj-drop-bit-lock] gobject: drop object_bit_lock()=20
> functions
>   - !4642 [th/gobj-empty-notify-queue] gobject: optimize notify-queue=20
> handling
>     for a single freeze
>   - !4643 GRegex: apply monospace typeface in description
>   - !4644 gio: add annotations on parameters of=20
> 'g_file_monitor_emit_event' and
>     of 'g_vfs_get_file_for_path'
>   - !4645 gregex: Clarify docs for end_pos
>   - !4646 GRegex: update class description
>   - !4649 GAsyncQueue: assert non-null data in push_sorted()
>   - !4650 tests: Add atomics to asyncqueue test global variables
>   - !4651 Meson: Add libglib_static dependency for use in tests
>   - !4652 gobject: clarify in documentation that g_value_set_boxed=20
> copies
>   - !4654 Fix buffer overflow in string-test
>   - !4655 gstring: Fix overflow check when expanding the string
>   - !4657 docs: Stop hiding the Unix-like APIs which are in=20
> Gio-2.0.gir
>   - !4658 gmarkup: make documentation more discoverable
>   - !4659 Make the sysprof feature yield
>   - !4661 meson: Use the appropriate localedir option
>=20
> Overview of changes in GLib 2.85.0, 2025-05-20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  * Preserve mode for existing file when creating a temporary file for=20
> atomic
>    updates with g_file_set_contents() (dconf#76, work by Wesley=20
> Hershberger)
>=20
>  * Fix race conditions between g_main_context_unref() and=20
> g_source_*() methods
>    (#803, work by Matthew Waters)
>=20
>  * Allow file handles inside nested containers when using the `gdbus=20
> call`
>    command (#3624, work by Julian Sparber)
>=20
>  * Fix DNS resolution of local addresses in offline mode (#3641, work=20
> by
>    Patrick Griffis)
>=20
>  * Various performance improvements to GObject locking (various MRs by
>    Thomas Haller)
>=20
>  * Prefer matches occurring earlier in the string when searching
>    `GDesktopAppInfo`s, improving search for apps in gnome-shell=20
> (!4369, work by
>    Fina Wilke)
>=20
>  * Fix thread safety of `GClosure` flags (!4575, !4577, work by Sam=20
> James and
>    Philip Withnall)
>=20
> * Bugs fixed:
>   - GNOME/dconf#76 dconf update can set incorrect permissions to=20
> dconf system db
>     (Wesley Hershberger)
>   - #490 Not clearly documented behavior of g_key_file_set_comment=20
> function.
>     (marklkram)
>   - #803 g_main_context_unref() versus g_source_*() race (Matthew=20
> Waters)
>   - #1002 GObject doesn't support removing a weak reference in a=20
> GWeakNotify for
>     the same object
>   - #1250 gsocketlistener: Fix IPv4 listen() error-handling resulting=20
> in use-
>     after-free
>   - #2377 Document that `g_socket_address_get_native_size()` can=20
> return `-1` on
>     errors
>   - #2544 Consider `g_log_always_fatal` for aborting in
>     `g_log_structured_array()` (sid)
>   - #3405 Enable -Wconversion warnings by default (progress towards=20
> this, but it
>     is not complete)
>   - #3616 docs: Broken link in GioActionEntry (Philip Withnall)
>   - #3617 Add generalised version of g_date_get_monday_week_of_year()=20
> (Philip
>     Withnall)
>   - #3624 `gdbus call` should look for file handles inside nested=20
> containers
>     (Julian Sparber)
>   - #3630 2.84.0 build failure on Linux:=20
> ../gio/gnetworkmonitornetlink.c:47:10:
>     fatal error: netlink/netlink_route.h: No such file or directory=20
> (Philip
>     Withnall)
>   - #3634 test failure with gobject-introspection 1.83.4: warning:=20
> element
>     doc:format from state 3 is unknown, ignoring (Philip Withnall)
>   - #3636 gio/trash does not handle special characters well
>   - #3641 GResolver: Local DNS resolution failure in offline mode=20
> (Patrick
>     Griffis)
>   - #3642 `g_cancellable_connect()` documentation incorrect (Marco=20
> Trevisan
>     (Trevi=C3=B1o))
>   - #3643 g_cancellable_connect(): is it safe to unref cancellable=20
> from
>     callback? (Marco Trevisan (Trevi=C3=B1o))
>   - #3649 Crash with some registry key values in GWin32AppInfo=20
> (Philip Withnall)
>   - #3656 Set SYSLOG_IDENTIFIER when logging to journald (Axel=20
> Karjalainen)
>   - #3657 girepository: Wrong typelib path on Windows
>   - #3663 Cannot use GZlibCompressor in GTK testsuite (Benjamin Otte)
>   - #3684 UAF in GSignalGroup weak notify callbacks (Thomas Haller)
>   - #3686 docs.gtk.org doesn't mention that GSourceFuncs.finalize may=20
> be NULL
>     (BZZZZ)
>   - #3693 Random failures in debian-i386-stable
>   - !4185 [th/gobject-no-object-locks-pt1-notify] use
>     `g_datalist_id_update_atomic()` instead of=20
> OPTIONAL_BIT_LOCK_NOTIFY
>   - !4247 mappedfile: Avoid some allocations
>   - !4369 gdesktopappinfo: Prefer matches that occur earlier in the=20
> match string
>   - !4387 Fix various -Wshorten-64-to-32 warnings
>   - !4484 Memory sanitizer fixes
>   - !4489 gobject: Be consistent in using atomic logic to handle the
>     GParamSpecPool
>   - !4520 [th/gdataset-cleanup] minor cleanups of gdataset
>   - !4536 [th/gobj-closure-array-atomic] use=20
> g_datalist_id_update_atomic() for
>     array of closure watches
>   - !4541 gsettings: Port docs to gi-docgen format, add missing=20
> annotations and
>     make various improvements
>   - !4544 tests: Don't install runner scripts without installed_tests
>   - !4545 Update French translation
>   - !4547 Update Catalan translation
>   - !4548 Update Turkish translation
>   - !4551 Updated Danish translation
>   - !4552 Update Persian translation
>   - !4553 docs: Document GSignalFlags members added after 2.0
>   - !4554 Update Indonesian translation
>   - !4555 tests: Add a test for g_object_freeze_notify() being called=20
> too often
>   - !4557 gfileinfo: Slightly expand docs for
>     g_file_info_get_attribute_as_string()
>   - !4558 gi: Dynamically set doc-format
>   - !4561 tests: Various fixes to create temporary files in /tmp=20
> rather than the
>     build directory
>   - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
>   - !4563 giounix-private: Fix macro for checking for epoll_create1()
>   - !4565 Fix LGPL in header
>   - !4567 gutils: make documentation of g_set_prgname() clearer
>   - !4568 docs: Add some detail
>   - !4569 Update Romanian translation
>   - !4570 gspawn-win32: Fix potential integer overflows in argv=20
> handling
>   - !4571 gvarianttype: Improve docs on type validation
>   - !4575 gclosure: fix ATOMIC_CHANGE_FIELD to read vint atomically
>   - !4577 gclosure: Allow full set of closure flags to be queried=20
> atomically
>   - !4578 [th/bit-lock-and-set] bitlock: add g_bit_lock_and_get() and
>     g_bit_unlock_and_set() API
>   - !4579 tests: Add missing unistd.h include to scannerapi.c
>   - !4581 [th/gobj-no-weak-ref-lock] drop OPTIONAL_BIT_LOCK_WEAK_REFS=20
> object
>     lock for `g_object_weak_{ref,unref}()`
>   - !4583 thread: fix Linux detection
>   - !4585 gfile: Expand documentation around file info for=20
> inaccessible files
>   - !4586 [th/gobj-doc-weakref] clear #GWeakRef earlier in
>     g_object_run_dispose() and reword docs about #GWeakRef
>   - !4588 gstring: carefully handle gssize parameters
>   - !4590 Various -Wsign-conversion warning fixes
>   - !4591 gthreadedresolver: fix crash in loopback interface check
>   - !4592 gstring: Make len_unsigned unsigned
>   - !4594 Enable -Wsign-conversion for girepository, gthread, gmodule
>   - !4596 docs: Mention how to run the test suite in CONTRIBUTING.md
>   - !4598 gtlsconnection: Fix annotation
>   - !4599 Mark pointer as (type gpointer)
>   - !4601 garray: Fix annotations
>   - !4602 docs: fix typo glong: ULONG_MAX -> LONG_MAX
>   - !4603 Fix GNetworkMonitorNetlink operation under a FreeBSD jail=20
> with shared
>     network stack
>   - !4604 cocoa: add support for GBytesIcon in notification backend
>   - !4605 gparamspecs: Use standard min/max constants rather than=20
> literals
>   - !4606 gobject, girepository: Fix several -Wsign-conversion=20
> warnings on macOS
>   - !4609 Update Portuguese translation
>   - !4610 Update Ukrainian translation
>   - !4613 Update macOS job for new CI runner
>   - !4615 shell: Handle empty comment gracefully
>   - !4619 gslist: Improve documentation for append / prepend / insert=20
> methods
>   - !4620 glocalfile: Disable faccessat()-based query_exists on=20
> Android
>   - !4621 gallocator: mark as deprecated
>   - !4627 [th/gsignalgroup-dispose] gsignalgroup: make=20
> GSignalGroup.dispose() a
>     bit more reentrant
>   - !4628 [th/gdataset-fix-zero-key] fix and cleanup related to using=20
> a zero
>     GQuark for keys in GData
>   - !4631 Update German translation
>   - !4632 win32: Only print one OS version
>   - !4633 gzlibcompressor: Convert docs to gi-docgen linking syntax
>   - !4638 docs: Fix formatting of definition lists
>=20
> * Translation updates:
>   - Catalan (Jordi Mas)
>   - Danish (Ask Hjorth Larsen)
>   - French (Vincent Chatelain)
>   - German (Philipp Kiemle)
>   - Indonesian (Andika Triwidada)
>   - Persian (Danial Behzadi)
>   - Portuguese (Hugo Carvalho)
>   - Romanian (Antonio Marin)
>   - Turkish (Sabri =C3=9Cnal)
>   - Ukrainian (Yuri Chornoivan)
>=20
> - remove backport patches
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../glib-2.0/files/CVE-2025-6052-1.patch      | 97=20
> -------------------
>  .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 -------
>  ...l_2.84.4.bb =3D> glib-2.0-initial_2.86.0.bb} |  0
>  ...{glib-2.0_2.84.4.bb =3D> glib-2.0_2.86.0.bb} |  0
>  meta/recipes-core/glib-2.0/glib.inc           |  4 +-
>  5 files changed, 1 insertion(+), 135 deletions(-)
>  delete mode 100644=20
> meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
>  delete mode 100644=20
> meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.4.bb =3D>=20
> glib-2.0-initial_2.86.0.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.4.bb =3D>=20
> glib-2.0_2.86.0.bb} (100%)
>=20
> diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch=20
> b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
> deleted file mode 100644
> index a344735ee4..0000000000
> --- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00=20
> 2001
> -From: Tobias Stoeckmann <tobias@stoeckmann.org=20
> <mailto:tobias@stoeckmann.org>>
> -Date: Mon, 7 Jul 2025 20:52:24 +0200
> -Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
> -
> -If glib is compiled with -Dglib_assert=3Dfalse, i.e. no asserts
> -enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
> -fault due to an out of boundary write.
> -
> -This happens because the overflow check was moved into
> -g_string_maybe_expand which is not called by g_string_sized_new.
> -
> -By assuming that string->allocated_len is always larger than
> -string->len (and the code would be in huge trouble if that is not=20
> true),
> -the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
> -avoid a potential G_MAXSIZE overflow.
> -
> -This in turn leads to 150-200 bytes smaller compiled library
> -depending on gcc and clang versions, and one less check for the most
> -common code paths.
> -
> -Reverts <https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655>=20
> and
> -reorders internal g_string_maybe_expand check to still fix
> -CVE-2025-6052.
> -
> -CVE: CVE-2025-6052
> -Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/glib/-/commit/6aa97beda32bb337370858862f=
4efe2f3372619f>]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com=20
> <mailto:peter.marko@siemens.com>>
> ----
> - glib/gstring.c      | 10 +++++-----
> - glib/tests/string.c | 18 ++++++++++++++++++
> - 2 files changed, 23 insertions(+), 5 deletions(-)
> -
> -diff --git a/glib/gstring.c b/glib/gstring.c
> -index 010a8e976..24c4bfb40 100644
> ---- a/glib/gstring.c
> -+++ b/glib/gstring.c
> -@@ -68,6 +68,10 @@ static void
> - g_string_expand (GString *string,
> -                  gsize    len)
> - {
> -+  /* Detect potential overflow */
> -+  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
> -+    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow",=20
> len);
> -+
> -   string->allocated_len =3D g_nearest_pow (string->len + len + 1);
> -   /* If the new size is bigger than G_MAXSIZE / 2, only allocate=20
> enough
> -    * memory for this string and don't over-allocate.
> -@@ -82,11 +86,7 @@ static inline void
> - g_string_maybe_expand (GString *string,
> -                        gsize    len)
> - {
> --  /* Detect potential overflow */
> --  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
> --    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow",=20
> len);
> --
> --  if (G_UNLIKELY (string->len + len >=3D string->allocated_len))
> -+  if (G_UNLIKELY (len >=3D string->allocated_len - string->len))
> -     g_string_expand (string, len);
> - }
> -
> -diff --git a/glib/tests/string.c b/glib/tests/string.c
> -index aa363c57a..e3bc4a02e 100644
> ---- a/glib/tests/string.c
> -+++ b/glib/tests/string.c
> -@@ -767,6 +767,23 @@ test_string_new_take_null (void)
> -   g_string_free (g_steal_pointer (&string), TRUE);
> - }
> -
> -+static void
> -+test_string_sized_new (void)
> -+{
> -+
> -+  if (g_test_subprocess ())
> -+    {
> -+      GString *string =3D g_string_sized_new (G_MAXSIZE);
> -+      g_string_free (string, TRUE);
> -+    }
> -+  else
> -+    {
> -+      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
> -+      g_test_trap_assert_failed ();
> -+      g_test_trap_assert_stderr ("*string would overflow*");
> -+    }
> -+}
> -+
> - int
> - main (int   argc,
> -       char *argv[])
> -@@ -796,6 +813,7 @@ main (int   argc,
> -   g_test_add_func ("/string/test-string-steal", test_string_steal);
> -   g_test_add_func ("/string/test-string-new-take",=20
> test_string_new_take);
> -   g_test_add_func ("/string/test-string-new-take/null",=20
> test_string_new_take_null);
> -+  g_test_add_func ("/string/sized-new", test_string_sized_new);
> -
> -   return g_test_run();
> - }
> diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch=20
> b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
> deleted file mode 100644
> index 703dfdf46c..0000000000
> --- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00=20
> 2001
> -From: Tobias Stoeckmann <tobias@stoeckmann.org=20
> <mailto:tobias@stoeckmann.org>>
> -Date: Mon, 7 Jul 2025 20:57:41 +0200
> -Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
> -
> -Use the same style for the G_LIKELY check here as in=20
> g_string_sized_new.
> -The check could overflow on 32 bit systems.
> -
> -Also improve the memcpy/memmove check to use memcpy if val itself is
> -adjacent to end + len_unsigned, which means that no overlapping=20
> exists.
> -
> -CVE: CVE-2025-6052
> -Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/glib/-/commit/3752760c5091eaed561ec11636=
b069e529533514>]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com=20
> <mailto:peter.marko@siemens.com>>
> ----
> - glib/gstring.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/glib/gstring.h b/glib/gstring.h
> -index e817176c9..c5e64b33a 100644
> ---- a/glib/gstring.h
> -+++ b/glib/gstring.h
> -@@ -232,10 +232,10 @@ g_string_append_len_inline (GString   =20
> *gstring,
> -   else
> -     len_unsigned =3D (gsize) len;
> -
> --  if (G_LIKELY (gstring->len + len_unsigned <=20
> gstring->allocated_len))
> -+  if (G_LIKELY (len_unsigned < gstring->allocated_len -=20
> gstring->len))
> -     {
> -       char *end =3D gstring->str + gstring->len;
> --      if (G_LIKELY (val + len_unsigned <=3D end || val > end +=20
> len_unsigned))
> -+      if (G_LIKELY (val + len_unsigned <=3D end || val >=3D end +=20
> len_unsigned))
> -         memcpy (end, val, len_unsigned);
> -       else
> -         memmove (end, val, len_unsigned);
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb=20
> b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb=20
> b/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
> diff --git a/meta/recipes-core/glib-2.0/glib.inc=20
> b/meta/recipes-core/glib-2.0/glib.inc
> index c80396a0f1..f9cb3417ec 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -231,14 +231,12 @@ SRC_URI =3D=20
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>            =20
> file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch=20
> <file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch/>=
=20
> \
>            =20
> file://0010-Do-not-hardcode-python-path-into-various-tools.patch=20
> <file://0010-do-not-hardcode-python-path-into-various-tools.patch/> \
>             file://skip-timeout.patch <file://skip-timeout.patch/> \
> -           file://CVE-2025-6052-1.patch=20
> <file://cve-2025-6052-1.patch/> \
> -           file://CVE-2025-6052-2.patch=20
> <file://cve-2025-6052-2.patch/> \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch=20
> <file://relocate-modules.patch/> \
>                                 =20
> file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch=20
> <file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch/>=
=20
> \
>                                "
>=20
> -SRC_URI[sha256sum] =3D=20
> "8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90"
> +SRC_URI[sha256sum] =3D=20
> "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
>=20
>  # Find any meson cross files in FILESPATH that are relevant for the=20
> current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.50.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223035):=20
> <https://lists.openembedded.org/g/openembedded-core/message/223035>
> Mute This Topic: <https://lists.openembedded.org/mt/115087264/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-J5WsZdkkkFDkB8VtYTue
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>After briefly testing the upc=
oming gnome environment, I believe that this update should be postponed unt=
il the next release. Support for girepository-1 has been completely removed=
 from the gnome environment, which does not bode well for backward compatib=
ility. gnome-shell 48 is broken with glib-2.86 at runtime, and updating to =
gnome-shell 49 requires an update to mutter, which in turn adds glycin2 as =
a hard dependency. Despite several tests, I have not yet been able to compi=
le it. I am having problems with a 'rust error: Linker =E2=80=9Ccc=E2=80=9D=
 not found' and a problem that, despite crates.inc, the network must still =
be active during do_compile. In addition, gnome-shell 49 requires a gjs upd=
ate that requires mozjs140. I performed this update and it works... but it =
is also not compatible with gnome-shell 48. Finally, gnome-control-center a=
lso introduces a new cross-compile issue that I have not yet investigated.<=
/div><div><br></div><div>Long story short... there is still a lot to do and=
 free time is unfortunately scarce at the moment.</div></div></div><div id=
=3D"geary-quote" dir=3D"auto"><br>On Fri, Sep 5 2025 at 20:15:38 +02:00:00,=
 Markus Volk via lists.openembedded.org &lt;f_l_k=3Dt-online.de@lists.opene=
mbedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext=
" style=3D"white-space: break-spaces;">Overview of changes in GLib 2.86.0, =
2025-09-05
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Rework how platform-specific introspected GIO APIs have to be imported to=
 fix
  problems with backwards-compatibility provision for it, by removing dupli=
cate
  platform-specific symbols from `Gio-2.0`. Users of platform-specific GIO =
APIs
  should be unaffected, as `GIRepository` will now automatically import
  `GioWin32-2.0` or `GioUnix-2.0` when asked to import `Gio-2.0`. However,
  projects generating introspection data which depends on types from either=
 of
  those platform-specific GIRs must make sure they depend on those GIRs
  explicitly, rather than just transitively depending on them through `Gio-=
2.0`
  (#3744, work by Emmanuele Bassi, Marco Trevisan, Florian M=C3=BCllner, an=
d others)

* Fix file existence queries on Solaris, broken due to unexpected flags han=
dling
  within `faccessat()` (#3770, work by Niveditha Rau)

* Bugs fixed:
  - #3744 GDesktopAppInfo API disappeared after girepository-2.0 port (Emma=
nuele
    Bassi)
  - #3768 g_test_trap_subprocess does not check G_TEST_SUBPROCESS_INHERIT_S=
TDIN
    (Philip Withnall)
  - !4751 gtestutils: Fix a slightly broken example in a doc comment
  - !4754 Update Polish translation 250825
  - !4758 Update Swedish translation
  - !4762 gio: gmemorymonitorpsi: Replace GRegex with g_str_has_prefix()
  - !4765 girepository: Add an assertion to help scan-build
  - !4767 glocalfile: Disable faccessat()-based query_exists on Solaris
  - !4768 gmessages: Fix win32_keep_fatal_message regression
  - !4769 docs: Fix typos
  - !4770 Update Chinese translation
  - !4771 Update Georgian translation
  - !4772 po: Update Persian translation.

* Translation updates:
  - Chinese (China) (lumingzh)
  - Georgian (NorwayFun)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Swedish (Anders Jonsson)

Overview of changes in GLib 2.85.4, 2025-08-22
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Follow symlink (instead of overwriting it) when updating `mimeapps.list`
  (#3579, work by Rafael Gir=C3=A3o)

* Bugs fixed:
  - #3579 mimeapps.list is overwritten if it is a symlink (Rafael Gir=C3=A3=
o)
  - #3724 Crash in g_hash_table_add after 252645135 elements (Tobias Stoeck=
mann)
  - #3743 g_utf8_validate out parameter has wrong type (two)
  - #3751 meta: clang-format refers to a broken link (Rafael Gir=C3=A3o)
  - #3758 Out-of-bounds read in GMemoryMonitorPoll (Philip Withnall)
  - #3760 Stack overflow when recursing within g_log_structured() with
    `G_LOG_FLAG_RECURSION` (Tobias Stoeckmann)
  - #3761 Regression in g_printf() - can no longer output formatted values
    containing NUL bytes (Luca Bacci)
  - #3766 Update sl.po (Slovenian) (Martin)
  - !4714 gmain: Reformat docs to fully use gi-docgen and match style guide
  - !4720 Disable GMemoryMonitorPsi on Solaris
  - !4727 garray: Improve and migrate documentation to gi-docgen
  - !4735 build: Fix stp files for development versions
  - !4736 systemtap: Use correct formatters/types
  - !4738 docs: Add Thomas Haller as a co-maintainer of GObject
  - !4739 Annotate ref/unref functions as transfer full
  - !4740 gstrfuncs: Check parameter validity
  - !4742 garray: Fix g_array_binary_search description
  - !4743 Update Russian translation
  - !4744 tests/gio: skip Unix socket-mock tests on Windows
  - !4747 tests/printf: Use proper compare helper for unsigned types
  - !4748 gconstructor: Add attribute used for TLS callback pointer

* Translation updates:
  - Russian (jtux270)
  - Slovenian (Martin)

Overview of changes in GLib 2.85.3, 2025-08-08
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix encoding of output from `g_print()` and `g_printerr()` when locale is=
 set
  to `.utf8` on Windows (#3341, work by Luca Bacci)

* Bugs fixed:
  - #3341 `g_print` and `g_printerr` will cause encoding errors on Windows =
when
    locale is set to `.utf8` (Luca Bacci)
  - #3739 Crash in accept_ready() of GThreadedSocketService Under High Load
    (Philip Withnall)
  - #3740 Documentation of g_win32_error_message  does not contain informat=
ion
    about the behaviour when FormatMessageW failed (Philip Withnall)
  - #3755 AIX: Unwanted symbol needs to be removed for AIX platform: getpwn=
am_r,
    getpwuid_r (Parth Patel)
  - !4706 gthreadpool: Clean up when g_thread_pool_new fails
  - !4707 tests: Skip slow mainloop test on valgrind
  - !4708 gfilenamecompleter: Fix g_object_unref() of undefined value
  - !4709 tests: Connect to GMemoryMonitor signals earlier
  - !4712 tests/thread-pool: Add a thread-pool fail test
  - !4713 Fix test error for GMemoryMonitor
  - !4715 gdbuserror: Reformat docs to fully use gi-docgen and match style =
guide
  - !4722 tests: Add missing unistd.h header to thread-pool test
  - !4723 tests: Add a missing poll condition to socket-listener test
  - !4724 garray: Pass errors through GByteArray functions
  - !4725 garray: Add checks to g_ptr_array_extend_and_steal
  - !4726 Add a basic GFilenameCompleter test
  - !4728 gbitlock: Fix documentation issues
  - !4729 [RFC] Tests: do not set a timeout in Python tests
  - !4730 gstrfuncs: Always treat G_MININT64 in g_ascii_strtoll
  - !4731 glocalfile: Disable faccessat()-based query_exists on OpenBSD
  - !4733 gvalue: Reformat docs to fully use gi-docgen and match style guid=
e
  - !4734 gspawn: Improve docstring for g_spawn_async()

Overview of changes in GLib 2.85.2, 2025-07-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* New Linux PSI based backend for `GMemoryMonitor` as an option to use inst=
ead
  of the existing Low Memory Monitor daemon backend (!4481, work by Kate Hs=
uan)

* Bugs fixed:
  - #1443 Deadlock between g_module_open() and dlopen() when called from a
    constructor
  - #2848 Doc: clarification request regarding g_match_info_fetch_pos retur=
n
    value (Mark Lautman)
  - #3712 Crash in g_thread_pool_new_full
  - #3713 call g_file_enumerator_close in g_file_enumerator_finalize is not=
 safe
    (fbrouille)
  - #3716 (CVE-2025-7039) (#YWH-PGM9867-104) Buffer Under-read on GLib thro=
ugh
    glib/gfileutils.c via get_tmp_file() (Michael Catanzaro)
  - #3721 GFile leak in g_local_file_set_display_name during error handling
    (Philip Withnall, Michael Catanzaro)
  - #3725 Deadlock on source_destroy_lock inside g_main_context_unref() and
    g_source_destroy() (with child sources) (Matthew Waters)
  - #3726 GApplication sometimes fails to call before_emit (Matthias Clasen=
)
  - !4481 gio: gmemorymonitorpsi: Replace GMemoryMonitor backend with kerne=
l PSI
    event
  - !4665 gio: enums: Fix GBusNameOwnerFlags's annotation
  - !4667 Incorrect output parameter handling in closure helper of
    g_settings_bind_with_mapping_closures
  - !4669 Add missing `(array zero-terminated=3D1)` annotations
  - !4676 Fix IPv6 scope-id from DNS responses being lost
  - !4680 gbacktrace: Correctly wait for children on Unix
  - !4681 (CVE-2025-6052) gstring: Improve
    g_string_expand/g_string_append_len_inline checks
  - !4682 gio-tool-launch: fix %k field code expansion
  - !4683 gio-tool-launch: Fix mismatched curly quotes in translatable stri=
ngs
  - !4684 garray: Support unallocated zero terminated arrays
  - !4685 garray: Use g_array_elt_len/pos where appropriate
  - !4687 gstring: Fix g_string_append_vprintf overflow
  - !4690 garray: Fix out of boundary write in g_ptr_array_copy
  - !4692 tests: Fix a minor leak in array-test
  - !4693 tests: Loosen string comparison assertion in gio-tool.py
  - !4694 tests: Do not always skip array overflow checks
  - !4695 garray: Add more element_size &gt; 0 checks
  - !4698 garray: Avoid exponential growth in g_array_copy
  - !4699 garray: Set capacity in terminated take functions
  - !4700 gfileutils: Fix OOB read in g_build_path(name)_va
  - !4701 gbacktrace: Fix OOB write in stack_trace
  - !4702 gio/filenamecompleter: Fix leaks
  - !4703 application: NULL check for options
  - !4704 tests: Add a regression test for GApplication command line handli=
ng

Overview of changes in GLib 2.85.1, 2025-06-13
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Re-add the option of a singleton to `GIRepository` (#3664, work by
  Christian Hergert)

* Add support for the `e` flag (O_CLOEXEC) to `g_fopen()` (!4564, work by
  Luca Bacci and Philip Withnall)

* Make the `sysprof` Meson option yield when using GLib as a subproject (!4=
659,
  work by Matthias Clasen)

* Use the Meson built-in `localedir` option (!4661, work by
  Kleis Auke Wolthuizen)

* Bugs fixed:
  - #1665 g_file_trash() should return PERMISSION_DENIED if files can't be
    deleted (Ignacy Kuchci=C5=84ski)
  - #3664 Lack of g_irepository_get_default() equivalent makes cross-librar=
y
    integration extremely difficult (Christian Hergert)
  - #3698 Misleading autogenerated hints in the documentation of
    g_async_queue_pop() (Alicia Boya Garc=C3=ADa)
  - !4560 glib/gnulib/printf.c: Sync with gnulib
  - !4564 gstdio: Add support for the `e` flag (O_CLOEXEC) to g_fopen()
  - !4637 Rework Windows implementation of g_getenv()
  - !4641 [th/gobj-drop-bit-lock] gobject: drop object_bit_lock() functions
  - !4642 [th/gobj-empty-notify-queue] gobject: optimize notify-queue handl=
ing
    for a single freeze
  - !4643 GRegex: apply monospace typeface in description
  - !4644 gio: add annotations on parameters of 'g_file_monitor_emit_event'=
 and
    of 'g_vfs_get_file_for_path'
  - !4645 gregex: Clarify docs for end_pos
  - !4646 GRegex: update class description
  - !4649 GAsyncQueue: assert non-null data in push_sorted()
  - !4650 tests: Add atomics to asyncqueue test global variables
  - !4651 Meson: Add libglib_static dependency for use in tests
  - !4652 gobject: clarify in documentation that g_value_set_boxed copies
  - !4654 Fix buffer overflow in string-test
  - !4655 gstring: Fix overflow check when expanding the string
  - !4657 docs: Stop hiding the Unix-like APIs which are in Gio-2.0.gir
  - !4658 gmarkup: make documentation more discoverable
  - !4659 Make the sysprof feature yield
  - !4661 meson: Use the appropriate localedir option

Overview of changes in GLib 2.85.0, 2025-05-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Preserve mode for existing file when creating a temporary file for atomi=
c
   updates with g_file_set_contents() (dconf#76, work by Wesley Hershberger=
)

 * Fix race conditions between g_main_context_unref() and g_source_*() meth=
ods
   (#803, work by Matthew Waters)

 * Allow file handles inside nested containers when using the `gdbus call`
   command (#3624, work by Julian Sparber)

 * Fix DNS resolution of local addresses in offline mode (#3641, work by
   Patrick Griffis)

 * Various performance improvements to GObject locking (various MRs by
   Thomas Haller)

 * Prefer matches occurring earlier in the string when searching
   `GDesktopAppInfo`s, improving search for apps in gnome-shell (!4369, wor=
k by
   Fina Wilke)

 * Fix thread safety of `GClosure` flags (!4575, !4577, work by Sam James a=
nd
   Philip Withnall)

* Bugs fixed:
  - GNOME/dconf#76 dconf update can set incorrect permissions to dconf syst=
em db
    (Wesley Hershberger)
  - #490 Not clearly documented behavior of g_key_file_set_comment function=
.
    (marklkram)
  - #803 g_main_context_unref() versus g_source_*() race (Matthew Waters)
  - #1002 GObject doesn't support removing a weak reference in a GWeakNotif=
y for
    the same object
  - #1250 gsocketlistener: Fix IPv4 listen() error-handling resulting in us=
e-
    after-free
  - #2377 Document that `g_socket_address_get_native_size()` can return `-1=
` on
    errors
  - #2544 Consider `g_log_always_fatal` for aborting in
    `g_log_structured_array()` (sid)
  - #3405 Enable -Wconversion warnings by default (progress towards this, b=
ut it
    is not complete)
  - #3616 docs: Broken link in GioActionEntry (Philip Withnall)
  - #3617 Add generalised version of g_date_get_monday_week_of_year() (Phil=
ip
    Withnall)
  - #3624 `gdbus call` should look for file handles inside nested container=
s
    (Julian Sparber)
  - #3630 2.84.0 build failure on Linux: ../gio/gnetworkmonitornetlink.c:47=
:10:
    fatal error: netlink/netlink_route.h: No such file or directory (Philip
    Withnall)
  - #3634 test failure with gobject-introspection 1.83.4: warning: element
    doc:format from state 3 is unknown, ignoring (Philip Withnall)
  - #3636 gio/trash does not handle special characters well
  - #3641 GResolver: Local DNS resolution failure in offline mode (Patrick
    Griffis)
  - #3642 `g_cancellable_connect()` documentation incorrect (Marco Trevisan
    (Trevi=C3=B1o))
  - #3643 g_cancellable_connect(): is it safe to unref cancellable from
    callback? (Marco Trevisan (Trevi=C3=B1o))
  - #3649 Crash with some registry key values in GWin32AppInfo (Philip With=
nall)
  - #3656 Set SYSLOG_IDENTIFIER when logging to journald (Axel Karjalainen)
  - #3657 girepository: Wrong typelib path on Windows
  - #3663 Cannot use GZlibCompressor in GTK testsuite (Benjamin Otte)
  - #3684 UAF in GSignalGroup weak notify callbacks (Thomas Haller)
  - #3686 docs.gtk.org doesn't mention that GSourceFuncs.finalize may be NU=
LL
    (BZZZZ)
  - #3693 Random failures in debian-i386-stable
  - !4185 [th/gobject-no-object-locks-pt1-notify] use
    `g_datalist_id_update_atomic()` instead of OPTIONAL_BIT_LOCK_NOTIFY
  - !4247 mappedfile: Avoid some allocations
  - !4369 gdesktopappinfo: Prefer matches that occur earlier in the match s=
tring
  - !4387 Fix various -Wshorten-64-to-32 warnings
  - !4484 Memory sanitizer fixes
  - !4489 gobject: Be consistent in using atomic logic to handle the
    GParamSpecPool
  - !4520 [th/gdataset-cleanup] minor cleanups of gdataset
  - !4536 [th/gobj-closure-array-atomic] use g_datalist_id_update_atomic() =
for
    array of closure watches
  - !4541 gsettings: Port docs to gi-docgen format, add missing annotations=
 and
    make various improvements
  - !4544 tests: Don't install runner scripts without installed_tests
  - !4545 Update French translation
  - !4547 Update Catalan translation
  - !4548 Update Turkish translation
  - !4551 Updated Danish translation
  - !4552 Update Persian translation
  - !4553 docs: Document GSignalFlags members added after 2.0
  - !4554 Update Indonesian translation
  - !4555 tests: Add a test for g_object_freeze_notify() being called too o=
ften
  - !4557 gfileinfo: Slightly expand docs for
    g_file_info_get_attribute_as_string()
  - !4558 gi: Dynamically set doc-format
  - !4561 tests: Various fixes to create temporary files in /tmp rather tha=
n the
    build directory
  - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
  - !4563 giounix-private: Fix macro for checking for epoll_create1()
  - !4565 Fix LGPL in header
  - !4567 gutils: make documentation of g_set_prgname() clearer
  - !4568 docs: Add some detail
  - !4569 Update Romanian translation
  - !4570 gspawn-win32: Fix potential integer overflows in argv handling
  - !4571 gvarianttype: Improve docs on type validation
  - !4575 gclosure: fix ATOMIC_CHANGE_FIELD to read vint atomically
  - !4577 gclosure: Allow full set of closure flags to be queried atomicall=
y
  - !4578 [th/bit-lock-and-set] bitlock: add g_bit_lock_and_get() and
    g_bit_unlock_and_set() API
  - !4579 tests: Add missing unistd.h include to scannerapi.c
  - !4581 [th/gobj-no-weak-ref-lock] drop OPTIONAL_BIT_LOCK_WEAK_REFS objec=
t
    lock for `g_object_weak_{ref,unref}()`
  - !4583 thread: fix Linux detection
  - !4585 gfile: Expand documentation around file info for inaccessible fil=
es
  - !4586 [th/gobj-doc-weakref] clear #GWeakRef earlier in
    g_object_run_dispose() and reword docs about #GWeakRef
  - !4588 gstring: carefully handle gssize parameters
  - !4590 Various -Wsign-conversion warning fixes
  - !4591 gthreadedresolver: fix crash in loopback interface check
  - !4592 gstring: Make len_unsigned unsigned
  - !4594 Enable -Wsign-conversion for girepository, gthread, gmodule
  - !4596 docs: Mention how to run the test suite in CONTRIBUTING.md
  - !4598 gtlsconnection: Fix annotation
  - !4599 Mark pointer as (type gpointer)
  - !4601 garray: Fix annotations
  - !4602 docs: fix typo glong: ULONG_MAX -&gt; LONG_MAX
  - !4603 Fix GNetworkMonitorNetlink operation under a FreeBSD jail with sh=
ared
    network stack
  - !4604 cocoa: add support for GBytesIcon in notification backend
  - !4605 gparamspecs: Use standard min/max constants rather than literals
  - !4606 gobject, girepository: Fix several -Wsign-conversion warnings on =
macOS
  - !4609 Update Portuguese translation
  - !4610 Update Ukrainian translation
  - !4613 Update macOS job for new CI runner
  - !4615 shell: Handle empty comment gracefully
  - !4619 gslist: Improve documentation for append / prepend / insert metho=
ds
  - !4620 glocalfile: Disable faccessat()-based query_exists on Android
  - !4621 gallocator: mark as deprecated
  - !4627 [th/gsignalgroup-dispose] gsignalgroup: make GSignalGroup.dispose=
() a
    bit more reentrant
  - !4628 [th/gdataset-fix-zero-key] fix and cleanup related to using a zer=
o
    GQuark for keys in GData
  - !4631 Update German translation
  - !4632 win32: Only print one OS version
  - !4633 gzlibcompressor: Convert docs to gi-docgen linking syntax
  - !4638 docs: Fix formatting of definition lists

* Translation updates:
  - Catalan (Jordi Mas)
  - Danish (Ask Hjorth Larsen)
  - French (Vincent Chatelain)
  - German (Philipp Kiemle)
  - Indonesian (Andika Triwidada)
  - Persian (Danial Behzadi)
  - Portuguese (Hugo Carvalho)
  - Romanian (Antonio Marin)
  - Turkish (Sabri =C3=9Cnal)
  - Ukrainian (Yuri Chornoivan)

- remove backport patches

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../glib-2.0/files/CVE-2025-6052-1.patch      | 97 -------------------
 .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 -------
 ...l_2.84.4.bb =3D&gt; glib-2.0-initial_2.86.0.bb} |  0
 ...{glib-2.0_2.84.4.bb =3D&gt; glib-2.0_2.86.0.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 5 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.4.bb =3D&gt; glib=
-2.0-initial_2.86.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.4.bb =3D&gt; glib-2.0_2.8=
6.0.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch b/meta/=
recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
deleted file mode 100644
index a344735ee4..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann &lt;<a href=3D"mailto:tobias@stoeckmann.org">tobia=
s@stoeckmann.org</a>&gt;
-Date: Mon, 7 Jul 2025 20:52:24 +0200
-Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
-
-If glib is compiled with -Dglib_assert=3Dfalse, i.e. no asserts
-enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
-fault due to an out of boundary write.
-
-This happens because the overflow check was moved into
-g_string_maybe_expand which is not called by g_string_sized_new.
-
-By assuming that string-&gt;allocated_len is always larger than
-string-&gt;len (and the code would be in huge trouble if that is not true)=
,
-the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
-avoid a potential G_MAXSIZE overflow.
-
-This in turn leads to 150-200 bytes smaller compiled library
-depending on gcc and clang versions, and one less check for the most
-common code paths.
-
-Reverts <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/merge_requests/46=
55">https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655</a> and
-reorders internal g_string_maybe_expand check to still fix
-CVE-2025-6052.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/commit/6aa97beda32bb337370858862f4efe2f3372619f">https://gitlab.gnome.org=
/GNOME/glib/-/commit/6aa97beda32bb337370858862f4efe2f3372619f</a>]
-Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com">=
peter.marko@siemens.com</a>&gt;
----
- glib/gstring.c      | 10 +++++-----
- glib/tests/string.c | 18 ++++++++++++++++++
- 2 files changed, 23 insertions(+), 5 deletions(-)
-
-diff --git a/glib/gstring.c b/glib/gstring.c
-index 010a8e976..24c4bfb40 100644
---- a/glib/gstring.c
-+++ b/glib/gstring.c
-@@ -68,6 +68,10 @@ static void
- g_string_expand (GString *string,
-                  gsize    len)
- {
-+  /* Detect potential overflow */
-+  if G_UNLIKELY ((G_MAXSIZE - string-&gt;len - 1) &lt; len)
-+    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
-+
-   string-&gt;allocated_len =3D g_nearest_pow (string-&gt;len + len + 1);
-   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
-    * memory for this string and don't over-allocate.
-@@ -82,11 +86,7 @@ static inline void
- g_string_maybe_expand (GString *string,
-                        gsize    len)
- {
--  /* Detect potential overflow */
--  if G_UNLIKELY ((G_MAXSIZE - string-&gt;len - 1) &lt; len)
--    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
--
--  if (G_UNLIKELY (string-&gt;len + len &gt;=3D string-&gt;allocated_len))
-+  if (G_UNLIKELY (len &gt;=3D string-&gt;allocated_len - string-&gt;len))
-     g_string_expand (string, len);
- }
-=20
-diff --git a/glib/tests/string.c b/glib/tests/string.c
-index aa363c57a..e3bc4a02e 100644
---- a/glib/tests/string.c
-+++ b/glib/tests/string.c
-@@ -767,6 +767,23 @@ test_string_new_take_null (void)
-   g_string_free (g_steal_pointer (&amp;string), TRUE);
- }
-=20
-+static void
-+test_string_sized_new (void)
-+{
-+
-+  if (g_test_subprocess ())
-+    {
-+      GString *string =3D g_string_sized_new (G_MAXSIZE);
-+      g_string_free (string, TRUE);
-+    }
-+  else
-+    {
-+      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
-+      g_test_trap_assert_failed ();
-+      g_test_trap_assert_stderr ("*string would overflow*");
-+    }
-+}
-+
- int
- main (int   argc,
-       char *argv[])
-@@ -796,6 +813,7 @@ main (int   argc,
-   g_test_add_func ("/string/test-string-steal", test_string_steal);
-   g_test_add_func ("/string/test-string-new-take", test_string_new_take);
-   g_test_add_func ("/string/test-string-new-take/null", test_string_new_t=
ake_null);
-+  g_test_add_func ("/string/sized-new", test_string_sized_new);
-=20
-   return g_test_run();
- }
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch b/meta/=
recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
deleted file mode 100644
index 703dfdf46c..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann &lt;<a href=3D"mailto:tobias@stoeckmann.org">tobia=
s@stoeckmann.org</a>&gt;
-Date: Mon, 7 Jul 2025 20:57:41 +0200
-Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
-
-Use the same style for the G_LIKELY check here as in g_string_sized_new.
-The check could overflow on 32 bit systems.
-
-Also improve the memcpy/memmove check to use memcpy if val itself is
-adjacent to end + len_unsigned, which means that no overlapping exists.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/commit/3752760c5091eaed561ec11636b069e529533514">https://gitlab.gnome.org=
/GNOME/glib/-/commit/3752760c5091eaed561ec11636b069e529533514</a>]
-Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com">=
peter.marko@siemens.com</a>&gt;
----
- glib/gstring.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/glib/gstring.h b/glib/gstring.h
-index e817176c9..c5e64b33a 100644
---- a/glib/gstring.h
-+++ b/glib/gstring.h
-@@ -232,10 +232,10 @@ g_string_append_len_inline (GString    *gstring,
-   else
-     len_unsigned =3D (gsize) len;
-=20
--  if (G_LIKELY (gstring-&gt;len + len_unsigned &lt; gstring-&gt;allocated=
_len))
-+  if (G_LIKELY (len_unsigned &lt; gstring-&gt;allocated_len - gstring-&gt=
;len))
-     {
-       char *end =3D gstring-&gt;str + gstring-&gt;len;
--      if (G_LIKELY (val + len_unsigned &lt;=3D end || val &gt; end + len_=
unsigned))
-+      if (G_LIKELY (val + len_unsigned &lt;=3D end || val &gt;=3D end + l=
en_unsigned))
-         memcpy (end, val, len_unsigned);
-       else
-         memmove (end, val, len_unsigned);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.86.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index c80396a0f1..f9cb3417ec 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,14 +231,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${=
PV}.tar.xz \
            <a href=3D"file://0001-gio-tests-resources.c-comment-out-a-buil=
d-host-only-.patch">file://0001-gio-tests-resources.c-comment-out-a-build-h=
ost-only-.patch</a> \
            <a href=3D"file://0010-Do-not-hardcode-python-path-into-various=
-tools.patch">file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch</a> \
            <a href=3D"file://skip-timeout.patch">file://skip-timeout.patch=
</a> \
-           <a href=3D"file://CVE-2025-6052-1.patch">file://CVE-2025-6052-1=
.patch</a> \
-           <a href=3D"file://CVE-2025-6052-2.patch">file://CVE-2025-6052-2=
.patch</a> \
            "
 SRC_URI:append:class-native =3D " <a href=3D"file://relocate-modules.patch=
">file://relocate-modules.patch</a> \
                                 <a href=3D"file://0001-meson.build-do-not-=
enable-pidfd-features-on-native-g.patch">file://0001-meson.build-do-not-ena=
ble-pidfd-features-on-native-g.patch</a> \
                               "
=20
-SRC_URI[sha256sum] =3D "8a9ea10943c36fc117e253f80c91e477b673525ae457629428=
58aef57631bb90"
+SRC_URI[sha256sum] =3D "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408=
e4d1faea580d6d"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
<div>--=20
</div>2.50.1

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#223035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223035">https://lists.openembedded.org/g/openembedd=
ed-core/message/223035</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115087264/361=
8223">https://lists.openembedded.org/mt/115087264/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-J5WsZdkkkFDkB8VtYTue--


