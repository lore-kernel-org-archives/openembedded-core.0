Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T16sZ-0002bM-QA
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 04:29:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7E2HDYO028625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2012 19:17:14 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 13 Aug 2012 19:17:12 -0700
Date: Tue, 14 Aug 2012 10:17:12 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120814021712.GB25748@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
MIME-Version: 1.0
In-Reply-To: <20120808033742.GA19078@localhost>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2012 02:29:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Richard,

Ping ...

Hopefully you could recall sufficient context from this thread about
the 'include path for slang.h' cause compile error issue that we are
trying to fix here.

I saw your three commits in oecore like below:

commit b033000
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue Aug 7 22:21:38 2012 +0000

    linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 kernels too
    
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index de716da..b254251 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -24,6 +24,8 @@ KMETA = "meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
+SRC_URI += "file://noslang.patch"
+
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags

commit 6b4ed64
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue Aug 7 22:21:22 2012 +0000

    linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 kernels too
    
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 2adbc46..3022f21 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -24,6 +24,8 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
+SRC_URI += "file://noslang.patch"
+
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags

commit 4fd4b2e
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue Aug 7 12:17:16 2012 +0100

    linux-yocto-3.4: Disable extra slang header search path
    
    Add in a workaround to avoid host infection detection build failures
    from the slang include directory in perf. I'll defer to Bruce to
    fix this properly but we need a workaround now as this is breaking
    builds.
    
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
new file mode 100644
index 0000000..9cada34
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
@@ -0,0 +1,20 @@
+We (OE) install slang into /usr/include so we never need to look into 
+/usr/include/slang/. We never want to look into a hardcoded path like this
+since it triggers host infection issues. For now, simply remove this
+since it causes us problems.
+
+Upstream-Status: Pending (would need rework)
+
+Index: tools/perf/Makefile
+===================================================================
+--- linux.orig/tools/perf/Makefile	2012-08-07 10:29:43.020149620 +0000
++++ linux/tools/perf/Makefile	2012-08-07 10:30:08.128148098 +0000
+@@ -504,7 +504,7 @@
+ 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
+ 	else
+ 		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
+-		BASIC_CFLAGS += -I/usr/include/slang
++		# BASIC_CFLAGS += -I/usr/include/slang
+ 		EXTLIBS += -lnewt -lslang
+ 		LIB_OBJS += $(OUTPUT)util/ui/setup.o
+ 		LIB_OBJS += $(OUTPUT)util/ui/browser.o
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 48333b3..5ab46b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -20,6 +20,8 @@ SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
+SRC_URI += "file://noslang.patch"
+
 LINUX_VERSION ?= "3.4.6"
 
 PR = "${INC_PR}.0"

---

Since you mentioned 'workaround' in commit log, I would like to submit
another solution:

#1. Merge below kernel patch to kernel tree:

From 7708f74d98e7233c7257b055eea0ffb914f4ce2c Mon Sep 17 00:00:00 2001
From: Liang Li <liang.li@windriver.com>
Date: Wed, 1 Aug 2012 14:31:24 +0800
Subject: [PATCH] perf: add SLANG_INC for slang.h

Previously we hard code '-I/usr/include/slang' to CFLAGS to works with
some hosts that has /usr/include/slang/slang.h other than
/usr/include/slang.h like Fedora. This will cause compiling warnings
in some cases.

We'd better to provide user a chance to specify correct location of
slang.h then user could specify SLANG_INC to avoid compile warnings.

Signed-off-by: Liang Li <liang.li@windriver.com>
---
 tools/perf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile b/tools/perf/Makefile
index b7a7a87..067f2df 100644
--- a/tools/perf/Makefile
+++ b/tools/perf/Makefile
@@ -496,8 +496,10 @@ else
 		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
 	else
-		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
-		BASIC_CFLAGS += -I/usr/include/slang
+		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
+		SLANG_INC ?= -I/usr/include/slang
+		BASIC_CFLAGS += $(SLANG_INC)
+
 		EXTLIBS += -lnewt -lslang
 		LIB_OBJS += $(OUTPUT)ui/setup.o
 		LIB_OBJS += $(OUTPUT)ui/browser.o
-- 

#2. Set SLANG_INC to a reasonable directory in perf.bb:

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 9c07fb7..d6900f9 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -63,6 +63,7 @@ EXTRA_OEMAKE = \
 		AR="${AR}" \
 		prefix=/usr \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		SLANG_INC=-I${STAGING_INCDIR} \
 		'
 
 do_compile() {

---

I see benefits in above solution:

- no out of tree kernel patch to tweak kernel source code
- better semantic to indicate what is done

---

May you please give some advice to above solution.

Thanks,
		Liang Li

On 2012-08-08 11:37, Liang Li <liang.li@windriver.com> wrote:
> On 2012-08-07 22:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
> > > Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
> > > provide slang.h rather than hardcoded host dir in perf's Makefile.
> > > 
> > > Pass WERROR=0 to perf's Makefile to avoid warnings being treated
> > > as errors. Warnings are not fatal, and while they will be fixed in the
> > > future, there's no need for them to break the build.
> > 
> > No mention of the additional slang dependency is made here?
> > 
> 
> Forgot mentioned it. Good catch, but the one line change that add
> slang to DEPENDS seems clear enough for everyone, isn't? :)
> 
> > > Signed-off-by: Liang Li <liang.li@windriver.com>
> > > ---
> > >  meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> > > index 505c7b8..537e926 100644
> > > --- a/meta/recipes-kernel/perf/perf_3.4.bb
> > > +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> > > @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
> > >             ${MLPREFIX}binutils \
> > >             ${TUI_DEPENDS} \
> > >             ${SCRIPTING_DEPENDS} \
> > > +           slang \
> > >            "
> > >  
> > >  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> > > @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
> > >  		AR="${AR}" \
> > >  		prefix=/usr \
> > >  		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
> > > +		WERROR=0 \
> > > +		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
> > >  		'
> > 
> > This is is not acceptable since the include directory /usr/include/slang
> > is still being looked at and this just "hides" the error. STAGING_INCDIR
> > is on the compilers default search path anyway.
> 
> EXTRA_CFLAGS is processed early than the '-I/usr/include/slang', so
> its being used here, to specify a path for slang.h. That indeed
> 'hides' -I/usr/include/slang. And I agree that specify
> -I/usr/include/slang blindly in Makefile should be fixed. And I've
> discussed the fix for kernel tree several days before. However, the
> fix for kernel tree will not conflict than this patch, I would think
> that this patch for perf.bb would fix the issue for us for now, and
> smooth the adoption of future fix for the Makefile.
> 
> > 
> > So this patch is wrong in several different ways :(
> > 
> 
> ... I can't reproduce the 'warning -> error' on my host now, but as I
> explained above, this patch is just 'make use of existing mechanism of
> Makefile to specify correct location of slang.h before the warning is
> generated', even though the STAGING_INCDIR is in compilers default
> search path, seems no hurt in case we just make it float top a bit
> to get searched before wrong include directory is discovered, right?
> :)
> 
> > I've merged a temporary fix until we get this resolved properly.
> > 
> 
> I saw that, but the fix that we've discussed several days before seems
> is what we want:
> 
> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
> index b7a7a87..3365ad2 100644
> --- a/tools/perf/Makefile
> +++ b/tools/perf/Makefile
> @@ -496,8 +496,10 @@ else
>  		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
>  		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
>  	else
> -		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> -		BASIC_CFLAGS += -I/usr/include/slang
> +		# Some releases has /usr/include/slang/slang.h other than /usr/include/slang.h
> +		SLANG_INC ?= -I/usr/include/slang
> +		BASIC_CFLAGS += $(SLANG_INC)
> +
>  		EXTLIBS += -lnewt -lslang
>  		LIB_OBJS += $(OUTPUT)ui/setup.o
>  		LIB_OBJS += $(OUTPUT)ui/browser.o
> 
> ---
> 
> Then we still need a patch to perf.bb to specify SLANG_INC. Moreover,
> this patch(EXTRA_CFLAGS for perf.bb) could co-exists with patch for
> kernel. :)
> 
> Thanks,
> 		Liang Li
> 
> > Cheers,
> > 
> > Richard


