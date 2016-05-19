Return-Path: <brian.avery@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE1B6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 20:16:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 19 May 2016 13:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,335,1459839600"; d="scan'208";a="980706874"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2016 13:16:29 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 13:17:36 -0700
Message-Id: <cover.1463687747.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] [PATCH] gdb: Backport 7.12 features supporting AVX and MPX
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
X-List-Received-Date: Thu, 19 May 2016 20:16:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch brings in features from gdb 7.12 so that an Intel core that
supports MPX but not AVX will work as will the converse. Previous
versions assumed that if MPX was supported AVX was as well.

-brian avery

Changelog details of this patch:
2016-02-25  Marcin Kościelnicki  <koriakin@0x04.net>

	PR gdb/13808
	* Makefile.in: Add i386-*-linux-ipa.o and amd64-*-linux-ipa.o.
	* configure.srv: Ditto.
	* linux-aarch64-ipa.c (get_ipa_tdesc): New function.
	(initialize_low_tracepoint): Remove ipa_tdesc assignment.
	* linux-amd64-ipa.c: Add "linux-x86-tdesc.h" include.
	(init_registers_amd64_linux): Remove prototype.
	(tdesc_amd64_linux): Remove declaration.
	(get_ipa_tdesc): New function.
	(initialize_low_tracepoint): Remove ipa_tdesc assignment,
	initialize remaining tdescs.
	* linux-i386-ipa.c: Add "linux-x86-tdesc.h" include.
	(init_registers_i386_linux): Remove prototype.
	(tdesc_i386_linux): Remove declaration.
	(get_ipa_tdesc): New function.
	(initialize_low_tracepoint): Remove ipa_tdesc assignment,
	initialize remaining tdescs.
	* linux-low.c (linux_get_ipa_tdesc_idx): New function.
	(linux_target_ops): wire in linux_get_ipa_tdesc_idx.
	* linux-low.h (struct linux_target_ops): Add get_ipa_tdesc_idx.
	* linux-x86-low.c: Move tdesc declarations to linux-x86-tdesc.h.
	(x86_get_ipa_tdesc_idx): New function.
	(the_low_target): Wire in x86_get_ipa_tdesc_idx.
	* linux-x86-tdesc.h: New file.
	* target.h (struct target_ops): Add get_ipa_tdesc_idx.
	(target_get_ipa_tdesc_idx): New macro.
	* tracepoint.c (ipa_tdesc_idx): New macro.
	(struct ipa_sym_addresses): Add addr_ipa_tdesc_idx.
	(symbol_list): Add ipa_tdesc_idx.
	(cmd_qtstart): Write ipa_tdesc_idx in the target.
	(ipa_tdesc): Remove.
	(ipa_tdesc_idx): New variable.
	(get_context_regcache): Use get_ipa_tdesc.
	(gdb_collect): Ditto.
	(gdb_probe): Ditto.
	* tracepoint.h (get_ipa_tdesc): New prototype.
	(ipa_tdesc): Remove.

2016-04-14  Walfred Tedeschi  <walfred.tedeschi@intel.com>

	* features/i386/amd64-mpx-linux.xml: Remove AVX feature.
	* features/i386/amd64-mpx.xml: Remove AVX feature.
	* features/i386/i386-mpx-linux.xml: Remove AVX feature.
	* features/i386/i386-mpx.xml: Remove AVX feature.
	* features/i386/amd64-mpx-linux.c: Regenerate.
	* features/i386/amd64-mpx.c: Regenerate.
	* features/i386/i386-mpx-linux.c: Regenerate.
	* features/i386/i386-mpx.c: Regenerate.
	* regformats/i386/amd64-mpx-linux.dat: Regenerate.
	* regformats/i386/amd64-mpx.dat: Regenerate.
	* regformats/i386/i386-mpx-linux.dat: Regenerate.
	* regformats/i386/i386-mpx.dat: Regenerate.


The following changes since commit c9867c4624b88fb19deacf70b7a3ff46d4fa4699:

  bitbake: cooker: Improve taskgraph file handling (2016-05-19 15:19:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/gdb-7.11-avxmpx-backport
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/gdb-7.11-avxmpx-backport

bavery (1):
  gdb: 7.11 backport of 7.12 avx/mxp support

 meta/recipes-devtools/gdb/gdb-common.inc         |    2 +-
 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch | 2503 ++++++++++++++++++++++
 2 files changed, 2504 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch

--
1.9.1

