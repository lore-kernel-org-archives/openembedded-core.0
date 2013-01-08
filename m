Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TsPtR-0002b5-Jp
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 04:30:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 19:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,428,1355126400"; d="scan'208";a="188705942"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 19:15:11 -0800
Message-ID: <50EB8F3A.4090100@linux.intel.com>
Date: Mon, 07 Jan 2013 19:15:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1357582015-16423-1-git-send-email-otavio@ossystems.com.br>
	<50EB5E25.2080204@linux.intel.com>
	<CAP9ODKqy4p045c045K6Smi391gK7cKW-jV-nmL66Ra2QUfQKXg@mail.gmail.com>
	<CAP9ODKpf_btTLPgK9SCW_-7Fdu+krj2zrkeds+erahoyLeHUPQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpf_btTLPgK9SCW_-7Fdu+krj2zrkeds+erahoyLeHUPQ@mail.gmail.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: Fix building using flex
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
X-List-Received-Date: Tue, 08 Jan 2013 03:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 04:00 PM, Otavio Salvador wrote:
> Looking at the error it seems it is using your distribution binary, not
> the built one (for flex).
>
My bad, you patch was not in the first build I did, RP pulled it in 
after I started the build.  I am rebuilding MASTER now with your patch in.

Sau!

> On Jan 7, 2013 9:59 PM, "Otavio Salvador" <otavio@ossystems.com.br
> <mailto:otavio@ossystems.com.br>> wrote:
>
>     I'm out of office now but I have a new patch that upgrade to 3.2.17
>     and I can send it layer today or tomorrow early morning.
>
>     On Jan 7, 2013 9:45 PM, "Saul Wold" <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>> wrote:
>
>         On 01/07/2013 10:06 AM, Otavio Salvador wrote:
>
>             The build system has not been fully changed to use flex in
>             3.2.16 so
>             we need to finish the conversion. In 3.2.17 this bug has
>             been fixed.
>
>         Otavio,
>
>         This patch seems to be causing another failure
>
>             | bison -y -d -o route/cls/ematch_syntax.c
>             route/cls/ematch_syntax.y
>             | lex --header-file=route/pktloc___grammar.h -o
>             route/pktloc_grammar.c route/pktloc_grammar.l
>             | bison -y -d -o route/pktloc_syntax.c route/pktloc_syntax.y
>             | flex: Can't use --reentrant or --bison-bridge with -l option
>             | flex: Can't use --reentrant or --bison-bridge with -l option
>             | make[1]: *** [route/pktloc_grammar.c] Error 1
>
>
>
>         I am looking into the failure now, can you on your side also.
>
>         Thanks
>                  Sau!
>
>             Signed-off-by: Otavio Salvador <otavio@ossystems.com.br
>             <mailto:otavio@ossystems.com.br>>
>             ---
>                .../libnl/libnl/fix-build-__using-flex.patch         |
>             55 ++++++++++++++++++++
>                meta/recipes-support/libnl/lib__nl_3.2.16.bb
>             <http://libnl_3.2.16.bb>         |    3 +-
>                2 files changed, 57 insertions(+), 1 deletion(-)
>                create mode 100644
>             meta/recipes-support/libnl/__libnl/fix-build-using-flex.__patch
>
>             diff --git
>             a/meta/recipes-support/libnl/__libnl/fix-build-using-flex.__patch
>             b/meta/recipes-support/libnl/__libnl/fix-build-using-flex.__patch
>             new file mode 100644
>             index 0000000..89a36ba
>             --- /dev/null
>             +++
>             b/meta/recipes-support/libnl/__libnl/fix-build-using-flex.__patch
>             @@ -0,0 +1,55 @@
>             +From 89ab8d4f1229a1d2605193686cc00e__6b2c9786ff Mon Sep 17
>             00:00:00 2001
>             +From: Otavio Salvador <otavio@ossystems.com.br
>             <mailto:otavio@ossystems.com.br>>
>             +Date: Mon, 7 Jan 2013 15:44:38 -0200
>             +Subject: [PATCH] Fix build using flex
>             +
>             +Upstream-Status: Backport [3.2.17]
>             +---
>             + lib/Makefile.am     |    4 ++--
>             + src/lib/Makefile.am |    4 ++--
>             + 2 files changed, 4 insertions(+), 4 deletions(-)
>             +
>             +diff --git a/lib/Makefile.am b/lib/Makefile.am
>             +index 98c7b90..89cc5d2 100644
>             +--- a/lib/Makefile.am
>             ++++ b/lib/Makefile.am
>             +@@ -43,14 +43,14 @@ CLEANFILES = \
>             + route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
>             + route/pktloc_grammar.h: route/pktloc_grammar.c
>             + route/pktloc_grammar.c: route/pktloc_grammar.l
>             +-      $(AM_V_GEN) $(LEX)
>             --header-file=route/pktloc___grammar.h $(LFLAGS) -o $@ $^
>             ++      $(AM_V_GEN) $(FLEX)
>             --header-file=route/pktloc___grammar.h $(LFLAGS) -o $@ $^
>             +
>             + route/pktloc_syntax.h: route/pktloc_syntax.c
>             + route/pktloc_syntax.c: route/pktloc_syntax.y
>             +       $(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
>             +
>             + route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
>             +-      $(AM_V_GEN) $(LEX)
>             --header-file=route/cls/__ematch_grammar.h $(LFLAGS) -o $@ $^
>             ++      $(AM_V_GEN) $(FLEX)
>             --header-file=route/cls/__ematch_grammar.h $(LFLAGS) -o $@ $^
>             +
>             + route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
>             +       $(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
>             +diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
>             +index 6688e7c..507635d 100644
>             +--- a/src/lib/Makefile.am
>             ++++ b/src/lib/Makefile.am
>             +@@ -11,13 +11,13 @@ AM_LDFLAGS = \
>             + #cls_ematch_cmp_la_LDFLAGS = -module -version-info 2:0:0
>             +
>             + #cls/ematch_grammar.c: cls/ematch_grammar.l
>             +-#     $(LEX) --header-file=cls/ematch___grammar.h
>             $(LFLAGS) -o $@ $^
>             ++#     $(FLEX) --header-file=cls/ematch___grammar.h
>             $(LFLAGS) -o $@ $^
>             +
>             + #cls/ematch_syntax.c: cls/ematch_syntax.y
>             + #     $(YACC) -d $(YFLAGS) -o $@ $^
>             +
>             + #cls/pktloc_grammar.c: cls/pktloc_grammar.l
>             +-#     $(LEX) --header-file=cls/pktloc___grammar.h
>             $(LFLAGS) -o $@ $^
>             ++#     $(FLEX) --header-file=cls/pktloc___grammar.h
>             $(LFLAGS) -o $@ $^
>             +
>             + #cls/pktloc_syntax.c: cls/pktloc_syntax.y
>             + #     $(YACC) -d $(YFLAGS) -o $@ $^
>             +--
>             +1.7.10.4
>             +
>             diff --git a/meta/recipes-support/libnl/l__ibnl_3.2.16.bb
>             <http://libnl_3.2.16.bb>
>             b/meta/recipes-support/libnl/l__ibnl_3.2.16.bb
>             <http://libnl_3.2.16.bb>
>             index be3a3a2..db9ae9d 100644
>             --- a/meta/recipes-support/libnl/l__ibnl_3.2.16.bb
>             <http://libnl_3.2.16.bb>
>             +++ b/meta/recipes-support/libnl/l__ibnl_3.2.16.bb
>             <http://libnl_3.2.16.bb>
>             @@ -3,7 +3,7 @@ HOMEPAGE =
>             "http://www.infradead.org/~__tgr/libnl/
>             <http://www.infradead.org/~tgr/libnl/>"
>                SECTION = "libs/network"
>
>                PE = "1"
>             -PR = "r0"
>             +PR = "r1"
>
>                LICENSE = "LGPLv2.1"
>                LIC_FILES_CHKSUM =
>             "file://COPYING;md5=__4fbd65380cdd255951079008b36451__6c"
>             @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>
>                SRC_URI =
>             "http://www.infradead.org/~__tgr/${BPN}/files/${BP}.tar.gz
>             <http://www.infradead.org/~tgr/$%7BBPN%7D/files/$%7BBP%7D.tar.gz>
>             \
>                           file://fix-pktloc_syntax_h-__race.patch \
>             +           file://fix-build-using-flex.__patch \
>                           file://fix-pc-file.patch "
>
>                SRC_URI[md5sum] = "__f06e6de102abb2cef71ed671957ee0__99"
>


