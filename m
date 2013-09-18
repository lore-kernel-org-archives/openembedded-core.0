Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEF99610F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 18:24:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8IIOi5u027936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Sep 2013 11:24:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 18 Sep 2013 11:24:43 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Sep 2013 14:24:38 -0400
Message-ID: <cover.1379528498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 18 Sep 2013 18:24:45 -0000
Content-Type: text/plain

Richard/Saul,

Here are three fixes for the upcoming RCs and release. Once is a new branch, but
has zero impact on existing boards, so I've gone ahead and added it for this
upcoming release. The other two are bug fixes.

[PATCH 1/3] linux-yocto/3.8: add haswell-wc board config and branch

   Bumping the meta branch SRCREV to import the following board support:

     meta: add haswell-wc bsp for Intel Haswell Platform (Walnut Canyon CRB) scc and config files

[PATCH 2/3] linux-yocto/3.10: mips configuration changes

   Updating the 3.10 SRCREV to import the following MIPS configuration changes

      4f689aa meta: remove ftrace/ftrace-disable feature
      3058d81 mips: have the mips BSPs disable function tracing instead of ftrace
      935f43f meta: add ftrace/ftrace-function-tracer-disable feature
      0d72a03 mti-malta64: Default to support o32 and n32 userspace binaries

   The first three changes improve the ftrace disabling fragments, to allow tracepoints
   and ftrace to be enabled, while only disabling dynamic ftrace. This allows tools
   that required tracepoints (like lttng) to be built against MIPS.

   The mti-malta64 change adds n32 and o32 support to the default configuration to
   support a broader range of userspace binaries.

   [YOCTO #5215]

   Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
   Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 3/3] linux-yocto/3.10: fix long perf compile times

   perf's builtin-sched.c triggers extremly long build times on some
   architectures due to gcc 4.7+ var-tracking functionality.

   To fix this, we can cherry pick the 3.12 commit:

     f36f83f94 [perf sched: Move struct perf_sched definition out of cmd_sched()]

   With this change build times are reduced from 15 to 20 minutes for qemuarm to:

     real    2m19.940s
     user    1m35.438s
     sys     0m11.165s

   For kernel's that are not carrying this patch, the following can be added
   to the perf recipe to also fix the issue:

       +++ b/meta/recipes-kernel/perf/perf.bb
       @@ -68,6 +68,7 @@ EXTRA_OEMAKE = \
		       CC="${CC}" \
		       AR="${AR}" \
		       perfexecdir=${libexecdir} \
       +               EXTRA_CFLAGS="-fno-var-tracking" \
		       NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \

Cheers,

Bruce


The following changes since commit 99b41732458871080cfa7a9bad3f8dfe03e026be:

  perf: Add LDFLAGS to allow build of old kernels without patching (2013-09-18 17:54:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.8: add haswell-wc board config and branch
  linux-yocto/3.10: mips configuration changes
  linux-yocto/3.10: fix long perf compile times

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |    2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

-- 
1.7.10.4


