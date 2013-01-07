Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TsMch-0005yC-J7
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 01:00:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 15:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,427,1355126400"; d="scan'208";a="241057813"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by azsmga001.ch.intel.com with ESMTP; 07 Jan 2013 15:45:42 -0800
Message-ID: <50EB5E25.2080204@linux.intel.com>
Date: Mon, 07 Jan 2013 15:45:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1357582015-16423-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1357582015-16423-1-git-send-email-otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 08 Jan 2013 00:00:58 -0000
X-Groupsio-MsgNum: 33464
Content-Type: multipart/mixed; boundary="------------050100080309090901020904"

--------------050100080309090901020904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 10:06 AM, Otavio Salvador wrote:
> The build system has not been fully changed to use flex in 3.2.16 so
> we need to finish the conversion. In 3.2.17 this bug has been fixed.
>
Otavio,

This patch seems to be causing another failure
> | bison -y -d -o route/cls/ematch_syntax.c route/cls/ematch_syntax.y
> | lex --header-file=route/pktloc_grammar.h -o route/pktloc_grammar.c route/pktloc_grammar.l
> | bison -y -d -o route/pktloc_syntax.c route/pktloc_syntax.y
> | flex: Can't use --reentrant or --bison-bridge with -l option
> | flex: Can't use --reentrant or --bison-bridge with -l option
> | make[1]: *** [route/pktloc_grammar.c] Error 1


I am looking into the failure now, can you on your side also.

Thanks
	Sau!

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   .../libnl/libnl/fix-build-using-flex.patch         |   55 ++++++++++++++++++++
>   meta/recipes-support/libnl/libnl_3.2.16.bb         |    3 +-
>   2 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
>
> diff --git a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
> new file mode 100644
> index 0000000..89a36ba
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
> @@ -0,0 +1,55 @@
> +From 89ab8d4f1229a1d2605193686cc00e6b2c9786ff Mon Sep 17 00:00:00 2001
> +From: Otavio Salvador <otavio@ossystems.com.br>
> +Date: Mon, 7 Jan 2013 15:44:38 -0200
> +Subject: [PATCH] Fix build using flex
> +
> +Upstream-Status: Backport [3.2.17]
> +---
> + lib/Makefile.am     |    4 ++--
> + src/lib/Makefile.am |    4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index 98c7b90..89cc5d2 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -43,14 +43,14 @@ CLEANFILES = \
> + route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
> + route/pktloc_grammar.h: route/pktloc_grammar.c
> + route/pktloc_grammar.c: route/pktloc_grammar.l
> +-	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> ++	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> +
> + route/pktloc_syntax.h: route/pktloc_syntax.c
> + route/pktloc_syntax.c: route/pktloc_syntax.y
> + 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
> +
> + route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
> +-	$(AM_V_GEN) $(LEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
> ++	$(AM_V_GEN) $(FLEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
> +
> + route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
> + 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
> +diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
> +index 6688e7c..507635d 100644
> +--- a/src/lib/Makefile.am
> ++++ b/src/lib/Makefile.am
> +@@ -11,13 +11,13 @@ AM_LDFLAGS = \
> + #cls_ematch_cmp_la_LDFLAGS = -module -version-info 2:0:0
> +
> + #cls/ematch_grammar.c: cls/ematch_grammar.l
> +-#	$(LEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
> ++#	$(FLEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
> +
> + #cls/ematch_syntax.c: cls/ematch_syntax.y
> + #	$(YACC) -d $(YFLAGS) -o $@ $^
> +
> + #cls/pktloc_grammar.c: cls/pktloc_grammar.l
> +-#	$(LEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
> ++#	$(FLEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
> +
> + #cls/pktloc_syntax.c: cls/pktloc_syntax.y
> + #	$(YACC) -d $(YFLAGS) -o $@ $^
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-support/libnl/libnl_3.2.16.bb
> index be3a3a2..db9ae9d 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.16.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.16.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
>   SECTION = "libs/network"
>
>   PE = "1"
> -PR = "r0"
> +PR = "r1"
>
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>
>   SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
>              file://fix-pktloc_syntax_h-race.patch \
> +           file://fix-build-using-flex.patch \
>              file://fix-pc-file.patch "
>
>   SRC_URI[md5sum] = "f06e6de102abb2cef71ed671957ee099"
>

--------------050100080309090901020904
Content-Type: message/rfc822;
 name="Attached Message"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message"

Return-Path: <yocto-builds-bounces@yoctoproject.org>
X-Original-To: sgw@linux.intel.com
Delivered-To: sgw@linux.intel.com
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
	by linux.intel.com (Postfix) with ESMTP id DC4A92C8002;
	Mon,  7 Jan 2013 14:08:32 -0800 (PST)
Received: from fmsmga102.fm.intel.com ([10.1.193.69])
  by fmsmga001-1.fm.intel.com with ESMTP; 07 Jan 2013 14:08:35 -0800
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgQBAGRG61CM06k4mWdsb2JhbABFhjmkbokKAYgrdhYOAQEBAQEICwsHFCeCIAIEAQEgIwoeDgMBAgYCDh0dBAICAgEBCxgBSAWIEgynAo8/jWyCFjJhA5Ndgi2BHZIh
X-IronPort-AV: E=Sophos;i="4.84,425,1355126400"; 
   d="scan'208";a="1308893883"
Received: from yocto-www.yoctoproject.org ([140.211.169.56])
  by mtab.intel.com with ESMTP; 07 Jan 2013 14:08:34 -0800
Received: from yocto-www.yoctoproject.org (localhost [127.0.0.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3030FE0147E;
	Mon,  7 Jan 2013 14:08:34 -0800 (PST)
X-Original-To: yocto-builds@yoctoproject.org
Delivered-To: yocto-builds@yoctoproject.org
Received: from autobuilder.yoctoproject.org (ab-master.i.yoctoproject.org
	[10.0.10.111])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9B72E01457
	for <yocto-builds@yoctoproject.org>;
	Mon,  7 Jan 2013 13:26:45 -0800 (PST)
Received: from ab-master.i.yoctoproject.org (localhost [127.0.0.1])
	by autobuilder.yoctoproject.org (Postfix) with ESMTP id D96164040C
	for <yocto-builds@yoctoproject.org>;
	Mon,  7 Jan 2013 21:26:45 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 07 Jan 2013 21:26:45 +0000
From: yocto-builds@yoctoproject.org
To: yocto-builds@yoctoproject.org
Message-Id: <20130107212645.D96164040C@autobuilder.yoctoproject.org>
Subject: [Yocto-builds] buildbot failure in Yocto on nightly-x86-64-lsb
X-BeenThere: yocto-builds@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Build failures and discusion about the build system
	<yocto-builds.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/yocto-builds>,
	<mailto:yocto-builds-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/yocto-builds>
List-Post: <mailto:yocto-builds@yoctoproject.org>
List-Help: <mailto:yocto-builds-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/yocto-builds>,
	<mailto:yocto-builds-request@yoctoproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6867230123695654090=="
Sender: yocto-builds-bounces@yoctoproject.org
Errors-To: yocto-builds-bounces@yoctoproject.org

--===============6867230123695654090==
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="utf8"

PGg0PkJ1aWxkIHN0YXR1czogRkFJTFVSRTwvaDQ+CkJ1aWxkc2xhdmUgZm9yIHRoaXMgQnVpbGQ6
IDxiPmFiMDQ8L2I+Cjxicj4KQ29tcGxldGUgbG9ncyBmb3IgYWxsIGJ1aWxkIHN0ZXBzOiA8YSBo
cmVmPSJodHRwOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZzo4MDEwL2J1aWxkZXJzL25p
Z2h0bHkteDg2LTY0LWxzYi9idWlsZHMvMTg1Ij5odHRwOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9q
ZWN0Lm9yZzo4MDEwL2J1aWxkZXJzL25pZ2h0bHkteDg2LTY0LWxzYi9idWlsZHMvMTg1PC9hPgo8
YnI+CkJ1aWxkIFJlYXNvbjogVHJpZ2dlcmFibGUobmlnaHRseS14ODYtNjQtbHNiKQo8YnI+CkJ1
aWxkIFNvdXJjZSBTdGFtcDogPGI+W2JyYW5jaCBtYXN0ZXJdIDM5ZWIyMmJiYzQ3OWZmODRhYWQw
NjlmODgyMWU5YmUwMjZlOGMxYmM8L2I+Cjxicj4KPGk+RGV0YWlsZWQgbG9nIG9mIGxhc3QgYnVp
bGQgc3RlcDo8L2k+IDxhIGhyZWY9Imh0dHA6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
OjgwMTAvYnVpbGRlcnMvbmlnaHRseS14ODYtNjQtbHNiL2J1aWxkcy8xODUvc3RlcHMvc2hlbGxf
MjkvbG9ncy9zdGRpbyI+aHR0cDovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmc6ODAxMC9i
dWlsZGVycy9uaWdodGx5LXg4Ni02NC1sc2IvYnVpbGRzLzE4NS9zdGVwcy9zaGVsbF8yOS9sb2dz
L3N0ZGlvPC9hPgo8YnI+CjxoND5MYXN0IDIwIGxpbmVzIG9mICJzaGVsbF8yOS5zdGRpbyIgRXJy
b3IgbG9nOjwvaDQ+CjxwPgp8IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSBgL3Nydi9ob21l
L3Bva3lidWlsZC95b2N0by1hdXRvYnVpbGRlci95b2N0by1zbGF2ZS9uaWdodGx5LXg4Ni02NC1s
c2IvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LXBva3ktbGludXgvbGlibmwvMV8zLjIuMTYt
cjAvbGlibmwtMy4yLjE2L2luY2x1ZGUnPGJyPnwgbWFrZVsxXTogTm90aGluZyB0byBiZSBkb25l
IGZvciBgYWxsJy48YnI+fCBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Nydi9ob21lL3Bv
a3lidWlsZC95b2N0by1hdXRvYnVpbGRlci95b2N0by1zbGF2ZS9uaWdodGx5LXg4Ni02NC1sc2Iv
YnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LXBva3ktbGludXgvbGlibmwvMV8zLjIuMTYtcjAv
bGlibmwtMy4yLjE2L2luY2x1ZGUnPGJyPnwgTWFraW5nIGFsbCBpbiBsaWI8YnI+fCBtYWtlWzFd
OiBFbnRlcmluZyBkaXJlY3RvcnkgYC9zcnYvaG9tZS9wb2t5YnVpbGQveW9jdG8tYXV0b2J1aWxk
ZXIveW9jdG8tc2xhdmUvbmlnaHRseS14ODYtNjQtbHNiL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4
Nl82NC1wb2t5LWxpbnV4L2xpYm5sLzFfMy4yLjE2LXIwL2xpYm5sLTMuMi4xNi9saWInPGJyPnwg
bGV4IC0taGVhZGVyLWZpbGU9cm91dGUvY2xzL2VtYXRjaF9ncmFtbWFyLmggIC1vIHJvdXRlL2Ns
cy9lbWF0Y2hfZ3JhbW1hci5jIHJvdXRlL2Nscy9lbWF0Y2hfZ3JhbW1hci5sPGJyPnwgYmlzb24g
LXkgLWQgIC1vIHJvdXRlL2Nscy9lbWF0Y2hfc3ludGF4LmMgcm91dGUvY2xzL2VtYXRjaF9zeW50
YXgueTxicj58IGxleCAtLWhlYWRlci1maWxlPXJvdXRlL3BrdGxvY19ncmFtbWFyLmggIC1vIHJv
dXRlL3BrdGxvY19ncmFtbWFyLmMgcm91dGUvcGt0bG9jX2dyYW1tYXIubDxicj58IGJpc29uIC15
IC1kICAtbyByb3V0ZS9wa3Rsb2Nfc3ludGF4LmMgcm91dGUvcGt0bG9jX3N5bnRheC55PGJyPnwg
ZmxleDogQ2FuJ3QgdXNlIC0tcmVlbnRyYW50IG9yIC0tYmlzb24tYnJpZGdlIHdpdGggLWwgb3B0
aW9uPGJyPnwgZmxleDogQ2FuJ3QgdXNlIC0tcmVlbnRyYW50IG9yIC0tYmlzb24tYnJpZGdlIHdp
dGggLWwgb3B0aW9uPGJyPnwgbWFrZVsxXTogKioqIFtyb3V0ZS9wa3Rsb2NfZ3JhbW1hci5jXSBF
cnJvciAxPGJyPnwgbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi48
YnI+fCBtYWtlWzFdOiAqKiogW3JvdXRlL2Nscy9lbWF0Y2hfZ3JhbW1hci5jXSBFcnJvciAxPGJy
PnwgbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC9zcnYvaG9tZS9wb2t5YnVpbGQveW9jdG8t
YXV0b2J1aWxkZXIveW9jdG8tc2xhdmUvbmlnaHRseS14ODYtNjQtbHNiL2J1aWxkL2J1aWxkL3Rt
cC93b3JrL3g4Nl82NC1wb2t5LWxpbnV4L2xpYm5sLzFfMy4yLjE2LXIwL2xpYm5sLTMuMi4xNi9s
aWInPGJyPnwgbWFrZTogKioqIFthbGwtcmVjdXJzaXZlXSBFcnJvciAxPGJyPnwgRVJST1I6IG9l
X3J1bm1ha2UgZmFpbGVkPGJyPnwgRVJST1I6IEZ1bmN0aW9uIGZhaWxlZDogZG9fY29tcGlsZSAo
c2VlIC9zcnYvaG9tZS9wb2t5YnVpbGQveW9jdG8tYXV0b2J1aWxkZXIveW9jdG8tc2xhdmUvbmln
aHRseS14ODYtNjQtbHNiL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1wb2t5LWxpbnV4L2xp
Ym5sLzFfMy4yLjE2LXIwL3RlbXAvbG9nLmRvX2NvbXBpbGUuMzA4MjIgZm9yIGZ1cnRoZXIgaW5m
b3JtYXRpb24pPGJyPkVSUk9SOiBUYXNrIDQzOTYgKC9zcnYvaG9tZS9wb2t5YnVpbGQveW9jdG8t
YXV0b2J1aWxkZXIveW9jdG8tc2xhdmUvbmlnaHRseS14ODYtNjQtbHNiL2J1aWxkL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYm5sL2xpYm5sXzMuMi4xNi5iYiwgZG9fY29tcGlsZSkgZmFpbGVkIHdp
dGggZXhpdCBjb2RlICcxJzxicj5TdW1tYXJ5OiBUaGVyZSB3YXMgMSBFUlJPUiBtZXNzYWdlIHNo
b3duLCByZXR1cm5pbmcgYSBub24temVybyBleGl0IGNvZGUuCjwvcD4KPGJyPjxicj4KPGI+LVRo
ZSBZb2N0byBCdWlsZEJvdDwvYj4KCg==

--===============6867230123695654090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Yocto-builds mailing list
Yocto-builds@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto-builds

--===============6867230123695654090==--

--------------050100080309090901020904--
