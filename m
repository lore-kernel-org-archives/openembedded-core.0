Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1UATVe-0005tp-1K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:00:30 +0100
Received: from mail34-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 21:58:50 +0000
Received: from mail34-ch1 (localhost [127.0.0.1])	by mail34-ch1-R.bigfish.com
	(Postfix) with ESMTP id 6FD17440226	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz17326ah8275dh8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1155h)
Received: from mail34-ch1 (localhost.localdomain [127.0.0.1]) by mail34-ch1
	(MessageSwitch) id 1361915927630597_11160;
	Tue, 26 Feb 2013 21:58:47 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail34-ch1.bigfish.com (Postfix) with ESMTP id
	907953A0213 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 21:58:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 26 Feb 2013 21:58:36 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r1QLwies007813 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:58:45 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:58:44 -0600
Message-ID: <1361915924-23046-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1361915924-23046-1-git-send-email-msm@freescale.com>
References: <1361915924-23046-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 4/4] oprofile: update patch for powerpc64
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
X-List-Received-Date: Tue, 26 Feb 2013 23:00:31 -0000
Content-Type: text/plain

This is a more appropriate follow up patch from upstream. Also,
only powerpc64 requires libpfm4 currently for this specific
version of oprofile (x86, sparc can make use of libpfm but
don't make use of it here)

Additionally, this patch from upstream requires some more
patches to be pulled into oprofile

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 ...-events-to-be-specified-with-or-without-_.patch |  206 ++++++++++++++++++++
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |  130 ++++++++++++
 .../0001-fix-powerpc-cross-compiling.patch         |   35 ----
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |   34 ++++
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |    7 +-
 5 files changed, 374 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
new file mode 100644
index 0000000..5eb8b8f
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
@@ -0,0 +1,206 @@
+From 36028035555297695f52e856f21920012fd64f79 Mon Sep 17 00:00:00 2001
+From: Maynard Johnson <maynardj@us.ibm.com>
+Date: Fri, 11 Jan 2013 13:29:57 -0600
+Subject: [PATCH] Allow ppc64 events to be specified with or without _GRP<n>
+ suffix
+
+All events for IBM PowerPC server processors (except CYCLES) have
+a _GRP<n> suffix.  This is because the legacy opcontrol profiler
+can only profile events in the same group (i.e., having the same
+_GRP<n> suffix).  But operf has no such restriction because it
+can multiplex events; thus, so we should allow the user to pass
+event names without the _GRP<n> suffix.
+
+Signed-off-by: Maynard Johnson <maynardj@us.ibm.com>
+---
+ doc/operf.1.in         |    6 +++
+ doc/oprofile.xml       |   12 +++++-
+ pe_profiling/operf.cpp |  107 ++++++++++++++++++++++++++++++++++++++++++++++++
+ utils/ophelp.c         |    4 ++
+ 4 files changed, 127 insertions(+), 2 deletions(-)
+
+diff --git a/doc/operf.1.in b/doc/operf.1.in
+index b109324..03027ca 100644
+--- a/doc/operf.1.in
++++ b/doc/operf.1.in
+@@ -110,6 +110,12 @@ be specified using the symbolic name.  If no unit mask is specified, 0x0 will be
+ used as the default.
+ .P
+ .RS
++On IBM PowerPC systems, events may be specified with or without the
++.I _GRP<n>
++suffix.  If no group number suffix is given, one will be automatically
++assigned; thus, OProfile post-processing tools will always show real event
++names that include the group number suffix.
++.P
+ When no event specification is given, the default event for the running
+ processor type will be used for profiling.
+ Use
+diff --git a/doc/oprofile.xml b/doc/oprofile.xml
+index 0ae2b0b..0f74726 100644
+--- a/doc/oprofile.xml
++++ b/doc/oprofile.xml
+@@ -1106,10 +1106,18 @@ shown by the output of <command>ophelp</command>.  Unit masks with "extra:" para
+ specified using the symbolic name.
+ </para>
+ <note><para>
+-When using legacy mode <command>opcontrol</command> on PowerPC platforms, all events specified must be in the same group;
++When using legacy mode <command>opcontrol</command> on IBM PowerPC platforms, all events specified must be in the same group;
+ i.e., the group number appended to the event name (e.g. <constant>&lt;<emphasis>some-event-name</emphasis>&gt;_GRP9
+ </constant>) must be the same.
+-</para></note>
++</para>
++<para>
++When profiling with <command>operf</command> on IBM PowerPC platforms, the above restriction
++regarding the same group number does not apply, and events may be
++specified with or without the group number suffix.   If no group number suffix is given, one will be automatically
++assigned; thus, OProfile post-processing tools will always show real event
++names that include the group number suffix.
++</para>
++</note>
+ <para>
+ If OProfile is using timer-interrupt mode, there is no event configuration possible.
+ </para>
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+index 4416b29..a776e71 100644
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -1146,6 +1146,108 @@ static void _get_event_code(operf_event_t * event)
+ 	event->evt_code = config;
+ }
+ 
++#if (defined(__powerpc__) || defined(__powerpc64__))
++/* All ppc64 events (except CYCLES) have a _GRP<n> suffix.  This is
++ * because the legacy opcontrol profiler can only profile events in
++ * the same group (i.e., having the same _GRP<n> suffix).  But operf
++ * can multiplex events, so we should allow the user to pass event
++ * names without the _GRP<n> suffix.
++ *
++ * If event name is not CYCLES or does not have a _GRP<n> suffix,
++ * we'll call ophelp and scan the list of events, searching for one
++ * that matches up to the _GRP<n> suffix.  If we don't find a match,
++ * then we'll exit with the expected error message for invalid event name.
++ */
++static string _handle_powerpc_event_spec(string event_spec)
++{
++	FILE * fp;
++	char line[MAX_INPUT];
++	size_t grp_pos;
++	string evt, retval, err_msg;
++	size_t evt_name_len;
++	bool first_non_cyc_evt_found = false;
++	bool event_found = false;
++	char event_name[OP_MAX_EVT_NAME_LEN], event_spec_str[OP_MAX_EVT_NAME_LEN + 20], * count_str;
++	string cmd = OP_BINDIR;
++	cmd += "/ophelp";
++
++	strncpy(event_spec_str, event_spec.c_str(), event_spec.length() + 1);
++
++	strncpy(event_name, strtok(event_spec_str, ":"), OP_MAX_EVT_NAME_LEN);
++	count_str = strtok(NULL, ":");
++	if (!count_str) {
++		err_msg = "Invalid count for event ";
++		goto out;
++	}
++
++	if (!strcmp("CYCLES", event_name)) {
++		event_found = true;
++		goto out;
++	}
++
++	evt = event_name;
++	// Need to make sure the event name truly has a _GRP<n> suffix.
++	grp_pos = evt.rfind("_GRP");
++	if ((grp_pos != string::npos) && ((evt = evt.substr(grp_pos, string::npos))).length() > 4) {
++		unsigned long value;
++		char * end;
++		value = strtoul(evt.substr(4, string::npos).c_str(), &end, 0);
++		if (end && (*end == '\0')) {
++		// Valid group number found after _GRP, so we can skip to the end.
++			event_found = true;
++			goto out;
++		}
++	}
++
++	// If we get here, it implies the user passed a non-CYCLES event without a GRP suffix.
++	// Lets try to find a valid suffix for it.
++	fp = popen(cmd.c_str(), "r");
++	if (fp == NULL) {
++		cerr << "Unable to execute ophelp to get info for event "
++		     << event_spec << endl;
++		exit(EXIT_FAILURE);
++	}
++	evt_name_len = strlen(event_name);
++	err_msg = "Cannot find event ";
++	while (fgets(line, MAX_INPUT, fp)) {
++		if (!first_non_cyc_evt_found) {
++			if (!strncmp(line, "PM_", 3))
++				first_non_cyc_evt_found = true;
++			else
++				continue;
++		}
++		if (line[0] == ' ' || line[0] == '\t')
++			continue;
++		if (!strncmp(line, event_name, evt_name_len)) {
++			// Found a potential match.  Check if it's a perfect match.
++			string save_event_name = event_name;
++			size_t full_evt_len = index(line, ':') - line;
++			memset(event_name, '\0', OP_MAX_EVT_NAME_LEN);
++			strncpy(event_name, line, full_evt_len);
++			string candidate = event_name;
++			if (candidate.rfind("_GRP") == evt_name_len) {
++				event_found = true;
++				break;
++			} else {
++				memset(event_name, '\0', OP_MAX_EVT_NAME_LEN);
++				strncpy(event_name, save_event_name.c_str(), evt_name_len);
++			}
++		}
++	}
++	pclose(fp);
++
++out:
++	if (!event_found) {
++		cerr << err_msg << event_name << endl;
++		cerr << "Error retrieving info for event "
++				<< event_spec << endl;
++		exit(EXIT_FAILURE);
++	}
++	retval = event_name;
++	return retval + ":" + count_str;
++}
++#endif
++
+ static void _process_events_list(void)
+ {
+ 	string cmd = OP_BINDIR;
+@@ -1154,6 +1256,11 @@ static void _process_events_list(void)
+ 		FILE * fp;
+ 		string full_cmd = cmd;
+ 		string event_spec = operf_options::evts[i];
++
++#if (defined(__powerpc__) || defined(__powerpc64__))
++		event_spec = _handle_powerpc_event_spec(event_spec);
++#endif
++
+ 		if (operf_options::callgraph) {
+ 			full_cmd += " --callgraph=1 ";
+ 		}
+diff --git a/utils/ophelp.c b/utils/ophelp.c
+index 53a5dde..63895c8 100644
+--- a/utils/ophelp.c
++++ b/utils/ophelp.c
+@@ -652,6 +652,10 @@ int main(int argc, char const * argv[])
+ 	case CPU_PPC64_POWER7:
+ 	case CPU_PPC64_IBM_COMPAT_V1:
+ 		event_doc =
++			"When using operf, events may be specified without a '_GRP<n>' suffix.\n"
++			"If _GRP<n> (i.e., group number) is not specified, one will be automatically\n"
++			"selected for use by the profiler.  OProfile post-processing tools will\n"
++			"always show real event names that include the group number suffix.\n\n"
+ 			"Documentation for IBM POWER7 can be obtained at:\n"
+ 			"http://www.power.org/events/Power7/\n"
+ 			"No public performance monitoring doc available for older processors.\n";
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
new file mode 100644
index 0000000..ead6e25
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
@@ -0,0 +1,130 @@
+From 8e36ad01ceb1257d05773b684dbe9358aecd3f71 Mon Sep 17 00:00:00 2001
+From: Maynard Johnson <maynardj@us.ibm.com>
+Date: Tue, 26 Feb 2013 13:41:27 -0600
+Subject: [PATCH] Fix PPC64-specific libpfm usage so it doesn't break ppc32
+ architecture
+
+The configure check to determine whether we should use libpfm or not
+is intended only for the ppc64 architecture, but was incorrectly
+hitting on the ppc32 architecture, too.  Not only that, but it was using
+'uname' which is not a good idea in cross-compile situtations.
+
+Then, aside from that, we had several instances in the source code
+of the following:
+   #if (defined(__powerpc__) || defined(__powerpc64__))
+which incorrectly included ppc32 architecutre also, when it was intended
+for use as PPC64 architecture.
+
+This patch fixes both errors.
+
+Signed-off-by: Maynard Johnson <maynardj@us.ibm.com
+---
+ configure.ac                   |    5 ++---
+ libperf_events/operf_utils.cpp |    4 ++--
+ libperf_events/operf_utils.h   |    6 ++++++
+ pe_profiling/operf.cpp         |   10 +++++-----
+ 4 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a9b1ee4..a0da98c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -154,11 +154,10 @@ else
+ fi
+ 
+ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf_events exists])
+-
++AC_CANONICAL_HOST
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+-	arch="`uname -m`"
+-	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
++	if test "$host_cpu" = "powerpc64"; then
+ 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
+ 		AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1', [
+ 			AC_CHECK_LIB(pfm, pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1',
+diff --git a/libperf_events/operf_utils.cpp b/libperf_events/operf_utils.cpp
+index da964fd..a17200b 100644
+--- a/libperf_events/operf_utils.cpp
++++ b/libperf_events/operf_utils.cpp
+@@ -83,7 +83,7 @@ static event_t comm_event;
+  * the following method is to map the operf-record event value to a value that
+  * opreport can understand.
+  */
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ #define NIL_CODE ~0U
+ 
+ #if HAVE_LIBPFM3
+@@ -716,7 +716,7 @@ static void __handle_sample_event(event_t * event, u64 sample_type)
+ 	} else if (event->header.misc == PERF_RECORD_MISC_USER) {
+ 		in_kernel = false;
+ 	}
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	else if (event->header.misc == PERF_RECORD_MISC_HYPERVISOR) {
+ #define MAX_HYPERVISOR_ADDRESS 0xfffffffULL
+ 		if (data.ip > MAX_HYPERVISOR_ADDRESS) {
+diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
+index 2df00b7..ddf05ed 100644
+--- a/libperf_events/operf_utils.h
++++ b/libperf_events/operf_utils.h
+@@ -45,6 +45,12 @@ extern bool throttled;
+ #define MMAP_WINDOW_SZ (32 * 1024 * 1024ULL)
+ #endif
+ 
++/* A macro to be used for ppc64 architecture-specific code.  The '__powerpc__' macro
++ * is defined for both ppc64 and ppc32 architectures, so we must further qualify by
++ * including the 'HAVE_LIBPFM' macro, since that macro will be defined only for ppc64.
++ */
++#define PPC64_ARCH (HAVE_LIBPFM) && ((defined(__powerpc__) || defined(__powerpc64__)))
++
+ extern unsigned int op_nr_counters;
+ 
+ static inline size_t align_64bit(u64 x)
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+index e7c2eab..e1190c2 100644
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -1177,7 +1177,7 @@ static void _get_event_code(operf_event_t * event)
+ 	event->evt_code = config;
+ }
+ 
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ /* All ppc64 events (except CYCLES) have a _GRP<n> suffix.  This is
+  * because the legacy opcontrol profiler can only profile events in
+  * the same group (i.e., having the same _GRP<n> suffix).  But operf
+@@ -1287,7 +1287,7 @@ static void _process_events_list(void)
+ 		string full_cmd = cmd;
+ 		string event_spec = operf_options::evts[i];
+ 
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 		event_spec = _handle_powerpc_event_spec(event_spec);
+ #endif
+ 
+@@ -1357,9 +1357,9 @@ static void _process_events_list(void)
+ 		_get_event_code(&event);
+ 		events.push_back(event);
+ 	}
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	{
+-		/* This section of code is for architectures such as ppc[64] for which
++		/* This section of code is soley for the ppc64 architecture for which
+ 		 * the oprofile event code needs to be converted to the appropriate event
+ 		 * code to pass to the perf_event_open syscall.
+ 		 */
+@@ -1404,7 +1404,7 @@ static void get_default_event(void)
+ 	_get_event_code(&dft_evt);
+ 	events.push_back(dft_evt);
+ 
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	{
+ 		/* This section of code is for architectures such as ppc[64] for which
+ 		 * the oprofile event code needs to be converted to the appropriate event
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch b/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
deleted file mode 100644
index d4dffb1..0000000
--- a/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Submitted
-
-From cd8aafe5ca48e8d809188df6e42f20efd5cbefd1 Mon Sep 17 00:00:00 2001
-From: Matthew McClintock <msm@freescale.com>
-Date: Tue, 5 Feb 2013 11:05:00 -0600
-Subject: [PATCH] fix powerpc cross compiling
-
-You can't determine the target for running on by running uname
-on the build machine. Use a better method instead.
-
-Signed-off-by: Matthew McClintock <msm@freescale.com>
----
- configure.ac |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a9b1ee4..4b73cdd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -155,10 +155,10 @@ fi
- 
- AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf_events exists])
- 
-+AC_CANONICAL_HOST
- if test "$HAVE_PERF_EVENTS" = "1"; then
- 	PFM_LIB=
--	arch="`uname -m`"
--	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
-+	if test "$host_cpu" = "powerpc"; then
- 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
- 		AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1', [
- 			AC_CHECK_LIB(pfm, pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1',
--- 
-1.7.9.7
-
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch b/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
new file mode 100644
index 0000000..5a50b90
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
@@ -0,0 +1,34 @@
+From 735d9eb0322b34b3d26302a1dac173100d718d35 Mon Sep 17 00:00:00 2001
+From: Maynard Johnson <maynardj@us.ibm.com>
+Date: Thu, 10 Jan 2013 14:24:26 -0600
+Subject: [PATCH] ophelp lists events: Fix doc URL for ppc64 arch
+
+When ophelp is used to list available events, it displays
+some help text before the event list to direct the user
+where to find more info.  For the ppc64 architecture, a
+stale URL was listed.  This patch fixes that URL.
+
+Signed-off-by: Maynard Johnson <maynardj@us.ibm.com>
+---
+ utils/ophelp.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils/ophelp.c b/utils/ophelp.c
+index f48697b..827f2d0 100644
+--- a/utils/ophelp.c
++++ b/utils/ophelp.c
+@@ -652,8 +652,9 @@ int main(int argc, char const * argv[])
+ 	case CPU_PPC64_POWER7:
+ 	case CPU_PPC64_IBM_COMPAT_V1:
+ 		event_doc =
+-			"Obtain PowerPC64 processor documentation at:\n"
+-			"http://www-306.ibm.com/chips/techlib/techlib.nsf/productfamilies/PowerPC\n";
++			"Documentation for IBM POWER7 can be obtained at:\n"
++			"http://www.power.org/events/Power7/\n"
++			"No public performance monitoring doc available for older processors.\n";
+ 		break;
+ 
+ 	case CPU_PPC64_CELL:
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
index 79363a6..e8329cd 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
@@ -1,9 +1,8 @@
 require oprofile.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS += "virtual/kernel"
-DEPENDS_append_powerpc = " libpfm4"
 DEPENDS_append_powerpc64 = " libpfm4"
 
 SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
@@ -12,7 +11,9 @@ SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://0001-Handle-early-perf_events-kernel-without-PERF_RECORD_.patch \
             file://0001-Fix-up-configure-to-handle-architectures-that-do-not.patch \
             file://0001-Change-configure-to-look-for-libpfm4-function-first-.patch \
-            file://0001-fix-powerpc-cross-compiling.patch "
+            file://0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch \
+            file://0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch \
+            file://0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch"
 
 SRC_URI[md5sum] = "6d127023af1dd1cf24e15411229f3cc8"
 SRC_URI[sha256sum] = "ab45900fa1a23e5d5badf3c0a55f26c17efe6e184efcf00b371433751fa761bc"
-- 
1.7.9.7




