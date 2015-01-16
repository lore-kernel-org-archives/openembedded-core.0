Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB6C7226D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 02:49:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0G2nD0o000805
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 15 Jan 2015 18:49:13 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 18:49:13 -0800
Message-ID: <54B87C28.9080702@windriver.com>
Date: Fri, 16 Jan 2015 10:49:12 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
	<b2280f670f4a05a6872ecdf0ea25b14d744c5148.1421225218.git.liezhi.yang@windriver.com>
	<CAJTo0LapunGdo3rZfvcSTw-LRzseh9=eZdsdR2haOmegTJ4vKA@mail.gmail.com>
In-Reply-To: <CAJTo0LapunGdo3rZfvcSTw-LRzseh9=eZdsdR2haOmegTJ4vKA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/27] neard: fix B != S
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
X-List-Received-Date: Fri, 16 Jan 2015 02:49:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/16/2015 01:12 AM, Burton, Ross wrote:
>
> On 14 January 2015 at 08:47, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     And bump PR to avoid:
>     configure: error: source directory already configured; run "make distclean"
>     there first
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> The autobuilder is hitting this:
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/mips32r2-poky-linux/neard/0.14-r1/neard-0.14/src/genbuiltin
> nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
> /bin/sh: src/builtin.h: No such file or directory

Hi Ross,

It's a parallel issue so that I can't reproduce it, I added a patch
in the PULL to fix it:

   git://git.openembedded.org/openembedded-core-contrib rbt/b_src
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/b_src

commit 72dc7eea4b30c5193520361ef9f368cfe6ce0565
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Jan 15 18:24:07 2015 -0800

     neard:  fix parallel issue

     There might be no src dir if the src/builtin.h runs earlier, create it
     to fix the race issue:
     src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
     /bin/sh: src/builtin.h: No such file or directory

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git 
a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch 
b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
new file mode 100644
index 0000000..4660676
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
@@ -0,0 +1,33 @@
+From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Jan 2015 18:12:07 -0800
+Subject: [PATCH] Makefile.am: fix parallel issue
+
+There might be no src dir if src/builtin.h runs earlier, create it to
+fix the race issue:
+
+src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
+/bin/sh: src/builtin.h: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3241311..a43eaa2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -164,6 +164,7 @@ MAINTAINERCLEANFILES = Makefile.in \
+ src/plugin.$(OBJEXT): src/builtin.h
+
+ src/builtin.h: src/genbuiltin $(builtin_sources)
++      $(AM_V_at)$(MKDIR_P) src
+       $(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
+
+ $(src_neard_OBJECTS) \
+--
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb 
b/meta/recipes-connectivity/neard/neard_0.14.bb
index 43fb589..7a1096b 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -4,6 +4,7 @@ SRC_URI = 
"${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
             file://parallel-build.patch \
             file://neard.in \
             file://neard.service.in \
+           file://Makefile.am-fix-parallel-issue.patch \
            "
  SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
  SRC_URI[sha256sum] = 
"6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"

// Robert

>
> Ross

